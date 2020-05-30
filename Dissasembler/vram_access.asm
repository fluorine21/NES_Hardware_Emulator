;-------------------------------------------------------------------------------
; vram_access.nes disasembled by DISASM6 v1.5
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 1              ; 1 x 16k PRG banks
            .db 0              ; 0 x 8k CHR banks
            .db %00000000      ; Mirroring: Horizontal
                               ; SRAM: Not used
                               ; 512k Trainer: Not used
                               ; 4 Screen VRAM: Not used
                               ; Mapper: 0
            .db %00000000      ; RomType: NES
            .hex 00 00 00 00   ; iNES Tail 
            .hex 00 00 00 00    

;-------------------------------------------------------------------------------
; Program Origin
;-------------------------------------------------------------------------------
            .org $c000         ; Set program counter

;-------------------------------------------------------------------------------
; ROM Start
;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $c000: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c003: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c006: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c009: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c00c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c00f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c012: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c015: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c018: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c01b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c01e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c021: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c024: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c027: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c02a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c02d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c030: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c033: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c036: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c039: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c03c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c03f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c042: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c045: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c048: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c04b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c04e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c051: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c054: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c057: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c05a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c05d: ff ff ff  Invalid Opcode - ISC $ffff,x
__c060:     .hex ff ff ff      ; $c060: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c063: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c066: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c069: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c06c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c06f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c072: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c075: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c078: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c07b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c07e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c081: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c084: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c087: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c08a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c08d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c090: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c093: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c096: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c099: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c09c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c09f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0bd: ff ff ff  Invalid Opcode - ISC $ffff,x
__c0c0:     .hex ff ff ff      ; $c0c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c0ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c102: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c105: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c108: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c10b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c10e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c111: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c114: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c117: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c11a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c11d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c120: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c123: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c126: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c129: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c12c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c12f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c132: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c135: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c138: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c13b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c13e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c141: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c144: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c147: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c14a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c14d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c150: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c153: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c156: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c159: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c15c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c15f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c162: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c165: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c168: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c16b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c16e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c171: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c174: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c177: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c17a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c17d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c180: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c183: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c186: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c189: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c18c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c18f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c192: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c195: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c198: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c19b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c19e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c1fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c201: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c204: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c207: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c20a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c20d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c210: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c213: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c216: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c219: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c21c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c21f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c222: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c225: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c228: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c22b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c22e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c231: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c234: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c237: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c23a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c23d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c240: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c243: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c246: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c249: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c24c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c24f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c252: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c255: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c258: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c25b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c25e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c261: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c264: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c267: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c26a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c26d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c270: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c273: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c276: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c279: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c27c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c27f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c282: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c285: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c288: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c28b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c28e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c291: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c294: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c297: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c29a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c29d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c2fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c300: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c303: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c306: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c309: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c30c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c30f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c312: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c315: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c318: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c31b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c31e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c321: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c324: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c327: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c32a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c32d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c330: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c333: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c336: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c339: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c33c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c33f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c342: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c345: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c348: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c34b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c34e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c351: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c354: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c357: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c35a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c35d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c360: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c363: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c366: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c369: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c36c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c36f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c372: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c375: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c378: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c37b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c37e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c381: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c384: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c387: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c38a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c38d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c390: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c393: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c396: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c399: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c39c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c39f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c3ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c402: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c405: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c408: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c40b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c40e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c411: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c414: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c417: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c41a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c41d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c420: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c423: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c426: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c429: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c42c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c42f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c432: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c435: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c438: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c43b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c43e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c441: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c444: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c447: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c44a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c44d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c450: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c453: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c456: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c459: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c45c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c45f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c462: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c465: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c468: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c46b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c46e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c471: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c474: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c477: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c47a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c47d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c480: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c483: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c486: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c489: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c48c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c48f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c492: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c495: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c498: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c49b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c49e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c4fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c501: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c504: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c507: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c50a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c50d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c510: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c513: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c516: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c519: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c51c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c51f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c522: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c525: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c528: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c52b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c52e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c531: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c534: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c537: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c53a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c53d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c540: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c543: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c546: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c549: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c54c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c54f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c552: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c555: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c558: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c55b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c55e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c561: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c564: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c567: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c56a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c56d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c570: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c573: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c576: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c579: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c57c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c57f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c582: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c585: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c588: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c58b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c58e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c591: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c594: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c597: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c59a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c59d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c5fd: ff ff ff  Invalid Opcode - ISC $ffff,x
__c600:     .hex ff ff ff      ; $c600: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c603: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c606: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c609: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c60c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c60f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c612: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c615: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c618: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c61b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c61e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c621: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c624: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c627: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c62a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c62d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c630: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c633: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c636: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c639: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c63c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c63f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c642: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c645: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c648: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c64b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c64e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c651: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c654: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c657: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c65a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c65d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c660: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c663: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c666: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c669: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c66c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c66f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c672: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c675: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c678: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c67b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c67e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c681: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c684: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c687: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c68a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c68d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c690: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c693: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c696: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c699: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c69c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c69f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6c3: ff ff ff  Invalid Opcode - ISC $ffff,x
__c6c6:     .hex ff ff ff      ; $c6c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff         ; $c6cc: ff ff     Suspected data
__c6ce:     .hex ff ff ff      ; $c6ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff         ; $c6ec: ff ff     Suspected data
__c6ee:     .hex ff ff ff      ; $c6ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c6fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c700: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c703: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c706: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c709: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c70c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c70f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c712: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c715: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c718: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c71b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c71e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c721: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c724: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c727: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c72a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c72d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c730: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c733: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c736: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c739: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c73c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c73f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c742: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c745: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c748: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c74b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c74e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c751: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c754: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c757: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c75a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c75d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c760: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c763: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c766: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c769: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c76c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c76f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c772: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c775: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c778: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c77b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c77e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c781: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c784: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c787: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c78a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c78d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c790: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c793: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c796: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c799: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c79c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c79f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c7ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c802: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c805: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c808: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c80b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c80e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c811: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c814: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c817: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c81a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c81d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c820: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c823: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c826: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c829: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c82c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c82f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c832: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c835: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c838: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c83b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c83e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c841: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c844: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c847: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c84a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c84d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c850: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c853: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c856: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c859: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c85c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c85f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c862: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c865: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c868: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c86b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c86e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c871: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c874: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c877: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c87a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c87d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c880: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c883: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c886: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c889: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c88c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c88f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c892: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c895: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c898: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c89b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c89e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c8fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c901: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c904: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c907: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c90a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c90d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c910: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c913: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c916: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c919: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c91c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c91f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c922: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c925: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c928: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c92b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c92e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c931: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c934: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c937: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c93a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c93d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c940: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c943: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c946: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c949: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c94c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c94f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c952: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c955: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c958: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c95b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c95e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c961: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c964: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c967: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c96a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c96d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c970: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c973: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c976: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c979: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c97c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c97f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c982: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c985: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c988: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c98b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c98e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c991: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c994: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c997: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c99a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c99d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $c9fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca00: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca03: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca06: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca09: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca0c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca0f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca12: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca15: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca18: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca1b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca1e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca21: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca24: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca27: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca2a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca2d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca30: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca33: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca36: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca39: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca3c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca3f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca42: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca45: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca48: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca4b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca4e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca51: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca54: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca57: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca5a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca5d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca60: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca63: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca66: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca69: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca6c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca6f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca72: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca75: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca78: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca7b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca7e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca81: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca84: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca87: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca8a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca8d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca90: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca93: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca96: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca99: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca9c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ca9f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caa2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caa5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caa8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cab1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cab4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cab7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cabd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cac0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cac3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cac6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cac9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cacc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cacf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cad2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cad5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cad8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cadb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cade: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cae1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cae4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cae7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caf0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caf3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caf6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caf9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cafc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $caff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb02: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb05: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb08: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb0b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb0e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb11: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb14: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb17: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb1a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb1d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb20: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb23: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb26: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb29: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb2c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb2f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb32: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb35: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb38: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb3b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb3e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb41: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb44: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb47: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb4a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb4d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb50: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb53: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb56: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb59: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb5c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb5f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb62: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb65: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb68: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb6b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb6e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb71: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb74: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb77: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb7a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb7d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb80: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb83: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb86: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb89: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb8c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb8f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb92: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb95: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb98: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb9b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cb9e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cba1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cba4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cba7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbaa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbb0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbb3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbb6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbb9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbbc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbbf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbc2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbc5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbc8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbcb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbd1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbd4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbd7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbda: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbdd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbe0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbe3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbe6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbe9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbf2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbf5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbf8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbfb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cbfe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc01: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc04: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc07: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc0a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc0d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc10: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc13: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc16: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc19: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc1c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc1f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc22: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc25: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc28: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc2b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc2e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc31: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc34: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc37: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc3a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc3d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc40: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc43: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc46: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc49: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc4c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc4f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc52: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc55: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc58: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc5b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc5e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc61: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc64: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc67: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc6a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc6d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc70: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc73: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc76: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc79: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc7c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc7f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc82: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc85: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc88: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc8b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc8e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc91: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc94: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc97: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc9a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cc9d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cca0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cca3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cca6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cca9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccaf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccb2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccb5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccb8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccbb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccbe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccc1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccc4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccc7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cccd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccd0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccd3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccd6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccd9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccdc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccdf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cce2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cce5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cce8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cceb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccf1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccf4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccf7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccfa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ccfd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd00: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd03: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd06: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd09: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd0c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd0f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd12: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd15: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd18: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd1b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd1e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd21: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd24: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd27: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd2a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd2d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd30: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd33: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd36: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd39: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd3c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd3f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd42: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd45: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd48: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd4b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd4e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd51: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd54: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd57: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd5a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd5d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd60: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd63: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd66: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd69: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd6c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd6f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd72: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd75: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd78: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd7b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd7e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd81: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd84: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd87: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd8a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd8d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd90: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd93: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd96: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd99: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd9c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cd9f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cda2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cda5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cda8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdb1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdb4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdb7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdbd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdc0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdc3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdc6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdc9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdcc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdcf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdd2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdd5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdd8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cddb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdde: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cde1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cde4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cde7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cded: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdf0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdf3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdf6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdf9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdfc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cdff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce02: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce05: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce08: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce0b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce0e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce11: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce14: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce17: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce1a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce1d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce20: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce23: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce26: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce29: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce2c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce2f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce32: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce35: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce38: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce3b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce3e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce41: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce44: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce47: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce4a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce4d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce50: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce53: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce56: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce59: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce5c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce5f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce62: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce65: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce68: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce6b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce6e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce71: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce74: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce77: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce7a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce7d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce80: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce83: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce86: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce89: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce8c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce8f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce92: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce95: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce98: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce9b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ce9e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cea1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cea4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cea7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ceaa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cead: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ceb0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ceb3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ceb6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ceb9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cebc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cebf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cec2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cec5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cec8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cecb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cece: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ced1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ced4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ced7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ceda: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cedd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cee0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cee3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cee6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cee9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ceec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ceef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cef2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cef5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cef8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cefb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cefe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf01: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf04: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf07: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf0a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf0d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf10: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf13: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf16: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf19: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf1c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf1f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf22: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf25: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf28: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf2b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf2e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf31: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf34: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf37: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf3a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf3d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf40: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf43: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf46: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf49: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf4c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf4f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf52: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf55: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf58: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf5b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf5e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf61: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf64: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf67: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf6a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf6d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf70: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf73: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf76: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf79: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf7c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf7f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf82: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf85: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf88: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf8b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf8e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf91: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf94: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf97: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf9a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cf9d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfa0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfa3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfa6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfa9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfaf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfb2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfb5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfb8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfbb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfbe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfc1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfc4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfc7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfcd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfd0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfd3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfd6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfd9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfdc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfdf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfe2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfe5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfe8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfeb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cfee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cff1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cff4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cff7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cffa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $cffd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d000: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d003: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d006: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d009: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d00c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d00f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d012: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d015: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d018: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d01b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d01e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d021: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d024: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d027: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d02a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d02d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d030: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d033: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d036: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d039: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d03c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d03f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d042: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d045: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d048: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d04b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d04e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d051: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d054: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d057: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d05a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d05d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d060: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d063: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d066: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d069: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d06c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d06f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d072: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d075: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d078: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d07b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d07e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d081: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d084: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d087: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d08a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d08d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d090: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d093: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d096: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d099: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d09c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d09f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d0ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d102: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d105: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d108: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d10b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d10e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d111: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d114: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d117: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d11a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d11d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d120: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d123: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d126: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d129: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d12c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d12f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d132: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d135: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d138: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d13b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d13e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d141: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d144: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d147: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d14a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d14d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d150: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d153: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d156: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d159: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d15c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d15f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d162: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d165: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d168: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d16b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d16e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d171: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d174: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d177: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d17a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d17d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d180: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d183: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d186: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d189: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d18c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d18f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d192: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d195: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d198: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d19b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d19e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d1fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d201: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d204: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d207: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d20a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d20d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d210: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d213: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d216: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d219: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d21c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d21f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d222: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d225: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d228: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d22b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d22e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d231: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d234: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d237: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d23a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d23d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d240: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d243: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d246: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d249: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d24c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d24f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d252: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d255: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d258: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d25b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d25e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d261: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d264: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d267: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d26a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d26d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d270: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d273: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d276: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d279: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d27c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d27f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d282: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d285: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d288: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d28b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d28e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d291: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d294: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d297: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d29a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d29d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d2fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d300: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d303: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d306: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d309: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d30c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d30f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d312: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d315: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d318: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d31b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d31e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d321: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d324: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d327: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d32a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d32d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d330: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d333: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d336: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d339: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d33c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d33f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d342: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d345: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d348: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d34b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d34e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d351: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d354: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d357: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d35a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d35d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d360: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d363: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d366: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d369: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d36c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d36f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d372: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d375: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d378: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d37b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d37e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d381: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d384: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d387: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d38a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d38d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d390: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d393: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d396: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d399: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d39c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d39f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d3ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d402: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d405: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d408: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d40b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d40e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d411: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d414: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d417: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d41a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d41d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d420: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d423: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d426: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d429: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d42c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d42f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d432: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d435: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d438: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d43b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d43e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d441: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d444: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d447: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d44a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d44d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d450: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d453: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d456: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d459: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d45c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d45f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d462: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d465: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d468: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d46b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d46e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d471: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d474: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d477: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d47a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d47d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d480: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d483: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d486: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d489: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d48c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d48f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d492: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d495: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d498: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d49b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d49e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d4fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d501: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d504: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d507: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d50a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d50d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d510: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d513: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d516: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d519: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d51c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d51f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d522: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d525: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d528: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d52b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d52e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d531: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d534: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d537: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d53a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d53d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d540: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d543: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d546: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d549: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d54c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d54f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d552: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d555: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d558: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d55b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d55e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d561: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d564: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d567: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d56a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d56d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d570: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d573: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d576: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d579: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d57c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d57f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d582: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d585: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d588: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d58b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d58e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d591: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d594: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d597: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d59a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d59d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d5fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d600: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d603: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d606: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d609: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d60c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d60f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d612: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d615: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d618: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d61b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d61e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d621: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d624: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d627: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d62a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d62d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d630: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d633: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d636: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d639: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d63c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d63f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d642: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d645: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d648: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d64b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d64e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d651: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d654: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d657: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d65a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d65d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d660: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d663: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d666: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d669: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d66c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d66f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d672: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d675: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d678: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d67b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d67e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d681: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d684: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d687: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d68a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d68d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d690: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d693: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d696: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d699: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d69c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d69f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d6ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d702: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d705: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d708: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d70b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d70e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d711: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d714: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d717: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d71a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d71d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d720: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d723: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d726: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d729: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d72c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d72f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d732: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d735: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d738: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d73b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d73e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d741: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d744: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d747: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d74a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d74d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d750: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d753: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d756: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d759: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d75c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d75f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d762: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d765: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d768: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d76b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d76e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d771: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d774: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d777: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d77a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d77d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d780: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d783: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d786: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d789: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d78c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d78f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d792: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d795: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d798: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d79b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d79e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d7fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d801: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d804: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d807: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d80a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d80d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d810: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d813: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d816: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d819: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d81c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d81f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d822: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d825: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d828: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d82b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d82e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d831: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d834: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d837: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d83a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d83d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d840: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d843: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d846: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d849: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d84c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d84f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d852: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d855: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d858: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d85b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d85e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d861: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d864: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d867: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d86a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d86d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d870: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d873: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d876: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d879: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d87c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d87f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d882: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d885: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d888: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d88b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d88e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d891: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d894: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d897: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d89a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d89d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d8fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d900: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d903: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d906: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d909: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d90c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d90f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d912: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d915: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d918: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d91b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d91e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d921: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d924: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d927: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d92a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d92d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d930: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d933: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d936: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d939: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d93c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d93f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d942: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d945: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d948: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d94b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d94e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d951: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d954: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d957: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d95a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d95d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d960: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d963: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d966: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d969: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d96c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d96f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d972: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d975: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d978: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d97b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d97e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d981: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d984: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d987: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d98a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d98d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d990: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d993: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d996: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d999: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d99c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d99f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $d9ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da02: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da05: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da08: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da0b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da0e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da11: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da14: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da17: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da1a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da1d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da20: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da23: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da26: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da29: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da2c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da2f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da32: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da35: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da38: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da3b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da3e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da41: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da44: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da47: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da4a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da4d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da50: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da53: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da56: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da59: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da5c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da5f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da62: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da65: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da68: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da6b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da6e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da71: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da74: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da77: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da7a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da7d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da80: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da83: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da86: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da89: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da8c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da8f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da92: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da95: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da98: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da9b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $da9e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $daa1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $daa4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $daa7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $daaa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $daad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dab0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dab3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dab6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dab9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dabc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dabf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dac2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dac5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dac8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dacb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dace: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dad1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dad4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dad7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dada: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dadd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dae0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dae3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dae6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dae9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $daec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $daef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $daf2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $daf5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $daf8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dafb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dafe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db01: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db04: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db07: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db0a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db0d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db10: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db13: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db16: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db19: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db1c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db1f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db22: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db25: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db28: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db2b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db2e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db31: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db34: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db37: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db3a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db3d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db40: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db43: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db46: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db49: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db4c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db4f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db52: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db55: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db58: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db5b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db5e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db61: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db64: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db67: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db6a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db6d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db70: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db73: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db76: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db79: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db7c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db7f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db82: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db85: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db88: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db8b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db8e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db91: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db94: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db97: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db9a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $db9d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dba0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dba3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dba6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dba9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbaf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbb2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbb5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbb8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbbb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbbe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbc1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbc4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbc7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbcd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbd0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbd3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbd6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbd9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbdc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbdf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbe2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbe5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbe8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbeb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbf1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbf4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbf7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbfa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dbfd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc00: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc03: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc06: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc09: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc0c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc0f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc12: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc15: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc18: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc1b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc1e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc21: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc24: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc27: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc2a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc2d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc30: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc33: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc36: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc39: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc3c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc3f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc42: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc45: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc48: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc4b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc4e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc51: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc54: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc57: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc5a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc5d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc60: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc63: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc66: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc69: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc6c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc6f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc72: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc75: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc78: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc7b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc7e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc81: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc84: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc87: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc8a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc8d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc90: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc93: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc96: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc99: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc9c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dc9f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dca2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dca5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dca8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcb1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcb4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcb7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcbd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcc0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcc3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcc6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcc9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dccc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dccf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcd2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcd5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcd8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcdb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcde: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dce1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dce4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dce7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dced: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcf0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcf3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff         ; $dcf6: ff ff     Suspected data
__dcf8:     .hex ff ff ff      ; $dcf8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcfb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dcfe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd01: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd04: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd07: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd0a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd0d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd10: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd13: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd16: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd19: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd1c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd1f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd22: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd25: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd28: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd2b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd2e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd31: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd34: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd37: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd3a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd3d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd40: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd43: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd46: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd49: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd4c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd4f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd52: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd55: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd58: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd5b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd5e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd61: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd64: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd67: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd6a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd6d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd70: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd73: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd76: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd79: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd7c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd7f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd82: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd85: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd88: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd8b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd8e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd91: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd94: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd97: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd9a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dd9d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dda0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dda3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dda6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dda9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddaf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddb2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddb5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddb8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddbb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddbe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddc1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddc4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddc7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddcd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddd0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddd3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddd6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddd9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dddc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dddf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dde2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dde5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dde8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddeb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddf1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddf4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddf7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddfa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ddfd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de00: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de03: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de06: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de09: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de0c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de0f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de12: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de15: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de18: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de1b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de1e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de21: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de24: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de27: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de2a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de2d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de30: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de33: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de36: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de39: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de3c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de3f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de42: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de45: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de48: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de4b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de4e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de51: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de54: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de57: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de5a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de5d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de60: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de63: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de66: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de69: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de6c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de6f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de72: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de75: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de78: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de7b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de7e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de81: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de84: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de87: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de8a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de8d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de90: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de93: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de96: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de99: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de9c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $de9f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dea2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dea5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dea8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $deab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $deae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $deb1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $deb4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $deb7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $deba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $debd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dec0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dec3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dec6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dec9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $decc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $decf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ded2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ded5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ded8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dedb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dede: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dee1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dee4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dee7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $deea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $deed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $def0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $def3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $def6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $def9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $defc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $deff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df02: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df05: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df08: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df0b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df0e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df11: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df14: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df17: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df1a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df1d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df20: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df23: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df26: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df29: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df2c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df2f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df32: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df35: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df38: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df3b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df3e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df41: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df44: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df47: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df4a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df4d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df50: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df53: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df56: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df59: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df5c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df5f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df62: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df65: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df68: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df6b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df6e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df71: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df74: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df77: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df7a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df7d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df80: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df83: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df86: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df89: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df8c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df8f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df92: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df95: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df98: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df9b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $df9e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfa1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfa4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfa7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfaa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfb0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfb3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfb6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfb9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfbc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfbf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfc2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfc5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfc8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfcb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfd1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfd4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfd7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfda: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfdd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfe0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfe3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfe6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfe9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dfef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dff2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dff5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dff8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $dffb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff         ; $dffe: ff ff     Suspected data
__e000:     lda #$00           ; $e000: a9 00     
            sta $2000          ; $e002: 8d 00 20  
            jsr __e484         ; $e005: 20 84 e4  
            jsr __e00e         ; $e008: 20 0e e0  
            jmp __e487         ; $e00b: 4c 87 e4  

