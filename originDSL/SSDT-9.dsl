/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140926-64 [Sep 28 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of SSDT-9.aml, Sun Oct 26 18:35:18 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000019E3 (6627)
 *     Revision         0x01
 *     Checksum         0x4F
 *     OEM ID           "OptRef"
 *     OEM Table ID     "OptTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120711 (538052369)
 */
DefinitionBlock ("SSDT-9.aml", "SSDT", 1, "OptRef", "OptTabl", 0x00001000)
{

    External (_PR_.CPU0, ProcessorObj)
    External (_PR_.CPU0._PPC, IntObj)
    External (_PR_.CPU0._PSS, PkgObj)
    External (_PR_.CPU0._PTC, UnknownObj)
    External (_PR_.CPU0._TSS, IntObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0._DSM, IntObj)
    External (_SB_.PCI0.GFX0.LCDD, UnknownObj)
    External (_SB_.PCI0.LPCB.EC0_.ECNV, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC0_.FBST, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.SPIN, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.GTVR, IntObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.LNKD, FieldUnitObj)
    External (_SB_.PCI0.PEG0.LNKS, FieldUnitObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP.CLP0, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGOF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGON, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGPI, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGST, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.RTLK, FieldUnitObj)
    External (_SB_.PCI0.PEG0.TREN, FieldUnitObj)
    External (DID1, FieldUnitObj)
    External (DID2, FieldUnitObj)
    External (DID3, FieldUnitObj)
    External (DID4, FieldUnitObj)
    External (DID5, FieldUnitObj)
    External (DID6, FieldUnitObj)
    External (DID7, FieldUnitObj)
    External (DID8, FieldUnitObj)
    External (EBAS, FieldUnitObj)
    External (HLRS, FieldUnitObj)
    External (NVGA, FieldUnitObj)
    External (NVHA, FieldUnitObj)
    External (NXD1, FieldUnitObj)
    External (NXD2, FieldUnitObj)
    External (NXD3, FieldUnitObj)
    External (NXD4, FieldUnitObj)
    External (NXD5, FieldUnitObj)
    External (NXD6, FieldUnitObj)
    External (NXD7, FieldUnitObj)
    External (NXD8, FieldUnitObj)
    External (PWEN, FieldUnitObj)
    External (PWOK, FieldUnitObj)
    External (SGFL, FieldUnitObj)
    External (SSMP, FieldUnitObj)

    Scope (\_SB.PCI0)
    {
        Name (OTM, "OTMACPI 2010-Mar-09 12:08:26")
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        OperationRegion (PCI2, SystemMemory, EBAS, 0x0500)
        Field (PCI2, DWordAcc, Lock, Preserve)
        {
            REG0,   32, 
            CMDR,   8, 
            VGAR,   2000, 
            Offset (0x48B), 
                ,   1, 
            NHDA,   1
        }

        Name (VGAB, Buffer (0xFA)
        {
             0x00                                           
        })
        Name (GPRF, Zero)
        OperationRegion (NVHM, SystemMemory, NVHA, 0x00020400)
        Field (NVHM, DWordAcc, NoLock, Preserve)
        {
            NVSG,   128, 
            NVSZ,   32, 
            NVVR,   32, 
            NVHO,   32, 
            RVBS,   32, 
            RBF1,   262144, 
            RBF2,   262144, 
            RBF3,   262144, 
            RBF4,   262144, 
            MXML,   32, 
            MXM3,   1600
        }

        Name (OPCE, 0x02)
        Name (DGPS, Zero)
        Method (PRST, 0, NotSerialized)
        {
            If (LEqual (REG0, Ones))
            {
                Return (Zero)
            }
            Else
            {
                Return (One)
            }
        }

        Method (NATK, 0, NotSerialized)
        {
            Return (One)
        }

        Method (DWBL, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.GFX0.LCDD, 0x87) // Device-Specific
        }

        Method (UPBL, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.GFX0.LCDD, 0x86) // Device-Specific
        }

        Name (_PSC, Zero)  // _PSC: Power State Current
        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
        {
            Store (Zero, NHDA) /* \_SB_.PCI0.PEG0.PEGP.NHDA */
            Store (Zero, _PSC) /* \_SB_.PCI0.PEG0.PEGP._PSC */
            If (LNotEqual (DGPS, Zero))
            {
                _ON ()
                Store (Zero, DGPS) /* \_SB_.PCI0.PEG0.PEGP.DGPS */
            }
        }

        Method (_PS1, 0, NotSerialized)  // _PS1: Power State 1
        {
            Store (One, _PSC) /* \_SB_.PCI0.PEG0.PEGP._PSC */
        }

        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
        {
            If (LEqual (OPCE, 0x03))
            {
                If (LEqual (DGPS, Zero))
                {
                    _OFF ()
                    Store (One, DGPS) /* \_SB_.PCI0.PEG0.PEGP.DGPS */
                }

                Store (0x02, OPCE) /* \_SB_.PCI0.PEG0.PEGP.OPCE */
            }

            Store (0x03, _PSC) /* \_SB_.PCI0.PEG0.PEGP._PSC */
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_ROM, 2, NotSerialized)  // _ROM: Read-Only Memory
        {
            Store (Arg0, Local0)
            Store (Arg1, Local1)
            If (LGreater (Local1, 0x1000))
            {
                Store (0x1000, Local1)
            }

            If (LGreater (Local0, 0x00020000))
            {
                Return (Buffer (Local1)
                {
                     0x00                                           
                })
            }

            Multiply (Local1, 0x08, Local3)
            Name (ROM1, Buffer (0x8000)
            {
                 0x00                                           
            })
            Name (ROM2, Buffer (Local1)
            {
                 0x00                                           
            })
            If (LLess (Local0, 0x8000))
            {
                Store (RBF1, ROM1) /* \_SB_.PCI0.PEG0.PEGP._ROM.ROM1 */
            }
            Else
            {
                If (LLess (Local0, 0x00010000))
                {
                    Subtract (Local0, 0x8000, Local0)
                    Store (RBF2, ROM1) /* \_SB_.PCI0.PEG0.PEGP._ROM.ROM1 */
                }
                Else
                {
                    If (LLess (Local0, 0x00018000))
                    {
                        Subtract (Local0, 0x00010000, Local0)
                        Store (RBF3, ROM1) /* \_SB_.PCI0.PEG0.PEGP._ROM.ROM1 */
                    }
                    Else
                    {
                        If (LLess (Local0, 0x00020000))
                        {
                            Subtract (Local0, 0x00018000, Local0)
                            Store (RBF4, ROM1) /* \_SB_.PCI0.PEG0.PEGP._ROM.ROM1 */
                        }
                    }
                }
            }

            Multiply (Local0, 0x08, Local2)
            CreateField (ROM1, Local2, Local3, TMPB)
            Store (TMPB, ROM2) /* \_SB_.PCI0.PEG0.PEGP._ROM.ROM2 */
            Return (ROM2) /* \_SB_.PCI0.PEG0.PEGP._ROM.ROM2 */
        }

        Method (HDSM, 4, Serialized)
        {
            Return (0x80000001)
        }

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            CreateByteField (Arg0, 0x03, GUID)
            Return (\_SB.PCI0.GFX0.HDSM (Arg0, Arg1, Arg2, Arg3))
        }

        Name (CTXT, Zero)
        Method (_ON, 0, Serialized)  // _ON_: Power On
        {
            \_SB.PCI0.LPCB.EC0.SPIN (0x96, Zero)
            SGON ()
            If (LNotEqual (GPRF, One))
            {
                Store (CMDR, Local0)
                Store (Zero, CMDR) /* \_SB_.PCI0.PEG0.PEGP.CMDR */
                Store (VGAB, VGAR) /* \_SB_.PCI0.PEG0.PEGP.VGAR */
                Store (0x06, CMDR) /* \_SB_.PCI0.PEG0.PEGP.CMDR */
                Store (Zero, NHDA) /* \_SB_.PCI0.PEG0.PEGP.NHDA */
                Store (Local0, CMDR) /* \_SB_.PCI0.PEG0.PEGP.CMDR */
            }

            Store (0xB7, SSMP) /* External reference */
        }

        Method (_OFF, 0, Serialized)  // _OFF: Power Off
        {
            If (LEqual (CTXT, Zero))
            {
                \_SB.PCI0.LPCB.EC0.SPIN (0x96, Zero)
                If (LNotEqual (GPRF, One))
                {
                    Store (VGAR, VGAB) /* \_SB_.PCI0.PEG0.PEGP.VGAB */
                }

                Store (One, CTXT) /* \_SB_.PCI0.PEG0.PEGP.CTXT */
            }

            SGOF ()
        }
    }

    Scope (\_SB.PCI0.GFX0)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (DID1, Index (TLPK, Zero))
            Store (DID2, Index (TLPK, 0x02))
            Store (DID3, Index (TLPK, 0x04))
            Store (DID4, Index (TLPK, 0x06))
            Store (DID5, Index (TLPK, 0x08))
            Store (DID6, Index (TLPK, 0x0A))
            Store (DID7, Index (TLPK, 0x0C))
            Store (DID2, Index (TLPK, 0x0E))
            Store (DID1, Index (TLPK, 0x0F))
            Store (DID2, Index (TLPK, 0x11))
            Store (DID3, Index (TLPK, 0x12))
            Store (DID2, Index (TLPK, 0x14))
            Store (DID4, Index (TLPK, 0x15))
            Store (DID2, Index (TLPK, 0x17))
            Store (DID5, Index (TLPK, 0x18))
            Store (DID2, Index (TLPK, 0x1A))
            Store (DID6, Index (TLPK, 0x1B))
            Store (DID2, Index (TLPK, 0x1D))
            Store (DID7, Index (TLPK, 0x1E))
        }

        OperationRegion (NVIG, SystemMemory, NVGA, 0x45)
        Field (NVIG, DWordAcc, NoLock, Preserve)
        {
            NISG,   128, 
            NISZ,   32, 
            NIVR,   32, 
            GPSS,   32, 
            GACD,   16, 
            GATD,   16, 
            LDES,   8, 
            DKST,   8, 
            DACE,   8, 
            DHPE,   8, 
            DHPS,   8, 
            SGNC,   8, 
            GPPO,   8, 
            USPM,   8, 
            GPSP,   8, 
            TLSN,   8, 
            FDOS,   8, 
            ELCL,   16
        }

        Name (TLPK, Package (0x20)
        {
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C, 
            Ones, 
            Ones, 
            0x2C
        })
        Method (INDL, 0, Serialized)
        {
            Store (Zero, NXD1) /* External reference */
            Store (Zero, NXD2) /* External reference */
            Store (Zero, NXD3) /* External reference */
            Store (Zero, NXD4) /* External reference */
            Store (Zero, NXD5) /* External reference */
            Store (Zero, NXD6) /* External reference */
            Store (Zero, NXD7) /* External reference */
            Store (Zero, NXD8) /* External reference */
        }

        Method (SND1, 1, Serialized)
        {
            If (LEqual (Arg0, DID1))
            {
                Store (One, NXD1) /* External reference */
            }

            If (LEqual (Arg0, DID2))
            {
                Store (One, NXD2) /* External reference */
            }

            If (LEqual (Arg0, DID3))
            {
                Store (One, NXD3) /* External reference */
            }

            If (LEqual (Arg0, DID4))
            {
                Store (One, NXD4) /* External reference */
            }

            If (LEqual (Arg0, DID5))
            {
                Store (One, NXD5) /* External reference */
            }

            If (LEqual (Arg0, DID6))
            {
                Store (One, NXD6) /* External reference */
            }

            If (LEqual (Arg0, DID7))
            {
                Store (One, NXD7) /* External reference */
            }

            If (LEqual (Arg0, DID8))
            {
                Store (One, NXD8) /* External reference */
            }
        }

        Method (SNXD, 1, Serialized)
        {
            INDL ()
            Store (One, Local0)
            Store (Zero, Local1)
            While (LLess (Local0, Arg0))
            {
                If (LEqual (DerefOf (Index (TLPK, Local1)), 0x2C))
                {
                    Increment (Local0)
                }

                Increment (Local1)
            }

            SND1 (DerefOf (Index (TLPK, Local1)))
            Increment (Local1)
            If (LNotEqual (DerefOf (Index (TLPK, Local1)), 0x2C))
            {
                SND1 (DerefOf (Index (TLPK, Local1)))
            }
        }

        Method (CTOI, 1, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            While (One)
            {
                Store (ToInteger (Arg0), _T_0) /* \_SB_.PCI0.GFX0.CTOI._T_0 */
                If (LEqual (_T_0, One))
                {
                    Return (One)
                }
                Else
                {
                    If (LEqual (_T_0, 0x02))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x04))
                        {
                            Return (0x03)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x08))
                            {
                                Return (0x04)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x10))
                                {
                                    Return (0x05)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x20))
                                    {
                                        Return (0x06)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x40))
                                        {
                                            Return (0x07)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x03))
                                            {
                                                Return (0x08)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x06))
                                                {
                                                    Return (0x09)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x0A))
                                                    {
                                                        Return (0x0A)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x12))
                                                        {
                                                            Return (0x0B)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x22))
                                                            {
                                                                Return (0x0C)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_0, 0x42))
                                                                {
                                                                    Return (0x0D)
                                                                }
                                                                Else
                                                                {
                                                                    Return (One)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Break
            }
        }

        Method (HDSM, 4, Serialized)
        {
            If (LEqual (Arg0, ToUUID ("a3132d01-8cda-49ba-a52e-bc9d46df6b81")))
            {
                Return (\_SB.PCI0.PEG0.PEGP.GPS (Arg0, Arg1, Arg2, Arg3))
            }

            If (LEqual (Arg0, ToUUID ("cbeca351-067b-4924-9cbd-b46b00b86f34")))
            {
                Return (\_SB.PCI0.PEG0.PEGP.NGC6 (Arg0, Arg1, Arg2, Arg3))
            }

            Name (SGCI, Zero)
            Name (NBCI, Zero)
            Name (OPCI, Zero)
            Name (BUFF, Zero)
            If (LEqual (Arg0, ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0")))
            {
                Store (One, OPCI) /* \_SB_.PCI0.GFX0.HDSM.OPCI */
            }

            If (LOr (OPCI, LOr (SGCI, NBCI)))
            {
                If (OPCI)
                {
                    If (LNotEqual (Arg1, 0x0100))
                    {
                        Return (0x80000002)
                    }
                }
                Else
                {
                    If (LNotEqual (Arg1, 0x0102))
                    {
                        Return (0x80000002)
                    }
                }

                If (LEqual (Arg2, Zero))
                {
                    If (SGCI)
                    {
                        Return (Buffer (0x04)
                        {
                             0x7F, 0x00, 0x04, 0x00                         
                        })
                    }
                    Else
                    {
                        If (NBCI)
                        {
                            Return (Buffer (0x04)
                            {
                                 0x73, 0x00, 0x04, 0x00                         
                            })
                        }
                        Else
                        {
                            If (OPCI)
                            {
                                Return (Buffer (0x04)
                                {
                                     0x01, 0x00, 0x03, 0x04                         
                                })
                            }
                        }
                    }
                }

                If (LEqual (Arg2, One))
                {
                    Name (TEMP, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                    CreateDWordField (TEMP, Zero, STS0)
                    If (SGCI)
                    {
                        Or (STS0, 0x0B0000BF, STS0) /* \_SB_.PCI0.GFX0.HDSM.STS0 */
                        Or (STS0, ShiftLeft (SGNC, 0x08, SGNC) /* \_SB_.PCI0.GFX0.SGNC */, STS0) /* \_SB_.PCI0.GFX0.HDSM.STS0 */
                    }
                    Else
                    {
                        Or (STS0, Zero, STS0) /* \_SB_.PCI0.GFX0.HDSM.STS0 */
                    }

                    Return (TEMP) /* \_SB_.PCI0.GFX0.HDSM.TEMP */
                }

                If (LEqual (Arg2, 0x02))
                {
                    Name (TMP1, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                    CreateDWordField (TMP1, Zero, STS1)
                    ToInteger (Arg3, Local0)
                    And (Local0, 0x1F, Local0)
                    If (And (Local0, 0x10))
                    {
                        And (Local0, 0x0F, Local0)
                        Store (Local0, GPSS) /* \_SB_.PCI0.GFX0.GPSS */
                        Notify (\_SB.PCI0.GFX0, 0xD9) // Hardware-Specific
                        Notify (\_SB.PCI0.WMI1, 0xD9) // Hardware-Specific
                    }
                    Else
                    {
                        And (Local0, 0x0F, Local0)
                        If (LEqual (GPPO, One))
                        {
                            Store (GPSS, Local0)
                            Or (Local0, 0x10, Local0)
                            Store (Zero, GPPO) /* \_SB_.PCI0.GFX0.GPPO */
                        }
                    }

                    Or (STS1, Local0, STS1) /* \_SB_.PCI0.GFX0.HDSM.STS1 */
                    Return (TMP1) /* \_SB_.PCI0.GFX0.HDSM.TMP1 */
                }

                If (LEqual (Arg2, 0x03))
                {
                    Name (TMP2, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                    CreateDWordField (TMP2, Zero, STS2)
                    ToInteger (Arg3, Local0)
                    And (Local0, 0x03, Local0)
                    If (LEqual (Local0, Zero))
                    {
                        \_SB.PCI0.PEG0.PEGP.SGST ()
                    }

                    If (LEqual (Local0, One))
                    {
                        \_SB.PCI0.PEG0.PEGP.SGON ()
                    }

                    If (LEqual (Local0, 0x02))
                    {
                        \_SB.PCI0.PEG0.PEGP.SGOF ()
                    }

                    If (LEqual (\_SB.PCI0.PEG0.PEGP.SGST (), 0x0F))
                    {
                        Or (STS2, One, STS2) /* \_SB_.PCI0.GFX0.HDSM.STS2 */
                    }

                    Return (TMP2) /* \_SB_.PCI0.GFX0.HDSM.TMP2 */
                }

                If (LEqual (Arg2, 0x04))
                {
                    Name (TMP3, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                    CreateDWordField (TMP3, Zero, STS3)
                    ToInteger (Arg3, Local0)
                    Store (Local0, Local1)
                    ShiftRight (Local0, 0x10, Local0)
                    And (Local0, One, USPM) /* \_SB_.PCI0.GFX0.USPM */
                    ShiftRight (Local1, 0x0D, Local1)
                    And (Local1, 0x03, Local1)
                    If (LNotEqual (Local1, GPSP))
                    {
                        If (LEqual (USPM, One))
                        {
                            Store (Local1, GPSP) /* \_SB_.PCI0.GFX0.GPSP */
                        }
                        Else
                        {
                            Store (GPSP, Local1)
                            Or (STS3, 0x8000, STS3) /* \_SB_.PCI0.GFX0.HDSM.STS3 */
                        }
                    }

                    Or (STS3, ShiftLeft (Local1, 0x0D), STS3) /* \_SB_.PCI0.GFX0.HDSM.STS3 */
                    Return (TMP3) /* \_SB_.PCI0.GFX0.HDSM.TMP3 */
                }

                If (LEqual (Arg2, 0x05))
                {
                    Name (TMP4, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                         
                    })
                    CreateDWordField (TMP4, Zero, STS4)
                    ToInteger (Arg3, Local0)
                    If (And (Local0, 0x80000000))
                    {
                        Store (And (ShiftRight (Local0, 0x19), 0x1F), TLSN) /* \_SB_.PCI0.GFX0.TLSN */
                        If (And (Local0, 0x40000000))
                        {
                            Store (One, FDOS) /* \_SB_.PCI0.GFX0.FDOS */
                        }
                    }

                    If (And (Local0, 0x01000000))
                    {
                        Store (And (ShiftRight (Local0, 0x0C), 0x0FFF), GACD) /* \_SB_.PCI0.GFX0.GACD */
                        Store (And (Local0, 0x0FFF), GATD) /* \_SB_.PCI0.GFX0.GATD */
                        Store (CTOI (GACD), TLSN) /* \_SB_.PCI0.GFX0.TLSN */
                        Increment (TLSN)
                        If (LGreater (TLSN, 0x0D))
                        {
                            Store (One, TLSN) /* \_SB_.PCI0.GFX0.TLSN */
                        }

                        SNXD (TLSN)
                    }

                    Or (STS4, ShiftLeft (DHPE, 0x15), STS4) /* \_SB_.PCI0.GFX0.HDSM.STS4 */
                    Or (STS4, ShiftLeft (DHPS, 0x14), STS4) /* \_SB_.PCI0.GFX0.HDSM.STS4 */
                    Or (STS4, ShiftLeft (TLSN, 0x08), STS4) /* \_SB_.PCI0.GFX0.HDSM.STS4 */
                    Or (STS4, ShiftLeft (DKST, 0x05), STS4) /* \_SB_.PCI0.GFX0.HDSM.STS4 */
                    Or (STS4, ShiftLeft (LDES, 0x04), STS4) /* \_SB_.PCI0.GFX0.HDSM.STS4 */
                    Or (STS4, DACE, STS4) /* \_SB_.PCI0.GFX0.HDSM.STS4 */
                    Store (Zero, LDES) /* \_SB_.PCI0.GFX0.LDES */
                    Store (Zero, DHPS) /* \_SB_.PCI0.GFX0.DHPS */
                    Store (Zero, DHPE) /* \_SB_.PCI0.GFX0.DHPE */
                    Store (Zero, DACE) /* \_SB_.PCI0.GFX0.DACE */
                    Return (TMP4) /* \_SB_.PCI0.GFX0.HDSM.TMP4 */
                }

                If (LEqual (Arg2, 0x06))
                {
                    Return (TLPK) /* \_SB_.PCI0.GFX0.TLPK */
                }

                If (LEqual (Arg2, 0x10))
                {
                    CreateWordField (Arg3, 0x02, USRG)
                    Name (OPVK, Buffer (0xE6)
                    {
                        /* 0000 */  0xE4, 0x42, 0x5F, 0x14, 0x36, 0x26, 0x16, 0x37,
                        /* 0008 */  0x4B, 0x56, 0xE6, 0x00, 0x00, 0x00, 0x01, 0x00,
                        /* 0010 */  0x31, 0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35,
                        /* 0018 */  0x36, 0x39, 0x38, 0x35, 0x47, 0x65, 0x6E, 0x75,
                        /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,
                        /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,
                        /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x4F, 0x70, 0x74,
                        /* 0038 */  0x69, 0x6D, 0x75, 0x73, 0x20, 0x52, 0x65, 0x61,
                        /* 0040 */  0x64, 0x79, 0x20, 0x4D, 0x6F, 0x74, 0x68, 0x65,
                        /* 0048 */  0x72, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x20, 0x66,
                        /* 0050 */  0x6F, 0x72, 0x20, 0x37, 0x33, 0x36, 0x30, 0x31,
                        /* 0058 */  0x39, 0x5F, 0x4D, 0x49, 0x52, 0x63, 0x20, 0x20,
                        /* 0060 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
                        /* 0068 */  0x2D, 0x20, 0x3C, 0x34, 0x27, 0x21, 0x58, 0x29,
                        /* 0070 */  0x57, 0x27, 0x58, 0x20, 0x27, 0x25, 0x59, 0x5D,
                        /* 0078 */  0x31, 0x29, 0x3A, 0x2A, 0x26, 0x39, 0x59, 0x43,
                        /* 0080 */  0x56, 0x3B, 0x58, 0x56, 0x58, 0x3D, 0x59, 0x4E,
                        /* 0088 */  0x3B, 0x3A, 0x35, 0x44, 0x25, 0x42, 0x5A, 0x48,
                        /* 0090 */  0x55, 0x3A, 0x58, 0x4C, 0x25, 0x48, 0x54, 0x21,
                        /* 0098 */  0x35, 0x4B, 0x4D, 0x37, 0x2C, 0x3C, 0x20, 0x2D,
                        /* 00A0 */  0x20, 0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67,
                        /* 00A8 */  0x68, 0x74, 0x20, 0x32, 0x30, 0x31, 0x30, 0x20,
                        /* 00B0 */  0x4E, 0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43,
                        /* 00B8 */  0x6F, 0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69,
                        /* 00C0 */  0x6F, 0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52,
                        /* 00C8 */  0x69, 0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65,
                        /* 00D0 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x31,
                        /* 00D8 */  0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35, 0x36,
                        /* 00E0 */  0x39, 0x38, 0x35, 0x28, 0x52, 0x29             
                    })
                    If (LEqual (USRG, 0x564B))
                    {
                        Return (OPVK) /* \_SB_.PCI0.GFX0.HDSM.OPVK */
                    }

                    Return (Zero)
                }

                If (LEqual (Arg2, 0x11))
                {
                    Return (Zero)
                }

                If (LEqual (Arg2, 0x12))
                {
                    Return (Package (0x0A)
                    {
                        0xD0, 
                        ToUUID ("921a2f40-0dc4-402d-ac18-b48444ef9ed2"), 
                        0xD9, 
                        ToUUID ("c12ad361-9fa9-4c74-901f-95cb0945cf3e"), 
                        0xDB, 
                        ToUUID ("42848006-8886-490e-8c72-2bdca93a8a09"), 
                        0xEF, 
                        ToUUID ("b3e485d2-3cc1-4b54-8f31-77ba2fdc9ebe"), 
                        0xF0, 
                        ToUUID ("360d6fb6-1d4e-4fa6-b848-1be33dd8ec7b")
                    })
                }

                If (LEqual (Arg2, 0x1A))
                {
                    CreateField (Arg3, 0x18, 0x02, OMPR)
                    CreateField (Arg3, Zero, One, FLCH)
                    CreateField (Arg3, One, One, DVSR)
                    CreateField (Arg3, 0x02, One, DVSC)
                    If (ToInteger (FLCH))
                    {
                        Store (OMPR, \_SB.PCI0.PEG0.PEGP.OPCE)
                    }

                    Store (Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                         
                        }, Local0)
                    CreateField (Local0, Zero, One, OPEN)
                    CreateField (Local0, 0x03, 0x02, CGCS)
                    CreateField (Local0, 0x06, One, SHPC)
                    CreateField (Local0, 0x08, One, SNSR)
                    CreateField (Local0, 0x18, 0x03, DGPC)
                    CreateField (Local0, 0x1B, 0x02, HDAC)
                    Store (One, OPEN) /* \_SB_.PCI0.GFX0.HDSM.OPEN */
                    Store (One, SHPC) /* \_SB_.PCI0.GFX0.HDSM.SHPC */
                    Store (One, HDAC) /* \_SB_.PCI0.GFX0.HDSM.HDAC */
                    Store (One, DGPC) /* \_SB_.PCI0.GFX0.HDSM.DGPC */
                    If (ToInteger (DVSC))
                    {
                        If (ToInteger (DVSR))
                        {
                            Store (One, \_SB.PCI0.PEG0.PEGP.GPRF)
                        }
                        Else
                        {
                            Store (Zero, \_SB.PCI0.PEG0.PEGP.GPRF)
                        }
                    }

                    Store (\_SB.PCI0.PEG0.PEGP.GPRF, SNSR) /* \_SB_.PCI0.GFX0.HDSM.SNSR */
                    If (LNotEqual (\_SB.PCI0.PEG0.PEGP.SGST (), Zero))
                    {
                        Store (0x03, CGCS) /* \_SB_.PCI0.GFX0.HDSM.CGCS */
                    }

                    Return (Local0)
                }

                If (LEqual (Arg2, 0x1B))
                {
                    ToInteger (Arg3, Local0)
                    If (And (Local0, 0x02))
                    {
                        Store (Zero, BUFF) /* \_SB_.PCI0.GFX0.HDSM.BUFF */
                        If (And (Local0, One))
                        {
                            Store (One, BUFF) /* \_SB_.PCI0.GFX0.HDSM.BUFF */
                        }
                    }

                    And (SGFL, 0xFFFFFFFD, SGFL) /* External reference */
                    Or (SGFL, ShiftLeft (BUFF, One), SGFL) /* External reference */
                    Store (0xB6, SSMP) /* External reference */
                    Return (Local0)
                }

                Return (0x80000002)
            }

            Return (0x80000001)
        }
    }

    Scope (\_SB.PCI0)
    {
        Name (GPS, "GPSACPI 2012-Aug-12 14:56:05")
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        Name (PSAP, Zero)
        Name (ECBF, Buffer (0x14) {})
        CreateDWordField (ECBF, Zero, EDS1)
        CreateDWordField (ECBF, 0x04, EDS2)
        CreateDWordField (ECBF, 0x08, EDS3)
        CreateDWordField (ECBF, 0x0C, EDS4)
        CreateDWordField (ECBF, 0x10, EPDT)
        Name (GPSP, Buffer (0x24) {})
        CreateDWordField (GPSP, Zero, RETN)
        CreateDWordField (GPSP, 0x04, VRV1)
        CreateDWordField (GPSP, 0x08, TGPU)
        CreateDWordField (GPSP, 0x0C, PDTS)
        CreateDWordField (GPSP, 0x10, SFAN)
        CreateDWordField (GPSP, 0x14, SKNT)
        CreateDWordField (GPSP, 0x18, CPUE)
        CreateDWordField (GPSP, 0x1C, TMP1)
        CreateDWordField (GPSP, 0x20, TMP2)
        Name (NLIM, Zero)
        Name (PSCP, Zero)
        Method (GPS, 4, Serialized)
        {
            Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Store ("------- GPS DSM --------", Debug)
            If (LNotEqual (Arg1, 0x0100))
            {
                Return (0x80000002)
            }

            While (One)
            {
                Store (ToInteger (Arg2), _T_0) /* \_SB_.PCI0.PEG0.PEGP.GPS_._T_0 */
                If (LEqual (_T_0, Zero))
                {
                    Name (FMSK, Buffer (0x08)
                    {
                         0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF 
                    })
                    Store (Buffer (0x08)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
                        }, Local0)
                    Divide (Zero, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x13, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x20, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x21, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x22, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x23, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x2A, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Store (SizeOf (Local0), Local1)
                    While (LNotEqual (Local1, Zero))
                    {
                        Decrement (Local1)
                        Store (DerefOf (Index (FMSK, Local1)), Local2)
                        And (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                            ))
                    }

                    Return (Local0)
                }
                Else
                {
                    If (LEqual (_T_0, 0x13))
                    {
                        Store ("GPS fun 19", Debug)
                        Return (Arg3)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x20))
                        {
                            Store ("GPS fun 20", Debug)
                            Name (RET1, Zero)
                            CreateBitField (Arg3, 0x18, NRIT)
                            CreateBitField (Arg3, 0x19, NRIS)
                            If (NRIS)
                            {
                                If (NRIT)
                                {
                                    Or (RET1, 0x01000000, RET1) /* \_SB_.PCI0.PEG0.PEGP.GPS_.RET1 */
                                }
                                Else
                                {
                                    Store (One, \_PR.CPU0._PPC) /* External reference */
                                    And (RET1, 0xFEFFFFFF, RET1) /* \_SB_.PCI0.PEG0.PEGP.GPS_.RET1 */
                                }
                            }

                            Or (RET1, 0x40000000, RET1) /* \_SB_.PCI0.PEG0.PEGP.GPS_.RET1 */
                            If (NLIM)
                            {
                                Or (RET1, One, RET1) /* \_SB_.PCI0.PEG0.PEGP.GPS_.RET1 */
                            }

                            Return (RET1) /* \_SB_.PCI0.PEG0.PEGP.GPS_.RET1 */
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x21))
                            {
                                Return (\_PR.CPU0._PSS) /* External reference */
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x22))
                                {
                                    CreateByteField (Arg3, Zero, PCAP)
                                    Store (PCAP, \_PR.CPU0._PPC) /* External reference */
                                    Notify (\_PR.CPU0, 0x80) // Status Change
                                    Store (PCAP, PSAP) /* \_SB_.PCI0.PEG0.PEGP.PSAP */
                                    Return (PCAP) /* \_SB_.PCI0.PEG0.PEGP.GPS_.PCAP */
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x23))
                                    {
                                        Return (PSAP) /* \_SB_.PCI0.PEG0.PEGP.PSAP */
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x25))
                                        {
                                            Store ("GPS fun 25", Debug)
                                            Return (\_PR.CPU0._TSS) /* External reference */
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x26))
                                            {
                                                Store ("GPS fun 26", Debug)
                                                CreateDWordField (Arg3, Zero, TCAP)
                                                Store (TCAP, \_PR.CPU0._PTC) /* External reference */
                                                Notify (\_PR.CPU0, 0x80) // Status Change
                                                Return (TCAP) /* \_SB_.PCI0.PEG0.PEGP.GPS_.TCAP */
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x2A))
                                                {
                                                    Store ("GPS fun 2a", Debug)
                                                    CreateByteField (Arg3, Zero, PSH0)
                                                    CreateByteField (Arg3, One, PSH1)
                                                    CreateBitField (Arg3, 0x08, GPUT)
                                                    CreateBitField (Arg3, 0x09, CPUT)
                                                    CreateBitField (Arg3, 0x0A, FANS)
                                                    CreateBitField (Arg3, 0x0B, SKIN)
                                                    CreateBitField (Arg3, 0x0C, ENGR)
                                                    CreateBitField (Arg3, 0x0D, SEN1)
                                                    CreateBitField (Arg3, 0x0E, SEN2)
                                                    While (One)
                                                    {
                                                        Store (PSH0, _T_1) /* \_SB_.PCI0.PEG0.PEGP.GPS_._T_1 */
                                                        If (LEqual (_T_1, Zero))
                                                        {
                                                            If (CPUT)
                                                            {
                                                                Store (0x0200, RETN) /* \_SB_.PCI0.PEG0.PEGP.RETN */
                                                                Or (RETN, PSH0, RETN) /* \_SB_.PCI0.PEG0.PEGP.RETN */
                                                                Store (\_SB.PCI0.LPCB.H_EC.GTVR, PDTS) /* \_SB_.PCI0.PEG0.PEGP.PDTS */
                                                            }

                                                            Return (GPSP) /* \_SB_.PCI0.PEG0.PEGP.GPSP */
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_1, One))
                                                            {
                                                                Store (0x0300, RETN) /* \_SB_.PCI0.PEG0.PEGP.RETN */
                                                                Or (RETN, PSH0, RETN) /* \_SB_.PCI0.PEG0.PEGP.RETN */
                                                                Store (0x03E8, PDTS) /* \_SB_.PCI0.PEG0.PEGP.PDTS */
                                                                Return (GPSP) /* \_SB_.PCI0.PEG0.PEGP.GPSP */
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_1, 0x02))
                                                                {
                                                                    Store (0x0102, RETN) /* \_SB_.PCI0.PEG0.PEGP.RETN */
                                                                    Store (Zero, VRV1) /* \_SB_.PCI0.PEG0.PEGP.VRV1 */
                                                                    Store (0x50, TGPU) /* \_SB_.PCI0.PEG0.PEGP.TGPU */
                                                                    Store (Zero, PDTS) /* \_SB_.PCI0.PEG0.PEGP.PDTS */
                                                                    Store (Zero, SFAN) /* \_SB_.PCI0.PEG0.PEGP.SFAN */
                                                                    Store (Zero, CPUE) /* \_SB_.PCI0.PEG0.PEGP.CPUE */
                                                                    Store (Zero, SKNT) /* \_SB_.PCI0.PEG0.PEGP.SKNT */
                                                                    Store (Zero, TMP1) /* \_SB_.PCI0.PEG0.PEGP.TMP1 */
                                                                    Store (Zero, TMP2) /* \_SB_.PCI0.PEG0.PEGP.TMP2 */
                                                                    Return (GPSP) /* \_SB_.PCI0.PEG0.PEGP.GPSP */
                                                                }
                                                            }
                                                        }

                                                        Break
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Break
            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        Name (TGPC, Buffer (0x04)
        {
             0x00                                           
        })
        Method (GC6I, 0, Serialized)
        {
            Store ("<<< GC6I >>>", Debug)
            CreateField (TGPC, 0x06, 0x02, ECOC)
            CreateField (TGPC, 0x0A, 0x02, PRGE)
            If (LOr (LEqual (ToInteger (PRGE), 0x03), LEqual (ToInteger (PRGE
                ), One)))
            {
                Store (One, \_SB.PCI0.PEG0.LNKD) /* External reference */
            }

            While (LNotEqual (\_SB.PCI0.PEG0.LNKS, Zero))
            {
                Sleep (One)
            }

            \_SB.PCI0.LPCB.EC0.ECNV (Zero)
        }

        Method (GC6O, 0, Serialized)
        {
            Store ("<<< GC6O >>>", Debug)
            CreateField (TGPC, 0x06, 0x02, ECOC)
            CreateField (TGPC, 0x08, 0x02, PRGX)
            If (LEqual (ToInteger (PRGX), Zero))
            {
                Store (Zero, \_SB.PCI0.PEG0.LNKD) /* External reference */
                Store (One, \_SB.PCI0.PEG0.TREN) /* External reference */
            }

            \_SB.PCI0.PEG0.PEGP.SGPO (HLRS, One)
            \_SB.PCI0.PEG0.PEGP.SGPO (PWEN, One)
            While (LNotEqual (\_SB.PCI0.PEG0.PEGP.SGPI (PWOK), One))
            {
                Store (Zero, Local0)
                While (LLess (Local0, 0x1E))
                {
                    Add (Local0, One, Local0)
                    Stall (0x32)
                }
            }

            Store (Zero, Local0)
            While (LLess (Local0, 0x1E))
            {
                Add (Local0, One, Local0)
                Stall (0x32)
            }

            \_SB.PCI0.PEG0.PEGP.SGPO (HLRS, Zero)
            \_SB.PCI0.PEG0.PEGP.CLP0 ()
            If (LEqual (ToInteger (PRGX), 0x03))
            {
                Store (Zero, \_SB.PCI0.PEG0.LNKD) /* External reference */
            }

            While (LLess (\_SB.PCI0.PEG0.LNKS, 0x07))
            {
                Store (0x20, Local0)
                While (Local0)
                {
                    If (LLess (\_SB.PCI0.PEG0.LNKS, 0x07))
                    {
                        Stall (0x64)
                        Decrement (Local0)
                    }
                    Else
                    {
                        Break
                    }
                }

                If (LEqual (Local0, Zero))
                {
                    Store (One, \_SB.PCI0.PEG0.RTLK) /* External reference */
                    Stall (0x64)
                }
            }

            \_SB.PCI0.LPCB.EC0.ECNV (One)
        }

        Method (GETS, 0, Serialized)
        {
            Sleep (0x02)
            If (LEqual (\_SB.PCI0.PEG0.PEGP.SGPI (PWEN), One))
            {
                Store ("<<< GETS() return 0x1 >>>", Debug)
                Return (One)
            }
            Else
            {
                If (LEqual (\_SB.PCI0.LPCB.EC0.FBST, One))
                {
                    Store ("<<< GETS() return 0x3 >>>", Debug)
                    Return (0x03)
                }
                Else
                {
                    Store ("<<< GETS() return 0x2 >>>", Debug)
                    Return (0x02)
                }
            }
        }

        Method (NGC6, 4, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Store ("------- GC6 DSM --------", Debug)
            If (LLess (Arg1, 0x0100))
            {
                Return (0x80000001)
            }

            While (One)
            {
                Store (ToInteger (Arg2), _T_0) /* \_SB_.PCI0.PEG0.PEGP.NGC6._T_0 */
                If (LEqual (_T_0, Zero))
                {
                    Return (Buffer (0x04)
                    {
                         0x1B, 0x00, 0x00, 0x00                         
                    })
                }
                Else
                {
                    If (LEqual (_T_0, One))
                    {
                        Name (JTB1, Buffer (0x04)
                        {
                             0x00                                           
                        })
                        CreateField (JTB1, Zero, One, JTEN)
                        CreateField (JTB1, One, 0x02, SREN)
                        CreateField (JTB1, 0x03, 0x03, PLPR)
                        CreateField (JTB1, 0x06, 0x02, FBPR)
                        CreateField (JTB1, 0x08, 0x02, GUPR)
                        CreateField (JTB1, 0x0A, One, GC6R)
                        CreateField (JTB1, 0x0B, One, PTRH)
                        CreateField (JTB1, 0x14, 0x0C, JTRV)
                        Store (One, JTEN) /* \_SB_.PCI0.PEG0.PEGP.NGC6.JTEN */
                        Store (One, GC6R) /* \_SB_.PCI0.PEG0.PEGP.NGC6.GC6R */
                        Store (One, PTRH) /* \_SB_.PCI0.PEG0.PEGP.NGC6.PTRH */
                        Store (One, SREN) /* \_SB_.PCI0.PEG0.PEGP.NGC6.SREN */
                        Store (0x0103, JTRV) /* \_SB_.PCI0.PEG0.PEGP.NGC6.JTRV */
                        Return (JTB1) /* \_SB_.PCI0.PEG0.PEGP.NGC6.JTB1 */
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Store ("GPS fun 19", Debug)
                            Return (Arg3)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                CreateField (Arg3, Zero, 0x03, GUPC)
                                CreateField (Arg3, 0x04, One, PLPC)
                                Name (JTB3, Buffer (0x04)
                                {
                                     0x00                                           
                                })
                                CreateField (JTB3, Zero, 0x03, GUPS)
                                CreateField (JTB3, 0x03, One, GPGS)
                                CreateField (JTB3, 0x07, One, PLST)
                                If (LEqual (ToInteger (GUPC), One))
                                {
                                    Store (Arg3, TGPC) /* \_SB_.PCI0.PEG0.PEGP.TGPC */
                                    GC6I ()
                                    Store (One, PLST) /* \_SB_.PCI0.PEG0.PEGP.NGC6.PLST */
                                }
                                Else
                                {
                                    If (LEqual (ToInteger (GUPC), 0x02))
                                    {
                                        Store (Arg3, TGPC) /* \_SB_.PCI0.PEG0.PEGP.TGPC */
                                        GC6I ()
                                        If (LEqual (ToInteger (PLPC), Zero))
                                        {
                                            Store (Zero, PLST) /* \_SB_.PCI0.PEG0.PEGP.NGC6.PLST */
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (ToInteger (GUPC), 0x03))
                                        {
                                            Store (Arg3, TGPC) /* \_SB_.PCI0.PEG0.PEGP.TGPC */
                                            GC6O ()
                                            If (LNotEqual (ToInteger (PLPC), Zero))
                                            {
                                                Store (Zero, PLST) /* \_SB_.PCI0.PEG0.PEGP.NGC6.PLST */
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (ToInteger (GUPC), 0x04))
                                            {
                                                Store (Arg3, TGPC) /* \_SB_.PCI0.PEG0.PEGP.TGPC */
                                                GC6O ()
                                                If (LNotEqual (ToInteger (PLPC), Zero))
                                                {
                                                    Store (Zero, PLST) /* \_SB_.PCI0.PEG0.PEGP.NGC6.PLST */
                                                }
                                            }
                                            Else
                                            {
                                                If (LEqual (ToInteger (GUPC), Zero))
                                                {
                                                    Store (GETS (), GUPS) /* \_SB_.PCI0.PEG0.PEGP.NGC6.GUPS */
                                                    If (LEqual (ToInteger (GUPS), One))
                                                    {
                                                        Store (One, GPGS) /* \_SB_.PCI0.PEG0.PEGP.NGC6.GPGS */
                                                    }
                                                    Else
                                                    {
                                                        Store (Zero, GPGS) /* \_SB_.PCI0.PEG0.PEGP.NGC6.GPGS */
                                                    }
                                                }
                                                Else
                                                {
                                                    If (LEqual (ToInteger (GUPC), 0x06)) {}
                                                }
                                            }
                                        }
                                    }
                                }

                                Return (JTB3) /* \_SB_.PCI0.PEG0.PEGP.NGC6.JTB3 */
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x04))
                                {
                                    Return (0x80000002)
                                }
                            }
                        }
                    }
                }

                Break
            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0.PEG0)
    {
        Method (_STA, 0, Serialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }

    Scope (\_SB.PCI0)
    {
        Device (WMI1)
        {
            Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, "OPT1")  // _UID: Unique ID
            Name (_WDG, Buffer (0x14)
            {
                /* 0000 */  0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E,
                /* 0008 */  0xB5, 0x77, 0x93, 0x1E, 0xA3, 0x2A, 0x2C, 0xC0,
                /* 0010 */  0x4D, 0x58, 0x01, 0x02                         
            })
            Method (WMMX, 3, NotSerialized)
            {
                CreateDWordField (Arg2, Zero, FUNC)
                If (LEqual (FUNC, 0x534F525F))
                {
                    If (LGreaterEqual (SizeOf (Arg2), 0x08))
                    {
                        CreateDWordField (Arg2, 0x04, ARGS)
                        CreateDWordField (Arg2, 0x08, XARG)
                        Return (\_SB.PCI0.PEG0.PEGP._ROM (ARGS, XARG))
                    }
                }

                If (LEqual (FUNC, 0x4D53445F))
                {
                    If (LGreaterEqual (SizeOf (Arg2), 0x1C))
                    {
                        CreateField (Arg2, Zero, 0x80, MUID)
                        CreateDWordField (Arg2, 0x10, REVI)
                        CreateDWordField (Arg2, 0x14, SFNC)
                        CreateField (Arg2, 0xE0, 0x20, XRG0)
                        If (CondRefOf (\_SB.PCI0.GFX0._DSM))
                        {
                            Return (\_SB.PCI0.GFX0._DSM) /* External reference */
                            MUID
                            REVI
                            SFNC
                            XRG0
                        }
                    }
                }

                Return (Zero)
            }
        }
    }
}

