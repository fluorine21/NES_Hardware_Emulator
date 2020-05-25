;-------------------------------------------------------------------------------
; Donkey Kong (World) (Rev A).nes disasembled by DISASM6 v1.5
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 1              ; 1 x 16k PRG banks
            .db 1              ; 1 x 8k CHR banks
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
__c000:     jsr $0670          ; $c000: 20 70 06  
            brk                ; $c003: 00        
            jsr $0664          ; $c004: 20 64 06  
            brk                ; $c007: 00        
            jsr $0678          ; $c008: 20 78 06  
            brk                ; $c00b: 00        
            jsr $04b7          ; $c00c: 20 b7 04  
            brk                ; $c00f: 00        
            jsr $01bc          ; $c010: 20 bc 01  
            brk                ; $c013: 00        
__c014:     ora ($08,x)        ; $c014: 01 08     
            .hex 02            ; $c016: 02        Invalid Opcode - KIL 
            php                ; $c017: 08        
            .hex 02            ; $c018: 02        Invalid Opcode - KIL 
            brk                ; $c019: 00        
            ora $01            ; $c01a: 05 01     
            brk                ; $c01c: 00        
            .hex 02            ; $c01d: 02        Invalid Opcode - KIL 
            ora ($01,x)        ; $c01e: 01 01     
            ora ($05,x)        ; $c020: 01 05     
            ora ($05,x)        ; $c022: 01 05     
            ora ($02,x)        ; $c024: 01 02     
            ora ($02,x)        ; $c026: 01 02     
__c028:     .hex db 60 e2      ; $c028: db 60 e2  Invalid Opcode - DCP __e260,y
            eor $14,x          ; $c02b: 55 14     
            jsr __f901         ; $c02d: 20 01 f9  
            ldy #$e0           ; $c030: a0 e0     
            bmi __c044         ; $c032: 30 10     
            bpl __c037         ; $c034: 10 01     
            .hex 50            ; $c036: 50        Suspected data
__c037:     ora ($30,x)        ; $c037: 01 30     
            .hex d0            ; $c039: d0        Suspected data
__c03a:     .hex ff ff         ; $c03a: ff ff     Suspected data
__c03c:     .hex 3e            ; $c03c: 3e        Suspected data
__c03d:     dec $57            ; $c03d: c6 57     
            dec $e1            ; $c03f: c6 e1     
            dec $60            ; $c041: c6 60     
            .hex c7            ; $c043: c7        Suspected data
__c044:     .hex 7d            ; $c044: 7d        Suspected data
__c045:     .hex c7 e4         ; $c045: c7 e4     Invalid Opcode - DCP $e4
            dec $f1            ; $c047: c6 f1     
            dec $53            ; $c049: c6 53     
            .hex c7 08         ; $c04b: c7 08     Invalid Opcode - DCP $08
            .hex c7 19         ; $c04d: c7 19     Invalid Opcode - DCP $19
            .hex c7 1c         ; $c04f: c7 1c     Invalid Opcode - DCP $1c
            .hex c7 35         ; $c051: c7 35     Invalid Opcode - DCP $35
            .hex c7 4e         ; $c053: c7 4e     Invalid Opcode - DCP $4e
            .hex c7 8c         ; $c055: c7 8c     Invalid Opcode - DCP $8c
            cpy #$cf           ; $c057: c0 cf     
            cpy #$61           ; $c059: c0 61     
            cmp ($60,x)        ; $c05b: c1 60     
            .hex 04 c3         ; $c05d: 04 c3     Invalid Opcode - NOP $c3
            cpy #$df           ; $c05f: c0 df     
            cpy #$6e           ; $c061: c0 6e     
            cmp ($c4,x)        ; $c063: c1 c4     
            .hex c2 c8         ; $c065: c2 c8     Invalid Opcode - NOP #$c8
            .hex c2 86         ; $c067: c2 86     Invalid Opcode - NOP #$86
            cmp ($b0,x)        ; $c069: c1 b0     
            cmp ($92,x)        ; $c06b: c1 92     
            cmp ($cf,x)        ; $c06d: c1 cf     
            cmp ($d5,x)        ; $c06f: c1 d5     
            .hex c1            ; $c071: c1        Suspected data
__c072:     .hex db c1 e1      ; $c072: db c1 e1  Invalid Opcode - DCP __e1c1,y
            cmp ($9e,x)        ; $c075: c1 9e     
            cmp ($e7,x)        ; $c077: c1 e7     
            cmp ($0c,x)        ; $c079: c1 0c     
            dec $70            ; $c07b: c6 70     
            dec $89            ; $c07d: c6 89     
            dec $25            ; $c07f: c6 25     
            dec $a2            ; $c081: c6 a2     
            dec $cc            ; $c083: c6 cc     
            brk                ; $c085: 00        
            stx $96c1          ; $c086: 8e c1 96  
            cmp ($a6,x)        ; $c089: c1 a6     
            .hex c6            ; $c08b: c6        Suspected data
__c08c:     brk                ; $c08c: 00        
            cld                ; $c08d: d8        
            brk                ; $c08e: 00        
            brk                ; $c08f: 00        
            ora ($00,x)        ; $c090: 01 00     
            .hex 80 d7         ; $c092: 80 d7     Invalid Opcode - NOP #$d7
            .hex 04 18         ; $c094: 04 18     Invalid Opcode - NOP $18
            asl $fe            ; $c096: 06 fe     
__c098:     iny                ; $c098: c8        
            ldy __e804,x       ; $c099: bc 04 e8  
            ora #$fe           ; $c09c: 09 fe     
            jsr $049e          ; $c09e: 20 9e 04  
            clc                ; $c0a1: 18        
            ora #$fe           ; $c0a2: 09 fe     
            iny                ; $c0a4: c8        
            .hex 80 04         ; $c0a5: 80 04     Invalid Opcode - NOP #$04
            inx                ; $c0a7: e8        
            ora #$fe           ; $c0a8: 09 fe     
            jsr $0462          ; $c0aa: 20 62 04  
            clc                ; $c0ad: 18        
            ora #$fe           ; $c0ae: 09 fe     
            iny                ; $c0b0: c8        
            .hex 44 04         ; $c0b1: 44 04     Invalid Opcode - NOP $04
            inx                ; $c0b3: e8        
            asl $fe            ; $c0b4: 06 fe     
            .hex 80 28         ; $c0b6: 80 28     Invalid Opcode - NOP #$28
            .hex 04 00         ; $c0b8: 04 00     Invalid Opcode - NOP $00
            ora ($fe,x)        ; $c0ba: 01 fe     
            ldy $809e,x        ; $c0bc: bc 9e 80  
            .hex 62            ; $c0bf: 62        Invalid Opcode - KIL 
            .hex 44 28         ; $c0c0: 44 28     Invalid Opcode - NOP $28
            .hex ff 00 00      ; $c0c2: ff 00 00  Bad Addr Mode - ISC $0000,x
            .hex 80 00         ; $c0c5: 80 00     Invalid Opcode - NOP #$00
__c0c7:     brk                ; $c0c7: 00        
            brk                ; $c0c8: 00        
            clc                ; $c0c9: 18        
            brk                ; $c0ca: 00        
            brk                ; $c0cb: 00        
            brk                ; $c0cc: 00        
__c0cd:     bpl __c0cf         ; $c0cd: 10 00     
__c0cf:     cpx #$bc           ; $c0cf: e0 bc     
            brk                ; $c0d1: 00        
            bpl __c072         ; $c0d2: 10 9e     
            brk                ; $c0d4: 00        
            cpx #$80           ; $c0d5: e0 80     
            brk                ; $c0d7: 00        
            bpl __c13c         ; $c0d8: 10 62     
            brk                ; $c0da: 00        
            cpx #$44           ; $c0db: e0 44     
            brk                ; $c0dd: 00        
            .hex fe 00 00      ; $c0de: fe 00 00  Bad Addr Mode - INC $0000,x
            bpl __c0e6         ; $c0e1: 10 03     
            iny                ; $c0e3: c8        
            .hex bc 08         ; $c0e4: bc 08     Suspected data
__c0e6:     iny                ; $c0e6: c8        
            .hex 80 04         ; $c0e7: 80 04     Invalid Opcode - NOP #$04
            clv                ; $c0e9: b8        
            .hex 74 10         ; $c0ea: 74 10     Invalid Opcode - NOP $10,x
            pla                ; $c0ec: 68        
            cli                ; $c0ed: 58        
            .hex 14 c8         ; $c0ee: 14 c8     Invalid Opcode - NOP $c8,x
            .hex 44 04         ; $c0f0: 44 04     Invalid Opcode - NOP $04
            rts                ; $c0f2: 60        

;-------------------------------------------------------------------------------
            .hex cf 0c 70      ; $c0f3: cf 0c 70  Invalid Opcode - DCP $700c
            .hex 9b            ; $c0f6: 9b        Invalid Opcode - TAS 
            brk                ; $c0f7: 00        
            bmi __c098         ; $c0f8: 30 9e     
            .hex 04 50         ; $c0fa: 04 50     Invalid Opcode - NOP $50
            sta $08            ; $c0fc: 85 08     
            .hex 80 7d         ; $c0fe: 80 7d     Invalid Opcode - NOP #$7d
            brk                ; $c100: 00        
            bmi __c165         ; $c101: 30 62     
            .hex 04 58         ; $c103: 04 58     Invalid Opcode - NOP $58
            rts                ; $c105: 60        

;-------------------------------------------------------------------------------
            brk                ; $c106: 00        
            bcc __c131         ; $c107: 90 28     
            clc                ; $c109: 18        
            .hex fe 00 00      ; $c10a: fe 00 00  Bad Addr Mode - INC $0000,x
            php                ; $c10d: 08        
            .hex 1d 00 00      ; $c10e: 1d 00 00  Bad Addr Mode - ORA $0000,x
            php                ; $c111: 08        
            .hex 17 00         ; $c112: 17 00     Invalid Opcode - SLO $00,x
            brk                ; $c114: 00        
            php                ; $c115: 08        
            clc                ; $c116: 18        
            brk                ; $c117: 00        
            brk                ; $c118: 00        
            php                ; $c119: 08        
            ora #$00           ; $c11a: 09 00     
            brk                ; $c11c: 00        
            php                ; $c11d: 08        
            .hex 0b 00         ; $c11e: 0b 00     Invalid Opcode - ANC #$00
            brk                ; $c120: 00        
            php                ; $c121: 08        
            .hex 07 00         ; $c122: 07 00     Invalid Opcode - SLO $00
            brk                ; $c124: 00        
            php                ; $c125: 08        
            ora $bcc8,y        ; $c126: 19 c8 bc  
            brk                ; $c129: 00        
            bvs __c0c7         ; $c12a: 70 9b     
            brk                ; $c12c: 00        
            bmi __c0cd         ; $c12d: 30 9e     
            brk                ; $c12f: 00        
            iny                ; $c130: c8        
__c131:     .hex 80 00         ; $c131: 80 00     Invalid Opcode - NOP #$00
            .hex 80 7d         ; $c133: 80 7d     Invalid Opcode - NOP #$7d
            brk                ; $c135: 00        
            bmi __c19a         ; $c136: 30 62     
            brk                ; $c138: 00        
            cli                ; $c139: 58        
            rts                ; $c13a: 60        

;-------------------------------------------------------------------------------
            brk                ; $c13b: 00        
__c13c:     iny                ; $c13c: c8        
            .hex 44 00         ; $c13d: 44 00     Invalid Opcode - NOP $00
            bcc __c169         ; $c13f: 90 28     
            brk                ; $c141: 00        
            .hex fe 00 00      ; $c142: fe 00 00  Bad Addr Mode - INC $0000,x
            php                ; $c145: 08        
            .hex 0d            ; $c146: 0d        Suspected data
__c147:     bit $24            ; $c147: 24 24     
            .hex 54 54         ; $c149: 54 54     Invalid Opcode - NOP $54,x
            rts                ; $c14b: 60        

;-------------------------------------------------------------------------------
            rts                ; $c14c: 60        

;-------------------------------------------------------------------------------
            .hex 64 64         ; $c14d: 64 64     Invalid Opcode - NOP $64
            rts                ; $c14f: 60        

;-------------------------------------------------------------------------------
            rts                ; $c150: 60        

;-------------------------------------------------------------------------------
            bit $24            ; $c151: 24 24     
            pla                ; $c153: 68        
            pla                ; $c154: 68        
            pla                ; $c155: 68        
            pla                ; $c156: 68        
            pla                ; $c157: 68        
            pla                ; $c158: 68        
__c159:     bit $24            ; $c159: 24 24     
            bit $54            ; $c15b: 24 54     
            .hex 54 54         ; $c15d: 54 54     Invalid Opcode - NOP $54,x
            brk                ; $c15f: 00        
            brk                ; $c160: 00        
            rts                ; $c161: 60        

;-------------------------------------------------------------------------------
            .hex b7 00         ; $c162: b7 00     Invalid Opcode - LAX $00,y
            .hex 50            ; $c164: 50        Suspected data
__c165:     .hex 7b 00 b8      ; $c165: 7b 00 b8  Invalid Opcode - RRA $b800,y
            .hex 5c            ; $c168: 5c        Suspected data
__c169:     brk                ; $c169: 00        
            pla                ; $c16a: 68        
            rti                ; $c16b: 40        

;-------------------------------------------------------------------------------
            brk                ; $c16c: 00        
            .hex fe 00 00      ; $c16d: fe 00 00  Bad Addr Mode - INC $0000,x
            php                ; $c170: 08        
            clc                ; $c171: 18        
__c172:     dex                ; $c172: ca        
__c173:     .hex a7 8e         ; $c173: a7 8e     Invalid Opcode - LAX $8e
            .hex 6b 51         ; $c175: 6b 51     Invalid Opcode - ARR #$51
__c177:     .hex 5c 2c 4c      ; $c177: 5c 2c 4c  Invalid Opcode - NOP $4c2c,x
            .hex 2c 64         ; $c17a: 2c 64     Suspected data
__c17c:     dec $aa            ; $c17c: c6 aa     
            sty $4d6d          ; $c17e: 8c 6d 4d  
__c181:     cpy $6c            ; $c181: c4 6c     
            .hex 7c 54 c4      ; $c183: 7c 54 c4  Invalid Opcode - NOP __c454,x
            php                ; $c186: 08        
            ora ($0a),y        ; $c187: 11 0a     
            ora ($08),y        ; $c189: 11 08     
__c18b:     bpl __c197         ; $c18b: 10 0a     
            ora ($08),y        ; $c18d: 11 08     
            .hex 0f 0a 11      ; $c18f: 0f 0a 11  Invalid Opcode - SLO $110a
            ora $01            ; $c192: 05 01     
            .hex 0c 09         ; $c194: 0c 09     Suspected data
__c196:     .hex 05            ; $c196: 05        Suspected data
__c197:     .hex 05            ; $c197: 05        Suspected data
__c198:     asl                ; $c198: 0a        
            asl                ; $c199: 0a        
__c19a:     php                ; $c19a: 08        
            bpl __c1a5         ; $c19b: 10 08     
            bpl __c1a3         ; $c19d: 10 04     
            .hex 04 0c         ; $c19f: 04 0c     Invalid Opcode - NOP $0c
            .hex 0d            ; $c1a1: 0d        Suspected data
__c1a2:     .hex 0c            ; $c1a2: 0c        Suspected data
__c1a3:     .hex 14 1c         ; $c1a3: 14 1c     Invalid Opcode - NOP $1c,x
__c1a5:     bpl __c1bf         ; $c1a5: 10 18     
            .hex 20            ; $c1a7: 20        Suspected data
__c1a8:     .hex 03 05         ; $c1a8: 03 05     Invalid Opcode - SLO ($05,x)
            .hex 02            ; $c1aa: 02        Invalid Opcode - KIL 
            .hex 03 00         ; $c1ab: 03 00     Invalid Opcode - SLO ($00,x)
            brk                ; $c1ad: 00        
            .hex 03 04         ; $c1ae: 03 04     Invalid Opcode - SLO ($04,x)
            brk                ; $c1b0: 00        
            brk                ; $c1b1: 00        
            php                ; $c1b2: 08        
            php                ; $c1b3: 08        
__c1b4:     bpl __c196         ; $c1b4: 10 e0     
            bpl __c198         ; $c1b6: 10 e0     
            .hex 0c e0 08      ; $c1b8: 0c e0 08  Invalid Opcode - NOP $08e0
            inx                ; $c1bb: e8        
__c1bc:     ora ($02,x)        ; $c1bc: 01 02     
            .hex 04            ; $c1be: 04        Suspected data
__c1bf:     php                ; $c1bf: 08        
            bpl __c1e2         ; $c1c0: 10 20     
            rti                ; $c1c2: 40        

;-------------------------------------------------------------------------------
            .hex 80            ; $c1c3: 80        Suspected data
__c1c4:     .hex 13 30         ; $c1c4: 13 30     Invalid Opcode - SLO ($30),y
            pha                ; $c1c6: 48        
            rts                ; $c1c7: 60        

;-------------------------------------------------------------------------------
            sei                ; $c1c8: 78        
            bcc __c173         ; $c1c9: 90 a8     
            cpy #$e0           ; $c1cb: c0 e0     
__c1cd:     .hex 13 db         ; $c1cd: 13 db     Invalid Opcode - SLO ($db),y
__c1cf:     jmp $886a          ; $c1cf: 4c 6a 88  

;-------------------------------------------------------------------------------
            ldx $c5            ; $c1d2: a6 c5     
            inc $6b53,x        ; $c1d4: fe 53 6b  
            .hex 8f a7 ca      ; $c1d7: 8f a7 ca  Invalid Opcode - SAX __caa7
            inc $6e52,x        ; $c1da: fe 52 6e  
            sty __c5ac         ; $c1dd: 8c ac c5  
            .hex fe 52         ; $c1e0: fe 52     Suspected data
__c1e2:     jmp ($a88e)        ; $c1e2: 6c 8e a8  

;-------------------------------------------------------------------------------
            dex                ; $c1e5: ca        
            inc $0600,x        ; $c1e6: fe 00 06  
            php                ; $c1e9: 08        
            php                ; $c1ea: 08        
__c1eb:     .hex 19            ; $c1eb: 19        Suspected data
__c1ec:     bmi __c222         ; $c1ec: 30 34     
            bmi __c224         ; $c1ee: 30 34     
            bmi __c226         ; $c1f0: 30 34     
            sec                ; $c1f2: 38        
            .hex 3c 3c 3c      ; $c1f3: 3c 3c 3c  Invalid Opcode - NOP $3c3c,x
__c1f6:     .hex 02            ; $c1f6: 02        Invalid Opcode - KIL 
            .hex 04 02         ; $c1f7: 04 02     Invalid Opcode - NOP $02
            .hex 04            ; $c1f9: 04        Suspected data
__c1fa:     .hex 07 05         ; $c1fa: 07 05     Invalid Opcode - SLO $05
            .hex 07            ; $c1fc: 07        Suspected data
__c1fd:     ora #$03           ; $c1fd: 09 03     
__c1ff:     brk                ; $c1ff: 00        
            brk                ; $c200: 00        
            .hex 04 08         ; $c201: 04 08     Invalid Opcode - NOP $08
            ora ($02,x)        ; $c203: 01 02     
            .hex 03 04         ; $c205: 03 04     Invalid Opcode - SLO ($04,x)
__c207:     bvc __c269         ; $c207: 50 60     
            bvs __c18b         ; $c209: 70 80     
            bcc __c21b         ; $c20b: 90 0e     
            cld                ; $c20d: d8        
            clc                ; $c20e: 18        
            asl $04c8          ; $c20f: 0e c8 04  
            stx $c8            ; $c212: 86 c8     
            .hex 04 a6         ; $c214: 04 a6     Invalid Opcode - NOP $a6
            cpy #$00           ; $c216: c0 00     
            ldx $00b8,y        ; $c218: be b8 00  
__c21b:     dec $b0,x          ; $c21b: d6 b0     
            .hex 04 4e         ; $c21d: 04 4e     Invalid Opcode - NOP $4e
            bcs __c225         ; $c21f: b0 04     
            .hex 0e            ; $c221: 0e        Suspected data
__c222:     ldy #$04           ; $c222: a0 04     
__c224:     .hex de            ; $c224: de        Suspected data
__c225:     .hex a0            ; $c225: a0        Suspected data
__c226:     brk                ; $c226: 00        
            dec $98            ; $c227: c6 98     
            brk                ; $c229: 00        
            .hex ae 90 00      ; $c22a: ae 90 00  Bad Addr Mode - LDX $0090
            stx $88,y          ; $c22d: 96 88     
            .hex 14 c6         ; $c22f: 14 c6     Invalid Opcode - NOP $c6,x
            sei                ; $c231: 78        
            .hex 0c 0e 70      ; $c232: 0c 0e 70  Invalid Opcode - NOP $700e
            .hex 04 46         ; $c235: 04 46     Invalid Opcode - NOP $46
            bvs __c241         ; $c237: 70 08     
            stx $0468          ; $c239: 8e 68 04  
            .hex ae 60 00      ; $c23c: ae 60 00  Bad Addr Mode - LDX $0060
            dec $58            ; $c23f: c6 58     
__c241:     brk                ; $c241: 00        
            .hex de 50 00      ; $c242: de 50 00  Bad Addr Mode - DEC $0050,x
            ror $40            ; $c245: 66 40     
            bpl __c1cf         ; $c247: 10 86     
            plp                ; $c249: 28        
            brk                ; $c24a: 00        
            inc $78b0,x        ; $c24b: fe b0 78  
            rts                ; $c24e: 60        

;-------------------------------------------------------------------------------
            rti                ; $c24f: 40        

;-------------------------------------------------------------------------------
            plp                ; $c250: 28        
            .hex ff 00 00      ; $c251: ff 00 00  Bad Addr Mode - ISC $0000,x
            .hex 14 00         ; $c254: 14 00     Invalid Opcode - NOP $00,x
            brk                ; $c256: 00        
            brk                ; $c257: 00        
            .hex 1c 00 00      ; $c258: 1c 00 00  Bad Addr Mode - NOP $0000,x
            brk                ; $c25b: 00        
            bit $00            ; $c25c: 24 00     
            brk                ; $c25e: 00        
            brk                ; $c25f: 00        
            .hex 2c 00 00      ; $c260: 2c 00 00  Bad Addr Mode - BIT $0000
            brk                ; $c263: 00        
            .hex 54 00         ; $c264: 54 00     Invalid Opcode - NOP $00,x
            brk                ; $c266: 00        
            brk                ; $c267: 00        
            .hex 12            ; $c268: 12        Invalid Opcode - KIL 
__c269:     brk                ; $c269: 00        
            brk                ; $c26a: 00        
            brk                ; $c26b: 00        
            cpx $00            ; $c26c: e4 00     
            clc                ; $c26e: 18        
            ldy #$0c           ; $c26f: a0 0c     
            jsr $1070          ; $c271: 20 70 10  
            bvc __c2e6         ; $c274: 50 70     
            .hex 14 60         ; $c276: 14 60     Invalid Opcode - NOP $60,x
            bvs __c28e         ; $c278: 70 14     
            tya                ; $c27a: 98        
            pla                ; $c27b: 68        
            php                ; $c27c: 08        
            iny                ; $c27d: c8        
            sei                ; $c27e: 78        
            php                ; $c27f: 08        
            cpx #$a0           ; $c280: e0 a0     
            brk                ; $c282: 00        
            cpx #$50           ; $c283: e0 50     
            .hex 0c b0 40      ; $c285: 0c b0 40  Invalid Opcode - NOP $40b0
            php                ; $c288: 08        
            bcc __c2b3         ; $c289: 90 28     
            .hex 04 fe         ; $c28b: 04 fe     Invalid Opcode - NOP $fe
            brk                ; $c28d: 00        
__c28e:     brk                ; $c28e: 00        
            php                ; $c28f: 08        
            bpl __c292         ; $c290: 10 00     
__c292:     brk                ; $c292: 00        
            php                ; $c293: 08        
            clc                ; $c294: 18        
            brk                ; $c295: 00        
            brk                ; $c296: 00        
            php                ; $c297: 08        
            jsr $0000          ; $c298: 20 00 00  
            php                ; $c29b: 08        
            plp                ; $c29c: 28        
            brk                ; $c29d: 00        
            brk                ; $c29e: 00        
            php                ; $c29f: 08        
            bmi __c2a2         ; $c2a0: 30 00     
__c2a2:     brk                ; $c2a2: 00        
            php                ; $c2a3: 08        
            rti                ; $c2a4: 40        

;-------------------------------------------------------------------------------
            clc                ; $c2a5: 18        
            ldy #$00           ; $c2a6: a0 00     
            jsr $0070          ; $c2a8: 20 70 00  
            bvc __c31d         ; $c2ab: 50 70     
__c2ad:     brk                ; $c2ad: 00        
            rts                ; $c2ae: 60        

;-------------------------------------------------------------------------------
            bvs __c2b1         ; $c2af: 70 00     
__c2b1:     tya                ; $c2b1: 98        
__c2b2:     pla                ; $c2b2: 68        
__c2b3:     brk                ; $c2b3: 00        
            iny                ; $c2b4: c8        
            sei                ; $c2b5: 78        
            brk                ; $c2b6: 00        
            cpx #$a0           ; $c2b7: e0 a0     
            brk                ; $c2b9: 00        
            cpx #$50           ; $c2ba: e0 50     
            brk                ; $c2bc: 00        
            bcs __c2ff         ; $c2bd: b0 40     
            brk                ; $c2bf: 00        
            bcc __c2ea         ; $c2c0: 90 28     
            brk                ; $c2c2: 00        
            inc $0104,x        ; $c2c3: fe 04 01  
            .hex 1b 0e 00      ; $c2c6: 1b 0e 00  Invalid Opcode - SLO $000e,y
            ora ($12,x)        ; $c2c9: 01 12     
            .hex 01            ; $c2cb: 01        Suspected data
__c2cc:     bmi __c306         ; $c2cc: 30 38     
__c2ce:     rti                ; $c2ce: 40        

;-------------------------------------------------------------------------------
            pha                ; $c2cf: 48        
__c2d0:     bvc __c32a         ; $c2d0: 50 58     
__c2d2:     brk                ; $c2d2: 00        
            brk                ; $c2d3: 00        
            ora #$15           ; $c2d4: 09 15     
            clc                ; $c2d6: 18        
            brk                ; $c2d7: 00        
            jmp $035f          ; $c2d8: 4c 5f 03  

;-------------------------------------------------------------------------------
            .hex 5c 5f 03      ; $c2db: 5c 5f 03  Invalid Opcode - NOP $035f,x
            cpy $67            ; $c2de: c4 67     
            .hex 03 4c         ; $c2e0: 03 4c     Invalid Opcode - SLO ($4c,x)
            .hex 9f 13 5c      ; $c2e2: 9f 13 5c  Invalid Opcode - AHX $5c13,y
            .hex 9f            ; $c2e5: 9f        Suspected data
__c2e6:     .hex 13 c4         ; $c2e6: 13 c4     Invalid Opcode - SLO ($c4),y
            .hex 87 13         ; $c2e8: 87 13     Invalid Opcode - SAX $13
__c2ea:     .hex dc 3f 03      ; $c2ea: dc 3f 03  Invalid Opcode - NOP $033f,x
            .hex dc 67 13      ; $c2ed: dc 67 13  Invalid Opcode - NOP $1367,x
            asl $d8            ; $c2f0: 06 d8     
            brk                ; $c2f2: 00        
            asl $b8            ; $c2f3: 06 b8     
            brk                ; $c2f5: 00        
            asl $90,x          ; $c2f6: 16 90     
            .hex 04 1e         ; $c2f8: 04 1e     Invalid Opcode - NOP $1e
            pla                ; $c2fa: 68        
            php                ; $c2fb: 08        
            rol $40            ; $c2fc: 26 40     
            .hex 0c            ; $c2fe: 0c        Suspected data
__c2ff:     inc $90b8,x        ; $c2ff: fe b8 90  
            pla                ; $c302: 68        
__c303:     rti                ; $c303: 40        

;-------------------------------------------------------------------------------
            plp                ; $c304: 28        
            .hex ff            ; $c305: ff        Suspected data
__c306:     brk                ; $c306: 00        
            brk                ; $c307: 00        
            sbc $00,x          ; $c308: f5 00     
            brk                ; $c30a: 00        
            brk                ; $c30b: 00        
            cmp $00,x          ; $c30c: d5 00     
            brk                ; $c30e: 00        
            brk                ; $c30f: 00        
            cmp $00            ; $c310: c5 00     
            brk                ; $c312: 00        
            brk                ; $c313: 00        
            lda $00,x          ; $c314: b5 00     
            bpl __c2d0         ; $c316: 10 b8     
            brk                ; $c318: 00        
            sei                ; $c319: 78        
            clv                ; $c31a: b8        
            brk                ; $c31b: 00        
            inx                ; $c31c: e8        
__c31d:     clv                ; $c31d: b8        
            brk                ; $c31e: 00        
            clc                ; $c31f: 18        
            bcc __c326         ; $c320: 90 04     
            rts                ; $c322: 60        

;-------------------------------------------------------------------------------
            bcc __c329         ; $c323: 90 04     
            tya                ; $c325: 98        
__c326:     bcc __c32c         ; $c326: 90 04     
            .hex e0            ; $c328: e0        Suspected data
__c329:     .hex 90            ; $c329: 90        Suspected data
__c32a:     .hex 04 20         ; $c32a: 04 20     Invalid Opcode - NOP $20
__c32c:     pla                ; $c32c: 68        
            .hex 04 80         ; $c32d: 04 80     Invalid Opcode - NOP $80
            pla                ; $c32f: 68        
            .hex 04 d8         ; $c330: 04 d8     Invalid Opcode - NOP $d8
            pla                ; $c332: 68        
            .hex 04 28         ; $c333: 04 28     Invalid Opcode - NOP $28
            rti                ; $c335: 40        

;-------------------------------------------------------------------------------
            .hex 04 48         ; $c336: 04 48     Invalid Opcode - NOP $48
            rti                ; $c338: 40        

;-------------------------------------------------------------------------------
            .hex 04 b0         ; $c339: 04 b0     Invalid Opcode - NOP $b0
            rti                ; $c33b: 40        

;-------------------------------------------------------------------------------
            .hex 04 d0         ; $c33c: 04 d0     Invalid Opcode - NOP $d0
            rti                ; $c33e: 40        

;-------------------------------------------------------------------------------
            .hex 04 fe         ; $c33f: 04 fe     Invalid Opcode - NOP $fe
            brk                ; $c341: 00        
            brk                ; $c342: 00        
            php                ; $c343: 08        
            jsr $0000          ; $c344: 20 00 00  
            php                ; $c347: 08        
            plp                ; $c348: 28        
            bpl __c303         ; $c349: 10 b8     
            brk                ; $c34b: 00        
            sei                ; $c34c: 78        
            clv                ; $c34d: b8        
            brk                ; $c34e: 00        
            inx                ; $c34f: e8        
            clv                ; $c350: b8        
            brk                ; $c351: 00        
            clc                ; $c352: 18        
            bcc __c355         ; $c353: 90 00     
__c355:     rts                ; $c355: 60        

;-------------------------------------------------------------------------------
            bcc __c358         ; $c356: 90 00     
__c358:     tya                ; $c358: 98        
            bcc __c35b         ; $c359: 90 00     
__c35b:     cpx #$90           ; $c35b: e0 90     
            brk                ; $c35d: 00        
            jsr $0068          ; $c35e: 20 68 00  
            .hex 80 68         ; $c361: 80 68     Invalid Opcode - NOP #$68
            brk                ; $c363: 00        
            cld                ; $c364: d8        
            pla                ; $c365: 68        
            brk                ; $c366: 00        
            plp                ; $c367: 28        
            rti                ; $c368: 40        

;-------------------------------------------------------------------------------
            brk                ; $c369: 00        
            pha                ; $c36a: 48        
            rti                ; $c36b: 40        

;-------------------------------------------------------------------------------
            brk                ; $c36c: 00        
            bcs __c3af         ; $c36d: b0 40     
            brk                ; $c36f: 00        
            bne __c3b2         ; $c370: d0 40     
            brk                ; $c372: 00        
            inc $0900,x        ; $c373: fe 00 09  
            asl $4833,x        ; $c376: 1e 33 48  
            .hex 54 0c         ; $c379: 54 0c     Invalid Opcode - NOP $0c,x
            .hex a7 03         ; $c37b: a7 03     Invalid Opcode - LAX $03
            .hex 74 a7         ; $c37d: 74 a7     Invalid Opcode - NOP $a7,x
            .hex 03 e4         ; $c37f: 03 e4     Invalid Opcode - SLO ($e4,x)
            .hex a7 03         ; $c381: a7 03     Invalid Opcode - LAX $03
            .hex 0c c7 13      ; $c383: 0c c7 13  Invalid Opcode - NOP $13c7
            .hex 74 c7         ; $c386: 74 c7     Invalid Opcode - NOP $c7,x
            .hex 13 e4         ; $c388: 13 e4     Invalid Opcode - SLO ($e4),y
            .hex c7 13         ; $c38a: c7 13     Invalid Opcode - DCP $13
            .hex 14 7f         ; $c38c: 14 7f     Invalid Opcode - NOP $7f,x
            .hex 03 5c         ; $c38e: 03 5c     Invalid Opcode - SLO ($5c,x)
            .hex 7f 03 94      ; $c390: 7f 03 94  Invalid Opcode - RRA $9403,x
            .hex 7f 03 dc      ; $c393: 7f 03 dc  Invalid Opcode - RRA __dc03,x
            .hex 7f 03 1c      ; $c396: 7f 03 1c  Invalid Opcode - RRA $1c03,x
            .hex 57            ; $c399: 57        Suspected data
__c39a:     .hex 03 7c         ; $c39a: 03 7c     Invalid Opcode - SLO ($7c,x)
__c39c:     .hex 57 03         ; $c39c: 57 03     Invalid Opcode - SRE $03,x
            .hex d4 57         ; $c39e: d4 57     Invalid Opcode - NOP $57,x
            .hex 03 14         ; $c3a0: 03 14     Invalid Opcode - SLO ($14,x)
            .hex a7 13         ; $c3a2: a7 13     Invalid Opcode - LAX $13
            .hex 5c a7         ; $c3a4: 5c a7     Suspected data
__c3a6:     .hex 13 94         ; $c3a6: 13 94     Invalid Opcode - SLO ($94),y
            .hex a7 13         ; $c3a8: a7 13     Invalid Opcode - LAX $13
            .hex dc a7 13      ; $c3aa: dc a7 13  Invalid Opcode - NOP $13a7,x
            bit $2f            ; $c3ad: 24 2f     
__c3af:     .hex 03 44         ; $c3af: 03 44     Invalid Opcode - SLO ($44,x)
            .hex 2f            ; $c3b1: 2f        Suspected data
__c3b2:     .hex 03 ac         ; $c3b2: 03 ac     Invalid Opcode - SLO ($ac,x)
            .hex 2f 03 cc      ; $c3b4: 2f 03 cc  Invalid Opcode - RLA __cc03
            .hex 2f 03 1c      ; $c3b7: 2f 03 1c  Invalid Opcode - RLA $1c03
            .hex 7f 13 7c      ; $c3ba: 7f 13 7c  Invalid Opcode - RRA $7c13,x
            .hex 7f 13 d4      ; $c3bd: 7f 13 d4  Invalid Opcode - RRA __d413,x
            .hex 7f 13 24      ; $c3c0: 7f 13 24  Invalid Opcode - RRA $2413,x
            .hex 57 13         ; $c3c3: 57 13     Invalid Opcode - SRE $13,x
            .hex 44 57         ; $c3c5: 44 57     Invalid Opcode - NOP $57
            .hex 13 ac         ; $c3c7: 13 ac     Invalid Opcode - SLO ($ac),y
            .hex 57 13         ; $c3c9: 57 13     Invalid Opcode - SRE $13,x
            cpy $1357          ; $c3cb: cc 57 13  
__c3ce:     php                ; $c3ce: 08        
__c3cf:     .hex c7 10         ; $c3cf: c7 10     Invalid Opcode - DCP $10
            .hex a7 18         ; $c3d1: a7 18     Invalid Opcode - LAX $18
            .hex 7f 20 57      ; $c3d3: 7f 20 57  Invalid Opcode - RRA $5720,x
            inx                ; $c3d6: e8        
            .hex c7 e0         ; $c3d7: c7 e0     Invalid Opcode - DCP $e0
            .hex a7 d8         ; $c3d9: a7 d8     Invalid Opcode - LAX $d8
__c3db:     .hex 7f d0 57      ; $c3db: 7f d0 57  Invalid Opcode - RRA $57d0,x
__c3de:     .hex 34            ; $c3de: 34        Suspected data
__c3df:     ldy $bc44          ; $c3df: ac 44 bc  
__c3e2:     ora $03            ; $c3e2: 05 03     
__c3e4:     .hex 0d            ; $c3e4: 0d        Suspected data
__c3e5:     .hex 0b            ; $c3e5: 0b        Suspected data
__c3e6:     .hex d4 0c         ; $c3e6: d4 0c     Invalid Opcode - NOP $0c,x
__c3e8:     cpx $0c            ; $c3e8: e4 0c     
__c3ea:     .hex 5d 4b         ; $c3ea: 5d 4b     Suspected data
__c3ec:     .hex cd c3         ; $c3ec: cd c3     Suspected data
__c3ee:     .hex 5d 43         ; $c3ee: 5d 43     Suspected data
__c3f0:     sbc $c3            ; $c3f0: e5 c3     
__c3f2:     .hex ed 03         ; $c3f2: ed 03     Suspected data
__c3f4:     .hex 24            ; $c3f4: 24        Suspected data
__c3f5:     eor #$77           ; $c3f5: 49 77     
            .hex 77            ; $c3f7: 77        Suspected data
__c3f8:     .hex 77            ; $c3f8: 77        Suspected data
__c3f9:     .hex 77 ff         ; $c3f9: 77 ff     Invalid Opcode - RRA $ff,x
            .hex ff            ; $c3fb: ff        Suspected data
__c3fc:     .hex 0b 0c         ; $c3fc: 0b 0c     Invalid Opcode - ANC #$0c
            ora $1615          ; $c3fe: 0d 15 16  
            .hex 17 18         ; $c401: 17 18     Invalid Opcode - SLO $18,x
            ora $1e1a,y        ; $c403: 19 1a 1e  
            .hex 1f            ; $c406: 1f        Suspected data
__c407:     .hex ff ff ff      ; $c407: ff ff ff  Invalid Opcode - ISC $ffff,x
            ora ($01,x)        ; $c40a: 01 01     
            ora ($01,x)        ; $c40c: 01 01     
            .hex ff ff 01      ; $c40e: ff ff 01  Invalid Opcode - ISC $01ff,x
            .hex 01            ; $c411: 01        Suspected data
__c412:     cpx $e3            ; $c412: e4 e3     
            .hex e2 d8         ; $c414: e2 d8     Invalid Opcode - NOP #$d8
            .hex d7 d6         ; $c416: d7 d6     Invalid Opcode - DCP $d6,x
            cmp $d4,x          ; $c418: d5 d4     
            .hex d3 d0         ; $c41a: d3 d0     Invalid Opcode - DCP ($d0),y
            .hex cf            ; $c41c: cf        Suspected data
__c41d:     pha                ; $c41d: 48        
            sty $c0            ; $c41e: 84 c0     
__c420:     bvc __c3af         ; $c420: 50 8d     
            .hex c7            ; $c422: c7        Suspected data
__c423:     .hex 20            ; $c423: 20        Suspected data
__c424:     cpy #$78           ; $c424: c0 78     
            rts                ; $c426: 60        

;-------------------------------------------------------------------------------
            plp                ; $c427: 28        
            .hex 44 6b         ; $c428: 44 6b     Invalid Opcode - NOP $6b
            .hex 20            ; $c42a: 20        Suspected data
__c42b:     .hex 33            ; $c42b: 33        Suspected data
__c42c:     cpy $37            ; $c42c: c4 37     
            cpy $3b            ; $c42e: c4 3b     
            cpy $3f            ; $c430: c4 3f     
            cpy $00            ; $c432: c4 00     
            brk                ; $c434: 00        
            bpl __c43f         ; $c435: 10 08     
            brk                ; $c437: 00        
            brk                ; $c438: 00        
            bpl __c443         ; $c439: 10 08     
            brk                ; $c43b: 00        
            brk                ; $c43c: 00        
            rts                ; $c43d: 60        

;-------------------------------------------------------------------------------
            .hex 10            ; $c43e: 10        Suspected data
__c43f:     brk                ; $c43f: 00        
            brk                ; $c440: 00        
            rol                ; $c441: 2a        
            .hex 20            ; $c442: 20        Suspected data
__c443:     bcs __c3e5         ; $c443: b0 a0     
            sei                ; $c445: 78        
            pla                ; $c446: 68        
            pla                ; $c447: 68        
__c448:     dey                ; $c448: 88        
            dey                ; $c449: 88        
            dey                ; $c44a: 88        
            dey                ; $c44b: 88        
            dey                ; $c44c: 88        
__c44d:     pha                ; $c44d: 48        
            sec                ; $c44e: 38        
            plp                ; $c44f: 28        
            clc                ; $c450: 18        
            clc                ; $c451: 18        
            .hex bb bb 5e      ; $c452: bb bb 5e  Invalid Opcode - LAS $5ebb,y
            .hex 2f 13         ; $c455: 2f 13     Suspected data
__c457:     dey                ; $c457: 88        
            sei                ; $c458: 78        
            .hex 64 56         ; $c459: 64 56     Invalid Opcode - NOP $56
            .hex 49            ; $c45b: 49        Suspected data
__c45c:     dey                ; $c45c: 88        
            dey                ; $c45d: 88        
            bit $55            ; $c45e: 24 55     
            .hex 55            ; $c460: 55        Suspected data
__c461:     dey                ; $c461: 88        
            dey                ; $c462: 88        
            eor #$55           ; $c463: 49 55     
            .hex 55            ; $c465: 55        Suspected data
__c466:     rti                ; $c466: 40        

;-------------------------------------------------------------------------------
            jsr $0810          ; $c467: 20 10 08  
            .hex 01            ; $c46a: 01        Suspected data
__c46b:     .hex 8c            ; $c46b: 8c        Suspected data
__c46c:     cpy #$0c           ; $c46c: c0 0c     
            .hex c2 0c         ; $c46e: c2 0c     Invalid Opcode - NOP #$0c
            .hex c2 f0         ; $c470: c2 f0     Invalid Opcode - NOP #$f0
            .hex c2            ; $c472: c2        Suspected data
__c473:     .hex c3            ; $c473: c3        Suspected data
__c474:     cpy #$0c           ; $c474: c0 0c     
            .hex c2 52         ; $c476: c2 52     Invalid Opcode - NOP #$52
            .hex c2 06         ; $c478: c2 06     Invalid Opcode - NOP #$06
            .hex c3            ; $c47a: c3        Suspected data
__c47b:     .hex e3            ; $c47b: e3        Suspected data
__c47c:     cpy #$0c           ; $c47c: c0 0c     
            .hex c2 6e         ; $c47e: c2 6e     Invalid Opcode - NOP #$6e
            .hex c2 16         ; $c480: c2 16     Invalid Opcode - NOP #$16
            .hex c3            ; $c482: c3        Suspected data
__c483:     .hex 0b            ; $c483: 0b        Suspected data
__c484:     cmp ($0c,x)        ; $c484: c1 0c     
            .hex c2 8d         ; $c486: c2 8d     Invalid Opcode - NOP #$8d
            .hex c2 41         ; $c488: c2 41     Invalid Opcode - NOP #$41
            .hex c3            ; $c48a: c3        Suspected data
__c48b:     .hex 27            ; $c48b: 27        Suspected data
__c48c:     cmp ($0c,x)        ; $c48c: c1 0c     
            .hex c2 a5         ; $c48e: c2 a5     Invalid Opcode - NOP #$a5
            .hex c2 49         ; $c490: c2 49     Invalid Opcode - NOP #$49
            .hex c3            ; $c492: c3        Suspected data
__c493:     .hex bc            ; $c493: bc        Suspected data
__c494:     cpy #$0c           ; $c494: c0 0c     
            .hex c2 4c         ; $c496: c2 4c     Invalid Opcode - NOP #$4c
            .hex c2 00         ; $c498: c2 00     Invalid Opcode - NOP #$00
            .hex c3            ; $c49a: c3        Suspected data
__c49b:     .hex 0c            ; $c49b: 0c        Suspected data
__c49c:     .hex c2 d2         ; $c49c: c2 d2     Invalid Opcode - NOP #$d2
            .hex c2 74         ; $c49e: c2 74     Invalid Opcode - NOP #$74
            .hex c3            ; $c4a0: c3        Suspected data
__c4a1:     .hex 0c            ; $c4a1: 0c        Suspected data
__c4a2:     .hex c2 d8         ; $c4a2: c2 d8     Invalid Opcode - NOP #$d8
            .hex c2 7a         ; $c4a4: c2 7a     Invalid Opcode - NOP #$7a
            .hex c3            ; $c4a6: c3        Suspected data
__c4a7:     .hex 5b            ; $c4a7: 5b        Suspected data
__c4a8:     sbc $d9,x          ; $c4a8: f5 d9     
            sed                ; $c4aa: f8        
            cmp $1cf7          ; $c4ab: cd f7 1c  
            .hex f7 d9         ; $c4ae: f7 d9     Invalid Opcode - ISC $d9,x
            sed                ; $c4b0: f8        
            .hex 1b fa 00      ; $c4b1: 1b fa 00  Invalid Opcode - SLO $00fa,y
            brk                ; $c4b4: 00        
            ora ($06,x)        ; $c4b5: 01 06     
            inx                ; $c4b7: e8        
            .hex 04 50         ; $c4b8: 04 50     Invalid Opcode - NOP $50
            clc                ; $c4ba: 18        
            cmp $12,x          ; $c4bb: d5 12     
            inx                ; $c4bd: e8        
__c4be:     brk                ; $c4be: 00        
            bvc __c4e1         ; $c4bf: 50 20     
            .hex db 22 f0      ; $c4c1: db 22 f0  Invalid Opcode - DCP __f022,y
            brk                ; $c4c4: 00        
            brk                ; $c4c5: 00        
            brk                ; $c4c6: 00        
            .hex 03            ; $c4c7: 03        Suspected data
__c4c8:     bit $0430          ; $c4c8: 2c 30 04  
            jsr __f67f         ; $c4cb: 20 7f f6  
            and ($d0,x)        ; $c4ce: 21 d0     
            brk                ; $c4d0: 00        
__c4d1:     jsr __f646         ; $c4d1: 20 46 f6  
            and ($d8,x)        ; $c4d4: 21 d8     
            brk                ; $c4d6: 00        
            brk                ; $c4d7: 00        
            brk                ; $c4d8: 00        
            ora ($04,x)        ; $c4d9: 01 04     
            cpy #$04           ; $c4db: c0 04     
            brk                ; $c4dd: 00        
            brk                ; $c4de: 00        
            brk                ; $c4df: 00        
            .hex 04            ; $c4e0: 04        Suspected data
__c4e1:     brk                ; $c4e1: 00        
            .hex 04 30         ; $c4e2: 04 30     Invalid Opcode - NOP $30
            .hex c7 04         ; $c4e4: c7 04     Invalid Opcode - DCP $04
            .hex 22            ; $c4e6: 22        Invalid Opcode - KIL 
            brk                ; $c4e7: 00        
            brk                ; $c4e8: 00        
            brk                ; $c4e9: 00        
            brk                ; $c4ea: 00        
            .hex 02            ; $c4eb: 02        Invalid Opcode - KIL 
            php                ; $c4ec: 08        
            bpl __c4f3         ; $c4ed: 10 04     
            brk                ; $c4ef: 00        
            brk                ; $c4f0: 00        
            .hex 02            ; $c4f1: 02        Invalid Opcode - KIL 
            .hex 02            ; $c4f2: 02        Invalid Opcode - KIL 
__c4f3:     cpx #$04           ; $c4f3: e0 04     
            .hex fe 00 00      ; $c4f5: fe 00 00  Bad Addr Mode - INC $0000,x
            ora ($06,x)        ; $c4f8: 01 06     
            inx                ; $c4fa: e8        
            .hex 04 50         ; $c4fb: 04 50     Invalid Opcode - NOP $50
            clc                ; $c4fd: 18        
            cmp $12,x          ; $c4fe: d5 12     
            inx                ; $c500: e8        
            brk                ; $c501: 00        
            bvc __c524         ; $c502: 50 20     
            .hex db            ; $c504: db        Suspected data
__c505:     .hex 22            ; $c505: 22        Invalid Opcode - KIL 
            beq __c508         ; $c506: f0 00     
__c508:     brk                ; $c508: 00        
            brk                ; $c509: 00        
            .hex 03 0c         ; $c50a: 03 0c     Invalid Opcode - SLO ($0c,x)
            bmi __c512         ; $c50c: 30 04     
            bmi __c588         ; $c50e: 30 78     
            ldy #$12           ; $c510: a0 12     
__c512:     bmi __c514         ; $c512: 30 00     
__c514:     bmi __c4be         ; $c514: 30 a8     
            ldy #$12           ; $c516: a0 12     
            sec                ; $c518: 38        
            brk                ; $c519: 00        
            bmi __c565         ; $c51a: 30 49     
            ldy #$12           ; $c51c: a0 12     
            rti                ; $c51e: 40        

;-------------------------------------------------------------------------------
            brk                ; $c51f: 00        
            bvs __c592         ; $c520: 70 70     
            ldy #$12           ; $c522: a0 12     
__c524:     pha                ; $c524: 48        
            brk                ; $c525: 00        
            bvs __c4c8         ; $c526: 70 a0     
            ldy #$12           ; $c528: a0 12     
            bvc __c52c         ; $c52a: 50 00     
__c52c:     bvs __c505         ; $c52c: 70 d7     
            ldy #$12           ; $c52e: a0 12     
            cli                ; $c530: 58        
            brk                ; $c531: 00        
            brk                ; $c532: 00        
            brk                ; $c533: 00        
            .hex 23 02         ; $c534: 23 02     Invalid Opcode - RLA ($02,x)
            rti                ; $c536: 40        

;-------------------------------------------------------------------------------
            .hex 04 00         ; $c537: 04 00     Invalid Opcode - NOP $00
            brk                ; $c539: 00        
            .hex 23 02         ; $c53a: 23 02     Invalid Opcode - RLA ($02,x)
            cli                ; $c53c: 58        
            .hex 04 00         ; $c53d: 04 00     Invalid Opcode - NOP $00
            brk                ; $c53f: 00        
            brk                ; $c540: 00        
            .hex 04 00         ; $c541: 04 00     Invalid Opcode - NOP $00
            .hex 04 10         ; $c543: 04 10     Invalid Opcode - NOP $10
            .hex b7 04         ; $c545: b7 04     Invalid Opcode - LAX $04,y
            .hex 22            ; $c547: 22        Invalid Opcode - KIL 
            brk                ; $c548: 00        
            brk                ; $c549: 00        
            brk                ; $c54a: 00        
            brk                ; $c54b: 00        
            .hex 02            ; $c54c: 02        Invalid Opcode - KIL 
            php                ; $c54d: 08        
            bpl __c554         ; $c54e: 10 04     
            jmp $989f          ; $c550: 4c 9f 98  

;-------------------------------------------------------------------------------
            .hex 22            ; $c553: 22        Invalid Opcode - KIL 
__c554:     bpl __c556         ; $c554: 10 00     
__c556:     cpy $9867          ; $c556: cc 67 98  
            .hex 22            ; $c559: 22        Invalid Opcode - KIL 
            jsr $0000          ; $c55a: 20 00 00  
            brk                ; $c55d: 00        
            .hex 03 0c         ; $c55e: 03 0c     Invalid Opcode - SLO ($0c,x)
            rts                ; $c560: 60        

;-------------------------------------------------------------------------------
            .hex 04 00         ; $c561: 04 00     Invalid Opcode - NOP $00
            brk                ; $c563: 00        
            .hex 01            ; $c564: 01        Suspected data
__c565:     asl $90,x          ; $c565: 16 90     
            .hex 04 fe         ; $c567: 04 fe     Invalid Opcode - NOP $fe
            brk                ; $c569: 00        
            brk                ; $c56a: 00        
            ora ($06,x)        ; $c56b: 01 06     
            inx                ; $c56d: e8        
            .hex 04 50         ; $c56e: 04 50     Invalid Opcode - NOP $50
            clc                ; $c570: 18        
            cmp $12,x          ; $c571: d5 12     
            inx                ; $c573: e8        
            brk                ; $c574: 00        
            bvc __c597         ; $c575: 50 20     
            .hex db 22 f0      ; $c577: db 22 f0  Invalid Opcode - DCP __f022,y
            brk                ; $c57a: 00        
            brk                ; $c57b: 00        
            brk                ; $c57c: 00        
            .hex 03 04         ; $c57d: 03 04     Invalid Opcode - SLO ($04,x)
            bne __c585         ; $c57f: d0 04     
            .hex 14 6e         ; $c581: 14 6e     Invalid Opcode - NOP $6e,x
__c583:     .hex f6            ; $c583: f6        Suspected data
__c584:     .hex 21            ; $c584: 21        Suspected data
__c585:     bne __c587         ; $c585: d0 00     
__c587:     .hex 7c            ; $c587: 7c        Suspected data
__c588:     lsr $f6            ; $c588: 46 f6     
            and ($d8,x)        ; $c58a: 21 d8     
__c58c:     brk                ; $c58c: 00        
            brk                ; $c58d: 00        
            brk                ; $c58e: 00        
__c58f:     ora ($20,x)        ; $c58f: 01 20     
__c591:     .hex 50            ; $c591: 50        Suspected data
__c592:     .hex 04 00         ; $c592: 04 00     Invalid Opcode - NOP $00
            brk                ; $c594: 00        
            brk                ; $c595: 00        
__c596:     .hex 04            ; $c596: 04        Suspected data
__c597:     brk                ; $c597: 00        
            .hex 04 38         ; $c598: 04 38     Invalid Opcode - NOP $38
            .hex c7 04         ; $c59a: c7 04     Invalid Opcode - DCP $04
            .hex 22            ; $c59c: 22        Invalid Opcode - KIL 
            brk                ; $c59d: 00        
            brk                ; $c59e: 00        
            brk                ; $c59f: 00        
            brk                ; $c5a0: 00        
            .hex 02            ; $c5a1: 02        Invalid Opcode - KIL 
            bpl __c5b4         ; $c5a2: 10 10     
            .hex 04 fe         ; $c5a4: 04 fe     Invalid Opcode - NOP $fe
__c5a6:     .hex b3            ; $c5a6: b3        Suspected data
__c5a7:     .hex c4            ; $c5a7: c4        Suspected data
__c5a8:     inc $c4,x          ; $c5a8: f6 c4     
            inc $c4,x          ; $c5aa: f6 c4     
__c5ac:     adc #$c5           ; $c5ac: 69 c5     
__c5ae:     .hex 7f 7f 7f      ; $c5ae: 7f 7f 7f  Invalid Opcode - RRA $7f7f,x
            brk                ; $c5b1: 00        
            .hex 5f 3f         ; $c5b2: 5f 3f     Suspected data
__c5b4:     brk                ; $c5b4: 00        
            .hex 2f 7f 7f      ; $c5b5: 2f 7f 7f  Invalid Opcode - RLA $7f7f
            brk                ; $c5b8: 00        
            lda #$a9           ; $c5b9: a9 a9     
            sta ($81,x)        ; $c5bb: 81 81     
            eor $3159,y        ; $c5bd: 59 59 31  
            and ($00),y        ; $c5c0: 31 00     
__c5c2:     bmi __c610         ; $c5c2: 30 4c     
            cmp $00,x          ; $c5c4: d5 00     
            bpl __c5a8         ; $c5c6: 10 e0     
            brk                ; $c5c8: 00        
            bit $50            ; $c5c9: 24 50     
            cpy #$00           ; $c5cb: c0 00     
            .hex 3b b3 3b      ; $c5cd: 3b b3 3b  Invalid Opcode - RLA $3bb3,y
            .hex b3 3b         ; $c5d0: b3 3b     Invalid Opcode - LAX ($3b),y
            .hex b3 38         ; $c5d2: b3 38     Invalid Opcode - LAX ($38),y
            .hex b3 00         ; $c5d4: b3 00     Invalid Opcode - LAX ($00),y
__c5d6:     .hex 22            ; $c5d6: 22        Invalid Opcode - KIL 
__c5d7:     .hex 22            ; $c5d7: 22        Invalid Opcode - KIL 
            .hex 22            ; $c5d8: 22        Invalid Opcode - KIL 
            brk                ; $c5d9: 00        
            and ($21,x)        ; $c5da: 21 21     
            brk                ; $c5dc: 00        
            .hex 20            ; $c5dd: 20        Suspected data
__c5de:     .hex 22            ; $c5de: 22        Invalid Opcode - KIL 
            .hex 22            ; $c5df: 22        Invalid Opcode - KIL 
            brk                ; $c5e0: 00        
            .hex 22            ; $c5e1: 22        Invalid Opcode - KIL 
            .hex 22            ; $c5e2: 22        Invalid Opcode - KIL 
            .hex 22            ; $c5e3: 22        Invalid Opcode - KIL 
            .hex 22            ; $c5e4: 22        Invalid Opcode - KIL 
            and ($21,x)        ; $c5e5: 21 21     
            and ($21,x)        ; $c5e7: 21 21     
__c5e9:     asl $0a            ; $c5e9: 06 0a     
            .hex 1b 00 82      ; $c5eb: 1b 00 82  Invalid Opcode - SLO $8200,y
            .hex 1c 00 c5      ; $c5ee: 1c 00 c5  Invalid Opcode - NOP __c500,x
            asl                ; $c5f1: 0a        
            clc                ; $c5f2: 18        
            brk                ; $c5f3: 00        
            inx                ; $c5f4: e8        
            .hex f7 48         ; $c5f5: f7 48     Invalid Opcode - ISC $48,x
            .hex 57 a8         ; $c5f7: 57 a8     Invalid Opcode - SRE $a8,x
            .hex b7            ; $c5f9: b7        Suspected data
__c5fa:     php                ; $c5fa: 08        
            .hex 17 00         ; $c5fb: 17 00     Invalid Opcode - SLO $00,x
            .hex 04 07         ; $c5fd: 04 07     Invalid Opcode - NOP $07
__c5ff:     .hex 0b            ; $c5ff: 0b        Suspected data
__c600:     ora ($03,x)        ; $c600: 01 03     
            ora $08            ; $c602: 05 08     
__c604:     bne __c5d7         ; $c604: d0 d1     
            .hex d2            ; $c606: d2        Invalid Opcode - KIL 
            .hex d3            ; $c607: d3        Suspected data
__c608:     sty $8d            ; $c608: 84 8d     
            sty $8d            ; $c60a: 84 8d     
            lsr $76            ; $c60c: 46 76     
            .hex 77 78         ; $c60e: 77 78     Invalid Opcode - RRA $78,x
__c610:     adc $7b7a,y        ; $c610: 79 7a 7b  
            .hex 7c 7d 7e      ; $c613: 7c 7d 7e  Invalid Opcode - NOP $7e7d,x
            .hex 7f 80 81      ; $c616: 7f 80 81  Invalid Opcode - RRA $8180,x
            .hex 82 83         ; $c619: 82 83     Invalid Opcode - NOP #$83
            sty $85            ; $c61b: 84 85     
            bit $24            ; $c61d: 24 24     
            stx $87            ; $c61f: 86 87     
            bit $24            ; $c621: 24 24     
            bit $88            ; $c623: 24 88     
            lsr $24            ; $c625: 46 24     
            .hex 9c 9d 9e      ; $c627: 9c 9d 9e  Invalid Opcode - SHY $9e9d,x
            .hex 9f a0 a1      ; $c62a: 9f a0 a1  Invalid Opcode - AHX $a1a0,y
            ldx #$a3           ; $c62d: a2 a3     
            ldy $a5            ; $c62f: a4 a5     
            ldx $a7            ; $c631: a6 a7     
            tay                ; $c633: a8        
            lda #$aa           ; $c634: a9 aa     
            .hex ab ac         ; $c636: ab ac     Invalid Opcode - LAX #$ac
            lda $24ae          ; $c638: ad ae 24  
            .hex af b0 b1      ; $c63b: af b0 b1  Invalid Opcode - LAX $b1b0
            lsr $24            ; $c63e: 46 24     
            bit $24            ; $c640: 24 24     
            .hex 89 24         ; $c642: 89 24     Invalid Opcode - NOP #$24
            bit $8a            ; $c644: 24 8a     
            .hex 8b 8c         ; $c646: 8b 8c     Invalid Opcode - XAA #$8c
            sta $8f8e          ; $c648: 8d 8e 8f  
            bcc __c5de         ; $c64b: 90 91     
            .hex 92            ; $c64d: 92        Invalid Opcode - KIL 
            .hex 93 94         ; $c64e: 93 94     Invalid Opcode - AHX ($94),y
            sta $96,x          ; $c650: 95 96     
            .hex 97 98         ; $c652: 97 98     Invalid Opcode - SAX $98,y
            sta $9b9a,y        ; $c654: 99 9a 9b  
            lsr $24            ; $c657: 46 24     
            .hex b2            ; $c659: b2        Invalid Opcode - KIL 
            pla                ; $c65a: 68        
            .hex 9e b5 b6      ; $c65b: 9e b5 b6  Invalid Opcode - SHX $b6b5,y
            jmp ($a3c7)        ; $c65e: 6c c7 a3  

;-------------------------------------------------------------------------------
            ldy $69            ; $c661: a4 69     
            ldx $a7            ; $c663: a6 a7     
            tay                ; $c665: a8        
            .hex 6b aa         ; $c666: 6b aa     Invalid Opcode - ARR #$aa
            cmp #$ca           ; $c668: c9 ca     
            adc $24bf          ; $c66a: 6d bf 24  
            cmp $b16a          ; $c66d: cd 6a b1  
            lsr $c2            ; $c670: 46 c2     
            .hex c3 24         ; $c672: c3 24     Invalid Opcode - DCP ($24,x)
            .hex 9e c4 c5      ; $c674: 9e c4 c5  Invalid Opcode - SHX __c5c4,y
            dec $c7            ; $c677: c6 c7     
            .hex a3 b9         ; $c679: a3 b9     Invalid Opcode - LAX ($b9,x)
            lda $a6            ; $c67b: a5 a6     
            .hex a7 bb         ; $c67d: a7 bb     Invalid Opcode - LAX $bb
            .hex 6b c8         ; $c67f: 6b c8     Invalid Opcode - ARR #$c8
            cmp #$ca           ; $c681: c9 ca     
            .hex cb cc         ; $c683: cb cc     Invalid Opcode - AXS #$cc
            bit $cd            ; $c685: 24 cd     
            dec $46cf          ; $c687: ce cf 46  
            bit $b2            ; $c68a: 24 b2     
            .hex b3 b4         ; $c68c: b3 b4     Invalid Opcode - LAX ($b4),y
            lda $b6,x          ; $c68e: b5 b6     
            .hex b7 b8         ; $c690: b7 b8     Invalid Opcode - LAX $b8,y
            .hex a3 b9         ; $c692: a3 b9     Invalid Opcode - LAX ($b9,x)
            adc #$ba           ; $c694: 69 ba     
            .hex a7 bb         ; $c696: a7 bb     Invalid Opcode - LAX $bb
            lda #$aa           ; $c698: a9 aa     
            ldy $bebd,x        ; $c69a: bc bd be  
            .hex bf c0 c1      ; $c69d: bf c0 c1  Invalid Opcode - LAX __c1c0,y
            bit $b1            ; $c6a0: 24 b1     
            .hex 13 2c         ; $c6a2: 13 2c     Invalid Opcode - SLO ($2c),y
            asl $13,x          ; $c6a4: 16 13     
            .hex 13 16         ; $c6a6: 13 16     Invalid Opcode - SLO ($16),y
            bmi __c6e1         ; $c6a8: 30 37     
__c6aa:     .hex 23 db         ; $c6aa: 23 db     Invalid Opcode - RLA ($db,x)
            .hex 42            ; $c6ac: 42        Invalid Opcode - KIL 
            ldy #$21           ; $c6ad: a0 21     
            dex                ; $c6af: ca        
            jmp $2124          ; $c6b0: 4c 24 21  

;-------------------------------------------------------------------------------
            nop                ; $c6b3: ea        
            .hex 0c 24 24      ; $c6b4: 0c 24 24  Invalid Opcode - NOP $2424
            ora $0a15,y        ; $c6b7: 19 15 0a  
            .hex 22            ; $c6ba: 22        Invalid Opcode - KIL 
            asl $241b          ; $c6bb: 0e 1b 24  
            ror $24            ; $c6be: 66 24     
            bit $00            ; $c6c0: 24 00     
__c6c2:     .hex 23 e2         ; $c6c2: 23 e2     Invalid Opcode - RLA ($e2,x)
            .hex 04 08         ; $c6c4: 04 08     Invalid Opcode - NOP $08
            asl                ; $c6c6: 0a        
            asl                ; $c6c7: 0a        
            .hex 02            ; $c6c8: 02        Invalid Opcode - KIL 
            .hex 22            ; $c6c9: 22        Invalid Opcode - KIL 
            asl                ; $c6ca: 0a        
            jmp $2224          ; $c6cb: 4c 24 22  

;-------------------------------------------------------------------------------
            rol                ; $c6ce: 2a        
            .hex 0c 24 10      ; $c6cf: 0c 24 10  Invalid Opcode - NOP $1024
            asl                ; $c6d2: 0a        
            asl $0e,x          ; $c6d3: 16 0e     
            bit $24            ; $c6d5: 24 24     
            clc                ; $c6d7: 18        
            .hex 1f 0e 1b      ; $c6d8: 1f 0e 1b  Invalid Opcode - SLO $1b0e,x
            bit $22            ; $c6db: 24 22     
            lsr                ; $c6dd: 4a        
            jmp $0024          ; $c6de: 4c 24 00  

;-------------------------------------------------------------------------------
__c6e1:     .hex 12            ; $c6e1: 12        Invalid Opcode - KIL 
            bit $24            ; $c6e2: 24 24     
            jsr $5b63          ; $c6e4: 20 63 5b  
            bit $20            ; $c6e7: 24 20     
            sty $4a,x          ; $c6e9: 94 4a     
            bit $20            ; $c6eb: 24 20     
            ldy $4a,x          ; $c6ed: b4 4a     
            bit $00            ; $c6ef: 24 00     
            and ($09,x)        ; $c6f1: 21 09     
            lsr $2124          ; $c6f3: 4e 24 21  
            lda #$4e           ; $c6f6: a9 4e     
            bit $22            ; $c6f8: 24 22     
            eor #$4e           ; $c6fa: 49 4e     
            bit $22            ; $c6fc: 24 22     
            sbc #$4e           ; $c6fe: e9 4e     
            bit $3f            ; $c700: 24 3f     
            ora $3003,x        ; $c702: 1d 03 30  
            rol $06,x          ; $c705: 36 06     
            brk                ; $c707: 00        
            jsr $468d          ; $c708: 20 8d 46  
            bit $20            ; $c70b: 24 20     
            lda $2446          ; $c70d: ad 46 24  
            jsr $46cd          ; $c710: 20 cd 46  
            bit $20            ; $c713: 24 20     
            sbc $2446          ; $c715: ed 46 24  
            brk                ; $c718: 00        
            .hex 12            ; $c719: 12        Invalid Opcode - KIL 
            tax                ; $c71a: aa        
            tax                ; $c71b: aa        
            lsr $24            ; $c71c: 46 24     
            bit $dc            ; $c71e: 24 dc     
            cmp __d5d4,x       ; $c720: dd d4 d5  
            dec __d6df,x       ; $c723: de df d6  
            .hex d7 e0         ; $c726: d7 e0     Invalid Opcode - DCP $e0,x
            sbc ($d8,x)        ; $c728: e1 d8     
__c72a:     .hex d9 e2         ; $c72a: d9 e2     Suspected data
__c72c:     .hex e3 da         ; $c72c: e3 da     Invalid Opcode - ISC ($da,x)
            .hex db e4 e5      ; $c72e: db e4 e5  Invalid Opcode - DCP __e5e4,y
            bit $24            ; $c731: 24 24     
            inc $e7            ; $c733: e6 e7     
            lsr $e8            ; $c735: 46 e8     
            sbc #$ea           ; $c737: e9 ea     
            .hex eb ec         ; $c739: eb ec     Invalid Opcode - SBC #$ec
            sbc __efee         ; $c73b: ed ee ef  
            bit $f0            ; $c73e: 24 f0     
            sbc ($f2),y        ; $c740: f1 f2     
            bit $f3            ; $c742: 24 f3     
            .hex f4 f5         ; $c744: f4 f5     Invalid Opcode - NOP $f5,x
            inc $f7,x          ; $c746: f6 f7     
            sed                ; $c748: f8        
            sbc __fbfa,y       ; $c749: f9 fa fb  
            .hex fc fd 21      ; $c74c: fc fd 21  Invalid Opcode - NOP $21fd,x
            php                ; $c74f: 08        
__c750:     bvc __c7b4         ; $c750: 50 62     
            brk                ; $c752: 00        
            .hex 23 09         ; $c753: 23 09     Invalid Opcode - RLA ($09,x)
            lsr $2362          ; $c755: 4e 62 23  
            and #$4e           ; $c758: 29 4e     
            .hex 62            ; $c75a: 62        Invalid Opcode - KIL 
            .hex 23 49         ; $c75b: 23 49     Invalid Opcode - RLA ($49,x)
            .hex 4e 62 00      ; $c75d: 4e 62 00  Bad Addr Mode - LSR $0062
            jsr $42c5          ; $c760: 20 c5 42  
            bit $20            ; $c763: 24 20     
            dex                ; $c765: ca        
            .hex 42            ; $c766: 42        Invalid Opcode - KIL 
            bit $20            ; $c767: 24 20     
            nop                ; $c769: ea        
            .hex 42            ; $c76a: 42        Invalid Opcode - KIL 
            bit $20            ; $c76b: 24 20     
            sbc $42            ; $c76d: e5 42     
            bit $22            ; $c76f: 24 22     
            asl                ; $c771: 0a        
            .hex 42            ; $c772: 42        Invalid Opcode - KIL 
            bit $22            ; $c773: 24 22     
            rol                ; $c775: 2a        
            .hex 42            ; $c776: 42        Invalid Opcode - KIL 
            bit $22            ; $c777: 24 22     
            clc                ; $c779: 18        
            .hex 42            ; $c77a: 42        Invalid Opcode - KIL 
            bit $00            ; $c77b: 24 00     
            .hex 22            ; $c77d: 22        Invalid Opcode - KIL 
            sec                ; $c77e: 38        
            .hex 42            ; $c77f: 42        Invalid Opcode - KIL 
            bit $21            ; $c780: 24 21     
            and #$c4           ; $c782: 29 c4     
            bit $21            ; $c784: 24 21     
            rol $c4,x          ; $c786: 36 c4     
            bit $21            ; $c788: 24 21     
            bne __c750         ; $c78a: d0 c4     
            bit $22            ; $c78c: 24 22     
            jmp ($24c4)        ; $c78e: 6c c4 24  

;-------------------------------------------------------------------------------
            .hex 22            ; $c791: 22        Invalid Opcode - KIL 
            .hex 73 c4         ; $c792: 73 c4     Invalid Opcode - RRA ($c4),y
            bit $23            ; $c794: 24 23     
            .hex 0f c3 24      ; $c796: 0f c3 24  Invalid Opcode - SLO $24c3
            brk                ; $c799: 00        
__c79a:     .hex ff 01         ; $c79a: ff 01     Suspected data
__c79c:     ora ($ff,x)        ; $c79c: 01 ff     

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      sei                ; $c79e: 78        
            cld                ; $c79f: d8        
            lda #$10           ; $c7a0: a9 10     
            sta $2000          ; $c7a2: 8d 00 20  
            ldx #$ff           ; $c7a5: a2 ff     
            txs                ; $c7a7: 9a        
__c7a8:     lda $2002          ; $c7a8: ad 02 20  
            and #$80           ; $c7ab: 29 80     
            beq __c7a8         ; $c7ad: f0 f9     
            ldy #$07           ; $c7af: a0 07     
            sty $01            ; $c7b1: 84 01     
            .hex a0            ; $c7b3: a0        Suspected data
__c7b4:     brk                ; $c7b4: 00        
            sty $00            ; $c7b5: 84 00     
            lda #$00           ; $c7b7: a9 00     
__c7b9:     sta ($00),y        ; $c7b9: 91 00     
            dey                ; $c7bb: 88        
            bne __c7b9         ; $c7bc: d0 fb     
            dec $01            ; $c7be: c6 01     
            bpl __c7b9         ; $c7c0: 10 f7     
            jsr __c7e7         ; $c7c2: 20 e7 c7  
            lda #$7f           ; $c7c5: a9 7f     
            sta $0511          ; $c7c7: 8d 11 05  
            lda #$18           ; $c7ca: a9 18     
            sta $51            ; $c7cc: 85 51     
            lda #$01           ; $c7ce: a9 01     
            sta $4e            ; $c7d0: 85 4e     
            sta $55            ; $c7d2: 85 55     
            lda #$00           ; $c7d4: a9 00     
            sta $4f            ; $c7d6: 85 4f     
            lda $10            ; $c7d8: a5 10     
            eor #$80           ; $c7da: 49 80     
            sta $2000          ; $c7dc: 8d 00 20  
            sta $10            ; $c7df: 85 10     
__c7e1:     jsr __f4ed         ; $c7e1: 20 ed f4  
            jmp __c7e1         ; $c7e4: 4c e1 c7  

;-------------------------------------------------------------------------------
__c7e7:     lda #$10           ; $c7e7: a9 10     
            sta $2000          ; $c7e9: 8d 00 20  
            sta $10            ; $c7ec: 85 10     
            lda #$06           ; $c7ee: a9 06     
            sta $2001          ; $c7f0: 8d 01 20  
            sta $11            ; $c7f3: 85 11     
            lda #$00           ; $c7f5: a9 00     
            sta $2005          ; $c7f7: 8d 05 20  
            sta $12            ; $c7fa: 85 12     
            sta $2005          ; $c7fc: 8d 05 20  
            sta $13            ; $c7ff: 85 13     
            jsr __cbae         ; $c801: 20 ae cb  
            jmp __cbb7         ; $c804: 4c b7 cb  

;-------------------------------------------------------------------------------
__c807:     tax                ; $c807: aa        
            lda __c4a7,x       ; $c808: bd a7 c4  
            sta $00            ; $c80b: 85 00     
            lda __c4a8,x       ; $c80d: bd a8 c4  
            sta $01            ; $c810: 85 01     
            jmp __f228         ; $c812: 4c 28 f2  

;-------------------------------------------------------------------------------
__c815:     tax                ; $c815: aa        
            lda __c03c,x       ; $c816: bd 3c c0  
            sta $02            ; $c819: 85 02     
            lda __c03d,x       ; $c81b: bd 3d c0  
            sta $03            ; $c81e: 85 03     
            jmp __f2d7         ; $c820: 4c d7 f2  

;-------------------------------------------------------------------------------
__c823:     tax                ; $c823: aa        
            lda __c03c,x       ; $c824: bd 3c c0  
            sta $00            ; $c827: 85 00     
            lda __c03d,x       ; $c829: bd 3d c0  
            sta $01            ; $c82c: 85 01     
            jmp __cd76         ; $c82e: 4c 76 cd  

;-------------------------------------------------------------------------------
__c831:     tax                ; $c831: aa        
            lda __c03c,x       ; $c832: bd 3c c0  
            sta $04            ; $c835: 85 04     
            lda __c03d,x       ; $c837: bd 3d c0  
            sta $05            ; $c83a: 85 05     
            lda __c044,x       ; $c83c: bd 44 c0  
            sta $06            ; $c83f: 85 06     
            lda __c045,x       ; $c841: bd 45 c0  
            sta $07            ; $c844: 85 07     
            rts                ; $c846: 60        

;-------------------------------------------------------------------------------
__c847:     tax                ; $c847: aa        
            lda __c03c,x       ; $c848: bd 3c c0  
            sta $02            ; $c84b: 85 02     
            lda __c03d,x       ; $c84d: bd 3d c0  
            sta $03            ; $c850: 85 03     
            rts                ; $c852: 60        

;-------------------------------------------------------------------------------
__c853:     tax                ; $c853: aa        
            lda __c03c,x       ; $c854: bd 3c c0  
            sta $08            ; $c857: 85 08     
            lda __c03d,x       ; $c859: bd 3d c0  
            sta $09            ; $c85c: 85 09     
            rts                ; $c85e: 60        

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        pha                ; $c85f: 48        
            lda $10            ; $c860: a5 10     
            and #$7f           ; $c862: 29 7f     
            sta $2000          ; $c864: 8d 00 20  
            sta $10            ; $c867: 85 10     
            lda #$00           ; $c869: a9 00     
            sta $2003          ; $c86b: 8d 03 20  
            lda #$02           ; $c86e: a9 02     
            sta $4014          ; $c870: 8d 14 40  
            lda #$31           ; $c873: a9 31     
            sta $00            ; $c875: 85 00     
            lda #$03           ; $c877: a9 03     
            sta $01            ; $c879: 85 01     
            jsr __f228         ; $c87b: 20 28 f2  
            lda #$00           ; $c87e: a9 00     
            sta $0330          ; $c880: 8d 30 03  
            sta $0331          ; $c883: 8d 31 03  
            jsr __f50e         ; $c886: 20 0e f5  
            lda $11            ; $c889: a5 11     
            eor #$18           ; $c88b: 49 18     
            sta $2001          ; $c88d: 8d 01 20  
            jsr __fa48         ; $c890: 20 48 fa  
            lda $4e            ; $c893: a5 4e     
            bne __c8c1         ; $c895: d0 2a     
            lda $4f            ; $c897: a5 4f     
            beq __c8d4         ; $c899: f0 39     
            lda $9a            ; $c89b: a5 9a     
            bne __c8a5         ; $c89d: d0 06     
            jsr __ce7c         ; $c89f: 20 7c ce  
            jmp __c8d7         ; $c8a2: 4c d7 c8  

;-------------------------------------------------------------------------------
__c8a5:     lda $044f          ; $c8a5: ad 4f 04  
            cmp #$08           ; $c8a8: c9 08     
            bne __c8d4         ; $c8aa: d0 28     
            jsr __ccf4         ; $c8ac: 20 f4 cc  
            lda $43            ; $c8af: a5 43     
            bne __c8d7         ; $c8b1: d0 24     
            lda #$00           ; $c8b3: a9 00     
            sta $044f          ; $c8b5: 8d 4f 04  
            sta $4f            ; $c8b8: 85 4f     
            lda #$79           ; $c8ba: a9 79     
            sta $43            ; $c8bc: 85 43     
            jmp __c8d7         ; $c8be: 4c d7 c8  

;-------------------------------------------------------------------------------
__c8c1:     lda $55            ; $c8c1: a5 55     
            bne __c8cb         ; $c8c3: d0 06     
            jsr __ca30         ; $c8c5: 20 30 ca  
            jmp __c8d7         ; $c8c8: 4c d7 c8  

;-------------------------------------------------------------------------------
__c8cb:     jsr __c8f3         ; $c8cb: 20 f3 c8  
            jsr __f4ac         ; $c8ce: 20 ac f4  
            jmp __c8d7         ; $c8d1: 4c d7 c8  

;-------------------------------------------------------------------------------
__c8d4:     jsr __cac9         ; $c8d4: 20 c9 ca  
__c8d7:     lda $0505          ; $c8d7: ad 05 05  
            cmp #$01           ; $c8da: c9 01     
            bne __c8e8         ; $c8dc: d0 0a     
            lda $51            ; $c8de: a5 51     
            sta $00            ; $c8e0: 85 00     
            jsr __f23c         ; $c8e2: 20 3c f2  
            dec $0505          ; $c8e5: ce 05 05  
__c8e8:     lda $10            ; $c8e8: a5 10     
            eor #$80           ; $c8ea: 49 80     
            sta $2000          ; $c8ec: 8d 00 20  
            sta $10            ; $c8ef: 85 10     
            pla                ; $c8f1: 68        
            rti                ; $c8f2: 40        

;-------------------------------------------------------------------------------
__c8f3:     lda $0102          ; $c8f3: ad 02 01  
            bne __c8fe         ; $c8f6: d0 06     
            sta $4015          ; $c8f8: 8d 15 40  
            sta $0100          ; $c8fb: 8d 00 01  
__c8fe:     lda $0518          ; $c8fe: ad 18 05  
            bne __c914         ; $c901: d0 11     
            lda #$80           ; $c903: a9 80     
            sta $fd            ; $c905: 85 fd     
            lda #$04           ; $c907: a9 04     
            sta $0518          ; $c909: 8d 18 05  
            lda #$0f           ; $c90c: a9 0f     
            sta $4015          ; $c90e: 8d 15 40  
            sta $0100          ; $c911: 8d 00 01  
__c914:     lda $0510          ; $c914: ad 10 05  
            bne __c940         ; $c917: d0 27     
            jsr __d19a         ; $c919: 20 9a d1  
            lda #$08           ; $c91c: a9 08     
            jsr __c807         ; $c91e: 20 07 c8  
            lda $0511          ; $c921: ad 11 05  
            sta $0200          ; $c924: 8d 00 02  
            lda #$a2           ; $c927: a9 a2     
            sta $0201          ; $c929: 8d 01 02  
            lda #$00           ; $c92c: a9 00     
            sta $0202          ; $c92e: 8d 02 02  
            sta $58            ; $c931: 85 58     
            lda #$38           ; $c933: a9 38     
            sta $0203          ; $c935: 8d 03 02  
            sta $0510          ; $c938: 8d 10 05  
            lda #$20           ; $c93b: a9 20     
            sta $44            ; $c93d: 85 44     
            rts                ; $c93f: 60        

;-------------------------------------------------------------------------------
__c940:     lda $15            ; $c940: a5 15     
            and #$20           ; $c942: 29 20     
            bne __c95d         ; $c944: d0 17     
            lda $15            ; $c946: a5 15     
            and #$10           ; $c948: 29 10     
            bne __c98a         ; $c94a: d0 3e     
            lda #$00           ; $c94c: a9 00     
            sta $0512          ; $c94e: 8d 12 05  
            lda $44            ; $c951: a5 44     
            bne __c95c         ; $c953: d0 07     
            lda #$01           ; $c955: a9 01     
            sta $58            ; $c957: 85 58     
            jmp __c9b1         ; $c959: 4c b1 c9  

;-------------------------------------------------------------------------------
__c95c:     rts                ; $c95c: 60        

;-------------------------------------------------------------------------------
__c95d:     lda #$40           ; $c95d: a9 40     
            sta $44            ; $c95f: 85 44     
            lda $0512          ; $c961: ad 12 05  
            bne __c985         ; $c964: d0 1f     
            lda #$40           ; $c966: a9 40     
            sta $35            ; $c968: 85 35     
            lda $0200          ; $c96a: ad 00 02  
            clc                ; $c96d: 18        
            adc #$10           ; $c96e: 69 10     
            cmp #$bf           ; $c970: c9 bf     
            bne __c976         ; $c972: d0 02     
            lda #$7f           ; $c974: a9 7f     
__c976:     sta $0200          ; $c976: 8d 00 02  
            sta $0511          ; $c979: 8d 11 05  
            inc $0512          ; $c97c: ee 12 05  
            lda #$0a           ; $c97f: a9 0a     
            sta $0513          ; $c981: 8d 13 05  
            rts                ; $c984: 60        

;-------------------------------------------------------------------------------
__c985:     lda $35            ; $c985: a5 35     
            bne __c989         ; $c987: d0 00     
__c989:     rts                ; $c989: 60        

;-------------------------------------------------------------------------------
__c98a:     sta $0514          ; $c98a: 8d 14 05  
            ldx #$0a           ; $c98d: a2 0a     
            lda #$00           ; $c98f: a9 00     
__c991:     sta $24,x          ; $c991: 95 24     
            dex                ; $c993: ca        
            bne __c991         ; $c994: d0 fb     
            lda $0511          ; $c996: ad 11 05  
            lsr                ; $c999: 4a        
            lsr                ; $c99a: 4a        
            lsr                ; $c99b: 4a        
            lsr                ; $c99c: 4a        
            sec                ; $c99d: 38        
            sbc #$07           ; $c99e: e9 07     
            sta $50            ; $c9a0: 85 50     
            cmp #$02           ; $c9a2: c9 02     
            bmi __c9ad         ; $c9a4: 30 07     
            lda #$1c           ; $c9a6: a9 1c     
            sta $51            ; $c9a8: 85 51     
            jmp __c9b1         ; $c9aa: 4c b1 c9  

;-------------------------------------------------------------------------------
__c9ad:     lda #$18           ; $c9ad: a9 18     
            sta $51            ; $c9af: 85 51     
__c9b1:     lda $50            ; $c9b1: a5 50     
            and #$01           ; $c9b3: 29 01     
            asl                ; $c9b5: 0a        
            tax                ; $c9b6: aa        
            lda $0507,x        ; $c9b7: bd 07 05  
            sta $21            ; $c9ba: 85 21     
            lda $0508,x        ; $c9bc: bd 08 05  
            sta $22            ; $c9bf: 85 22     
            lda #$0f           ; $c9c1: a9 0f     
            sta $18            ; $c9c3: 85 18     
            lda #$13           ; $c9c5: a9 13     
            sta $19            ; $c9c7: 85 19     
            lda #$00           ; $c9c9: a9 00     
            sta $4e            ; $c9cb: 85 4e     
            sta $0406          ; $c9cd: 8d 06 04  
            sta $0407          ; $c9d0: 8d 07 04  
            sta $4f            ; $c9d3: 85 4f     
            sta $0510          ; $c9d5: 8d 10 05  
            sta $050b          ; $c9d8: 8d 0b 05  
            sta $0512          ; $c9db: 8d 12 05  
            lda #$01           ; $c9de: a9 01     
            sta $53            ; $c9e0: 85 53     
            sta $0400          ; $c9e2: 8d 00 04  
            sta $0401          ; $c9e5: 8d 01 04  
            lda #$00           ; $c9e8: a9 00     
            sta $54            ; $c9ea: 85 54     
            sta $0402          ; $c9ec: 8d 02 04  
            sta $0403          ; $c9ef: 8d 03 04  
            lda #$00           ; $c9f2: a9 00     
            sta $52            ; $c9f4: 85 52     
            sta $0408          ; $c9f6: 8d 08 04  
            sta $0409          ; $c9f9: 8d 09 04  
            sta $fc            ; $c9fc: 85 fc     
            lda #$03           ; $c9fe: a9 03     
            ldx $58            ; $ca00: a6 58     
            beq __ca06         ; $ca02: f0 02     
            lda #$01           ; $ca04: a9 01     
__ca06:     sta $55            ; $ca06: 85 55     
            sta $0404          ; $ca08: 8d 04 04  
            sta $0405          ; $ca0b: 8d 05 04  
            sta $040b          ; $ca0e: 8d 0b 04  
            lda $58            ; $ca11: a5 58     
            bne __ca26         ; $ca13: d0 11     
            lda #$97           ; $ca15: a9 97     
            sta $43            ; $ca17: 85 43     
            lda #$01           ; $ca19: a9 01     
            sta $fd            ; $ca1b: 85 fd     
            lda #$0f           ; $ca1d: a9 0f     
            sta $4015          ; $ca1f: 8d 15 40  
            sta $0100          ; $ca22: 8d 00 01  
            rts                ; $ca25: 60        

;-------------------------------------------------------------------------------
__ca26:     dec $0518          ; $ca26: ce 18 05  
            lda #$75           ; $ca29: a9 75     
            sta $43            ; $ca2b: 85 43     
            jmp __cbae         ; $ca2d: 4c ae cb  

;-------------------------------------------------------------------------------
__ca30:     jsr __f4ac         ; $ca30: 20 ac f4  
            lda $58            ; $ca33: a5 58     
            bne __ca4a         ; $ca35: d0 13     
            lda $43            ; $ca37: a5 43     
            cmp #$75           ; $ca39: c9 75     
            beq __ca5a         ; $ca3b: f0 1d     
            cmp #$74           ; $ca3d: c9 74     
            beq __ca5f         ; $ca3f: f0 1e     
            cmp #$73           ; $ca41: c9 73     
            beq __ca64         ; $ca43: f0 1f     
            cmp #$5f           ; $ca45: c9 5f     
            beq __ca79         ; $ca47: f0 30     
            rts                ; $ca49: 60        

;-------------------------------------------------------------------------------
__ca4a:     sta $55            ; $ca4a: 85 55     
            lda #$00           ; $ca4c: a9 00     
            sta $58            ; $ca4e: 85 58     
            sta $0510          ; $ca50: 8d 10 05  
__ca53:     jsr __cbb7         ; $ca53: 20 b7 cb  
            jsr __cbae         ; $ca56: 20 ae cb  
            rts                ; $ca59: 60        

;-------------------------------------------------------------------------------
__ca5a:     dec $43            ; $ca5a: c6 43     
            jmp __cbae         ; $ca5c: 4c ae cb  

;-------------------------------------------------------------------------------
__ca5f:     dec $43            ; $ca5f: c6 43     
            jmp __cbca         ; $ca61: 4c ca cb  

;-------------------------------------------------------------------------------
__ca64:     dec $43            ; $ca64: c6 43     
            lda $50            ; $ca66: a5 50     
            and #$01           ; $ca68: 29 01     
            asl                ; $ca6a: 0a        
            tax                ; $ca6b: aa        
            lda $21            ; $ca6c: a5 21     
            sta $0507,x        ; $ca6e: 9d 07 05  
            lda $22            ; $ca71: a5 22     
            sta $0508,x        ; $ca73: 9d 08 05  
            jmp __cbf5         ; $ca76: 4c f5 cb  

;-------------------------------------------------------------------------------
__ca79:     ldx $52            ; $ca79: a6 52     
            lda #$01           ; $ca7b: a9 01     
            sta $0406,x        ; $ca7d: 9d 06 04  
            sta $4e            ; $ca80: 85 4e     
            lda $51            ; $ca82: a5 51     
            cmp #$1c           ; $ca84: c9 1c     
            bne __ca94         ; $ca86: d0 0c     
            lda $52            ; $ca88: a5 52     
            eor #$01           ; $ca8a: 49 01     
            tax                ; $ca8c: aa        
            lda $0406,x        ; $ca8d: bd 06 04  
            sta $4e            ; $ca90: 85 4e     
            beq __ca99         ; $ca92: f0 05     
__ca94:     sta $55            ; $ca94: 85 55     
            jmp __ca53         ; $ca96: 4c 53 ca  

;-------------------------------------------------------------------------------
__ca99:     lda #$85           ; $ca99: a9 85     
            sta $43            ; $ca9b: 85 43     
            sta $040b          ; $ca9d: 8d 0b 04  
            ldy #$00           ; $caa0: a0 00     
            sty $4f            ; $caa2: 84 4f     
            stx $52            ; $caa4: 86 52     
            jmp __caa9         ; $caa6: 4c a9 ca  

;-------------------------------------------------------------------------------
__caa9:     ldy #$00           ; $caa9: a0 00     
__caab:     lda $0400,x        ; $caab: bd 00 04  
            sta $0053,y        ; $caae: 99 53 00  
            inx                ; $cab1: e8        
            inx                ; $cab2: e8        
            iny                ; $cab3: c8        
            cpy #$03           ; $cab4: c0 03     
            bne __caab         ; $cab6: d0 f3     
            rts                ; $cab8: 60        

;-------------------------------------------------------------------------------
__cab9:     ldy #$00           ; $cab9: a0 00     
__cabb:     lda $0053,y        ; $cabb: b9 53 00  
            sta $0400,x        ; $cabe: 9d 00 04  
            inx                ; $cac1: e8        
            inx                ; $cac2: e8        
            iny                ; $cac3: c8        
            cpy #$03           ; $cac4: c0 03     
            bne __cabb         ; $cac6: d0 f3     
            rts                ; $cac8: 60        

;-------------------------------------------------------------------------------
__cac9:     jsr __f4ac         ; $cac9: 20 ac f4  
            lda $53            ; $cacc: a5 53     
            cmp #$01           ; $cace: c9 01     
            beq __cad8         ; $cad0: f0 06     
            lda $43            ; $cad2: a5 43     
            cmp #$84           ; $cad4: c9 84     
            beq __cb02         ; $cad6: f0 2a     
__cad8:     lda $43            ; $cad8: a5 43     
            cmp #$72           ; $cada: c9 72     
            bcs __cb18         ; $cadc: b0 3a     
            cmp #$6d           ; $cade: c9 6d     
            beq __cae7         ; $cae0: f0 05     
            cmp #$62           ; $cae2: c9 62     
            beq __cafa         ; $cae4: f0 14     
            rts                ; $cae6: 60        

;-------------------------------------------------------------------------------
__cae7:     lda $040b          ; $cae7: ad 0b 04  
            beq __caf6         ; $caea: f0 0a     
            lda #$00           ; $caec: a9 00     
            sta $040b          ; $caee: 8d 0b 04  
            dec $55            ; $caf1: c6 55     
            jsr __cbbd         ; $caf3: 20 bd cb  
__caf6:     jsr __cc34         ; $caf6: 20 34 cc  
            rts                ; $caf9: 60        

;-------------------------------------------------------------------------------
__cafa:     lda #$01           ; $cafa: a9 01     
            sta $4f            ; $cafc: 85 4f     
            jsr __cc47         ; $cafe: 20 47 cc  
            rts                ; $cb01: 60        

;-------------------------------------------------------------------------------
__cb02:     ldx $52            ; $cb02: a6 52     
            lda $53            ; $cb04: a5 53     
            cmp $0400,x        ; $cb06: dd 00 04  
            beq __cb15         ; $cb09: f0 0a     
            cmp #$01           ; $cb0b: c9 01     
            beq __cb15         ; $cb0d: f0 06     
            jsr __cc24         ; $cb0f: 20 24 cc  
            jsr __cc04         ; $cb12: 20 04 cc  
__cb15:     dec $43            ; $cb15: c6 43     
            rts                ; $cb17: 60        

;-------------------------------------------------------------------------------
__cb18:     jmp __cb1b         ; $cb18: 4c 1b cb  

;-------------------------------------------------------------------------------
__cb1b:     cmp #$7a           ; $cb1b: c9 7a     
            beq __cb30         ; $cb1d: f0 11     
            cmp #$75           ; $cb1f: c9 75     
            beq __cb39         ; $cb21: f0 16     
            cmp #$74           ; $cb23: c9 74     
            beq __cb36         ; $cb25: f0 0f     
            cmp #$73           ; $cb27: c9 73     
            beq __cb58         ; $cb29: f0 2d     
            cmp #$72           ; $cb2b: c9 72     
            beq __cb47         ; $cb2d: f0 18     
            rts                ; $cb2f: 60        

;-------------------------------------------------------------------------------
__cb30:     jsr __ca53         ; $cb30: 20 53 ca  
            jsr __cbca         ; $cb33: 20 ca cb  
__cb36:     dec $43            ; $cb36: c6 43     
            rts                ; $cb38: 60        

;-------------------------------------------------------------------------------
__cb39:     jsr __cbb7         ; $cb39: 20 b7 cb  
            dec $43            ; $cb3c: c6 43     
            lda $58            ; $cb3e: a5 58     
            bne __cb46         ; $cb40: d0 04     
            lda #$08           ; $cb42: a9 08     
            sta $fd            ; $cb44: 85 fd     
__cb46:     rts                ; $cb46: 60        

;-------------------------------------------------------------------------------
__cb47:     dec $43            ; $cb47: c6 43     
            ldx $53            ; $cb49: a6 53     
            dex                ; $cb4b: ca        
            lda __c608,x       ; $cb4c: bd 08 c6  
            sta $00            ; $cb4f: 85 00     
            lda #$20           ; $cb51: a9 20     
            sta $01            ; $cb53: 85 01     
            jmp __eba6         ; $cb55: 4c a6 eb  

;-------------------------------------------------------------------------------
__cb58:     jsr __d19a         ; $cb58: 20 9a d1  
            ldx $53            ; $cb5b: a6 53     
            dex                ; $cb5d: ca        
            txa                ; $cb5e: 8a        
            asl                ; $cb5f: 0a        
            jsr __c807         ; $cb60: 20 07 c8  
            lda #$0a           ; $cb63: a9 0a     
            jsr __c807         ; $cb65: 20 07 c8  
            lda $51            ; $cb68: a5 51     
            cmp #$1c           ; $cb6a: c9 1c     
            beq __cb7b         ; $cb6c: f0 0d     
            lda #$76           ; $cb6e: a9 76     
            sta $00            ; $cb70: 85 00     
            lda #$20           ; $cb72: a9 20     
            sta $01            ; $cb74: 85 01     
            lda #$04           ; $cb76: a9 04     
            jsr __c815         ; $cb78: 20 15 c8  
__cb7b:     lda #$01           ; $cb7b: a9 01     
            sta $0505          ; $cb7d: 8d 05 05  
            jsr __d032         ; $cb80: 20 32 d0  
            jsr __cbbd         ; $cb83: 20 bd cb  
            lda #$bc           ; $cb86: a9 bc     
            sta $00            ; $cb88: 85 00     
            ldy $54            ; $cb8a: a4 54     
            iny                ; $cb8c: c8        
            jsr __f4c2         ; $cb8d: 20 c2 f4  
            lda #$00           ; $cb90: a9 00     
            sta $2c            ; $cb92: 85 2c     
            lda #$80           ; $cb94: a9 80     
            dey                ; $cb96: 88        
            cpy #$04           ; $cb97: c0 04     
            bpl __cb9e         ; $cb99: 10 03     
            lda __c207,y       ; $cb9b: b9 07 c2  
__cb9e:     sta $2e            ; $cb9e: 85 2e     
            lda #$0d           ; $cba0: a9 0d     
            sta $45            ; $cba2: 85 45     
            lda #$02           ; $cba4: a9 02     
            sta $00            ; $cba6: 85 00     
            jsr __f23c         ; $cba8: 20 3c f2  
            dec $43            ; $cbab: c6 43     
            rts                ; $cbad: 60        

;-------------------------------------------------------------------------------
__cbae:     lda #$00           ; $cbae: a9 00     
            sta $04            ; $cbb0: 85 04     
            lda #$ff           ; $cbb2: a9 ff     
            jmp __f092         ; $cbb4: 4c 92 f0  

;-------------------------------------------------------------------------------
__cbb7:     jsr __d19a         ; $cbb7: 20 9a d1  
            jmp __f1b4         ; $cbba: 4c b4 f1  

;-------------------------------------------------------------------------------
__cbbd:     lda #$b5           ; $cbbd: a9 b5     
            sta $00            ; $cbbf: 85 00     
            lda #$20           ; $cbc1: a9 20     
            sta $01            ; $cbc3: 85 01     
            ldy $55            ; $cbc5: a4 55     
            jmp __f4c2         ; $cbc7: 4c c2 f4  

;-------------------------------------------------------------------------------
__cbca:     lda $58            ; $cbca: a5 58     
            bne __cbf4         ; $cbcc: d0 26     
            lda $51            ; $cbce: a5 51     
            cmp #$1c           ; $cbd0: c9 1c     
            bne __cbf4         ; $cbd2: d0 20     
            ldx $52            ; $cbd4: a6 52     
            lda $53            ; $cbd6: a5 53     
            cmp $0400,x        ; $cbd8: dd 00 04  
            bne __cbf4         ; $cbdb: d0 17     
            ldy #$00           ; $cbdd: a0 00     
__cbdf:     lda __c6aa,y       ; $cbdf: b9 aa c6  
            sta $0331,y        ; $cbe2: 99 31 03  
            beq __cbeb         ; $cbe5: f0 04     
            iny                ; $cbe7: c8        
            jmp __cbdf         ; $cbe8: 4c df cb  

;-------------------------------------------------------------------------------
__cbeb:     lda $52            ; $cbeb: a5 52     
            beq __cbf4         ; $cbed: f0 05     
            lda #$67           ; $cbef: a9 67     
            sta $0345          ; $cbf1: 8d 45 03  
__cbf4:     rts                ; $cbf4: 60        

;-------------------------------------------------------------------------------
__cbf5:     ldy #$00           ; $cbf5: a0 00     
__cbf7:     lda __c6c2,y       ; $cbf7: b9 c2 c6  
            sta $0331,y        ; $cbfa: 99 31 03  
            beq __cc03         ; $cbfd: f0 04     
            iny                ; $cbff: c8        
            jmp __cbf7         ; $cc00: 4c f7 cb  

;-------------------------------------------------------------------------------
__cc03:     rts                ; $cc03: 60        

;-------------------------------------------------------------------------------
__cc04:     lda $58            ; $cc04: a5 58     
            bne __cc23         ; $cc06: d0 1b     
            ldx $52            ; $cc08: a6 52     
            lda $0408,x        ; $cc0a: bd 08 04  
            bne __cc23         ; $cc0d: d0 14     
            txa                ; $cc0f: 8a        
            tay                ; $cc10: a8        
            clc                ; $cc11: 18        
            asl                ; $cc12: 0a        
            asl                ; $cc13: 0a        
            tax                ; $cc14: aa        
            lda $25,x          ; $cc15: b5 25     
            cmp #$02           ; $cc17: c9 02     
            bcc __cc23         ; $cc19: 90 08     
            sta $0408,y        ; $cc1b: 99 08 04  
            inc $55            ; $cc1e: e6 55     
            jsr __cbbd         ; $cc20: 20 bd cb  
__cc23:     rts                ; $cc23: 60        

;-------------------------------------------------------------------------------
__cc24:     lda $2e            ; $cc24: a5 2e     
            sta $00            ; $cc26: 85 00     
            lda $52            ; $cc28: a5 52     
            ora #$08           ; $cc2a: 09 08     
            sta $01            ; $cc2c: 85 01     
            jsr __f342         ; $cc2e: 20 42 f3  
            jmp __d032         ; $cc31: 4c 32 d0  

;-------------------------------------------------------------------------------
__cc34:     lda #$01           ; $cc34: a9 01     
            sta $0505          ; $cc36: 8d 05 05  
            jsr __d032         ; $cc39: 20 32 d0  
            lda #$00           ; $cc3c: a9 00     
            sta $050b          ; $cc3e: 8d 0b 05  
            jsr __ccc1         ; $cc41: 20 c1 cc  
            jmp __d7f2         ; $cc44: 4c f2 d7  

;-------------------------------------------------------------------------------
__cc47:     lda #$00           ; $cc47: a9 00     
            tax                ; $cc49: aa        
__cc4a:     sta $59,x          ; $cc4a: 95 59     
            sta $040d,x        ; $cc4c: 9d 0d 04  
            inx                ; $cc4f: e8        
            cpx #$89           ; $cc50: e0 89     
            bne __cc4a         ; $cc52: d0 f6     
            lda #$01           ; $cc54: a9 01     
            sta $59            ; $cc56: 85 59     
            sta $96            ; $cc58: 85 96     
            sta $043e          ; $cc5a: 8d 3e 04  
            sta $0451          ; $cc5d: 8d 51 04  
            sta $0452          ; $cc60: 8d 52 04  
            sta $9f            ; $cc63: 85 9f     
            sta $0503          ; $cc65: 8d 03 05  
            lda #$04           ; $cc68: a9 04     
            sta $97            ; $cc6a: 85 97     
            lda #$58           ; $cc6c: a9 58     
            sta $043d          ; $cc6e: 8d 3d 04  
            lda #$20           ; $cc71: a9 20     
            sta $a2            ; $cc73: 85 a2     
            lda #$80           ; $cc75: a9 80     
            sta $18            ; $cc77: 85 18     
            lda #$0a           ; $cc79: a9 0a     
            sta $34            ; $cc7b: 85 34     
            ldx $52            ; $cc7d: a6 52     
            jsr __cab9         ; $cc7f: 20 b9 ca  
            lda #$bb           ; $cc82: a9 bb     
            sta $39            ; $cc84: 85 39     
            lda #$27           ; $cc86: a9 27     
            sta $44            ; $cc88: 85 44     
            lda $53            ; $cc8a: a5 53     
            cmp #$01           ; $cc8c: c9 01     
            beq __cc99         ; $cc8e: f0 09     
            cmp #$03           ; $cc90: c9 03     
            beq __cca6         ; $cc92: f0 12     
            lda #$10           ; $cc94: a9 10     
            sta $fc            ; $cc96: 85 fc     
            rts                ; $cc98: 60        

;-------------------------------------------------------------------------------
__cc99:     lda #$38           ; $cc99: a9 38     
            sta $36            ; $cc9b: 85 36     
            lda #$40           ; $cc9d: a9 40     
            sta $43            ; $cc9f: 85 43     
            lda #$02           ; $cca1: a9 02     
            sta $fc            ; $cca3: 85 fc     
            rts                ; $cca5: 60        

;-------------------------------------------------------------------------------
__cca6:     lda #$20           ; $cca6: a9 20     
            sta $36            ; $cca8: 85 36     
            lda #$50           ; $ccaa: a9 50     
            sta $043f          ; $ccac: 8d 3f 04  
            sta $0441          ; $ccaf: 8d 41 04  
            sta $0443          ; $ccb2: 8d 43 04  
            lda #$03           ; $ccb5: a9 03     
            sta $0440          ; $ccb7: 8d 40 04  
            sta $0442          ; $ccba: 8d 42 04  
            sta $0444          ; $ccbd: 8d 44 04  
            rts                ; $ccc0: 60        

;-------------------------------------------------------------------------------
__ccc1:     lda $53            ; $ccc1: a5 53     
            sec                ; $ccc3: 38        
            sbc #$01           ; $ccc4: e9 01     
            asl                ; $ccc6: 0a        
            tax                ; $ccc7: aa        
            lda __c5a6,x       ; $ccc8: bd a6 c5  
            sta $09            ; $cccb: 85 09     
            lda __c5a7,x       ; $cccd: bd a7 c5  
            sta $0a            ; $ccd0: 85 0a     
            ldx #$00           ; $ccd2: a2 00     
            ldy #$00           ; $ccd4: a0 00     
__ccd6:     lda ($09),y        ; $ccd6: b1 09     
            cmp #$fe           ; $ccd8: c9 fe     
            beq __ccf3         ; $ccda: f0 17     
            sta $00,x          ; $ccdc: 95 00     
            iny                ; $ccde: c8        
            inx                ; $ccdf: e8        
            cpx #$05           ; $cce0: e0 05     
            bne __ccd6         ; $cce2: d0 f2     
            sty $86            ; $cce4: 84 86     
            lda ($09),y        ; $cce6: b1 09     
            jsr __f096         ; $cce8: 20 96 f0  
            ldy $86            ; $cceb: a4 86     
            iny                ; $cced: c8        
            ldx #$00           ; $ccee: a2 00     
            jmp __ccd6         ; $ccf0: 4c d6 cc  

;-------------------------------------------------------------------------------
__ccf3:     rts                ; $ccf3: 60        

;-------------------------------------------------------------------------------
__ccf4:     lda $0450          ; $ccf4: ad 50 04  
            bne __cd07         ; $ccf7: d0 0e     
            lda #$01           ; $ccf9: a9 01     
            sta $0450          ; $ccfb: 8d 50 04  
            lda #$0a           ; $ccfe: a9 0a     
            sta $34            ; $cd00: 85 34     
            lda #$10           ; $cd02: a9 10     
            sta $fd            ; $cd04: 85 fd     
            rts                ; $cd06: 60        

;-------------------------------------------------------------------------------
__cd07:     lda $43            ; $cd07: a5 43     
            cmp #$58           ; $cd09: c9 58     
            bcc __cd13         ; $cd0b: 90 06     
            jsr __f4ac         ; $cd0d: 20 ac f4  
            jmp __cd22         ; $cd10: 4c 22 cd  

;-------------------------------------------------------------------------------
__cd13:     jsr __cc24         ; $cd13: 20 24 cc  
            jsr __cc04         ; $cd16: 20 04 cc  
            lda #$00           ; $cd19: a9 00     
            sta $43            ; $cd1b: 85 43     
            sta $9a            ; $cd1d: 85 9a     
            jmp __ca53         ; $cd1f: 4c 53 ca  

;-------------------------------------------------------------------------------
__cd22:     lda $43            ; $cd22: a5 43     
            cmp #$9f           ; $cd24: c9 9f     
            beq __cd45         ; $cd26: f0 1d     
            cmp #$9e           ; $cd28: c9 9e     
            beq __cd4a         ; $cd2a: f0 1e     
            cmp #$9d           ; $cd2c: c9 9d     
            beq __cd4f         ; $cd2e: f0 1f     
            cmp #$9c           ; $cd30: c9 9c     
            beq __cd58         ; $cd32: f0 24     
            cmp #$9b           ; $cd34: c9 9b     
            beq __cd61         ; $cd36: f0 29     
            cmp #$90           ; $cd38: c9 90     
            bcs __cd66         ; $cd3a: b0 2a     
            cmp #$86           ; $cd3c: c9 86     
            bcs __cd69         ; $cd3e: b0 29     
            cmp #$70           ; $cd40: c9 70     
            bcs __cd6c         ; $cd42: b0 28     
            rts                ; $cd44: 60        

;-------------------------------------------------------------------------------
__cd45:     dec $43            ; $cd45: c6 43     
            jmp __cd6f         ; $cd47: 4c 6f cd  

;-------------------------------------------------------------------------------
__cd4a:     dec $43            ; $cd4a: c6 43     
            jmp __cd7f         ; $cd4c: 4c 7f cd  

;-------------------------------------------------------------------------------
__cd4f:     ldy #$1c           ; $cd4f: a0 1c     
            dec $43            ; $cd51: c6 43     
            lda #$06           ; $cd53: a9 06     
            jmp __c823         ; $cd55: 4c 23 c8  

;-------------------------------------------------------------------------------
__cd58:     ldy #$1c           ; $cd58: a0 1c     
            dec $43            ; $cd5a: c6 43     
            lda #$08           ; $cd5c: a9 08     
            jmp __c823         ; $cd5e: 4c 23 c8  

;-------------------------------------------------------------------------------
__cd61:     dec $43            ; $cd61: c6 43     
            jmp __cd89         ; $cd63: 4c 89 cd  

;-------------------------------------------------------------------------------
__cd66:     jmp __cd9d         ; $cd66: 4c 9d cd  

;-------------------------------------------------------------------------------
__cd69:     jmp __cdb1         ; $cd69: 4c b1 cd  

;-------------------------------------------------------------------------------
__cd6c:     jmp __ce24         ; $cd6c: 4c 24 ce  

;-------------------------------------------------------------------------------
__cd6f:     ldy #$0c           ; $cd6f: a0 0c     
            lda #$0a           ; $cd71: a9 0a     
            jmp __c823         ; $cd73: 4c 23 c8  

;-------------------------------------------------------------------------------
__cd76:     lda ($00),y        ; $cd76: b1 00     
            sta $0331,y        ; $cd78: 99 31 03  
            dey                ; $cd7b: 88        
            bpl __cd76         ; $cd7c: 10 f8     
            rts                ; $cd7e: 60        

;-------------------------------------------------------------------------------
__cd7f:     jsr __cbae         ; $cd7f: 20 ae cb  
            ldy #$16           ; $cd82: a0 16     
            lda #$0c           ; $cd84: a9 0c     
            jmp __c823         ; $cd86: 4c 23 c8  

;-------------------------------------------------------------------------------
__cd89:     ldy #$0c           ; $cd89: a0 0c     
            lda #$0e           ; $cd8b: a9 0e     
            jsr __c823         ; $cd8d: 20 23 c8  
            lda #$03           ; $cd90: a9 03     
            sta $02            ; $cd92: 85 02     
            lda #$18           ; $cd94: a9 18     
            sta $03            ; $cd96: 85 03     
            lda #$50           ; $cd98: a9 50     
            jmp __f08c         ; $cd9a: 4c 8c f0  

;-------------------------------------------------------------------------------
__cd9d:     lda #$8d           ; $cd9d: a9 8d     
            sta $00            ; $cd9f: 85 00     
            lda #$20           ; $cda1: a9 20     
            sta $01            ; $cda3: 85 01     
            lda $43            ; $cda5: a5 43     
            and #$01           ; $cda7: 29 01     
            beq __cdae         ; $cda9: f0 03     
            jmp __eb89         ; $cdab: 4c 89 eb  

;-------------------------------------------------------------------------------
__cdae:     jmp __eb92         ; $cdae: 4c 92 eb  

;-------------------------------------------------------------------------------
__cdb1:     cmp #$8f           ; $cdb1: c9 8f     
            bne __cdd7         ; $cdb3: d0 22     
            dec $43            ; $cdb5: c6 43     
            ldy #$10           ; $cdb7: a0 10     
            lda #$10           ; $cdb9: a9 10     
            jsr __c823         ; $cdbb: 20 23 c8  
            lda #$01           ; $cdbe: a9 01     
            sta $fe            ; $cdc0: 85 fe     
            lda #$68           ; $cdc2: a9 68     
            sta $00            ; $cdc4: 85 00     
            lda #$3e           ; $cdc6: a9 3e     
            sta $01            ; $cdc8: 85 01     
__cdca:     lda #$40           ; $cdca: a9 40     
            sta $02            ; $cdcc: 85 02     
            lda #$46           ; $cdce: a9 46     
            sta $03            ; $cdd0: 85 03     
            lda #$50           ; $cdd2: a9 50     
            jmp __f080         ; $cdd4: 4c 80 f0  

;-------------------------------------------------------------------------------
__cdd7:     lda $0250          ; $cdd7: ad 50 02  
            cmp #$a0           ; $cdda: c9 a0     
            beq __cdef         ; $cddc: f0 11     
            cmp #$ff           ; $cdde: c9 ff     
            beq __cdf3         ; $cde0: f0 11     
            clc                ; $cde2: 18        
            adc #$02           ; $cde3: 69 02     
            sta $01            ; $cde5: 85 01     
            lda $0253          ; $cde7: ad 53 02  
            sta $00            ; $cdea: 85 00     
            jmp __cdca         ; $cdec: 4c ca cd  

;-------------------------------------------------------------------------------
__cdef:     lda #$80           ; $cdef: a9 80     
            sta $fe            ; $cdf1: 85 fe     
__cdf3:     lda #$18           ; $cdf3: a9 18     
            sta $03            ; $cdf5: 85 03     
            lda #$50           ; $cdf7: a9 50     
            jsr __f08c         ; $cdf9: 20 8c f0  
            lda #$eb           ; $cdfc: a9 eb     
            sta $00            ; $cdfe: 85 00     
            lda #$23           ; $ce00: a9 23     
            sta $01            ; $ce02: 85 01     
            lda #$12           ; $ce04: a9 12     
            jsr __c815         ; $ce06: 20 15 c8  
            lda #$01           ; $ce09: a9 01     
            jmp __ce0e         ; $ce0b: 4c 0e ce  

;-------------------------------------------------------------------------------
__ce0e:     php                ; $ce0e: 08        
            lda #$8d           ; $ce0f: a9 8d     
            sta $00            ; $ce11: 85 00     
            lda #$22           ; $ce13: a9 22     
            sta $01            ; $ce15: 85 01     
            plp                ; $ce17: 28        
            bne __ce1f         ; $ce18: d0 05     
            lda #$16           ; $ce1a: a9 16     
            jmp __c815         ; $ce1c: 4c 15 c8  

;-------------------------------------------------------------------------------
__ce1f:     lda #$14           ; $ce1f: a9 14     
            jmp __c815         ; $ce21: 4c 15 c8  

;-------------------------------------------------------------------------------
__ce24:     cmp #$85           ; $ce24: c9 85     
            beq __ce2f         ; $ce26: f0 07     
            lda $43            ; $ce28: a5 43     
            and #$01           ; $ce2a: 29 01     
            jmp __ce0e         ; $ce2c: 4c 0e ce  

;-------------------------------------------------------------------------------
__ce2f:     lda #$04           ; $ce2f: a9 04     
            sta $fd            ; $ce31: 85 fd     
            ldy #$04           ; $ce33: a0 04     
            lda #$18           ; $ce35: a9 18     
            jsr __c823         ; $ce37: 20 23 c8  
            lda #$78           ; $ce3a: a9 78     
            sta $00            ; $ce3c: 85 00     
            lda #$20           ; $ce3e: a9 20     
            sta $01            ; $ce40: 85 01     
            lda #$c8           ; $ce42: a9 c8     
            sta $02            ; $ce44: 85 02     
            lda #$22           ; $ce46: a9 22     
            sta $03            ; $ce48: 85 03     
            lda #$b0           ; $ce4a: a9 b0     
            jsr __f080         ; $ce4c: 20 80 f0  
            dec $43            ; $ce4f: c6 43     
            lda #$a0           ; $ce51: a9 a0     
            sta $00            ; $ce53: 85 00     
            lda #$30           ; $ce55: a9 30     
            sta $01            ; $ce57: 85 01     
            lda #$04           ; $ce59: a9 04     
            jsr __ead4         ; $ce5b: 20 d4 ea  
            lda #$00           ; $ce5e: a9 00     
            jsr __f086         ; $ce60: 20 86 f0  
            lda #$28           ; $ce63: a9 28     
            sta $02e8          ; $ce65: 8d e8 02  
            sta $02ec          ; $ce68: 8d ec 02  
            lda #$30           ; $ce6b: a9 30     
            sta $02f0          ; $ce6d: 8d f0 02  
            sta $02f8          ; $ce70: 8d f8 02  
            lda #$38           ; $ce73: a9 38     
            sta $02f4          ; $ce75: 8d f4 02  
            sta $02fc          ; $ce78: 8d fc 02  
            rts                ; $ce7b: 60        

;-------------------------------------------------------------------------------
__ce7c:     lda $58            ; $ce7c: a5 58     
            beq __ce94         ; $ce7e: f0 14     
            lda $0102          ; $ce80: ad 02 01  
            bne __ce8b         ; $ce83: d0 06     
            sta $4015          ; $ce85: 8d 15 40  
            sta $0100          ; $ce88: 8d 00 01  
__ce8b:     lda $15            ; $ce8b: a5 15     
            .hex 29            ; $ce8d: 29        Suspected data
__ce8e:     jsr $03f0          ; $ce8e: 20 f0 03  
            jmp __cf2b         ; $ce91: 4c 2b cf  

;-------------------------------------------------------------------------------
__ce94:     lda $0516          ; $ce94: ad 16 05  
            bne __ceae         ; $ce97: d0 15     
            lda $0517          ; $ce99: ad 17 05  
            beq __cea2         ; $ce9c: f0 04     
            dec $0517          ; $ce9e: ce 17 05  
            rts                ; $cea1: 60        

;-------------------------------------------------------------------------------
__cea2:     jsr __cc04         ; $cea2: 20 04 cc  
            jsr __cfa8         ; $cea5: 20 a8 cf  
            lda $9a            ; $cea8: a5 9a     
            cmp #$01           ; $ceaa: c9 01     
            bne __ceb1         ; $ceac: d0 03     
__ceae:     jmp __cf1c         ; $ceae: 4c 1c cf  

;-------------------------------------------------------------------------------
__ceb1:     lda $bf            ; $ceb1: a5 bf     
            beq __ceb8         ; $ceb3: f0 03     
            jmp __cf13         ; $ceb5: 4c 13 cf  

;-------------------------------------------------------------------------------
__ceb8:     lda $96            ; $ceb8: a5 96     
            cmp #$ff           ; $ceba: c9 ff     
            bne __cec1         ; $cebc: d0 03     
            jmp __cf19         ; $cebe: 4c 19 cf  

;-------------------------------------------------------------------------------
__cec1:     cmp #$08           ; $cec1: c9 08     
            beq __ced6         ; $cec3: f0 11     
            cmp #$04           ; $cec5: c9 04     
            beq __ced6         ; $cec7: f0 0d     
            .hex a5            ; $cec9: a5        Suspected data
__ceca:     cli                ; $ceca: 58        
            beq __ced3         ; $cecb: f0 06     
            jsr __ebda         ; $cecd: 20 da eb  
            .hex 4c d6         ; $ced0: 4c d6     Suspected data
__ced2:     .hex ce            ; $ced2: ce        Suspected data
__ced3:     jsr __d175         ; $ced3: 20 75 d1  
__ced6:     jsr __eb06         ; $ced6: 20 06 eb  
            jsr __ebb6         ; $ced9: 20 b6 eb  
            jsr __d041         ; $cedc: 20 41 d0  
            jsr __d1a4         ; $cedf: 20 a4 d1  
            jsr __ea5f         ; $cee2: 20 5f ea  
            jsr __e1e5         ; $cee5: 20 e5 e1  
            jsr __ee79         ; $cee8: 20 79 ee  
            lda $53            ; $ceeb: a5 53     
            cmp #$03           ; $ceed: c9 03     
            beq __cf01         ; $ceef: f0 10     
            cmp #$04           ; $cef1: c9 04     
            beq __cf0d         ; $cef3: f0 18     
            jsr __da16         ; $cef5: 20 16 da  
            jsr __e19a         ; $cef8: 20 9a e1  
            jsr __ec29         ; $cefb: 20 29 ec  
            jmp __cf1c         ; $cefe: 4c 1c cf  

;-------------------------------------------------------------------------------
__cf01:     .hex 20            ; $cf01: 20        Suspected data
__cf02:     .hex 34 e8         ; $cf02: 34 e8     Invalid Opcode - NOP $e8,x
            jsr __e981         ; $cf04: 20 81 e9  
            jsr __ec29         ; $cf07: 20 29 ec  
            jmp __cf1c         ; $cf0a: 4c 1c cf  

;-------------------------------------------------------------------------------
__cf0d:     jsr __ec29         ; $cf0d: 20 29 ec  
            jmp __cf1c         ; $cf10: 4c 1c cf  

;-------------------------------------------------------------------------------
__cf13:     jsr __ee0c         ; $cf13: 20 0c ee  
            jmp __cf1c         ; $cf16: 4c 1c cf  

;-------------------------------------------------------------------------------
__cf19:     jsr __d0c0         ; $cf19: 20 c0 d0  
__cf1c:     jsr __cf42         ; $cf1c: 20 42 cf  
            lda $0516          ; $cf1f: ad 16 05  
            bne __cf2a         ; $cf22: d0 06     
            jsr __d04c         ; $cf24: 20 4c d0  
            jsr __f4ac         ; $cf27: 20 ac f4  
__cf2a:     rts                ; $cf2a: 60        

;-------------------------------------------------------------------------------
__cf2b:     lda #$01           ; $cf2b: a9 01     
            sta $4e            ; $cf2d: 85 4e     
            sta $0512          ; $cf2f: 8d 12 05  
            sta $55            ; $cf32: 85 55     
            lda #$20           ; $cf34: a9 20     
            sta $44            ; $cf36: 85 44     
            lda #$00           ; $cf38: a9 00     
            sta $58            ; $cf3a: 85 58     
            sta $0510          ; $cf3c: 8d 10 05  
            jmp __ca53         ; $cf3f: 4c 53 ca  

;-------------------------------------------------------------------------------
__cf42:     lda $15            ; $cf42: a5 15     
            and #$10           ; $cf44: 29 10     
            beq __cf8f         ; $cf46: f0 47     
            lda $58            ; $cf48: a5 58     
            beq __cf55         ; $cf4a: f0 09     
            lda #$00           ; $cf4c: a9 00     
            sta $58            ; $cf4e: 85 58     
            lda $15            ; $cf50: a5 15     
            jmp __c98a         ; $cf52: 4c 8a c9  

;-------------------------------------------------------------------------------
__cf55:     lda $15            ; $cf55: a5 15     
            cmp $0514          ; $cf57: cd 14 05  
            beq __cf92         ; $cf5a: f0 36     
            sta $0514          ; $cf5c: 8d 14 05  
            lda $0516          ; $cf5f: ad 16 05  
            beq __cf7a         ; $cf62: f0 16     
            lda $0517          ; $cf64: ad 17 05  
            bne __cf79         ; $cf67: d0 10     
            sta $0516          ; $cf69: 8d 16 05  
            lda $0f            ; $cf6c: a5 0f     
            sta $fc            ; $cf6e: 85 fc     
            lda $11            ; $cf70: a5 11     
            and #$ef           ; $cf72: 29 ef     
            sta $11            ; $cf74: 85 11     
            jmp __cf87         ; $cf76: 4c 87 cf  

;-------------------------------------------------------------------------------
__cf79:     rts                ; $cf79: 60        

;-------------------------------------------------------------------------------
__cf7a:     lda #$01           ; $cf7a: a9 01     
            sta $0516          ; $cf7c: 8d 16 05  
            lda $fc            ; $cf7f: a5 fc     
            sta $0f            ; $cf81: 85 0f     
            lda #$00           ; $cf83: a9 00     
            sta $fc            ; $cf85: 85 fc     
__cf87:     lda #$40           ; $cf87: a9 40     
            sta $0517          ; $cf89: 8d 17 05  
            sta $fd            ; $cf8c: 85 fd     
            rts                ; $cf8e: 60        

;-------------------------------------------------------------------------------
__cf8f:     sta $0514          ; $cf8f: 8d 14 05  
__cf92:     lda $0517          ; $cf92: ad 17 05  
            beq __cf9b         ; $cf95: f0 04     
            dec $0517          ; $cf97: ce 17 05  
            rts                ; $cf9a: 60        

;-------------------------------------------------------------------------------
__cf9b:     lda $0516          ; $cf9b: ad 16 05  
            bne __cfa1         ; $cf9e: d0 01     
            rts                ; $cfa0: 60        

;-------------------------------------------------------------------------------
__cfa1:     lda $11            ; $cfa1: a5 11     
            ora #$10           ; $cfa3: 09 10     
            sta $11            ; $cfa5: 85 11     
            rts                ; $cfa7: 60        

;-------------------------------------------------------------------------------
__cfa8:     ldx #$00           ; $cfa8: a2 00     
            ldy #$00           ; $cfaa: a0 00     
__cfac:     lda $41,x          ; $cfac: b5 41     
            bne __cfb8         ; $cfae: d0 08     
            lda #$ff           ; $cfb0: a9 ff     
            sta $02c0,y        ; $cfb2: 99 c0 02  
            sta $02c4,y        ; $cfb5: 99 c4 02  
__cfb8:     inx                ; $cfb8: e8        
            iny                ; $cfb9: c8        
            iny                ; $cfba: c8        
            iny                ; $cfbb: c8        
            iny                ; $cfbc: c8        
            iny                ; $cfbd: c8        
            iny                ; $cfbe: c8        
            iny                ; $cfbf: c8        
            iny                ; $cfc0: c8        
            cpx #$02           ; $cfc1: e0 02     
            bmi __cfac         ; $cfc3: 30 e7     
            rts                ; $cfc5: 60        

;-------------------------------------------------------------------------------
__cfc6:     ldy #$00           ; $cfc6: a0 00     
            sty $0f            ; $cfc8: 84 0f     
            jsr __d008         ; $cfca: 20 08 d0  
__cfcd:     lda $02c0,y        ; $cfcd: b9 c0 02  
            cmp #$ff           ; $cfd0: c9 ff     
            bne __cff9         ; $cfd2: d0 25     
            lda $05            ; $cfd4: a5 05     
            sta $02c3,y        ; $cfd6: 99 c3 02  
            clc                ; $cfd9: 18        
            adc #$08           ; $cfda: 69 08     
            sta $02c7,y        ; $cfdc: 99 c7 02  
            lda $06            ; $cfdf: a5 06     
            sta $02c0,y        ; $cfe1: 99 c0 02  
            sta $02c4,y        ; $cfe4: 99 c4 02  
            lda __c604,x       ; $cfe7: bd 04 c6  
            sta $02c1,y        ; $cfea: 99 c1 02  
            lda #$d4           ; $cfed: a9 d4     
            sta $02c5,y        ; $cfef: 99 c5 02  
            ldx $0f            ; $cff2: a6 0f     
            lda #$03           ; $cff4: a9 03     
            sta $41,x          ; $cff6: 95 41     
            rts                ; $cff8: 60        

;-------------------------------------------------------------------------------
__cff9:     iny                ; $cff9: c8        
            iny                ; $cffa: c8        
            iny                ; $cffb: c8        
            iny                ; $cffc: c8        
            iny                ; $cffd: c8        
            iny                ; $cffe: c8        
            iny                ; $cfff: c8        
            iny                ; $d000: c8        
            inc $0f            ; $d001: e6 0f     
            cpy #$10           ; $d003: c0 10     
            bmi __cfcd         ; $d005: 30 c6     
            rts                ; $d007: 60        

;-------------------------------------------------------------------------------
__d008:     txa                ; $d008: 8a        
            pha                ; $d009: 48        
            tya                ; $d00a: 98        
            pha                ; $d00b: 48        
            lda $58            ; $d00c: a5 58     
            bne __d02a         ; $d00e: d0 1a     
            lda $52            ; $d010: a5 52     
            ora #$18           ; $d012: 09 18     
            sta $01            ; $d014: 85 01     
            lda __c600,x       ; $d016: bd 00 c6  
            sta $00            ; $d019: 85 00     
            lda $05            ; $d01b: a5 05     
            pha                ; $d01d: 48        
            lda $06            ; $d01e: a5 06     
            pha                ; $d020: 48        
            jsr __f342         ; $d021: 20 42 f3  
            pla                ; $d024: 68        
            sta $06            ; $d025: 85 06     
            pla                ; $d027: 68        
            sta $05            ; $d028: 85 05     
__d02a:     jsr __d032         ; $d02a: 20 32 d0  
            pla                ; $d02d: 68        
            tay                ; $d02e: a8        
            pla                ; $d02f: 68        
            tax                ; $d030: aa        
            rts                ; $d031: 60        

;-------------------------------------------------------------------------------
__d032:     lda $0505          ; $d032: ad 05 05  
            ora #$01           ; $d035: 09 01     
            sta $0505          ; $d037: 8d 05 05  
            lda #$f9           ; $d03a: a9 f9     
            sta $00            ; $d03c: 85 00     
            jmp __f435         ; $d03e: 4c 35 f4  

;-------------------------------------------------------------------------------
__d041:     lda $2e            ; $d041: a5 2e     
            cmp #$10           ; $d043: c9 10     
            bpl __d04b         ; $d045: 10 04     
            lda #$20           ; $d047: a9 20     
            sta $fc            ; $d049: 85 fc     
__d04b:     rts                ; $d04b: 60        

;-------------------------------------------------------------------------------
__d04c:     lda $9a            ; $d04c: a5 9a     
            bne __d092         ; $d04e: d0 42     
            ldx $53            ; $d050: a6 53     
            cpx #$04           ; $d052: e0 04     
            beq __d063         ; $d054: f0 0d     
            lda $5a            ; $d056: a5 5a     
            beq __d0bf         ; $d058: f0 65     
            dex                ; $d05a: ca        
            lda __c1fa,x       ; $d05b: bd fa c1  
            cmp $59            ; $d05e: c5 59     
            beq __d074         ; $d060: f0 12     
            rts                ; $d062: 60        

;-------------------------------------------------------------------------------
__d063:     ldx #$00           ; $d063: a2 00     
__d065:     lda $c1,x          ; $d065: b5 c1     
            beq __d0bf         ; $d067: f0 56     
            inx                ; $d069: e8        
            stx $044f          ; $d06a: 8e 4f 04  
            cpx #$08           ; $d06d: e0 08     
            bne __d065         ; $d06f: d0 f4     
            jmp __d086         ; $d071: 4c 86 d0  

;-------------------------------------------------------------------------------
__d074:     jsr __eae1         ; $d074: 20 e1 ea  
            lda #$04           ; $d077: a9 04     
            jsr __ead4         ; $d079: 20 d4 ea  
            jsr __eacd         ; $d07c: 20 cd ea  
            jsr __f088         ; $d07f: 20 88 f0  
            lda #$02           ; $d082: a9 02     
            sta $fd            ; $d084: 85 fd     
__d086:     lda #$00           ; $d086: a9 00     
            sta $fc            ; $d088: 85 fc     
            lda #$01           ; $d08a: a9 01     
            sta $9a            ; $d08c: 85 9a     
            lda #$00           ; $d08e: a9 00     
            sta $3a            ; $d090: 85 3a     
__d092:     lda $3a            ; $d092: a5 3a     
            bne __d0bf         ; $d094: d0 29     
            inc $53            ; $d096: e6 53     
            lda $53            ; $d098: a5 53     
            cmp #$02           ; $d09a: c9 02     
            beq __d0a5         ; $d09c: f0 07     
            cmp #$05           ; $d09e: c9 05     
            bcs __d0aa         ; $d0a0: b0 08     
            jmp __d0b5         ; $d0a2: 4c b5 d0  

;-------------------------------------------------------------------------------
__d0a5:     inc $53            ; $d0a5: e6 53     
            jmp __d0b5         ; $d0a7: 4c b5 d0  

;-------------------------------------------------------------------------------
__d0aa:     lda #$01           ; $d0aa: a9 01     
            sta $53            ; $d0ac: 85 53     
            inc $54            ; $d0ae: e6 54     
            lda #$a0           ; $d0b0: a9 a0     
            sta $43            ; $d0b2: 85 43     
            rts                ; $d0b4: 60        

;-------------------------------------------------------------------------------
__d0b5:     lda #$8d           ; $d0b5: a9 8d     
            sta $43            ; $d0b7: 85 43     
            lda #$00           ; $d0b9: a9 00     
            sta $4f            ; $d0bb: 85 4f     
            sta $9a            ; $d0bd: 85 9a     
__d0bf:     rts                ; $d0bf: 60        

;-------------------------------------------------------------------------------
__d0c0:     lda #$00           ; $d0c0: a9 00     
            sta $fc            ; $d0c2: 85 fc     
            lda #$10           ; $d0c4: a9 10     
            jsr __d9e6         ; $d0c6: 20 e6 d9  
            beq __d138         ; $d0c9: f0 6d     
            lda $98            ; $d0cb: a5 98     
            cmp #$ff           ; $d0cd: c9 ff     
            beq __d130         ; $d0cf: f0 5f     
            lda $98            ; $d0d1: a5 98     
            bne __d0e4         ; $d0d3: d0 0f     
            lda $58            ; $d0d5: a5 58     
            bne __d0dd         ; $d0d7: d0 04     
            lda #$80           ; $d0d9: a9 80     
            sta $fe            ; $d0db: 85 fe     
__d0dd:     lda #$40           ; $d0dd: a9 40     
            sta $3a            ; $d0df: 85 3a     
            inc $98            ; $d0e1: e6 98     
            rts                ; $d0e3: 60        

;-------------------------------------------------------------------------------
__d0e4:     lda $3a            ; $d0e4: a5 3a     
            beq __d0f8         ; $d0e6: f0 10     
            cmp #$0e           ; $d0e8: c9 0e     
            bcc __d138         ; $d0ea: 90 4c     
            lda $58            ; $d0ec: a5 58     
            bne __d0f4         ; $d0ee: d0 04     
            lda #$01           ; $d0f0: a9 01     
            sta $ff            ; $d0f2: 85 ff     
__d0f4:     lda #$00           ; $d0f4: a9 00     
            sta $3a            ; $d0f6: 85 3a     
__d0f8:     lda $0201          ; $d0f8: ad 01 02  
            cmp #$6c           ; $d0fb: c9 6c     
            bcs __d101         ; $d0fd: b0 02     
            lda #$6c           ; $d0ff: a9 6c     
__d101:     clc                ; $d101: 18        
            adc #$04           ; $d102: 69 04     
            cmp #$7c           ; $d104: c9 7c     
            bcc __d11f         ; $d106: 90 17     
            inc $98            ; $d108: e6 98     
            lda $98            ; $d10a: a5 98     
            cmp #$05           ; $d10c: c9 05     
            beq __d115         ; $d10e: f0 05     
            lda #$6c           ; $d110: a9 6c     
            jmp __d11f         ; $d112: 4c 1f d1  

;-------------------------------------------------------------------------------
__d115:     lda $58            ; $d115: a5 58     
            beq __d11d         ; $d117: f0 04     
            lda #$7d           ; $d119: a9 7d     
            sta $3a            ; $d11b: 85 3a     
__d11d:     lda #$7c           ; $d11d: a9 7c     
__d11f:     sta $02            ; $d11f: 85 02     
            jsr __eae1         ; $d121: 20 e1 ea  
            jsr __eacd         ; $d124: 20 cd ea  
            jsr __f082         ; $d127: 20 82 f0  
            lda $98            ; $d12a: a5 98     
            cmp #$05           ; $d12c: c9 05     
            bne __d138         ; $d12e: d0 08     
__d130:     lda #$ff           ; $d130: a9 ff     
            sta $98            ; $d132: 85 98     
            lda $3a            ; $d134: a5 3a     
            beq __d139         ; $d136: f0 01     
__d138:     rts                ; $d138: 60        

;-------------------------------------------------------------------------------
__d139:     ldx $52            ; $d139: a6 52     
            jsr __cab9         ; $d13b: 20 b9 ca  
            lda $55            ; $d13e: a5 55     
            bne __d14b         ; $d140: d0 09     
            lda #$01           ; $d142: a9 01     
            sta $4e            ; $d144: 85 4e     
            lda #$87           ; $d146: a9 87     
            sta $43            ; $d148: 85 43     
            rts                ; $d14a: 60        

;-------------------------------------------------------------------------------
__d14b:     lda $51            ; $d14b: a5 51     
            cmp #$1c           ; $d14d: c9 1c     
            bne __d169         ; $d14f: d0 18     
            lda $52            ; $d151: a5 52     
            eor #$01           ; $d153: 49 01     
            tax                ; $d155: aa        
            stx $52            ; $d156: 86 52     
            lda $0406,x        ; $d158: bd 06 04  
            beq __d166         ; $d15b: f0 09     
            txa                ; $d15d: 8a        
            eor #$01           ; $d15e: 49 01     
            tax                ; $d160: aa        
            stx $52            ; $d161: 86 52     
            jmp __d169         ; $d163: 4c 69 d1  

;-------------------------------------------------------------------------------
__d166:     jsr __caa9         ; $d166: 20 a9 ca  
__d169:     lda #$87           ; $d169: a9 87     
            sta $43            ; $d16b: 85 43     
            sta $040b          ; $d16d: 8d 0b 04  
            lda #$00           ; $d170: a9 00     
            sta $4f            ; $d172: 85 4f     
            rts                ; $d174: 60        

;-------------------------------------------------------------------------------
__d175:     lda $52            ; $d175: a5 52     
            asl                ; $d177: 0a        
            tax                ; $d178: aa        
            lda $15,x          ; $d179: b5 15     
            and #$0f           ; $d17b: 29 0f     
            sta $56            ; $d17d: 85 56     
            beq __d189         ; $d17f: f0 08     
            lsr                ; $d181: 4a        
            lsr                ; $d182: 4a        
            bne __d189         ; $d183: d0 04     
            lda $56            ; $d185: a5 56     
            sta $57            ; $d187: 85 57     
__d189:     lda $96            ; $d189: a5 96     
            cmp #$01           ; $d18b: c9 01     
            bne __d199         ; $d18d: d0 0a     
            lda $15,x          ; $d18f: b5 15     
            and #$80           ; $d191: 29 80     
            beq __d199         ; $d193: f0 04     
            lda #$04           ; $d195: a9 04     
            sta $96            ; $d197: 85 96     
__d199:     rts                ; $d199: 60        

;-------------------------------------------------------------------------------
__d19a:     lda $11            ; $d19a: a5 11     
            and #$e7           ; $d19c: 29 e7     
            sta $2001          ; $d19e: 8d 01 20  
            sta $11            ; $d1a1: 85 11     
            rts                ; $d1a3: 60        

;-------------------------------------------------------------------------------
__d1a4:     lda $96            ; $d1a4: a5 96     
            cmp #$01           ; $d1a6: c9 01     
            beq __d1bb         ; $d1a8: f0 11     
__d1aa:     cmp #$02           ; $d1aa: c9 02     
            beq __d1c3         ; $d1ac: f0 15     
            cmp #$04           ; $d1ae: c9 04     
            beq __d1c6         ; $d1b0: f0 14     
            cmp #$08           ; $d1b2: c9 08     
            beq __d1c9         ; $d1b4: f0 13     
            cmp #$0a           ; $d1b6: c9 0a     
            beq __d1cc         ; $d1b8: f0 12     
            rts                ; $d1ba: 60        

;-------------------------------------------------------------------------------
__d1bb:     jsr __d1cf         ; $d1bb: 20 cf d1  
            lda $96            ; $d1be: a5 96     
            jmp __d1aa         ; $d1c0: 4c aa d1  

;-------------------------------------------------------------------------------
__d1c3:     jmp __d37e         ; $d1c3: 4c 7e d3  

;-------------------------------------------------------------------------------
__d1c6:     jmp __d547         ; $d1c6: 4c 47 d5  

;-------------------------------------------------------------------------------
__d1c9:     jmp __d697         ; $d1c9: 4c 97 d6  

;-------------------------------------------------------------------------------
__d1cc:     jmp __d6c6         ; $d1cc: 4c c6 d6  

;-------------------------------------------------------------------------------
__d1cf:     lda $56            ; $d1cf: a5 56     
            cmp #$01           ; $d1d1: c9 01     
            beq __d1e5         ; $d1d3: f0 10     
            cmp #$02           ; $d1d5: c9 02     
            beq __d1e5         ; $d1d7: f0 0c     
            cmp #$04           ; $d1d9: c9 04     
            beq __d1e2         ; $d1db: f0 05     
            cmp #$08           ; $d1dd: c9 08     
            beq __d1e2         ; $d1df: f0 01     
            rts                ; $d1e1: 60        

;-------------------------------------------------------------------------------
__d1e2:     jmp __d28b         ; $d1e2: 4c 8b d2  

;-------------------------------------------------------------------------------
__d1e5:     lda #$db           ; $d1e5: a9 db     
            sta $0a            ; $d1e7: 85 0a     
            lda #$36           ; $d1e9: a9 36     
            jsr __d9e8         ; $d1eb: 20 e8 d9  
            bne __d1f3         ; $d1ee: d0 03     
            jmp __d275         ; $d1f0: 4c 75 d2  

;-------------------------------------------------------------------------------
__d1f3:     jsr __d990         ; $d1f3: 20 90 d9  
            beq __d1f9         ; $d1f6: f0 01     
            rts                ; $d1f8: 60        

;-------------------------------------------------------------------------------
__d1f9:     lda $56            ; $d1f9: a5 56     
            cmp #$02           ; $d1fb: c9 02     
            beq __d205         ; $d1fd: f0 06     
            inc $0203          ; $d1ff: ee 03 02  
            jmp __d208         ; $d202: 4c 08 d2  

;-------------------------------------------------------------------------------
__d205:     dec $0203          ; $d205: ce 03 02  
__d208:     jsr __d2cb         ; $d208: 20 cb d2  
            sta $5a            ; $d20b: 85 5a     
            lda $0200          ; $d20d: ad 00 02  
            jsr __e016         ; $d210: 20 16 e0  
            sta $59            ; $d213: 85 59     
            jsr __d8eb         ; $d215: 20 eb d8  
            beq __d233         ; $d218: f0 19     
            ldx $53            ; $d21a: a6 53     
            cpx #$01           ; $d21c: e0 01     
            bne __d227         ; $d21e: d0 07     
            clc                ; $d220: 18        
            adc $0200          ; $d221: 6d 00 02  
            sta $0200          ; $d224: 8d 00 02  
__d227:     jsr __d36a         ; $d227: 20 6a d3  
            cmp #$00           ; $d22a: c9 00     
            beq __d233         ; $d22c: f0 05     
            lda #$08           ; $d22e: a9 08     
            sta $96            ; $d230: 85 96     
            rts                ; $d232: 60        

;-------------------------------------------------------------------------------
__d233:     lda $9b            ; $d233: a5 9b     
            bne __d23e         ; $d235: d0 07     
            lda #$01           ; $d237: a9 01     
            sta $9b            ; $d239: 85 9b     
            jmp __d275         ; $d23b: 4c 75 d2  

;-------------------------------------------------------------------------------
__d23e:     lda #$08           ; $d23e: a9 08     
            sta $ff            ; $d240: 85 ff     
            lda #$00           ; $d242: a9 00     
            sta $9b            ; $d244: 85 9b     
            lda $97            ; $d246: a5 97     
            beq __d262         ; $d248: f0 18     
            cmp #$08           ; $d24a: c9 08     
            beq __d26d         ; $d24c: f0 1f     
            lda #$04           ; $d24e: a9 04     
            sta $97            ; $d250: 85 97     
            lda $85            ; $d252: a5 85     
            beq __d25b         ; $d254: f0 05     
            lda #$00           ; $d256: a9 00     
            jmp __d25d         ; $d258: 4c 5d d2  

;-------------------------------------------------------------------------------
__d25b:     lda #$08           ; $d25b: a9 08     
__d25d:     sta $97            ; $d25d: 85 97     
            jmp __d275         ; $d25f: 4c 75 d2  

;-------------------------------------------------------------------------------
__d262:     lda #$04           ; $d262: a9 04     
            sta $97            ; $d264: 85 97     
            lda #$00           ; $d266: a9 00     
            sta $85            ; $d268: 85 85     
            jmp __d275         ; $d26a: 4c 75 d2  

;-------------------------------------------------------------------------------
__d26d:     lda #$04           ; $d26d: a9 04     
            sta $97            ; $d26f: 85 97     
            lda #$01           ; $d271: a9 01     
            sta $85            ; $d273: 85 85     
__d275:     jsr __eae1         ; $d275: 20 e1 ea  
            lda $97            ; $d278: a5 97     
            sta $02            ; $d27a: 85 02     
            jsr __eacd         ; $d27c: 20 cd ea  
            lda $56            ; $d27f: a5 56     
            cmp #$02           ; $d281: c9 02     
            beq __d288         ; $d283: f0 03     
            jmp __f082         ; $d285: 4c 82 f0  

;-------------------------------------------------------------------------------
__d288:     jmp __f088         ; $d288: 4c 88 f0  

;-------------------------------------------------------------------------------
__d28b:     jsr __eae1         ; $d28b: 20 e1 ea  
            lda #$86           ; $d28e: a9 86     
            sta $02            ; $d290: 85 02     
            lda #$c1           ; $d292: a9 c1     
            sta $03            ; $d294: 85 03     
            jsr __efeb         ; $d296: 20 eb ef  
            lda $53            ; $d299: a5 53     
            sec                ; $d29b: 38        
            sbc #$01           ; $d29c: e9 01     
            asl                ; $d29e: 0a        
            tax                ; $d29f: aa        
            lda __c47b,x       ; $d2a0: bd 7b c4  
            sta $04            ; $d2a3: 85 04     
            lda __c47c,x       ; $d2a5: bd 7c c4  
            sta $05            ; $d2a8: 85 05     
            lda __c483,x       ; $d2aa: bd 83 c4  
            sta $06            ; $d2ad: 85 06     
            lda __c484,x       ; $d2af: bd 84 c4  
            sta $07            ; $d2b2: 85 07     
            jsr __d8ad         ; $d2b4: 20 ad d8  
            beq __d2ca         ; $d2b7: f0 11     
            lda $00            ; $d2b9: a5 00     
            sec                ; $d2bb: 38        
            sbc #$04           ; $d2bc: e9 04     
            sta $a1            ; $d2be: 85 a1     
            lda #$02           ; $d2c0: a9 02     
            sta $96            ; $d2c2: 85 96     
            lda #$00           ; $d2c4: a9 00     
            sta $5b            ; $d2c6: 85 5b     
            sta $5c            ; $d2c8: 85 5c     
__d2ca:     rts                ; $d2ca: 60        

;-------------------------------------------------------------------------------
__d2cb:     jsr __eae1         ; $d2cb: 20 e1 ea  
            lda $96            ; $d2ce: a5 96     
            cmp #$04           ; $d2d0: c9 04     
            beq __d2dd         ; $d2d2: f0 09     
            cmp #$08           ; $d2d4: c9 08     
            beq __d2dd         ; $d2d6: f0 05     
            lda #$2c           ; $d2d8: a9 2c     
            jmp __d2df         ; $d2da: 4c df d2  

;-------------------------------------------------------------------------------
__d2dd:     lda #$4a           ; $d2dd: a9 4a     
__d2df:     jsr __efe8         ; $d2df: 20 e8 ef  
            lda $53            ; $d2e2: a5 53     
            cmp #$01           ; $d2e4: c9 01     
            beq __d2f0         ; $d2e6: f0 08     
            sec                ; $d2e8: 38        
            sbc #$01           ; $d2e9: e9 01     
            asl                ; $d2eb: 0a        
            tax                ; $d2ec: aa        
            jmp __d2fd         ; $d2ed: 4c fd d2  

;-------------------------------------------------------------------------------
__d2f0:     lda #$1a           ; $d2f0: a9 1a     
            jsr __c831         ; $d2f2: 20 31 c8  
            jsr __d91a         ; $d2f5: 20 1a d9  
            sta $0c            ; $d2f8: 85 0c     
            jmp __d323         ; $d2fa: 4c 23 d3  

;-------------------------------------------------------------------------------
__d2fd:     lda __c46b,x       ; $d2fd: bd 6b c4  
            sta $04            ; $d300: 85 04     
            lda __c46c,x       ; $d302: bd 6c c4  
            sta $05            ; $d305: 85 05     
            lda __c473,x       ; $d307: bd 73 c4  
            sta $06            ; $d30a: 85 06     
            lda __c474,x       ; $d30c: bd 74 c4  
            sta $07            ; $d30f: 85 07     
            jsr __d8ad         ; $d311: 20 ad d8  
            sta $0c            ; $d314: 85 0c     
            bne __d323         ; $d316: d0 0b     
            lda $53            ; $d318: a5 53     
            cmp #$03           ; $d31a: c9 03     
            bne __d323         ; $d31c: d0 05     
            jsr __d326         ; $d31e: 20 26 d3  
            sta $0c            ; $d321: 85 0c     
__d323:     lda $0c            ; $d323: a5 0c     
            rts                ; $d325: 60        

;-------------------------------------------------------------------------------
__d326:     lda #$2a           ; $d326: a9 2a     
            jsr __c847         ; $d328: 20 47 c8  
            lda #$00           ; $d32b: a9 00     
            sta $d2            ; $d32d: 85 d2     
__d32f:     lda $d2            ; $d32f: a5 d2     
            cmp #$06           ; $d331: c9 06     
            beq __d365         ; $d333: f0 30     
            tax                ; $d335: aa        
            ldy __c2cc,x       ; $d336: bc cc c2  
            lda $0200,y        ; $d339: b9 00 02  
            cmp #$ff           ; $d33c: c9 ff     
            beq __d34e         ; $d33e: f0 0e     
            sta $01            ; $d340: 85 01     
            lda $0203,y        ; $d342: b9 03 02  
            sta $00            ; $d345: 85 00     
            jsr __efef         ; $d347: 20 ef ef  
            cmp #$01           ; $d34a: c9 01     
            beq __d353         ; $d34c: f0 05     
__d34e:     inc $d2            ; $d34e: e6 d2     
            jmp __d32f         ; $d350: 4c 2f d3  

;-------------------------------------------------------------------------------
__d353:     lda $d2            ; $d353: a5 d2     
            cmp #$03           ; $d355: c9 03     
            bcs __d35e         ; $d357: b0 05     
            lda #$01           ; $d359: a9 01     
            jmp __d360         ; $d35b: 4c 60 d3  

;-------------------------------------------------------------------------------
__d35e:     lda #$02           ; $d35e: a9 02     
__d360:     sta $da            ; $d360: 85 da     
            lda #$01           ; $d362: a9 01     
            rts                ; $d364: 60        

;-------------------------------------------------------------------------------
__d365:     lda #$00           ; $d365: a9 00     
            sta $da            ; $d367: 85 da     
            rts                ; $d369: 60        

;-------------------------------------------------------------------------------
__d36a:     lda $53            ; $d36a: a5 53     
            cmp #$01           ; $d36c: c9 01     
            beq __d373         ; $d36e: f0 03     
            jmp __d37b         ; $d370: 4c 7b d3  

;-------------------------------------------------------------------------------
__d373:     lda #$1c           ; $d373: a9 1c     
            jsr __c831         ; $d375: 20 31 c8  
            jmp __d8ad         ; $d378: 4c ad d8  

;-------------------------------------------------------------------------------
__d37b:     lda #$01           ; $d37b: a9 01     
            rts                ; $d37d: 60        

;-------------------------------------------------------------------------------
__d37e:     lda $56            ; $d37e: a5 56     
            cmp #$08           ; $d380: c9 08     
            beq __d38e         ; $d382: f0 0a     
            cmp #$04           ; $d384: c9 04     
            beq __d38b         ; $d386: f0 03     
            jmp __d4cf         ; $d388: 4c cf d4  

;-------------------------------------------------------------------------------
__d38b:     jmp __d432         ; $d38b: 4c 32 d4  

;-------------------------------------------------------------------------------
__d38e:     lda $5a            ; $d38e: a5 5a     
            beq __d39c         ; $d390: f0 0a     
            jsr __eae1         ; $d392: 20 e1 ea  
            dec $01            ; $d395: c6 01     
            jsr __d50a         ; $d397: 20 0a d5  
            bne __d3cd         ; $d39a: d0 31     
__d39c:     lda #$24           ; $d39c: a9 24     
            sta $0a            ; $d39e: 85 0a     
            lda #$49           ; $d3a0: a9 49     
            jsr __d9e8         ; $d3a2: 20 e8 d9  
            bne __d3af         ; $d3a5: d0 08     
            lda $0200          ; $d3a7: ad 00 02  
            sta $01            ; $d3aa: 85 01     
            jmp __d4cf         ; $d3ac: 4c cf d4  

;-------------------------------------------------------------------------------
__d3af:     jsr __d50a         ; $d3af: 20 0a d5  
            beq __d3e7         ; $d3b2: f0 33     
            cmp #$02           ; $d3b4: c9 02     
            bne __d3bb         ; $d3b6: d0 03     
            jmp __d4cf         ; $d3b8: 4c cf d4  

;-------------------------------------------------------------------------------
__d3bb:     lda $5b            ; $d3bb: a5 5b     
            beq __d3d0         ; $d3bd: f0 11     
            clc                ; $d3bf: 18        
            adc #$01           ; $d3c0: 69 01     
            cmp #$10           ; $d3c2: c9 10     
            beq __d3d2         ; $d3c4: f0 0c     
            bcc __d3d2         ; $d3c6: 90 0a     
            lda #$10           ; $d3c8: a9 10     
            jmp __d3d2         ; $d3ca: 4c d2 d3  

;-------------------------------------------------------------------------------
__d3cd:     jmp __d4cf         ; $d3cd: 4c cf d4  

;-------------------------------------------------------------------------------
__d3d0:     lda #$01           ; $d3d0: a9 01     
__d3d2:     sta $5b            ; $d3d2: 85 5b     
            tax                ; $d3d4: aa        
            dex                ; $d3d5: ca        
            lda __c147,x       ; $d3d6: bd 47 c1  
            sta $02            ; $d3d9: 85 02     
            lda #$00           ; $d3db: a9 00     
            sta $5a            ; $d3dd: 85 5a     
            sta $5c            ; $d3df: 85 5c     
            jsr __d4ee         ; $d3e1: 20 ee d4  
            jmp __d40d         ; $d3e4: 4c 0d d4  

;-------------------------------------------------------------------------------
__d3e7:     lda $5c            ; $d3e7: a5 5c     
            beq __d3f9         ; $d3e9: f0 0e     
            clc                ; $d3eb: 18        
            adc #$01           ; $d3ec: 69 01     
            cmp #$06           ; $d3ee: c9 06     
            beq __d3fb         ; $d3f0: f0 09     
            bcc __d3fb         ; $d3f2: 90 07     
            lda #$01           ; $d3f4: a9 01     
            jmp __d3fb         ; $d3f6: 4c fb d3  

;-------------------------------------------------------------------------------
__d3f9:     lda #$02           ; $d3f9: a9 02     
__d3fb:     sta $5c            ; $d3fb: 85 5c     
            tax                ; $d3fd: aa        
            dex                ; $d3fe: ca        
            lda __c159,x       ; $d3ff: bd 59 c1  
            sta $02            ; $d402: 85 02     
            lda #$00           ; $d404: a9 00     
            sta $5a            ; $d406: 85 5a     
            sta $5b            ; $d408: 85 5b     
            jsr __d4ee         ; $d40a: 20 ee d4  
__d40d:     lda $a1            ; $d40d: a5 a1     
            sta $00            ; $d40f: 85 00     
            sta $0203          ; $d411: 8d 03 02  
            jsr __ead1         ; $d414: 20 d1 ea  
            lda #$00           ; $d417: a9 00     
            sta $04            ; $d419: 85 04     
            lda $02            ; $d41b: a5 02     
            cmp #$54           ; $d41d: c9 54     
            beq __d426         ; $d41f: f0 05     
            lda #$00           ; $d421: a9 00     
            jmp __d42c         ; $d423: 4c 2c d4  

;-------------------------------------------------------------------------------
__d426:     lda #$24           ; $d426: a9 24     
            sta $02            ; $d428: 85 02     
            lda #$01           ; $d42a: a9 01     
__d42c:     jsr __f096         ; $d42c: 20 96 f0  
            jmp __d4cf         ; $d42f: 4c cf d4  

;-------------------------------------------------------------------------------
__d432:     lda $5a            ; $d432: a5 5a     
            beq __d445         ; $d434: f0 0f     
            jsr __eae1         ; $d436: 20 e1 ea  
            inc $01            ; $d439: e6 01     
            jsr __d50a         ; $d43b: 20 0a d5  
            cmp #$01           ; $d43e: c9 01     
            beq __d445         ; $d440: f0 03     
            jmp __d4cf         ; $d442: 4c cf d4  

;-------------------------------------------------------------------------------
__d445:     lda #$24           ; $d445: a9 24     
            sta $0a            ; $d447: 85 0a     
            lda #$49           ; $d449: a9 49     
            sta $0b            ; $d44b: 85 0b     
            jsr __d9e6         ; $d44d: 20 e6 d9  
            bne __d45a         ; $d450: d0 08     
            lda $0200          ; $d452: ad 00 02  
            sta $01            ; $d455: 85 01     
            jmp __d4cf         ; $d457: 4c cf d4  

;-------------------------------------------------------------------------------
__d45a:     jsr __d50a         ; $d45a: 20 0a d5  
            beq __d48b         ; $d45d: f0 2c     
            cmp #$02           ; $d45f: c9 02     
            beq __d48b         ; $d461: f0 28     
            lda $5b            ; $d463: a5 5b     
            beq __d471         ; $d465: f0 0a     
            sec                ; $d467: 38        
            sbc #$01           ; $d468: e9 01     
            cmp #$01           ; $d46a: c9 01     
            bcc __d476         ; $d46c: 90 08     
            jmp __d478         ; $d46e: 4c 78 d4  

;-------------------------------------------------------------------------------
__d471:     lda #$0d           ; $d471: a9 0d     
            jmp __d478         ; $d473: 4c 78 d4  

;-------------------------------------------------------------------------------
__d476:     lda #$01           ; $d476: a9 01     
__d478:     sta $5b            ; $d478: 85 5b     
            tax                ; $d47a: aa        
            dex                ; $d47b: ca        
            lda __c147,x       ; $d47c: bd 47 c1  
            sta $02            ; $d47f: 85 02     
            lda #$03           ; $d481: a9 03     
            sta $5c            ; $d483: 85 5c     
            jsr __d4f9         ; $d485: 20 f9 d4  
            jmp __d4b1         ; $d488: 4c b1 d4  

;-------------------------------------------------------------------------------
__d48b:     lda $5c            ; $d48b: a5 5c     
            beq __d49d         ; $d48d: f0 0e     
            clc                ; $d48f: 18        
            adc #$01           ; $d490: 69 01     
            cmp #$06           ; $d492: c9 06     
            beq __d49f         ; $d494: f0 09     
            bcc __d49f         ; $d496: 90 07     
            lda #$01           ; $d498: a9 01     
            jmp __d49f         ; $d49a: 4c 9f d4  

;-------------------------------------------------------------------------------
__d49d:     lda #$01           ; $d49d: a9 01     
__d49f:     sta $5c            ; $d49f: 85 5c     
            sec                ; $d4a1: 38        
            sbc #$01           ; $d4a2: e9 01     
            tax                ; $d4a4: aa        
            lda __c159,x       ; $d4a5: bd 59 c1  
            sta $02            ; $d4a8: 85 02     
            lda #$00           ; $d4aa: a9 00     
            sta $5b            ; $d4ac: 85 5b     
            jsr __d4f9         ; $d4ae: 20 f9 d4  
__d4b1:     lda $a1            ; $d4b1: a5 a1     
            sta $0203          ; $d4b3: 8d 03 02  
            sta $00            ; $d4b6: 85 00     
            jsr __eacd         ; $d4b8: 20 cd ea  
            lda $02            ; $d4bb: a5 02     
            cmp #$54           ; $d4bd: c9 54     
            beq __d4c6         ; $d4bf: f0 05     
            lda #$00           ; $d4c1: a9 00     
            jmp __d4cc         ; $d4c3: 4c cc d4  

;-------------------------------------------------------------------------------
__d4c6:     lda #$24           ; $d4c6: a9 24     
            sta $02            ; $d4c8: 85 02     
            lda #$01           ; $d4ca: a9 01     
__d4cc:     jsr __f096         ; $d4cc: 20 96 f0  
__d4cf:     jsr __d2cb         ; $d4cf: 20 cb d2  
            sta $5a            ; $d4d2: 85 5a     
            beq __d4ed         ; $d4d4: f0 17     
            lda $0200          ; $d4d6: ad 00 02  
            clc                ; $d4d9: 18        
            adc #$08           ; $d4da: 69 08     
            jsr __e016         ; $d4dc: 20 16 e0  
            sta $59            ; $d4df: 85 59     
            lda #$01           ; $d4e1: a9 01     
            sta $96            ; $d4e3: 85 96     
            lda #$00           ; $d4e5: a9 00     
            sta $5c            ; $d4e7: 85 5c     
            sta $5b            ; $d4e9: 85 5b     
            sta $85            ; $d4eb: 85 85     
__d4ed:     rts                ; $d4ed: 60        

;-------------------------------------------------------------------------------
__d4ee:     lda $0200          ; $d4ee: ad 00 02  
            sec                ; $d4f1: 38        
            sbc #$01           ; $d4f2: e9 01     
            sta $01            ; $d4f4: 85 01     
            jmp __d501         ; $d4f6: 4c 01 d5  

;-------------------------------------------------------------------------------
__d4f9:     lda $0200          ; $d4f9: ad 00 02  
            clc                ; $d4fc: 18        
            adc #$01           ; $d4fd: 69 01     
            sta $01            ; $d4ff: 85 01     
__d501:     and #$06           ; $d501: 29 06     
            bne __d509         ; $d503: d0 04     
            lda #$08           ; $d505: a9 08     
            sta $ff            ; $d507: 85 ff     
__d509:     rts                ; $d509: 60        

;-------------------------------------------------------------------------------
__d50a:     jsr __eae1         ; $d50a: 20 e1 ea  
            lda #$2c           ; $d50d: a9 2c     
            jsr __efe8         ; $d50f: 20 e8 ef  
            lda $53            ; $d512: a5 53     
            sec                ; $d514: 38        
            sbc #$01           ; $d515: e9 01     
            asl                ; $d517: 0a        
            tax                ; $d518: aa        
            lda __c48b,x       ; $d519: bd 8b c4  
            sta $04            ; $d51c: 85 04     
            lda __c48c,x       ; $d51e: bd 8c c4  
            sta $05            ; $d521: 85 05     
            lda #$43           ; $d523: a9 43     
            sta $06            ; $d525: 85 06     
            lda #$c1           ; $d527: a9 c1     
            sta $07            ; $d529: 85 07     
            jsr __d8ad         ; $d52b: 20 ad d8  
            sta $08            ; $d52e: 85 08     
            lda $53            ; $d530: a5 53     
            cmp #$01           ; $d532: c9 01     
            bne __d544         ; $d534: d0 0e     
            lda #$1e           ; $d536: a9 1e     
            jsr __c831         ; $d538: 20 31 c8  
            jsr __d8ad         ; $d53b: 20 ad d8  
            beq __d544         ; $d53e: f0 04     
            lda #$02           ; $d540: a9 02     
            sta $08            ; $d542: 85 08     
__d544:     lda $08            ; $d544: a5 08     
            rts                ; $d546: 60        

;-------------------------------------------------------------------------------
__d547:     lda #$ff           ; $d547: a9 ff     
            jsr __d9e6         ; $d549: 20 e6 d9  
            cmp #$00           ; $d54c: c9 00     
            bne __d551         ; $d54e: d0 01     
            rts                ; $d550: 60        

;-------------------------------------------------------------------------------
__d551:     lda $94            ; $d551: a5 94     
            cmp #$f0           ; $d553: c9 f0     
            bcc __d55a         ; $d555: 90 03     
            jmp __d60d         ; $d557: 4c 0d d6  

;-------------------------------------------------------------------------------
__d55a:     jsr __d990         ; $d55a: 20 90 d9  
            beq __d570         ; $d55d: f0 11     
            lda $56            ; $d55f: a5 56     
            cmp #$01           ; $d561: c9 01     
            bne __d56a         ; $d563: d0 05     
            lda #$02           ; $d565: a9 02     
            jmp __d56c         ; $d567: 4c 6c d5  

;-------------------------------------------------------------------------------
__d56a:     lda #$01           ; $d56a: a9 01     
__d56c:     sta $56            ; $d56c: 85 56     
            sta $57            ; $d56e: 85 57     
__d570:     lda $0200          ; $d570: ad 00 02  
            sta $01            ; $d573: 85 01     
            lda #$00           ; $d575: a9 00     
            jsr __ef72         ; $d577: 20 72 ef  
            lda $01            ; $d57a: a5 01     
            sta $0200          ; $d57c: 8d 00 02  
            lda $56            ; $d57f: a5 56     
            cmp #$01           ; $d581: c9 01     
            beq __d58c         ; $d583: f0 07     
            cmp #$02           ; $d585: c9 02     
            beq __d5a1         ; $d587: f0 18     
            jmp __d5b3         ; $d589: 4c b3 d5  

;-------------------------------------------------------------------------------
__d58c:     lda $9e            ; $d58c: a5 9e     
            beq __d59a         ; $d58e: f0 0a     
            inc $0203          ; $d590: ee 03 02  
            lda #$00           ; $d593: a9 00     
            sta $9e            ; $d595: 85 9e     
            jmp __d5b3         ; $d597: 4c b3 d5  

;-------------------------------------------------------------------------------
__d59a:     lda #$01           ; $d59a: a9 01     
            sta $9e            ; $d59c: 85 9e     
            jmp __d5b3         ; $d59e: 4c b3 d5  

;-------------------------------------------------------------------------------
__d5a1:     lda $9e            ; $d5a1: a5 9e     
            beq __d5af         ; $d5a3: f0 0a     
            dec $0203          ; $d5a5: ce 03 02  
            lda #$00           ; $d5a8: a9 00     
            sta $9e            ; $d5aa: 85 9e     
            jmp __d5b3         ; $d5ac: 4c b3 d5  

;-------------------------------------------------------------------------------
__d5af:     lda #$01           ; $d5af: a9 01     
            sta $9e            ; $d5b1: 85 9e     
__d5b3:     lda $0203          ; $d5b3: ad 03 02  
            sta $00            ; $d5b6: 85 00     
            jsr __d800         ; $d5b8: 20 00 d8  
            lda $94            ; $d5bb: a5 94     
            beq __d5e2         ; $d5bd: f0 23     
            lda $01            ; $d5bf: a5 01     
            sec                ; $d5c1: 38        
            sbc #$10           ; $d5c2: e9 10     
            cmp $95            ; $d5c4: c5 95     
            bcc __d5cc         ; $d5c6: 90 04     
            lda #$ff           ; $d5c8: a9 ff     
            sta $95            ; $d5ca: 85 95     
__d5cc:     jsr __d2cb         ; $d5cc: 20 cb d2  
            sta $5a            ; $d5cf: 85 5a     
            beq __d5f1         ; $d5d1: f0 1e     
            .hex a5            ; $d5d3: a5        Suspected data
__d5d4:     .hex 4b 38         ; $d5d4: 4b 38     Invalid Opcode - ALR #$38
            sbc #$11           ; $d5d6: e9 11     
            sta $0200          ; $d5d8: 8d 00 02  
            lda #$01           ; $d5db: a9 01     
            sta $5a            ; $d5dd: 85 5a     
            jmp __d5f6         ; $d5df: 4c f6 d5  

;-------------------------------------------------------------------------------
__d5e2:     lda #$04           ; $d5e2: a9 04     
            sta $ff            ; $d5e4: 85 ff     
            lda #$01           ; $d5e6: a9 01     
            sta $94            ; $d5e8: 85 94     
            lda $01            ; $d5ea: a5 01     
            sta $95            ; $d5ec: 85 95     
            jmp __d5f1         ; $d5ee: 4c f1 d5  

;-------------------------------------------------------------------------------
__d5f1:     lda #$28           ; $d5f1: a9 28     
            jmp __f070         ; $d5f3: 4c 70 f0  

;-------------------------------------------------------------------------------
__d5f6:     jsr __eae1         ; $d5f6: 20 e1 ea  
            lda #$2c           ; $d5f9: a9 2c     
            sta $02            ; $d5fb: 85 02     
            jsr __eacd         ; $d5fd: 20 cd ea  
            lda $57            ; $d600: a5 57     
            and #$03           ; $d602: 29 03     
            lsr                ; $d604: 4a        
            jsr __f096         ; $d605: 20 96 f0  
            lda #$f0           ; $d608: a9 f0     
            sta $94            ; $d60a: 85 94     
            rts                ; $d60c: 60        

;-------------------------------------------------------------------------------
__d60d:     inc $94            ; $d60d: e6 94     
            lda $94            ; $d60f: a5 94     
            cmp #$f4           ; $d611: c9 f4     
            bne __d64f         ; $d613: d0 3a     
            lda $95            ; $d615: a5 95     
            cmp #$ff           ; $d617: c9 ff     
            beq __d642         ; $d619: f0 27     
            lda #$04           ; $d61b: a9 04     
            jsr __f070         ; $d61d: 20 70 f0  
            lda #$00           ; $d620: a9 00     
            sta $042c          ; $d622: 8d 2c 04  
            sta $94            ; $d625: 85 94     
            sta $95            ; $d627: 85 95     
            lda #$01           ; $d629: a9 01     
            sta $96            ; $d62b: 85 96     
            lda $a0            ; $d62d: a5 a0     
            beq __d64f         ; $d62f: f0 1e     
            lda #$01           ; $d631: a9 01     
            sta $9f            ; $d633: 85 9f     
            lda #$4b           ; $d635: a9 4b     
            sta $3f            ; $d637: 85 3f     
            lda #$0a           ; $d639: a9 0a     
            sta $96            ; $d63b: 85 96     
            lda #$40           ; $d63d: a9 40     
            sta $fc            ; $d63f: 85 fc     
            rts                ; $d641: 60        

;-------------------------------------------------------------------------------
__d642:     lda #$00           ; $d642: a9 00     
            sta $042c          ; $d644: 8d 2c 04  
            sta $94            ; $d647: 85 94     
            sta $95            ; $d649: 85 95     
            lda #$ff           ; $d64b: a9 ff     
            sta $96            ; $d64d: 85 96     
__d64f:     rts                ; $d64f: 60        

;-------------------------------------------------------------------------------
            lda #$fe           ; $d650: a9 fe     
            sta $0472          ; $d652: 8d 72 04  
            sta $0473          ; $d655: 8d 73 04  
            ldx #$00           ; $d658: a2 00     
            ldy #$60           ; $d65a: a0 60     
__d65c:     lda $0200,y        ; $d65c: b9 00 02  
            cmp #$ff           ; $d65f: c9 ff     
            beq __d672         ; $d661: f0 0f     
            sta $0461,x        ; $d663: 9d 61 04  
            lda $0203,y        ; $d666: b9 03 02  
            sec                ; $d669: 38        
            sbc #$08           ; $d66a: e9 08     
            sta $0460,x        ; $d66c: 9d 60 04  
            jmp __d67a         ; $d66f: 4c 7a d6  

;-------------------------------------------------------------------------------
__d672:     lda #$00           ; $d672: a9 00     
            sta $0461,x        ; $d674: 9d 61 04  
            sta $0460,x        ; $d677: 9d 60 04  
__d67a:     tya                ; $d67a: 98        
            clc                ; $d67b: 18        
            adc #$08           ; $d67c: 69 08     
            tay                ; $d67e: a8        
            inx                ; $d67f: e8        
            inx                ; $d680: e8        
            inx                ; $d681: e8        
            cpy #$90           ; $d682: c0 90     
            bne __d65c         ; $d684: d0 d6     
            lda #$20           ; $d686: a9 20     
            jsr __c831         ; $d688: 20 31 c8  
            jsr __d8ad         ; $d68b: 20 ad d8  
            beq __d696         ; $d68e: f0 06     
            lda #$08           ; $d690: a9 08     
            sta $96            ; $d692: 85 96     
            lda #$01           ; $d694: a9 01     
__d696:     rts                ; $d696: 60        

;-------------------------------------------------------------------------------
__d697:     lda #$ff           ; $d697: a9 ff     
            jsr __d9e6         ; $d699: 20 e6 d9  
            beq __d6c5         ; $d69c: f0 27     
            jsr __eae1         ; $d69e: 20 e1 ea  
            inc $01            ; $d6a1: e6 01     
            inc $01            ; $d6a3: e6 01     
            lda $57            ; $d6a5: a5 57     
            cmp #$02           ; $d6a7: c9 02     
            beq __d6b1         ; $d6a9: f0 06     
            lda $0201          ; $d6ab: ad 01 02  
            jmp __d6b7         ; $d6ae: 4c b7 d6  

;-------------------------------------------------------------------------------
__d6b1:     lda $0201          ; $d6b1: ad 01 02  
            sec                ; $d6b4: 38        
            sbc #$02           ; $d6b5: e9 02     
__d6b7:     sta $02            ; $d6b7: 85 02     
            jsr __f075         ; $d6b9: 20 75 f0  
            jsr __d2cb         ; $d6bc: 20 cb d2  
            beq __d6c5         ; $d6bf: f0 04     
            lda #$ff           ; $d6c1: a9 ff     
            sta $96            ; $d6c3: 85 96     
__d6c5:     rts                ; $d6c5: 60        

;-------------------------------------------------------------------------------
__d6c6:     lda $3f            ; $d6c6: a5 3f     
            bne __d6cd         ; $d6c8: d0 03     
            jmp __d7bf         ; $d6ca: 4c bf d7  

;-------------------------------------------------------------------------------
__d6cd:     lda #$db           ; $d6cd: a9 db     
            sta $0a            ; $d6cf: 85 0a     
            lda #$36           ; $d6d1: a9 36     
            jsr __d9e8         ; $d6d3: 20 e8 d9  
            bne __d6d9         ; $d6d6: d0 01     
            rts                ; $d6d8: 60        

;-------------------------------------------------------------------------------
__d6d9:     jsr __d990         ; $d6d9: 20 90 d9  
            bne __d6e8         ; $d6dc: d0 0a     
            .hex a5            ; $d6de: a5        Suspected data
__d6df:     lsr $c9,x          ; $d6df: 56 c9     
            ora ($f0,x)        ; $d6e1: 01 f0     
            rol $c9            ; $d6e3: 26 c9     
            .hex 02            ; $d6e5: 02        Invalid Opcode - KIL 
            beq __d710         ; $d6e6: f0 28     
__d6e8:     lda $a2            ; $d6e8: a5 a2     
            asl                ; $d6ea: 0a        
            sta $a2            ; $d6eb: 85 a2     
            beq __d6f2         ; $d6ed: f0 03     
            jmp __d753         ; $d6ef: 4c 53 d7  

;-------------------------------------------------------------------------------
__d6f2:     lda #$20           ; $d6f2: a9 20     
            sta $a2            ; $d6f4: 85 a2     
            lda $9f            ; $d6f6: a5 9f     
            beq __d6fe         ; $d6f8: f0 04     
            cmp #$04           ; $d6fa: c9 04     
            bcc __d703         ; $d6fc: 90 05     
__d6fe:     lda #$02           ; $d6fe: a9 02     
            jmp __d705         ; $d700: 4c 05 d7  

;-------------------------------------------------------------------------------
__d703:     lda #$05           ; $d703: a9 05     
__d705:     sta $9f            ; $d705: 85 9f     
            jmp __d753         ; $d707: 4c 53 d7  

;-------------------------------------------------------------------------------
            inc $0203          ; $d70a: ee 03 02  
            jmp __d713         ; $d70d: 4c 13 d7  

;-------------------------------------------------------------------------------
__d710:     dec $0203          ; $d710: ce 03 02  
__d713:     jsr __d2cb         ; $d713: 20 cb d2  
            sta $5a            ; $d716: 85 5a     
            lda $0200          ; $d718: ad 00 02  
            jsr __e016         ; $d71b: 20 16 e0  
            sta $59            ; $d71e: 85 59     
            jsr __d8eb         ; $d720: 20 eb d8  
            beq __d73e         ; $d723: f0 19     
            ldx $53            ; $d725: a6 53     
            cpx #$01           ; $d727: e0 01     
            bne __d732         ; $d729: d0 07     
            clc                ; $d72b: 18        
            adc $0200          ; $d72c: 6d 00 02  
            sta $0200          ; $d72f: 8d 00 02  
__d732:     jsr __d36a         ; $d732: 20 6a d3  
            beq __d73e         ; $d735: f0 07     
            lda #$08           ; $d737: a9 08     
            sta $96            ; $d739: 85 96     
            jmp __d7bf         ; $d73b: 4c bf d7  

;-------------------------------------------------------------------------------
__d73e:     lda #$08           ; $d73e: a9 08     
            sta $ff            ; $d740: 85 ff     
            lda $9f            ; $d742: a5 9f     
            beq __d74f         ; $d744: f0 09     
            cmp #$06           ; $d746: c9 06     
            bcs __d74f         ; $d748: b0 05     
            inc $9f            ; $d74a: e6 9f     
            jmp __d753         ; $d74c: 4c 53 d7  

;-------------------------------------------------------------------------------
__d74f:     lda #$01           ; $d74f: a9 01     
            sta $9f            ; $d751: 85 9f     
__d753:     ldx $9f            ; $d753: a6 9f     
            dex                ; $d755: ca        
            lda __c1a2,x       ; $d756: bd a2 c1  
            jsr __f070         ; $d759: 20 70 f0  
            lda $9f            ; $d75c: a5 9f     
            lsr                ; $d75e: 4a        
            lsr                ; $d75f: 4a        
            beq __d767         ; $d760: f0 05     
            lda #$00           ; $d762: a9 00     
            jmp __d769         ; $d764: 4c 69 d7  

;-------------------------------------------------------------------------------
__d767:     lda #$01           ; $d767: a9 01     
__d769:     beq __d786         ; $d769: f0 1b     
            lda #$04           ; $d76b: a9 04     
            clc                ; $d76d: 18        
            adc $0203          ; $d76e: 6d 03 02  
            sta $00            ; $d771: 85 00     
            lda $0200          ; $d773: ad 00 02  
            sec                ; $d776: 38        
            sbc #$0e           ; $d777: e9 0e     
            sta $01            ; $d779: 85 01     
            lda #$21           ; $d77b: a9 21     
            sta $03            ; $d77d: 85 03     
            lda #$f6           ; $d77f: a9 f6     
            sta $02            ; $d781: 85 02     
            jmp __d7ad         ; $d783: 4c ad d7  

;-------------------------------------------------------------------------------
__d786:     lda $57            ; $d786: a5 57     
            cmp #$01           ; $d788: c9 01     
            bne __d795         ; $d78a: d0 09     
            lda #$0e           ; $d78c: a9 0e     
            clc                ; $d78e: 18        
            adc $0203          ; $d78f: 6d 03 02  
            jmp __d79b         ; $d792: 4c 9b d7  

;-------------------------------------------------------------------------------
__d795:     lda $0203          ; $d795: ad 03 02  
            sec                ; $d798: 38        
            sbc #$0e           ; $d799: e9 0e     
__d79b:     sta $00            ; $d79b: 85 00     
            lda #$06           ; $d79d: a9 06     
            clc                ; $d79f: 18        
            adc $0200          ; $d7a0: 6d 00 02  
            sta $01            ; $d7a3: 85 01     
            lda #$12           ; $d7a5: a9 12     
            sta $03            ; $d7a7: 85 03     
            lda #$fa           ; $d7a9: a9 fa     
            sta $02            ; $d7ab: 85 02     
__d7ad:     lda $a0            ; $d7ad: a5 a0     
            cmp #$01           ; $d7af: c9 01     
            beq __d7b8         ; $d7b1: f0 05     
            lda #$d8           ; $d7b3: a9 d8     
            jmp __d7ba         ; $d7b5: 4c ba d7  

;-------------------------------------------------------------------------------
__d7b8:     lda #$d0           ; $d7b8: a9 d0     
__d7ba:     sta $04            ; $d7ba: 85 04     
            jmp __f078         ; $d7bc: 4c 78 f0  

;-------------------------------------------------------------------------------
__d7bf:     lda #$12           ; $d7bf: a9 12     
            sta $03            ; $d7c1: 85 03     
            lda $a0            ; $d7c3: a5 a0     
            cmp #$01           ; $d7c5: c9 01     
            beq __d7d3         ; $d7c7: f0 0a     
            lda #$00           ; $d7c9: a9 00     
            sta $0452          ; $d7cb: 8d 52 04  
            lda #$d8           ; $d7ce: a9 d8     
            jmp __d7da         ; $d7d0: 4c da d7  

;-------------------------------------------------------------------------------
__d7d3:     lda #$00           ; $d7d3: a9 00     
            sta $0451          ; $d7d5: 8d 51 04  
            lda #$d0           ; $d7d8: a9 d0     
__d7da:     sta $04            ; $d7da: 85 04     
            jsr __f094         ; $d7dc: 20 94 f0  
            jsr __d7f2         ; $d7df: 20 f2 d7  
            lda #$01           ; $d7e2: a9 01     
            sta $96            ; $d7e4: 85 96     
            lda #$00           ; $d7e6: a9 00     
            sta $a0            ; $d7e8: 85 a0     
            sta $9f            ; $d7ea: 85 9f     
            lda $0519          ; $d7ec: ad 19 05  
            sta $fc            ; $d7ef: 85 fc     
            rts                ; $d7f1: 60        

;-------------------------------------------------------------------------------
__d7f2:     lda #$19           ; $d7f2: a9 19     
            sta $00            ; $d7f4: 85 00     
            lda #$3f           ; $d7f6: a9 3f     
            sta $01            ; $d7f8: 85 01     
            lda #$4e           ; $d7fa: a9 4e     
            jsr __c815         ; $d7fc: 20 15 c8  
            rts                ; $d7ff: 60        

;-------------------------------------------------------------------------------
__d800:     lda $a0            ; $d800: a5 a0     
            beq __d805         ; $d802: f0 01     
            rts                ; $d804: 60        

;-------------------------------------------------------------------------------
__d805:     ldy $53            ; $d805: a4 53     
            cpy #$03           ; $d807: c0 03     
            bne __d80e         ; $d809: d0 03     
            jmp __d8a8         ; $d80b: 4c a8 d8  

;-------------------------------------------------------------------------------
__d80e:     lda $0203          ; $d80e: ad 03 02  
            cpy #$01           ; $d811: c0 01     
            beq __d81e         ; $d813: f0 09     
            cmp #$88           ; $d815: c9 88     
            beq __d827         ; $d817: f0 0e     
            bcc __d827         ; $d819: 90 0c     
            jmp __d8a8         ; $d81b: 4c a8 d8  

;-------------------------------------------------------------------------------
__d81e:     cmp #$28           ; $d81e: c9 28     
            beq __d827         ; $d820: f0 05     
            bcc __d827         ; $d822: 90 03     
            jmp __d8a8         ; $d824: 4c a8 d8  

;-------------------------------------------------------------------------------
__d827:     lda $0200          ; $d827: ad 00 02  
            clc                ; $d82a: 18        
            adc #$08           ; $d82b: 69 08     
            jsr __e016         ; $d82d: 20 16 e0  
            sta $59            ; $d830: 85 59     
            lda $53            ; $d832: a5 53     
            sec                ; $d834: 38        
            sbc #$01           ; $d835: e9 01     
            asl                ; $d837: 0a        
            tax                ; $d838: aa        
            lda $59            ; $d839: a5 59     
            cmp __c1a8,x       ; $d83b: dd a8 c1  
            beq __d849         ; $d83e: f0 09     
            inx                ; $d840: e8        
            cmp __c1a8,x       ; $d841: dd a8 c1  
            beq __d849         ; $d844: f0 03     
            jmp __d8a8         ; $d846: 4c a8 d8  

;-------------------------------------------------------------------------------
__d849:     txa                ; $d849: 8a        
            and #$01           ; $d84a: 29 01     
            beq __d867         ; $d84c: f0 19     
            lda $0452          ; $d84e: ad 52 04  
            bne __d856         ; $d851: d0 03     
            jmp __d8a8         ; $d853: 4c a8 d8  

;-------------------------------------------------------------------------------
__d856:     lda #$02           ; $d856: a9 02     
            sta $a0            ; $d858: 85 a0     
            lda $02d8          ; $d85a: ad d8 02  
            sta $01            ; $d85d: 85 01     
            lda $02db          ; $d85f: ad db 02  
            sta $00            ; $d862: 85 00     
            jmp __d87d         ; $d864: 4c 7d d8  

;-------------------------------------------------------------------------------
__d867:     lda $0451          ; $d867: ad 51 04  
            bne __d86f         ; $d86a: d0 03     
            jmp __d8a8         ; $d86c: 4c a8 d8  

;-------------------------------------------------------------------------------
__d86f:     lda #$01           ; $d86f: a9 01     
            sta $a0            ; $d871: 85 a0     
            lda $02d0          ; $d873: ad d0 02  
            sta $01            ; $d876: 85 01     
            lda $02d3          ; $d878: ad d3 02  
            sta $00            ; $d87b: 85 00     
__d87d:     lda #$2e           ; $d87d: a9 2e     
            jsr __efe8         ; $d87f: 20 e8 ef  
            jsr __eae1         ; $d882: 20 e1 ea  
            lda #$30           ; $d885: a9 30     
            jsr __c847         ; $d887: 20 47 c8  
            jsr __efef         ; $d88a: 20 ef ef  
            beq __d8a8         ; $d88d: f0 19     
            lda $fc            ; $d88f: a5 fc     
            sta $0519          ; $d891: 8d 19 05  
            lda $53            ; $d894: a5 53     
            cmp #$04           ; $d896: c9 04     
            bne __d8a7         ; $d898: d0 0d     
            lda #$19           ; $d89a: a9 19     
            sta $00            ; $d89c: 85 00     
            lda #$3f           ; $d89e: a9 3f     
            sta $01            ; $d8a0: 85 01     
            lda #$46           ; $d8a2: a9 46     
            jsr __c815         ; $d8a4: 20 15 c8  
__d8a7:     rts                ; $d8a7: 60        

;-------------------------------------------------------------------------------
__d8a8:     lda #$00           ; $d8a8: a9 00     
            sta $a0            ; $d8aa: 85 a0     
            rts                ; $d8ac: 60        

;-------------------------------------------------------------------------------
__d8ad:     lda #$f3           ; $d8ad: a9 f3     
            sta $0b            ; $d8af: 85 0b     
            lda #$00           ; $d8b1: a9 00     
            sta $86            ; $d8b3: 85 86     
            ldy #$00           ; $d8b5: a0 00     
            lda ($04),y        ; $d8b7: b1 04     
__d8b9:     sta $00            ; $d8b9: 85 00     
            iny                ; $d8bb: c8        
            lda ($04),y        ; $d8bc: b1 04     
            sta $01            ; $d8be: 85 01     
            iny                ; $d8c0: c8        
            lda ($04),y        ; $d8c1: b1 04     
            clc                ; $d8c3: 18        
            adc $06            ; $d8c4: 65 06     
            sta $02            ; $d8c6: 85 02     
            lda $07            ; $d8c8: a5 07     
            adc #$00           ; $d8ca: 69 00     
            sta $03            ; $d8cc: 85 03     
            sty $86            ; $d8ce: 84 86     
            jsr __eff3         ; $d8d0: 20 f3 ef  
            bne __d8e1         ; $d8d3: d0 0c     
            ldy $86            ; $d8d5: a4 86     
            iny                ; $d8d7: c8        
            lda ($04),y        ; $d8d8: b1 04     
            cmp #$fe           ; $d8da: c9 fe     
            beq __d8e6         ; $d8dc: f0 08     
            jmp __d8b9         ; $d8de: 4c b9 d8  

;-------------------------------------------------------------------------------
__d8e1:     lda #$01           ; $d8e1: a9 01     
            jmp __d8e8         ; $d8e3: 4c e8 d8  

;-------------------------------------------------------------------------------
__d8e6:     lda #$00           ; $d8e6: a9 00     
__d8e8:     sta $0c            ; $d8e8: 85 0c     
            rts                ; $d8ea: 60        

;-------------------------------------------------------------------------------
__d8eb:     lda $5a            ; $d8eb: a5 5a     
            bne __d917         ; $d8ed: d0 28     
            lda $59            ; $d8ef: a5 59     
            beq __d917         ; $d8f1: f0 24     
            and #$01           ; $d8f3: 29 01     
            bne __d904         ; $d8f5: d0 0d     
            lda $56            ; $d8f7: a5 56     
            cmp #$01           ; $d8f9: c9 01     
            beq __d914         ; $d8fb: f0 17     
            cmp #$02           ; $d8fd: c9 02     
            beq __d911         ; $d8ff: f0 10     
            jmp __d917         ; $d901: 4c 17 d9  

;-------------------------------------------------------------------------------
__d904:     lda $56            ; $d904: a5 56     
            cmp #$01           ; $d906: c9 01     
            beq __d911         ; $d908: f0 07     
            cmp #$02           ; $d90a: c9 02     
            beq __d914         ; $d90c: f0 06     
            jmp __d917         ; $d90e: 4c 17 d9  

;-------------------------------------------------------------------------------
__d911:     lda #$ff           ; $d911: a9 ff     
            rts                ; $d913: 60        

;-------------------------------------------------------------------------------
__d914:     lda #$01           ; $d914: a9 01     
            rts                ; $d916: 60        

;-------------------------------------------------------------------------------
__d917:     lda #$00           ; $d917: a9 00     
            rts                ; $d919: 60        

;-------------------------------------------------------------------------------
__d91a:     lda $0200          ; $d91a: ad 00 02  
            clc                ; $d91d: 18        
            adc #$08           ; $d91e: 69 08     
            jsr __e016         ; $d920: 20 16 e0  
            sta $59            ; $d923: 85 59     
            cmp #$01           ; $d925: c9 01     
            beq __d938         ; $d927: f0 0f     
            ldx #$02           ; $d929: a2 02     
            lda #$0c           ; $d92b: a9 0c     
__d92d:     cpx $59            ; $d92d: e4 59     
            beq __d93b         ; $d92f: f0 0a     
            clc                ; $d931: 18        
            adc #$06           ; $d932: 69 06     
            inx                ; $d934: e8        
            jmp __d92d         ; $d935: 4c 2d d9  

;-------------------------------------------------------------------------------
__d938:     sec                ; $d938: 38        
            sbc #$01           ; $d939: e9 01     
__d93b:     tax                ; $d93b: aa        
__d93c:     lda #$00           ; $d93c: a9 00     
            sta $86            ; $d93e: 85 86     
            lda __c08c,x       ; $d940: bd 8c c0  
            sta $00            ; $d943: 85 00     
            inx                ; $d945: e8        
            lda __c08c,x       ; $d946: bd 8c c0  
            sta $01            ; $d949: 85 01     
            inx                ; $d94b: e8        
            lda __c08c,x       ; $d94c: bd 8c c0  
            clc                ; $d94f: 18        
            adc $06            ; $d950: 65 06     
            sta $02            ; $d952: 85 02     
            lda $07            ; $d954: a5 07     
            sta $03            ; $d956: 85 03     
            inx                ; $d958: e8        
            lda __c08c,x       ; $d959: bd 8c c0  
            sta $08            ; $d95c: 85 08     
            inx                ; $d95e: e8        
            lda __c08c,x       ; $d95f: bd 8c c0  
            sta $09            ; $d962: 85 09     
__d964:     jsr __efef         ; $d964: 20 ef ef  
            bne __d98b         ; $d967: d0 22     
            lda $00            ; $d969: a5 00     
            clc                ; $d96b: 18        
            adc $08            ; $d96c: 65 08     
            sta $00            ; $d96e: 85 00     
            dec $01            ; $d970: c6 01     
            inc $86            ; $d972: e6 86     
            lda $09            ; $d974: a5 09     
            cmp $86            ; $d976: c5 86     
            bne __d964         ; $d978: d0 ea     
            inx                ; $d97a: e8        
            lda __c08c,x       ; $d97b: bd 8c c0  
            cmp #$fe           ; $d97e: c9 fe     
            beq __d986         ; $d980: f0 04     
            inx                ; $d982: e8        
            jmp __d93c         ; $d983: 4c 3c d9  

;-------------------------------------------------------------------------------
__d986:     lda #$00           ; $d986: a9 00     
            jmp __d98d         ; $d988: 4c 8d d9  

;-------------------------------------------------------------------------------
__d98b:     lda #$01           ; $d98b: a9 01     
__d98d:     sta $5a            ; $d98d: 85 5a     
            rts                ; $d98f: 60        

;-------------------------------------------------------------------------------
__d990:     lda $56            ; $d990: a5 56     
            cmp #$01           ; $d992: c9 01     
            beq __d99d         ; $d994: f0 07     
            cmp #$02           ; $d996: c9 02     
            beq __d9af         ; $d998: f0 15     
            jmp __d9e3         ; $d99a: 4c e3 d9  

;-------------------------------------------------------------------------------
__d99d:     lda $53            ; $d99d: a5 53     
            asl                ; $d99f: 0a        
            tax                ; $d9a0: aa        
            dex                ; $d9a1: ca        
            lda __c1b4,x       ; $d9a2: bd b4 c1  
            cmp $0203          ; $d9a5: cd 03 02  
            beq __d9e0         ; $d9a8: f0 36     
            bcc __d9e0         ; $d9aa: 90 34     
            jmp __d9e3         ; $d9ac: 4c e3 d9  

;-------------------------------------------------------------------------------
__d9af:     lda $53            ; $d9af: a5 53     
            asl                ; $d9b1: 0a        
            tax                ; $d9b2: aa        
            dex                ; $d9b3: ca        
            dex                ; $d9b4: ca        
            lda __c1b4,x       ; $d9b5: bd b4 c1  
            cmp $0203          ; $d9b8: cd 03 02  
            bcs __d9e0         ; $d9bb: b0 23     
            lda $53            ; $d9bd: a5 53     
            cmp #$04           ; $d9bf: c9 04     
            beq __d9e3         ; $d9c1: f0 20     
            ldx $59            ; $d9c3: a6 59     
            cmp #$03           ; $d9c5: c9 03     
            beq __d9d0         ; $d9c7: f0 07     
            cpx #$06           ; $d9c9: e0 06     
            bne __d9e3         ; $d9cb: d0 16     
            jmp __d9d4         ; $d9cd: 4c d4 d9  

;-------------------------------------------------------------------------------
__d9d0:     cpx #$05           ; $d9d0: e0 05     
            bne __d9e3         ; $d9d2: d0 0f     
__d9d4:     lda $0203          ; $d9d4: ad 03 02  
            cmp #$68           ; $d9d7: c9 68     
            beq __d9e0         ; $d9d9: f0 05     
            bcc __d9e0         ; $d9db: 90 03     
            jmp __d9e3         ; $d9dd: 4c e3 d9  

;-------------------------------------------------------------------------------
__d9e0:     lda #$01           ; $d9e0: a9 01     
            rts                ; $d9e2: 60        

;-------------------------------------------------------------------------------
__d9e3:     lda #$00           ; $d9e3: a9 00     
            rts                ; $d9e5: 60        

;-------------------------------------------------------------------------------
__d9e6:     sta $0a            ; $d9e6: 85 0a     
__d9e8:     sta $0b            ; $d9e8: 85 0b     
            inc $88            ; $d9ea: e6 88     
            lda $88            ; $d9ec: a5 88     
            cmp #$0f           ; $d9ee: c9 0f     
            bcs __d9f5         ; $d9f0: b0 03     
            jmp __d9f9         ; $d9f2: 4c f9 d9  

;-------------------------------------------------------------------------------
__d9f5:     lda #$00           ; $d9f5: a9 00     
            sta $88            ; $d9f7: 85 88     
__d9f9:     cmp #$08           ; $d9f9: c9 08     
            bcs __da06         ; $d9fb: b0 09     
            tax                ; $d9fd: aa        
            lda __c1bc,x       ; $d9fe: bd bc c1  
            and $0a            ; $da01: 25 0a     
            jmp __da0f         ; $da03: 4c 0f da  

;-------------------------------------------------------------------------------
__da06:     sec                ; $da06: 38        
            sbc #$08           ; $da07: e9 08     
            tax                ; $da09: aa        
            lda __c1bc,x       ; $da0a: bd bc c1  
            and $0b            ; $da0d: 25 0b     
__da0f:     beq __da13         ; $da0f: f0 02     
            lda #$01           ; $da11: a9 01     
__da13:     sta $be            ; $da13: 85 be     
            rts                ; $da15: 60        

;-------------------------------------------------------------------------------
__da16:     jsr __e166         ; $da16: 20 66 e1  
            lda #$00           ; $da19: a9 00     
            sta $5d            ; $da1b: 85 5d     
__da1d:     jsr __efd5         ; $da1d: 20 d5 ef  
            lda $0200,x        ; $da20: bd 00 02  
            cmp #$ff           ; $da23: c9 ff     
            bne __da3d         ; $da25: d0 16     
            lda $36            ; $da27: a5 36     
            bne __da40         ; $da29: d0 15     
            lda #$80           ; $da2b: a9 80     
            ldx $5d            ; $da2d: a6 5d     
            sta $5e,x          ; $da2f: 95 5e     
            lda #$10           ; $da31: a9 10     
            sta $37            ; $da33: 85 37     
            jsr __eaf7         ; $da35: 20 f7 ea  
            lda __c443,x       ; $da38: bd 43 c4  
            sta $36            ; $da3b: 85 36     
__da3d:     jsr __da4c         ; $da3d: 20 4c da  
__da40:     lda $5d            ; $da40: a5 5d     
            clc                ; $da42: 18        
            adc #$01           ; $da43: 69 01     
            sta $5d            ; $da45: 85 5d     
            cmp #$09           ; $da47: c9 09     
            bne __da1d         ; $da49: d0 d2     
            rts                ; $da4b: 60        

;-------------------------------------------------------------------------------
__da4c:     ldx $5d            ; $da4c: a6 5d     
            lda $5e,x          ; $da4e: b5 5e     
            cmp #$80           ; $da50: c9 80     
            beq __da7d         ; $da52: f0 29     
            cmp #$81           ; $da54: c9 81     
            beq __da80         ; $da56: f0 28     
            cmp #$01           ; $da58: c9 01     
            beq __da83         ; $da5a: f0 27     
            cmp #$02           ; $da5c: c9 02     
            beq __da86         ; $da5e: f0 26     
            cmp #$c0           ; $da60: c9 c0     
            beq __da89         ; $da62: f0 25     
            cmp #$c1           ; $da64: c9 c1     
            beq __da89         ; $da66: f0 21     
            cmp #$c2           ; $da68: c9 c2     
            beq __da89         ; $da6a: f0 1d     
            cmp #$08           ; $da6c: c9 08     
            beq __da8f         ; $da6e: f0 1f     
            cmp #$10           ; $da70: c9 10     
            beq __da92         ; $da72: f0 1e     
            cmp #$20           ; $da74: c9 20     
            beq __da95         ; $da76: f0 1d     
            cmp #$40           ; $da78: c9 40     
            beq __da98         ; $da7a: f0 1c     
            rts                ; $da7c: 60        

;-------------------------------------------------------------------------------
__da7d:     jmp __da9c         ; $da7d: 4c 9c da  

;-------------------------------------------------------------------------------
__da80:     jmp __db00         ; $da80: 4c 00 db  

;-------------------------------------------------------------------------------
__da83:     jmp __db2c         ; $da83: 4c 2c db  

;-------------------------------------------------------------------------------
__da86:     jmp __dc30         ; $da86: 4c 30 dc  

;-------------------------------------------------------------------------------
__da89:     lda $0421,x        ; $da89: bd 21 04  
            jmp __dd8b         ; $da8c: 4c 8b dd  

;-------------------------------------------------------------------------------
__da8f:     jmp __dc69         ; $da8f: 4c 69 dc  

;-------------------------------------------------------------------------------
__da92:     jmp __dcd0         ; $da92: 4c d0 dc  

;-------------------------------------------------------------------------------
__da95:     jmp __dd32         ; $da95: 4c 32 dd  

;-------------------------------------------------------------------------------
__da98:     jsr __df07         ; $da98: 20 07 df  
            rts                ; $da9b: 60        

;-------------------------------------------------------------------------------
__da9c:     jsr __efd5         ; $da9c: 20 d5 ef  
            lda #$30           ; $da9f: a9 30     
            sta $00            ; $daa1: 85 00     
            sta $01            ; $daa3: 85 01     
            lda #$90           ; $daa5: a9 90     
            sta $02            ; $daa7: 85 02     
            stx $04            ; $daa9: 86 04     
            jsr __eadb         ; $daab: 20 db ea  
            lda $37            ; $daae: a5 37     
            bne __daff         ; $dab0: d0 4d     
            lda #$81           ; $dab2: a9 81     
            ldx $5d            ; $dab4: a6 5d     
            sta $5e,x          ; $dab6: 95 5e     
            lda #$00           ; $dab8: a9 00     
            sta $8a,x          ; $daba: 95 8a     
            lda $ad            ; $dabc: a5 ad     
            beq __dac3         ; $dabe: f0 03     
            jmp __dad5         ; $dac0: 4c d5 da  

;-------------------------------------------------------------------------------
__dac3:     lda $5d            ; $dac3: a5 5d     
            bne __daff         ; $dac5: d0 38     
            lda #$c0           ; $dac7: a9 c0     
            ldx $5d            ; $dac9: a6 5d     
            sta $5e,x          ; $dacb: 95 5e     
            lda #$01           ; $dacd: a9 01     
            sta $0421,x        ; $dacf: 9d 21 04  
            jmp __daf7         ; $dad2: 4c f7 da  

;-------------------------------------------------------------------------------
__dad5:     lda $43            ; $dad5: a5 43     
            bne __daff         ; $dad7: d0 26     
            lda $5d            ; $dad9: a5 5d     
            bne __daff         ; $dadb: d0 22     
            lda #$c0           ; $dadd: a9 c0     
            ldx $5d            ; $dadf: a6 5d     
            sta $5e,x          ; $dae1: 95 5e     
            lda $0421,x        ; $dae3: bd 21 04  
            cmp #$01           ; $dae6: c9 01     
            bne __daf2         ; $dae8: d0 08     
            lda #$03           ; $daea: a9 03     
            sta $0421,x        ; $daec: 9d 21 04  
            jmp __daf7         ; $daef: 4c f7 da  

;-------------------------------------------------------------------------------
__daf2:     lda #$01           ; $daf2: a9 01     
            sta $0421,x        ; $daf4: 9d 21 04  
__daf7:     jsr __eaf7         ; $daf7: 20 f7 ea  
            lda __c44d,x       ; $dafa: bd 4d c4  
            sta $43            ; $dafd: 85 43     
__daff:     rts                ; $daff: 60        

;-------------------------------------------------------------------------------
__db00:     lda #$55           ; $db00: a9 55     
            jsr __dfe4         ; $db02: 20 e4 df  
            bne __db21         ; $db05: d0 1a     
            jsr __efd5         ; $db07: 20 d5 ef  
            lda #$4d           ; $db0a: a9 4d     
            sta $00            ; $db0c: 85 00     
            lda #$32           ; $db0e: a9 32     
            sta $01            ; $db10: 85 01     
            lda #$84           ; $db12: a9 84     
            sta $02            ; $db14: 85 02     
            stx $04            ; $db16: 86 04     
            jsr __eadb         ; $db18: 20 db ea  
            inc $0515          ; $db1b: ee 15 05  
            jmp __db2b         ; $db1e: 4c 2b db  

;-------------------------------------------------------------------------------
__db21:     ldx $5d            ; $db21: a6 5d     
            lda #$01           ; $db23: a9 01     
            sta $5e,x          ; $db25: 95 5e     
            lda #$84           ; $db27: a9 84     
            sta $72,x          ; $db29: 95 72     
__db2b:     rts                ; $db2b: 60        

;-------------------------------------------------------------------------------
__db2c:     lda #$ff           ; $db2c: a9 ff     
            jsr __dfe4         ; $db2e: 20 e4 df  
            bne __db34         ; $db31: d0 01     
            rts                ; $db33: 60        

;-------------------------------------------------------------------------------
__db34:     jsr __efd5         ; $db34: 20 d5 ef  
            pha                ; $db37: 48        
            jsr __eaec         ; $db38: 20 ec ea  
            lda $01            ; $db3b: a5 01     
            jsr __e016         ; $db3d: 20 16 e0  
            ldy $5d            ; $db40: a4 5d     
            sta $0068,y        ; $db42: 99 68 00  
            and #$01           ; $db45: 29 01     
            bne __db4e         ; $db47: d0 05     
            inc $00            ; $db49: e6 00     
            jmp __db50         ; $db4b: 4c 50 db  

;-------------------------------------------------------------------------------
__db4e:     dec $00            ; $db4e: c6 00     
__db50:     lda $00            ; $db50: a5 00     
            jsr __e05a         ; $db52: 20 5a e0  
            sta $7d            ; $db55: 85 7d     
            jsr __e048         ; $db57: 20 48 e0  
            clc                ; $db5a: 18        
            adc $01            ; $db5b: 65 01     
            sta $01            ; $db5d: 85 01     
            jsr __dbee         ; $db5f: 20 ee db  
            ldx $5d            ; $db62: a6 5d     
            lda $72,x          ; $db64: b5 72     
            jsr __ead4         ; $db66: 20 d4 ea  
            pla                ; $db69: 68        
            tax                ; $db6a: aa        
            jsr __f080         ; $db6b: 20 80 f0  
            lda $00            ; $db6e: a5 00     
            jsr __e0ae         ; $db70: 20 ae e0  
            beq __dbac         ; $db73: f0 37     
            jsr __eaf7         ; $db75: 20 f7 ea  
            lda __c448,x       ; $db78: bd 48 c4  
            and $19            ; $db7b: 25 19     
            bne __dbac         ; $db7d: d0 2d     
            ldx $5d            ; $db7f: a6 5d     
            lda $68,x          ; $db81: b5 68     
            tax                ; $db83: aa        
            dex                ; $db84: ca        
            lda $7e,x          ; $db85: b5 7e     
            cmp #$04           ; $db87: c9 04     
            bcs __dbac         ; $db89: b0 21     
            lda $96            ; $db8b: a5 96     
            cmp #$02           ; $db8d: c9 02     
            bne __dba3         ; $db8f: d0 12     
            ldx $04            ; $db91: a6 04     
            lda $0200,x        ; $db93: bd 00 02  
            cmp $0200          ; $db96: cd 00 02  
            bcs __dba3         ; $db99: b0 08     
            clc                ; $db9b: 18        
            adc #$0f           ; $db9c: 69 0f     
            cmp $0200          ; $db9e: cd 00 02  
            bcs __dbac         ; $dba1: b0 09     
__dba3:     lda #$02           ; $dba3: a9 02     
            ldx $5d            ; $dba5: a6 5d     
            sta $5e,x          ; $dba7: 95 5e     
            dec $68,x          ; $dba9: d6 68     
            rts                ; $dbab: 60        

;-------------------------------------------------------------------------------
__dbac:     lda $00            ; $dbac: a5 00     
            jsr __e090         ; $dbae: 20 90 e0  
            beq __dbb6         ; $dbb1: f0 03     
            jmp __dbe7         ; $dbb3: 4c e7 db  

;-------------------------------------------------------------------------------
__dbb6:     jsr __df40         ; $dbb6: 20 40 df  
            ldx $5d            ; $dbb9: a6 5d     
            lda $68,x          ; $dbbb: b5 68     
            cmp #$01           ; $dbbd: c9 01     
            bne __dbed         ; $dbbf: d0 2c     
            jsr __dfc3         ; $dbc1: 20 c3 df  
            lda $00            ; $dbc4: a5 00     
            cmp #$20           ; $dbc6: c9 20     
            beq __dbcd         ; $dbc8: f0 03     
            bcc __dbcd         ; $dbca: 90 01     
            rts                ; $dbcc: 60        

;-------------------------------------------------------------------------------
__dbcd:     lda #$03           ; $dbcd: a9 03     
            sta $02            ; $dbcf: 85 02     
            lda #$04           ; $dbd1: a9 04     
            sta $03            ; $dbd3: 85 03     
            jsr __f08e         ; $dbd5: 20 8e f0  
            lda #$01           ; $dbd8: a9 01     
            sta $ad            ; $dbda: 85 ad     
            lda #$00           ; $dbdc: a9 00     
            ldx $5d            ; $dbde: a6 5d     
            sta $68,x          ; $dbe0: 95 68     
            lda #$80           ; $dbe2: a9 80     
            sta $fe            ; $dbe4: 85 fe     
            rts                ; $dbe6: 60        

;-------------------------------------------------------------------------------
__dbe7:     ldx $5d            ; $dbe7: a6 5d     
            lda #$08           ; $dbe9: a9 08     
            sta $5e,x          ; $dbeb: 95 5e     
__dbed:     rts                ; $dbed: 60        

;-------------------------------------------------------------------------------
__dbee:     ldx $5d            ; $dbee: a6 5d     
            inc $040d,x        ; $dbf0: fe 0d 04  
            lda $040d,x        ; $dbf3: bd 0d 04  
            cmp #$06           ; $dbf6: c9 06     
            bcs __dbfb         ; $dbf8: b0 01     
            rts                ; $dbfa: 60        

;-------------------------------------------------------------------------------
__dbfb:     lda #$00           ; $dbfb: a9 00     
            sta $040d,x        ; $dbfd: 9d 0d 04  
            lda $68,x          ; $dc00: b5 68     
            and #$01           ; $dc02: 29 01     
            beq __dc1b         ; $dc04: f0 15     
            lda $72,x          ; $dc06: b5 72     
            clc                ; $dc08: 18        
            adc #$04           ; $dc09: 69 04     
            cmp #$80           ; $dc0b: c9 80     
            bcc __dc16         ; $dc0d: 90 07     
            cmp #$90           ; $dc0f: c9 90     
            bcs __dc16         ; $dc11: b0 03     
            jmp __dc2d         ; $dc13: 4c 2d dc  

;-------------------------------------------------------------------------------
__dc16:     lda #$80           ; $dc16: a9 80     
            jmp __dc2d         ; $dc18: 4c 2d dc  

;-------------------------------------------------------------------------------
__dc1b:     lda $72,x          ; $dc1b: b5 72     
            sec                ; $dc1d: 38        
            sbc #$04           ; $dc1e: e9 04     
            cmp #$80           ; $dc20: c9 80     
            bcc __dc2b         ; $dc22: 90 07     
            cmp #$90           ; $dc24: c9 90     
            bcs __dc2b         ; $dc26: b0 03     
            jmp __dc2d         ; $dc28: 4c 2d dc  

;-------------------------------------------------------------------------------
__dc2b:     lda #$8c           ; $dc2b: a9 8c     
__dc2d:     sta $72,x          ; $dc2d: 95 72     
            rts                ; $dc2f: 60        

;-------------------------------------------------------------------------------
__dc30:     lda #$55           ; $dc30: a9 55     
            jsr __dfe4         ; $dc32: 20 e4 df  
            beq __dc68         ; $dc35: f0 31     
            jsr __efd5         ; $dc37: 20 d5 ef  
            stx $04            ; $dc3a: 86 04     
            jsr __eaec         ; $dc3c: 20 ec ea  
            inc $01            ; $dc3f: e6 01     
            ldy $5d            ; $dc41: a4 5d     
            lda $0072,y        ; $dc43: b9 72 00  
            cmp #$90           ; $dc46: c9 90     
            bne __dc4f         ; $dc48: d0 05     
            lda #$94           ; $dc4a: a9 94     
            jmp __dc51         ; $dc4c: 4c 51 dc  

;-------------------------------------------------------------------------------
__dc4f:     lda #$90           ; $dc4f: a9 90     
__dc51:     sta $02            ; $dc51: 85 02     
            ldx $5d            ; $dc53: a6 5d     
            sta $72,x          ; $dc55: 95 72     
            jsr __eadb         ; $dc57: 20 db ea  
            lda $01            ; $dc5a: a5 01     
            ldx $5d            ; $dc5c: a6 5d     
            cmp $a3,x          ; $dc5e: d5 a3     
            bne __dc68         ; $dc60: d0 06     
            ldx $5d            ; $dc62: a6 5d     
            lda #$01           ; $dc64: a9 01     
            sta $5e,x          ; $dc66: 95 5e     
__dc68:     rts                ; $dc68: 60        

;-------------------------------------------------------------------------------
__dc69:     lda #$ff           ; $dc69: a9 ff     
            jsr __dfe4         ; $dc6b: 20 e4 df  
            bne __dc71         ; $dc6e: d0 01     
            rts                ; $dc70: 60        

;-------------------------------------------------------------------------------
__dc71:     jsr __efd5         ; $dc71: 20 d5 ef  
            stx $04            ; $dc74: 86 04     
            jsr __eaec         ; $dc76: 20 ec ea  
            inc $01            ; $dc79: e6 01     
            lda $01            ; $dc7b: a5 01     
            and #$01           ; $dc7d: 29 01     
            beq __dc90         ; $dc7f: f0 0f     
            ldx $5d            ; $dc81: a6 5d     
            lda $68,x          ; $dc83: b5 68     
            and #$01           ; $dc85: 29 01     
            beq __dc8e         ; $dc87: f0 05     
            dec $00            ; $dc89: c6 00     
            jmp __dc90         ; $dc8b: 4c 90 dc  

;-------------------------------------------------------------------------------
__dc8e:     inc $00            ; $dc8e: e6 00     
__dc90:     jsr __dbee         ; $dc90: 20 ee db  
            ldx $5d            ; $dc93: a6 5d     
            lda $72,x          ; $dc95: b5 72     
            sta $02            ; $dc97: 85 02     
            jsr __eadb         ; $dc99: 20 db ea  
            lda #$32           ; $dc9c: a9 32     
            jsr __c853         ; $dc9e: 20 53 c8  
            lda $01            ; $dca1: a5 01     
            jsr __e112         ; $dca3: 20 12 e1  
            beq __dccf         ; $dca6: f0 27     
            ldx $5d            ; $dca8: a6 5d     
            lda #$10           ; $dcaa: a9 10     
            sta $5e,x          ; $dcac: 95 5e     
            jsr __e130         ; $dcae: 20 30 e1  
            beq __dcbc         ; $dcb1: f0 09     
            lda $19            ; $dcb3: a5 19     
            and #$01           ; $dcb5: 29 01     
            beq __dcbc         ; $dcb7: f0 03     
            jmp __dcc9         ; $dcb9: 4c c9 dc  

;-------------------------------------------------------------------------------
__dcbc:     ldx $5d            ; $dcbc: a6 5d     
            lda $68,x          ; $dcbe: b5 68     
            tax                ; $dcc0: aa        
            dex                ; $dcc1: ca        
            lda $7e,x          ; $dcc2: b5 7e     
            cmp #$04           ; $dcc4: c9 04     
            bcs __dcc9         ; $dcc6: b0 01     
            rts                ; $dcc8: 60        

;-------------------------------------------------------------------------------
__dcc9:     ldx $5d            ; $dcc9: a6 5d     
            lda #$20           ; $dccb: a9 20     
            sta $5e,x          ; $dccd: 95 5e     
__dccf:     rts                ; $dccf: 60        

;-------------------------------------------------------------------------------
__dcd0:     lda #$77           ; $dcd0: a9 77     
            jsr __dfe4         ; $dcd2: 20 e4 df  
            bne __dcd8         ; $dcd5: d0 01     
            rts                ; $dcd7: 60        

;-------------------------------------------------------------------------------
__dcd8:     jsr __efd5         ; $dcd8: 20 d5 ef  
            stx $04            ; $dcdb: 86 04     
            jsr __eaec         ; $dcdd: 20 ec ea  
            lda $01            ; $dce0: a5 01     
            jsr __e016         ; $dce2: 20 16 e0  
            ldx $5d            ; $dce5: a6 5d     
            sta $68,x          ; $dce7: 95 68     
            and #$01           ; $dce9: 29 01     
            bne __dd00         ; $dceb: d0 13     
            inc $00            ; $dced: e6 00     
            lda $00            ; $dcef: a5 00     
            ldx #$00           ; $dcf1: a2 00     
__dcf3:     cmp __c3fc,x       ; $dcf3: dd fc c3  
            beq __dd13         ; $dcf6: f0 1b     
            inx                ; $dcf8: e8        
            cpx #$0b           ; $dcf9: e0 0b     
            beq __dd25         ; $dcfb: f0 28     
            jmp __dcf3         ; $dcfd: 4c f3 dc  

;-------------------------------------------------------------------------------
__dd00:     dec $00            ; $dd00: c6 00     
            lda $00            ; $dd02: a5 00     
            ldx #$00           ; $dd04: a2 00     
__dd06:     cmp __c412,x       ; $dd06: dd 12 c4  
            beq __dd13         ; $dd09: f0 08     
            inx                ; $dd0b: e8        
            cpx #$0b           ; $dd0c: e0 0b     
            beq __dd25         ; $dd0e: f0 15     
            jmp __dd06         ; $dd10: 4c 06 dd  

;-------------------------------------------------------------------------------
__dd13:     lda $01            ; $dd13: a5 01     
            clc                ; $dd15: 18        
            adc __c407,x       ; $dd16: 7d 07 c4  
            sta $01            ; $dd19: 85 01     
            cpx #$0a           ; $dd1b: e0 0a     
            bne __dd25         ; $dd1d: d0 06     
            ldx $5d            ; $dd1f: a6 5d     
            lda #$01           ; $dd21: a9 01     
            sta $5e,x          ; $dd23: 95 5e     
__dd25:     jsr __dbee         ; $dd25: 20 ee db  
            ldx $5d            ; $dd28: a6 5d     
            lda $72,x          ; $dd2a: b5 72     
            sta $02            ; $dd2c: 85 02     
            jsr __eadb         ; $dd2e: 20 db ea  
            rts                ; $dd31: 60        

;-------------------------------------------------------------------------------
__dd32:     lda #$55           ; $dd32: a9 55     
            jsr __dfe4         ; $dd34: 20 e4 df  
            bne __dd3a         ; $dd37: d0 01     
            rts                ; $dd39: 60        

;-------------------------------------------------------------------------------
__dd3a:     jsr __efd5         ; $dd3a: 20 d5 ef  
            stx $04            ; $dd3d: 86 04     
            jsr __eaec         ; $dd3f: 20 ec ea  
            lda $01            ; $dd42: a5 01     
            jsr __e016         ; $dd44: 20 16 e0  
            ldx $5d            ; $dd47: a6 5d     
            sta $68,x          ; $dd49: 95 68     
            and #$01           ; $dd4b: 29 01     
            bne __dd60         ; $dd4d: d0 11     
            dec $00            ; $dd4f: c6 00     
            lda $01            ; $dd51: a5 01     
            cmp #$14           ; $dd53: c9 14     
            bne __dd59         ; $dd55: d0 02     
            dec $01            ; $dd57: c6 01     
__dd59:     lda $00            ; $dd59: a5 00     
            bne __dd73         ; $dd5b: d0 16     
            jmp __dd7f         ; $dd5d: 4c 7f dd  

;-------------------------------------------------------------------------------
__dd60:     inc $00            ; $dd60: e6 00     
            lda $01            ; $dd62: a5 01     
            cmp #$ec           ; $dd64: c9 ec     
            bne __dd6a         ; $dd66: d0 02     
            dec $01            ; $dd68: c6 01     
__dd6a:     lda $00            ; $dd6a: a5 00     
            cmp #$f4           ; $dd6c: c9 f4     
            bne __dd73         ; $dd6e: d0 03     
            jmp __dd7f         ; $dd70: 4c 7f dd  

;-------------------------------------------------------------------------------
__dd73:     jsr __dbee         ; $dd73: 20 ee db  
            ldx $5d            ; $dd76: a6 5d     
            lda $72,x          ; $dd78: b5 72     
            sta $02            ; $dd7a: 85 02     
            jmp __eadb         ; $dd7c: 4c db ea  

;-------------------------------------------------------------------------------
__dd7f:     lda #$22           ; $dd7f: a9 22     
            jsr __f092         ; $dd81: 20 92 f0  
            lda #$00           ; $dd84: a9 00     
            ldx $5d            ; $dd86: a6 5d     
            sta $68,x          ; $dd88: 95 68     
            rts                ; $dd8a: 60        

;-------------------------------------------------------------------------------
__dd8b:     sta $07            ; $dd8b: 85 07     
            ldx $5d            ; $dd8d: a6 5d     
            lda $5e,x          ; $dd8f: b5 5e     
            cmp #$c2           ; $dd91: c9 c2     
            bne __dd98         ; $dd93: d0 03     
            jmp __de82         ; $dd95: 4c 82 de  

;-------------------------------------------------------------------------------
__dd98:     cmp #$c1           ; $dd98: c9 c1     
            beq __ddd7         ; $dd9a: f0 3b     
            lda $07            ; $dd9c: a5 07     
            cmp #$02           ; $dd9e: c9 02     
            beq __ddab         ; $dda0: f0 09     
            cmp #$03           ; $dda2: c9 03     
            beq __ddb0         ; $dda4: f0 0a     
            lda #$34           ; $dda6: a9 34     
            jmp __ddb2         ; $dda8: 4c b2 dd  

;-------------------------------------------------------------------------------
__ddab:     lda #$36           ; $ddab: a9 36     
            jmp __ddb2         ; $ddad: 4c b2 dd  

;-------------------------------------------------------------------------------
__ddb0:     lda #$38           ; $ddb0: a9 38     
__ddb2:     jsr __c853         ; $ddb2: 20 53 c8  
            jsr __efd5         ; $ddb5: 20 d5 ef  
            stx $04            ; $ddb8: 86 04     
            lda $0200,x        ; $ddba: bd 00 02  
            jsr __e112         ; $ddbd: 20 12 e1  
            ldy $0a            ; $ddc0: a4 0a     
            cpy #$04           ; $ddc2: c0 04     
            bne __ddc9         ; $ddc4: d0 03     
            jmp __de73         ; $ddc6: 4c 73 de  

;-------------------------------------------------------------------------------
__ddc9:     cmp #$00           ; $ddc9: c9 00     
            beq __ddd7         ; $ddcb: f0 0a     
            ldx $5d            ; $ddcd: a6 5d     
            lda #$01           ; $ddcf: a9 01     
            sta $8a,x          ; $ddd1: 95 8a     
            lda #$c1           ; $ddd3: a9 c1     
            sta $5e,x          ; $ddd5: 95 5e     
__ddd7:     jsr __efd5         ; $ddd7: 20 d5 ef  
            stx $04            ; $ddda: 86 04     
            ldx $5d            ; $dddc: a6 5d     
            lda $5e,x          ; $ddde: b5 5e     
            cmp #$c1           ; $dde0: c9 c1     
            bne __de13         ; $dde2: d0 2f     
            lda #$20           ; $dde4: a9 20     
            jsr __dfe4         ; $dde6: 20 e4 df  
            bne __ddf5         ; $dde9: d0 0a     
            ldx $04            ; $ddeb: a6 04     
            lda $0200,x        ; $dded: bd 00 02  
            sta $01            ; $ddf0: 85 01     
            jmp __de27         ; $ddf2: 4c 27 de  

;-------------------------------------------------------------------------------
__ddf5:     ldx $5d            ; $ddf5: a6 5d     
            lda #$c0           ; $ddf7: a9 c0     
            sta $5e,x          ; $ddf9: 95 5e     
            lda $07            ; $ddfb: a5 07     
            cmp #$03           ; $ddfd: c9 03     
            bne __de10         ; $ddff: d0 0f     
            lda $0417,x        ; $de01: bd 17 04  
            beq __de0b         ; $de04: f0 05     
            lda #$00           ; $de06: a9 00     
            jmp __de0d         ; $de08: 4c 0d de  

;-------------------------------------------------------------------------------
__de0b:     lda #$01           ; $de0b: a9 01     
__de0d:     sta $0417,x        ; $de0d: 9d 17 04  
__de10:     jmp __de1a         ; $de10: 4c 1a de  

;-------------------------------------------------------------------------------
__de13:     lda #$ff           ; $de13: a9 ff     
            jsr __dfe4         ; $de15: 20 e4 df  
            beq __de85         ; $de18: f0 6b     
__de1a:     ldx $04            ; $de1a: a6 04     
            lda #$01           ; $de1c: a9 01     
            clc                ; $de1e: 18        
            adc $0200,x        ; $de1f: 7d 00 02  
            sta $01            ; $de22: 85 01     
            jsr __de86         ; $de24: 20 86 de  
__de27:     inx                ; $de27: e8        
            inx                ; $de28: e8        
            inx                ; $de29: e8        
            lda $07            ; $de2a: a5 07     
            cmp #$02           ; $de2c: c9 02     
            bne __de36         ; $de2e: d0 06     
            inc $0200,x        ; $de30: fe 00 02  
            jmp __de56         ; $de33: 4c 56 de  

;-------------------------------------------------------------------------------
__de36:     cmp #$03           ; $de36: c9 03     
            bne __de56         ; $de38: d0 1c     
            lda $01            ; $de3a: a5 01     
            and #$01           ; $de3c: 29 01     
            beq __de56         ; $de3e: f0 16     
            ldy $5d            ; $de40: a4 5d     
            lda $0417,y        ; $de42: b9 17 04  
            bne __de50         ; $de45: d0 09     
            inc $0200,x        ; $de47: fe 00 02  
            inc $0200,x        ; $de4a: fe 00 02  
            jmp __de56         ; $de4d: 4c 56 de  

;-------------------------------------------------------------------------------
__de50:     dec $0200,x        ; $de50: de 00 02  
            dec $0200,x        ; $de53: de 00 02  
__de56:     lda $0200,x        ; $de56: bd 00 02  
            sta $00            ; $de59: 85 00     
            ldx $5d            ; $de5b: a6 5d     
            lda $72,x          ; $de5d: b5 72     
            cmp #$90           ; $de5f: c9 90     
            bne __de68         ; $de61: d0 05     
            lda #$94           ; $de63: a9 94     
            jmp __de6a         ; $de65: 4c 6a de  

;-------------------------------------------------------------------------------
__de68:     lda #$90           ; $de68: a9 90     
__de6a:     sta $02            ; $de6a: 85 02     
            ldx $5d            ; $de6c: a6 5d     
            sta $72,x          ; $de6e: 95 72     
            jmp __eadb         ; $de70: 4c db ea  

;-------------------------------------------------------------------------------
__de73:     lda #$c2           ; $de73: a9 c2     
            ldx $5d            ; $de75: a6 5d     
            sta $5e,x          ; $de77: 95 5e     
            ldx $04            ; $de79: a6 04     
            lda $0203,x        ; $de7b: bd 03 02  
            sta $042b          ; $de7e: 8d 2b 04  
            rts                ; $de81: 60        

;-------------------------------------------------------------------------------
__de82:     jsr __dea5         ; $de82: 20 a5 de  
__de85:     rts                ; $de85: 60        

;-------------------------------------------------------------------------------
__de86:     lda $07            ; $de86: a5 07     
            cmp #$01           ; $de88: c9 01     
            bne __dea4         ; $de8a: d0 18     
            ldy #$00           ; $de8c: a0 00     
            lda $01            ; $de8e: a5 01     
__de90:     cmp __c41d,y       ; $de90: d9 1d c4  
            bcc __de9f         ; $de93: 90 0a     
            cmp __c420,y       ; $de95: d9 20 c4  
            bcs __de9f         ; $de98: b0 05     
            inc $01            ; $de9a: e6 01     
            jmp __dea4         ; $de9c: 4c a4 de  

;-------------------------------------------------------------------------------
__de9f:     iny                ; $de9f: c8        
            cpy #$03           ; $dea0: c0 03     
            bne __de90         ; $dea2: d0 ec     
__dea4:     rts                ; $dea4: 60        

;-------------------------------------------------------------------------------
__dea5:     jsr __efd5         ; $dea5: 20 d5 ef  
            stx $04            ; $dea8: 86 04     
            jsr __eaec         ; $deaa: 20 ec ea  
            dec $00            ; $dead: c6 00     
            lda $042b          ; $deaf: ad 2b 04  
            sec                ; $deb2: 38        
            sbc #$01           ; $deb3: e9 01     
            cmp $00            ; $deb5: c5 00     
            beq __dee8         ; $deb7: f0 2f     
            sec                ; $deb9: 38        
            sbc #$01           ; $deba: e9 01     
            cmp $00            ; $debc: c5 00     
            beq __dee8         ; $debe: f0 28     
            sec                ; $dec0: 38        
            sbc #$01           ; $dec1: e9 01     
            cmp $00            ; $dec3: c5 00     
            beq __def2         ; $dec5: f0 2b     
            sec                ; $dec7: 38        
            sbc #$08           ; $dec8: e9 08     
            cmp $00            ; $deca: c5 00     
            beq __deed         ; $decc: f0 1f     
            sec                ; $dece: 38        
            sbc #$01           ; $decf: e9 01     
            cmp $00            ; $ded1: c5 00     
            beq __deed         ; $ded3: f0 18     
            sec                ; $ded5: 38        
            sbc #$01           ; $ded6: e9 01     
            cmp $00            ; $ded8: c5 00     
            bne __defb         ; $deda: d0 1f     
__dedc:     lda #$01           ; $dedc: a9 01     
            ldx $5d            ; $dede: a6 5d     
            sta $5e,x          ; $dee0: 95 5e     
            lda #$00           ; $dee2: a9 00     
            sta $0417,x        ; $dee4: 9d 17 04  
            rts                ; $dee7: 60        

;-------------------------------------------------------------------------------
__dee8:     dec $01            ; $dee8: c6 01     
            jmp __defb         ; $deea: 4c fb de  

;-------------------------------------------------------------------------------
__deed:     inc $01            ; $deed: e6 01     
            jmp __defb         ; $deef: 4c fb de  

;-------------------------------------------------------------------------------
__def2:     ldx $5d            ; $def2: a6 5d     
            lda $0421,x        ; $def4: bd 21 04  
            cmp #$01           ; $def7: c9 01     
            beq __dedc         ; $def9: f0 e1     
__defb:     lda #$84           ; $defb: a9 84     
            ldx $5d            ; $defd: a6 5d     
            sta $72,x          ; $deff: 95 72     
            sta $02            ; $df01: 85 02     
            jsr __eadb         ; $df03: 20 db ea  
            rts                ; $df06: 60        

;-------------------------------------------------------------------------------
__df07:     lda #$55           ; $df07: a9 55     
            jsr __dfe4         ; $df09: 20 e4 df  
            bne __df0f         ; $df0c: d0 01     
            rts                ; $df0e: 60        

;-------------------------------------------------------------------------------
__df0f:     jsr __efd5         ; $df0f: 20 d5 ef  
            stx $04            ; $df12: 86 04     
            jsr __eaec         ; $df14: 20 ec ea  
            inc $01            ; $df17: e6 01     
            lda $0201,x        ; $df19: bd 01 02  
            cmp #$90           ; $df1c: c9 90     
            beq __df25         ; $df1e: f0 05     
            lda #$90           ; $df20: a9 90     
            jmp __df27         ; $df22: 4c 27 df  

;-------------------------------------------------------------------------------
__df25:     lda #$94           ; $df25: a9 94     
__df27:     sta $02            ; $df27: 85 02     
            jsr __eadb         ; $df29: 20 db ea  
            lda $c0            ; $df2c: a5 c0     
            cmp $01            ; $df2e: c5 01     
            beq __df35         ; $df30: f0 03     
            bcc __df35         ; $df32: 90 01     
            rts                ; $df34: 60        

;-------------------------------------------------------------------------------
__df35:     ldx $5d            ; $df35: a6 5d     
            lda #$01           ; $df37: a9 01     
            sta $5e,x          ; $df39: 95 5e     
            lda #$00           ; $df3b: a9 00     
            sta $c0            ; $df3d: 85 c0     
            rts                ; $df3f: 60        

;-------------------------------------------------------------------------------
__df40:     lda $c0            ; $df40: a5 c0     
            beq __df45         ; $df42: f0 01     
            rts                ; $df44: 60        

;-------------------------------------------------------------------------------
__df45:     lda $96            ; $df45: a5 96     
            cmp #$0a           ; $df47: c9 0a     
            beq __df4c         ; $df49: f0 01     
            rts                ; $df4b: 60        

;-------------------------------------------------------------------------------
__df4c:     lda $59            ; $df4c: a5 59     
            cmp #$03           ; $df4e: c9 03     
            beq __df55         ; $df50: f0 03     
            jmp __df72         ; $df52: 4c 72 df  

;-------------------------------------------------------------------------------
__df55:     ldx #$03           ; $df55: a2 03     
            lda $7e,x          ; $df57: b5 7e     
            cmp #$05           ; $df59: c9 05     
            bcs __df5e         ; $df5b: b0 01     
            rts                ; $df5d: 60        

;-------------------------------------------------------------------------------
__df5e:     ldx #$00           ; $df5e: a2 00     
__df60:     lda $5e,x          ; $df60: b5 5e     
            cmp #$01           ; $df62: c9 01     
            bne __df6c         ; $df64: d0 06     
            lda $68,x          ; $df66: b5 68     
            cmp #$03           ; $df68: c9 03     
            beq __df8f         ; $df6a: f0 23     
__df6c:     inx                ; $df6c: e8        
            cpx #$0a           ; $df6d: e0 0a     
            bne __df60         ; $df6f: d0 ef     
            rts                ; $df71: 60        

;-------------------------------------------------------------------------------
__df72:     ldx #$05           ; $df72: a2 05     
            lda $7e,x          ; $df74: b5 7e     
            cmp #$05           ; $df76: c9 05     
            bcs __df7b         ; $df78: b0 01     
            rts                ; $df7a: 60        

;-------------------------------------------------------------------------------
__df7b:     ldx #$00           ; $df7b: a2 00     
__df7d:     lda $5e,x          ; $df7d: b5 5e     
            cmp #$01           ; $df7f: c9 01     
            bne __df89         ; $df81: d0 06     
            lda $68,x          ; $df83: b5 68     
            cmp #$05           ; $df85: c9 05     
            beq __df8f         ; $df87: f0 06     
__df89:     inx                ; $df89: e8        
            cmp #$0a           ; $df8a: c9 0a     
            bne __df7d         ; $df8c: d0 ef     
            rts                ; $df8e: 60        

;-------------------------------------------------------------------------------
__df8f:     lda #$40           ; $df8f: a9 40     
            sta $5e,x          ; $df91: 95 5e     
            dec $68,x          ; $df93: d6 68     
            txa                ; $df95: 8a        
            clc                ; $df96: 18        
            adc #$03           ; $df97: 69 03     
            asl                ; $df99: 0a        
            asl                ; $df9a: 0a        
            asl                ; $df9b: 0a        
            asl                ; $df9c: 0a        
            tay                ; $df9d: a8        
            lda $0200,y        ; $df9e: b9 00 02  
            sta $01            ; $dfa1: 85 01     
            lda $0203,y        ; $dfa3: b9 03 02  
            sta $00            ; $dfa6: 85 00     
            lda __c1eb         ; $dfa8: ad eb c1  
            ldy #$00           ; $dfab: a0 00     
__dfad:     cmp $00            ; $dfad: c5 00     
            bcs __dfb8         ; $dfaf: b0 07     
            clc                ; $dfb1: 18        
            adc #$18           ; $dfb2: 69 18     
            iny                ; $dfb4: c8        
            jmp __dfad         ; $dfb5: 4c ad df  

;-------------------------------------------------------------------------------
__dfb8:     tya                ; $dfb8: 98        
            asl                ; $dfb9: 0a        
            clc                ; $dfba: 18        
            adc #$15           ; $dfbb: 69 15     
            clc                ; $dfbd: 18        
            adc $01            ; $dfbe: 65 01     
            sta $c0            ; $dfc0: 85 c0     
            rts                ; $dfc2: 60        

;-------------------------------------------------------------------------------
__dfc3:     ldx $5d            ; $dfc3: a6 5d     
            lda $68,x          ; $dfc5: b5 68     
            cmp #$01           ; $dfc7: c9 01     
            bne __dfe3         ; $dfc9: d0 18     
            jsr __efd5         ; $dfcb: 20 d5 ef  
            lda $0203,x        ; $dfce: bd 03 02  
            cmp #$30           ; $dfd1: c9 30     
            bcs __dfe3         ; $dfd3: b0 0e     
            lda #$23           ; $dfd5: a9 23     
            sta $0202,x        ; $dfd7: 9d 02 02  
            sta $0206,x        ; $dfda: 9d 06 02  
            sta $020a,x        ; $dfdd: 9d 0a 02  
            sta $020e,x        ; $dfe0: 9d 0e 02  
__dfe3:     rts                ; $dfe3: 60        

;-------------------------------------------------------------------------------
__dfe4:     sta $0a            ; $dfe4: 85 0a     
            sta $0b            ; $dfe6: 85 0b     
__dfe8:     ldx $5d            ; $dfe8: a6 5d     
            inc $8a,x          ; $dfea: f6 8a     
            lda $8a,x          ; $dfec: b5 8a     
            bmi __dff7         ; $dfee: 30 07     
            cmp #$10           ; $dff0: c9 10     
            bcs __dff7         ; $dff2: b0 03     
            jmp __dffb         ; $dff4: 4c fb df  

;-------------------------------------------------------------------------------
__dff7:     lda #$00           ; $dff7: a9 00     
            sta $8a,x          ; $dff9: 95 8a     
__dffb:     cmp #$08           ; $dffb: c9 08     
            bcs __e008         ; $dffd: b0 09     
            tax                ; $dfff: aa        
            lda __c1bc,x       ; $e000: bd bc c1  
            and $0a            ; $e003: 25 0a     
            jmp __e011         ; $e005: 4c 11 e0  

;-------------------------------------------------------------------------------
__e008:     sec                ; $e008: 38        
            sbc #$08           ; $e009: e9 08     
            tax                ; $e00b: aa        
            lda __c1bc,x       ; $e00c: bd bc c1  
            and $0b            ; $e00f: 25 0b     
__e011:     beq __e015         ; $e011: f0 02     
            lda #$01           ; $e013: a9 01     
__e015:     rts                ; $e015: 60        

;-------------------------------------------------------------------------------
__e016:     sta $0a            ; $e016: 85 0a     
            lda $53            ; $e018: a5 53     
            sec                ; $e01a: 38        
            sbc #$01           ; $e01b: e9 01     
            asl                ; $e01d: 0a        
            tax                ; $e01e: aa        
            lda __c493,x       ; $e01f: bd 93 c4  
            sta $08            ; $e022: 85 08     
            lda __c494,x       ; $e024: bd 94 c4  
            sta $09            ; $e027: 85 09     
            ldy #$00           ; $e029: a0 00     
            lda #$01           ; $e02b: a9 01     
            sta $0b            ; $e02d: 85 0b     
__e02f:     lda ($08),y        ; $e02f: b1 08     
            cmp #$ff           ; $e031: c9 ff     
            beq __e041         ; $e033: f0 0c     
            cmp $0a            ; $e035: c5 0a     
            beq __e045         ; $e037: f0 0c     
            bcc __e045         ; $e039: 90 0a     
            inc $0b            ; $e03b: e6 0b     
            iny                ; $e03d: c8        
            jmp __e02f         ; $e03e: 4c 2f e0  

;-------------------------------------------------------------------------------
__e041:     lda #$07           ; $e041: a9 07     
            sta $0b            ; $e043: 85 0b     
__e045:     lda $0b            ; $e045: a5 0b     
            rts                ; $e047: 60        

;-------------------------------------------------------------------------------
__e048:     ldx $5d            ; $e048: a6 5d     
            lda $5e,x          ; $e04a: b5 5e     
            cmp #$01           ; $e04c: c9 01     
            bne __e057         ; $e04e: d0 07     
            lda $7d            ; $e050: a5 7d     
            bne __e057         ; $e052: d0 03     
            lda #$01           ; $e054: a9 01     
            rts                ; $e056: 60        

;-------------------------------------------------------------------------------
__e057:     lda #$00           ; $e057: a9 00     
            rts                ; $e059: 60        

;-------------------------------------------------------------------------------
__e05a:     sta $0c            ; $e05a: 85 0c     
            ldx $5d            ; $e05c: a6 5d     
            lda $68,x          ; $e05e: b5 68     
            cmp #$01           ; $e060: c9 01     
            beq __e079         ; $e062: f0 15     
            cmp #$06           ; $e064: c9 06     
            beq __e079         ; $e066: f0 11     
            ldx #$00           ; $e068: a2 00     
__e06a:     lda __c1c4,x       ; $e06a: bd c4 c1  
            cmp $0c            ; $e06d: c5 0c     
            beq __e08a         ; $e06f: f0 19     
            inx                ; $e071: e8        
            cpx #$09           ; $e072: e0 09     
            beq __e08d         ; $e074: f0 17     
            jmp __e06a         ; $e076: 4c 6a e0  

;-------------------------------------------------------------------------------
__e079:     ldx #$04           ; $e079: a2 04     
__e07b:     lda __c1c4,x       ; $e07b: bd c4 c1  
            cmp $0c            ; $e07e: c5 0c     
            beq __e08a         ; $e080: f0 08     
            inx                ; $e082: e8        
            cpx #$09           ; $e083: e0 09     
            beq __e08d         ; $e085: f0 06     
            jmp __e07b         ; $e087: 4c 7b e0  

;-------------------------------------------------------------------------------
__e08a:     lda #$00           ; $e08a: a9 00     
            rts                ; $e08c: 60        

;-------------------------------------------------------------------------------
__e08d:     lda #$01           ; $e08d: a9 01     
            rts                ; $e08f: 60        

;-------------------------------------------------------------------------------
__e090:     sta $0c            ; $e090: 85 0c     
            ldx $5d            ; $e092: a6 5d     
            lda $68,x          ; $e094: b5 68     
            and #$01           ; $e096: 29 01     
            beq __e09f         ; $e098: f0 05     
            ldx #$00           ; $e09a: a2 00     
            jmp __e0a1         ; $e09c: 4c a1 e0  

;-------------------------------------------------------------------------------
__e09f:     ldx #$01           ; $e09f: a2 01     
__e0a1:     lda __c1cd,x       ; $e0a1: bd cd c1  
            cmp $0c            ; $e0a4: c5 0c     
            beq __e0ab         ; $e0a6: f0 03     
            lda #$00           ; $e0a8: a9 00     
            rts                ; $e0aa: 60        

;-------------------------------------------------------------------------------
__e0ab:     lda #$01           ; $e0ab: a9 01     
            rts                ; $e0ad: 60        

;-------------------------------------------------------------------------------
__e0ae:     sta $0c            ; $e0ae: 85 0c     
            ldx $5d            ; $e0b0: a6 5d     
            lda $68,x          ; $e0b2: b5 68     
            cmp #$02           ; $e0b4: c9 02     
            beq __e0cb         ; $e0b6: f0 13     
            cmp #$03           ; $e0b8: c9 03     
            beq __e0cb         ; $e0ba: f0 0f     
            cmp #$04           ; $e0bc: c9 04     
            beq __e0d1         ; $e0be: f0 11     
            cmp #$05           ; $e0c0: c9 05     
            beq __e0dd         ; $e0c2: f0 19     
            cmp #$06           ; $e0c4: c9 06     
            beq __e0e9         ; $e0c6: f0 21     
            jmp __e0ec         ; $e0c8: 4c ec e0  

;-------------------------------------------------------------------------------
__e0cb:     jsr __e0f1         ; $e0cb: 20 f1 e0  
            jmp __e0ec         ; $e0ce: 4c ec e0  

;-------------------------------------------------------------------------------
__e0d1:     jsr __e0f1         ; $e0d1: 20 f1 e0  
            ldy #$89           ; $e0d4: a0 89     
            cmp #$c4           ; $e0d6: c9 c4     
            beq __e109         ; $e0d8: f0 2f     
            jmp __e0ec         ; $e0da: 4c ec e0  

;-------------------------------------------------------------------------------
__e0dd:     jsr __e0f1         ; $e0dd: 20 f1 e0  
            ldy #$71           ; $e0e0: a0 71     
            cmp #$b4           ; $e0e2: c9 b4     
            beq __e109         ; $e0e4: f0 23     
            jmp __e0ec         ; $e0e6: 4c ec e0  

;-------------------------------------------------------------------------------
__e0e9:     jsr __e0f1         ; $e0e9: 20 f1 e0  
__e0ec:     lda #$00           ; $e0ec: a9 00     
            jmp __e10f         ; $e0ee: 4c 0f e1  

;-------------------------------------------------------------------------------
__e0f1:     tax                ; $e0f1: aa        
            dex                ; $e0f2: ca        
            dex                ; $e0f3: ca        
            lda $0c            ; $e0f4: a5 0c     
            ldy __c172,x       ; $e0f6: bc 72 c1  
            cmp __c177,x       ; $e0f9: dd 77 c1  
            beq __e107         ; $e0fc: f0 09     
            ldy __c17c,x       ; $e0fe: bc 7c c1  
            cmp __c181,x       ; $e101: dd 81 c1  
            beq __e107         ; $e104: f0 01     
            rts                ; $e106: 60        

;-------------------------------------------------------------------------------
__e107:     pla                ; $e107: 68        
            pla                ; $e108: 68        
__e109:     ldx $5d            ; $e109: a6 5d     
            sty $a3,x          ; $e10b: 94 a3     
            lda #$01           ; $e10d: a9 01     
__e10f:     sta $0c            ; $e10f: 85 0c     
            rts                ; $e111: 60        

;-------------------------------------------------------------------------------
__e112:     sta $0b            ; $e112: 85 0b     
            ldy #$00           ; $e114: a0 00     
__e116:     lda ($08),y        ; $e116: b1 08     
            cmp #$fe           ; $e118: c9 fe     
            beq __e129         ; $e11a: f0 0d     
            cmp $0b            ; $e11c: c5 0b     
            beq __e124         ; $e11e: f0 04     
            iny                ; $e120: c8        
            jmp __e116         ; $e121: 4c 16 e1  

;-------------------------------------------------------------------------------
__e124:     lda #$01           ; $e124: a9 01     
            jmp __e12b         ; $e126: 4c 2b e1  

;-------------------------------------------------------------------------------
__e129:     lda #$00           ; $e129: a9 00     
__e12b:     sta $0c            ; $e12b: 85 0c     
            sty $0a            ; $e12d: 84 0a     
            rts                ; $e12f: 60        

;-------------------------------------------------------------------------------
__e130:     ldx $5d            ; $e130: a6 5d     
            lda $68,x          ; $e132: b5 68     
            sec                ; $e134: 38        
            sbc $59            ; $e135: e5 59     
            beq __e13e         ; $e137: f0 05     
            bmi __e13e         ; $e139: 30 03     
            jmp __e141         ; $e13b: 4c 41 e1  

;-------------------------------------------------------------------------------
__e13e:     lda #$01           ; $e13e: a9 01     
            rts                ; $e140: 60        

;-------------------------------------------------------------------------------
__e141:     lda #$00           ; $e141: a9 00     
            rts                ; $e143: 60        

;-------------------------------------------------------------------------------
            ldx #$00           ; $e144: a2 00     
            ldy #$20           ; $e146: a0 20     
__e148:     lda $0200,y        ; $e148: b9 00 02  
            cmp #$ff           ; $e14b: c9 ff     
            beq __e157         ; $e14d: f0 08     
            jsr __e016         ; $e14f: 20 16 e0  
            sta $68,x          ; $e152: 95 68     
            jmp __e15b         ; $e154: 4c 5b e1  

;-------------------------------------------------------------------------------
__e157:     lda #$00           ; $e157: a9 00     
            sta $68,x          ; $e159: 95 68     
__e15b:     tya                ; $e15b: 98        
            clc                ; $e15c: 18        
            adc #$10           ; $e15d: 69 10     
            tay                ; $e15f: a8        
            inx                ; $e160: e8        
            cpx #$0a           ; $e161: e0 0a     
            bne __e148         ; $e163: d0 e3     
            rts                ; $e165: 60        

;-------------------------------------------------------------------------------
__e166:     lda #$00           ; $e166: a9 00     
            ldy #$06           ; $e168: a0 06     
__e16a:     sta $007e,y        ; $e16a: 99 7e 00  
            dey                ; $e16d: 88        
            bpl __e16a         ; $e16e: 10 fa     
            ldy #$00           ; $e170: a0 00     
__e172:     lda $0068,y        ; $e172: b9 68 00  
            beq __e17f         ; $e175: f0 08     
            tax                ; $e177: aa        
            lda $7e,x          ; $e178: b5 7e     
            clc                ; $e17a: 18        
            adc #$01           ; $e17b: 69 01     
            sta $7e,x          ; $e17d: 95 7e     
__e17f:     cpy #$09           ; $e17f: c0 09     
            beq __e187         ; $e181: f0 04     
            iny                ; $e183: c8        
            jmp __e172         ; $e184: 4c 72 e1  

;-------------------------------------------------------------------------------
__e187:     ldx $59            ; $e187: a6 59     
            cpx #$07           ; $e189: e0 07     
            beq __e199         ; $e18b: f0 0c     
            inc $7e,x          ; $e18d: f6 7e     
            lda $96            ; $e18f: a5 96     
            cmp #$0a           ; $e191: c9 0a     
            bne __e199         ; $e193: d0 04     
            ldx $59            ; $e195: a6 59     
            inc $7e,x          ; $e197: f6 7e     
__e199:     rts                ; $e199: 60        

;-------------------------------------------------------------------------------
__e19a:     lda $ad            ; $e19a: a5 ad     
            bne __e19f         ; $e19c: d0 01     
            rts                ; $e19e: 60        

;-------------------------------------------------------------------------------
__e19f:     cmp #$01           ; $e19f: c9 01     
            bne __e1bf         ; $e1a1: d0 1c     
            lda #$20           ; $e1a3: a9 20     
            sta $00            ; $e1a5: 85 00     
            lda #$c0           ; $e1a7: a9 c0     
            sta $01            ; $e1a9: 85 01     
            lda #$fc           ; $e1ab: a9 fc     
            sta $02            ; $e1ad: 85 02     
            lda #$12           ; $e1af: a9 12     
            sta $03            ; $e1b1: 85 03     
            lda #$e0           ; $e1b3: a9 e0     
            jsr __f080         ; $e1b5: 20 80 f0  
            lda #$02           ; $e1b8: a9 02     
            sta $ad            ; $e1ba: 85 ad     
            jmp __e1e0         ; $e1bc: 4c e0 e1  

;-------------------------------------------------------------------------------
__e1bf:     lda $38            ; $e1bf: a5 38     
            bne __e1e4         ; $e1c1: d0 21     
            lda #$03           ; $e1c3: a9 03     
            sta $ad            ; $e1c5: 85 ad     
            ldx #$e1           ; $e1c7: a2 e1     
            lda $0200,x        ; $e1c9: bd 00 02  
            cmp #$fc           ; $e1cc: c9 fc     
            beq __e1d5         ; $e1ce: f0 05     
            lda #$fc           ; $e1d0: a9 fc     
            jmp __e1d7         ; $e1d2: 4c d7 e1  

;-------------------------------------------------------------------------------
__e1d5:     lda #$fe           ; $e1d5: a9 fe     
__e1d7:     sta $0200,x        ; $e1d7: 9d 00 02  
            clc                ; $e1da: 18        
            adc #$01           ; $e1db: 69 01     
            sta $0204,x        ; $e1dd: 9d 04 02  
__e1e0:     lda #$10           ; $e1e0: a9 10     
            sta $38            ; $e1e2: 85 38     
__e1e4:     rts                ; $e1e4: 60        

;-------------------------------------------------------------------------------
__e1e5:     lda #$00           ; $e1e5: a9 00     
            sta $ae            ; $e1e7: 85 ae     
__e1e9:     jsr __efdd         ; $e1e9: 20 dd ef  
            lda $0200,x        ; $e1ec: bd 00 02  
            cmp #$ff           ; $e1ef: c9 ff     
            bne __e225         ; $e1f1: d0 32     
            lda $53            ; $e1f3: a5 53     
            cmp #$01           ; $e1f5: c9 01     
            beq __e200         ; $e1f7: f0 07     
            cmp #$04           ; $e1f9: c9 04     
            beq __e213         ; $e1fb: f0 16     
            jmp __e225         ; $e1fd: 4c 25 e2  

;-------------------------------------------------------------------------------
__e200:     lda $40            ; $e200: a5 40     
            bne __e228         ; $e202: d0 24     
            lda $ad            ; $e204: a5 ad     
            beq __e228         ; $e206: f0 20     
            cmp #$02           ; $e208: c9 02     
            bne __e228         ; $e20a: d0 1c     
            lda #$19           ; $e20c: a9 19     
            sta $40            ; $e20e: 85 40     
            jmp __e21f         ; $e210: 4c 1f e2  

;-------------------------------------------------------------------------------
__e213:     lda $40            ; $e213: a5 40     
            bne __e228         ; $e215: d0 11     
            jsr __eaf7         ; $e217: 20 f7 ea  
            lda __c466,x       ; $e21a: bd 66 c4  
            sta $40            ; $e21d: 85 40     
__e21f:     lda #$06           ; $e21f: a9 06     
            ldx $ae            ; $e221: a6 ae     
            sta $af,x          ; $e223: 95 af     
__e225:     jsr __e250         ; $e225: 20 50 e2  
__e228:     ldx $53            ; $e228: a6 53     
            dex                ; $e22a: ca        
            inc $ae            ; $e22b: e6 ae     
            lda $ae            ; $e22d: a5 ae     
            cmp __c1f6,x       ; $e22f: dd f6 c1  
            beq __e237         ; $e232: f0 03     
            jmp __e1e9         ; $e234: 4c e9 e1  

;-------------------------------------------------------------------------------
__e237:     lda $53            ; $e237: a5 53     
            cmp #$03           ; $e239: c9 03     
            beq __e24f         ; $e23b: f0 12     
            lda $3b            ; $e23d: a5 3b     
            bne __e24f         ; $e23f: d0 0e     
            lda #$00           ; $e241: a9 00     
            sta $d2            ; $e243: 85 d2     
            sta $d3            ; $e245: 85 d3     
            sta $d4            ; $e247: 85 d4     
            sta $d5            ; $e249: 85 d5     
            lda #$bc           ; $e24b: a9 bc     
            sta $3b            ; $e24d: 85 3b     
__e24f:     rts                ; $e24f: 60        

;-------------------------------------------------------------------------------
__e250:     ldx $ae            ; $e250: a6 ae     
            lda $af,x          ; $e252: b5 af     
__e254:     and #$0f           ; $e254: 29 0f     
            beq __e292         ; $e256: f0 3a     
            cmp #$06           ; $e258: c9 06     
            beq __e28f         ; $e25a: f0 33     
            cmp #$08           ; $e25c: c9 08     
            beq __e28f         ; $e25e: f0 2f     
            cmp #$01           ; $e260: c9 01     
            beq __e295         ; $e262: f0 31     
            cmp #$02           ; $e264: c9 02     
            beq __e29a         ; $e266: f0 32     
            cmp #$03           ; $e268: c9 03     
            beq __e2a1         ; $e26a: f0 35     
            lda $53            ; $e26c: a5 53     
            cmp #$03           ; $e26e: c9 03     
            beq __e278         ; $e270: f0 06     
            jsr __e2b6         ; $e272: 20 b6 e2  
            jmp __e280         ; $e275: 4c 80 e2  

;-------------------------------------------------------------------------------
__e278:     lda $19,x          ; $e278: b5 19     
            and #$03           ; $e27a: 29 03     
            ldx $ae            ; $e27c: a6 ae     
            sta $af,x          ; $e27e: 95 af     
__e280:     lda $af,x          ; $e280: b5 af     
            cmp #$01           ; $e282: c9 01     
            beq __e28a         ; $e284: f0 04     
            cmp #$02           ; $e286: c9 02     
            bne __e28c         ; $e288: d0 02     
__e28a:     sta $b3,x          ; $e28a: 95 b3     
__e28c:     jmp __e254         ; $e28c: 4c 54 e2  

;-------------------------------------------------------------------------------
__e28f:     jmp __e538         ; $e28f: 4c 38 e5  

;-------------------------------------------------------------------------------
__e292:     jmp __e2f9         ; $e292: 4c f9 e2  

;-------------------------------------------------------------------------------
__e295:     lda #$00           ; $e295: a9 00     
            jmp __e29c         ; $e297: 4c 9c e2  

;-------------------------------------------------------------------------------
__e29a:     lda #$01           ; $e29a: a9 01     
__e29c:     sta $99            ; $e29c: 85 99     
            jmp __e368         ; $e29e: 4c 68 e3  

;-------------------------------------------------------------------------------
__e2a1:     lda $53            ; $e2a1: a5 53     
            cmp #$01           ; $e2a3: c9 01     
            bne __e2b3         ; $e2a5: d0 0c     
            jsr __e626         ; $e2a7: 20 26 e6  
            ldx $ae            ; $e2aa: a6 ae     
            lda $af,x          ; $e2ac: b5 af     
            bne __e2b3         ; $e2ae: d0 03     
            jmp __e292         ; $e2b0: 4c 92 e2  

;-------------------------------------------------------------------------------
__e2b3:     jmp __e41b         ; $e2b3: 4c 1b e4  

;-------------------------------------------------------------------------------
__e2b6:     ldx $ae            ; $e2b6: a6 ae     
            lda $d2,x          ; $e2b8: b5 d2     
            bne __e2dd         ; $e2ba: d0 21     
            lda #$01           ; $e2bc: a9 01     
            sta $d2,x          ; $e2be: 95 d2     
            lda $ae            ; $e2c0: a5 ae     
            clc                ; $e2c2: 18        
            adc #$01           ; $e2c3: 69 01     
            asl                ; $e2c5: 0a        
            asl                ; $e2c6: 0a        
            asl                ; $e2c7: 0a        
            asl                ; $e2c8: 0a        
            tay                ; $e2c9: a8        
            lda $0203,y        ; $e2ca: b9 03 02  
            cmp $0203          ; $e2cd: cd 03 02  
            bcs __e2d9         ; $e2d0: b0 07     
            lda #$01           ; $e2d2: a9 01     
            sta $ec,x          ; $e2d4: 95 ec     
            jmp __e2dd         ; $e2d6: 4c dd e2  

;-------------------------------------------------------------------------------
__e2d9:     lda #$02           ; $e2d9: a9 02     
            sta $ec,x          ; $e2db: 95 ec     
__e2dd:     lda $19,x          ; $e2dd: b5 19     
            and #$07           ; $e2df: 29 07     
            sta $af,x          ; $e2e1: 95 af     
            tay                ; $e2e3: a8        
            cmp #$04           ; $e2e4: c9 04     
            bcs __e2eb         ; $e2e6: b0 03     
            jmp __e2f6         ; $e2e8: 4c f6 e2  

;-------------------------------------------------------------------------------
__e2eb:     ldy $ec,x          ; $e2eb: b4 ec     
            cmp #$07           ; $e2ed: c9 07     
            bcs __e2f4         ; $e2ef: b0 03     
            jmp __e2f6         ; $e2f1: 4c f6 e2  

;-------------------------------------------------------------------------------
__e2f4:     ldy #$03           ; $e2f4: a0 03     
__e2f6:     sty $af,x          ; $e2f6: 94 af     
            rts                ; $e2f8: 60        

;-------------------------------------------------------------------------------
__e2f9:     lda #$55           ; $e2f9: a9 55     
            sta $0a            ; $e2fb: 85 0a     
            sta $0b            ; $e2fd: 85 0b     
            jsr __e806         ; $e2ff: 20 06 e8  
            bne __e305         ; $e302: d0 01     
            rts                ; $e304: 60        

;-------------------------------------------------------------------------------
__e305:     jsr __efdd         ; $e305: 20 dd ef  
            stx $04            ; $e308: 86 04     
            jsr __eaec         ; $e30a: 20 ec ea  
            ldx $ae            ; $e30d: a6 ae     
            lda $af,x          ; $e30f: b5 af     
            cmp #$20           ; $e311: c9 20     
            bne __e31a         ; $e313: d0 05     
            lda #$ff           ; $e315: a9 ff     
            sta $af,x          ; $e317: 95 af     
            rts                ; $e319: 60        

;-------------------------------------------------------------------------------
__e31a:     cmp #$10           ; $e31a: c9 10     
            beq __e323         ; $e31c: f0 05     
            dec $01            ; $e31e: c6 01     
            jmp __e325         ; $e320: 4c 25 e3  

;-------------------------------------------------------------------------------
__e323:     inc $01            ; $e323: e6 01     
__e325:     lda $04            ; $e325: a5 04     
            tay                ; $e327: a8        
            iny                ; $e328: c8        
            lda $0200,y        ; $e329: b9 00 02  
            ldx $53            ; $e32c: a6 53     
            cpx #$04           ; $e32e: e0 04     
            beq __e340         ; $e330: f0 0e     
            cmp #$9c           ; $e332: c9 9c     
            beq __e33b         ; $e334: f0 05     
            lda #$9c           ; $e336: a9 9c     
            jmp __e34b         ; $e338: 4c 4b e3  

;-------------------------------------------------------------------------------
__e33b:     lda #$98           ; $e33b: a9 98     
            jmp __e34b         ; $e33d: 4c 4b e3  

;-------------------------------------------------------------------------------
__e340:     cmp #$ac           ; $e340: c9 ac     
            beq __e349         ; $e342: f0 05     
            lda #$ac           ; $e344: a9 ac     
            jmp __e34b         ; $e346: 4c 4b e3  

;-------------------------------------------------------------------------------
__e349:     lda #$a8           ; $e349: a9 a8     
__e34b:     jsr __ead4         ; $e34b: 20 d4 ea  
            ldx $ae            ; $e34e: a6 ae     
            lda $b3,x          ; $e350: b5 b3     
            lsr                ; $e352: 4a        
            jsr __f096         ; $e353: 20 96 f0  
            ldx $ae            ; $e356: a6 ae     
            lda $af,x          ; $e358: b5 af     
            cmp #$10           ; $e35a: c9 10     
            beq __e363         ; $e35c: f0 05     
            lda #$10           ; $e35e: a9 10     
            jmp __e365         ; $e360: 4c 65 e3  

;-------------------------------------------------------------------------------
__e363:     lda #$20           ; $e363: a9 20     
__e365:     sta $af,x          ; $e365: 95 af     
            rts                ; $e367: 60        

;-------------------------------------------------------------------------------
__e368:     lda #$55           ; $e368: a9 55     
            sta $0a            ; $e36a: 85 0a     
            sta $0b            ; $e36c: 85 0b     
            jsr __e806         ; $e36e: 20 06 e8  
            bne __e374         ; $e371: d0 01     
            rts                ; $e373: 60        

;-------------------------------------------------------------------------------
__e374:     jsr __efdd         ; $e374: 20 dd ef  
            stx $04            ; $e377: 86 04     
            jsr __eaec         ; $e379: 20 ec ea  
            lda $99            ; $e37c: a5 99     
            bne __e385         ; $e37e: d0 05     
            inc $00            ; $e380: e6 00     
            jmp __e387         ; $e382: 4c 87 e3  

;-------------------------------------------------------------------------------
__e385:     dec $00            ; $e385: c6 00     
__e387:     lda $00            ; $e387: a5 00     
            and #$0f           ; $e389: 29 0f     
            cmp #$04           ; $e38b: c9 04     
            beq __e396         ; $e38d: f0 07     
            cmp #$0c           ; $e38f: c9 0c     
            beq __e396         ; $e391: f0 03     
            jmp __e39b         ; $e393: 4c 9b e3  

;-------------------------------------------------------------------------------
__e396:     inc $01            ; $e396: e6 01     
            jmp __e3af         ; $e398: 4c af e3  

;-------------------------------------------------------------------------------
__e39b:     ldx $99            ; $e39b: a6 99     
            cmp __c3e2,x       ; $e39d: dd e2 c3  
            beq __e3aa         ; $e3a0: f0 08     
            cmp __c3e4,x       ; $e3a2: dd e4 c3  
            beq __e3aa         ; $e3a5: f0 03     
            jmp __e3af         ; $e3a7: 4c af e3  

;-------------------------------------------------------------------------------
__e3aa:     dec $01            ; $e3aa: c6 01     
            jmp __e3c0         ; $e3ac: 4c c0 e3  

;-------------------------------------------------------------------------------
__e3af:     cmp #$04           ; $e3af: c9 04     
            beq __e3ba         ; $e3b1: f0 07     
            cmp #$0c           ; $e3b3: c9 0c     
            beq __e3ba         ; $e3b5: f0 03     
            jmp __e3c0         ; $e3b7: 4c c0 e3  

;-------------------------------------------------------------------------------
__e3ba:     ldx $ae            ; $e3ba: a6 ae     
            lda #$ff           ; $e3bc: a9 ff     
            sta $af,x          ; $e3be: 95 af     
__e3c0:     ldy $99            ; $e3c0: a4 99     
            jsr __e6a5         ; $e3c2: 20 a5 e6  
            bne __e3ce         ; $e3c5: d0 07     
            lda #$00           ; $e3c7: a9 00     
            ldx $ae            ; $e3c9: a6 ae     
            sta $af,x          ; $e3cb: 95 af     
            rts                ; $e3cd: 60        

;-------------------------------------------------------------------------------
__e3ce:     lda $99            ; $e3ce: a5 99     
            beq __e3ed         ; $e3d0: f0 1b     
            lda $00            ; $e3d2: a5 00     
            cmp #$0c           ; $e3d4: c9 0c     
            beq __e3dd         ; $e3d6: f0 05     
            bcc __e3e6         ; $e3d8: 90 0c     
            jmp __e3ed         ; $e3da: 4c ed e3  

;-------------------------------------------------------------------------------
__e3dd:     lda #$00           ; $e3dd: a9 00     
            ldx $ae            ; $e3df: a6 ae     
            sta $af,x          ; $e3e1: 95 af     
            jmp __e3ed         ; $e3e3: 4c ed e3  

;-------------------------------------------------------------------------------
__e3e6:     lda #$00           ; $e3e6: a9 00     
            ldx $ae            ; $e3e8: a6 ae     
            sta $af,x          ; $e3ea: 95 af     
            rts                ; $e3ec: 60        

;-------------------------------------------------------------------------------
__e3ed:     lda $04            ; $e3ed: a5 04     
            tay                ; $e3ef: a8        
            iny                ; $e3f0: c8        
            lda $0200,y        ; $e3f1: b9 00 02  
            ldx $53            ; $e3f4: a6 53     
            cpx #$04           ; $e3f6: e0 04     
            beq __e408         ; $e3f8: f0 0e     
            cmp #$9c           ; $e3fa: c9 9c     
            bcs __e403         ; $e3fc: b0 05     
            lda #$9c           ; $e3fe: a9 9c     
            jmp __e413         ; $e400: 4c 13 e4  

;-------------------------------------------------------------------------------
__e403:     lda #$98           ; $e403: a9 98     
            jmp __e413         ; $e405: 4c 13 e4  

;-------------------------------------------------------------------------------
__e408:     cmp #$ac           ; $e408: c9 ac     
            bcs __e411         ; $e40a: b0 05     
            lda #$ac           ; $e40c: a9 ac     
            jmp __e413         ; $e40e: 4c 13 e4  

;-------------------------------------------------------------------------------
__e411:     lda #$a8           ; $e411: a9 a8     
__e413:     jsr __ead4         ; $e413: 20 d4 ea  
            lda $99            ; $e416: a5 99     
            jmp __f096         ; $e418: 4c 96 f0  

;-------------------------------------------------------------------------------
__e41b:     ldx $ae            ; $e41b: a6 ae     
            lda $af,x          ; $e41d: b5 af     
            lsr                ; $e41f: 4a        
            lsr                ; $e420: 4a        
            lsr                ; $e421: 4a        
            tax                ; $e422: aa        
            lda $53            ; $e423: a5 53     
            cmp #$04           ; $e425: c9 04     
            beq __e436         ; $e427: f0 0d     
__e429:     lda __c3f4,x       ; $e429: bd f4 c3  
            sta $0a            ; $e42c: 85 0a     
            lda __c3f5,x       ; $e42e: bd f5 c3  
            sta $0b            ; $e431: 85 0b     
            jmp __e44b         ; $e433: 4c 4b e4  

;-------------------------------------------------------------------------------
__e436:     lda $50            ; $e436: a5 50     
            and #$01           ; $e438: 29 01     
            clc                ; $e43a: 18        
            adc $54            ; $e43b: 65 54     
            cmp #$03           ; $e43d: c9 03     
            bcc __e429         ; $e43f: 90 e8     
            lda __c3f8,x       ; $e441: bd f8 c3  
            sta $0a            ; $e444: 85 0a     
            lda __c3f9,x       ; $e446: bd f9 c3  
            sta $0b            ; $e449: 85 0b     
__e44b:     jsr __e806         ; $e44b: 20 06 e8  
            bne __e451         ; $e44e: d0 01     
            rts                ; $e450: 60        

;-------------------------------------------------------------------------------
__e451:     jsr __efdd         ; $e451: 20 dd ef  
            stx $04            ; $e454: 86 04     
            jsr __eaec         ; $e456: 20 ec ea  
            ldx $ae            ; $e459: a6 ae     
            lda $e8,x          ; $e45b: b5 e8     
            beq __e46d         ; $e45d: f0 0e     
            cmp #$03           ; $e45f: c9 03     
            beq __e466         ; $e461: f0 03     
            jmp __e46d         ; $e463: 4c 6d e4  

;-------------------------------------------------------------------------------
__e466:     lda #$00           ; $e466: a9 00     
            sta $e8,x          ; $e468: 95 e8     
            jmp __e47a         ; $e46a: 4c 7a e4  

;-------------------------------------------------------------------------------
__e46d:     lda $01            ; $e46d: a5 01     
            and #$03           ; $e46f: 29 03     
            bne __e47a         ; $e471: d0 07     
            lda #$01           ; $e473: a9 01     
            inc $e8,x          ; $e475: f6 e8     
            jmp __e50c         ; $e477: 4c 0c e5  

;-------------------------------------------------------------------------------
__e47a:     lda $53            ; $e47a: a5 53     
            cmp #$01           ; $e47c: c9 01     
            beq __e4b5         ; $e47e: f0 35     
            jsr __e7a3         ; $e480: 20 a3 e7  
            cmp #$03           ; $e483: c9 03     
            beq __e48e         ; $e485: f0 07     
            cmp #$13           ; $e487: c9 13     
            beq __e49b         ; $e489: f0 10     
            jmp __e50c         ; $e48b: 4c 0c e5  

;-------------------------------------------------------------------------------
__e48e:     dec $01            ; $e48e: c6 01     
            lda $01            ; $e490: a5 01     
            ldx $ae            ; $e492: a6 ae     
            cmp $db,x          ; $e494: d5 db     
            beq __e4a8         ; $e496: f0 10     
            jmp __e50c         ; $e498: 4c 0c e5  

;-------------------------------------------------------------------------------
__e49b:     inc $01            ; $e49b: e6 01     
            lda $01            ; $e49d: a5 01     
            ldx $ae            ; $e49f: a6 ae     
            cmp $db,x          ; $e4a1: d5 db     
            beq __e4a8         ; $e4a3: f0 03     
            jmp __e50c         ; $e4a5: 4c 0c e5  

;-------------------------------------------------------------------------------
__e4a8:     lda #$01           ; $e4a8: a9 01     
            ldx $ae            ; $e4aa: a6 ae     
            sta $af,x          ; $e4ac: 95 af     
            lda #$00           ; $e4ae: a9 00     
            sta $db,x          ; $e4b0: 95 db     
            jmp __e50c         ; $e4b2: 4c 0c e5  

;-------------------------------------------------------------------------------
__e4b5:     ldx $ae            ; $e4b5: a6 ae     
            lda $af,x          ; $e4b7: b5 af     
            cmp #$13           ; $e4b9: c9 13     
            beq __e4c0         ; $e4bb: f0 03     
            jmp __e4d6         ; $e4bd: 4c d6 e4  

;-------------------------------------------------------------------------------
__e4c0:     inc $01            ; $e4c0: e6 01     
            lda $ae            ; $e4c2: a5 ae     
            asl                ; $e4c4: 0a        
            tax                ; $e4c5: aa        
            inx                ; $e4c6: e8        
            lda $b9,x          ; $e4c7: b5 b9     
            cmp $01            ; $e4c9: c5 01     
            bne __e4d3         ; $e4cb: d0 06     
            lda #$01           ; $e4cd: a9 01     
            ldx $ae            ; $e4cf: a6 ae     
            sta $af,x          ; $e4d1: 95 af     
__e4d3:     jmp __e50c         ; $e4d3: 4c 0c e5  

;-------------------------------------------------------------------------------
__e4d6:     dec $01            ; $e4d6: c6 01     
            ldx $ae            ; $e4d8: a6 ae     
            cpx #$00           ; $e4da: e0 00     
            bne __e4f9         ; $e4dc: d0 1b     
            ldx $ae            ; $e4de: a6 ae     
            lda $e0,x          ; $e4e0: b5 e0     
            cmp #$02           ; $e4e2: c9 02     
            beq __e4f9         ; $e4e4: f0 13     
            lda $ae            ; $e4e6: a5 ae     
            asl                ; $e4e8: 0a        
            tax                ; $e4e9: aa        
            lda $b9,x          ; $e4ea: b5 b9     
            cmp $01            ; $e4ec: c5 01     
            bne __e50c         ; $e4ee: d0 1c     
            lda #$02           ; $e4f0: a9 02     
            ldx $ae            ; $e4f2: a6 ae     
            sta $af,x          ; $e4f4: 95 af     
            jmp __e50c         ; $e4f6: 4c 0c e5  

;-------------------------------------------------------------------------------
__e4f9:     lda $ae            ; $e4f9: a5 ae     
            asl                ; $e4fb: 0a        
            tax                ; $e4fc: aa        
            lda $b9,x          ; $e4fd: b5 b9     
            clc                ; $e4ff: 18        
            adc #$0d           ; $e500: 69 0d     
            cmp $01            ; $e502: c5 01     
            bne __e50c         ; $e504: d0 06     
            lda #$13           ; $e506: a9 13     
            ldx $ae            ; $e508: a6 ae     
            sta $af,x          ; $e50a: 95 af     
__e50c:     lda $04            ; $e50c: a5 04     
            tay                ; $e50e: a8        
            iny                ; $e50f: c8        
            lda $0200,y        ; $e510: b9 00 02  
            ldx $53            ; $e513: a6 53     
            cpx #$04           ; $e515: e0 04     
            beq __e527         ; $e517: f0 0e     
            cmp #$9c           ; $e519: c9 9c     
            bcs __e522         ; $e51b: b0 05     
            lda #$9c           ; $e51d: a9 9c     
            jmp __e532         ; $e51f: 4c 32 e5  

;-------------------------------------------------------------------------------
__e522:     lda #$98           ; $e522: a9 98     
            jmp __e532         ; $e524: 4c 32 e5  

;-------------------------------------------------------------------------------
__e527:     cmp #$ac           ; $e527: c9 ac     
            bcs __e530         ; $e529: b0 05     
            lda #$ac           ; $e52b: a9 ac     
            jmp __e532         ; $e52d: 4c 32 e5  

;-------------------------------------------------------------------------------
__e530:     lda #$a8           ; $e530: a9 a8     
__e532:     jsr __ead4         ; $e532: 20 d4 ea  
            jmp __f088         ; $e535: 4c 88 f0  

;-------------------------------------------------------------------------------
__e538:     ldx $ae            ; $e538: a6 ae     
            lda $af,x          ; $e53a: b5 af     
            cmp #$06           ; $e53c: c9 06     
            beq __e548         ; $e53e: f0 08     
            cmp #$08           ; $e540: c9 08     
            beq __e545         ; $e542: f0 01     
            rts                ; $e544: 60        

;-------------------------------------------------------------------------------
__e545:     jmp __e59f         ; $e545: 4c 9f e5  

;-------------------------------------------------------------------------------
__e548:     lda $53            ; $e548: a5 53     
            cmp #$01           ; $e54a: c9 01     
            beq __e553         ; $e54c: f0 05     
            cmp #$04           ; $e54e: c9 04     
            beq __e564         ; $e550: f0 12     
            rts                ; $e552: 60        

;-------------------------------------------------------------------------------
__e553:     lda #$20           ; $e553: a9 20     
            sta $00            ; $e555: 85 00     
            lda #$b8           ; $e557: a9 b8     
            sta $01            ; $e559: 85 01     
            ldx $ae            ; $e55b: a6 ae     
            lda #$08           ; $e55d: a9 08     
            sta $af,x          ; $e55f: 95 af     
            jmp __e592         ; $e561: 4c 92 e5  

;-------------------------------------------------------------------------------
__e564:     lda $0203          ; $e564: ad 03 02  
            cmp #$78           ; $e567: c9 78     
            bcc __e570         ; $e569: 90 05     
            ldy #$00           ; $e56b: a0 00     
            jmp __e572         ; $e56d: 4c 72 e5  

;-------------------------------------------------------------------------------
__e570:     ldy #$08           ; $e570: a0 08     
__e572:     sty $0c            ; $e572: 84 0c     
            lda $19            ; $e574: a5 19     
            and #$03           ; $e576: 29 03     
            asl                ; $e578: 0a        
            clc                ; $e579: 18        
            adc $0c            ; $e57a: 65 0c     
            tax                ; $e57c: aa        
            lda __c3ce,x       ; $e57d: bd ce c3  
            sta $00            ; $e580: 85 00     
            lda __c3cf,x       ; $e582: bd cf c3  
            sta $01            ; $e585: 85 01     
            ldx $ae            ; $e587: a6 ae     
            lda #$00           ; $e589: a9 00     
            sta $af,x          ; $e58b: 95 af     
            lda #$a8           ; $e58d: a9 a8     
            jmp __e594         ; $e58f: 4c 94 e5  

;-------------------------------------------------------------------------------
__e592:     lda #$98           ; $e592: a9 98     
__e594:     jsr __ead4         ; $e594: 20 d4 ea  
            jsr __efdd         ; $e597: 20 dd ef  
            sta $04            ; $e59a: 85 04     
            jmp __f082         ; $e59c: 4c 82 f0  

;-------------------------------------------------------------------------------
__e59f:     jsr __efdd         ; $e59f: 20 dd ef  
            stx $04            ; $e5a2: 86 04     
            jsr __eaec         ; $e5a4: 20 ec ea  
            lda $0201,x        ; $e5a7: bd 01 02  
            jsr __ead4         ; $e5aa: 20 d4 ea  
            lda $53            ; $e5ad: a5 53     
            cmp #$01           ; $e5af: c9 01     
            beq __e5b4         ; $e5b1: f0 01     
            rts                ; $e5b3: 60        

;-------------------------------------------------------------------------------
__e5b4:     inc $00            ; $e5b4: e6 00     
            lda $00            ; $e5b6: a5 00     
            cmp #$2c           ; $e5b8: c9 2c     
            beq __e5be         ; $e5ba: f0 02     
            bcc __e5e5         ; $e5bc: 90 27     
__e5be:     inc $01            ; $e5be: e6 01     
            lda $01            ; $e5c0: a5 01     
            cmp #$c5           ; $e5c2: c9 c5     
            bne __e5e5         ; $e5c4: d0 1f     
            lda #$00           ; $e5c6: a9 00     
            ldx $ae            ; $e5c8: a6 ae     
            sta $af,x          ; $e5ca: 95 af     
            dec $00            ; $e5cc: c6 00     
            lda $00            ; $e5ce: a5 00     
            cmp #$68           ; $e5d0: c9 68     
            bcs __e5d9         ; $e5d2: b0 05     
            inc $01            ; $e5d4: e6 01     
            jmp __e5db         ; $e5d6: 4c db e5  

;-------------------------------------------------------------------------------
__e5d9:     dec $01            ; $e5d9: c6 01     
__e5db:     cmp #$60           ; $e5db: c9 60     
            bne __e5e5         ; $e5dd: d0 06     
            ldx $ae            ; $e5df: a6 ae     
            lda #$00           ; $e5e1: a9 00     
            sta $af,x          ; $e5e3: 95 af     
__e5e5:     jmp __f082         ; $e5e5: 4c 82 f0  

;-------------------------------------------------------------------------------
__e5e8:     sta $0c            ; $e5e8: 85 0c     
            ldx $ae            ; $e5ea: a6 ae     
            lda $e0,x          ; $e5ec: b5 e0     
            cmp #$01           ; $e5ee: c9 01     
            beq __e60f         ; $e5f0: f0 1d     
            cmp #$06           ; $e5f2: c9 06     
            beq __e60f         ; $e5f4: f0 19     
            ldx #$00           ; $e5f6: a2 00     
            lda #$18           ; $e5f8: a9 18     
__e5fa:     cmp $0c            ; $e5fa: c5 0c     
            beq __e609         ; $e5fc: f0 0b     
            inx                ; $e5fe: e8        
            cpx #$09           ; $e5ff: e0 09     
            beq __e60c         ; $e601: f0 09     
            lda __c1c4,x       ; $e603: bd c4 c1  
            jmp __e5fa         ; $e606: 4c fa e5  

;-------------------------------------------------------------------------------
__e609:     lda #$00           ; $e609: a9 00     
            rts                ; $e60b: 60        

;-------------------------------------------------------------------------------
__e60c:     lda #$01           ; $e60c: a9 01     
            rts                ; $e60e: 60        

;-------------------------------------------------------------------------------
__e60f:     ldx #$04           ; $e60f: a2 04     
__e611:     lda __c1c4,x       ; $e611: bd c4 c1  
            cmp $0c            ; $e614: c5 0c     
            beq __e620         ; $e616: f0 08     
            inx                ; $e618: e8        
            cpx #$09           ; $e619: e0 09     
            beq __e623         ; $e61b: f0 06     
            jmp __e611         ; $e61d: 4c 11 e6  

;-------------------------------------------------------------------------------
__e620:     lda #$00           ; $e620: a9 00     
            rts                ; $e622: 60        

;-------------------------------------------------------------------------------
__e623:     lda #$01           ; $e623: a9 01     
            rts                ; $e625: 60        

;-------------------------------------------------------------------------------
__e626:     ldx $ae            ; $e626: a6 ae     
            lda $af,x          ; $e628: b5 af     
            cmp #$13           ; $e62a: c9 13     
            bne __e62f         ; $e62c: d0 01     
            rts                ; $e62e: 60        

;-------------------------------------------------------------------------------
__e62f:     jsr __efdd         ; $e62f: 20 dd ef  
            jsr __eaec         ; $e632: 20 ec ea  
            ldx $ae            ; $e635: a6 ae     
            lda $e0,x          ; $e637: b5 e0     
            cmp #$01           ; $e639: c9 01     
            beq __e640         ; $e63b: f0 03     
            jmp __e66d         ; $e63d: 4c 6d e6  

;-------------------------------------------------------------------------------
__e640:     lda $00            ; $e640: a5 00     
            cmp #$5c           ; $e642: c9 5c     
            beq __e64d         ; $e644: f0 07     
            cmp #$c4           ; $e646: c9 c4     
            beq __e65d         ; $e648: f0 13     
            jmp __e69e         ; $e64a: 4c 9e e6  

;-------------------------------------------------------------------------------
__e64d:     lda $ae            ; $e64d: a5 ae     
            asl                ; $e64f: 0a        
            tax                ; $e650: aa        
            lda #$a6           ; $e651: a9 a6     
            sta $b9,x          ; $e653: 95 b9     
            inx                ; $e655: e8        
            lda #$c7           ; $e656: a9 c7     
            sta $b9,x          ; $e658: 95 b9     
            jmp __e697         ; $e65a: 4c 97 e6  

;-------------------------------------------------------------------------------
__e65d:     lda $ae            ; $e65d: a5 ae     
            asl                ; $e65f: 0a        
            tax                ; $e660: aa        
            lda #$ab           ; $e661: a9 ab     
            sta $b9,x          ; $e663: 95 b9     
            inx                ; $e665: e8        
            lda #$c3           ; $e666: a9 c3     
            sta $b9,x          ; $e668: 95 b9     
            jmp __e697         ; $e66a: 4c 97 e6  

;-------------------------------------------------------------------------------
__e66d:     lda $00            ; $e66d: a5 00     
            cmp #$2c           ; $e66f: c9 2c     
            beq __e67a         ; $e671: f0 07     
            cmp #$6c           ; $e673: c9 6c     
            beq __e68a         ; $e675: f0 13     
            jmp __e69e         ; $e677: 4c 9e e6  

;-------------------------------------------------------------------------------
__e67a:     lda $ae            ; $e67a: a5 ae     
            asl                ; $e67c: 0a        
            tax                ; $e67d: aa        
            lda #$8d           ; $e67e: a9 8d     
            sta $b9,x          ; $e680: 95 b9     
            inx                ; $e682: e8        
            lda #$a4           ; $e683: a9 a4     
            sta $b9,x          ; $e685: 95 b9     
            jmp __e697         ; $e687: 4c 97 e6  

;-------------------------------------------------------------------------------
__e68a:     lda $ae            ; $e68a: a5 ae     
            asl                ; $e68c: 0a        
            tax                ; $e68d: aa        
            lda #$8a           ; $e68e: a9 8a     
            sta $b9,x          ; $e690: 95 b9     
            inx                ; $e692: e8        
            lda #$a7           ; $e693: a9 a7     
            sta $b9,x          ; $e695: 95 b9     
__e697:     lda #$03           ; $e697: a9 03     
            ldx $ae            ; $e699: a6 ae     
            sta $af,x          ; $e69b: 95 af     
            rts                ; $e69d: 60        

;-------------------------------------------------------------------------------
__e69e:     lda #$00           ; $e69e: a9 00     
            ldx $ae            ; $e6a0: a6 ae     
            sta $af,x          ; $e6a2: 95 af     
            rts                ; $e6a4: 60        

;-------------------------------------------------------------------------------
__e6a5:     lda $01            ; $e6a5: a5 01     
            clc                ; $e6a7: 18        
            adc #$0b           ; $e6a8: 69 0b     
            jsr __e016         ; $e6aa: 20 16 e0  
            ldy $99            ; $e6ad: a4 99     
            ldx $ae            ; $e6af: a6 ae     
            sta $e0,x          ; $e6b1: 95 e0     
            lda $53            ; $e6b3: a5 53     
            cmp #$01           ; $e6b5: c9 01     
            bne __e6bc         ; $e6b7: d0 03     
            jmp __e6c6         ; $e6b9: 4c c6 e6  

;-------------------------------------------------------------------------------
__e6bc:     cmp #$03           ; $e6bc: c9 03     
            bne __e6c3         ; $e6be: d0 03     
            jmp __e702         ; $e6c0: 4c 02 e7  

;-------------------------------------------------------------------------------
__e6c3:     jmp __e73c         ; $e6c3: 4c 3c e7  

;-------------------------------------------------------------------------------
__e6c6:     lda $00            ; $e6c6: a5 00     
            jsr __e5e8         ; $e6c8: 20 e8 e5  
            bne __e6e3         ; $e6cb: d0 16     
            ldx $ae            ; $e6cd: a6 ae     
            lda $e0,x          ; $e6cf: b5 e0     
            and #$01           ; $e6d1: 29 01     
            beq __e6db         ; $e6d3: f0 06     
            lda __c79a,y       ; $e6d5: b9 9a c7  
            jmp __e6de         ; $e6d8: 4c de e6  

;-------------------------------------------------------------------------------
__e6db:     lda __c79c,y       ; $e6db: b9 9c c7  
__e6de:     clc                ; $e6de: 18        
            adc $01            ; $e6df: 65 01     
            sta $01            ; $e6e1: 85 01     
__e6e3:     ldx $ae            ; $e6e3: a6 ae     
            lda $e0,x          ; $e6e5: b5 e0     
            cmp #$01           ; $e6e7: c9 01     
            beq __e6f3         ; $e6e9: f0 08     
            lda $00            ; $e6eb: a5 00     
            cmp __c3e6,y       ; $e6ed: d9 e6 c3  
            beq __e6fb         ; $e6f0: f0 09     
            rts                ; $e6f2: 60        

;-------------------------------------------------------------------------------
__e6f3:     lda $00            ; $e6f3: a5 00     
            cmp __c3e8,y       ; $e6f5: d9 e8 c3  
            beq __e6fb         ; $e6f8: f0 01     
            rts                ; $e6fa: 60        

;-------------------------------------------------------------------------------
__e6fb:     lda #$00           ; $e6fb: a9 00     
            ldx $ae            ; $e6fd: a6 ae     
            sta $af,x          ; $e6ff: 95 af     
            rts                ; $e701: 60        

;-------------------------------------------------------------------------------
__e702:     ldx $ae            ; $e702: a6 ae     
            lda $e0,x          ; $e704: b5 e0     
            cmp #$02           ; $e706: c9 02     
            bne __e719         ; $e708: d0 0f     
            lda $00            ; $e70a: a5 00     
            cmp __c3ea,y       ; $e70c: d9 ea c3  
            beq __e735         ; $e70f: f0 24     
            cmp __c3ec,y       ; $e711: d9 ec c3  
            beq __e735         ; $e714: f0 1f     
            jmp __e72d         ; $e716: 4c 2d e7  

;-------------------------------------------------------------------------------
__e719:     cpy #$01           ; $e719: c0 01     
            bne __e721         ; $e71b: d0 04     
            cmp #$04           ; $e71d: c9 04     
            beq __e72e         ; $e71f: f0 0d     
__e721:     lda $00            ; $e721: a5 00     
            cmp __c3ee,y       ; $e723: d9 ee c3  
            beq __e735         ; $e726: f0 0d     
            cmp __c3f0,y       ; $e728: d9 f0 c3  
            beq __e735         ; $e72b: f0 08     
__e72d:     rts                ; $e72d: 60        

;-------------------------------------------------------------------------------
__e72e:     lda $00            ; $e72e: a5 00     
            cmp #$db           ; $e730: c9 db     
            beq __e735         ; $e732: f0 01     
            rts                ; $e734: 60        

;-------------------------------------------------------------------------------
__e735:     ldx $ae            ; $e735: a6 ae     
            lda #$00           ; $e737: a9 00     
            sta $af,x          ; $e739: 95 af     
            rts                ; $e73b: 60        

;-------------------------------------------------------------------------------
__e73c:     ldx $ae            ; $e73c: a6 ae     
            lda $e0,x          ; $e73e: b5 e0     
            tay                ; $e740: a8        
            dey                ; $e741: 88        
            ldx $99            ; $e742: a6 99     
            lda __c3f2,x       ; $e744: bd f2 c3  
__e747:     cpy #$00           ; $e747: c0 00     
            beq __e75c         ; $e749: f0 11     
            cpx #$00           ; $e74b: e0 00     
            beq __e755         ; $e74d: f0 06     
            clc                ; $e74f: 18        
            adc #$08           ; $e750: 69 08     
            jmp __e758         ; $e752: 4c 58 e7  

;-------------------------------------------------------------------------------
__e755:     sec                ; $e755: 38        
            sbc #$08           ; $e756: e9 08     
__e758:     dey                ; $e758: 88        
            jmp __e747         ; $e759: 4c 47 e7  

;-------------------------------------------------------------------------------
__e75c:     cmp $00            ; $e75c: c5 00     
            beq __e769         ; $e75e: f0 09     
            lda $99            ; $e760: a5 99     
            asl                ; $e762: 0a        
            jsr __e770         ; $e763: 20 70 e7  
            beq __e769         ; $e766: f0 01     
            rts                ; $e768: 60        

;-------------------------------------------------------------------------------
__e769:     ldx $ae            ; $e769: a6 ae     
            lda #$00           ; $e76b: a9 00     
            sta $af,x          ; $e76d: 95 af     
            rts                ; $e76f: 60        

;-------------------------------------------------------------------------------
__e770:     sta $09            ; $e770: 85 09     
            jsr __efdd         ; $e772: 20 dd ef  
            lda $0203,x        ; $e775: bd 03 02  
            sta $0a            ; $e778: 85 0a     
            ldx $ae            ; $e77a: a6 ae     
            lda $e0,x          ; $e77c: b5 e0     
            sec                ; $e77e: 38        
            sbc #$02           ; $e77f: e9 02     
            asl                ; $e781: 0a        
            tax                ; $e782: aa        
            lda $c1,x          ; $e783: b5 c1     
            beq __e790         ; $e785: f0 09     
            ldy $09            ; $e787: a4 09     
            lda __c3de,y       ; $e789: b9 de c3  
            cmp $0a            ; $e78c: c5 0a     
            beq __e79d         ; $e78e: f0 0d     
__e790:     lda $c2,x          ; $e790: b5 c2     
            beq __e7a0         ; $e792: f0 0c     
            ldy $09            ; $e794: a4 09     
            lda __c3df,y       ; $e796: b9 df c3  
            cmp $0a            ; $e799: c5 0a     
            bne __e7a0         ; $e79b: d0 03     
__e79d:     lda #$00           ; $e79d: a9 00     
            rts                ; $e79f: 60        

;-------------------------------------------------------------------------------
__e7a0:     lda #$01           ; $e7a0: a9 01     
            rts                ; $e7a2: 60        

;-------------------------------------------------------------------------------
__e7a3:     ldx $ae            ; $e7a3: a6 ae     
            lda $db,x          ; $e7a5: b5 db     
            beq __e7ae         ; $e7a7: f0 05     
            ldx $ae            ; $e7a9: a6 ae     
            lda $af,x          ; $e7ab: b5 af     
            rts                ; $e7ad: 60        

;-------------------------------------------------------------------------------
__e7ae:     lda $53            ; $e7ae: a5 53     
            sec                ; $e7b0: 38        
            sbc #$02           ; $e7b1: e9 02     
            asl                ; $e7b3: 0a        
            tay                ; $e7b4: a8        
            lda __c49b,y       ; $e7b5: b9 9b c4  
            sta $07            ; $e7b8: 85 07     
            lda __c49c,y       ; $e7ba: b9 9c c4  
            sta $08            ; $e7bd: 85 08     
            ldx $ae            ; $e7bf: a6 ae     
            ldy $e0,x          ; $e7c1: b4 e0     
            beq __e7f2         ; $e7c3: f0 2d     
            dey                ; $e7c5: 88        
            lda ($07),y        ; $e7c6: b1 07     
            sta $09            ; $e7c8: 85 09     
            iny                ; $e7ca: c8        
            lda ($07),y        ; $e7cb: b1 07     
            sta $0a            ; $e7cd: 85 0a     
            lda $53            ; $e7cf: a5 53     
            sec                ; $e7d1: 38        
            sbc #$02           ; $e7d2: e9 02     
            asl                ; $e7d4: 0a        
            tay                ; $e7d5: a8        
            lda __c4a1,y       ; $e7d6: b9 a1 c4  
            sta $07            ; $e7d9: 85 07     
            lda __c4a2,y       ; $e7db: b9 a2 c4  
            sta $08            ; $e7de: 85 08     
            ldy $09            ; $e7e0: a4 09     
__e7e2:     cpy $0a            ; $e7e2: c4 0a     
            beq __e7f2         ; $e7e4: f0 0c     
            lda ($07),y        ; $e7e6: b1 07     
            cmp $00            ; $e7e8: c5 00     
            beq __e7f9         ; $e7ea: f0 0d     
            iny                ; $e7ec: c8        
            iny                ; $e7ed: c8        
            iny                ; $e7ee: c8        
            jmp __e7e2         ; $e7ef: 4c e2 e7  

;-------------------------------------------------------------------------------
__e7f2:     lda #$00           ; $e7f2: a9 00     
            ldx $ae            ; $e7f4: a6 ae     
            sta $af,x          ; $e7f6: 95 af     
            rts                ; $e7f8: 60        

;-------------------------------------------------------------------------------
__e7f9:     iny                ; $e7f9: c8        
            lda ($07),y        ; $e7fa: b1 07     
            ldx $ae            ; $e7fc: a6 ae     
            sta $db,x          ; $e7fe: 95 db     
            iny                ; $e800: c8        
            lda ($07),y        ; $e801: b1 07     
            .hex 95            ; $e803: 95        Suspected data
__e804:     .hex af 60         ; $e804: af 60     Suspected data
__e806:     ldx $ae            ; $e806: a6 ae     
            inc $e4,x          ; $e808: f6 e4     
            lda $e4,x          ; $e80a: b5 e4     
            bmi __e815         ; $e80c: 30 07     
            cmp #$10           ; $e80e: c9 10     
            bcs __e815         ; $e810: b0 03     
            jmp __e819         ; $e812: 4c 19 e8  

;-------------------------------------------------------------------------------
__e815:     lda #$00           ; $e815: a9 00     
            sta $e4,x          ; $e817: 95 e4     
__e819:     cmp #$08           ; $e819: c9 08     
            bcs __e826         ; $e81b: b0 09     
            tax                ; $e81d: aa        
            lda __c1bc,x       ; $e81e: bd bc c1  
            and $0a            ; $e821: 25 0a     
            jmp __e82f         ; $e823: 4c 2f e8  

;-------------------------------------------------------------------------------
__e826:     sec                ; $e826: 38        
            sbc #$08           ; $e827: e9 08     
            tax                ; $e829: aa        
            lda __c1bc,x       ; $e82a: bd bc c1  
            and $0b            ; $e82d: 25 0b     
__e82f:     beq __e833         ; $e82f: f0 02     
            lda #$01           ; $e831: a9 01     
__e833:     rts                ; $e833: 60        

;-------------------------------------------------------------------------------
            jsr __eaf7         ; $e834: 20 f7 ea  
            lda __c45c,x       ; $e837: bd 5c c4  
            sta $0a            ; $e83a: 85 0a     
            lda __c461,x       ; $e83c: bd 61 c4  
            sta $0b            ; $e83f: 85 0b     
            lda #$00           ; $e841: a9 00     
            sta $5d            ; $e843: 85 5d     
            jsr __dfe8         ; $e845: 20 e8 df  
            bne __e84b         ; $e848: d0 01     
            rts                ; $e84a: 60        

;-------------------------------------------------------------------------------
__e84b:     lda #$00           ; $e84b: a9 00     
            sta $d2            ; $e84d: 85 d2     
__e84f:     lda $d2            ; $e84f: a5 d2     
            cmp #$03           ; $e851: c9 03     
            bcs __e8a9         ; $e853: b0 54     
            tax                ; $e855: aa        
            bne __e86a         ; $e856: d0 12     
            lda $da            ; $e858: a5 da     
            cmp #$01           ; $e85a: c9 01     
            bne __e86a         ; $e85c: d0 0c     
            dec $0200          ; $e85e: ce 00 02  
            dec $0204          ; $e861: ce 04 02  
            dec $0208          ; $e864: ce 08 02  
            dec $020c          ; $e867: ce 0c 02  
__e86a:     ldy __c2cc,x       ; $e86a: bc cc c2  
            lda $0200,y        ; $e86d: b9 00 02  
            cmp #$ff           ; $e870: c9 ff     
            beq __e8a4         ; $e872: f0 30     
            tya                ; $e874: 98        
            tax                ; $e875: aa        
            dec $0200,x        ; $e876: de 00 02  
            dec $0204,x        ; $e879: de 04 02  
            lda $0200,x        ; $e87c: bd 00 02  
            cmp #$50           ; $e87f: c9 50     
            bne __e889         ; $e881: d0 06     
            jsr __e968         ; $e883: 20 68 e9  
            jmp __e890         ; $e886: 4c 90 e8  

;-------------------------------------------------------------------------------
__e889:     cmp #$c8           ; $e889: c9 c8     
            bne __e890         ; $e88b: d0 03     
            jsr __e971         ; $e88d: 20 71 e9  
__e890:     lda $0200,y        ; $e890: b9 00 02  
            cmp #$70           ; $e893: c9 70     
            bne __e89b         ; $e895: d0 04     
            lda #$01           ; $e897: a9 01     
            sta $d8            ; $e899: 85 d8     
__e89b:     lda $0200,y        ; $e89b: b9 00 02  
            cmp #$48           ; $e89e: c9 48     
            beq __e901         ; $e8a0: f0 5f     
            bcc __e901         ; $e8a2: 90 5d     
__e8a4:     inc $d2            ; $e8a4: e6 d2     
            jmp __e84f         ; $e8a6: 4c 4f e8  

;-------------------------------------------------------------------------------
__e8a9:     cmp #$06           ; $e8a9: c9 06     
            beq __e90e         ; $e8ab: f0 61     
            tax                ; $e8ad: aa        
            cmp #$03           ; $e8ae: c9 03     
            bne __e8c4         ; $e8b0: d0 12     
            lda $da            ; $e8b2: a5 da     
            cmp #$02           ; $e8b4: c9 02     
            bne __e8c4         ; $e8b6: d0 0c     
            inc $0200          ; $e8b8: ee 00 02  
            inc $0204          ; $e8bb: ee 04 02  
            inc $0208          ; $e8be: ee 08 02  
            inc $020c          ; $e8c1: ee 0c 02  
__e8c4:     ldy __c2cc,x       ; $e8c4: bc cc c2  
            lda $0200,y        ; $e8c7: b9 00 02  
            cmp #$ff           ; $e8ca: c9 ff     
            beq __e8fc         ; $e8cc: f0 2e     
            tya                ; $e8ce: 98        
            tax                ; $e8cf: aa        
            inc $0200,x        ; $e8d0: fe 00 02  
            inc $0204,x        ; $e8d3: fe 04 02  
            lda $0200,x        ; $e8d6: bd 00 02  
            cmp #$50           ; $e8d9: c9 50     
            bne __e8e3         ; $e8db: d0 06     
            jsr __e971         ; $e8dd: 20 71 e9  
            jmp __e8ea         ; $e8e0: 4c ea e8  

;-------------------------------------------------------------------------------
__e8e3:     cmp #$c8           ; $e8e3: c9 c8     
            bne __e8ea         ; $e8e5: d0 03     
            jsr __e968         ; $e8e7: 20 68 e9  
__e8ea:     lda $0200,y        ; $e8ea: b9 00 02  
            cmp #$a8           ; $e8ed: c9 a8     
            bne __e8f8         ; $e8ef: d0 07     
            lda #$01           ; $e8f1: a9 01     
            sta $d9            ; $e8f3: 85 d9     
            lda $0200,y        ; $e8f5: b9 00 02  
__e8f8:     cmp #$d0           ; $e8f8: c9 d0     
            bcs __e901         ; $e8fa: b0 05     
__e8fc:     inc $d2            ; $e8fc: e6 d2     
            jmp __e84f         ; $e8fe: 4c 4f e8  

;-------------------------------------------------------------------------------
__e901:     lda #$ff           ; $e901: a9 ff     
            sta $0200,y        ; $e903: 99 00 02  
            sta $0204,y        ; $e906: 99 04 02  
            inc $d2            ; $e909: e6 d2     
            jmp __e84f         ; $e90b: 4c 4f e8  

;-------------------------------------------------------------------------------
__e90e:     lda $d8            ; $e90e: a5 d8     
            cmp #$01           ; $e910: c9 01     
            bne __e93b         ; $e912: d0 27     
            lda #$00           ; $e914: a9 00     
            sta $d2            ; $e916: 85 d2     
__e918:     lda $d2            ; $e918: a5 d2     
            cmp #$03           ; $e91a: c9 03     
            beq __e967         ; $e91c: f0 49     
            tax                ; $e91e: aa        
            ldy __c2cc,x       ; $e91f: bc cc c2  
            lda $0200,y        ; $e922: b9 00 02  
            cmp #$ff           ; $e925: c9 ff     
            beq __e92e         ; $e927: f0 05     
            inc $d2            ; $e929: e6 d2     
            jmp __e918         ; $e92b: 4c 18 e9  

;-------------------------------------------------------------------------------
__e92e:     lda #$d0           ; $e92e: a9 d0     
            jsr __e97a         ; $e930: 20 7a e9  
            jsr __e968         ; $e933: 20 68 e9  
            lda #$00           ; $e936: a9 00     
            sta $d8            ; $e938: 85 d8     
            rts                ; $e93a: 60        

;-------------------------------------------------------------------------------
__e93b:     lda $d9            ; $e93b: a5 d9     
            cmp #$01           ; $e93d: c9 01     
            bne __e967         ; $e93f: d0 26     
            lda #$03           ; $e941: a9 03     
            sta $d2            ; $e943: 85 d2     
__e945:     lda $d2            ; $e945: a5 d2     
            cmp #$06           ; $e947: c9 06     
            beq __e967         ; $e949: f0 1c     
            tax                ; $e94b: aa        
            ldy __c2cc,x       ; $e94c: bc cc c2  
            lda $0200,y        ; $e94f: b9 00 02  
            cmp #$ff           ; $e952: c9 ff     
            beq __e95b         ; $e954: f0 05     
            inc $d2            ; $e956: e6 d2     
            jmp __e945         ; $e958: 4c 45 e9  

;-------------------------------------------------------------------------------
__e95b:     lda #$48           ; $e95b: a9 48     
            jsr __e97a         ; $e95d: 20 7a e9  
            jsr __e968         ; $e960: 20 68 e9  
            lda #$00           ; $e963: a9 00     
            sta $d9            ; $e965: 85 d9     
__e967:     rts                ; $e967: 60        

;-------------------------------------------------------------------------------
__e968:     lda #$23           ; $e968: a9 23     
            sta $0202,y        ; $e96a: 99 02 02  
            sta $0206,y        ; $e96d: 99 06 02  
            rts                ; $e970: 60        

;-------------------------------------------------------------------------------
__e971:     lda #$03           ; $e971: a9 03     
            sta $0202,y        ; $e973: 99 02 02  
            sta $0206,y        ; $e976: 99 06 02  
            rts                ; $e979: 60        

;-------------------------------------------------------------------------------
__e97a:     sta $0200,y        ; $e97a: 99 00 02  
            sta $0204,y        ; $e97d: 99 04 02  
            rts                ; $e980: 60        

;-------------------------------------------------------------------------------
__e981:     lda #$00           ; $e981: a9 00     
            sta $0445          ; $e983: 8d 45 04  
__e986:     lda $0445          ; $e986: ad 45 04  
            jsr __efd7         ; $e989: 20 d7 ef  
            txa                ; $e98c: 8a        
            clc                ; $e98d: 18        
            adc #$30           ; $e98e: 69 30     
            tax                ; $e990: aa        
            stx $04            ; $e991: 86 04     
            jsr __eaec         ; $e993: 20 ec ea  
            cmp #$ff           ; $e996: c9 ff     
            beq __e9f0         ; $e998: f0 56     
            ldx $0445          ; $e99a: ae 45 04  
            lda $0446,x        ; $e99d: bd 46 04  
            clc                ; $e9a0: 18        
            adc #$b0           ; $e9a1: 69 b0     
            cmp $00            ; $e9a3: c5 00     
            bcc __e9b4         ; $e9a5: 90 0d     
            lda $01            ; $e9a7: a5 01     
            cmp #$26           ; $e9a9: c9 26     
            bcs __e9be         ; $e9ab: b0 11     
            lda #$c0           ; $e9ad: a9 c0     
            sta $02            ; $e9af: 85 02     
            jmp __e9da         ; $e9b1: 4c da e9  

;-------------------------------------------------------------------------------
__e9b4:     jsr __ea01         ; $e9b4: 20 01 ea  
            cmp #$ff           ; $e9b7: c9 ff     
            beq __e9f3         ; $e9b9: f0 38     
            jmp __e9ea         ; $e9bb: 4c ea e9  

;-------------------------------------------------------------------------------
__e9be:     lda #$c4           ; $e9be: a9 c4     
            sta $02            ; $e9c0: 85 02     
            lda $01            ; $e9c2: a5 01     
            cmp #$2e           ; $e9c4: c9 2e     
            bcc __e9da         ; $e9c6: 90 12     
            lda #$02           ; $e9c8: a9 02     
            sta $fe            ; $e9ca: 85 fe     
            lda #$2e           ; $e9cc: a9 2e     
            sta $01            ; $e9ce: 85 01     
            lda $0445          ; $e9d0: ad 45 04  
            asl                ; $e9d3: 0a        
            tax                ; $e9d4: aa        
            lda #$00           ; $e9d5: a9 00     
            sta $042e,x        ; $e9d7: 9d 2e 04  
__e9da:     lda $00            ; $e9da: a5 00     
            clc                ; $e9dc: 18        
            adc #$02           ; $e9dd: 69 02     
            sta $00            ; $e9df: 85 00     
            lda $0445          ; $e9e1: ad 45 04  
            clc                ; $e9e4: 18        
            adc #$01           ; $e9e5: 69 01     
            jsr __ef72         ; $e9e7: 20 72 ef  
__e9ea:     jsr __eadb         ; $e9ea: 20 db ea  
            jmp __e9f3         ; $e9ed: 4c f3 e9  

;-------------------------------------------------------------------------------
__e9f0:     jsr __ea34         ; $e9f0: 20 34 ea  
__e9f3:     inc $0445          ; $e9f3: ee 45 04  
            lda $0445          ; $e9f6: ad 45 04  
            cmp #$03           ; $e9f9: c9 03     
            beq __ea00         ; $e9fb: f0 03     
            jmp __e986         ; $e9fd: 4c 86 e9  

;-------------------------------------------------------------------------------
__ea00:     rts                ; $ea00: 60        

;-------------------------------------------------------------------------------
__ea01:     lda $01            ; $ea01: a5 01     
            inc $01            ; $ea03: e6 01     
            inc $01            ; $ea05: e6 01     
            inc $01            ; $ea07: e6 01     
            cmp #$26           ; $ea09: c9 26     
            bne __ea11         ; $ea0b: d0 04     
            ldx #$01           ; $ea0d: a2 01     
            stx $fe            ; $ea0f: 86 fe     
__ea11:     cmp #$50           ; $ea11: c9 50     
            bcc __ea2a         ; $ea13: 90 15     
            cmp #$90           ; $ea15: c9 90     
            bcc __ea2f         ; $ea17: 90 16     
            cmp #$c0           ; $ea19: c9 c0     
            bcc __ea2a         ; $ea1b: 90 0d     
            cmp #$d8           ; $ea1d: c9 d8     
            bcc __ea2f         ; $ea1f: 90 0e     
            jsr __ead1         ; $ea21: 20 d1 ea  
            jsr __f094         ; $ea24: 20 94 f0  
            lda #$ff           ; $ea27: a9 ff     
            rts                ; $ea29: 60        

;-------------------------------------------------------------------------------
__ea2a:     lda #$c4           ; $ea2a: a9 c4     
            sta $02            ; $ea2c: 85 02     
            rts                ; $ea2e: 60        

;-------------------------------------------------------------------------------
__ea2f:     lda #$c0           ; $ea2f: a9 c0     
            sta $02            ; $ea31: 85 02     
            rts                ; $ea33: 60        

;-------------------------------------------------------------------------------
__ea34:     lda $36            ; $ea34: a5 36     
            bne __ea5e         ; $ea36: d0 26     
            lda $19            ; $ea38: a5 19     
            and #$03           ; $ea3a: 29 03     
            tax                ; $ea3c: aa        
            lda __c1ff,x       ; $ea3d: bd ff c1  
            clc                ; $ea40: 18        
            adc #$10           ; $ea41: 69 10     
            ldx $0445          ; $ea43: ae 45 04  
            sta $0446,x        ; $ea46: 9d 46 04  
            sta $00            ; $ea49: 85 00     
            lda #$30           ; $ea4b: a9 30     
            sta $01            ; $ea4d: 85 01     
            lda #$c4           ; $ea4f: a9 c4     
            sta $02            ; $ea51: 85 02     
            jsr __eadb         ; $ea53: 20 db ea  
            jsr __eaf7         ; $ea56: 20 f7 ea  
            lda __c457,x       ; $ea59: bd 57 c4  
            sta $36            ; $ea5c: 85 36     
__ea5e:     rts                ; $ea5e: 60        

;-------------------------------------------------------------------------------
__ea5f:     lda $39            ; $ea5f: a5 39     
            beq __ea64         ; $ea61: f0 01     
            rts                ; $ea63: 60        

;-------------------------------------------------------------------------------
__ea64:     lda #$08           ; $ea64: a9 08     
            sta $0a            ; $ea66: 85 0a     
            lda #$00           ; $ea68: a9 00     
            sta $0b            ; $ea6a: 85 0b     
            jsr __eaa1         ; $ea6c: 20 a1 ea  
            bne __ea72         ; $ea6f: d0 01     
            rts                ; $ea71: 60        

;-------------------------------------------------------------------------------
__ea72:     lda #$50           ; $ea72: a9 50     
            sta $00            ; $ea74: 85 00     
            lda #$20           ; $ea76: a9 20     
            sta $01            ; $ea78: 85 01     
            lda $02f1          ; $ea7a: ad f1 02  
            cmp #$db           ; $ea7d: c9 db     
            beq __ea88         ; $ea7f: f0 07     
            inc $b7            ; $ea81: e6 b7     
            lda #$db           ; $ea83: a9 db     
            jmp __ea8a         ; $ea85: 4c 8a ea  

;-------------------------------------------------------------------------------
__ea88:     lda #$d7           ; $ea88: a9 d7     
__ea8a:     jsr __ead4         ; $ea8a: 20 d4 ea  
            lda #$f0           ; $ea8d: a9 f0     
            jsr __f080         ; $ea8f: 20 80 f0  
            lda $b7            ; $ea92: a5 b7     
            cmp #$04           ; $ea94: c9 04     
            bne __eaa0         ; $ea96: d0 08     
            lda #$00           ; $ea98: a9 00     
            sta $b7            ; $ea9a: 85 b7     
            lda #$bb           ; $ea9c: a9 bb     
            sta $39            ; $ea9e: 85 39     
__eaa0:     rts                ; $eaa0: 60        

;-------------------------------------------------------------------------------
__eaa1:     inc $b8            ; $eaa1: e6 b8     
            lda $b8            ; $eaa3: a5 b8     
            bmi __eaae         ; $eaa5: 30 07     
            cmp #$10           ; $eaa7: c9 10     
            bcs __eaae         ; $eaa9: b0 03     
            jmp __eab2         ; $eaab: 4c b2 ea  

;-------------------------------------------------------------------------------
__eaae:     lda #$00           ; $eaae: a9 00     
            sta $b8            ; $eab0: 85 b8     
__eab2:     cmp #$08           ; $eab2: c9 08     
            bcs __eabf         ; $eab4: b0 09     
            tax                ; $eab6: aa        
            lda __c1bc,x       ; $eab7: bd bc c1  
            and $0a            ; $eaba: 25 0a     
            jmp __eac8         ; $eabc: 4c c8 ea  

;-------------------------------------------------------------------------------
__eabf:     sec                ; $eabf: 38        
            sbc #$08           ; $eac0: e9 08     
            tax                ; $eac2: aa        
            lda __c1bc,x       ; $eac3: bd bc c1  
            and $0b            ; $eac6: 25 0b     
__eac8:     beq __eacc         ; $eac8: f0 02     
            lda #$01           ; $eaca: a9 01     
__eacc:     rts                ; $eacc: 60        

;-------------------------------------------------------------------------------
__eacd:     lda #$00           ; $eacd: a9 00     
            sta $04            ; $eacf: 85 04     
__ead1:     jmp __ead6         ; $ead1: 4c d6 ea  

;-------------------------------------------------------------------------------
__ead4:     sta $02            ; $ead4: 85 02     
__ead6:     lda #$22           ; $ead6: a9 22     
            sta $03            ; $ead8: 85 03     
            rts                ; $eada: 60        

;-------------------------------------------------------------------------------
__eadb:     jsr __ead1         ; $eadb: 20 d1 ea  
            jmp __f082         ; $eade: 4c 82 f0  

;-------------------------------------------------------------------------------
__eae1:     lda $0203          ; $eae1: ad 03 02  
            sta $00            ; $eae4: 85 00     
            lda $0200          ; $eae6: ad 00 02  
            sta $01            ; $eae9: 85 01     
            rts                ; $eaeb: 60        

;-------------------------------------------------------------------------------
__eaec:     lda $0203,x        ; $eaec: bd 03 02  
            sta $00            ; $eaef: 85 00     
            lda $0200,x        ; $eaf1: bd 00 02  
            sta $01            ; $eaf4: 85 01     
            rts                ; $eaf6: 60        

;-------------------------------------------------------------------------------
__eaf7:     lda $50            ; $eaf7: a5 50     
            and #$01           ; $eaf9: 29 01     
            clc                ; $eafb: 18        
            adc $54            ; $eafc: 65 54     
            tax                ; $eafe: aa        
            cpx #$04           ; $eaff: e0 04     
            bcc __eb05         ; $eb01: 90 02     
            ldx #$04           ; $eb03: a2 04     
__eb05:     rts                ; $eb05: 60        

;-------------------------------------------------------------------------------
__eb06:     lda $0503          ; $eb06: ad 03 05  
            bne __eb0c         ; $eb09: d0 01     
            rts                ; $eb0b: 60        

;-------------------------------------------------------------------------------
__eb0c:     lda $0505          ; $eb0c: ad 05 05  
            and #$0f           ; $eb0f: 29 0f     
            sta $0505          ; $eb11: 8d 05 05  
            lda $53            ; $eb14: a5 53     
            tax                ; $eb16: aa        
            tay                ; $eb17: a8        
            dex                ; $eb18: ca        
            lda __c608,x       ; $eb19: bd 08 c6  
            sta $00            ; $eb1c: 85 00     
            lda #$20           ; $eb1e: a9 20     
            sta $01            ; $eb20: 85 01     
            tya                ; $eb22: 98        
            cmp #$02           ; $eb23: c9 02     
            bmi __eb54         ; $eb25: 30 2d     
            lda $44            ; $eb27: a5 44     
            beq __eb4f         ; $eb29: f0 24     
__eb2b:     cmp #$13           ; $eb2b: c9 13     
            bne __eb32         ; $eb2d: d0 03     
            jmp __eb85         ; $eb2f: 4c 85 eb  

;-------------------------------------------------------------------------------
__eb32:     cmp #$0f           ; $eb32: c9 0f     
            bne __eb39         ; $eb34: d0 03     
            jmp __eb8e         ; $eb36: 4c 8e eb  

;-------------------------------------------------------------------------------
__eb39:     cmp #$0b           ; $eb39: c9 0b     
            bne __eb40         ; $eb3b: d0 03     
            jmp __eb85         ; $eb3d: 4c 85 eb  

;-------------------------------------------------------------------------------
__eb40:     cmp #$08           ; $eb40: c9 08     
            bne __eb47         ; $eb42: d0 03     
            jmp __eb8e         ; $eb44: 4c 8e eb  

;-------------------------------------------------------------------------------
__eb47:     cmp #$04           ; $eb47: c9 04     
            bne __eb4e         ; $eb49: d0 03     
            jsr __eba6         ; $eb4b: 20 a6 eb  
__eb4e:     rts                ; $eb4e: 60        

;-------------------------------------------------------------------------------
__eb4f:     lda #$25           ; $eb4f: a9 25     
            sta $44            ; $eb51: 85 44     
            rts                ; $eb53: 60        

;-------------------------------------------------------------------------------
__eb54:     lda $36            ; $eb54: a5 36     
            cmp #$18           ; $eb56: c9 18     
            beq __eb74         ; $eb58: f0 1a     
            cmp #$00           ; $eb5a: c9 00     
            beq __eb7b         ; $eb5c: f0 1d     
            lda $0515          ; $eb5e: ad 15 05  
            beq __eb6f         ; $eb61: f0 0c     
            jsr __eba1         ; $eb63: 20 a1 eb  
            lda #$00           ; $eb66: a9 00     
            sta $0515          ; $eb68: 8d 15 05  
            lda #$1a           ; $eb6b: a9 1a     
            sta $44            ; $eb6d: 85 44     
__eb6f:     lda $44            ; $eb6f: a5 44     
            jmp __eb2b         ; $eb71: 4c 2b eb  

;-------------------------------------------------------------------------------
__eb74:     lda #$30           ; $eb74: a9 30     
            sta $44            ; $eb76: 85 44     
            jmp __eb9c         ; $eb78: 4c 9c eb  

;-------------------------------------------------------------------------------
__eb7b:     lda #$1a           ; $eb7b: a9 1a     
            sta $44            ; $eb7d: 85 44     
            jsr __eb97         ; $eb7f: 20 97 eb  
            jmp __eb2b         ; $eb82: 4c 2b eb  

;-------------------------------------------------------------------------------
__eb85:     lda #$80           ; $eb85: a9 80     
            sta $fe            ; $eb87: 85 fe     
__eb89:     lda #$40           ; $eb89: a9 40     
            jmp __eba8         ; $eb8b: 4c a8 eb  

;-------------------------------------------------------------------------------
__eb8e:     lda #$80           ; $eb8e: a9 80     
            sta $fe            ; $eb90: 85 fe     
__eb92:     lda #$42           ; $eb92: a9 42     
            jmp __eba8         ; $eb94: 4c a8 eb  

;-------------------------------------------------------------------------------
__eb97:     lda #$44           ; $eb97: a9 44     
            jmp __eba8         ; $eb99: 4c a8 eb  

;-------------------------------------------------------------------------------
__eb9c:     lda #$3e           ; $eb9c: a9 3e     
            jmp __eba8         ; $eb9e: 4c a8 eb  

;-------------------------------------------------------------------------------
__eba1:     lda #$00           ; $eba1: a9 00     
            jmp __eba8         ; $eba3: 4c a8 eb  

;-------------------------------------------------------------------------------
__eba6:     lda #$02           ; $eba6: a9 02     
__eba8:     jsr __c815         ; $eba8: 20 15 c8  
            dec $44            ; $ebab: c6 44     
            lda $0505          ; $ebad: ad 05 05  
            ora #$10           ; $ebb0: 09 10     
            sta $0505          ; $ebb2: 8d 05 05  
            rts                ; $ebb5: 60        

;-------------------------------------------------------------------------------
__ebb6:     lda $45            ; $ebb6: a5 45     
            beq __ebbb         ; $ebb8: f0 01     
            rts                ; $ebba: 60        

;-------------------------------------------------------------------------------
__ebbb:     lda $2e            ; $ebbb: a5 2e     
            bne __ebc4         ; $ebbd: d0 05     
            lda #$ff           ; $ebbf: a9 ff     
            sta $96            ; $ebc1: 85 96     
            rts                ; $ebc3: 60        

;-------------------------------------------------------------------------------
__ebc4:     lda #$0b           ; $ebc4: a9 0b     
            sta $45            ; $ebc6: 85 45     
            lda #$01           ; $ebc8: a9 01     
            sta $00            ; $ebca: 85 00     
            lda #$0a           ; $ebcc: a9 0a     
            sta $01            ; $ebce: 85 01     
            jsr __f33e         ; $ebd0: 20 3e f3  
            lda #$02           ; $ebd3: a9 02     
            sta $00            ; $ebd5: 85 00     
            jmp __f23c         ; $ebd7: 4c 3c f2  

;-------------------------------------------------------------------------------
__ebda:     lda $050b          ; $ebda: ad 0b 05  
            bne __ebed         ; $ebdd: d0 0e     
            lda #$01           ; $ebdf: a9 01     
            sta $050b          ; $ebe1: 8d 0b 05  
            lda #$00           ; $ebe4: a9 00     
            sta $050e          ; $ebe6: 8d 0e 05  
            sta $050c          ; $ebe9: 8d 0c 05  
            rts                ; $ebec: 60        

;-------------------------------------------------------------------------------
__ebed:     lda $050c          ; $ebed: ad 0c 05  
            beq __ec16         ; $ebf0: f0 24     
            lda $050d          ; $ebf2: ad 0d 05  
            cmp #$05           ; $ebf5: c9 05     
            bne __ec0a         ; $ebf7: d0 11     
            lda $96            ; $ebf9: a5 96     
            cmp #$0a           ; $ebfb: c9 0a     
            bne __ec03         ; $ebfd: d0 04     
            lda #$00           ; $ebff: a9 00     
            beq __ec0a         ; $ec01: f0 07     
__ec03:     lda #$04           ; $ec03: a9 04     
            sta $96            ; $ec05: 85 96     
            jmp __ec12         ; $ec07: 4c 12 ec  

;-------------------------------------------------------------------------------
__ec0a:     sta $56            ; $ec0a: 85 56     
            and #$03           ; $ec0c: 29 03     
            beq __ec12         ; $ec0e: f0 02     
            sta $57            ; $ec10: 85 57     
__ec12:     dec $050c          ; $ec12: ce 0c 05  
            rts                ; $ec15: 60        

;-------------------------------------------------------------------------------
__ec16:     ldx $050e          ; $ec16: ae 0e 05  
            lda __c028,x       ; $ec19: bd 28 c0  
            sta $050c          ; $ec1c: 8d 0c 05  
            lda __c014,x       ; $ec1f: bd 14 c0  
            sta $050d          ; $ec22: 8d 0d 05  
            inc $050e          ; $ec25: ee 0e 05  
            rts                ; $ec28: 60        

;-------------------------------------------------------------------------------
__ec29:     jsr __eae1         ; $ec29: 20 e1 ea  
            lda #$4c           ; $ec2c: a9 4c     
            jsr __efe8         ; $ec2e: 20 e8 ef  
            lda $53            ; $ec31: a5 53     
            cmp #$03           ; $ec33: c9 03     
            beq __ec3b         ; $ec35: f0 04     
            cmp #$01           ; $ec37: c9 01     
            bne __ec3e         ; $ec39: d0 03     
__ec3b:     jsr __ec44         ; $ec3b: 20 44 ec  
__ec3e:     jsr __ed8a         ; $ec3e: 20 8a ed  
            jmp __edc5         ; $ec41: 4c c5 ed  

;-------------------------------------------------------------------------------
__ec44:     lda #$00           ; $ec44: a9 00     
            sta $5d            ; $ec46: 85 5d     
__ec48:     lda #$3a           ; $ec48: a9 3a     
            jsr __c847         ; $ec4a: 20 47 c8  
            jsr __efd5         ; $ec4d: 20 d5 ef  
            lda $53            ; $ec50: a5 53     
            cmp #$01           ; $ec52: c9 01     
            beq __ec5b         ; $ec54: f0 05     
            txa                ; $ec56: 8a        
            clc                ; $ec57: 18        
            adc #$30           ; $ec58: 69 30     
            tax                ; $ec5a: aa        
__ec5b:     jsr __eaec         ; $ec5b: 20 ec ea  
            jsr __efef         ; $ec5e: 20 ef ef  
            bne __eca7         ; $ec61: d0 44     
            lda $96            ; $ec63: a5 96     
            cmp #$04           ; $ec65: c9 04     
            bne __ec97         ; $ec67: d0 2e     
            lda $56            ; $ec69: a5 56     
            and #$03           ; $ec6b: 29 03     
            bne __ec76         ; $ec6d: d0 07     
            lda $9c            ; $ec6f: a5 9c     
            beq __ec80         ; $ec71: f0 0d     
            jmp __ec97         ; $ec73: 4c 97 ec  

;-------------------------------------------------------------------------------
__ec76:     lda $9c            ; $ec76: a5 9c     
            cmp #$03           ; $ec78: c9 03     
            bcs __ec97         ; $ec7a: b0 1b     
            lda $9e            ; $ec7c: a5 9e     
            bne __ec97         ; $ec7e: d0 17     
__ec80:     lda $9d            ; $ec80: a5 9d     
            cmp #$18           ; $ec82: c9 18     
            bcs __ec97         ; $ec84: b0 11     
            lda $00            ; $ec86: a5 00     
            sta $05            ; $ec88: 85 05     
            lda $01            ; $ec8a: a5 01     
            sta $06            ; $ec8c: 85 06     
            ldx #$00           ; $ec8e: a2 00     
            jsr __cfc6         ; $ec90: 20 c6 cf  
            lda #$20           ; $ec93: a9 20     
            sta $fd            ; $ec95: 85 fd     
__ec97:     inc $5d            ; $ec97: e6 5d     
            lda $53            ; $ec99: a5 53     
            lsr                ; $ec9b: 4a        
            tax                ; $ec9c: aa        
            lda $5d            ; $ec9d: a5 5d     
            cmp __c1fd,x       ; $ec9f: dd fd c1  
            beq __ecaf         ; $eca2: f0 0b     
            jmp __ec48         ; $eca4: 4c 48 ec  

;-------------------------------------------------------------------------------
__eca7:     jsr __ef51         ; $eca7: 20 51 ef  
            lda #$ff           ; $ecaa: a9 ff     
            sta $96            ; $ecac: 85 96     
            rts                ; $ecae: 60        

;-------------------------------------------------------------------------------
__ecaf:     lda $53            ; $ecaf: a5 53     
            cmp #$03           ; $ecb1: c9 03     
            beq __ecbe         ; $ecb3: f0 09     
            lda $96            ; $ecb5: a5 96     
            cmp #$0a           ; $ecb7: c9 0a     
            bne __ecbe         ; $ecb9: d0 03     
            jmp __ecbf         ; $ecbb: 4c bf ec  

;-------------------------------------------------------------------------------
__ecbe:     rts                ; $ecbe: 60        

;-------------------------------------------------------------------------------
__ecbf:     lda $a0            ; $ecbf: a5 a0     
            bne __ecc6         ; $ecc1: d0 03     
            jmp __ed87         ; $ecc3: 4c 87 ed  

;-------------------------------------------------------------------------------
__ecc6:     lda $9f            ; $ecc6: a5 9f     
            lsr                ; $ecc8: 4a        
            lsr                ; $ecc9: 4a        
            beq __ecd1         ; $ecca: f0 05     
            lda #$00           ; $eccc: a9 00     
            jmp __ecd3         ; $ecce: 4c d3 ec  

;-------------------------------------------------------------------------------
__ecd1:     lda #$01           ; $ecd1: a9 01     
__ecd3:     beq __ece8         ; $ecd3: f0 13     
            lda #$04           ; $ecd5: a9 04     
            clc                ; $ecd7: 18        
            adc $0203          ; $ecd8: 6d 03 02  
            sta $00            ; $ecdb: 85 00     
            lda $0200          ; $ecdd: ad 00 02  
            sec                ; $ece0: 38        
            sbc #$10           ; $ece1: e9 10     
            sta $01            ; $ece3: 85 01     
            jmp __ed07         ; $ece5: 4c 07 ed  

;-------------------------------------------------------------------------------
__ece8:     lda $57            ; $ece8: a5 57     
            cmp #$01           ; $ecea: c9 01     
            beq __ecf7         ; $ecec: f0 09     
            lda $0203          ; $ecee: ad 03 02  
            sec                ; $ecf1: 38        
            sbc #$10           ; $ecf2: e9 10     
            jmp __ecfd         ; $ecf4: 4c fd ec  

;-------------------------------------------------------------------------------
__ecf7:     lda $0203          ; $ecf7: ad 03 02  
            clc                ; $ecfa: 18        
            adc #$10           ; $ecfb: 69 10     
__ecfd:     sta $00            ; $ecfd: 85 00     
            lda $0200          ; $ecff: ad 00 02  
            clc                ; $ed02: 18        
            adc #$06           ; $ed03: 69 06     
            sta $01            ; $ed05: 85 01     
__ed07:     lda #$3c           ; $ed07: a9 3c     
            jsr __efe8         ; $ed09: 20 e8 ef  
            lda $53            ; $ed0c: a5 53     
            cmp #$01           ; $ed0e: c9 01     
            bne __ed34         ; $ed10: d0 22     
            lda #$00           ; $ed12: a9 00     
            sta $5d            ; $ed14: 85 5d     
__ed16:     jsr __efd5         ; $ed16: 20 d5 ef  
            jsr __eaec         ; $ed19: 20 ec ea  
            lda #$3a           ; $ed1c: a9 3a     
            jsr __c847         ; $ed1e: 20 47 c8  
            jsr __efef         ; $ed21: 20 ef ef  
            bne __ed57         ; $ed24: d0 31     
            lda $5d            ; $ed26: a5 5d     
            clc                ; $ed28: 18        
            adc #$01           ; $ed29: 69 01     
            sta $5d            ; $ed2b: 85 5d     
            cmp #$09           ; $ed2d: c9 09     
            beq __ed85         ; $ed2f: f0 54     
            jmp __ed16         ; $ed31: 4c 16 ed  

;-------------------------------------------------------------------------------
__ed34:     lda #$00           ; $ed34: a9 00     
            sta $ae            ; $ed36: 85 ae     
__ed38:     jsr __efdd         ; $ed38: 20 dd ef  
            jsr __eaec         ; $ed3b: 20 ec ea  
            lda #$3a           ; $ed3e: a9 3a     
            jsr __c847         ; $ed40: 20 47 c8  
            jsr __efef         ; $ed43: 20 ef ef  
            bne __ed57         ; $ed46: d0 0f     
            inc $ae            ; $ed48: e6 ae     
            lda $ae            ; $ed4a: a5 ae     
            ldx $53            ; $ed4c: a6 53     
            dex                ; $ed4e: ca        
            cmp __c1f6,x       ; $ed4f: dd f6 c1  
            beq __ed85         ; $ed52: f0 31     
            jmp __ed38         ; $ed54: 4c 38 ed  

;-------------------------------------------------------------------------------
__ed57:     lda #$02           ; $ed57: a9 02     
            sta $ff            ; $ed59: 85 ff     
            lda $00            ; $ed5b: a5 00     
            sta $05            ; $ed5d: 85 05     
            lda $01            ; $ed5f: a5 01     
            sta $06            ; $ed61: 85 06     
            lda $53            ; $ed63: a5 53     
            cmp #$01           ; $ed65: c9 01     
            bne __ed74         ; $ed67: d0 0b     
            lda #$00           ; $ed69: a9 00     
            ldx $5d            ; $ed6b: a6 5d     
            sta $68,x          ; $ed6d: 95 68     
            lda #$01           ; $ed6f: a9 01     
            jmp __ed87         ; $ed71: 4c 87 ed  

;-------------------------------------------------------------------------------
__ed74:     lda #$10           ; $ed74: a9 10     
            sta $40            ; $ed76: 85 40     
            lda #$00           ; $ed78: a9 00     
            ldx $ae            ; $ed7a: a6 ae     
            sta $e0,x          ; $ed7c: 95 e0     
            sta $db,x          ; $ed7e: 95 db     
            lda #$01           ; $ed80: a9 01     
            jmp __ed87         ; $ed82: 4c 87 ed  

;-------------------------------------------------------------------------------
__ed85:     lda #$00           ; $ed85: a9 00     
__ed87:     sta $bf            ; $ed87: 85 bf     
            rts                ; $ed89: 60        

;-------------------------------------------------------------------------------
__ed8a:     lda #$00           ; $ed8a: a9 00     
            sta $ae            ; $ed8c: 85 ae     
            lda #$3a           ; $ed8e: a9 3a     
            jsr __c847         ; $ed90: 20 47 c8  
__ed93:     jsr __efdd         ; $ed93: 20 dd ef  
            jsr __eaec         ; $ed96: 20 ec ea  
            jsr __efef         ; $ed99: 20 ef ef  
            bne __edad         ; $ed9c: d0 0f     
            inc $ae            ; $ed9e: e6 ae     
            lda $ae            ; $eda0: a5 ae     
            ldx $53            ; $eda2: a6 53     
            dex                ; $eda4: ca        
            cmp __c1f6,x       ; $eda5: dd f6 c1  
            beq __edb5         ; $eda8: f0 0b     
            jmp __ed93         ; $edaa: 4c 93 ed  

;-------------------------------------------------------------------------------
__edad:     jsr __ef51         ; $edad: 20 51 ef  
            lda #$ff           ; $edb0: a9 ff     
            sta $96            ; $edb2: 85 96     
            rts                ; $edb4: 60        

;-------------------------------------------------------------------------------
__edb5:     lda $96            ; $edb5: a5 96     
            cmp #$0a           ; $edb7: c9 0a     
            bne __edc4         ; $edb9: d0 09     
            lda $53            ; $edbb: a5 53     
            cmp #$01           ; $edbd: c9 01     
            beq __edc4         ; $edbf: f0 03     
            jsr __ecbf         ; $edc1: 20 bf ec  
__edc4:     rts                ; $edc4: 60        

;-------------------------------------------------------------------------------
__edc5:     lda $53            ; $edc5: a5 53     
            cmp #$03           ; $edc7: c9 03     
            bne __edd2         ; $edc9: d0 07     
            ldy $96            ; $edcb: a4 96     
            cpy #$01           ; $edcd: c0 01     
            beq __edd2         ; $edcf: f0 01     
            rts                ; $edd1: 60        

;-------------------------------------------------------------------------------
__edd2:     sec                ; $edd2: 38        
            sbc #$01           ; $edd3: e9 01     
            asl                ; $edd5: 0a        
            tax                ; $edd6: aa        
            lda __c42b,x       ; $edd7: bd 2b c4  
            sta $02            ; $edda: 85 02     
            lda __c42c,x       ; $eddc: bd 2c c4  
            sta $03            ; $eddf: 85 03     
            lda __c423,x       ; $ede1: bd 23 c4  
            sta $00            ; $ede4: 85 00     
            lda __c424,x       ; $ede6: bd 24 c4  
            sta $01            ; $ede9: 85 01     
__edeb:     jsr __efef         ; $edeb: 20 ef ef  
            bne __ee07         ; $edee: d0 17     
            lda $53            ; $edf0: a5 53     
            cmp #$03           ; $edf2: c9 03     
            bne __ee0b         ; $edf4: d0 15     
            lda $01            ; $edf6: a5 01     
            cmp #$c9           ; $edf8: c9 c9     
            beq __ee0b         ; $edfa: f0 0f     
            lda #$70           ; $edfc: a9 70     
            sta $00            ; $edfe: 85 00     
__ee00:     lda #$c9           ; $ee00: a9 c9     
            sta $01            ; $ee02: 85 01     
            jmp __edeb         ; $ee04: 4c eb ed  

;-------------------------------------------------------------------------------
__ee07:     lda #$ff           ; $ee07: a9 ff     
            sta $96            ; $ee09: 85 96     
__ee0b:     rts                ; $ee0b: 60        

;-------------------------------------------------------------------------------
__ee0c:     lda #$80           ; $ee0c: a9 80     
            sta $0a            ; $ee0e: 85 0a     
            lda #$80           ; $ee10: a9 80     
            sta $0b            ; $ee12: 85 0b     
            jsr __dfe4         ; $ee14: 20 e4 df  
            bne __ee1a         ; $ee17: d0 01     
            rts                ; $ee19: 60        

;-------------------------------------------------------------------------------
__ee1a:     lda $53            ; $ee1a: a5 53     
            cmp #$01           ; $ee1c: c9 01     
            bne __ee26         ; $ee1e: d0 06     
            jsr __efd5         ; $ee20: 20 d5 ef  
            jmp __ee29         ; $ee23: 4c 29 ee  

;-------------------------------------------------------------------------------
__ee26:     jsr __efdd         ; $ee26: 20 dd ef  
__ee29:     stx $04            ; $ee29: 86 04     
            jsr __eaec         ; $ee2b: 20 ec ea  
            lda $bf            ; $ee2e: a5 bf     
            cmp #$01           ; $ee30: c9 01     
            bne __ee38         ; $ee32: d0 04     
            ldy #$02           ; $ee34: a0 02     
            sty $ff            ; $ee36: 84 ff     
__ee38:     cmp #$0b           ; $ee38: c9 0b     
            beq __ee51         ; $ee3a: f0 15     
            ldx $bf            ; $ee3c: a6 bf     
            dex                ; $ee3e: ca        
            lda __c1ec,x       ; $ee3f: bd ec c1  
            sta $02            ; $ee42: 85 02     
            jsr __eadb         ; $ee44: 20 db ea  
            ldx $04            ; $ee47: a6 04     
            lda #$02           ; $ee49: a9 02     
            jsr __ee6c         ; $ee4b: 20 6c ee  
            inc $bf            ; $ee4e: e6 bf     
            rts                ; $ee50: 60        

;-------------------------------------------------------------------------------
__ee51:     lda $53            ; $ee51: a5 53     
            cmp #$01           ; $ee53: c9 01     
            bne __ee5c         ; $ee55: d0 05     
            lda #$03           ; $ee57: a9 03     
            jsr __ee6c         ; $ee59: 20 6c ee  
__ee5c:     jsr __ead1         ; $ee5c: 20 d1 ea  
            jsr __f094         ; $ee5f: 20 94 f0  
            ldx #$02           ; $ee62: a2 02     
            jsr __cfc6         ; $ee64: 20 c6 cf  
            lda #$00           ; $ee67: a9 00     
            sta $bf            ; $ee69: 85 bf     
            rts                ; $ee6b: 60        

;-------------------------------------------------------------------------------
__ee6c:     sta $0202,x        ; $ee6c: 9d 02 02  
            sta $0206,x        ; $ee6f: 9d 06 02  
            sta $020a,x        ; $ee72: 9d 0a 02  
            sta $020e,x        ; $ee75: 9d 0e 02  
            rts                ; $ee78: 60        

;-------------------------------------------------------------------------------
__ee79:     ldy $53            ; $ee79: a4 53     
            cpy #$01           ; $ee7b: c0 01     
            bne __ee80         ; $ee7d: d0 01     
            rts                ; $ee7f: 60        

;-------------------------------------------------------------------------------
__ee80:     lda $be            ; $ee80: a5 be     
            beq __eed8         ; $ee82: f0 54     
            cpy #$04           ; $ee84: c0 04     
            bne __eef0         ; $ee86: d0 68     
            ldy #$00           ; $ee88: a0 00     
            ldx __c5ff         ; $ee8a: ae ff c5  
__ee8d:     lda __c5c2,x       ; $ee8d: bd c2 c5  
            cmp $0203          ; $ee90: cd 03 02  
            bne __eee7         ; $ee93: d0 52     
            lda __c5ae,x       ; $ee95: bd ae c5  
            cmp $0200          ; $ee98: cd 00 02  
            bcc __eee7         ; $ee9b: 90 4a     
            sec                ; $ee9d: 38        
            sbc #$11           ; $ee9e: e9 11     
            cmp $0200          ; $eea0: cd 00 02  
            bcs __eee7         ; $eea3: b0 42     
            lda $00c1,y        ; $eea5: b9 c1 00  
            cmp #$00           ; $eea8: c9 00     
            bne __eed9         ; $eeaa: d0 2d     
            lda $96            ; $eeac: a5 96     
            cmp #$08           ; $eeae: c9 08     
            beq __eed8         ; $eeb0: f0 26     
            cmp #$ff           ; $eeb2: c9 ff     
            beq __eed8         ; $eeb4: f0 22     
            lda #$11           ; $eeb6: a9 11     
            sta $cc            ; $eeb8: 85 cc     
            lda #$01           ; $eeba: a9 01     
            sta $00c1,y        ; $eebc: 99 c1 00  
            jsr __ef38         ; $eebf: 20 38 ef  
            lda $0200          ; $eec2: ad 00 02  
            clc                ; $eec5: 18        
            adc #$10           ; $eec6: 69 10     
            sta $06            ; $eec8: 85 06     
            lda $0203          ; $eeca: ad 03 02  
            sta $05            ; $eecd: 85 05     
            ldx #$00           ; $eecf: a2 00     
            jsr __cfc6         ; $eed1: 20 c6 cf  
            lda #$20           ; $eed4: a9 20     
            sta $fd            ; $eed6: 85 fd     
__eed8:     rts                ; $eed8: 60        

;-------------------------------------------------------------------------------
__eed9:     lda $96            ; $eed9: a5 96     
            cmp #$04           ; $eedb: c9 04     
            beq __eee6         ; $eedd: f0 07     
            jsr __ef51         ; $eedf: 20 51 ef  
            lda #$08           ; $eee2: a9 08     
            sta $96            ; $eee4: 85 96     
__eee6:     rts                ; $eee6: 60        

;-------------------------------------------------------------------------------
__eee7:     cpy #$07           ; $eee7: c0 07     
            beq __eef0         ; $eee9: f0 05     
            inx                ; $eeeb: e8        
            iny                ; $eeec: c8        
            jmp __ee8d         ; $eeed: 4c 8d ee  

;-------------------------------------------------------------------------------
__eef0:     ldy $53            ; $eef0: a4 53     
            ldx __c5fa,y       ; $eef2: be fa c5  
            ldy #$00           ; $eef5: a0 00     
__eef7:     lda __c5ae,x       ; $eef7: bd ae c5  
            cmp $0200          ; $eefa: cd 00 02  
            bne __ef2f         ; $eefd: d0 30     
            lda __c5c2,x       ; $eeff: bd c2 c5  
            cmp $0203          ; $ef02: cd 03 02  
            bne __ef2f         ; $ef05: d0 28     
            lda $00c9,y        ; $ef07: b9 c9 00  
            bne __ef2f         ; $ef0a: d0 23     
            lda #$22           ; $ef0c: a9 22     
            sta $cc            ; $ef0e: 85 cc     
            lda #$01           ; $ef10: a9 01     
            sta $00c9,y        ; $ef12: 99 c9 00  
            jsr __ef38         ; $ef15: 20 38 ef  
            lda $0200          ; $ef18: ad 00 02  
            sec                ; $ef1b: 38        
            sbc #$08           ; $ef1c: e9 08     
            sta $06            ; $ef1e: 85 06     
            lda $0203          ; $ef20: ad 03 02  
            sta $05            ; $ef23: 85 05     
            ldx #$03           ; $ef25: a2 03     
            jsr __cfc6         ; $ef27: 20 c6 cf  
            lda #$20           ; $ef2a: a9 20     
            sta $fd            ; $ef2c: 85 fd     
__ef2e:     rts                ; $ef2e: 60        

;-------------------------------------------------------------------------------
__ef2f:     cpy #$02           ; $ef2f: c0 02     
            beq __ef2e         ; $ef31: f0 fb     
            inx                ; $ef33: e8        
            iny                ; $ef34: c8        
            jmp __eef7         ; $ef35: 4c f7 ee  

;-------------------------------------------------------------------------------
__ef38:     lda #$24           ; $ef38: a9 24     
            sta $cd            ; $ef3a: 85 cd     
            sta $ce            ; $ef3c: 85 ce     
            sta $cf            ; $ef3e: 85 cf     
            sta $d0            ; $ef40: 85 d0     
            lda __c5d6,x       ; $ef42: bd d6 c5  
            sta $01            ; $ef45: 85 01     
            lda __c5e9,x       ; $ef47: bd e9 c5  
            sta $00            ; $ef4a: 85 00     
            lda #$48           ; $ef4c: a9 48     
            jmp __c815         ; $ef4e: 4c 15 c8  

;-------------------------------------------------------------------------------
__ef51:     lda $96            ; $ef51: a5 96     
            cmp #$0a           ; $ef53: c9 0a     
            bne __ef71         ; $ef55: d0 1a     
            lda $a0            ; $ef57: a5 a0     
            beq __ef71         ; $ef59: f0 16     
            sec                ; $ef5b: 38        
            sbc #$01           ; $ef5c: e9 01     
            tax                ; $ef5e: aa        
            lda #$00           ; $ef5f: a9 00     
            sta $0451,x        ; $ef61: 9d 51 04  
            txa                ; $ef64: 8a        
            asl                ; $ef65: 0a        
            asl                ; $ef66: 0a        
            asl                ; $ef67: 0a        
            tax                ; $ef68: aa        
            lda #$ff           ; $ef69: a9 ff     
            sta $02d0,x        ; $ef6b: 9d d0 02  
            sta $02d4,x        ; $ef6e: 9d d4 02  
__ef71:     rts                ; $ef71: 60        

;-------------------------------------------------------------------------------
__ef72:     stx $0f            ; $ef72: 86 0f     
            asl                ; $ef74: 0a        
            tax                ; $ef75: aa        
            lda $042c,x        ; $ef76: bd 2c 04  
            bne __ef94         ; $ef79: d0 19     
            sta $0436,x        ; $ef7b: 9d 36 04  
            cpx #$00           ; $ef7e: e0 00     
            bne __ef87         ; $ef80: d0 05     
            lda #$08           ; $ef82: a9 08     
            jmp __ef89         ; $ef84: 4c 89 ef  

;-------------------------------------------------------------------------------
__ef87:     lda #$80           ; $ef87: a9 80     
__ef89:     sta $0435,x        ; $ef89: 9d 35 04  
            lda #$f0           ; $ef8c: a9 f0     
            sta $042d,x        ; $ef8e: 9d 2d 04  
            jmp __efad         ; $ef91: 4c ad ef  

;-------------------------------------------------------------------------------
__ef94:     lda $0435,x        ; $ef94: bd 35 04  
            cpx #$00           ; $ef97: e0 00     
            bne __efa0         ; $ef99: d0 05     
            adc #$10           ; $ef9b: 69 10     
            jmp __efa2         ; $ef9d: 4c a2 ef  

;-------------------------------------------------------------------------------
__efa0:     adc #$30           ; $efa0: 69 30     
__efa2:     sta $0435,x        ; $efa2: 9d 35 04  
            lda $0436,x        ; $efa5: bd 36 04  
            adc #$00           ; $efa8: 69 00     
            sta $0436,x        ; $efaa: 9d 36 04  
__efad:     lda $042d,x        ; $efad: bd 2d 04  
            sec                ; $efb0: 38        
            sbc $043d,x        ; $efb1: fd 3d 04  
            sta $042d,x        ; $efb4: 9d 2d 04  
            lda $01            ; $efb7: a5 01     
            sbc $043e,x        ; $efb9: fd 3e 04  
            sta $01            ; $efbc: 85 01     
            clc                ; $efbe: 18        
            lda $042d,x        ; $efbf: bd 2d 04  
            adc $0435,x        ; $efc2: 7d 35 04  
            sta $042d,x        ; $efc5: 9d 2d 04  
            lda $01            ; $efc8: a5 01     
            adc $0436,x        ; $efca: 7d 36 04  
            sta $01            ; $efcd: 85 01     
            inc $042c,x        ; $efcf: fe 2c 04  
            ldx $0f            ; $efd2: a6 0f     
            rts                ; $efd4: 60        

;-------------------------------------------------------------------------------
__efd5:     lda $5d            ; $efd5: a5 5d     
__efd7:     clc                ; $efd7: 18        
            adc #$03           ; $efd8: 69 03     
            jmp __efe2         ; $efda: 4c e2 ef  

;-------------------------------------------------------------------------------
__efdd:     lda $ae            ; $efdd: a5 ae     
            clc                ; $efdf: 18        
            adc #$01           ; $efe0: 69 01     
__efe2:     asl                ; $efe2: 0a        
            asl                ; $efe3: 0a        
            asl                ; $efe4: 0a        
            asl                ; $efe5: 0a        
            tax                ; $efe6: aa        
            rts                ; $efe7: 60        

;-------------------------------------------------------------------------------
__efe8:     jsr __c847         ; $efe8: 20 47 c8  
__efeb:     lda #$00           ; $efeb: a9 00     
            .hex f0            ; $efed: f0        Suspected data
__efee:     .hex 06            ; $efee: 06        Suspected data
__efef:     lda #$01           ; $efef: a9 01     
            bne __eff5         ; $eff1: d0 02     
__eff3:     lda #$02           ; $eff3: a9 02     
__eff5:     sta $0c            ; $eff5: 85 0c     
            txa                ; $eff7: 8a        
            pha                ; $eff8: 48        
            tya                ; $eff9: 98        
            pha                ; $effa: 48        
            ldy #$00           ; $effb: a0 00     
            lda $0c            ; $effd: a5 0c     
            bne __f018         ; $efff: d0 17     
            jsr __f063         ; $f001: 20 63 f0  
            sta $46            ; $f004: 85 46     
            jsr __f069         ; $f006: 20 69 f0  
            sta $47            ; $f009: 85 47     
            jsr __f062         ; $f00b: 20 62 f0  
            sta $48            ; $f00e: 85 48     
            jsr __f069         ; $f010: 20 69 f0  
            sta $49            ; $f013: 85 49     
            jmp __f059         ; $f015: 4c 59 f0  

;-------------------------------------------------------------------------------
__f018:     jsr __f063         ; $f018: 20 63 f0  
            sta $4a            ; $f01b: 85 4a     
            jsr __f069         ; $f01d: 20 69 f0  
            sta $4b            ; $f020: 85 4b     
            jsr __f062         ; $f022: 20 62 f0  
            sta $4c            ; $f025: 85 4c     
            jsr __f069         ; $f027: 20 69 f0  
            sta $4d            ; $f02a: 85 4d     
            lda $4a            ; $f02c: a5 4a     
            sec                ; $f02e: 38        
            sbc $46            ; $f02f: e5 46     
            sta $9c            ; $f031: 85 9c     
            lda $4b            ; $f033: a5 4b     
            sec                ; $f035: 38        
            sbc $47            ; $f036: e5 47     
            sta $9d            ; $f038: 85 9d     
            lda $49            ; $f03a: a5 49     
            cmp $4b            ; $f03c: c5 4b     
            bcc __f057         ; $f03e: 90 17     
            lda $4d            ; $f040: a5 4d     
            cmp $47            ; $f042: c5 47     
            bcc __f057         ; $f044: 90 11     
            lda $4c            ; $f046: a5 4c     
            cmp $46            ; $f048: c5 46     
            bcc __f057         ; $f04a: 90 0b     
            lda $48            ; $f04c: a5 48     
            cmp $4a            ; $f04e: c5 4a     
            bcc __f057         ; $f050: 90 05     
            lda #$01           ; $f052: a9 01     
            jmp __f059         ; $f054: 4c 59 f0  

;-------------------------------------------------------------------------------
__f057:     lda #$00           ; $f057: a9 00     
__f059:     sta $0c            ; $f059: 85 0c     
            pla                ; $f05b: 68        
            tay                ; $f05c: a8        
            pla                ; $f05d: 68        
            tax                ; $f05e: aa        
            lda $0c            ; $f05f: a5 0c     
            rts                ; $f061: 60        

;-------------------------------------------------------------------------------
__f062:     iny                ; $f062: c8        
__f063:     lda ($02),y        ; $f063: b1 02     
            clc                ; $f065: 18        
            adc $00            ; $f066: 65 00     
            rts                ; $f068: 60        

;-------------------------------------------------------------------------------
__f069:     iny                ; $f069: c8        
            lda ($02),y        ; $f06a: b1 02     
            clc                ; $f06c: 18        
            adc $01            ; $f06d: 65 01     
            rts                ; $f06f: 60        

;-------------------------------------------------------------------------------
__f070:     sta $02            ; $f070: 85 02     
            jsr __eae1         ; $f072: 20 e1 ea  
__f075:     jsr __eacd         ; $f075: 20 cd ea  
__f078:     lda $57            ; $f078: a5 57     
            and #$03           ; $f07a: 29 03     
            lsr                ; $f07c: 4a        
            jmp __f096         ; $f07d: 4c 96 f0  

;-------------------------------------------------------------------------------
__f080:     sta $04            ; $f080: 85 04     
__f082:     lda #$00           ; $f082: a9 00     
            beq __f096         ; $f084: f0 10     
__f086:     sta $04            ; $f086: 85 04     
__f088:     lda #$01           ; $f088: a9 01     
            bne __f096         ; $f08a: d0 0a     
__f08c:     sta $04            ; $f08c: 85 04     
__f08e:     lda #$04           ; $f08e: a9 04     
            bne __f096         ; $f090: d0 04     
__f092:     sta $03            ; $f092: 85 03     
__f094:     lda #$0f           ; $f094: a9 0f     
__f096:     pha                ; $f096: 48        
            sta $0f            ; $f097: 85 0f     
            txa                ; $f099: 8a        
            pha                ; $f09a: 48        
            tya                ; $f09b: 98        
            pha                ; $f09c: 48        
            lda $00            ; $f09d: a5 00     
            pha                ; $f09f: 48        
            lda $05            ; $f0a0: a5 05     
            pha                ; $f0a2: 48        
            lda $06            ; $f0a3: a5 06     
            pha                ; $f0a5: 48        
            lda $07            ; $f0a6: a5 07     
            pha                ; $f0a8: 48        
            lda $08            ; $f0a9: a5 08     
            pha                ; $f0ab: 48        
            lda $09            ; $f0ac: a5 09     
            pha                ; $f0ae: 48        
            lda #$02           ; $f0af: a9 02     
            sta $05            ; $f0b1: 85 05     
            lda $0f            ; $f0b3: a5 0f     
            cmp #$04           ; $f0b5: c9 04     
            beq __f0ef         ; $f0b7: f0 36     
            lda #$0f           ; $f0b9: a9 0f     
            and $03            ; $f0bb: 25 03     
            sta $07            ; $f0bd: 85 07     
            lda $03            ; $f0bf: a5 03     
            lsr                ; $f0c1: 4a        
            lsr                ; $f0c2: 4a        
            lsr                ; $f0c3: 4a        
            lsr                ; $f0c4: 4a        
            sta $06            ; $f0c5: 85 06     
            tax                ; $f0c7: aa        
            lda #$00           ; $f0c8: a9 00     
            clc                ; $f0ca: 18        
__f0cb:     adc $07            ; $f0cb: 65 07     
            dex                ; $f0cd: ca        
            bne __f0cb         ; $f0ce: d0 fb     
            sta $08            ; $f0d0: 85 08     
            lda $0f            ; $f0d2: a5 0f     
            bne __f0dc         ; $f0d4: d0 06     
            jsr __f11e         ; $f0d6: 20 1e f1  
            jmp __f0e9         ; $f0d9: 4c e9 f0  

;-------------------------------------------------------------------------------
__f0dc:     cmp #$01           ; $f0dc: c9 01     
            beq __f0e6         ; $f0de: f0 06     
            jsr __f195         ; $f0e0: 20 95 f1  
            jmp __f0f2         ; $f0e3: 4c f2 f0  

;-------------------------------------------------------------------------------
__f0e6:     jsr __f161         ; $f0e6: 20 61 f1  
__f0e9:     jsr __f139         ; $f0e9: 20 39 f1  
            jmp __f0f2         ; $f0ec: 4c f2 f0  

;-------------------------------------------------------------------------------
__f0ef:     jsr __f10a         ; $f0ef: 20 0a f1  
__f0f2:     pla                ; $f0f2: 68        
            sta $09            ; $f0f3: 85 09     
            pla                ; $f0f5: 68        
            sta $08            ; $f0f6: 85 08     
            pla                ; $f0f8: 68        
            sta $07            ; $f0f9: 85 07     
            pla                ; $f0fb: 68        
            sta $06            ; $f0fc: 85 06     
            pla                ; $f0fe: 68        
            sta $05            ; $f0ff: 85 05     
            pla                ; $f101: 68        
            sta $00            ; $f102: 85 00     
            pla                ; $f104: 68        
            tay                ; $f105: a8        
            pla                ; $f106: 68        
            tax                ; $f107: aa        
            pla                ; $f108: 68        
            rts                ; $f109: 60        

;-------------------------------------------------------------------------------
__f10a:     ldx $03            ; $f10a: a6 03     
            ldy #$00           ; $f10c: a0 00     
__f10e:     lda #$ff           ; $f10e: a9 ff     
            sta ($04),y        ; $f110: 91 04     
            iny                ; $f112: c8        
            iny                ; $f113: c8        
            lda $02            ; $f114: a5 02     
            sta ($04),y        ; $f116: 91 04     
            iny                ; $f118: c8        
            iny                ; $f119: c8        
            dex                ; $f11a: ca        
            bne __f10e         ; $f11b: d0 f1     
            rts                ; $f11d: 60        

;-------------------------------------------------------------------------------
__f11e:     lda $02            ; $f11e: a5 02     
            ldx $08            ; $f120: a6 08     
            ldy #$01           ; $f122: a0 01     
__f124:     sta ($04),y        ; $f124: 91 04     
            clc                ; $f126: 18        
            adc #$01           ; $f127: 69 01     
            iny                ; $f129: c8        
            pha                ; $f12a: 48        
            lda ($04),y        ; $f12b: b1 04     
            and #$3f           ; $f12d: 29 3f     
            sta ($04),y        ; $f12f: 91 04     
            pla                ; $f131: 68        
            iny                ; $f132: c8        
            iny                ; $f133: c8        
            iny                ; $f134: c8        
            dex                ; $f135: ca        
            bne __f124         ; $f136: d0 ec     
            rts                ; $f138: 60        

;-------------------------------------------------------------------------------
__f139:     ldy #$00           ; $f139: a0 00     
__f13b:     ldx $06            ; $f13b: a6 06     
            lda $01            ; $f13d: a5 01     
            sta $09            ; $f13f: 85 09     
__f141:     lda $09            ; $f141: a5 09     
            sta ($04),y        ; $f143: 91 04     
            clc                ; $f145: 18        
            adc #$08           ; $f146: 69 08     
            sta $09            ; $f148: 85 09     
            iny                ; $f14a: c8        
            iny                ; $f14b: c8        
            iny                ; $f14c: c8        
            lda $00            ; $f14d: a5 00     
            sta ($04),y        ; $f14f: 91 04     
            iny                ; $f151: c8        
            dex                ; $f152: ca        
            bne __f141         ; $f153: d0 ec     
            lda $00            ; $f155: a5 00     
            clc                ; $f157: 18        
            adc #$08           ; $f158: 69 08     
            sta $00            ; $f15a: 85 00     
            dec $07            ; $f15c: c6 07     
            bne __f13b         ; $f15e: d0 db     
            rts                ; $f160: 60        

;-------------------------------------------------------------------------------
__f161:     ldy #$01           ; $f161: a0 01     
            sty $0a            ; $f163: 84 0a     
            lda $08            ; $f165: a5 08     
            sec                ; $f167: 38        
            sbc $06            ; $f168: e5 06     
__f16a:     tay                ; $f16a: a8        
            sta $0b            ; $f16b: 85 0b     
            ldx $06            ; $f16d: a6 06     
__f16f:     tya                ; $f16f: 98        
            pha                ; $f170: 48        
            clc                ; $f171: 18        
            tya                ; $f172: 98        
            adc $02            ; $f173: 65 02     
            ldy $0a            ; $f175: a4 0a     
            sta ($04),y        ; $f177: 91 04     
            iny                ; $f179: c8        
            lda ($04),y        ; $f17a: b1 04     
            and #$3f           ; $f17c: 29 3f     
            eor #$40           ; $f17e: 49 40     
            sta ($04),y        ; $f180: 91 04     
            iny                ; $f182: c8        
            iny                ; $f183: c8        
            iny                ; $f184: c8        
            sty $0a            ; $f185: 84 0a     
            pla                ; $f187: 68        
            tay                ; $f188: a8        
            iny                ; $f189: c8        
            dex                ; $f18a: ca        
            bne __f16f         ; $f18b: d0 e2     
            lda $0b            ; $f18d: a5 0b     
            sec                ; $f18f: 38        
            sbc $06            ; $f190: e5 06     
            bpl __f16a         ; $f192: 10 d6     
            rts                ; $f194: 60        

;-------------------------------------------------------------------------------
__f195:     ldy #$00           ; $f195: a0 00     
__f197:     ldx $06            ; $f197: a6 06     
            lda $01            ; $f199: a5 01     
            sta $09            ; $f19b: 85 09     
            lda #$ff           ; $f19d: a9 ff     
__f19f:     sta ($04),y        ; $f19f: 91 04     
            iny                ; $f1a1: c8        
            iny                ; $f1a2: c8        
            iny                ; $f1a3: c8        
            iny                ; $f1a4: c8        
            dex                ; $f1a5: ca        
            bne __f19f         ; $f1a6: d0 f7     
            lda $00            ; $f1a8: a5 00     
            clc                ; $f1aa: 18        
            adc #$08           ; $f1ab: 69 08     
            sta $00            ; $f1ad: 85 00     
            dec $07            ; $f1af: c6 07     
            bne __f197         ; $f1b1: d0 e4     
            rts                ; $f1b3: 60        

;-------------------------------------------------------------------------------
__f1b4:     lda $2002          ; $f1b4: ad 02 20  
            lda $10            ; $f1b7: a5 10     
            and #$fb           ; $f1b9: 29 fb     
            sta $2000          ; $f1bb: 8d 00 20  
            lda #$20           ; $f1be: a9 20     
            sta $2006          ; $f1c0: 8d 06 20  
            lda #$00           ; $f1c3: a9 00     
            sta $2006          ; $f1c5: 8d 06 20  
            ldx #$04           ; $f1c8: a2 04     
            ldy #$00           ; $f1ca: a0 00     
            lda #$24           ; $f1cc: a9 24     
__f1ce:     sta $2007          ; $f1ce: 8d 07 20  
            dey                ; $f1d1: 88        
            bne __f1ce         ; $f1d2: d0 fa     
            dex                ; $f1d4: ca        
            bne __f1ce         ; $f1d5: d0 f7     
            lda #$23           ; $f1d7: a9 23     
            sta $2006          ; $f1d9: 8d 06 20  
            lda #$c0           ; $f1dc: a9 c0     
            sta $2006          ; $f1de: 8d 06 20  
            ldy #$40           ; $f1e1: a0 40     
            lda #$00           ; $f1e3: a9 00     
__f1e5:     sta $2007          ; $f1e5: 8d 07 20  
            dey                ; $f1e8: 88        
            bne __f1e5         ; $f1e9: d0 fa     
            rts                ; $f1eb: 60        

;-------------------------------------------------------------------------------
__f1ec:     sta $2006          ; $f1ec: 8d 06 20  
            iny                ; $f1ef: c8        
            lda ($00),y        ; $f1f0: b1 00     
            sta $2006          ; $f1f2: 8d 06 20  
            iny                ; $f1f5: c8        
            lda ($00),y        ; $f1f6: b1 00     
            asl                ; $f1f8: 0a        
            pha                ; $f1f9: 48        
            lda $10            ; $f1fa: a5 10     
            ora #$04           ; $f1fc: 09 04     
            bcs __f202         ; $f1fe: b0 02     
            and #$fb           ; $f200: 29 fb     
__f202:     sta $2000          ; $f202: 8d 00 20  
            sta $10            ; $f205: 85 10     
            pla                ; $f207: 68        
            asl                ; $f208: 0a        
            bcc __f20e         ; $f209: 90 03     
            ora #$02           ; $f20b: 09 02     
            iny                ; $f20d: c8        
__f20e:     lsr                ; $f20e: 4a        
            lsr                ; $f20f: 4a        
            tax                ; $f210: aa        
__f211:     bcs __f214         ; $f211: b0 01     
            iny                ; $f213: c8        
__f214:     lda ($00),y        ; $f214: b1 00     
            sta $2007          ; $f216: 8d 07 20  
            dex                ; $f219: ca        
            bne __f211         ; $f21a: d0 f5     
            sec                ; $f21c: 38        
            tya                ; $f21d: 98        
            adc $00            ; $f21e: 65 00     
            sta $00            ; $f220: 85 00     
            lda #$00           ; $f222: a9 00     
            adc $01            ; $f224: 65 01     
            sta $01            ; $f226: 85 01     
__f228:     ldx $2002          ; $f228: ae 02 20  
            ldy #$00           ; $f22b: a0 00     
            lda ($00),y        ; $f22d: b1 00     
            bne __f1ec         ; $f22f: d0 bb     
            lda $12            ; $f231: a5 12     
            sta $2005          ; $f233: 8d 05 20  
            lda $13            ; $f236: a5 13     
            sta $2005          ; $f238: 8d 05 20  
            rts                ; $f23b: 60        

;-------------------------------------------------------------------------------
__f23c:     cld                ; $f23c: d8        
            lda #$04           ; $f23d: a9 04     
__f23f:     lsr $00            ; $f23f: 46 00     
            bcc __f248         ; $f241: 90 05     
            pha                ; $f243: 48        
            jsr __f24e         ; $f244: 20 4e f2  
            pla                ; $f247: 68        
__f248:     clc                ; $f248: 18        
            sbc #$00           ; $f249: e9 00     
            bpl __f23f         ; $f24b: 10 f2     
            rts                ; $f24d: 60        

;-------------------------------------------------------------------------------
__f24e:     asl                ; $f24e: 0a        
            asl                ; $f24f: 0a        
            tay                ; $f250: a8        
            sta $01            ; $f251: 85 01     
            ldx $0330          ; $f253: ae 30 03  
            lda __c000,y       ; $f256: b9 00 c0  
            sta $0331,x        ; $f259: 9d 31 03  
            jsr __f32d         ; $f25c: 20 2d f3  
            iny                ; $f25f: c8        
            lda __c000,y       ; $f260: b9 00 c0  
            sta $0331,x        ; $f263: 9d 31 03  
            jsr __f32d         ; $f266: 20 2d f3  
            iny                ; $f269: c8        
            lda __c000,y       ; $f26a: b9 00 c0  
            and #$87           ; $f26d: 29 87     
            sta $0331,x        ; $f26f: 9d 31 03  
            and #$07           ; $f272: 29 07     
            sta $02            ; $f274: 85 02     
            txa                ; $f276: 8a        
            sec                ; $f277: 38        
            adc $02            ; $f278: 65 02     
            jsr __f32f         ; $f27a: 20 2f f3  
            tax                ; $f27d: aa        
            stx $0330          ; $f27e: 8e 30 03  
            lda #$00           ; $f281: a9 00     
            sta $0331,x        ; $f283: 9d 31 03  
            iny                ; $f286: c8        
            lda __c000,y       ; $f287: b9 00 c0  
            sta $03            ; $f28a: 85 03     
            dex                ; $f28c: ca        
            clc                ; $f28d: 18        
__f28e:     lda $0020,y        ; $f28e: b9 20 00  
            and #$0f           ; $f291: 29 0f     
            beq __f296         ; $f293: f0 01     
            clc                ; $f295: 18        
__f296:     bcc __f29a         ; $f296: 90 02     
            lda #$24           ; $f298: a9 24     
__f29a:     sta $0331,x        ; $f29a: 9d 31 03  
            dex                ; $f29d: ca        
            dec $02            ; $f29e: c6 02     
            beq __f2c4         ; $f2a0: f0 22     
            lda $0020,y        ; $f2a2: b9 20 00  
            and #$f0           ; $f2a5: 29 f0     
            php                ; $f2a7: 08        
            lsr                ; $f2a8: 4a        
            lsr                ; $f2a9: 4a        
            lsr                ; $f2aa: 4a        
            lsr                ; $f2ab: 4a        
            plp                ; $f2ac: 28        
            beq __f2b0         ; $f2ad: f0 01     
            clc                ; $f2af: 18        
__f2b0:     bcc __f2b4         ; $f2b0: 90 02     
            lda #$24           ; $f2b2: a9 24     
__f2b4:     sta $0331,x        ; $f2b4: 9d 31 03  
            lda $03            ; $f2b7: a5 03     
            and #$01           ; $f2b9: 29 01     
            beq __f2be         ; $f2bb: f0 01     
            sec                ; $f2bd: 38        
__f2be:     dey                ; $f2be: 88        
            dex                ; $f2bf: ca        
            dec $02            ; $f2c0: c6 02     
            bne __f28e         ; $f2c2: d0 ca     
__f2c4:     lda $03            ; $f2c4: a5 03     
            and #$10           ; $f2c6: 29 10     
            beq __f2d6         ; $f2c8: f0 0c     
            inx                ; $f2ca: e8        
            ldy $01            ; $f2cb: a4 01     
            clc                ; $f2cd: 18        
            lda $0020,y        ; $f2ce: b9 20 00  
            adc #$37           ; $f2d1: 69 37     
            sta $0331,x        ; $f2d3: 9d 31 03  
__f2d6:     rts                ; $f2d6: 60        

;-------------------------------------------------------------------------------
__f2d7:     ldy #$00           ; $f2d7: a0 00     
            lda ($02),y        ; $f2d9: b1 02     
            and #$0f           ; $f2db: 29 0f     
            sta $05            ; $f2dd: 85 05     
            lda ($02),y        ; $f2df: b1 02     
            lsr                ; $f2e1: 4a        
            lsr                ; $f2e2: 4a        
            lsr                ; $f2e3: 4a        
            lsr                ; $f2e4: 4a        
            sta $04            ; $f2e5: 85 04     
            ldx $0330          ; $f2e7: ae 30 03  
__f2ea:     lda $01            ; $f2ea: a5 01     
            sta $0331,x        ; $f2ec: 9d 31 03  
            jsr __f32d         ; $f2ef: 20 2d f3  
            lda $00            ; $f2f2: a5 00     
            sta $0331,x        ; $f2f4: 9d 31 03  
            jsr __f32d         ; $f2f7: 20 2d f3  
            lda $04            ; $f2fa: a5 04     
            sta $06            ; $f2fc: 85 06     
            ora #$80           ; $f2fe: 09 80     
            sta $0331,x        ; $f300: 9d 31 03  
__f303:     jsr __f32d         ; $f303: 20 2d f3  
            iny                ; $f306: c8        
            lda ($02),y        ; $f307: b1 02     
            sta $0331,x        ; $f309: 9d 31 03  
            dec $06            ; $f30c: c6 06     
            bne __f303         ; $f30e: d0 f3     
            jsr __f32d         ; $f310: 20 2d f3  
            clc                ; $f313: 18        
            lda #$01           ; $f314: a9 01     
            adc $00            ; $f316: 65 00     
            sta $00            ; $f318: 85 00     
            lda #$00           ; $f31a: a9 00     
            adc $01            ; $f31c: 65 01     
            sta $01            ; $f31e: 85 01     
            stx $0330          ; $f320: 8e 30 03  
            dec $05            ; $f323: c6 05     
            bne __f2ea         ; $f325: d0 c3     
            lda #$00           ; $f327: a9 00     
            sta $0331,x        ; $f329: 9d 31 03  
            rts                ; $f32c: 60        

;-------------------------------------------------------------------------------
__f32d:     inx                ; $f32d: e8        
            txa                ; $f32e: 8a        
__f32f:     cmp #$3f           ; $f32f: c9 3f     
            bcc __f33d         ; $f331: 90 0a     
            ldx $0330          ; $f333: ae 30 03  
            lda #$00           ; $f336: a9 00     
            sta $0331,x        ; $f338: 9d 31 03  
            pla                ; $f33b: 68        
            pla                ; $f33c: 68        
__f33d:     rts                ; $f33d: 60        

;-------------------------------------------------------------------------------
__f33e:     ldx #$ff           ; $f33e: a2 ff     
            bne __f344         ; $f340: d0 02     
__f342:     ldx #$00           ; $f342: a2 00     
__f344:     stx $04            ; $f344: 86 04     
            ldx #$00           ; $f346: a2 00     
            stx $05            ; $f348: 86 05     
            stx $06            ; $f34a: 86 06     
            stx $07            ; $f34c: 86 07     
            lda $01            ; $f34e: a5 01     
            and #$08           ; $f350: 29 08     
            bne __f355         ; $f352: d0 01     
            inx                ; $f354: e8        
__f355:     lda $00            ; $f355: a5 00     
            sta $06,x          ; $f357: 95 06     
            lda $01            ; $f359: a5 01     
            jmp __f35e         ; $f35b: 4c 5e f3  

;-------------------------------------------------------------------------------
__f35e:     and #$07           ; $f35e: 29 07     
            asl                ; $f360: 0a        
            asl                ; $f361: 0a        
            tax                ; $f362: aa        
            lda $04            ; $f363: a5 04     
            beq __f38e         ; $f365: f0 27     
            lda $24,x          ; $f367: b5 24     
            beq __f392         ; $f369: f0 27     
__f36b:     clc                ; $f36b: 18        
            lda $27,x          ; $f36c: b5 27     
            sta $03            ; $f36e: 85 03     
            lda $07            ; $f370: a5 07     
            jsr __f3e3         ; $f372: 20 e3 f3  
            sta $27,x          ; $f375: 95 27     
            lda $26,x          ; $f377: b5 26     
            sta $03            ; $f379: 85 03     
            lda $06            ; $f37b: a5 06     
            jsr __f3e3         ; $f37d: 20 e3 f3  
            sta $26,x          ; $f380: 95 26     
            lda $25,x          ; $f382: b5 25     
            sta $03            ; $f384: 85 03     
            lda $05            ; $f386: a5 05     
            jsr __f3e3         ; $f388: 20 e3 f3  
            sta $25,x          ; $f38b: 95 25     
            rts                ; $f38d: 60        

;-------------------------------------------------------------------------------
__f38e:     lda $24,x          ; $f38e: b5 24     
            beq __f36b         ; $f390: f0 d9     
__f392:     sec                ; $f392: 38        
            lda $27,x          ; $f393: b5 27     
            sta $03            ; $f395: 85 03     
            lda $07            ; $f397: a5 07     
            jsr __f404         ; $f399: 20 04 f4  
            sta $27,x          ; $f39c: 95 27     
            lda $26,x          ; $f39e: b5 26     
            sta $03            ; $f3a0: 85 03     
            lda $06            ; $f3a2: a5 06     
            jsr __f404         ; $f3a4: 20 04 f4  
            sta $26,x          ; $f3a7: 95 26     
            lda $25,x          ; $f3a9: b5 25     
            sta $03            ; $f3ab: 85 03     
            lda $05            ; $f3ad: a5 05     
            jsr __f404         ; $f3af: 20 04 f4  
            sta $25,x          ; $f3b2: 95 25     
            lda $25,x          ; $f3b4: b5 25     
            bne __f3c0         ; $f3b6: d0 08     
            lda $26,x          ; $f3b8: b5 26     
            bne __f3c0         ; $f3ba: d0 04     
            lda $27,x          ; $f3bc: b5 27     
            beq __f3c6         ; $f3be: f0 06     
__f3c0:     bcs __f3e2         ; $f3c0: b0 20     
            lda $24,x          ; $f3c2: b5 24     
            eor #$ff           ; $f3c4: 49 ff     
__f3c6:     sta $24,x          ; $f3c6: 95 24     
            sec                ; $f3c8: 38        
            lda #$00           ; $f3c9: a9 00     
            sta $03            ; $f3cb: 85 03     
            lda $27,x          ; $f3cd: b5 27     
            jsr __f404         ; $f3cf: 20 04 f4  
            sta $27,x          ; $f3d2: 95 27     
            lda $26,x          ; $f3d4: b5 26     
            jsr __f404         ; $f3d6: 20 04 f4  
            sta $26,x          ; $f3d9: 95 26     
            lda $25,x          ; $f3db: b5 25     
            jsr __f404         ; $f3dd: 20 04 f4  
            sta $25,x          ; $f3e0: 95 25     
__f3e2:     rts                ; $f3e2: 60        

;-------------------------------------------------------------------------------
__f3e3:     jsr __f426         ; $f3e3: 20 26 f4  
            adc $01            ; $f3e6: 65 01     
            cmp #$0a           ; $f3e8: c9 0a     
            bcc __f3ee         ; $f3ea: 90 02     
            adc #$05           ; $f3ec: 69 05     
__f3ee:     clc                ; $f3ee: 18        
            adc $02            ; $f3ef: 65 02     
            sta $02            ; $f3f1: 85 02     
            lda $03            ; $f3f3: a5 03     
            and #$f0           ; $f3f5: 29 f0     
            adc $02            ; $f3f7: 65 02     
            bcc __f3ff         ; $f3f9: 90 04     
__f3fb:     adc #$5f           ; $f3fb: 69 5f     
            sec                ; $f3fd: 38        
            rts                ; $f3fe: 60        

;-------------------------------------------------------------------------------
__f3ff:     cmp #$a0           ; $f3ff: c9 a0     
            bcs __f3fb         ; $f401: b0 f8     
            rts                ; $f403: 60        

;-------------------------------------------------------------------------------
__f404:     jsr __f426         ; $f404: 20 26 f4  
            sbc $01            ; $f407: e5 01     
            sta $01            ; $f409: 85 01     
            bcs __f417         ; $f40b: b0 0a     
            adc #$0a           ; $f40d: 69 0a     
            sta $01            ; $f40f: 85 01     
            lda $02            ; $f411: a5 02     
            adc #$0f           ; $f413: 69 0f     
            sta $02            ; $f415: 85 02     
__f417:     lda $03            ; $f417: a5 03     
            and #$f0           ; $f419: 29 f0     
            sec                ; $f41b: 38        
            sbc $02            ; $f41c: e5 02     
            bcs __f423         ; $f41e: b0 03     
            adc #$a0           ; $f420: 69 a0     
            clc                ; $f422: 18        
__f423:     ora $01            ; $f423: 05 01     
            rts                ; $f425: 60        

;-------------------------------------------------------------------------------
__f426:     pha                ; $f426: 48        
            and #$0f           ; $f427: 29 0f     
            sta $01            ; $f429: 85 01     
            pla                ; $f42b: 68        
            and #$f0           ; $f42c: 29 f0     
            sta $02            ; $f42e: 85 02     
            lda $03            ; $f430: a5 03     
            and #$0f           ; $f432: 29 0f     
            rts                ; $f434: 60        

;-------------------------------------------------------------------------------
__f435:     lda #$00           ; $f435: a9 00     
            sta $04            ; $f437: 85 04     
            clc                ; $f439: 18        
            lda $00            ; $f43a: a5 00     
            adc #$10           ; $f43c: 69 10     
            and #$f0           ; $f43e: 29 f0     
            lsr                ; $f440: 4a        
            lsr                ; $f441: 4a        
            tay                ; $f442: a8        
            lda $00            ; $f443: a5 00     
            and #$07           ; $f445: 29 07     
            asl                ; $f447: 0a        
            asl                ; $f448: 0a        
            tax                ; $f449: aa        
__f44a:     lda $0020,y        ; $f44a: b9 20 00  
            beq __f4a0         ; $f44d: f0 51     
            lda $24,x          ; $f44f: b5 24     
            beq __f479         ; $f451: f0 26     
__f453:     sec                ; $f453: 38        
            lda $0023,y        ; $f454: b9 23 00  
            sta $03            ; $f457: 85 03     
            lda $27,x          ; $f459: b5 27     
            jsr __f404         ; $f45b: 20 04 f4  
            lda $0022,y        ; $f45e: b9 22 00  
            sta $03            ; $f461: 85 03     
            lda $26,x          ; $f463: b5 26     
            jsr __f404         ; $f465: 20 04 f4  
            lda $0021,y        ; $f468: b9 21 00  
            sta $03            ; $f46b: 85 03     
            lda $25,x          ; $f46d: b5 25     
            jsr __f404         ; $f46f: 20 04 f4  
            bcs __f4a4         ; $f472: b0 30     
            lda $0020,y        ; $f474: b9 20 00  
            bne __f4a9         ; $f477: d0 30     
__f479:     lda #$ff           ; $f479: a9 ff     
            sta $04            ; $f47b: 85 04     
            sec                ; $f47d: 38        
__f47e:     tya                ; $f47e: 98        
            bne __f49f         ; $f47f: d0 1e     
            bcc __f493         ; $f481: 90 10     
            lda $24,x          ; $f483: b5 24     
            sta $20            ; $f485: 85 20     
            lda $25,x          ; $f487: b5 25     
            sta $21            ; $f489: 85 21     
            lda $26,x          ; $f48b: b5 26     
            sta $22            ; $f48d: 85 22     
            lda $27,x          ; $f48f: b5 27     
            sta $23            ; $f491: 85 23     
__f493:     lda $00            ; $f493: a5 00     
            and #$08           ; $f495: 29 08     
            beq __f49f         ; $f497: f0 06     
            dex                ; $f499: ca        
            dex                ; $f49a: ca        
            dex                ; $f49b: ca        
            dex                ; $f49c: ca        
            bpl __f44a         ; $f49d: 10 ab     
__f49f:     rts                ; $f49f: 60        

;-------------------------------------------------------------------------------
__f4a0:     lda $24,x          ; $f4a0: b5 24     
            beq __f453         ; $f4a2: f0 af     
__f4a4:     lda $0020,y        ; $f4a4: b9 20 00  
            bne __f479         ; $f4a7: d0 d0     
__f4a9:     clc                ; $f4a9: 18        
            bcc __f47e         ; $f4aa: 90 d2     
__f4ac:     ldx #$09           ; $f4ac: a2 09     
            dec $34            ; $f4ae: c6 34     
            bpl __f4b8         ; $f4b0: 10 06     
            lda #$0a           ; $f4b2: a9 0a     
            sta $34            ; $f4b4: 85 34     
            ldx #$10           ; $f4b6: a2 10     
__f4b8:     lda $35,x          ; $f4b8: b5 35     
            beq __f4be         ; $f4ba: f0 02     
            dec $35,x          ; $f4bc: d6 35     
__f4be:     dex                ; $f4be: ca        
            bpl __f4b8         ; $f4bf: 10 f7     
            rts                ; $f4c1: 60        

;-------------------------------------------------------------------------------
__f4c2:     ldx $0330          ; $f4c2: ae 30 03  
            lda $01            ; $f4c5: a5 01     
            sta $0331,x        ; $f4c7: 9d 31 03  
            jsr __f32d         ; $f4ca: 20 2d f3  
            lda $00            ; $f4cd: a5 00     
            sta $0331,x        ; $f4cf: 9d 31 03  
            jsr __f32d         ; $f4d2: 20 2d f3  
            lda #$01           ; $f4d5: a9 01     
            sta $0331,x        ; $f4d7: 9d 31 03  
            jsr __f32d         ; $f4da: 20 2d f3  
            tya                ; $f4dd: 98        
            sta $0331,x        ; $f4de: 9d 31 03  
            jsr __f32d         ; $f4e1: 20 2d f3  
            lda #$00           ; $f4e4: a9 00     
            sta $0331,x        ; $f4e6: 9d 31 03  
            stx $0330          ; $f4e9: 8e 30 03  
            rts                ; $f4ec: 60        

;-------------------------------------------------------------------------------
__f4ed:     lda $18            ; $f4ed: a5 18     
            and #$02           ; $f4ef: 29 02     
            sta $00            ; $f4f1: 85 00     
            lda $19            ; $f4f3: a5 19     
            and #$02           ; $f4f5: 29 02     
            eor $00            ; $f4f7: 45 00     
            clc                ; $f4f9: 18        
            beq __f4fd         ; $f4fa: f0 01     
            sec                ; $f4fc: 38        
__f4fd:     ror $18            ; $f4fd: 66 18     
            ror $19            ; $f4ff: 66 19     
            ror $1a            ; $f501: 66 1a     
            ror $1b            ; $f503: 66 1b     
            ror $1c            ; $f505: 66 1c     
            ror $1d            ; $f507: 66 1d     
            ror $1e            ; $f509: 66 1e     
            ror $1f            ; $f50b: 66 1f     
            rts                ; $f50d: 60        

;-------------------------------------------------------------------------------
__f50e:     lda #$01           ; $f50e: a9 01     
            sta $4016          ; $f510: 8d 16 40  
            ldx #$00           ; $f513: a2 00     
            lda #$00           ; $f515: a9 00     
            sta $4016          ; $f517: 8d 16 40  
            jsr __f522         ; $f51a: 20 22 f5  
            inx                ; $f51d: e8        
            jsr __f522         ; $f51e: 20 22 f5  
            rts                ; $f521: 60        

;-------------------------------------------------------------------------------
__f522:     ldy #$08           ; $f522: a0 08     
__f524:     pha                ; $f524: 48        
            lda $4016,x        ; $f525: bd 16 40  
            sta $00            ; $f528: 85 00     
            lsr                ; $f52a: 4a        
            ora $00            ; $f52b: 05 00     
            lsr                ; $f52d: 4a        
            pla                ; $f52e: 68        
            rol                ; $f52f: 2a        
            dey                ; $f530: 88        
            bne __f524         ; $f531: d0 f1     
            stx $00            ; $f533: 86 00     
            asl $00            ; $f535: 06 00     
            ldx $00            ; $f537: a6 00     
            ldy $14,x          ; $f539: b4 14     
            sty $00            ; $f53b: 84 00     
            sta $14,x          ; $f53d: 95 14     
            and #$ff           ; $f53f: 29 ff     
            bpl __f549         ; $f541: 10 06     
            bit $00            ; $f543: 24 00     
            bpl __f549         ; $f545: 10 02     
            and #$7f           ; $f547: 29 7f     
__f549:     ldy $15,x          ; $f549: b4 15     
            sta $15,x          ; $f54b: 95 15     
            tya                ; $f54d: 98        
            and #$0f           ; $f54e: 29 0f     
            and $15,x          ; $f550: 35 15     
            beq __f55a         ; $f552: f0 06     
            ora #$f0           ; $f554: 09 f0     
            and $15,x          ; $f556: 35 15     
            sta $15,x          ; $f558: 95 15     
__f55a:     rts                ; $f55a: 60        

;-------------------------------------------------------------------------------
            .hex 3f 00 20      ; $f55b: 3f 00 20  Invalid Opcode - RLA $2000,x
            .hex 0f 15 2c      ; $f55e: 0f 15 2c  Invalid Opcode - SLO $2c15
            .hex 12            ; $f561: 12        Invalid Opcode - KIL 
            .hex 0f 27 02      ; $f562: 0f 27 02  Invalid Opcode - SLO $0227
            .hex 17 0f         ; $f565: 17 0f     Invalid Opcode - SLO $0f,x
            bmi __f59f         ; $f567: 30 36     
            asl $0f            ; $f569: 06 0f     
            bmi __f599         ; $f56b: 30 2c     
            bit $0f            ; $f56d: 24 0f     
            .hex 02            ; $f56f: 02        Invalid Opcode - KIL 
            rol $16,x          ; $f570: 36 16     
            .hex 0f 30 27      ; $f572: 0f 30 27  Invalid Opcode - SLO $2730
            bit $0f            ; $f575: 24 0f     
            asl $30,x          ; $f577: 16 30     
            .hex 37 0f         ; $f579: 37 0f     Invalid Opcode - RLA $0f,x
            asl $27            ; $f57b: 06 27     
            .hex 02            ; $f57d: 02        Invalid Opcode - KIL 
            .hex 23 c0         ; $f57e: 23 c0     Invalid Opcode - RLA ($c0,x)
            pha                ; $f580: 48        
            .hex ff 23 c8      ; $f581: ff 23 c8  Invalid Opcode - ISC __c823,x
            .hex 03 55         ; $f584: 03 55     Invalid Opcode - SLO ($55,x)
            tax                ; $f586: aa        
            .hex 22            ; $f587: 22        Invalid Opcode - KIL 
            .hex 23 cd         ; $f588: 23 cd     Invalid Opcode - RLA ($cd,x)
            .hex 43 0f         ; $f58a: 43 0f     Invalid Opcode - SRE ($0f,x)
            jsr __c72c         ; $f58c: 20 2c c7  
            .hex 3f 20 81      ; $f58f: 3f 20 81  Invalid Opcode - RLA $8120,x
            sty $50            ; $f592: 84 50     
            eor ($52),y        ; $f594: 51 52     
            .hex 53 20         ; $f596: 53 20     Invalid Opcode - SRE ($20),y
            .hex 82            ; $f598: 82        Suspected data
__f599:     sty $54            ; $f599: 84 54     
            eor $56,x          ; $f59b: 55 56     
            .hex 57 20         ; $f59d: 57 20     Invalid Opcode - SRE $20,x
__f59f:     .hex 83 84         ; $f59f: 83 84     Invalid Opcode - SAX ($84,x)
            cli                ; $f5a1: 58        
            eor $5b5a,y        ; $f5a2: 59 5a 5b  
            jsr __c72a         ; $f5a5: 20 2a c7  
            .hex 3f 20 ad      ; $f5a8: 3f 20 ad  Invalid Opcode - RLA $ad20,x
            lsr $30            ; $f5ab: 46 30     
            jsr $43ca          ; $f5ad: 20 ca 43  
            bmi __f5d2         ; $f5b0: 30 20     
            .hex d2            ; $f5b2: d2        Invalid Opcode - KIL 
            .hex c2 3f         ; $f5b3: c2 3f     Invalid Opcode - NOP #$3f
            and ($02,x)        ; $f5b5: 21 02     
            lsr $2130          ; $f5b7: 4e 30 21  
            bpl __f5c8         ; $f5ba: 10 0c     
            rol $453e,x        ; $f5bc: 3e 3e 45  
            and $3d3d,x        ; $f5bf: 3d 3d 3d  
            .hex 3c 3c 3c      ; $f5c2: 3c 3c 3c  Invalid Opcode - NOP $3c3c,x
            .hex 3b 3b 3b      ; $f5c5: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
__f5c8:     and ($2d,x)        ; $f5c8: 21 2d     
            .hex 0f 3f 24      ; $f5ca: 0f 3f 24  Invalid Opcode - SLO $243f
            bit $37            ; $f5cd: 24 37     
            .hex 37 37         ; $f5cf: 37 37     Invalid Opcode - RLA $37,x
            .hex 36            ; $f5d1: 36        Suspected data
__f5d2:     rol $36,x          ; $f5d2: 36 36     
            and $35,x          ; $f5d4: 35 35     
            and $49,x          ; $f5d6: 35 49     
            .hex 34 34         ; $f5d8: 34 34     Invalid Opcode - NOP $34,x
            and ($59,x)        ; $f5da: 21 59     
            ora ($3f,x)        ; $f5dc: 01 3f     
            and ($6d,x)        ; $f5de: 21 6d     
            ora ($40),y        ; $f5e0: 11 40     
            sec                ; $f5e2: 38        
            sec                ; $f5e3: 38        
            and $3939,y        ; $f5e4: 39 39 39  
            .hex 3a            ; $f5e7: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f5e8: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f5e9: 3a        Invalid Opcode - NOP 
            .hex 3b 3b 3b      ; $f5ea: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
            .hex 43 3c         ; $f5ed: 43 3c     Invalid Opcode - SRE ($3c,x)
            .hex 3c 3d 3d      ; $f5ef: 3c 3d 3d  Invalid Opcode - NOP $3d3d,x
            and ($84,x)        ; $f5f2: 21 84     
            .hex 1a            ; $f5f4: 1a        Invalid Opcode - NOP 
            and $3d3d,x        ; $f5f5: 3d 3d 3d  
            rol $3e3e,x        ; $f5f8: 3e 3e 3e  
            bmi __f62d         ; $f5fb: 30 30     
            bmi __f630         ; $f5fd: 30 31     
            and ($31),y        ; $f5ff: 31 31     
            .hex 32            ; $f601: 32        Invalid Opcode - KIL 
            .hex 32            ; $f602: 32        Invalid Opcode - KIL 
            .hex 32            ; $f603: 32        Invalid Opcode - KIL 
            .hex 33 33         ; $f604: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 34         ; $f606: 33 34     Invalid Opcode - RLA ($34),y
            eor #$34           ; $f608: 49 34     
            and $35,x          ; $f60a: 35 35     
            and $36,x          ; $f60c: 35 36     
            rol $21,x          ; $f60e: 36 21     
            ldy $06            ; $f610: a4 06     
            rol $36,x          ; $f612: 36 36     
            .hex 4b 37         ; $f614: 4b 37     Invalid Opcode - ALR #$37
            .hex 37 37         ; $f616: 37 37     Invalid Opcode - RLA $37,x
            and ($c6,x)        ; $f618: 21 c6     
__f61a:     ora ($3f,x)        ; $f61a: 01 3f     
            and ($e2,x)        ; $f61c: 21 e2     
            .hex 17 30         ; $f61e: 17 30     Invalid Opcode - SLO $30,x
            bmi __f660         ; $f620: 30 3e     
            rol $3d45,x        ; $f622: 3e 45 3d  
            and $3c3d,x        ; $f625: 3d 3d 3c  
            .hex 43 3c         ; $f628: 43 3c     Invalid Opcode - SRE ($3c,x)
            .hex 3b 3b 3b      ; $f62a: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
__f62d:     .hex 3a            ; $f62d: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f62e: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f62f: 3a        Invalid Opcode - NOP 
__f630:     and $3939,y        ; $f630: 39 39 39  
            sec                ; $f633: 38        
            rti                ; $f634: 40        

;-------------------------------------------------------------------------------
            sec                ; $f635: 38        
            and ($ab,x)        ; $f636: 21 ab     
            .hex c2 3f         ; $f638: c2 3f     Invalid Opcode - NOP #$3f
            .hex 22            ; $f63a: 22        Invalid Opcode - KIL 
            .hex 04 18         ; $f63b: 04 18     Invalid Opcode - NOP $18
            .hex 37 37         ; $f63d: 37 37     Invalid Opcode - RLA $37,x
            .hex 37 36         ; $f63f: 37 36     Invalid Opcode - RLA $36,x
            rol $36,x          ; $f641: 36 36     
            lsr                ; $f643: 4a        
            and $35,x          ; $f644: 35 35     
__f646:     .hex 34 34         ; $f646: 34 34     Invalid Opcode - NOP $34,x
            .hex 34 48         ; $f648: 34 48     Invalid Opcode - NOP $48,x
            .hex 33 33         ; $f64a: 33 33     Invalid Opcode - RLA ($33),y
            .hex 32            ; $f64c: 32        Invalid Opcode - KIL 
            .hex 32            ; $f64d: 32        Invalid Opcode - KIL 
            .hex 32            ; $f64e: 32        Invalid Opcode - KIL 
            and ($31),y        ; $f64f: 31 31     
            and ($30),y        ; $f651: 31 30     
            bmi __f685         ; $f653: 30 30     
            .hex 22            ; $f655: 22        Invalid Opcode - KIL 
            bmi __f61a         ; $f656: 30 c2     
            .hex 3f 22 39      ; $f658: 3f 22 39  Invalid Opcode - RLA $3922,x
            ora ($3f,x)        ; $f65b: 01 3f     
            .hex 22            ; $f65d: 22        Invalid Opcode - KIL 
            lsr                ; $f65e: 4a        
            .hex 01            ; $f65f: 01        Suspected data
__f660:     .hex 3f 22 59      ; $f660: 3f 22 59  Invalid Opcode - RLA $5922,x
            ora $40            ; $f663: 05 40     
            sec                ; $f665: 38        
            sec                ; $f666: 38        
            and $2239,y        ; $f667: 39 39 22  
            .hex 64 1a         ; $f66a: 64 1a     Invalid Opcode - NOP $1a
            and $3939,y        ; $f66c: 39 39 39  
            .hex 3a            ; $f66f: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f670: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f671: 3a        Invalid Opcode - NOP 
            .hex 42            ; $f672: 42        Invalid Opcode - KIL 
            .hex 3b 3b 3c      ; $f673: 3b 3b 3c  Invalid Opcode - RLA $3c3b,y
            .hex 3c 3c 44      ; $f676: 3c 3c 44  Invalid Opcode - NOP $443c,x
            and $3e3d,x        ; $f679: 3d 3d 3e  
            rol $303e,x        ; $f67c: 3e 3e 30  
__f67f:     bmi __f6b1         ; $f67f: 30 30     
            and ($31),y        ; $f681: 31 31     
            and ($32),y        ; $f683: 31 32     
__f685:     .hex 32            ; $f685: 32        Invalid Opcode - KIL 
            .hex 22            ; $f686: 22        Invalid Opcode - KIL 
            sty $12            ; $f687: 84 12     
            .hex 32            ; $f689: 32        Invalid Opcode - KIL 
            .hex 32            ; $f68a: 32        Invalid Opcode - KIL 
            .hex 47 33         ; $f68b: 47 33     Invalid Opcode - SRE $33
            .hex 33 33         ; $f68d: 33 33     Invalid Opcode - RLA ($33),y
            .hex 34 34         ; $f68f: 34 34     Invalid Opcode - NOP $34,x
            .hex 34 35         ; $f691: 34 35     Invalid Opcode - NOP $35,x
            lsr                ; $f693: 4a        
            and $36,x          ; $f694: 35 36     
            rol $36,x          ; $f696: 36 36     
            .hex 37 37         ; $f698: 37 37     Invalid Opcode - RLA $37,x
            .hex 37 22         ; $f69a: 37 22     Invalid Opcode - RLA $22,x
            ldx $01            ; $f69c: a6 01     
            .hex 3f 22 ae      ; $f69e: 3f 22 ae  Invalid Opcode - RLA $ae22,x
            .hex c2 3f         ; $f6a1: c2 3f     Invalid Opcode - NOP #$3f
            .hex 22            ; $f6a3: 22        Invalid Opcode - KIL 
            .hex c2 0b         ; $f6a4: c2 0b     Invalid Opcode - NOP #$0b
            .hex 3b 3b 3a      ; $f6a6: 3b 3b 3a  Invalid Opcode - RLA $3a3b,y
            .hex 3a            ; $f6a9: 3a        Invalid Opcode - NOP 
            eor ($39,x)        ; $f6aa: 41 39     
            and $3839,y        ; $f6ac: 39 39 38  
            sec                ; $f6af: 38        
            sec                ; $f6b0: 38        
__f6b1:     .hex 22            ; $f6b1: 22        Invalid Opcode - KIL 
            .hex e2 1a         ; $f6b2: e2 1a     Invalid Opcode - NOP #$1a
            .hex 34 34         ; $f6b4: 34 34     Invalid Opcode - NOP $34,x
            .hex 33 33         ; $f6b6: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 32         ; $f6b8: 33 32     Invalid Opcode - RLA ($32),y
            .hex 32            ; $f6ba: 32        Invalid Opcode - KIL 
            .hex 32            ; $f6bb: 32        Invalid Opcode - KIL 
            and ($31),y        ; $f6bc: 31 31     
            lsr $30            ; $f6be: 46 30     
            bmi __f6f2         ; $f6c0: 30 30     
            rol $3e3e,x        ; $f6c2: 3e 3e 3e  
            and $3d3d,x        ; $f6c5: 3d 3d 3d  
            .hex 3c 3c 3c      ; $f6c8: 3c 3c 3c  Invalid Opcode - NOP $3c3c,x
            .hex 3b 3b 3b      ; $f6cb: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
            .hex 23 0c         ; $f6ce: 23 0c     Invalid Opcode - RLA ($0c,x)
            bpl __f711         ; $f6d0: 10 3f     
            bit $24            ; $f6d2: 24 24     
            bit $37            ; $f6d4: 24 37     
            .hex 37 37         ; $f6d6: 37 37     Invalid Opcode - RLA $37,x
            rol $36,x          ; $f6d8: 36 36     
            rol $35,x          ; $f6da: 36 35     
            and $35,x          ; $f6dc: 35 35     
            eor #$34           ; $f6de: 49 34     
            .hex 34 23         ; $f6e0: 34 23     Invalid Opcode - NOP $23,x
            and $3f01,y        ; $f6e2: 39 01 3f  
            .hex 23 4c         ; $f6e5: 23 4c     Invalid Opcode - RLA ($4c,x)
            .hex 13 3f         ; $f6e7: 13 3f     Invalid Opcode - SLO ($3f),y
            bit $24            ; $f6e9: 24 24     
            bit $38            ; $f6eb: 24 38     
            sec                ; $f6ed: 38        
            sec                ; $f6ee: 38        
            and $3939,y        ; $f6ef: 39 39 39  
__f6f2:     .hex 3a            ; $f6f2: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f6f3: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f6f4: 3a        Invalid Opcode - NOP 
            .hex 42            ; $f6f5: 42        Invalid Opcode - KIL 
            .hex 3b 3b 3c      ; $f6f6: 3b 3b 3c  Invalid Opcode - RLA $3c3b,y
            .hex 3c 3c 23      ; $f6f9: 3c 3c 23  Invalid Opcode - NOP $233c,x
            adc ($4f,x)        ; $f6fc: 61 4f     
            bmi __f723         ; $f6fe: 30 23     
            bvs __f711         ; $f700: 70 0f     
            and ($31),y        ; $f702: 31 31     
            and ($32),y        ; $f704: 31 32     
            .hex 32            ; $f706: 32        Invalid Opcode - KIL 
            .hex 32            ; $f707: 32        Invalid Opcode - KIL 
            .hex 33 33         ; $f708: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 34         ; $f70a: 33 34     Invalid Opcode - RLA ($34),y
            .hex 34 34         ; $f70c: 34 34     Invalid Opcode - NOP $34,x
            and $35,x          ; $f70e: 35 35     
            .hex 35            ; $f710: 35        Suspected data
__f711:     .hex 23 24         ; $f711: 23 24     Invalid Opcode - RLA ($24,x)
            .hex 82 4c         ; $f713: 82 4c     Invalid Opcode - NOP #$4c
            eor $2523          ; $f715: 4d 23 25  
            .hex 82 4e         ; $f718: 82 4e     Invalid Opcode - NOP #$4e
            .hex 4f 00 3f      ; $f71a: 4f 00 3f  Invalid Opcode - SRE $3f00
            brk                ; $f71d: 00        
            php                ; $f71e: 08        
            .hex 0f 2c 27      ; $f71f: 0f 2c 27  Invalid Opcode - SLO $272c
            .hex 02            ; $f722: 02        Invalid Opcode - KIL 
__f723:     .hex 0f 30 12      ; $f723: 0f 30 12  Invalid Opcode - SLO $1230
            bit $3f            ; $f726: 24 3f     
            ora $0603,x        ; $f728: 1d 03 06  
            bmi __f73f         ; $f72b: 30 12     
            .hex 23 c0         ; $f72d: 23 c0     Invalid Opcode - RLA ($c0,x)
            pha                ; $f72f: 48        
            .hex ff 23 c9      ; $f730: ff 23 c9  Invalid Opcode - ISC __c923,x
            .hex 07 55         ; $f733: 07 55     Invalid Opcode - SLO $55
            brk                ; $f735: 00        
            tax                ; $f736: aa        
            tax                ; $f737: aa        
            .hex 0f 0f 0f      ; $f738: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            .hex 23 e2         ; $f73b: 23 e2     Invalid Opcode - RLA ($e2,x)
            ora $04            ; $f73d: 05 04     
__f73f:     brk                ; $f73f: 00        
            brk                ; $f740: 00        
            brk                ; $f741: 00        
            ora ($20,x)        ; $f742: 01 20     
            cmp $02            ; $f744: c5 02     
            bvs __f7ba         ; $f746: 70 72     
            jsr $02e5          ; $f748: 20 e5 02  
            adc ($73),y        ; $f74b: 71 73     
            jsr $42ca          ; $f74d: 20 ca 42  
            .hex 62            ; $f750: 62        Invalid Opcode - KIL 
            and ($05,x)        ; $f751: 21 05     
            lsr $62,x          ; $f753: 56 62     
            and ($a4,x)        ; $f755: 21 a4     
            cli                ; $f757: 58        
            .hex 62            ; $f758: 62        Invalid Opcode - KIL 
            .hex 22            ; $f759: 22        Invalid Opcode - KIL 
            .hex 43 5a         ; $f75a: 43 5a     Invalid Opcode - SRE ($5a,x)
            .hex 62            ; $f75c: 62        Invalid Opcode - KIL 
            .hex 22            ; $f75d: 22        Invalid Opcode - KIL 
            .hex e2 5c         ; $f75e: e2 5c     Invalid Opcode - NOP #$5c
            .hex 62            ; $f760: 62        Invalid Opcode - KIL 
            .hex 23 61         ; $f761: 23 61     Invalid Opcode - RLA ($61,x)
            lsr $2162,x        ; $f763: 5e 62 21  
            php                ; $f766: 08        
            ora ($63,x)        ; $f767: 01 63     
            and ($17,x)        ; $f769: 21 17     
            ora ($63,x)        ; $f76b: 01 63     
            and ($a8,x)        ; $f76d: 21 a8     
            ora ($63,x)        ; $f76f: 01 63     
            and ($b7,x)        ; $f771: 21 b7     
            ora ($63,x)        ; $f773: 01 63     
            .hex 22            ; $f775: 22        Invalid Opcode - KIL 
            pha                ; $f776: 48        
            ora ($63,x)        ; $f777: 01 63     
            .hex 22            ; $f779: 22        Invalid Opcode - KIL 
            .hex 57 01         ; $f77a: 57 01     Invalid Opcode - SRE $01,x
            .hex 63 22         ; $f77c: 63 22     Invalid Opcode - RRA ($22,x)
            inx                ; $f77e: e8        
            ora ($63,x)        ; $f77f: 01 63     
            .hex 22            ; $f781: 22        Invalid Opcode - KIL 
            .hex f7 01         ; $f782: f7 01     Invalid Opcode - ISC $01,x
            .hex 63 21         ; $f784: 63 21     Invalid Opcode - RRA ($21,x)
            and $c4            ; $f786: 25 c4     
            .hex 3f 21 29      ; $f788: 3f 21 29  Invalid Opcode - RLA $2921,x
            cpy $3f            ; $f78b: c4 3f     
            and ($36,x)        ; $f78d: 21 36     
            cpy $3f            ; $f78f: c4 3f     
            and ($3a,x)        ; $f791: 21 3a     
            cpy $3f            ; $f793: c4 3f     
            and ($c4,x)        ; $f795: 21 c4     
            cpy $3f            ; $f797: c4 3f     
            and ($d0,x)        ; $f799: 21 d0     
            cpy $3f            ; $f79b: c4 3f     
            and ($db,x)        ; $f79d: 21 db     
            cpy $3f            ; $f79f: c4 3f     
            .hex 22            ; $f7a1: 22        Invalid Opcode - KIL 
            .hex 63 c4         ; $f7a2: 63 c4     Invalid Opcode - RRA ($c4,x)
            .hex 3f 22 6c      ; $f7a4: 3f 22 6c  Invalid Opcode - RLA $6c22,x
            cpy $3f            ; $f7a7: c4 3f     
            .hex 22            ; $f7a9: 22        Invalid Opcode - KIL 
            .hex 73 c4         ; $f7aa: 73 c4     Invalid Opcode - RRA ($c4),y
            .hex 3f 22 7c      ; $f7ac: 3f 22 7c  Invalid Opcode - RLA $7c22,x
            cpy $3f            ; $f7af: c4 3f     
            .hex 23 02         ; $f7b1: 23 02     Invalid Opcode - RLA ($02,x)
            .hex c3 3f         ; $f7b3: c3 3f     Invalid Opcode - DCP ($3f,x)
            .hex 23 0f         ; $f7b5: 23 0f     Invalid Opcode - RLA ($0f,x)
            .hex c3 3f         ; $f7b7: c3 3f     Invalid Opcode - DCP ($3f,x)
            .hex 23            ; $f7b9: 23        Suspected data
__f7ba:     ora $3fc3,x        ; $f7ba: 1d c3 3f  
            .hex 22            ; $f7bd: 22        Invalid Opcode - KIL 
            asl                ; $f7be: 0a        
            .hex 82 6e         ; $f7bf: 82 6e     Invalid Opcode - NOP #$6e
            .hex 6f 22 18      ; $f7c1: 6f 22 18  Invalid Opcode - RRA $1822
            .hex 82 70         ; $f7c4: 82 70     Invalid Opcode - NOP #$70
            adc ($22),y        ; $f7c6: 71 22     
            ora $7282,y        ; $f7c8: 19 82 72  
            .hex 73 00         ; $f7cb: 73 00     Invalid Opcode - RRA ($00),y
            .hex 3f 00 08      ; $f7cd: 3f 00 08  Invalid Opcode - RLA $0800,x
            .hex 0f 15 2c      ; $f7d0: 0f 15 2c  Invalid Opcode - SLO $2c15
            asl $0f            ; $f7d3: 06 0f     
            bmi __f7fe         ; $f7d5: 30 27     
            asl $3f,x          ; $f7d7: 16 3f     
            ora $1203,x        ; $f7d9: 1d 03 12  
            .hex 37 15         ; $f7dc: 37 15     Invalid Opcode - RLA $15,x
            .hex 23 c0         ; $f7de: 23 c0     Invalid Opcode - RLA ($c0,x)
            pha                ; $f7e0: 48        
            .hex ff 23 c9      ; $f7e1: ff 23 c9  Invalid Opcode - ISC __c923,x
            .hex 02            ; $f7e4: 02        Invalid Opcode - KIL 
            tax                ; $f7e5: aa        
            .hex 22            ; $f7e6: 22        Invalid Opcode - KIL 
            .hex 23 cd         ; $f7e7: 23 cd     Invalid Opcode - RLA ($cd,x)
            .hex 43 0f         ; $f7e9: 43 0f     Invalid Opcode - SRE ($0f,x)
            .hex 23 d1         ; $f7eb: 23 d1     Invalid Opcode - RLA ($d1,x)
            .hex 82 84         ; $f7ed: 82 84     Invalid Opcode - NOP #$84
            pha                ; $f7ef: 48        
            .hex 23 d7         ; $f7f0: 23 d7     Invalid Opcode - RLA ($d7,x)
            ora $03            ; $f7f2: 05 03     
            .hex 0c 88 00      ; $f7f4: 0c 88 00  Bad Addr Mode - NOP $0088
            dey                ; $f7f7: 88        
            .hex 23 e1         ; $f7f8: 23 e1     Invalid Opcode - RLA ($e1,x)
            .hex 03 88         ; $f7fa: 03 88     Invalid Opcode - SLO ($88,x)
            brk                ; $f7fc: 00        
            dey                ; $f7fd: 88        
__f7fe:     .hex 23 e9         ; $f7fe: 23 e9     Invalid Opcode - RLA ($e9,x)
            .hex 03 88         ; $f800: 03 88     Invalid Opcode - SLO ($88,x)
            brk                ; $f802: 00        
            dey                ; $f803: 88        
            .hex 23 d3         ; $f804: 23 d3     Invalid Opcode - RLA ($d3,x)
            .hex 82 84         ; $f806: 82 84     Invalid Opcode - NOP #$84
            pha                ; $f808: 48        
            jsr __c72c         ; $f809: 20 2c c7  
            .hex 3f 20 2a      ; $f80c: 3f 20 2a  Invalid Opcode - RLA $2a20,x
            .hex c7 3f         ; $f80f: c7 3f     Invalid Opcode - DCP $3f
            jsr $43ca          ; $f811: 20 ca 43  
            bmi __f836         ; $f814: 30 20     
            lda $3046          ; $f816: ad 46 30  
            jsr __c2d2         ; $f819: 20 d2 c2  
            .hex 3f 21 02      ; $f81c: 3f 21 02  Invalid Opcode - RLA $0221,x
            eor $30,x          ; $f81f: 55 30     
            and ($06,x)        ; $f821: 21 06     
            .hex 02            ; $f823: 02        Invalid Opcode - KIL 
            lsr $215f,x        ; $f824: 5e 5f 21  
            rol $02            ; $f827: 26 02     
            .hex 5c 5d 21      ; $f829: 5c 5d 21  Invalid Opcode - NOP $215d,x
            asl $5e02          ; $f82c: 0e 02 5e  
            .hex 5f 21 2e      ; $f82f: 5f 21 2e  Invalid Opcode - SRE $2e21,x
            .hex 02            ; $f832: 02        Invalid Opcode - KIL 
            .hex 5c 5d 23      ; $f833: 5c 5d 23  Invalid Opcode - NOP $235d,x
__f836:     adc ($5e,x)        ; $f836: 61 5e     
            bmi __f85d         ; $f838: 30 23     
            lsr $02            ; $f83a: 46 02     
            .hex 5c 5d 23      ; $f83c: 5c 5d 23  Invalid Opcode - NOP $235d,x
            ror $02            ; $f83f: 66 02     
            rts                ; $f841: 60        

;-------------------------------------------------------------------------------
            adc ($23,x)        ; $f842: 61 23     
            lsr $5c02          ; $f844: 4e 02 5c  
            eor $6e23,x        ; $f847: 5d 23 6e  
            .hex 02            ; $f84a: 02        Invalid Opcode - KIL 
            rts                ; $f84b: 60        

;-------------------------------------------------------------------------------
            adc ($21,x)        ; $f84c: 61 21     
            lsr $d0            ; $f84e: 46 d0     
            .hex 74 21         ; $f850: 74 21     Invalid Opcode - NOP $21,x
            .hex 47 d0         ; $f852: 47 d0     Invalid Opcode - SRE $d0
            adc $21,x          ; $f854: 75 21     
            .hex 5c 42 30      ; $f856: 5c 42 30  Invalid Opcode - NOP $3042,x
            and ($79,x)        ; $f859: 21 79     
            .hex 42            ; $f85b: 42        Invalid Opcode - KIL 
            .hex 30            ; $f85c: 30        Suspected data
__f85d:     and ($96,x)        ; $f85d: 21 96     
            .hex 42            ; $f85f: 42        Invalid Opcode - KIL 
            bmi __f883         ; $f860: 30 21     
            .hex b2            ; $f862: b2        Invalid Opcode - KIL 
            .hex 43 30         ; $f863: 43 30     Invalid Opcode - SRE ($30,x)
            and ($c2,x)        ; $f865: 21 c2     
            .hex 43 30         ; $f867: 43 30     Invalid Opcode - SRE ($30,x)
            and ($c9,x)        ; $f869: 21 c9     
            .hex 44 30         ; $f86b: 44 30     Invalid Opcode - NOP $30
            and ($f9,x)        ; $f86d: 21 f9     
            eor $30            ; $f86f: 45 30     
            .hex 22            ; $f871: 22        Invalid Opcode - KIL 
            .hex 33 42         ; $f872: 33 42     Invalid Opcode - RLA ($42),y
            bmi __f898         ; $f874: 30 22     
            lsr $42,x          ; $f876: 56 42     
            bmi __f89c         ; $f878: 30 22     
            adc $3042,y        ; $f87a: 79 42 30  
            .hex 22            ; $f87d: 22        Invalid Opcode - KIL 
            .hex 9c 42 30      ; $f87e: 9c 42 30  Invalid Opcode - SHY $3042,x
            .hex 22            ; $f881: 22        Invalid Opcode - KIL 
            .hex 82            ; $f882: 82        Suspected data
__f883:     .hex 43 30         ; $f883: 43 30     Invalid Opcode - SRE ($30,x)
            .hex 22            ; $f885: 22        Invalid Opcode - KIL 
            dex                ; $f886: ca        
            .hex 43 30         ; $f887: 43 30     Invalid Opcode - SRE ($30,x)
            .hex 22            ; $f889: 22        Invalid Opcode - KIL 
            .hex db 43 30      ; $f88a: db 43 30  Invalid Opcode - DCP $3043,y
            .hex 22            ; $f88d: 22        Invalid Opcode - KIL 
            sed                ; $f88e: f8        
            .hex 42            ; $f88f: 42        Invalid Opcode - KIL 
            bmi __f8b5         ; $f890: 30 23     
            ora $42,x          ; $f892: 15 42     
            bmi __f8b9         ; $f894: 30 23     
            .hex 22            ; $f896: 22        Invalid Opcode - KIL 
            .hex 43            ; $f897: 43        Suspected data
__f898:     bmi __f8bd         ; $f898: 30 23     
            and ($43),y        ; $f89a: 31 43     
__f89c:     bmi __f8bf         ; $f89c: 30 21     
            rol $c3,x          ; $f89e: 36 c3     
            .hex 3f 21 7c      ; $f8a0: 3f 21 7c  Invalid Opcode - RLA $7c21,x
            .hex c4            ; $f8a3: c4        Suspected data
__f8a4:     .hex 3f 21 d3      ; $f8a4: 3f 21 d3  Invalid Opcode - RLA __d321,x
            .hex c3 3f         ; $f8a7: c3 3f     Invalid Opcode - DCP ($3f,x)
            and ($e4,x)        ; $f8a9: 21 e4     
            cmp $3f            ; $f8ab: c5 3f     
            and ($ea,x)        ; $f8ad: 21 ea     
            .hex c7 3f         ; $f8af: c7 3f     Invalid Opcode - DCP $3f
            and ($ec,x)        ; $f8b1: 21 ec     
            .hex c7 3f         ; $f8b3: c7 3f     Invalid Opcode - DCP $3f
__f8b5:     .hex 22            ; $f8b5: 22        Invalid Opcode - KIL 
            ora $3fc3,y        ; $f8b6: 19 c3 3f  
__f8b9:     .hex 22            ; $f8b9: 22        Invalid Opcode - KIL 
            .hex a3 c4         ; $f8ba: a3 c4     Invalid Opcode - LAX ($c4,x)
            .hex 3f            ; $f8bc: 3f        Suspected data
__f8bd:     .hex 22            ; $f8bd: 22        Invalid Opcode - KIL 
            .hex bc            ; $f8be: bc        Suspected data
__f8bf:     ora ($3f,x)        ; $f8bf: 01 3f     
            and ($82,x)        ; $f8c1: 21 82     
            .hex 82 70         ; $f8c3: 82 70     Invalid Opcode - NOP #$70
            adc ($21),y        ; $f8c5: 71 21     
            .hex 83 82         ; $f8c7: 83 82     Invalid Opcode - SAX ($82,x)
            .hex 72            ; $f8c9: 72        Invalid Opcode - KIL 
            .hex 73 21         ; $f8ca: 73 21     Invalid Opcode - RRA ($21),y
            ora $6e82,x        ; $f8cc: 1d 82 6e  
            .hex 6f 21 4e      ; $f8cf: 6f 21 4e  Invalid Opcode - RRA $4e21
            bne __f948         ; $f8d2: d0 74     
            and ($4f,x)        ; $f8d4: 21 4f     
            bne __f94d         ; $f8d6: d0 75     
            brk                ; $f8d8: 00        
            .hex 3f 00 0d      ; $f8d9: 3f 00 0d  Invalid Opcode - RLA $0d00,x
            .hex 0f 2c 38      ; $f8dc: 0f 2c 38  Invalid Opcode - SLO $382c
            .hex 12            ; $f8df: 12        Invalid Opcode - KIL 
            .hex 0f 27 27      ; $f8e0: 0f 27 27  Invalid Opcode - SLO $2727
            .hex 27 0f         ; $f8e3: 27 0f     Invalid Opcode - RLA $0f
            bmi __f917         ; $f8e5: 30 30     
            bmi __f8f8         ; $f8e7: 30 0f     
            .hex 3f 11 01      ; $f8e9: 3f 11 01  Invalid Opcode - RLA $0111,x
            and $23            ; $f8ec: 25 23     
            cpx #$50           ; $f8ee: e0 50     
            eor $23,x          ; $f8f0: 55 23     
            beq __f93c         ; $f8f2: f0 48     
            tax                ; $f8f4: aa        
            jsr __c583         ; $f8f5: 20 83 c5  
__f8f8:     .hex 62            ; $f8f8: 62        Invalid Opcode - KIL 
            jsr __c584         ; $f8f9: 20 84 c5  
            .hex 62            ; $f8fc: 62        Invalid Opcode - KIL 
            jsr $0185          ; $f8fd: 20 85 01  
            .hex 62            ; $f900: 62        Invalid Opcode - KIL 
__f901:     and ($05,x)        ; $f901: 21 05     
            ora ($62,x)        ; $f903: 01 62     
            jsr __c3a6         ; $f905: 20 a6 c3  
            .hex 62            ; $f908: 62        Invalid Opcode - KIL 
            jsr __c588         ; $f909: 20 88 c5  
            .hex 62            ; $f90c: 62        Invalid Opcode - KIL 
            jsr $0189          ; $f90d: 20 89 01  
            .hex 62            ; $f910: 62        Invalid Opcode - KIL 
            and ($09,x)        ; $f911: 21 09     
            ora ($62,x)        ; $f913: 01 62     
            .hex 20 8a         ; $f915: 20 8a     Suspected data
__f917:     cmp $62            ; $f917: c5 62     
            jsr __c58c         ; $f919: 20 8c c5  
            .hex 62            ; $f91c: 62        Invalid Opcode - KIL 
            jsr __c2ad         ; $f91d: 20 ad c2  
            .hex 62            ; $f920: 62        Invalid Opcode - KIL 
            jsr __c2ce         ; $f921: 20 ce c2  
            .hex 62            ; $f924: 62        Invalid Opcode - KIL 
            jsr __c58f         ; $f925: 20 8f c5  
            .hex 62            ; $f928: 62        Invalid Opcode - KIL 
            jsr __c591         ; $f929: 20 91 c5  
            .hex 62            ; $f92c: 62        Invalid Opcode - KIL 
            jsr __c2b2         ; $f92d: 20 b2 c2  
            .hex 62            ; $f930: 62        Invalid Opcode - KIL 
            jsr $01b3          ; $f931: 20 b3 01  
            .hex 62            ; $f934: 62        Invalid Opcode - KIL 
            jsr $0194          ; $f935: 20 94 01  
            .hex 62            ; $f938: 62        Invalid Opcode - KIL 
            jsr $01f3          ; $f939: 20 f3 01  
__f93c:     .hex 62            ; $f93c: 62        Invalid Opcode - KIL 
            and ($14,x)        ; $f93d: 21 14     
            ora ($62,x)        ; $f93f: 01 62     
            jsr __c596         ; $f941: 20 96 c5  
            .hex 62            ; $f944: 62        Invalid Opcode - KIL 
            jsr $4297          ; $f945: 20 97 42  
__f948:     .hex 62            ; $f948: 62        Invalid Opcode - KIL 
            jsr $42d7          ; $f949: 20 d7 42  
            .hex 62            ; $f94c: 62        Invalid Opcode - KIL 
__f94d:     and ($17,x)        ; $f94d: 21 17     
            .hex 42            ; $f94f: 42        Invalid Opcode - KIL 
            .hex 62            ; $f950: 62        Invalid Opcode - KIL 
            jsr __c39a         ; $f951: 20 9a c3  
            .hex 62            ; $f954: 62        Invalid Opcode - KIL 
            jsr __c3db         ; $f955: 20 db c3  
            .hex 62            ; $f958: 62        Invalid Opcode - KIL 
            jsr __c39c         ; $f959: 20 9c c3  
            .hex 62            ; $f95c: 62        Invalid Opcode - KIL 
            and ($47,x)        ; $f95d: 21 47     
            cmp $62            ; $f95f: c5 62     
            and ($68,x)        ; $f961: 21 68     
            .hex c2 62         ; $f963: c2 62     Invalid Opcode - NOP #$62
            and ($69,x)        ; $f965: 21 69     
            ora ($62,x)        ; $f967: 01 62     
            and ($4a,x)        ; $f969: 21 4a     
            ora ($62,x)        ; $f96b: 01 62     
            and ($a9,x)        ; $f96d: 21 a9     
            ora ($62,x)        ; $f96f: 01 62     
            and ($ca,x)        ; $f971: 21 ca     
            ora ($62,x)        ; $f973: 01 62     
            and ($4c,x)        ; $f975: 21 4c     
            cmp $62            ; $f977: c5 62     
            and ($4d,x)        ; $f979: 21 4d     
            ora ($62,x)        ; $f97b: 01 62     
            and ($cd,x)        ; $f97d: 21 cd     
            ora ($62,x)        ; $f97f: 01 62     
            and ($4e,x)        ; $f981: 21 4e     
            cmp $62            ; $f983: c5 62     
            and ($50,x)        ; $f985: 21 50     
            cmp $62            ; $f987: c5 62     
            and ($71,x)        ; $f989: 21 71     
            .hex c2 62         ; $f98b: c2 62     Invalid Opcode - NOP #$62
            and ($92,x)        ; $f98d: 21 92     
            .hex c2 62         ; $f98f: c2 62     Invalid Opcode - NOP #$62
            and ($53,x)        ; $f991: 21 53     
            cmp $62            ; $f993: c5 62     
            and ($55,x)        ; $f995: 21 55     
            cmp $62            ; $f997: c5 62     
            and ($56,x)        ; $f999: 21 56     
            .hex 43 62         ; $f99b: 43 62     Invalid Opcode - SRE ($62,x)
            and ($d6,x)        ; $f99d: 21 d6     
            .hex 43 62         ; $f99f: 43 62     Invalid Opcode - SRE ($62,x)
            and ($98,x)        ; $f9a1: 21 98     
            .hex c2 62         ; $f9a3: c2 62     Invalid Opcode - NOP #$62
            and ($97,x)        ; $f9a5: 21 97     
            ora ($62,x)        ; $f9a7: 01 62     
            .hex 22            ; $f9a9: 22        Invalid Opcode - KIL 
            ora #$0f           ; $f9aa: 09 0f     
            ora ($24,x)        ; $f9ac: 01 24     
            ora $0a15,y        ; $f9ae: 19 15 0a  
            .hex 22            ; $f9b1: 22        Invalid Opcode - KIL 
            asl $241b          ; $f9b2: 0e 1b 24  
            bpl __f9c1         ; $f9b5: 10 0a     
            asl $0e,x          ; $f9b7: 16 0e     
            bit $0a            ; $f9b9: 24 0a     
            .hex 22            ; $f9bb: 22        Invalid Opcode - KIL 
            eor #$0f           ; $f9bc: 49 0f     
            ora ($24,x)        ; $f9be: 01 24     
            .hex 19            ; $f9c0: 19        Suspected data
__f9c1:     ora $0a,x          ; $f9c1: 15 0a     
            .hex 22            ; $f9c3: 22        Invalid Opcode - KIL 
            asl $241b          ; $f9c4: 0e 1b 24  
            bpl __f9d3         ; $f9c7: 10 0a     
            asl $0e,x          ; $f9c9: 16 0e     
            bit $0b            ; $f9cb: 24 0b     
            .hex 22            ; $f9cd: 22        Invalid Opcode - KIL 
            .hex 89 0f         ; $f9ce: 89 0f     Invalid Opcode - NOP #$0f
            .hex 02            ; $f9d0: 02        Invalid Opcode - KIL 
            bit $19            ; $f9d1: 24 19     
__f9d3:     ora $0a,x          ; $f9d3: 15 0a     
            .hex 22            ; $f9d5: 22        Invalid Opcode - KIL 
            asl $241b          ; $f9d6: 0e 1b 24  
            bpl __f9e5         ; $f9d9: 10 0a     
            asl $0e,x          ; $f9db: 16 0e     
            bit $0a            ; $f9dd: 24 0a     
            .hex 22            ; $f9df: 22        Invalid Opcode - KIL 
            cmp #$0f           ; $f9e0: c9 0f     
            .hex 02            ; $f9e2: 02        Invalid Opcode - KIL 
            bit $19            ; $f9e3: 24 19     
__f9e5:     ora $0a,x          ; $f9e5: 15 0a     
            .hex 22            ; $f9e7: 22        Invalid Opcode - KIL 
            asl $241b          ; $f9e8: 0e 1b 24  
            bpl __f9f7         ; $f9eb: 10 0a     
            asl $0e,x          ; $f9ed: 16 0e     
            bit $0b            ; $f9ef: 24 0b     
            .hex 23 05         ; $f9f1: 23 05     Invalid Opcode - RLA ($05,x)
            asl $d3,x          ; $f9f3: 16 d3     
            ora ($09,x)        ; $f9f5: 01 09     
__f9f7:     php                ; $f9f7: 08        
            ora ($24,x)        ; $f9f8: 01 24     
            .hex 17 12         ; $f9fa: 17 12     Invalid Opcode - SLO $12,x
            .hex 17 1d         ; $f9fc: 17 1d     Invalid Opcode - SLO $1d,x
            asl $0d17          ; $f9fe: 0e 17 0d  
            clc                ; $fa01: 18        
            bit $0c            ; $fa02: 24 0c     
            clc                ; $fa04: 18        
            adc $15            ; $fa05: 65 15     
            ora $640d,x        ; $fa07: 1d 0d 64  
            .hex 23 4b         ; $fa0a: 23 4b     Invalid Opcode - RLA ($4b,x)
            ora $0a16          ; $fa0c: 0d 16 0a  
            ora $240e          ; $fa0f: 0d 0e 24  
            .hex 12            ; $fa12: 12        Invalid Opcode - KIL 
            .hex 17 24         ; $fa13: 17 24     Invalid Opcode - SLO $24,x
            .hex 13 0a         ; $fa15: 13 0a     Invalid Opcode - SLO ($0a),y
            ora $170a,y        ; $fa17: 19 0a 17  
            brk                ; $fa1a: 00        
            jsr $0163          ; $fa1b: 20 63 01  
            .hex ff 20 6d      ; $fa1e: ff 20 6d  Invalid Opcode - ISC $6d20,x
            .hex 03 d0         ; $fa21: 03 d0     Invalid Opcode - SLO ($d0,x)
            cmp ($d2),y        ; $fa23: d1 d2     
            jsr $0276          ; $fa25: 20 76 02  
            inc $20ff,x        ; $fa28: fe ff 20  
            sty $0a,x          ; $fa2b: 94 0a     
            and $16            ; $fa2d: 25 16     
            rol                ; $fa2f: 2a        
            rol $27            ; $fa30: 26 27     
            plp                ; $fa32: 28        
            and #$2a           ; $fa33: 29 2a     
            ora $2d,x          ; $fa35: 15 2d     
            jsr $0ab4          ; $fa37: 20 b4 0a  
            .hex 2b 24         ; $fa3a: 2b 24     Invalid Opcode - ANC #$24
            bit $2424          ; $fa3c: 2c 24 24  
            bit $24            ; $fa3f: 24 24     
            bit $2f24          ; $fa41: 2c 24 2f  
            brk                ; $fa44: 00        
            .hex ff ff ff      ; $fa45: ff ff ff  Invalid Opcode - ISC $ffff,x
__fa48:     lda #$c0           ; $fa48: a9 c0     
            sta $4017          ; $fa4a: 8d 17 40  
            jsr __fbf2         ; $fa4d: 20 f2 fb  
            ldx #$00           ; $fa50: a2 00     
            stx $ff            ; $fa52: 86 ff     
            stx $fe            ; $fa54: 86 fe     
            stx $fd            ; $fa56: 86 fd     
            lda $06f0          ; $fa58: ad f0 06  
            cmp #$90           ; $fa5b: c9 90     
            bcs __fa64         ; $fa5d: b0 05     
            ldx #$00           ; $fa5f: a2 00     
            stx $06f1          ; $fa61: 8e f1 06  
__fa64:     cmp #$d8           ; $fa64: c9 d8     
            bcc __fa6b         ; $fa66: 90 03     
            inc $06f1          ; $fa68: ee f1 06  
__fa6b:     tay                ; $fa6b: a8        
            lsr                ; $fa6c: 4a        
            lsr                ; $fa6d: 4a        
            lsr                ; $fa6e: 4a        
            lsr                ; $fa6f: 4a        
            lsr                ; $fa70: 4a        
            lsr                ; $fa71: 4a        
            sta $00            ; $fa72: 85 00     
            tya                ; $fa74: 98        
            ldx $06f1          ; $fa75: ae f1 06  
            bne __fa7f         ; $fa78: d0 05     
            sec                ; $fa7a: 38        
            adc $00            ; $fa7b: 65 00     
            bne __fa82         ; $fa7d: d0 03     
__fa7f:     clc                ; $fa7f: 18        
            sbc $00            ; $fa80: e5 00     
__fa82:     sta $06f0          ; $fa82: 8d f0 06  
            rts                ; $fa85: 60        

;-------------------------------------------------------------------------------
__fa86:     ldy #$07           ; $fa86: a0 07     
__fa88:     asl                ; $fa88: 0a        
            bcs __fa8e         ; $fa89: b0 03     
            dey                ; $fa8b: 88        
            bne __fa88         ; $fa8c: d0 fa     
__fa8e:     rts                ; $fa8e: 60        

;-------------------------------------------------------------------------------
__fa8f:     sta $f1            ; $fa8f: 85 f1     
            sty $f2            ; $fa91: 84 f2     
__fa93:     ldy #$7f           ; $fa93: a0 7f     
__fa95:     stx $4000          ; $fa95: 8e 00 40  
            sty $4001          ; $fa98: 8c 01 40  
            rts                ; $fa9b: 60        

;-------------------------------------------------------------------------------
            jsr __fa95         ; $fa9c: 20 95 fa  
__fa9f:     ldx #$00           ; $fa9f: a2 00     
__faa1:     tay                ; $faa1: a8        
            lda __fb01,y       ; $faa2: b9 01 fb  
            beq __fab2         ; $faa5: f0 0b     
            sta $4002,x        ; $faa7: 9d 02 40  
            lda __fb00,y       ; $faaa: b9 00 fb  
            ora #$08           ; $faad: 09 08     
            sta $4003,x        ; $faaf: 9d 03 40  
__fab2:     rts                ; $fab2: 60        

;-------------------------------------------------------------------------------
__fab3:     sty $4005          ; $fab3: 8c 05 40  
            ldx #$04           ; $fab6: a2 04     
            bne __faa1         ; $fab8: d0 e7     
__faba:     sta $4008          ; $faba: 8d 08 40  
            txa                ; $fabd: 8a        
            and #$3e           ; $fabe: 29 3e     
            ldx #$08           ; $fac0: a2 08     
            bne __faa1         ; $fac2: d0 dd     
__fac4:     tax                ; $fac4: aa        
            ror                ; $fac5: 6a        
            txa                ; $fac6: 8a        
            rol                ; $fac7: 2a        
            rol                ; $fac8: 2a        
            rol                ; $fac9: 2a        
__faca:     and #$07           ; $faca: 29 07     
            clc                ; $facc: 18        
            adc $068d          ; $facd: 6d 8d 06  
            tay                ; $fad0: a8        
            lda __fb4c,y       ; $fad1: b9 4c fb  
            rts                ; $fad4: 60        

;-------------------------------------------------------------------------------
__fad5:     tya                ; $fad5: 98        
            lsr                ; $fad6: 4a        
__fad7:     lsr                ; $fad7: 4a        
            lsr                ; $fad8: 4a        
            sta $00            ; $fad9: 85 00     
            tya                ; $fadb: 98        
            sec                ; $fadc: 38        
            sbc $00            ; $fadd: e5 00     
            rts                ; $fadf: 60        

;-------------------------------------------------------------------------------
__fae0:     lda #$90           ; $fae0: a9 90     
            sta $4000          ; $fae2: 8d 00 40  
__fae5:     rts                ; $fae5: 60        

;-------------------------------------------------------------------------------
            sta $8c8d          ; $fae6: 8d 8d 8c  
            sty $8c8b          ; $fae9: 8c 8b 8c  
            .hex 83 83         ; $faec: 83 83     Invalid Opcode - SAX ($83,x)
            .hex 8f 8f 8f      ; $faee: 8f 8f 8f  Invalid Opcode - SAX $8f8f
            .hex 8f 8d 85      ; $faf1: 8f 8d 85  Invalid Opcode - SAX $858d
            .hex 84            ; $faf4: 84        Suspected data
__faf5:     sta $7f            ; $faf5: 85 7f     
            sta $85            ; $faf7: 85 85     
            sta $7f            ; $faf9: 85 7f     
            sta $8d8d          ; $fafb: 8d 8d 8d  
            .hex 8d 8d         ; $fafe: 8d 8d     Suspected data
__fb00:     .hex 07            ; $fb00: 07        Suspected data
__fb01:     beq __fb03         ; $fb01: f0 00     
__fb03:     brk                ; $fb03: 00        
            brk                ; $fb04: 00        
            adc #$00           ; $fb05: 69 00     
            .hex 53 00         ; $fb07: 53 00     Invalid Opcode - SRE ($00),y
            lsr $00            ; $fb09: 46 00     
            .hex d4 00         ; $fb0b: d4 00     Invalid Opcode - NOP $00,x
            .hex bd 00         ; $fb0d: bd 00     Suspected data
__fb0f:     tay                ; $fb0f: a8        
            brk                ; $fb10: 00        
            .hex 9f 00 8d      ; $fb11: 9f 00 8d  Invalid Opcode - AHX $8d00,y
            brk                ; $fb14: 00        
            ror $ab01,x        ; $fb15: 7e 01 ab  
            ora ($7c,x)        ; $fb18: 01 7c     
            ora ($52,x)        ; $fb1a: 01 52     
            ora ($3f,x)        ; $fb1c: 01 3f     
            ora ($1c,x)        ; $fb1e: 01 1c     
            brk                ; $fb20: 00        
            sbc __ee00,x       ; $fb21: fd 00 ee  
            brk                ; $fb24: 00        
            sbc ($03,x)        ; $fb25: e1 03     
            .hex 57 02         ; $fb27: 57 02     Invalid Opcode - SRE $02,x
            sbc __cf02,y       ; $fb29: f9 02 cf  
            .hex 02            ; $fb2c: 02        Invalid Opcode - KIL 
            ldx $02            ; $fb2d: a6 02     
            .hex 80 02         ; $fb2f: 80 02     Invalid Opcode - NOP #$02
            .hex 3a            ; $fb31: 3a        Invalid Opcode - NOP 
            .hex 02            ; $fb32: 02        Invalid Opcode - KIL 
            .hex 1a            ; $fb33: 1a        Invalid Opcode - NOP 
            ora ($fc,x)        ; $fb34: 01 fc     
            ora ($df,x)        ; $fb36: 01 df     
            ora ($c4,x)        ; $fb38: 01 c4     
            asl $ae            ; $fb3a: 06 ae     
            ora $9e            ; $fb3c: 05 9e     
            ora $4d            ; $fb3e: 05 4d     
            ora $01            ; $fb40: 05 01     
            .hex 04 75         ; $fb42: 04 75     Invalid Opcode - NOP $75
            .hex 04 35         ; $fb44: 04 35     Invalid Opcode - NOP $35
            .hex 03 f8         ; $fb46: 03 f8     Invalid Opcode - SLO ($f8,x)
            .hex 03 bf         ; $fb48: 03 bf     Invalid Opcode - SLO ($bf,x)
            .hex 03 89         ; $fb4a: 03 89     Invalid Opcode - SLO ($89,x)
__fb4c:     ora $0a            ; $fb4c: 05 0a     
            .hex 14 28         ; $fb4e: 14 28     Invalid Opcode - NOP $28,x
            bvc __fb70         ; $fb50: 50 1e     
            .hex 3c 0b 06      ; $fb52: 3c 0b 06  Invalid Opcode - NOP $060b,x
            .hex 0c 18 30      ; $fb55: 0c 18 30  Invalid Opcode - NOP $3018
            rts                ; $fb58: 60        

;-------------------------------------------------------------------------------
            bit $48            ; $fb59: 24 48     
            .hex 07 0d         ; $fb5b: 07 0d     Invalid Opcode - SLO $0d
            .hex 1a            ; $fb5d: 1a        Invalid Opcode - NOP 
            .hex 34 78         ; $fb5e: 34 78     Invalid Opcode - NOP $78,x
            .hex 27 4e         ; $fb60: 27 4e     Invalid Opcode - RLA $4e
__fb62:     asl                ; $fb62: 0a        
            php                ; $fb63: 08        
            ora $0a            ; $fb64: 05 0a     
            .hex 09            ; $fb66: 09        Suspected data
__fb67:     bvc __fba9         ; $fb67: 50 40     
            lsr $4a            ; $fb69: 46 4a     
            bvc __fbc3         ; $fb6b: 50 56     
            .hex 5c 64 6c      ; $fb6d: 5c 64 6c  Invalid Opcode - NOP $6c64,x
__fb70:     .hex 74 7c         ; $fb70: 74 7c     Invalid Opcode - NOP $7c,x
            dey                ; $fb72: 88        
            bcc __fb0f         ; $fb73: 90 9a     
__fb75:     sta $f0            ; $fb75: 85 f0     
            sta $fb            ; $fb77: 85 fb     
            ldy #$08           ; $fb79: a0 08     
            jmp __fd67         ; $fb7b: 4c 67 fd  

;-------------------------------------------------------------------------------
            sty $f0            ; $fb7e: 84 f0     
            lda #$71           ; $fb80: a9 71     
            ldy #$00           ; $fb82: a0 00     
            ldx #$9f           ; $fb84: a2 9f     
            jsr __fa8f         ; $fb86: 20 8f fa  
__fb89:     ldx $f2            ; $fb89: a6 f2     
            ldy __fb67,x       ; $fb8b: bc 67 fb  
            dec $f1            ; $fb8e: c6 f1     
            lda $f1            ; $fb90: a5 f1     
            beq __fb75         ; $fb92: f0 e1     
            and #$07           ; $fb94: 29 07     
            bne __fba0         ; $fb96: d0 08     
            tya                ; $fb98: 98        
            lsr                ; $fb99: 4a        
            adc __fb67,x       ; $fb9a: 7d 67 fb  
            tay                ; $fb9d: a8        
            bne __fba7         ; $fb9e: d0 07     
__fba0:     and #$03           ; $fba0: 29 03     
            bne __fbb2         ; $fba2: d0 0e     
            inc $f2            ; $fba4: e6 f2     
            clc                ; $fba6: 18        
__fba7:     .hex 8c 02         ; $fba7: 8c 02     Suspected data
__fba9:     rti                ; $fba9: 40        

;-------------------------------------------------------------------------------
            ldy #$28           ; $fbaa: a0 28     
            bcc __fbaf         ; $fbac: 90 01     
            iny                ; $fbae: c8        
__fbaf:     sty $4003          ; $fbaf: 8c 03 40  
__fbb2:     lda #$00           ; $fbb2: a9 00     
            jmp __fe00         ; $fbb4: 4c 00 fe  

;-------------------------------------------------------------------------------
__fbb7:     sty $f0            ; $fbb7: 84 f0     
            lda #$54           ; $fbb9: a9 54     
            ldy #$6a           ; $fbbb: a0 6a     
            ldx #$9c           ; $fbbd: a2 9c     
            jsr __fa8f         ; $fbbf: 20 8f fa  
__fbc2:     .hex a4            ; $fbc2: a4        Suspected data
__fbc3:     .hex f2            ; $fbc3: f2        Invalid Opcode - KIL 
            lda $f1            ; $fbc4: a5 f1     
            and #$03           ; $fbc6: 29 03     
            beq __fbd4         ; $fbc8: f0 0a     
            cmp #$03           ; $fbca: c9 03     
            bne __fbd9         ; $fbcc: d0 0b     
            jsr __fad5         ; $fbce: 20 d5 fa  
            sta $f2            ; $fbd1: 85 f2     
            tay                ; $fbd3: a8        
__fbd4:     tya                ; $fbd4: 98        
            lsr                ; $fbd5: 4a        
            adc $f2            ; $fbd6: 65 f2     
            tay                ; $fbd8: a8        
__fbd9:     tya                ; $fbd9: 98        
            rol                ; $fbda: 2a        
            rol                ; $fbdb: 2a        
            rol                ; $fbdc: 2a        
            sta $4002          ; $fbdd: 8d 02 40  
            rol                ; $fbe0: 2a        
            sta $4003          ; $fbe1: 8d 03 40  
            lda $f1            ; $fbe4: a5 f1     
            cmp #$18           ; $fbe6: c9 18     
            bcs __fc44         ; $fbe8: b0 5a     
            lsr                ; $fbea: 4a        
            ora #$90           ; $fbeb: 09 90     
            sta $4000          ; $fbed: 8d 00 40  
            bne __fc44         ; $fbf0: d0 52     
__fbf2:     ldy $ff            ; $fbf2: a4 ff     
            lda $f0            ; $fbf4: a5 f0     
            lsr                ; $fbf6: 4a        
            bcs __fb89         ; $fbf7: b0 90     
            .hex 46            ; $fbf9: 46        Suspected data
__fbfa:     .hex ff b0 81      ; $fbfa: ff b0 81  Invalid Opcode - ISC $81b0,x
            ldx $fa            ; $fbfd: a6 fa     
            bne __fc4b         ; $fbff: d0 4a     
            lsr                ; $fc01: 4a        
            bcs __fbc2         ; $fc02: b0 be     
            lsr $ff            ; $fc04: 46 ff     
            bcs __fbb7         ; $fc06: b0 af     
            lsr                ; $fc08: 4a        
            bcs __fc28         ; $fc09: b0 1d     
            lsr $ff            ; $fc0b: 46 ff     
            bcs __fc19         ; $fc0d: b0 0a     
            lsr                ; $fc0f: 4a        
            bcs __fc62         ; $fc10: b0 50     
            lsr $ff            ; $fc12: 46 ff     
            bcs __fc51         ; $fc14: b0 3b     
__fc16:     jmp __fc90         ; $fc16: 4c 90 fc  

;-------------------------------------------------------------------------------
__fc19:     sty $f0            ; $fc19: 84 f0     
            lda #$22           ; $fc1b: a9 22     
            sta $f1            ; $fc1d: 85 f1     
            ldy #$0b           ; $fc1f: a0 0b     
            sty $f2            ; $fc21: 84 f2     
            lda #$20           ; $fc23: a9 20     
            jsr __fa9f         ; $fc25: 20 9f fa  
__fc28:     dec $f2            ; $fc28: c6 f2     
            bne __fc30         ; $fc2a: d0 04     
            lda #$07           ; $fc2c: a9 07     
            sta $f2            ; $fc2e: 85 f2     
__fc30:     ldx $f2            ; $fc30: a6 f2     
            ldy __faf5,x       ; $fc32: bc f5 fa  
            ldx #$5a           ; $fc35: a2 5a     
            lda $f1            ; $fc37: a5 f1     
            cmp #$14           ; $fc39: c9 14     
            bcs __fc41         ; $fc3b: b0 04     
            lsr                ; $fc3d: 4a        
            ora #$50           ; $fc3e: 09 50     
            tax                ; $fc40: aa        
__fc41:     jsr __fa95         ; $fc41: 20 95 fa  
__fc44:     dec $f1            ; $fc44: c6 f1     
            bne __fc16         ; $fc46: d0 ce     
            jsr __fae0         ; $fc48: 20 e0 fa  
__fc4b:     lda #$00           ; $fc4b: a9 00     
            sta $f0            ; $fc4d: 85 f0     
            beq __fc16         ; $fc4f: f0 c5     
__fc51:     sty $f0            ; $fc51: 84 f0     
            lda #$0a           ; $fc53: a9 0a     
            sta $f1            ; $fc55: 85 f1     
            ldy $06f0          ; $fc57: ac f0 06  
            sty $4002          ; $fc5a: 8c 02 40  
            lda #$88           ; $fc5d: a9 88     
            sta $4003          ; $fc5f: 8d 03 40  
__fc62:     lda $18            ; $fc62: a5 18     
            and #$08           ; $fc64: 29 08     
            clc                ; $fc66: 18        
            adc $f1            ; $fc67: 65 f1     
            adc #$fe           ; $fc69: 69 fe     
            tax                ; $fc6b: aa        
            ldy __fae5,x       ; $fc6c: bc e5 fa  
            ldx #$41           ; $fc6f: a2 41     
            bne __fc41         ; $fc71: d0 ce     
__fc73:     lda #$0e           ; $fc73: a9 0e     
            sta $06a5          ; $fc75: 8d a5 06  
            ldy #$85           ; $fc78: a0 85     
            lda #$46           ; $fc7a: a9 46     
            jsr __fab3         ; $fc7c: 20 b3 fa  
__fc7f:     dec $06a5          ; $fc7f: ce a5 06  
            beq __fc9d         ; $fc82: f0 19     
            lda $06a5          ; $fc84: ad a5 06  
            ora #$90           ; $fc87: 09 90     
            tay                ; $fc89: a8        
            dey                ; $fc8a: 88        
            sty $4004          ; $fc8b: 8c 04 40  
            bne __fc9d         ; $fc8e: d0 0d     
__fc90:     lda $f3            ; $fc90: a5 f3     
            bne __fc9d         ; $fc92: d0 09     
            lda $06a5          ; $fc94: ad a5 06  
            bne __fc7f         ; $fc97: d0 e6     
            ldy $fe            ; $fc99: a4 fe     
            bmi __fc73         ; $fc9b: 30 d6     
__fc9d:     lda $fc            ; $fc9d: a5 fc     
            bne __fd0b         ; $fc9f: d0 6a     
            lda $f9            ; $fca1: a5 f9     
            bne __fd0b         ; $fca3: d0 66     
            ldy $fe            ; $fca5: a4 fe     
            lda $06a1          ; $fca7: ad a1 06  
            lsr $fe            ; $fcaa: 46 fe     
            bcs __fcba         ; $fcac: b0 0c     
            lsr                ; $fcae: 4a        
            bcs __fcbe         ; $fcaf: b0 0d     
            lsr                ; $fcb1: 4a        
            bcs __fcf0         ; $fcb2: b0 3c     
            lsr $fe            ; $fcb4: 46 fe     
            bcs __fcdb         ; $fcb6: b0 23     
            bcc __fd0b         ; $fcb8: 90 51     
__fcba:     lda #$28           ; $fcba: a9 28     
            bne __fcdd         ; $fcbc: d0 1f     
__fcbe:     lda $f5            ; $fcbe: a5 f5     
            bne __fcc6         ; $fcc0: d0 04     
            lsr $fe            ; $fcc2: 46 fe     
            bcs __fcdb         ; $fcc4: b0 15     
__fcc6:     lda $f6            ; $fcc6: a5 f6     
            lsr                ; $fcc8: 4a        
            lsr                ; $fcc9: 4a        
            lsr                ; $fcca: 4a        
            lsr                ; $fccb: 4a        
            lsr                ; $fccc: 4a        
            adc $f6            ; $fccd: 65 f6     
            bcc __fd00         ; $fccf: 90 2f     
__fcd1:     lda #$00           ; $fcd1: a9 00     
            sta $06a1          ; $fcd3: 8d a1 06  
            sta $4008          ; $fcd6: 8d 08 40  
            beq __fd0b         ; $fcd9: f0 30     
__fcdb:     lda #$fe           ; $fcdb: a9 fe     
__fcdd:     sty $06a1          ; $fcdd: 8c a1 06  
            ldx #$0e           ; $fce0: a2 0e     
            stx $f5            ; $fce2: 86 f5     
            ldy #$ff           ; $fce4: a0 ff     
            sty $4008          ; $fce6: 8c 08 40  
            ldy #$08           ; $fce9: a0 08     
            sty $400b          ; $fceb: 8c 0b 40  
            bne __fd00         ; $fcee: d0 10     
__fcf0:     lda #$fe           ; $fcf0: a9 fe     
            ldy $f5            ; $fcf2: a4 f5     
            beq __fcd1         ; $fcf4: f0 db     
            cpy #$07           ; $fcf6: c0 07     
            beq __fd00         ; $fcf8: f0 06     
            lda $f6            ; $fcfa: a5 f6     
            tay                ; $fcfc: a8        
            jsr __fad7         ; $fcfd: 20 d7 fa  
__fd00:     sta $f6            ; $fd00: 85 f6     
            sta $400a          ; $fd02: 8d 0a 40  
            lda $f5            ; $fd05: a5 f5     
            beq __fd0b         ; $fd07: f0 02     
            dec $f5            ; $fd09: c6 f5     
__fd0b:     ldx $fa            ; $fd0b: a6 fa     
            bne __fd58         ; $fd0d: d0 49     
            lda $fc            ; $fd0f: a5 fc     
            bne __fd18         ; $fd11: d0 05     
            sta $06a3          ; $fd13: 8d a3 06  
            beq __fd58         ; $fd16: f0 40     
__fd18:     eor $06a3          ; $fd18: 4d a3 06  
            beq __fd35         ; $fd1b: f0 18     
__fd1d:     lda $fc            ; $fd1d: a5 fc     
            sta $06a3          ; $fd1f: 8d a3 06  
            jsr __fa86         ; $fd22: 20 86 fa  
            lda __ffcd,y       ; $fd25: b9 cd ff  
            sta $0680          ; $fd28: 8d 80 06  
            lda #$d4           ; $fd2b: a9 d4     
            sta $f5            ; $fd2d: 85 f5     
            lda #$ff           ; $fd2f: a9 ff     
            sta $f6            ; $fd31: 85 f6     
            bne __fd3a         ; $fd33: d0 05     
__fd35:     dec $0698          ; $fd35: ce 98 06  
            bne __fd58         ; $fd38: d0 1e     
__fd3a:     ldy $0680          ; $fd3a: ac 80 06  
            inc $0680          ; $fd3d: ee 80 06  
            lda ($f5),y        ; $fd40: b1 f5     
            beq __fd1d         ; $fd42: f0 d9     
            tax                ; $fd44: aa        
            ror                ; $fd45: 6a        
            txa                ; $fd46: 8a        
            rol                ; $fd47: 2a        
            rol                ; $fd48: 2a        
            rol                ; $fd49: 2a        
            and #$07           ; $fd4a: 29 07     
            tay                ; $fd4c: a8        
            lda __fb62,y       ; $fd4d: b9 62 fb  
            sta $0698          ; $fd50: 8d 98 06  
            lda #$10           ; $fd53: a9 10     
            jsr __faba         ; $fd55: 20 ba fa  
__fd58:     lda $fd            ; $fd58: a5 fd     
            bne __fd62         ; $fd5a: d0 06     
            lda $0102          ; $fd5c: ad 02 01  
            bne __fd9b         ; $fd5f: d0 3a     
            rts                ; $fd61: 60        

;-------------------------------------------------------------------------------
__fd62:     jsr __fa86         ; $fd62: 20 86 fa  
            sty $fb            ; $fd65: 84 fb     
__fd67:     lda __fe59,y       ; $fd67: b9 59 fe  
            tay                ; $fd6a: a8        
            lda __fe59,y       ; $fd6b: b9 59 fe  
            sta $068d          ; $fd6e: 8d 8d 06  
            lda __fe5a,y       ; $fd71: b9 5a fe  
            sta $f7            ; $fd74: 85 f7     
            lda __fe5b,y       ; $fd76: b9 5b fe  
            sta $f8            ; $fd79: 85 f8     
            lda __fe5c,y       ; $fd7b: b9 5c fe  
            sta $f9            ; $fd7e: 85 f9     
            lda __fe5d,y       ; $fd80: b9 5d fe  
            sta $fa            ; $fd83: 85 fa     
            lda #$01           ; $fd85: a9 01     
            sta $0695          ; $fd87: 8d 95 06  
            sta $0696          ; $fd8a: 8d 96 06  
            sta $0698          ; $fd8d: 8d 98 06  
            sta $0102          ; $fd90: 8d 02 01  
            ldy #$00           ; $fd93: a0 00     
            sty $f3            ; $fd95: 84 f3     
            lda $fb            ; $fd97: a5 fb     
            beq __fda4         ; $fd99: f0 09     
__fd9b:     ldy $fa            ; $fd9b: a4 fa     
            beq __fdd8         ; $fd9d: f0 39     
            dec $0696          ; $fd9f: ce 96 06  
            bne __fdd8         ; $fda2: d0 34     
__fda4:     inc $fa            ; $fda4: e6 fa     
            lda ($f7),y        ; $fda6: b1 f7     
            beq __fde9         ; $fda8: f0 3f     
            bpl __fdb8         ; $fdaa: 10 0c     
            jsr __faca         ; $fdac: 20 ca fa  
            sta $0691          ; $fdaf: 8d 91 06  
            ldy $fa            ; $fdb2: a4 fa     
            inc $fa            ; $fdb4: e6 fa     
            lda ($f7),y        ; $fdb6: b1 f7     
__fdb8:     jsr __fa9f         ; $fdb8: 20 9f fa  
            bne __fdc1         ; $fdbb: d0 04     
            ldy #$10           ; $fdbd: a0 10     
            bne __fdcf         ; $fdbf: d0 0e     
__fdc1:     ldx #$9f           ; $fdc1: a2 9f     
            lda $fb            ; $fdc3: a5 fb     
            beq __fdcf         ; $fdc5: f0 08     
            ldx #$06           ; $fdc7: a2 06     
            lda $f9            ; $fdc9: a5 f9     
            bne __fdcf         ; $fdcb: d0 02     
            ldx #$86           ; $fdcd: a2 86     
__fdcf:     jsr __fa93         ; $fdcf: 20 93 fa  
            lda $0691          ; $fdd2: ad 91 06  
            sta $0696          ; $fdd5: 8d 96 06  
__fdd8:     lda $fb            ; $fdd8: a5 fb     
            beq __fe31         ; $fdda: f0 55     
            dec $0695          ; $fddc: ce 95 06  
            bne __fe31         ; $fddf: d0 50     
            ldy $f3            ; $fde1: a4 f3     
            inc $f3            ; $fde3: e6 f3     
            lda ($f7),y        ; $fde5: b1 f7     
            bne __fe09         ; $fde7: d0 20     
__fde9:     jsr __fae0         ; $fde9: 20 e0 fa  
            lda #$00           ; $fdec: a9 00     
            sta $fa            ; $fdee: 85 fa     
            sta $f3            ; $fdf0: 85 f3     
            sta $f9            ; $fdf2: 85 f9     
            sta $0102          ; $fdf4: 8d 02 01  
            ldy $fb            ; $fdf7: a4 fb     
            beq __fe00         ; $fdf9: f0 05     
            ldy $06a1          ; $fdfb: ac a1 06  
            bne __fe03         ; $fdfe: d0 03     
__fe00:     sta $4008          ; $fe00: 8d 08 40  
__fe03:     lda #$10           ; $fe03: a9 10     
            sta $4004          ; $fe05: 8d 04 40  
            rts                ; $fe08: 60        

;-------------------------------------------------------------------------------
__fe09:     jsr __fac4         ; $fe09: 20 c4 fa  
            sta $0695          ; $fe0c: 8d 95 06  
            txa                ; $fe0f: 8a        
            and #$3e           ; $fe10: 29 3e     
            ldy #$7f           ; $fe12: a0 7f     
            jsr __fab3         ; $fe14: 20 b3 fa  
            bne __fe1d         ; $fe17: d0 04     
            ldx #$10           ; $fe19: a2 10     
            bne __fe2e         ; $fe1b: d0 11     
__fe1d:     ldx #$89           ; $fe1d: a2 89     
            lda $0695          ; $fe1f: ad 95 06  
            cmp #$18           ; $fe22: c9 18     
            bcs __fe2e         ; $fe24: b0 08     
            ldx #$86           ; $fe26: a2 86     
            cmp #$10           ; $fe28: c9 10     
            bcs __fe2e         ; $fe2a: b0 02     
            ldx #$84           ; $fe2c: a2 84     
__fe2e:     stx $4004          ; $fe2e: 8e 04 40  
__fe31:     ldy $f9            ; $fe31: a4 f9     
            beq __fe58         ; $fe33: f0 23     
            dec $0698          ; $fe35: ce 98 06  
            bne __fe58         ; $fe38: d0 1e     
            inc $f9            ; $fe3a: e6 f9     
            lda ($f7),y        ; $fe3c: b1 f7     
            jsr __fac4         ; $fe3e: 20 c4 fa  
            .hex 8d            ; $fe41: 8d        Suspected data
__fe42:     tya                ; $fe42: 98        
            asl $18            ; $fe43: 06 18     
__fe45:     adc #$fe           ; $fe45: 69 fe     
            asl                ; $fe47: 0a        
            asl                ; $fe48: 0a        
            cmp #$38           ; $fe49: c9 38     
            bcc __fe4f         ; $fe4b: 90 02     
            lda #$38           ; $fe4d: a9 38     
__fe4f:     ldy $fb            ; $fe4f: a4 fb     
            bne __fe55         ; $fe51: d0 02     
            lda #$ff           ; $fe53: a9 ff     
__fe55:     jsr __faba         ; $fe55: 20 ba fa  
__fe58:     rts                ; $fe58: 60        

;-------------------------------------------------------------------------------
__fe59:     .hex 09            ; $fe59: 09        Suspected data
__fe5a:     .hex 0e            ; $fe5a: 0e        Suspected data
__fe5b:     .hex 13            ; $fe5b: 13        Suspected data
__fe5c:     clc                ; $fe5c: 18        
__fe5d:     ora $2722,x        ; $fe5d: 1d 22 27  
            .hex 2c 31 00      ; $fe60: 2c 31 00  Bad Addr Mode - BIT $0031
            .hex 8f fe 1b      ; $fe63: 8f fe 1b  Invalid Opcode - SAX $1bfe
            brk                ; $fe66: 00        
            php                ; $fe67: 08        
__fe68:     bcs __fe68         ; $fe68: b0 fe     
            brk                ; $fe6a: 00        
            .hex 0c 00 cf      ; $fe6b: 0c 00 cf  Invalid Opcode - NOP __cf00
            inc $1a00,x        ; $fe6e: fe 00 1a  
            php                ; $fe71: 08        
            ora $ff            ; $fe72: 05 ff     
            brk                ; $fe74: 00        
            .hex 0b 00         ; $fe75: 0b 00     Invalid Opcode - ANC #$00
            .hex ad ff 00      ; $fe77: ad ff 00  Bad Addr Mode - LDA $00ff
            .hex 03 00         ; $fe7a: 03 00     Invalid Opcode - SLO ($00,x)
            ldx $00ff,y        ; $fe7c: be ff 00  
            brk                ; $fe7f: 00        
            brk                ; $fe80: 00        
            cpy $ff            ; $fe81: c4 ff     
            brk                ; $fe83: 00        
            brk                ; $fe84: 00        
            .hex 0f 20 ff      ; $fe85: 0f 20 ff  Invalid Opcode - SLO __ff20
            and ($3e,x)        ; $fe88: 21 3e     
            brk                ; $fe8a: 00        
            lda ($ff,x)        ; $fe8b: a1 ff     
            php                ; $fe8d: 08        
            brk                ; $fe8e: 00        
            stx $46            ; $fe8f: 86 46     
            .hex 82 4a         ; $fe91: 82 4a     Invalid Opcode - NOP #$4a
            .hex 83 26         ; $fe93: 83 26     Invalid Opcode - SAX ($26,x)
            lsr $80            ; $fe95: 46 80     
            .hex 34 32         ; $fe97: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fe99: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fe9b: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fe9d: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fe9f: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fea1: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fea3: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fea5: 34 32     Invalid Opcode - NOP $32,x
            sty $34            ; $fea7: 84 34     
            brk                ; $fea9: 00        
            lda #$ac           ; $feaa: a9 ac     
            inc $33e8          ; $feac: ee e8 33  
            and $16,x          ; $feaf: 35 16     
            asl $57,x          ; $feb1: 16 57     
            asl $6420,x        ; $feb3: 1e 20 64  
            .hex 9e 1e 20      ; $feb6: 9e 1e 20  Invalid Opcode - SHX $201e,y
            .hex 64 9e         ; $feb9: 64 9e     Invalid Opcode - NOP $9e
            brk                ; $febb: 00        
            .hex 80 30         ; $febc: 80 30     Invalid Opcode - NOP #$30
            bmi __fe45         ; $febe: 30 85     
            bmi __fe42         ; $fec0: 30 80     
            .hex 1a            ; $fec2: 1a        Invalid Opcode - NOP 
            .hex 1c 81 1e      ; $fec3: 1c 81 1e  Invalid Opcode - NOP $1e81,x
            .hex 82 1a         ; $fec6: 82 1a     Invalid Opcode - NOP #$1a
            .hex 80 1a         ; $fec8: 80 1a     Invalid Opcode - NOP #$1a
            .hex 1c 81 1e      ; $feca: 1c 81 1e  Invalid Opcode - NOP $1e81,x
            .hex 82 1a         ; $fecd: 82 1a     Invalid Opcode - NOP #$1a
            lsr $5c5e,x        ; $fecf: 5e 5e 5c  
            .hex 5c 5a 5a      ; $fed2: 5c 5a 5a  Invalid Opcode - NOP $5a5a,x
            cli                ; $fed5: 58        
            cli                ; $fed6: 58        
            .hex 57 16         ; $fed7: 57 16     Invalid Opcode - SRE $16,x
            clc                ; $fed9: 18        
            txs                ; $feda: 9a        
            stx $59,y          ; $fedb: 96 59     
            clc                ; $fedd: 18        
            .hex 1a            ; $fede: 1a        Invalid Opcode - NOP 
            .hex 9c 98 5f      ; $fedf: 9c 98 5f  Invalid Opcode - SHY $5f98,x
            lsr $5e60,x        ; $fee2: 5e 60 5e  
            .hex 5c 5a 1f      ; $fee5: 5c 5a 1f  Invalid Opcode - NOP $1f5a,x
            brk                ; $fee8: 00        
            sta ($1a,x)        ; $fee9: 81 1a     
            .hex 1a            ; $feeb: 1a        Invalid Opcode - NOP 
            clc                ; $feec: 18        
            clc                ; $feed: 18        
            asl $16,x          ; $feee: 16 16     
            sec                ; $fef0: 38        
            sec                ; $fef1: 38        
            .hex 82 26         ; $fef2: 82 26     Invalid Opcode - NOP #$26
            .hex 42            ; $fef4: 42        Invalid Opcode - KIL 
            rol $42            ; $fef5: 26 42     
            plp                ; $fef7: 28        
            lsr $28            ; $fef8: 46 28     
            lsr $30            ; $fefa: 46 30     
            plp                ; $fefc: 28        
            bmi __ff27         ; $fefd: 30 28     
            .hex 81            ; $feff: 81        Suspected data
__ff00:     .hex 3a            ; $ff00: 3a        Invalid Opcode - NOP 
            sta $3c            ; $ff01: 85 3c     
            sty $3a            ; $ff03: 84 3a     
            lsr $2002,x        ; $ff05: 5e 02 20  
            .hex 42            ; $ff08: 42        Invalid Opcode - KIL 
            lsr                ; $ff09: 4a        
            .hex 42            ; $ff0a: 42        Invalid Opcode - KIL 
            rts                ; $ff0b: 60        

;-------------------------------------------------------------------------------
            lsr $1d60,x        ; $ff0c: 5e 60 1d  
            brk                ; $ff0f: 00        
            .hex 82 26         ; $ff10: 82 26     Invalid Opcode - NOP #$26
            .hex 42            ; $ff12: 42        Invalid Opcode - KIL 
            rol $42            ; $ff13: 26 42     
            sta ($40,x)        ; $ff15: 81 40     
            .hex 80 42         ; $ff17: 80 42     Invalid Opcode - NOP #$42
            .hex 44 48         ; $ff19: 44 48     Invalid Opcode - NOP $48
            rol $28            ; $ff1b: 26 28     
            bit $2e83          ; $ff1d: 2c 83 2e  
            lsr $56,x          ; $ff20: 56 56     
            cpx #$42           ; $ff22: e0 42     
            .hex 5a            ; $ff24: 5a        Invalid Opcode - NOP 
            .hex 5e            ; $ff25: 5e        Suspected data
__ff26:     .hex 5c            ; $ff26: 5c        Suspected data
__ff27:     sta $5858,y        ; $ff27: 99 58 58  
__ff2a:     .hex e2 42         ; $ff2a: e2 42     Invalid Opcode - NOP #$42
            lsr $5e60,x        ; $ff2c: 5e 60 5e  
            .hex 9b            ; $ff2f: 9b        Invalid Opcode - TAS 
            .hex 5a            ; $ff30: 5a        Invalid Opcode - NOP 
            .hex 5a            ; $ff31: 5a        Invalid Opcode - NOP 
            dex                ; $ff32: ca        
            .hex 42            ; $ff33: 42        Invalid Opcode - KIL 
            rts                ; $ff34: 60        

;-------------------------------------------------------------------------------
            .hex 62            ; $ff35: 62        Invalid Opcode - KIL 
            lsr                ; $ff36: 4a        
            .hex 8d            ; $ff37: 8d        Suspected data
__ff38:     .hex 5c 5e e0      ; $ff38: 5c 5e e0  Invalid Opcode - NOP __e05e,x
            .hex 42            ; $ff3b: 42        Invalid Opcode - KIL 
            .hex 5a            ; $ff3c: 5a        Invalid Opcode - NOP 
            .hex 5c 5e 1d      ; $ff3d: 5c 5e 1d  Invalid Opcode - NOP $1d5e,x
            brk                ; $ff40: 00        
            .hex 82 6f         ; $ff41: 82 6f     Invalid Opcode - NOP #$6f
            ror $71ee          ; $ff43: 6e ee 71  
            bvs __ff38         ; $ff46: 70 f0     
            .hex 77 76         ; $ff48: 77 76     Invalid Opcode - RRA $76,x
            inc $57,x          ; $ff4a: f6 57     
            lsr $d6,x          ; $ff4c: 56 d6     
            ldy #$9a           ; $ff4e: a0 9a     
            stx $b4,y          ; $ff50: 96 b4     
            ldx #$9c           ; $ff52: a2 9c     
            tya                ; $ff54: 98        
            ldx $5c,y          ; $ff55: b6 5c     
            .hex 9c 96 57      ; $ff57: 9c 96 57  Invalid Opcode - SHY $5796,x
            .hex 5c 96 74      ; $ff5a: 5c 96 74  Invalid Opcode - NOP $7496,x
            .hex 2f 85 02      ; $ff5d: 2f 85 02  Invalid Opcode - RLA $0285
            sta ($2e,x)        ; $ff60: 81 2e     
            .hex 34 2e         ; $ff62: 34 2e     Invalid Opcode - NOP $2e,x
            .hex 83 34         ; $ff64: 83 34     Invalid Opcode - SAX ($34,x)
            sta ($48,x)        ; $ff66: 81 48     
            plp                ; $ff68: 28        
            bmi __ff93         ; $ff69: 30 28     
            bmi __ff95         ; $ff6b: 30 28     
            sta $30            ; $ff6d: 85 30     
            sta ($30,x)        ; $ff6f: 81 30     
            rol $30,x          ; $ff71: 36 30     
            .hex 83 36         ; $ff73: 83 36     Invalid Opcode - SAX ($36,x)
            sta ($26,x)        ; $ff75: 81 26     
            bit $2c30          ; $ff77: 2c 30 2c  
            bmi __ffa8         ; $ff7a: 30 2c     
            asl $16,x          ; $ff7c: 16 16     
            .hex 1a            ; $ff7e: 1a        Invalid Opcode - NOP 
            asl $34,x          ; $ff7f: 16 34     
            asl $1a,x          ; $ff81: 16 1a     
            asl $34,x          ; $ff83: 16 34     
            asl $1c,x          ; $ff85: 16 1c     
            clc                ; $ff87: 18        
            rol $18,x          ; $ff88: 36 18     
            .hex 1c 18 36      ; $ff8a: 1c 18 36  Invalid Opcode - NOP $3618,x
            clc                ; $ff8d: 18        
            asl $2e,x          ; $ff8e: 16 2e     
            .hex 80 16         ; $ff90: 80 16     Invalid Opcode - NOP #$16
            .hex 36            ; $ff92: 36        Suspected data
__ff93:     .hex 34 36         ; $ff93: 34 36     Invalid Opcode - NOP $36,x
__ff95:     .hex 83 16         ; $ff95: 83 16     Invalid Opcode - SAX ($16,x)
            sta ($02,x)        ; $ff97: 81 02     
            rol $1680          ; $ff99: 2e 80 16  
            rol $34,x          ; $ff9c: 36 34     
            bmi __ff26         ; $ff9e: 30 86     
            rol $1a81          ; $ffa0: 2e 81 1a  
            .hex 82 1e         ; $ffa3: 82 1e     Invalid Opcode - NOP #$1e
            bmi __ff2a         ; $ffa5: 30 83     
            .hex 16            ; $ffa7: 16        Suspected data
__ffa8:     brk                ; $ffa8: 00        
            .hex 42            ; $ffa9: 42        Invalid Opcode - KIL 
            stx $b0,y          ; $ffaa: 96 b0     
            inc $03            ; $ffac: e6 03     
            .hex 83 00         ; $ffae: 83 00     Invalid Opcode - SAX ($00,x)
            .hex 87 42         ; $ffb0: 87 42     Invalid Opcode - SAX $42
            rol $3e42,x        ; $ffb2: 3e 42 3e  
            .hex 42            ; $ffb5: 42        Invalid Opcode - KIL 
            rol $3e42,x        ; $ffb6: 3e 42 3e  
            .hex 42            ; $ffb9: 42        Invalid Opcode - KIL 
            rol $8242,x        ; $ffba: 3e 42 82  
            rol $0c0a,x        ; $ffbd: 3e 0a 0c  
            asl $9054          ; $ffc0: 0e 54 90  
            brk                ; $ffc3: 00        
            .hex 04 12         ; $ffc4: 04 12     Invalid Opcode - NOP $12
            .hex 04 12         ; $ffc6: 04 12     Invalid Opcode - NOP $12
            .hex 04 12         ; $ffc8: 04 12     Invalid Opcode - NOP $12
            .hex 04 92         ; $ffca: 04 92     Invalid Opcode - NOP $92
            brk                ; $ffcc: 00        
__ffcd:     brk                ; $ffcd: 00        
            brk                ; $ffce: 00        
            brk                ; $ffcf: 00        
            brk                ; $ffd0: 00        
            ora #$0e           ; $ffd1: 09 0e     
            .hex 12            ; $ffd3: 12        Invalid Opcode - KIL 
            asl $02,x          ; $ffd4: 16 02     
            .hex 02            ; $ffd6: 02        Invalid Opcode - KIL 
            .hex 1a            ; $ffd7: 1a        Invalid Opcode - NOP 
            .hex 02            ; $ffd8: 02        Invalid Opcode - KIL 
            asl $1e20,x        ; $ffd9: 1e 20 1e  
            brk                ; $ffdc: 00        
            .hex 5a            ; $ffdd: 5a        Invalid Opcode - NOP 
            .hex 42            ; $ffde: 42        Invalid Opcode - KIL 
            lsr $56,x          ; $ffdf: 56 56     
            brk                ; $ffe1: 00        
            ora #$07           ; $ffe2: 09 07     
            ora $00            ; $ffe4: 05 00     
            dex                ; $ffe6: ca        
            txa                ; $ffe7: 8a        
            txa                ; $ffe8: 8a        
            dex                ; $ffe9: ca        
            dex                ; $ffea: ca        
            dec __ceca         ; $ffeb: ce ca ce  
            dex                ; $ffee: ca        
            .hex ce            ; $ffef: ce        Suspected data

;-------------------------------------------------------------------------------
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        stx __ce8e         ; $fff0: 8e 8e ce  
            dec __ced2         ; $fff3: ce d2 ce  
            .hex d2            ; $fff6: d2        Invalid Opcode - KIL 
            dec __ff00         ; $fff7: ce 00 ff  

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: 5f c8     Vector table
            .dw reset                      ; $fffc: 9e c7     Vector table
            .dw irq                        ; $fffe: f0 ff     Vector table