;-------------------------------------------------------------------------------
__e00e:     lda #$00           ; $e00e: a9 00     
            sta $2000          ; $e010: 8d 00 20  
            sei                ; $e013: 78        
            lda #$01           ; $e014: a9 01     
            sta $4016          ; $e016: 8d 16 40  
            lda #$0a           ; $e019: a9 0a     
            jsr __e169         ; $e01b: 20 69 e1  
            lda $f0            ; $e01e: a5 f0     
            jsr __e44a         ; $e020: 20 4a e4  
            jmp __e41b         ; $e023: 4c 1b e4  

;-------------------------------------------------------------------------------
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        bit $4015          ; $e026: 2c 15 40  
; nmi vector
;-------------------------------------------------------------------------------
nmi:        rti                ; $e029: 40        

;-------------------------------------------------------------------------------
__e02a:     bne __e030         ; $e02a: d0 04     
            rts                ; $e02c: 60        

;-------------------------------------------------------------------------------
__e02d:     beq __e030         ; $e02d: f0 01     
            rts                ; $e02f: 60        

;-------------------------------------------------------------------------------
__e030:     jmp __e000         ; $e030: 4c 00 e0  

;-------------------------------------------------------------------------------
__e033:     pha                ; $e033: 48        
            lda #$2f           ; $e034: a9 2f     
            sta $2006          ; $e036: 8d 06 20  
            pla                ; $e039: 68        
            sta $2006          ; $e03a: 8d 06 20  
            rts                ; $e03d: 60        

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      lda #$32           ; $e03e: a9 32     
            jsr __e169         ; $e040: 20 69 e1  
            jsr __e412         ; $e043: 20 12 e4  
            lda #$00           ; $e046: a9 00     
            sta $2000          ; $e048: 8d 00 20  
            sta $2001          ; $e04b: 8d 01 20  
            lda #$02           ; $e04e: a9 02     
            sta $f0            ; $e050: 85 f0     
            lda #$00           ; $e052: a9 00     
            jsr __e033         ; $e054: 20 33 e0  
            lda #$12           ; $e057: a9 12     
            sta $2007          ; $e059: 8d 07 20  
            lda #$34           ; $e05c: a9 34     
            sta $2007          ; $e05e: 8d 07 20  
            lda #$00           ; $e061: a9 00     
            jsr __e033         ; $e063: 20 33 e0  
            lda $2007          ; $e066: ad 07 20  
            lda $2007          ; $e069: ad 07 20  
            cmp #$34           ; $e06c: c9 34     
            jsr __e02d         ; $e06e: 20 2d e0  
            lda #$03           ; $e071: a9 03     
            sta $f0            ; $e073: 85 f0     
            lda #$00           ; $e075: a9 00     
            jsr __e033         ; $e077: 20 33 e0  
            lda #$56           ; $e07a: a9 56     
            sta $2007          ; $e07c: 8d 07 20  
            lda #$00           ; $e07f: a9 00     
            jsr __e033         ; $e081: 20 33 e0  
            lda $2007          ; $e084: ad 07 20  
            lda $2007          ; $e087: ad 07 20  
            cmp #$56           ; $e08a: c9 56     
            jsr __e02a         ; $e08c: 20 2a e0  
            lda #$04           ; $e08f: a9 04     
            sta $f0            ; $e091: 85 f0     
            lda #$00           ; $e093: a9 00     
            jsr __e033         ; $e095: 20 33 e0  
            lda #$78           ; $e098: a9 78     
            sta $2007          ; $e09a: 8d 07 20  
            lda #$00           ; $e09d: a9 00     
            jsr __e033         ; $e09f: 20 33 e0  
            lda #$00           ; $e0a2: a9 00     
            lda $2007          ; $e0a4: ad 07 20  
            lda #$12           ; $e0a7: a9 12     
            sta $2007          ; $e0a9: 8d 07 20  
            lda $2007          ; $e0ac: ad 07 20  
            cmp #$78           ; $e0af: c9 78     
            jsr __e02a         ; $e0b1: 20 2a e0  
            lda #$05           ; $e0b4: a9 05     
            sta $f0            ; $e0b6: 85 f0     
            lda #$00           ; $e0b8: a9 00     
            jsr __e033         ; $e0ba: 20 33 e0  
            lda #$9a           ; $e0bd: a9 9a     
            sta $2007          ; $e0bf: 8d 07 20  
            lda #$00           ; $e0c2: a9 00     
            jsr __e033         ; $e0c4: 20 33 e0  
            lda $2007          ; $e0c7: ad 07 20  
            lda #$3f           ; $e0ca: a9 3f     
            sta $2006          ; $e0cc: 8d 06 20  
            lda #$00           ; $e0cf: a9 00     
            sta $2006          ; $e0d1: 8d 06 20  
            lda #$34           ; $e0d4: a9 34     
            sta $2007          ; $e0d6: 8d 07 20  
            lda #$01           ; $e0d9: a9 01     
            jsr __e033         ; $e0db: 20 33 e0  
            lda $2007          ; $e0de: ad 07 20  
            cmp #$9a           ; $e0e1: c9 9a     
            jsr __e02a         ; $e0e3: 20 2a e0  
            lda #$06           ; $e0e6: a9 06     ;;;;;;;;;;;;Start of error 6 routine
            sta $f0            ; $e0e8: 85 f0     
            lda #$12           ; $e0ea: a9 12     
            jsr __e033         ; $e0ec: 20 33 e0  
            lda #$9a           ; $e0ef: a9 9a     
            sta $2007          ; $e0f1: 8d 07 20  
            lda $2007          ; $e0f4: ad 07 20  
            lda #$3f           ; $e0f7: a9 3f     
            sta $2006          ; $e0f9: 8d 06 20  
            lda #$12           ; $e0fc: a9 12     
            sta $2006          ; $e0fe: 8d 06 20  
            lda $2007          ; $e101: ad 07 20  
            lda #$13           ; $e104: a9 13     
            jsr __e033         ; $e106: 20 33 e0  
            lda $2007          ; $e109: ad 07 20  
            cmp #$9a           ; $e10c: c9 9a     
            jsr __e02a         ; $e10e: 20 2a e0  
            lda #$07           ; $e111: a9 07     
            sta $f0            ; $e113: 85 f0     
            lda #$04           ; $e115: a9 04     
            jsr __e033         ; $e117: 20 33 e0  
            lda #$12           ; $e11a: a9 12     
            sta $2007          ; $e11c: 8d 07 20  
            lda #$14           ; $e11f: a9 14     
            jsr __e033         ; $e121: 20 33 e0  
            lda #$34           ; $e124: a9 34     
            sta $2007          ; $e126: 8d 07 20  
            lda #$3f           ; $e129: a9 3f     
            sta $2006          ; $e12b: 8d 06 20  
            lda #$04           ; $e12e: a9 04     
            sta $2006          ; $e130: 8d 06 20  
            lda $2007          ; $e133: ad 07 20  
            lda #$13           ; $e136: a9 13     
            jsr __e033         ; $e138: 20 33 e0  
            lda $2007          ; $e13b: ad 07 20  
            cmp #$12           ; $e13e: c9 12     
            jsr __e02a         ; $e140: 20 2a e0  
            lda #$34           ; $e143: a9 34     
            sta $2007          ; $e145: 8d 07 20  
            lda #$3f           ; $e148: a9 3f     
            sta $2006          ; $e14a: 8d 06 20  
            lda #$14           ; $e14d: a9 14     
            sta $2006          ; $e14f: 8d 06 20  
            lda $2007          ; $e152: ad 07 20  
            lda #$13           ; $e155: a9 13     
            jsr __e033         ; $e157: 20 33 e0  
            lda $2007          ; $e15a: ad 07 20  
            cmp #$34           ; $e15d: c9 34     
            jsr __e02a         ; $e15f: 20 2a e0  
            lda #$01           ; $e162: a9 01     
            sta $f0            ; $e164: 85 f0     
            jmp __e000         ; $e166: 4c 00 e0  

