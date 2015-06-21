/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140926-64 [Sep 28 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of SSDT-0.aml, Sun Oct 26 18:35:18 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000019D (413)
 *     Revision         0x01
 *     Checksum         0xB5
 *     OEM ID           "Intel"
 *     OEM Table ID     "zpodd"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20091112 (537465106)
 *     GitHub           https://github.com/xutianpei/Asus_N550_ACPI.git
 */
DefinitionBlock ("SSDT-0.aml", "SSDT", 1, "Intel", "zpodd", 0x00001000)
{

    External (_SB_.PCI0.SAT0, DeviceObj)
    External (FDTP, IntObj)
    External (GIV0, FieldUnitObj)
    External (GL00, FieldUnitObj)
    External (GL08, FieldUnitObj)
    External (GPE3, FieldUnitObj)
    External (GPS3, FieldUnitObj)
    External (PFLV, FieldUnitObj)
    External (RTD3, FieldUnitObj)

    If (LEqual (RTD3, Zero))
    {
        Scope (\_SB.PCI0.SAT0)
        {
            Device (PRT2)
            {
                Name (_ADR, 0x0002FFFF)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    Name (T_1, Zero)  // _T_x: Emitted by ASL Compiler
                    Name (T_0, Zero)  // _T_x: Emitted by ASL Compiler
                    If (LEqual (Arg0, ToUUID ("bdfaef30-aebb-11de-8a39-0800200c9a66")))
                    {
                        While (One)
                        {
                            Store (ToInteger (Arg2), T_0) /* \_SB_.PCI0.SAT0.PRT2._DSM.T_0 */
                            If (LEqual (T_0, Zero))
                            {
                                While (One)
                                {
                                    Store (ToInteger (Arg1), T_1) /* \_SB_.PCI0.SAT0.PRT2._DSM.T_1 */
                                    If (LEqual (T_1, One))
                                    {
                                        If (LEqual (PFLV, FDTP))
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x00                                           
                                            })
                                        }

                                        Return (Buffer (One)
                                        {
                                             0x0F                                           
                                        })
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                           
                                        })
                                    }

                                    Break
                                }
                            }
                            Else
                            {
                                If (LEqual (T_0, One))
                                {
                                    Return (One)
                                }
                                Else
                                {
                                    If (LEqual (T_0, 0x02))
                                    {
                                        Store (Zero, GPE3) /* \GPE3 */
                                        If (LEqual (And (\GL00, 0x08), 0x08))
                                        {
                                            Or (\GIV0, 0x08, \GIV0)
                                        }
                                        Else
                                        {
                                            And (\GIV0, 0xF7, \GIV0)
                                        }

                                        Or (\GL08, 0x10, \GL08)
                                        Sleep (0xC8)
                                        Store (One, GPS3) /* \GPS3 */
                                        Store (One, GPE3) /* \GPE3 */
                                        Return (One)
                                    }
                                    Else
                                    {
                                        If (LEqual (T_0, 0x03))
                                        {
                                            Store (Zero, GPE3) /* \GPE3 */
                                            Store (One, GPS3) /* \GPS3 */
                                            And (\GL08, 0xEF, \GL08)
                                            Return (One)
                                        }
                                        Else
                                        {
                                            Return (Zero)
                                        }
                                    }
                                }
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L13, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                If (LEqual (PFLV, FDTP))
                {
                    Return (Zero)
                }

                Store (Zero, GPE3) /* \GPE3 */
                And (\GL08, 0xEF, \GL08)
                Notify (\_SB.PCI0.SAT0, 0x82) // Device-Specific Change
                Return (Zero)
            }
        }
    }
}

