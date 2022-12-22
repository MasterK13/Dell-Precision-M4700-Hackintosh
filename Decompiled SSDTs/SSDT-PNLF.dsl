/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20220331 (32-bit version)
 * Copyright (c) 2000 - 2022 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-PNLF.aml, Thu Dec 22 18:29:47 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000086 (134)
 *     Revision         0x02
 *     Checksum         0x52
 *     OEM ID           "CORP"
 *     OEM Table ID     "PNLF"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20221020 (539103264)
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "PNLF", 0x00000000)
{
    External (_SB_.PCI0.GFX0, DeviceObj)

    If (_OSI ("Darwin"))
    {
        Device (\_SB.PCI0.GFX0.PNLF)
        {
            Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
            Name (_CID, "backlight")  // _CID: Compatible ID
            Name (_UID, 0x0E)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
        }
    }
}