;-------------------------------------------------------------------------------
__e169:     pha                ; $e169: 48        
            lda #$fd           ; $e16a: a9 fd     
            sec                ; $e16c: 38        
__e16d:     nop                ; $e16d: ea        
            adc #$fe           ; $e16e: 69 fe     
            bne __e16d         ; $e170: d0 fb     
            pla                ; $e172: 68        
            clc                ; $e173: 18        
            adc #$ff           ; $e174: 69 ff     
            bne __e169         ; $e176: d0 f1     
            rts                ; $e178: 60        

;-------------------------------------------------------------------------------
__e179:     jsr __e412         ; $e179: 20 12 e4  
            pha                ; $e17c: 48        
            lda #$20           ; $e17d: a9 20     
            sta $2006          ; $e17f: 8d 06 20  
            inc $07f0          ; $e182: ee f0 07  
            lda $07f0          ; $e185: ad f0 07  
            sta $2006          ; $e188: 8d 06 20  
            pla                ; $e18b: 68        
            sta $2007          ; $e18c: 8d 07 20  
            lda #$00           ; $e18f: a9 00     
            sta $2005          ; $e191: 8d 05 20  
            sta $2005          ; $e194: 8d 05 20  
            rts                ; $e197: 60        

;-------------------------------------------------------------------------------
__e198:     lda #$a1           ; $e198: a9 a1     
            sta $07f0          ; $e19a: 8d f0 07  
            jsr __e412         ; $e19d: 20 12 e4  
            lda #$00           ; $e1a0: a9 00     
            sta $2000          ; $e1a2: 8d 00 20  
            sta $2001          ; $e1a5: 8d 01 20  
            sta $2005          ; $e1a8: 8d 05 20  
            sta $2005          ; $e1ab: 8d 05 20  
            jsr __e412         ; $e1ae: 20 12 e4  
            lda #$3f           ; $e1b1: a9 3f     
            sta $2006          ; $e1b3: 8d 06 20  
            lda #$00           ; $e1b6: a9 00     
            sta $2006          ; $e1b8: 8d 06 20  
            lda #$0f           ; $e1bb: a9 0f     
            ldx #$30           ; $e1bd: a2 30     
            ldy #$08           ; $e1bf: a0 08     
