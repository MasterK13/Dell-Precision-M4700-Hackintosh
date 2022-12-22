/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20220331 (32-bit version)
 * Copyright (c) 2000 - 2022 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-SDXC.aml, Thu Dec 22 18:29:47 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000116 (278)
 *     Revision         0x02
 *     Checksum         0x09
 *     OEM ID           "EXXT"
 *     OEM Table ID     "SSDTSDXC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20220331 (539099953)
 */
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

