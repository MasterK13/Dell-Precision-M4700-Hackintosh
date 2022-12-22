# Fixing the SD Card Reader on the Dell Precision M4700

For the SD Card Reader to work, it needs to be spoofed to Broadcom's SD Card Reader that Apple uses, since Apple's driver is compatible with most PCIe SD Card Readers.

To inject properties for devices on macOS Big Sur or later, all devices in ACPI need to be properly defined, to do this, we will use an SSDT: 

```
DefinitionBlock ("", "SSDT", 2, "EXXT", "SSDTSDXC", 0x0)
{
    External (\_SB.PCI0.RP08, DeviceObj)

    Scope (\_SB.PCI0.RP08)
    {
        Device (SDXC)
        {
            Name (_ADR, One)  // _ADR: Address
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x09, 
                0x04
            })

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}
```

This SSDT will add an **SDXC** device under **\_SB.PCI0.RP08** in ACPI, set the proper Power Resources for Wake, and ONLY enable the SDXC device on macOS in the _STA method: 0x0F means fully enabled, and Zero means fully disabled.

Now that we can inject properties into the device, we will inject the **compatible** property along with a few others:

```
DefinitionBlock ("", "SSDT", 2, "EXXT", "SSDTSDXC", 0x00000000)
{
    External (_SB_.PCI0.RP08, DeviceObj)

    Scope (\_SB.PCI0.RP08)
    {
        Device (SDXC)
        {
            Name (_ADR, One)  // _ADR: Address
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x09, 
                0x04
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "AAPL,slot-name", 
                    Buffer (0x09)
                    {
                        "Built-in"
                    }, 

                    "device_type", 
                    Buffer (0x11)
                    {
                        "Media Controller"
                    }, 

                    "model", 
                    Buffer (0x18)
                    {
                        "O2 Micro SD Card Reader"
                    }, 

                    "compatible", 
                    Buffer (0x0D)
                    {
                        "pci14e4,16bc"
                    }
                })
            }
        }
    }
}
```

This SSDT uses the _DSM method to inject properties into the SDXC device we just created. The first 3 are for macOS to know what device it is and for it to show up in **About this Mac -> System Report -> PCI**, and the **compatible** property will let macOS know that it's an SD Card Reader with Vendor ID: 14E4 (Broadcom) and Device ID: 16BC, which is the SD Card Reader used by Apple themselves. The kext driver will attach to our device and enable full SD Card functionality.

The final version of the SSDT can be found here: [Decompiled](https://github.com/MasterK13/Dell-Precision-M4700-Hackintosh/blob/main/Decompiled%20SSDTs/SSDT-SDXC.dsl) and [Compiled](https://github.com/MasterK13/Dell-Precision-M4700-Hackintosh/blob/main/EFI/OC/ACPI/SSDT-SDXC.aml). To use it, just copy the compiled version into your ACPI folder.

This is enough for macOS versions up to Big Sur, but for Monterey and above we need an extra fix, which is [BigSurSDXC](https://github.com/MasterK13/Dell-Precision-M4700-Hackintosh/tree/main/EFI/OC/Kexts/BigSurSDXC.kext/Contents) from the OpenCore Legacy Patcher repository. This is because the **AppleSDXC** internal kext in macOS Monterey requires **AppleVTD** to fully load, which Ivy Bridge lacks. For more info, see [this OCLP issue](https://github.com/dortania/OpenCore-Legacy-Patcher/issues/978).