__e1c1:     sta $2007          ; $e1c1: 8d 07 20  
            stx $2007          ; $e1c4: 8e 07 20  
            stx $2007          ; $e1c7: 8e 07 20  
            stx $2007          ; $e1ca: 8e 07 20  
            dey                ; $e1cd: 88        
            bne __e1c1         ; $e1ce: d0 f1     
            jsr __e412         ; $e1d0: 20 12 e4  
            lda #$02           ; $e1d3: a9 02     
            sta $2006          ; $e1d5: 8d 06 20  
            lda #$00           ; $e1d8: a9 00     
            sta $2006          ; $e1da: 8d 06 20  
            lda #$3a           ; $e1dd: a9 3a     
            sta $00            ; $e1df: 85 00     
            lda #$e2           ; $e1e1: a9 e2     
            sta $01            ; $e1e3: 85 01     
            ldy #$00           ; $e1e5: a0 00     
            lda #$3b           ; $e1e7: a9 3b     
            sta $02            ; $e1e9: 85 02     
__e1eb:     ldx #$08           ; $e1eb: a2 08     
            lda #$00           ; $e1ed: a9 00     
__e1ef:     sta $2007          ; $e1ef: 8d 07 20  
            dex                ; $e1f2: ca        
            bne __e1ef         ; $e1f3: d0 fa     
            ldx #$08           ; $e1f5: a2 08     
__e1f7:     lda ($00),y        ; $e1f7: b1 00     
            iny                ; $e1f9: c8        
            sta $2007          ; $e1fa: 8d 07 20  
            dex                ; $e1fd: ca        
            bne __e1f7         ; $e1fe: d0 f7     
            tya                ; $e200: 98        
            bne __e205         ; $e201: d0 02     
            inc $01            ; $e203: e6 01     
__e205:     dec $02            ; $e205: c6 02     
            bne __e1eb         ; $e207: d0 e2     
            jsr __e412         ; $e209: 20 12 e4  
            lda #$20           ; $e20c: a9 20     
            sta $2006          ; $e20e: 8d 06 20  
            lda #$00           ; $e211: a9 00     
            sta $2006          ; $e213: 8d 06 20  
            lda #$20           ; $e216: a9 20     
            ldy #$00           ; $e218: a0 00     
__e21a:     sta $2007          ; $e21a: 8d 07 20  
            sta $2007          ; $e21d: 8d 07 20  
            sta $2007          ; $e220: 8d 07 20  
            sta $2007          ; $e223: 8d 07 20  
            dey                ; $e226: 88        
            bne __e21a         ; $e227: d0 f1     
            jsr __e412         ; $e229: 20 12 e4  
            lda #$00           ; $e22c: a9 00     
            sta $2005          ; $e22e: 8d 05 20  
            sta $2005          ; $e231: 8d 05 20  
            lda #$08           ; $e234: a9 08     
            sta $2001          ; $e236: 8d 01 20  
            rts                ; $e239: 60        

;-------------------------------------------------------------------------------
            brk                ; $e23a: 00        
            brk                ; $e23b: 00        
            brk                ; $e23c: 00        
            brk                ; $e23d: 00        
            brk                ; $e23e: 00        
            brk                ; $e23f: 00        
            brk                ; $e240: 00        
            brk                ; $e241: 00        
            clc                ; $e242: 18        
            clc                ; $e243: 18        
            clc                ; $e244: 18        
            clc                ; $e245: 18        
            clc                ; $e246: 18        
            brk                ; $e247: 00        
            clc                ; $e248: 18        
            brk                ; $e249: 00        
            plp                ; $e24a: 28        
            plp                ; $e24b: 28        
            plp                ; $e24c: 28        
            brk                ; $e24d: 00        
            brk                ; $e24e: 00        
            brk                ; $e24f: 00        
            brk                ; $e250: 00        
            brk                ; $e251: 00        
            plp                ; $e252: 28        
            plp                ; $e253: 28        
            inc __fe28,x       ; $e254: fe 28 fe  
            plp                ; $e257: 28        
            plp                ; $e258: 28        
            brk                ; $e259: 00        
            bpl __e2d8         ; $e25a: 10 7c     
            bne __e2da         ; $e25c: d0 7c     
            asl $fc,x          ; $e25e: 16 fc     
            bpl __e262         ; $e260: 10 00     
__e262:     brk                ; $e262: 00        
            .hex 44 08         ; $e263: 44 08     Invalid Opcode - NOP $08
            bpl __e287         ; $e265: 10 20     
            .hex 44 00         ; $e267: 44 00     Invalid Opcode - NOP $00
            brk                ; $e269: 00        
            bmi __e2b4         ; $e26a: 30 48     
            bvc __e28e         ; $e26c: 50 20     
            .hex 54 48         ; $e26e: 54 48     Invalid Opcode - NOP $48,x
            .hex 34 00         ; $e270: 34 00     Invalid Opcode - NOP $00,x
            bpl __e284         ; $e272: 10 10     
            brk                ; $e274: 00        
            brk                ; $e275: 00        
            brk                ; $e276: 00        
            brk                ; $e277: 00        
            brk                ; $e278: 00        
            brk                ; $e279: 00        
            bpl __e29c         ; $e27a: 10 20     
            jsr $2020          ; $e27c: 20 20 20  
            jsr $0010          ; $e27f: 20 10 00  
            bpl __e28c         ; $e282: 10 08     
__e284:     php                ; $e284: 08        
            php                ; $e285: 08        
            php                ; $e286: 08        
__e287:     php                ; $e287: 08        
            bpl __e28a         ; $e288: 10 00     
__e28a:     bpl __e2e0         ; $e28a: 10 54     
__e28c:     sec                ; $e28c: 38        
            sec                ; $e28d: 38        
__e28e:     .hex 54 10         ; $e28e: 54 10     Invalid Opcode - NOP $10,x
            brk                ; $e290: 00        
            brk                ; $e291: 00        
            brk                ; $e292: 00        
            bpl __e2a5         ; $e293: 10 10     
            .hex 7c 10 10      ; $e295: 7c 10 10  Invalid Opcode - NOP $1010,x
            brk                ; $e298: 00        
            brk                ; $e299: 00        
            brk                ; $e29a: 00        
            brk                ; $e29b: 00        
__e29c:     brk                ; $e29c: 00        
            brk                ; $e29d: 00        
            clc                ; $e29e: 18        
            clc                ; $e29f: 18        
            bmi __e2a2         ; $e2a0: 30 00     
__e2a2:     brk                ; $e2a2: 00        
            brk                ; $e2a3: 00        
            brk                ; $e2a4: 00        
__e2a5:     .hex 3c 00 00      ; $e2a5: 3c 00 00  Bad Addr Mode - NOP $0000,x
            brk                ; $e2a8: 00        
            brk                ; $e2a9: 00        
            brk                ; $e2aa: 00        
            brk                ; $e2ab: 00        
            brk                ; $e2ac: 00        
            brk                ; $e2ad: 00        
            brk                ; $e2ae: 00        
            brk                ; $e2af: 00        
            php                ; $e2b0: 08        
            brk                ; $e2b1: 00        
            brk                ; $e2b2: 00        
            brk                ; $e2b3: 00        
__e2b4:     brk                ; $e2b4: 00        
            brk                ; $e2b5: 00        
            brk                ; $e2b6: 00        
            brk                ; $e2b7: 00        
            brk                ; $e2b8: 00        
            brk                ; $e2b9: 00        
            sec                ; $e2ba: 38        
            jmp __c6ce         ; $e2bb: 4c ce c6  

;-------------------------------------------------------------------------------
            inc $64            ; $e2be: e6 64     
            sec                ; $e2c0: 38        
            brk                ; $e2c1: 00        
            clc                ; $e2c2: 18        
            sec                ; $e2c3: 38        
            clc                ; $e2c4: 18        
            clc                ; $e2c5: 18        
            clc                ; $e2c6: 18        
            clc                ; $e2c7: 18        
            ror $7c00,x        ; $e2c8: 7e 00 7c  
            dec $0e            ; $e2cb: c6 0e     
            .hex 3c 70 c0      ; $e2cd: 3c 70 c0  Invalid Opcode - NOP __c070,x
            inc $7e00,x        ; $e2d0: fe 00 7e  
            .hex 0c 18 3c      ; $e2d3: 0c 18 3c  Invalid Opcode - NOP $3c18
            asl $c6            ; $e2d6: 06 c6     
__e2d8:     .hex 7c 00         ; $e2d8: 7c 00     Suspected data
__e2da:     .hex 1c 3c 6c      ; $e2da: 1c 3c 6c  Invalid Opcode - NOP $6c3c,x
            cpy $0cfe          ; $e2dd: cc fe 0c  
__e2e0:     .hex 0c 00 fc      ; $e2e0: 0c 00 fc  Invalid Opcode - NOP __fc00
            cpy #$fc           ; $e2e3: c0 fc     
            asl $06            ; $e2e5: 06 06     
            dec $7c            ; $e2e7: c6 7c     
            brk                ; $e2e9: 00        
            rol __c060,x       ; $e2ea: 3e 60 c0  
            .hex fc c6 c6      ; $e2ed: fc c6 c6  Invalid Opcode - NOP __c6c6,x
            .hex 7c 00 fe      ; $e2f0: 7c 00 fe  Invalid Opcode - NOP __fe00,x
            dec $0c            ; $e2f3: c6 0c     
            clc                ; $e2f5: 18        
            bmi __e328         ; $e2f6: 30 30     
            bmi __e2fa         ; $e2f8: 30 00     
__e2fa:     .hex 7c c6 c6      ; $e2fa: 7c c6 c6  Invalid Opcode - NOP __c6c6,x
            .hex 7c c6 c6      ; $e2fd: 7c c6 c6  Invalid Opcode - NOP __c6c6,x
            .hex 7c 00 7c      ; $e300: 7c 00 7c  Invalid Opcode - NOP $7c00,x
            dec $c6            ; $e303: c6 c6     
            ror $0c06,x        ; $e305: 7e 06 0c  
            sei                ; $e308: 78        
            brk                ; $e309: 00        
            brk                ; $e30a: 00        
            clc                ; $e30b: 18        
            clc                ; $e30c: 18        
            brk                ; $e30d: 00        
            clc                ; $e30e: 18        
            clc                ; $e30f: 18        
            brk                ; $e310: 00        
            brk                ; $e311: 00        
            brk                ; $e312: 00        
            clc                ; $e313: 18        
            clc                ; $e314: 18        
            brk                ; $e315: 00        
            clc                ; $e316: 18        
            clc                ; $e317: 18        
            bmi __e31a         ; $e318: 30 00     
__e31a:     brk                ; $e31a: 00        
            bpl __e33d         ; $e31b: 10 20     
            rti                ; $e31d: 40        

;-------------------------------------------------------------------------------
            jsr $0010          ; $e31e: 20 10 00  
            brk                ; $e321: 00        
            brk                ; $e322: 00        
            brk                ; $e323: 00        
            .hex 3c 00 3c      ; $e324: 3c 00 3c  Invalid Opcode - NOP $3c00,x
            brk                ; $e327: 00        
__e328:     brk                ; $e328: 00        
            brk                ; $e329: 00        
            brk                ; $e32a: 00        
            bpl __e335         ; $e32b: 10 08     
            .hex 04 08         ; $e32d: 04 08     Invalid Opcode - NOP $08
            bpl __e331         ; $e32f: 10 00     
__e331:     brk                ; $e331: 00        
            brk                ; $e332: 00        
            sec                ; $e333: 38        
            .hex 44            ; $e334: 44        Suspected data
__e335:     .hex 04 10         ; $e335: 04 10     Invalid Opcode - NOP $10
            brk                ; $e337: 00        
            bpl __e33a         ; $e338: 10 00     
__e33a:     sec                ; $e33a: 38        
            .hex 44 9a         ; $e33b: 44 9a     Invalid Opcode - NOP $9a
__e33d:     tax                ; $e33d: aa        
            sty $40,x          ; $e33e: 94 40     
            .hex 3c 00 38      ; $e340: 3c 00 38  Invalid Opcode - NOP $3800,x
            jmp (__c6c6)       ; $e343: 6c c6 c6  

;-------------------------------------------------------------------------------
            inc __c6c6,x       ; $e346: fe c6 c6  
            brk                ; $e349: 00        
            .hex fc c6 c6      ; $e34a: fc c6 c6  Invalid Opcode - NOP __c6c6,x
            .hex fc c6 c6      ; $e34d: fc c6 c6  Invalid Opcode - NOP __c6c6,x
            .hex fc 00 3c      ; $e350: fc 00 3c  Invalid Opcode - NOP $3c00,x
            ror $c0            ; $e353: 66 c0     
            cpy #$c0           ; $e355: c0 c0     
            ror $3c            ; $e357: 66 3c     
            brk                ; $e359: 00        
            sed                ; $e35a: f8        
            cpy __c6c6         ; $e35b: cc c6 c6  
            dec $cc            ; $e35e: c6 cc     
            sed                ; $e360: f8        
            brk                ; $e361: 00        
            inc __c0c0,x       ; $e362: fe c0 c0  
            .hex fc c0 c0      ; $e365: fc c0 c0  Invalid Opcode - NOP __c0c0,x
            inc __fe00,x       ; $e368: fe 00 fe  
            cpy #$c0           ; $e36b: c0 c0     
            sed                ; $e36d: f8        
            cpy #$c0           ; $e36e: c0 c0     
            cpy #$00           ; $e370: c0 00     
            .hex 3c 66 c0      ; $e372: 3c 66 c0  Invalid Opcode - NOP __c066,x
            dec $66c6          ; $e375: ce c6 66  
            rol __c600,x       ; $e378: 3e 00 c6  
            dec $c6            ; $e37b: c6 c6     
            inc __c6c6,x       ; $e37d: fe c6 c6  
            dec $00            ; $e380: c6 00     
            ror $1818,x        ; $e382: 7e 18 18  
            clc                ; $e385: 18        
            clc                ; $e386: 18        
            clc                ; $e387: 18        
            ror $0e00,x        ; $e388: 7e 00 0e  
            asl $06            ; $e38b: 06 06     
            asl $c6            ; $e38d: 06 c6     
__e38f:     dec $7c            ; $e38f: c6 7c     
            brk                ; $e391: 00        
            dec $cc            ; $e392: c6 cc     
            cld                ; $e394: d8        
            beq __e38f         ; $e395: f0 f8     
            .hex dc ce 00      ; $e397: dc ce 00  Bad Addr Mode - NOP $00ce,x
            rts                ; $e39a: 60        

;-------------------------------------------------------------------------------
            rts                ; $e39b: 60        

;-------------------------------------------------------------------------------
            rts                ; $e39c: 60        

;-------------------------------------------------------------------------------
            rts                ; $e39d: 60        

;-------------------------------------------------------------------------------
            rts                ; $e39e: 60        

;-------------------------------------------------------------------------------
            rts                ; $e39f: 60        

;-------------------------------------------------------------------------------
            ror __c600,x       ; $e3a0: 7e 00 c6  
            inc __fefe         ; $e3a3: ee fe fe  
            dec $c6,x          ; $e3a6: d6 c6     
            dec $00            ; $e3a8: c6 00     
            dec $e6            ; $e3aa: c6 e6     
            inc $fe,x          ; $e3ac: f6 fe     
            dec __c6ce,x       ; $e3ae: de ce c6  
            brk                ; $e3b1: 00        
            .hex 7c c6 c6      ; $e3b2: 7c c6 c6  Invalid Opcode - NOP __c6c6,x
            dec $c6,x          ; $e3b5: d6 c6     
            dec $7c            ; $e3b7: c6 7c     
            brk                ; $e3b9: 00        
            .hex fc c6 c6      ; $e3ba: fc c6 c6  Invalid Opcode - NOP __c6c6,x
            dec $fc            ; $e3bd: c6 fc     
            cpy #$c0           ; $e3bf: c0 c0     
            brk                ; $e3c1: 00        
            .hex 7c c6 c6      ; $e3c2: 7c c6 c6  Invalid Opcode - NOP __c6c6,x
            dec $de            ; $e3c5: c6 de     
            .hex cc 7a 00      ; $e3c7: cc 7a 00  Bad Addr Mode - CPY $007a
            .hex fc c6 c6      ; $e3ca: fc c6 c6  Invalid Opcode - NOP __c6c6,x
            dec __dcf8         ; $e3cd: ce f8 dc  
            dec $7800          ; $e3d0: ce 00 78  
            cpy $7cc0          ; $e3d3: cc c0 7c  
            asl $c6            ; $e3d6: 06 c6     
            .hex 7c 00 7e      ; $e3d8: 7c 00 7e  Invalid Opcode - NOP $7e00,x
            clc                ; $e3db: 18        
            clc                ; $e3dc: 18        
            clc                ; $e3dd: 18        
            clc                ; $e3de: 18        
            clc                ; $e3df: 18        
            clc                ; $e3e0: 18        
            brk                ; $e3e1: 00        
            dec $c6            ; $e3e2: c6 c6     
            dec $c6            ; $e3e4: c6 c6     
            dec $c6            ; $e3e6: c6 c6     
            .hex 7c 00 c6      ; $e3e8: 7c 00 c6  Invalid Opcode - NOP __c600,x
            dec $c6            ; $e3eb: c6 c6     
            inc $387c          ; $e3ed: ee 7c 38  
__e3f0:     bpl __e3f2         ; $e3f0: 10 00     
__e3f2:     dec $c6            ; $e3f2: c6 c6     
            dec $fe,x          ; $e3f4: d6 fe     
            inc __c6ee,x       ; $e3f6: fe ee c6  
            brk                ; $e3f9: 00        
            dec $ee            ; $e3fa: c6 ee     
            .hex 7c 38 7c      ; $e3fc: 7c 38 7c  Invalid Opcode - NOP $7c38,x
            .hex ee c6 00      ; $e3ff: ee c6 00  Bad Addr Mode - INC $00c6
            ror $66            ; $e402: 66 66     
            ror $3c            ; $e404: 66 3c     
            clc                ; $e406: 18        
            clc                ; $e407: 18        
            clc                ; $e408: 18        
            brk                ; $e409: 00        
            inc $1c0e,x        ; $e40a: fe 0e 1c  
            sec                ; $e40d: 38        
            bvs __e3f0         ; $e40e: 70 e0     
            .hex fe 00         ; $e410: fe 00     Suspected data
__e412:     bit $2002          ; $e412: 2c 02 20  
__e415:     bit $2002          ; $e415: 2c 02 20  
            bpl __e415         ; $e418: 10 fb     
            rts                ; $e41a: 60        

;-------------------------------------------------------------------------------
__e41b:     tay                ; $e41b: a8        
            ldx #$00           ; $e41c: a2 00     
            stx $2000          ; $e41e: 8e 00 20  
            sei                ; $e421: 78        
__e422:     ldx #$00           ; $e422: a2 00     
            stx $4001          ; $e424: 8e 01 40  
            stx $4002          ; $e427: 8e 02 40  
            inx                ; $e42a: e8        
            stx $4000          ; $e42b: 8e 00 40  
            stx $4015          ; $e42e: 8e 15 40  
            stx $4003          ; $e431: 8e 03 40  
            lda #$fa           ; $e434: a9 fa     
            jsr __e169         ; $e436: 20 69 e1  
            dey                ; $e439: 88        
            bne __e422         ; $e43a: d0 e6     
            rts                ; $e43c: 60        

;-------------------------------------------------------------------------------
            pha                ; $e43d: 48        
            lda #$24           ; $e43e: a9 24     
            jsr __e472         ; $e440: 20 72 e4  
            tya                ; $e443: 98        
            jsr __e45c         ; $e444: 20 5c e4  
            jmp __e450         ; $e447: 4c 50 e4  

;-------------------------------------------------------------------------------
__e44a:     pha                ; $e44a: 48        
            lda #$24           ; $e44b: a9 24     
            jsr __e472         ; $e44d: 20 72 e4  
__e450:     pla                ; $e450: 68        
            pha                ; $e451: 48        
            jsr __e45c         ; $e452: 20 5c e4  
            lda #$20           ; $e455: a9 20     
            jsr __e472         ; $e457: 20 72 e4  
            pla                ; $e45a: 68        
            rts                ; $e45b: 60        

;-------------------------------------------------------------------------------
__e45c:     pha                ; $e45c: 48        
            lsr                ; $e45d: 4a        
            lsr                ; $e45e: 4a        
            lsr                ; $e45f: 4a        
            lsr                ; $e460: 4a        
            jsr __e467         ; $e461: 20 67 e4  
            pla                ; $e464: 68        
            and #$0f           ; $e465: 29 0f     
__e467:     cmp #$0a           ; $e467: c9 0a     
            bcc __e46d         ; $e469: 90 02     
            adc #$06           ; $e46b: 69 06     
__e46d:     adc #$30           ; $e46d: 69 30     
            jmp __e472         ; $e46f: 4c 72 e4  

;-------------------------------------------------------------------------------
__e472:     pha                ; $e472: 48        
            lda #$a5           ; $e473: a9 a5     
            cmp $07f1          ; $e475: cd f1 07  
            beq __e480         ; $e478: f0 06     
            sta $07f1          ; $e47a: 8d f1 07  
            jsr __e198         ; $e47d: 20 98 e1  
__e480:     pla                ; $e480: 68        
            jmp __e179         ; $e481: 4c 79 e1  

;-------------------------------------------------------------------------------
__e484:     jmp __e198         ; $e484: 4c 98 e1  

;-------------------------------------------------------------------------------
__e487:     sei                ; $e487: 78        
            lda #$00           ; $e488: a9 00     
            sta $2000          ; $e48a: 8d 00 20  
__e48d:     jmp __e48d         ; $e48d: 4c 8d e4  

;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $e490: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e493: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e496: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e499: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e49c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e49f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e4ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e502: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e505: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e508: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e50b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e50e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e511: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e514: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e517: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e51a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e51d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e520: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e523: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e526: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e529: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e52c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e52f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e532: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e535: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e538: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e53b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e53e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e541: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e544: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e547: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e54a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e54d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e550: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e553: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e556: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e559: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e55c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e55f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e562: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e565: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e568: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e56b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e56e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e571: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e574: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e577: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e57a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e57d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e580: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e583: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e586: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e589: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e58c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e58f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e592: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e595: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e598: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e59b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e59e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e5fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e601: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e604: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e607: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e60a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e60d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e610: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e613: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e616: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e619: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e61c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e61f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e622: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e625: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e628: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e62b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e62e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e631: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e634: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e637: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e63a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e63d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e640: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e643: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e646: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e649: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e64c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e64f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e652: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e655: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e658: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e65b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e65e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e661: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e664: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e667: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e66a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e66d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e670: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e673: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e676: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e679: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e67c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e67f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e682: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e685: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e688: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e68b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e68e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e691: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e694: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e697: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e69a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e69d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e6fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e700: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e703: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e706: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e709: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e70c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e70f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e712: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e715: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e718: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e71b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e71e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e721: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e724: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e727: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e72a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e72d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e730: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e733: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e736: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e739: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e73c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e73f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e742: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e745: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e748: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e74b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e74e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e751: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e754: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e757: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e75a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e75d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e760: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e763: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e766: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e769: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e76c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e76f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e772: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e775: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e778: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e77b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e77e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e781: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e784: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e787: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e78a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e78d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e790: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e793: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e796: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e799: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e79c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e79f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e7ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e802: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e805: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e808: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e80b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e80e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e811: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e814: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e817: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e81a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e81d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e820: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e823: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e826: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e829: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e82c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e82f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e832: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e835: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e838: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e83b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e83e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e841: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e844: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e847: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e84a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e84d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e850: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e853: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e856: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e859: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e85c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e85f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e862: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e865: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e868: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e86b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e86e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e871: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e874: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e877: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e87a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e87d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e880: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e883: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e886: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e889: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e88c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e88f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e892: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e895: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e898: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e89b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e89e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e8fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e901: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e904: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e907: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e90a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e90d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e910: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e913: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e916: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e919: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e91c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e91f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e922: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e925: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e928: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e92b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e92e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e931: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e934: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e937: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e93a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e93d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e940: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e943: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e946: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e949: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e94c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e94f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e952: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e955: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e958: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e95b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e95e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e961: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e964: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e967: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e96a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e96d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e970: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e973: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e976: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e979: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e97c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e97f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e982: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e985: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e988: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e98b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e98e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e991: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e994: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e997: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e99a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e99d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $e9fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea00: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea03: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea06: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea09: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea0c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea0f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea12: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea15: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea18: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea1b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea1e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea21: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea24: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea27: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea2a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea2d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea30: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea33: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea36: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea39: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea3c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea3f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea42: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea45: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea48: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea4b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea4e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea51: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea54: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea57: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea5a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea5d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea60: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea63: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea66: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea69: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea6c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea6f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea72: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea75: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea78: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea7b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea7e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea81: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea84: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea87: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea8a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea8d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea90: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea93: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea96: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea99: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea9c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ea9f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaa2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaa5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaa8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eab1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eab4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eab7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eabd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eac0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eac3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eac6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eac9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eacc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eacf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ead2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ead5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ead8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eadb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eade: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eae1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eae4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eae7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaf0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaf3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaf6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaf9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eafc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eaff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb02: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb05: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb08: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb0b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb0e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb11: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb14: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb17: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb1a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb1d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb20: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb23: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb26: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb29: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb2c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb2f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb32: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb35: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb38: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb3b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb3e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb41: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb44: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb47: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb4a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb4d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb50: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb53: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb56: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb59: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb5c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb5f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb62: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb65: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb68: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb6b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb6e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb71: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb74: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb77: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb7a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb7d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb80: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb83: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb86: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb89: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb8c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb8f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb92: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb95: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb98: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb9b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eb9e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eba1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eba4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eba7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebaa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebb0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebb3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebb6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebb9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebbc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebbf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebc2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebc5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebc8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebcb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebd1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebd4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebd7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebda: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebdd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebe0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebe3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebe6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebe9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebf2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebf5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebf8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebfb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ebfe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec01: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec04: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec07: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec0a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec0d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec10: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec13: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec16: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec19: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec1c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec1f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec22: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec25: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec28: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec2b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec2e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec31: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec34: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec37: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec3a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec3d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec40: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec43: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec46: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec49: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec4c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec4f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec52: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec55: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec58: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec5b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec5e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec61: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec64: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec67: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec6a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec6d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec70: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec73: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec76: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec79: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec7c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec7f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec82: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec85: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec88: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec8b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec8e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec91: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec94: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec97: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec9a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ec9d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eca0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eca3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eca6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eca9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecaf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecb2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecb5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecb8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecbb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecbe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecc1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecc4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecc7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eccd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecd0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecd3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecd6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecd9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecdc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecdf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ece2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ece5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ece8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eceb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecf1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecf4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecf7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecfa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ecfd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed00: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed03: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed06: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed09: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed0c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed0f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed12: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed15: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed18: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed1b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed1e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed21: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed24: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed27: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed2a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed2d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed30: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed33: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed36: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed39: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed3c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed3f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed42: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed45: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed48: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed4b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed4e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed51: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed54: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed57: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed5a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed5d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed60: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed63: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed66: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed69: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed6c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed6f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed72: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed75: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed78: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed7b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed7e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed81: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed84: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed87: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed8a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed8d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed90: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed93: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed96: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed99: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed9c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ed9f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eda2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eda5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eda8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edb1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edb4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edb7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edbd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edc0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edc3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edc6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edc9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edcc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edcf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edd2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edd5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edd8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eddb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edde: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ede1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ede4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ede7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eded: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edf0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edf3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edf6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edf9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edfc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $edff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee02: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee05: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee08: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee0b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee0e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee11: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee14: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee17: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee1a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee1d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee20: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee23: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee26: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee29: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee2c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee2f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee32: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee35: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee38: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee3b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee3e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee41: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee44: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee47: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee4a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee4d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee50: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee53: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee56: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee59: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee5c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee5f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee62: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee65: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee68: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee6b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee6e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee71: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee74: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee77: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee7a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee7d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee80: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee83: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee86: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee89: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee8c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee8f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee92: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee95: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee98: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee9b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ee9e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eea1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eea4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eea7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eeaa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eead: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eeb0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eeb3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eeb6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eeb9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eebc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eebf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eec2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eec5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eec8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eecb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eece: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eed1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eed4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eed7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eeda: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eedd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eee0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eee3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eee6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eee9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eeec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eeef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eef2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eef5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eef8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eefb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eefe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef01: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef04: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef07: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef0a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef0d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef10: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef13: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef16: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef19: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef1c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef1f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef22: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef25: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef28: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef2b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef2e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef31: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef34: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef37: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef3a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef3d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef40: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef43: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef46: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef49: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef4c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef4f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef52: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef55: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef58: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef5b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef5e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef61: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef64: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef67: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef6a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef6d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef70: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef73: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef76: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef79: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef7c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef7f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef82: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef85: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef88: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef8b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef8e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef91: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef94: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef97: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef9a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef9d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efa0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efa3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efa6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efa9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efaf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efb2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efb5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efb8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efbb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efbe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efc1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efc4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efc7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efcd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efd0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efd3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efd6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efd9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efdc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efdf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efe2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efe5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efe8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efeb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eff1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eff4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eff7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $effa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $effd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f000: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f003: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f006: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f009: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f00c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f00f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f012: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f015: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f018: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f01b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f01e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f021: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f024: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f027: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f02a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f02d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f030: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f033: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f036: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f039: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f03c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f03f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f042: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f045: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f048: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f04b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f04e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f051: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f054: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f057: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f05a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f05d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f060: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f063: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f066: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f069: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f06c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f06f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f072: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f075: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f078: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f07b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f07e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f081: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f084: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f087: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f08a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f08d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f090: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f093: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f096: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f099: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f09c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f09f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f0ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f102: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f105: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f108: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f10b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f10e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f111: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f114: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f117: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f11a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f11d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f120: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f123: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f126: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f129: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f12c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f12f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f132: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f135: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f138: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f13b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f13e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f141: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f144: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f147: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f14a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f14d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f150: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f153: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f156: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f159: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f15c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f15f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f162: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f165: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f168: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f16b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f16e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f171: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f174: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f177: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f17a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f17d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f180: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f183: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f186: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f189: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f18c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f18f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f192: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f195: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f198: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f19b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f19e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f1fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f201: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f204: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f207: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f20a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f20d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f210: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f213: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f216: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f219: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f21c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f21f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f222: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f225: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f228: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f22b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f22e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f231: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f234: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f237: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f23a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f23d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f240: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f243: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f246: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f249: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f24c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f24f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f252: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f255: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f258: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f25b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f25e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f261: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f264: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f267: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f26a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f26d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f270: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f273: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f276: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f279: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f27c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f27f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f282: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f285: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f288: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f28b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f28e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f291: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f294: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f297: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f29a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f29d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f300: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f303: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f306: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f309: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f30c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f30f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f312: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f315: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f318: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f31b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f31e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f321: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f324: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f327: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f32a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f32d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f330: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f333: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f336: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f339: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f33c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f33f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f342: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f345: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f348: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f34b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f34e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f351: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f354: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f357: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f35a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f35d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f360: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f363: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f366: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f369: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f36c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f36f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f372: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f375: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f378: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f37b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f37e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f381: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f384: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f387: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f38a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f38d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f390: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f393: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f396: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f399: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f39c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f39f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f3ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f402: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f405: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f408: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f40b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f40e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f411: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f414: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f417: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f41a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f41d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f420: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f423: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f426: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f429: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f42c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f42f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f432: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f435: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f438: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f43b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f43e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f441: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f444: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f447: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f44a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f44d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f450: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f453: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f456: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f459: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f45c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f45f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f462: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f465: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f468: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f46b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f46e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f471: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f474: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f477: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f47a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f47d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f480: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f483: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f486: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f489: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f48c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f48f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f492: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f495: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f498: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f49b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f49e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f4fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f501: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f504: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f507: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f50a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f50d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f510: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f513: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f516: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f519: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f51c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f51f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f522: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f525: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f528: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f52b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f52e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f531: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f534: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f537: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f53a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f53d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f540: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f543: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f546: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f549: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f54c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f54f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f552: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f555: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f558: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f55b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f55e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f561: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f564: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f567: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f56a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f56d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f570: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f573: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f576: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f579: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f57c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f57f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f582: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f585: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f588: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f58b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f58e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f591: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f594: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f597: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f59a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f59d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f600: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f603: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f606: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f609: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f60c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f60f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f612: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f615: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f618: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f61b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f61e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f621: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f624: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f627: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f62a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f62d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f630: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f633: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f636: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f639: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f63c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f63f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f642: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f645: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f648: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f64b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f64e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f651: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f654: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f657: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f65a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f65d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f660: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f663: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f666: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f669: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f66c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f66f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f672: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f675: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f678: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f67b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f67e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f681: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f684: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f687: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f68a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f68d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f690: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f693: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f696: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f699: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f69c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f69f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f702: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f705: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f708: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f70b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f70e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f711: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f714: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f717: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f71a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f71d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f720: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f723: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f726: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f729: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f72c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f72f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f732: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f735: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f738: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f73b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f73e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f741: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f744: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f747: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f74a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f74d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f750: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f753: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f756: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f759: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f75c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f75f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f762: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f765: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f768: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f76b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f76e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f771: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f774: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f777: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f77a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f77d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f780: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f783: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f786: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f789: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f78c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f78f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f792: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f795: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f798: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f79b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f79e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7a1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7a7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7aa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7b0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7b3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7b6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7b9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7bc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7bf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7c5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7c8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7cb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7d4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7d7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7f5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7fe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f801: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f804: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f807: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f80a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f80d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f810: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f813: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f816: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f819: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f81c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f81f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f822: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f825: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f828: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f82b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f82e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f831: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f834: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f837: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f83a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f83d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f840: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f843: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f846: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f849: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f84c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f84f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f852: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f855: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f858: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f85b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f85e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f861: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f864: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f867: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f86a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f86d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f870: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f873: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f876: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f879: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f87c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f87f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f882: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f885: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f888: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f88b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f88e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f891: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f894: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f897: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f89a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f89d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8a3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8a9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8ac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8af: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8b5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8bb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8be: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8c4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8ca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8cd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8d0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8d3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8d6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8d9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8df: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8e2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8e5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8e8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8eb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8fa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f8fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f900: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f903: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f906: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f909: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f90c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f90f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f912: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f915: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f918: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f91b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f91e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f921: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f924: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f927: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f92a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f92d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f930: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f933: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f936: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f939: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f93c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f93f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f942: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f945: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f948: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f94b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f94e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f951: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f954: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f957: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f95a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f95d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f960: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f963: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f966: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f969: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f96c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f96f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f972: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f975: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f978: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f97b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f97e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f981: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f984: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f987: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f98a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f98d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f990: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f993: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f996: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f999: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f99c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f99f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f9ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa02: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa05: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa08: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa0b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa0e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa11: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa14: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa17: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa1a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa1d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa20: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa23: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa26: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa29: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa2c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa2f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa32: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa35: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa38: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa3b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa3e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa41: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa44: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa47: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa4a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa4d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa50: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa53: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa56: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa59: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa5c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa5f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa62: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa65: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa68: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa6b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa6e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa71: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa74: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa77: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa7a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa7d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa80: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa83: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa86: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa89: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa8c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa8f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa92: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa95: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa98: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa9b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fa9e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $faa1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $faa4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $faa7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $faaa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $faad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fab0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fab3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fab6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fab9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fabc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fabf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fac2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fac5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fac8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $facb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $face: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fad1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fad4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fad7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fada: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fadd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fae0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fae3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fae6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fae9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $faec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $faef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $faf2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $faf5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $faf8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fafb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fafe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb01: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb04: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb07: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb0a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb0d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb10: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb13: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb16: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb19: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb1c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb1f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb22: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb25: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb28: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb2b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb2e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb31: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb34: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb37: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb3a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb3d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb40: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb43: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb46: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb49: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb4c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb4f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb52: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb55: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb58: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb5b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb5e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb61: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb64: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb67: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb6a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb6d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb70: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb73: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb76: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb79: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb7c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb7f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb82: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb85: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb88: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb8b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb8e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb91: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb94: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb97: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb9a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fb9d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fba0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fba3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fba6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fba9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbaf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbb2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbb5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbb8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbbb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbbe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbc1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbc4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbc7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbcd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbd0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbd3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbd6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbd9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbdc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbdf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbe2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbe5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbe8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbeb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbf1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbf4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbf7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbfa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fbfd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc00: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc03: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc06: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc09: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc0c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc0f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc12: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc15: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc18: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc1b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc1e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc21: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc24: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc27: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc2a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc2d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc30: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc33: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc36: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc39: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc3c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc3f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc42: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc45: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc48: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc4b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc4e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc51: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc54: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc57: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc5a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc5d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc60: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc63: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc66: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc69: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc6c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc6f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc72: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc75: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc78: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc7b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc7e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc81: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc84: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc87: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc8a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc8d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc90: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc93: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc96: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc99: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc9c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fc9f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fca2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fca5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fca8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcb1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcb4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcb7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcbd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcc0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcc3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcc6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcc9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fccc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fccf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcd2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcd5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcd8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcdb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcde: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fce1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fce4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fce7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fced: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcf0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcf3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcf6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcf9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcfc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fcff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd02: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd05: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd08: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd0b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd0e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd11: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd14: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd17: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd1a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd1d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd20: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd23: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd26: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd29: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd2c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd2f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd32: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd35: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd38: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd3b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd3e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd41: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd44: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd47: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd4a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd4d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd50: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd53: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd56: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd59: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd5c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd5f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd62: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd65: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd68: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd6b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd6e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd71: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd74: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd77: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd7a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd7d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd80: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd83: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd86: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd89: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd8c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd8f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd92: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd95: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd98: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd9b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fd9e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fda1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fda4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fda7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdaa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdb0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdb3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdb6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdb9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdbc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdbf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdc2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdc5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdc8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdcb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdd1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdd4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdd7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdda: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fddd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fde0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fde3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fde6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fde9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdf2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdf5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdf8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fdfb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff         ; $fdfe: ff ff     Suspected data
__fe00:     .hex ff ff ff      ; $fe00: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe03: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe06: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe09: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe0c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe0f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe12: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe15: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe18: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe1b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe1e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe21: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe24: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff            ; $fe27: ff        Suspected data
__fe28:     .hex ff ff ff      ; $fe28: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe2b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe2e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe31: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe34: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe37: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe3a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe3d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe40: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe43: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe46: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe49: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe4c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe4f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe52: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe55: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe58: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe5b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe5e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe61: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe64: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe67: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe6a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe6d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe70: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe73: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe76: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe79: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe7c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe7f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe82: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe85: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe88: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe8b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe8e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe91: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe94: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe97: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe9a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fe9d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fea0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fea3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fea6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fea9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $feac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $feaf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $feb2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $feb5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $feb8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $febb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $febe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fec1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fec4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fec7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $feca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fecd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fed0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fed3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fed6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fed9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fedc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fedf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fee2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fee5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fee8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $feeb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $feee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fef1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fef4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fef7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fefa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff            ; $fefd: ff        Suspected data
__fefe:     .hex ff ff ff      ; $fefe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff01: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff04: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff07: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff0a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff0d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff10: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff13: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff16: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff19: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff1c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff1f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff22: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff25: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff28: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff2b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff2e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff31: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff34: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff37: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff3a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff3d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff40: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff43: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff46: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff49: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff4c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff4f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff52: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff55: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff58: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff5b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff5e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff61: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff64: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff67: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff6a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff6d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff70: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff73: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff76: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff79: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff7c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff7f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff82: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff85: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff88: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff8b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff8e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff91: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff94: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff97: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff9a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ff9d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffa0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffa3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffa6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffa9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffaf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffb2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffb5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffb8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffbb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffbe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffc1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffc4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffc7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffca: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffcd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffd0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffd3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffd6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffd9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffdc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffdf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffe2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffe5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffe8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffeb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fff1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fff4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fff7: ff ff ff  Invalid Opcode - ISC $ffff,x

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: 29 e0     Vector table
            .dw reset                      ; $fffc: 3e e0     Vector table
            .dw irq                        ; $fffe: 26 e0     Vector table
