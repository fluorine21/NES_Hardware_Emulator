;-------------------------------------------------------------------------------
; Ice Climber (USA, Europe).nes disasembled by DISASM6 v1.5
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
__c000:     ora ($4c,x)        ; $c000: 01 4c     
            clv                ; $c002: b8        
            .hex e3 94         ; $c003: e3 94     Invalid Opcode - ISC ($94,x)
            brk                ; $c005: 00        
            sbc $81df          ; $c006: ed df 81  
            brk                ; $c009: 00        
__c00a:     .hex 03 05         ; $c00a: 03 05     Invalid Opcode - SLO ($05,x)
            dec $c6            ; $c00c: c6 c6     
            dec $04            ; $c00e: c6 04     
            dec $04            ; $c010: c6 04     
            .hex 04 06         ; $c012: 04 06     Invalid Opcode - NOP $06

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      sei                ; $c014: 78        
            cld                ; $c015: d8        
            lda #$10           ; $c016: a9 10     
            sta $2000          ; $c018: 8d 00 20  
            ldx #$ff           ; $c01b: a2 ff     
            txs                ; $c01d: 9a        
__c01e:     lda $2002          ; $c01e: ad 02 20  
            asl                ; $c021: 0a        
            bcc __c01e         ; $c022: 90 fa     
__c024:     lda $2002          ; $c024: ad 02 20  
            asl                ; $c027: 0a        
            bcc __c024         ; $c028: 90 fa     
            ldy #$07           ; $c02a: a0 07     
            sty $01            ; $c02c: 84 01     
            ldy #$00           ; $c02e: a0 00     
            sty $00            ; $c030: 84 00     
            tya                ; $c032: 98        
            ldx #$5a           ; $c033: a2 5a     
            cpx $0780          ; $c035: ec 80 07  
            bne __c041         ; $c038: d0 07     
            cpx $0781          ; $c03a: ec 81 07  
            bne __c041         ; $c03d: d0 02     
            ldy #$ec           ; $c03f: a0 ec     
__c041:     sta ($00),y        ; $c041: 91 00     
            dey                ; $c043: 88        
            bne __c041         ; $c044: d0 fb     
            dec $01            ; $c046: c6 01     
            bpl __c041         ; $c048: 10 f7     
            lda #$5a           ; $c04a: a9 5a     
            sta $0780          ; $c04c: 8d 80 07  
            sta $0781          ; $c04f: 8d 81 07  
            jsr __c05e         ; $c052: 20 5e c0  
            jsr __c141         ; $c055: 20 41 c1  
__c058:     jsr __cace         ; $c058: 20 ce ca  
            jmp __c058         ; $c05b: 4c 58 c0  

;-------------------------------------------------------------------------------
__c05e:     lda #$00           ; $c05e: a9 00     
            sta $4011          ; $c060: 8d 11 40  
            lda #$0f           ; $c063: a9 0f     
            sta $4015          ; $c065: 8d 15 40  
            lda #$06           ; $c068: a9 06     
            sta $2001          ; $c06a: 8d 01 20  
__c06d:     jsr __c883         ; $c06d: 20 83 c8  
__c070:     jsr __c89a         ; $c070: 20 9a c8  
            jmp __c81d         ; $c073: 4c 1d c8  

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        pha                ; $c076: 48        
            txa                ; $c077: 8a        
            pha                ; $c078: 48        
            tya                ; $c079: 98        
            pha                ; $c07a: 48        
            lda $10            ; $c07b: a5 10     
            ldx $de            ; $c07d: a6 de     
            beq __c083         ; $c07f: f0 02     
            eor #$02           ; $c081: 49 02     
__c083:     and #$7f           ; $c083: 29 7f     
            jsr __c148         ; $c085: 20 48 c1  
            lda $52            ; $c088: a5 52     
            bne __c095         ; $c08a: d0 09     
            lda $11            ; $c08c: a5 11     
            ora #$1e           ; $c08e: 09 1e     
            sta $2001          ; $c090: 8d 01 20  
            sta $11            ; $c093: 85 11     
__c095:     lda #$00           ; $c095: a9 00     
            sta $2003          ; $c097: 8d 03 20  
            lda #$02           ; $c09a: a9 02     
            sta $4014          ; $c09c: 8d 14 40  
            ldx $52            ; $c09f: a6 52     
            jsr __c150         ; $c0a1: 20 50 c1  
            sta $52            ; $c0a4: 85 52     
            sta $de            ; $c0a6: 85 de     
            lda #$3f           ; $c0a8: a9 3f     
            sta $2006          ; $c0aa: 8d 06 20  
            lda #$00           ; $c0ad: a9 00     
            sta $2006          ; $c0af: 8d 06 20  
            sta $2006          ; $c0b2: 8d 06 20  
            sta $2006          ; $c0b5: 8d 06 20  
            lda $2002          ; $c0b8: ad 02 20  
            jsr __cb81         ; $c0bb: 20 81 cb  
            lda $10            ; $c0be: a5 10     
            sta $2000          ; $c0c0: 8d 00 20  
            jsr __caed         ; $c0c3: 20 ed ca  
            jsr __f91e         ; $c0c6: 20 1e f9  
            lda $53            ; $c0c9: a5 53     
            beq __c0d3         ; $c0cb: f0 06     
            jsr __c620         ; $c0cd: 20 20 c6  
            jmp __c126         ; $c0d0: 4c 26 c1  

;-------------------------------------------------------------------------------
__c0d3:     lda $51            ; $c0d3: a5 51     
            beq __c126         ; $c0d5: f0 4f     
            ldx $034c          ; $c0d7: ae 4c 03  
            beq __c11a         ; $c0da: f0 3e     
            dex                ; $c0dc: ca        
            beq __c103         ; $c0dd: f0 24     
            dex                ; $c0df: ca        
            bne __c100         ; $c0e0: d0 1e     
            lda $11            ; $c0e2: a5 11     
            and #$ef           ; $c0e4: 29 ef     
            sta $2001          ; $c0e6: 8d 01 20  
            sta $11            ; $c0e9: 85 11     
            lda $15            ; $c0eb: a5 15     
            and #$10           ; $c0ed: 29 10     
            beq __c138         ; $c0ef: f0 47     
            ldy #$40           ; $c0f1: a0 40     
__c0f3:     sty $fb            ; $c0f3: 84 fb     
            lda #$40           ; $c0f5: a9 40     
            sta $034d          ; $c0f7: 8d 4d 03  
__c0fa:     inc $034c          ; $c0fa: ee 4c 03  
            jmp __c138         ; $c0fd: 4c 38 c1  

;-------------------------------------------------------------------------------
__c100:     dex                ; $c100: ca        
            bne __c10a         ; $c101: d0 07     
__c103:     dec $034d          ; $c103: ce 4d 03  
            beq __c0fa         ; $c106: f0 f2     
            bne __c138         ; $c108: d0 2e     
__c10a:     lda $11            ; $c10a: a5 11     
            ora #$10           ; $c10c: 09 10     
            sta $2001          ; $c10e: 8d 01 20  
            sta $11            ; $c111: 85 11     
            lda #$00           ; $c113: a9 00     
            sta $034c          ; $c115: 8d 4c 03  
            beq __c138         ; $c118: f0 1e     
__c11a:     ldy #$20           ; $c11a: a0 20     
            lda $15            ; $c11c: a5 15     
            and #$10           ; $c11e: 29 10     
            beq __c126         ; $c120: f0 04     
            lda $55            ; $c122: a5 55     
            bne __c0f3         ; $c124: d0 cd     
__c126:     jsr __cb9d         ; $c126: 20 9d cb  
            inc $50            ; $c129: e6 50     
            lda $51            ; $c12b: a5 51     
            bne __c135         ; $c12d: d0 06     
            jsr __c437         ; $c12f: 20 37 c4  
            jmp __c138         ; $c132: 4c 38 c1  

;-------------------------------------------------------------------------------
__c135:     jsr __c44a         ; $c135: 20 4a c4  
__c138:     jsr __c141         ; $c138: 20 41 c1  
            pla                ; $c13b: 68        
            tay                ; $c13c: a8        
            pla                ; $c13d: 68        
            tax                ; $c13e: aa        
            pla                ; $c13f: 68        
            rti                ; $c140: 40        

;-------------------------------------------------------------------------------
__c141:     lda $2002          ; $c141: ad 02 20  
            lda $10            ; $c144: a5 10     
            ora #$80           ; $c146: 09 80     
__c148:     sta $10            ; $c148: 85 10     
            sta $2000          ; $c14a: 8d 00 20  
            rts                ; $c14d: 60        

;-------------------------------------------------------------------------------
__c14e:     ldx #$00           ; $c14e: a2 00     
__c150:     lda __c000,x       ; $c150: bd 00 c0  
            sta $00            ; $c153: 85 00     
            lda __c00a,x       ; $c155: bd 0a c0  
            sta $01            ; $c158: 85 01     
            jsr __cb78         ; $c15a: 20 78 cb  
__c15d:     lda #$00           ; $c15d: a9 00     
            sta $0300          ; $c15f: 8d 00 03  
            sta $0301          ; $c162: 8d 01 03  
            rts                ; $c165: 60        

;-------------------------------------------------------------------------------
            lda $43            ; $c166: a5 43     
            bne __c1d6         ; $c168: d0 6c     
            jsr __c891         ; $c16a: 20 91 c8  
            ldx $57            ; $c16d: a6 57     
            bne __c182         ; $c16f: d0 11     
            lda #$80           ; $c171: a9 80     
            sta $fb            ; $c173: 85 fb     
            jsr __c06d         ; $c175: 20 6d c0  
            ldx #$00           ; $c178: a2 00     
            jsr __c6fb         ; $c17a: 20 fb c6  
            lda #$01           ; $c17d: a9 01     
__c17f:     jmp __c218         ; $c17f: 4c 18 c2  

;-------------------------------------------------------------------------------
__c182:     dex                ; $c182: ca        
            bne __c189         ; $c183: d0 04     
            lda #$05           ; $c185: a9 05     
            bne __c17f         ; $c187: d0 f6     
__c189:     dex                ; $c189: ca        
            bne __c19b         ; $c18a: d0 0f     
            lda #$f9           ; $c18c: a9 f9     
            sta $00            ; $c18e: 85 00     
            jsr __ca4c         ; $c190: 20 4c ca  
            lda #$f1           ; $c193: a9 f1     
            jsr __c8e0         ; $c195: 20 e0 c8  
            jmp __c21a         ; $c198: 4c 1a c2  

;-------------------------------------------------------------------------------
__c19b:     lda #$00           ; $c19b: a9 00     
            sta $56            ; $c19d: 85 56     
            sta $57            ; $c19f: 85 57     
            sta $03fa          ; $c1a1: 8d fa 03  
            sta $03fb          ; $c1a4: 8d fb 03  
            sta $13            ; $c1a7: 85 13     
            sta $22            ; $c1a9: 85 22     
            sta $23            ; $c1ab: 85 23     
            ldx #$09           ; $c1ad: a2 09     
__c1af:     sta $0360,x        ; $c1af: 9d 60 03  
            dex                ; $c1b2: ca        
            bpl __c1af         ; $c1b3: 10 fa     
            sta $4d            ; $c1b5: 85 4d     
            jsr __c8e0         ; $c1b7: 20 e0 c8  
            jsr __c4c0         ; $c1ba: 20 c0 c4  
            lda $54            ; $c1bd: a5 54     
            bne __c1d0         ; $c1bf: d0 0f     
            lda #$03           ; $c1c1: a9 03     
            sta $54            ; $c1c3: 85 54     
            lda #$58           ; $c1c5: a9 58     
            sta $4d            ; $c1c7: 85 4d     
            lda #$09           ; $c1c9: a9 09     
            sta $31            ; $c1cb: 85 31     
            lsr                ; $c1cd: 4a        
            sta $fb            ; $c1ce: 85 fb     
__c1d0:     lda #$80           ; $c1d0: a9 80     
            sta $4e            ; $c1d2: 85 4e     
            inc $51            ; $c1d4: e6 51     
__c1d6:     rts                ; $c1d6: 60        

;-------------------------------------------------------------------------------
__c1d7:     jsr __c891         ; $c1d7: 20 91 c8  
            lda $57            ; $c1da: a5 57     
            bne __c1f0         ; $c1dc: d0 12     
            jsr __c070         ; $c1de: 20 70 c0  
            lda $10            ; $c1e1: a5 10     
            and #$fd           ; $c1e3: 29 fd     
            sta $10            ; $c1e5: 85 10     
            lda #$9f           ; $c1e7: a9 9f     
            sta $13            ; $c1e9: 85 13     
            lda #$04           ; $c1eb: a9 04     
            jmp __c218         ; $c1ed: 4c 18 c2  

;-------------------------------------------------------------------------------
__c1f0:     cmp #$01           ; $c1f0: c9 01     
            beq __c21a         ; $c1f2: f0 26     
            cmp #$02           ; $c1f4: c9 02     
            bne __c21d         ; $c1f6: d0 25     
            lda #$00           ; $c1f8: a9 00     
            sta $7c            ; $c1fa: 85 7c     
            ldx #$77           ; $c1fc: a2 77     
__c1fe:     sta $78,x          ; $c1fe: 95 78     
            cpx #$01           ; $c200: e0 01     
            bcc __c207         ; $c202: 90 03     
            sta $0380,x        ; $c204: 9d 80 03  
__c207:     dex                ; $c207: ca        
            bpl __c1fe         ; $c208: 10 f4     
            jsr __c5a7         ; $c20a: 20 a7 c5  
            lda #$01           ; $c20d: a9 01     
            sta $da            ; $c20f: 85 da     
            lda #$04           ; $c211: a9 04     
            sta $90            ; $c213: 85 90     
            lsr                ; $c215: 4a        
            sta $db            ; $c216: 85 db     
__c218:     sta $52            ; $c218: 85 52     
__c21a:     inc $57            ; $c21a: e6 57     
            rts                ; $c21c: 60        

;-------------------------------------------------------------------------------
__c21d:     cmp #$03           ; $c21d: c9 03     
            bne __c23b         ; $c21f: d0 1a     
            jsr __e79d         ; $c221: 20 9d e7  
            jsr __e4c2         ; $c224: 20 c2 e4  
            jsr __c542         ; $c227: 20 42 c5  
            jsr __c4d7         ; $c22a: 20 d7 c4  
            jsr __dfab         ; $c22d: 20 ab df  
            jsr __dd16         ; $c230: 20 16 dd  
            jsr __dd1d         ; $c233: 20 1d dd  
            inc $57            ; $c236: e6 57     
            jmp __e05e         ; $c238: 4c 5e e0  

;-------------------------------------------------------------------------------
__c23b:     lda #$00           ; $c23b: a9 00     
            ldy #$90           ; $c23d: a0 90     
__c23f:     sta $005f,y        ; $c23f: 99 5f 00  
            dey                ; $c242: 88        
            bne __c23f         ; $c243: d0 fa     
            lda #$04           ; $c245: a9 04     
            sta $90            ; $c247: 85 90     
            lda #$38           ; $c249: a9 38     
            sta $64            ; $c24b: 85 64     
            lda #$b8           ; $c24d: a9 b8     
            sta $65            ; $c24f: 85 65     
            ldx #$01           ; $c251: a2 01     
__c253:     lda #$00           ; $c253: a9 00     
            sta $5a,x          ; $c255: 95 5a     
            sta $6a,x          ; $c257: 95 6a     
            lda $20,x          ; $c259: b5 20     
            bmi __c274         ; $c25b: 30 17     
            lda #$01           ; $c25d: a9 01     
            sta $037a          ; $c25f: 8d 7a 03  
            sta $62            ; $c262: 85 62     
            sta $5a,x          ; $c264: 95 5a     
            sta $6a,x          ; $c266: 95 6a     
            lsr                ; $c268: 4a        
            sta $2f,x          ; $c269: 95 2f     
            sta $063f          ; $c26b: 8d 3f 06  
            sta $2d,x          ; $c26e: 95 2d     
            lda #$c0           ; $c270: a9 c0     
            sta $66,x          ; $c272: 95 66     
__c274:     dex                ; $c274: ca        
            bpl __c253         ; $c275: 10 dc     
            ldx #$02           ; $c277: a2 02     
__c279:     jsr __f19e         ; $c279: 20 9e f1  
            dex                ; $c27c: ca        
            bpl __c279         ; $c27d: 10 fa     
            lda #$05           ; $c27f: a9 05     
            sta $8b            ; $c281: 85 8b     
            lda #$80           ; $c283: a9 80     
            sta $3d            ; $c285: 85 3d     
            lda #$01           ; $c287: a9 01     
            sta $2c            ; $c289: 85 2c     
            lda #$1a           ; $c28b: a9 1a     
            sta $4a            ; $c28d: 85 4a     
            lda #$21           ; $c28f: a9 21     
            sta $4b            ; $c291: 85 4b     
            lda #$22           ; $c293: a9 22     
            sta $39            ; $c295: 85 39     
            jsr __f80c         ; $c297: 20 0c f8  
            ldx $55            ; $c29a: a6 55     
            cpx #$01           ; $c29c: e0 01     
            bne __c2ab         ; $c29e: d0 0b     
            lda #$02           ; $c2a0: a9 02     
            sta $fb            ; $c2a2: 85 fb     
            jsr __e002         ; $c2a4: 20 02 e0  
__c2a7:     lda #$01           ; $c2a7: a9 01     
            sta $8d            ; $c2a9: 85 8d     
__c2ab:     inc $57            ; $c2ab: e6 57     
            inc $51            ; $c2ad: e6 51     
            rts                ; $c2af: 60        

;-------------------------------------------------------------------------------
            jsr __c891         ; $c2b0: 20 91 c8  
            ldx $57            ; $c2b3: a6 57     
            bne __c2c4         ; $c2b5: d0 0d     
            jsr __c06d         ; $c2b7: 20 6d c0  
            ldx #$01           ; $c2ba: a2 01     
            jsr __c6fb         ; $c2bc: 20 fb c6  
            lda #$07           ; $c2bf: a9 07     
__c2c1:     jmp __c218         ; $c2c1: 4c 18 c2  

;-------------------------------------------------------------------------------
__c2c4:     dex                ; $c2c4: ca        
            bne __c2ce         ; $c2c5: d0 07     
            jsr __f524         ; $c2c7: 20 24 f5  
            lda #$05           ; $c2ca: a9 05     
            bne __c2c1         ; $c2cc: d0 f3     
__c2ce:     dex                ; $c2ce: ca        
            bne __c2d9         ; $c2cf: d0 08     
            lda $58            ; $c2d1: a5 58     
            beq __c2d9         ; $c2d3: f0 04     
            lda #$08           ; $c2d5: a9 08     
            bne __c2c1         ; $c2d7: d0 e8     
__c2d9:     jsr __f586         ; $c2d9: 20 86 f5  
            lda #$00           ; $c2dc: a9 00     
            sta $84            ; $c2de: 85 84     
            lda #$10           ; $c2e0: a9 10     
            sta $37            ; $c2e2: 85 37     
            sta $38            ; $c2e4: 85 38     
            lda #$68           ; $c2e6: a9 68     
            sta $34            ; $c2e8: 85 34     
            jmp __c2ab         ; $c2ea: 4c ab c2  

;-------------------------------------------------------------------------------
            ldx $57            ; $c2ed: a6 57     
            bne __c324         ; $c2ef: d0 33     
            jsr __c81d         ; $c2f1: 20 1d c8  
            lda #$01           ; $c2f4: a9 01     
            sta $27            ; $c2f6: 85 27     
            lsr                ; $c2f8: 4a        
            sta $05fb          ; $c2f9: 8d fb 05  
            ldx #$07           ; $c2fc: a2 07     
__c2fe:     sta $07f8,x        ; $c2fe: 9d f8 07  
            dex                ; $c301: ca        
            bpl __c2fe         ; $c302: 10 fa     
            lda #$40           ; $c304: a9 40     
            sta $07fa          ; $c306: 8d fa 07  
            sta $07fe          ; $c309: 8d fe 07  
            ldx $58            ; $c30c: a6 58     
__c30e:     lda $6a,x          ; $c30e: b5 6a     
            cmp #$07           ; $c310: c9 07     
            bne __c31a         ; $c312: d0 06     
            lda $5a,x          ; $c314: b5 5a     
            beq __c31a         ; $c316: f0 02     
            dec $20,x          ; $c318: d6 20     
__c31a:     dex                ; $c31a: ca        
            bpl __c30e         ; $c31b: 10 f1     
            lda #$06           ; $c31d: a9 06     
            sta $7a            ; $c31f: 85 7a     
            jmp __c218         ; $c321: 4c 18 c2  

;-------------------------------------------------------------------------------
__c324:     dex                ; $c324: ca        
            bne __c349         ; $c325: d0 22     
            dec $13            ; $c327: c6 13     
            dec $13            ; $c329: c6 13     
            ldx $26            ; $c32b: a6 26     
            cpx #$02           ; $c32d: e0 02     
            bne __c338         ; $c32f: d0 07     
            ldx #$00           ; $c331: a2 00     
            jsr __c38d         ; $c333: 20 8d c3  
            ldx #$01           ; $c336: a2 01     
__c338:     jsr __c38d         ; $c338: 20 8d c3  
            jsr __ecbf         ; $c33b: 20 bf ec  
            lda $13            ; $c33e: a5 13     
            cmp #$20           ; $c340: c9 20     
            bcs __c38c         ; $c342: b0 48     
            lda #$03           ; $c344: a9 03     
            jmp __c218         ; $c346: 4c 18 c2  

;-------------------------------------------------------------------------------
__c349:     dex                ; $c349: ca        
            bne __c353         ; $c34a: d0 07     
            inc $57            ; $c34c: e6 57     
            ldx #$0a           ; $c34e: a2 0a     
            jmp __f691         ; $c350: 4c 91 f6  

;-------------------------------------------------------------------------------
__c353:     lda #$00           ; $c353: a9 00     
            sta $6a            ; $c355: 85 6a     
            sta $6b            ; $c357: 85 6b     
            sta $5a            ; $c359: 85 5a     
            sta $5b            ; $c35b: 85 5b     
            sta $0352          ; $c35d: 8d 52 03  
            sta $0353          ; $c360: 8d 53 03  
            ldx $26            ; $c363: a6 26     
            cpx #$02           ; $c365: e0 02     
            bne __c370         ; $c367: d0 07     
            ldx #$00           ; $c369: a2 00     
            jsr __c399         ; $c36b: 20 99 c3  
            ldx #$01           ; $c36e: a2 01     
__c370:     jsr __c399         ; $c370: 20 99 c3  
            lda #$15           ; $c373: a9 15     
            sta $d7            ; $c375: 85 d7     
            lda #$00           ; $c377: a9 00     
            sta $d5            ; $c379: 85 d5     
            sta $d4            ; $c37b: 85 d4     
            jsr __f60f         ; $c37d: 20 0f f6  
            jsr __f6f2         ; $c380: 20 f2 f6  
            jsr __e562         ; $c383: 20 62 e5  
            lda #$04           ; $c386: a9 04     
            sta $fb            ; $c388: 85 fb     
            inc $51            ; $c38a: e6 51     
__c38c:     rts                ; $c38c: 60        

;-------------------------------------------------------------------------------
__c38d:     inc $66,x          ; $c38d: f6 66     
            inc $66,x          ; $c38f: f6 66     
            lda #$00           ; $c391: a9 00     
            sta $70,x          ; $c393: 95 70     
            sta $6c,x          ; $c395: 95 6c     
            beq __c39f         ; $c397: f0 06     
__c399:     lda #$01           ; $c399: a9 01     
            sta $6a,x          ; $c39b: 95 6a     
            sta $5a,x          ; $c39d: 95 5a     
__c39f:     stx $5f            ; $c39f: 86 5f     
            jmp __cdff         ; $c3a1: 4c ff cd  

;-------------------------------------------------------------------------------
            lda $57            ; $c3a4: a5 57     
            cmp #$06           ; $c3a6: c9 06     
            beq __c3cc         ; $c3a8: f0 22     
            jsr __c1d7         ; $c3aa: 20 d7 c1  
            lda $57            ; $c3ad: a5 57     
            cmp #$05           ; $c3af: c9 05     
            bne __c3cb         ; $c3b1: d0 18     
            lda $53            ; $c3b3: a5 53     
            bne __c3c1         ; $c3b5: d0 0a     
            lda #$00           ; $c3b7: a9 00     
            ldx #$0e           ; $c3b9: a2 0e     
__c3bb:     sta $07f0,x        ; $c3bb: 9d f0 07  
            dex                ; $c3be: ca        
            bpl __c3bb         ; $c3bf: 10 fa     
__c3c1:     jsr __c81d         ; $c3c1: 20 1d c8  
            jsr __f60f         ; $c3c4: 20 0f f6  
            inc $57            ; $c3c7: e6 57     
            dec $51            ; $c3c9: c6 51     
__c3cb:     rts                ; $c3cb: 60        

;-------------------------------------------------------------------------------
__c3cc:     ldx #$0a           ; $c3cc: a2 0a     
            jsr __f691         ; $c3ce: 20 91 f6  
            lda #$70           ; $c3d1: a9 70     
            sta $d6            ; $c3d3: 85 d6     
            asl                ; $c3d5: 0a        
            sta $d7            ; $c3d6: 85 d7     
            lda #$00           ; $c3d8: a9 00     
            sta $d4            ; $c3da: 85 d4     
            sta $d5            ; $c3dc: 85 d5     
            lda #$04           ; $c3de: a9 04     
            sta $1f            ; $c3e0: 85 1f     
            lsr                ; $c3e2: 4a        
            sta $7a            ; $c3e3: 85 7a     
            jmp __c2a7         ; $c3e5: 4c a7 c2  

;-------------------------------------------------------------------------------
            lda $d7            ; $c3e8: a5 d7     
            cmp #$1d           ; $c3ea: c9 1d     
            bcc __c423         ; $c3ec: 90 35     
            cmp #$80           ; $c3ee: c9 80     
            bne __c419         ; $c3f0: d0 27     
            dec $13            ; $c3f2: c6 13     
            dec $13            ; $c3f4: c6 13     
            jsr __d8ea         ; $c3f6: 20 ea d8  
            lda $13            ; $c3f9: a5 13     
            cmp #$02           ; $c3fb: c9 02     
            bcs __c40b         ; $c3fd: b0 0c     
            ldx $7a            ; $c3ff: a6 7a     
            beq __c419         ; $c401: f0 16     
            lda #$03           ; $c403: a9 03     
            dex                ; $c405: ca        
            beq __c409         ; $c406: f0 01     
            asl                ; $c408: 0a        
__c409:     sta $52            ; $c409: 85 52     
__c40b:     dec $1f            ; $c40b: c6 1f     
            bne __c416         ; $c40d: d0 07     
            lda #$04           ; $c40f: a9 04     
            sta $1f            ; $c411: 85 1f     
            jsr __f2ec         ; $c413: 20 ec f2  
__c416:     jmp __c41d         ; $c416: 4c 1d c4  

;-------------------------------------------------------------------------------
__c419:     dec $d7            ; $c419: c6 d7     
            dec $d7            ; $c41b: c6 d7     
__c41d:     jsr __f737         ; $c41d: 20 37 f7  
            jmp __f67e         ; $c420: 4c 7e f6  

;-------------------------------------------------------------------------------
__c423:     lda $46            ; $c423: a5 46     
            bne __c42b         ; $c425: d0 04     
            lda #$10           ; $c427: a9 10     
            sta $46            ; $c429: 85 46     
__c42b:     cmp #$01           ; $c42b: c9 01     
            bne __c436         ; $c42d: d0 07     
            lda #$01           ; $c42f: a9 01     
            jsr __d4f5         ; $c431: 20 f5 d4  
            dec $54            ; $c434: c6 54     
__c436:     rts                ; $c436: 60        

;-------------------------------------------------------------------------------
__c437:     lda $34            ; $c437: a5 34     
            bne __c436         ; $c439: d0 fb     
            jsr __c726         ; $c43b: 20 26 c7  
            ror $c1            ; $c43e: 66 c1     
            .hex d7 c1         ; $c440: d7 c1     Invalid Opcode - DCP $c1,x
            sbc $adc2          ; $c442: ed c2 ad  
            .hex c2 b0         ; $c445: c2 b0     Invalid Opcode - NOP #$b0
            .hex c2 a4         ; $c447: c2 a4     Invalid Opcode - NOP #$a4
            .hex c3            ; $c449: c3        Suspected data
__c44a:     lda #$00           ; $c44a: a9 00     
            sta $57            ; $c44c: 85 57     
            jsr __c726         ; $c44e: 20 26 c7  
            rts                ; $c451: 60        

;-------------------------------------------------------------------------------
            cpy $fb            ; $c452: c4 fb     
            .hex cb 9e         ; $c454: cb 9e     Invalid Opcode - AXS #$9e
            cpy __cc67         ; $c456: cc 67 cc  
            jmp (__e8cc)       ; $c459: 6c cc e8  

;-------------------------------------------------------------------------------
            .hex c3            ; $c45c: c3        Suspected data
__c45d:     .hex 6f 00 38      ; $c45d: 6f 00 38  Invalid Opcode - RRA $3800
            lda $59            ; $c460: a5 59     
            and #$1f           ; $c462: 29 1f     
            sta $59            ; $c464: 85 59     
            jsr __f53e         ; $c466: 20 3e f5  
            lda $4e            ; $c469: a5 4e     
            bne __c484         ; $c46b: d0 17     
            sta $4015          ; $c46d: 8d 15 40  
            sta $58            ; $c470: 85 58     
            lda $59            ; $c472: a5 59     
            sta $03fe          ; $c474: 8d fe 03  
            lda $03fd          ; $c477: ad fd 03  
            and #$03           ; $c47a: 29 03     
            sta $59            ; $c47c: 85 59     
            lda #$01           ; $c47e: a9 01     
            sta $53            ; $c480: 85 53     
            bne __c4a4         ; $c482: d0 20     
__c484:     lda $4d            ; $c484: a5 4d     
            cmp #$01           ; $c486: c9 01     
            bne __c490         ; $c488: d0 06     
            lsr                ; $c48a: 4a        
            sta $4d            ; $c48b: 85 4d     
            ror                ; $c48d: 6a        
            sta $fb            ; $c48e: 85 fb     
__c490:     lda $15            ; $c490: a5 15     
            and #$20           ; $c492: 29 20     
            beq __c49e         ; $c494: f0 08     
            jsr __c4ba         ; $c496: 20 ba c4  
            lda #$80           ; $c499: a9 80     
            sta $4e            ; $c49b: 85 4e     
            rts                ; $c49d: 60        

;-------------------------------------------------------------------------------
__c49e:     lda $15            ; $c49e: a5 15     
            and #$10           ; $c4a0: 29 10     
            beq __c4b9         ; $c4a2: f0 15     
__c4a4:     lda #$05           ; $c4a4: a9 05     
            jsr __d4f5         ; $c4a6: 20 f5 d4  
            lda #$01           ; $c4a9: a9 01     
            sta $fb            ; $c4ab: 85 fb     
            lda #$03           ; $c4ad: a9 03     
            sta $20            ; $c4af: 85 20     
            ldy $58            ; $c4b1: a4 58     
            bne __c4b7         ; $c4b3: d0 02     
            lda #$fc           ; $c4b5: a9 fc     
__c4b7:     sta $21            ; $c4b7: 85 21     
__c4b9:     rts                ; $c4b9: 60        

;-------------------------------------------------------------------------------
__c4ba:     lda $58            ; $c4ba: a5 58     
            eor #$01           ; $c4bc: 49 01     
            sta $58            ; $c4be: 85 58     
__c4c0:     lda #$7f           ; $c4c0: a9 7f     
            ldy $58            ; $c4c2: a4 58     
            beq __c4c8         ; $c4c4: f0 02     
            lda #$8f           ; $c4c6: a9 8f     
__c4c8:     sta $0200          ; $c4c8: 8d 00 02  
            ldx #$02           ; $c4cb: a2 02     
__c4cd:     lda __c45d,x       ; $c4cd: bd 5d c4  
            sta $0201,x        ; $c4d0: 9d 01 02  
            dex                ; $c4d3: ca        
            bpl __c4cd         ; $c4d4: 10 f7     
            rts                ; $c4d6: 60        

;-------------------------------------------------------------------------------
__c4d7:     ldy #$17           ; $c4d7: a0 17     
__c4d9:     lda #$00           ; $c4d9: a9 00     
            sta $04c0,y        ; $c4db: 99 c0 04  
            lda #$ff           ; $c4de: a9 ff     
            sta $05c0,y        ; $c4e0: 99 c0 05  
            dey                ; $c4e3: 88        
            bpl __c4d9         ; $c4e4: 10 f3     
            ldy #$01           ; $c4e6: a0 01     
__c4e8:     sta $04c3,y        ; $c4e8: 99 c3 04  
            sta $04cb,y        ; $c4eb: 99 cb 04  
            sta $04d3,y        ; $c4ee: 99 d3 04  
            dey                ; $c4f1: 88        
            bpl __c4e8         ; $c4f2: 10 f4     
            ldx #$00           ; $c4f4: a2 00     
__c4f6:     lda #$00           ; $c4f6: a9 00     
            sta $0430,x        ; $c4f8: 9d 30 04  
            sta $0447,x        ; $c4fb: 9d 47 04  
            cpx #$48           ; $c4fe: e0 48     
            bcc __c508         ; $c500: 90 06     
            sta $0431,x        ; $c502: 9d 31 04  
            sta $0446,x        ; $c505: 9d 46 04  
__c508:     txa                ; $c508: 8a        
            clc                ; $c509: 18        
            adc #$18           ; $c50a: 69 18     
            tax                ; $c50c: aa        
            cpx #$90           ; $c50d: e0 90     
            bcc __c4f6         ; $c50f: 90 e5     
            rts                ; $c511: 60        

;-------------------------------------------------------------------------------
__c512:     brk                ; $c512: 00        
__c513:     brk                ; $c513: 00        
__c514:     brk                ; $c514: 00        
            .hex ff ff ff      ; $c515: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex f3 e7         ; $c518: f3 e7     Invalid Opcode - ISC ($e7),y
            .hex cf 33 33      ; $c51a: cf 33 33  Invalid Opcode - DCP $3333
            .hex 33            ; $c51d: 33        Suspected data
__c51e:     .hex 0f 0f 0f      ; $c51e: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            .hex 33 00         ; $c521: 33 00     Invalid Opcode - RLA ($00),y
            cpy $0fff          ; $c523: cc ff 0f  
            .hex ff c3 fc      ; $c526: ff c3 fc  Invalid Opcode - ISC __fcc3,x
            .hex 3f f0 f0      ; $c529: 3f f0 f0  Invalid Opcode - RLA __f0f0,x
            beq __c51e         ; $c52c: f0 f0     
            brk                ; $c52e: 00        
            .hex 0f cf cf      ; $c52f: 0f cf cf  Invalid Opcode - SLO __cfcf
            .hex 3f f0 00      ; $c532: 3f f0 00  Bad Addr Mode - RLA $00f0,x
            .hex ff cc cc      ; $c535: ff cc cc  Invalid Opcode - ISC __cccc,x
            cpy $33f3          ; $c538: cc f3 33  
            brk                ; $c53b: 00        
            .hex fc fc ff      ; $c53c: fc fc ff  Invalid Opcode - NOP $fffc,x
            .hex fc 00 3f      ; $c53f: fc 00 3f  Invalid Opcode - NOP $3f00,x
__c542:     jsr __e72b         ; $c542: 20 2b e7  
            lda #$bf           ; $c545: a9 bf     
            sta $0c            ; $c547: 85 0c     
            lda #$00           ; $c549: a9 00     
            sta $0d            ; $c54b: 85 0d     
            lda #$04           ; $c54d: a9 04     
            sta $0e            ; $c54f: 85 0e     
            ldx #$07           ; $c551: a2 07     
__c553:     lda $04,x          ; $c553: b5 04     
            asl                ; $c555: 0a        
            clc                ; $c556: 18        
            adc $04,x          ; $c557: 75 04     
            tay                ; $c559: a8        
            lda __c512,y       ; $c55a: b9 12 c5  
            sta $00            ; $c55d: 85 00     
            lda __c513,y       ; $c55f: b9 13 c5  
            sta $01            ; $c562: 85 01     
            lda __c514,y       ; $c564: b9 14 c5  
            sta $02            ; $c567: 85 02     
            ldy $0c            ; $c569: a4 0c     
            lda #$01           ; $c56b: a9 01     
            sta $1f            ; $c56d: 85 1f     
            jsr __c5d3         ; $c56f: 20 d3 c5  
            sty $0c            ; $c572: 84 0c     
            dex                ; $c574: ca        
            bpl __c553         ; $c575: 10 dc     
            ldx #$c0           ; $c577: a2 c0     
__c579:     lda #$00           ; $c579: a9 00     
            asl $0785          ; $c57b: 0e 85 07  
            bcs __c582         ; $c57e: b0 02     
            lda #$01           ; $c580: a9 01     
__c582:     sta $00            ; $c582: 85 00     
            ldy #$18           ; $c584: a0 18     
__c586:     lda $03ff,x        ; $c586: bd ff 03  
            bmi __c592         ; $c589: 30 07     
            lda $00            ; $c58b: a5 00     
            sta $03ff,x        ; $c58d: 9d ff 03  
            bne __c597         ; $c590: d0 05     
__c592:     lda #$ff           ; $c592: a9 ff     
            sta $04ff,x        ; $c594: 9d ff 04  
__c597:     dex                ; $c597: ca        
            beq __c5d2         ; $c598: f0 38     
            dey                ; $c59a: 88        
            bne __c586         ; $c59b: d0 e9     
            beq __c579         ; $c59d: f0 da     
__c59f:     beq __c5b0         ; $c59f: f0 0f     
            .hex e7 3c         ; $c5a1: e7 3c     Invalid Opcode - ISC $3c
            .hex fc 3f cf      ; $c5a3: fc 3f cf  Invalid Opcode - NOP __cf3f,x
            .hex e3            ; $c5a6: e3        Suspected data
__c5a7:     ldy #$d7           ; $c5a7: a0 d7     
__c5a9:     tya                ; $c5a9: 98        
            pha                ; $c5aa: 48        
            jsr __cace         ; $c5ab: 20 ce ca  
            ldx #$02           ; $c5ae: a2 02     
__c5b0:     lda $18,x          ; $c5b0: b5 18     
            and #$07           ; $c5b2: 29 07     
            tay                ; $c5b4: a8        
            lda __c59f,y       ; $c5b5: b9 9f c5  
            sta $00,x          ; $c5b8: 95 00     
            dex                ; $c5ba: ca        
            bpl __c5b0         ; $c5bb: 10 f3     
            pla                ; $c5bd: 68        
            tay                ; $c5be: a8        
            lda #$00           ; $c5bf: a9 00     
            sta $0d            ; $c5c1: 85 0d     
            lda #$05           ; $c5c3: a9 05     
            sta $0e            ; $c5c5: 85 0e     
            lda #$00           ; $c5c7: a9 00     
            sta $1f            ; $c5c9: 85 1f     
            jsr __c5d3         ; $c5cb: 20 d3 c5  
            cpy #$ff           ; $c5ce: c0 ff     
            bne __c5a9         ; $c5d0: d0 d7     
__c5d2:     rts                ; $c5d2: 60        

;-------------------------------------------------------------------------------
__c5d3:     lda #$00           ; $c5d3: a9 00     
            sta $0f            ; $c5d5: 85 0f     
            lda #$18           ; $c5d7: a9 18     
            sta $03            ; $c5d9: 85 03     
__c5db:     lsr $00            ; $c5db: 46 00     
            ror $01            ; $c5dd: 66 01     
            ror $02            ; $c5df: 66 02     
            php                ; $c5e1: 08        
            lda $1f            ; $c5e2: a5 1f     
            bne __c5ed         ; $c5e4: d0 07     
            lda $0f            ; $c5e6: a5 0f     
            beq __c5ef         ; $c5e8: f0 05     
            lda #$01           ; $c5ea: a9 01     
            .hex 2c            ; $c5ec: 2c        Suspected data
__c5ed:     lda #$00           ; $c5ed: a9 00     
__c5ef:     rol                ; $c5ef: 2a        
            beq __c5fc         ; $c5f0: f0 0a     
            cmp #$03           ; $c5f2: c9 03     
            bcs __c5f9         ; $c5f4: b0 03     
            lda #$02           ; $c5f6: a9 02     
            .hex 2c            ; $c5f8: 2c        Suspected data
__c5f9:     lda #$01           ; $c5f9: a9 01     
            .hex 2c            ; $c5fb: 2c        Suspected data
__c5fc:     lda #$ff           ; $c5fc: a9 ff     
            sta ($0d),y        ; $c5fe: 91 0d     
            plp                ; $c600: 28        
            bcs __c608         ; $c601: b0 05     
            lda #$00           ; $c603: a9 00     
            sta $0f            ; $c605: 85 0f     
            .hex 2c            ; $c607: 2c        Suspected data
__c608:     inc $0f            ; $c608: e6 0f     
            dey                ; $c60a: 88        
            dec $03            ; $c60b: c6 03     
            bne __c5db         ; $c60d: d0 cc     
__c60f:     rts                ; $c60f: 60        

;-------------------------------------------------------------------------------
__c610:     ora ($22),y        ; $c610: 11 22     
            ora ($38),y        ; $c612: 11 38     
            and #$28           ; $c614: 29 28     
            ora $1a21,y        ; $c616: 19 21 1a  
            plp                ; $c619: 28        
            rol                ; $c61a: 2a        
            .hex 12            ; $c61b: 12        Invalid Opcode - KIL 
            rol                ; $c61c: 2a        
            .hex 22            ; $c61d: 22        Invalid Opcode - KIL 
            .hex 14 12         ; $c61e: 14 12     Invalid Opcode - NOP $12,x
__c620:     lda $14            ; $c620: a5 14     
            and #$30           ; $c622: 29 30     
            beq __c63a         ; $c624: f0 14     
__c626:     lda $03fe          ; $c626: ad fe 03  
            sta $59            ; $c629: 85 59     
            lda #$0f           ; $c62b: a9 0f     
            sta $4015          ; $c62d: 8d 15 40  
            lda #$00           ; $c630: a9 00     
            sta $53            ; $c632: 85 53     
            inc $03fd          ; $c634: ee fd 03  
            jmp __d4f5         ; $c637: 4c f5 d4  

;-------------------------------------------------------------------------------
__c63a:     lda $55            ; $c63a: a5 55     
            cmp #$01           ; $c63c: c9 01     
            bne __c60f         ; $c63e: d0 cf     
            lda $51            ; $c640: a5 51     
            beq __c60f         ; $c642: f0 cb     
            lda $66            ; $c644: a5 66     
            cmp #$d4           ; $c646: c9 d4     
            bcs __c626         ; $c648: b0 dc     
            lda $03fa          ; $c64a: ad fa 03  
            and #$0f           ; $c64d: 29 0f     
            tax                ; $c64f: aa        
            lda __c610,x       ; $c650: bd 10 c6  
            ldy __c60f,x       ; $c653: bc 0f c6  
            ldx $03fb          ; $c656: ae fb 03  
            bne __c664         ; $c659: d0 09     
            tay                ; $c65b: a8        
            and #$f0           ; $c65c: 29 f0     
            sta $03fb          ; $c65e: 8d fb 03  
            inc $03fa          ; $c661: ee fa 03  
__c664:     tya                ; $c664: 98        
            and #$0f           ; $c665: 29 0f     
            sta $14            ; $c667: 85 14     
            tya                ; $c669: 98        
            asl                ; $c66a: 0a        
            asl                ; $c66b: 0a        
            asl                ; $c66c: 0a        
            asl                ; $c66d: 0a        
            ora $14            ; $c66e: 05 14     
            and #$c3           ; $c670: 29 c3     
            sta $14            ; $c672: 85 14     
            sta $15            ; $c674: 85 15     
            lda $50            ; $c676: a5 50     
            and #$01           ; $c678: 29 01     
            bne __c67f         ; $c67a: d0 03     
__c67c:     dec $03fb          ; $c67c: ce fb 03  
__c67f:     rts                ; $c67f: 60        

;-------------------------------------------------------------------------------
__c680:     .hex 22            ; $c680: 22        Invalid Opcode - KIL 
            .hex cd 05 00      ; $c681: cd 05 00  Bad Addr Mode - CMP $0005
            .hex 23 06         ; $c684: 23 06     Invalid Opcode - RLA ($06,x)
            ora $00            ; $c686: 05 00     
            .hex 23 14         ; $c688: 23 14     Invalid Opcode - RLA ($14,x)
            ora $00            ; $c68a: 05 00     
            plp                ; $c68c: 28        
            .hex c3 04         ; $c68d: c3 04     Invalid Opcode - DCP ($04,x)
            brk                ; $c68f: 00        
            jsr $04c3          ; $c690: 20 c3 04  
            brk                ; $c693: 00        
            .hex 3f 00 20      ; $c694: 3f 00 20  Invalid Opcode - RLA $2000,x
            .hex 0f 30 21      ; $c697: 0f 30 21  Invalid Opcode - SLO $2130
            ora ($0f,x)        ; $c69a: 01 0f     
            rol $2a            ; $c69c: 26 2a     
            bmi __c6af         ; $c69e: 30 0f     
            sec                ; $c6a0: 38        
            and #$0a           ; $c6a1: 29 0a     
            .hex 0f 27 17      ; $c6a3: 0f 27 17  Invalid Opcode - SLO $1727
            .hex 07 0f         ; $c6a6: 07 0f     Invalid Opcode - SLO $0f
            bmi __c6bb         ; $c6a8: 30 11     
            rol $0f            ; $c6aa: 26 0f     
            bmi __c6c3         ; $c6ac: 30 15     
            .hex 26            ; $c6ae: 26        Suspected data
__c6af:     .hex 0f 30 21      ; $c6af: 0f 30 21  Invalid Opcode - SLO $2130
            .hex 12            ; $c6b2: 12        Invalid Opcode - KIL 
            .hex 0f 38 29      ; $c6b3: 0f 38 29  Invalid Opcode - SLO $2938
            asl                ; $c6b6: 0a        
            brk                ; $c6b7: 00        
            .hex 23 e8         ; $c6b8: 23 e8     Invalid Opcode - RLA ($e8,x)
            cli                ; $c6ba: 58        
__c6bb:     .hex ff 23 e0      ; $c6bb: ff 23 e0  Invalid Opcode - ISC __e023,x
            .hex 02            ; $c6be: 02        Invalid Opcode - KIL 
            beq __c6f1         ; $c6bf: f0 30     
            .hex 23 e6         ; $c6c1: 23 e6     Invalid Opcode - RLA ($e6,x)
__c6c3:     .hex 02            ; $c6c3: 02        Invalid Opcode - KIL 
            cpy #$f0           ; $c6c4: c0 f0     
            .hex 2b c0         ; $c6c6: 2b c0     Invalid Opcode - ANC #$c0
            pha                ; $c6c8: 48        
            .hex ff 2b c8      ; $c6c9: ff 2b c8  Invalid Opcode - ISC __c82b,x
            pha                ; $c6cc: 48        
            .hex af 2b d0      ; $c6cd: af 2b d0  Invalid Opcode - LAX __d02b
            bvc __c67c         ; $c6d0: 50 aa     
            .hex 2b e0         ; $c6d2: 2b e0     Invalid Opcode - ANC #$e0
            pha                ; $c6d4: 48        
            asl                ; $c6d5: 0a        
            .hex 2b c9         ; $c6d6: 2b c9     Invalid Opcode - ANC #$c9
            lsr $ff            ; $c6d8: 46 ff     
            rol                ; $c6da: 2a        
            rti                ; $c6db: 40        

;-------------------------------------------------------------------------------
            rts                ; $c6dc: 60        

;-------------------------------------------------------------------------------
            and ($2a),y        ; $c6dd: 31 2a     
            rts                ; $c6df: 60        

;-------------------------------------------------------------------------------
            .hex 7f 32 00      ; $c6e0: 7f 32 00  Bad Addr Mode - RRA $0032,x
            .hex 23 e0         ; $c6e3: 23 e0     Invalid Opcode - RLA ($e0,x)
            rts                ; $c6e5: 60        

;-------------------------------------------------------------------------------
            brk                ; $c6e6: 00        
            .hex 23 c8         ; $c6e7: 23 c8     Invalid Opcode - RLA ($c8,x)
            .hex 02            ; $c6e9: 02        Invalid Opcode - KIL 
            .hex 44 55         ; $c6ea: 44 55     Invalid Opcode - NOP $55
            brk                ; $c6ec: 00        
            .hex 2b c0         ; $c6ed: 2b c0     Invalid Opcode - ANC #$c0
            adc ($00),y        ; $c6ef: 71 00     
__c6f1:     .hex 2b c8         ; $c6f1: 2b c8     Invalid Opcode - ANC #$c8
            .hex 02            ; $c6f3: 02        Invalid Opcode - KIL 
            .hex 44 55         ; $c6f4: 44 55     Invalid Opcode - NOP $55
            brk                ; $c6f6: 00        
__c6f7:     ldy #$04           ; $c6f7: a0 04     
__c6f9:     bpl __c70d         ; $c6f9: 10 12     
__c6fb:     jsr __c891         ; $c6fb: 20 91 c8  
            lda __c6f9,x       ; $c6fe: bd f9 c6  
            sta $2006          ; $c701: 8d 06 20  
            lda __c6f7,x       ; $c704: bd f7 c6  
            sta $2006          ; $c707: 8d 06 20  
            lda $2007          ; $c70a: ad 07 20  
__c70d:     lda #$00           ; $c70d: a9 00     
            sta $00            ; $c70f: 85 00     
            tay                ; $c711: a8        
            lda #$04           ; $c712: a9 04     
            sta $01            ; $c714: 85 01     
            ldx #$02           ; $c716: a2 02     
__c718:     lda $2007          ; $c718: ad 07 20  
            sta ($00),y        ; $c71b: 91 00     
            iny                ; $c71d: c8        
            bne __c718         ; $c71e: d0 f8     
            inc $01            ; $c720: e6 01     
            dex                ; $c722: ca        
            bne __c718         ; $c723: d0 f3     
            rts                ; $c725: 60        

;-------------------------------------------------------------------------------
__c726:     lda $55            ; $c726: a5 55     
__c728:     asl                ; $c728: 0a        
            tay                ; $c729: a8        
            pla                ; $c72a: 68        
            sta $00            ; $c72b: 85 00     
            pla                ; $c72d: 68        
            sta $01            ; $c72e: 85 01     
            iny                ; $c730: c8        
            lda ($00),y        ; $c731: b1 00     
            sta $02            ; $c733: 85 02     
            iny                ; $c735: c8        
            lda ($00),y        ; $c736: b1 00     
            sta $03            ; $c738: 85 03     
            jmp ($0002)        ; $c73a: 6c 02 00  

;-------------------------------------------------------------------------------
            sta $03            ; $c73d: 85 03     
            txa                ; $c73f: 8a        
            pha                ; $c740: 48        
            tya                ; $c741: 98        
            pha                ; $c742: 48        
            lda #$02           ; $c743: a9 02     
            sta $05            ; $c745: 85 05     
            lda #$0f           ; $c747: a9 0f     
            and $03            ; $c749: 25 03     
            sta $07            ; $c74b: 85 07     
            lda $03            ; $c74d: a5 03     
            lsr                ; $c74f: 4a        
            lsr                ; $c750: 4a        
            lsr                ; $c751: 4a        
            lsr                ; $c752: 4a        
            sta $06            ; $c753: 85 06     
            tax                ; $c755: aa        
            lda #$00           ; $c756: a9 00     
            clc                ; $c758: 18        
__c759:     adc $07            ; $c759: 65 07     
            dex                ; $c75b: ca        
            bne __c759         ; $c75c: d0 fb     
            sta $08            ; $c75e: 85 08     
            tax                ; $c760: aa        
            lda $0e            ; $c761: a5 0e     
            beq __c76f         ; $c763: f0 0a     
            jsr __c777         ; $c765: 20 77 c7  
            lda $0f            ; $c768: a5 0f     
            beq __c76f         ; $c76a: f0 03     
            jsr __c7c1         ; $c76c: 20 c1 c7  
__c76f:     jsr __c7f5         ; $c76f: 20 f5 c7  
            pla                ; $c772: 68        
            tay                ; $c773: a8        
            pla                ; $c774: 68        
            tax                ; $c775: aa        
            rts                ; $c776: 60        

;-------------------------------------------------------------------------------
__c777:     lda $02            ; $c777: a5 02     
            ldy #$01           ; $c779: a0 01     
__c77b:     sta ($04),y        ; $c77b: 91 04     
            clc                ; $c77d: 18        
            adc #$01           ; $c77e: 69 01     
            iny                ; $c780: c8        
            pha                ; $c781: 48        
            lda ($04),y        ; $c782: b1 04     
            and #$3f           ; $c784: 29 3f     
            sta ($04),y        ; $c786: 91 04     
            txa                ; $c788: 8a        
            pha                ; $c789: 48        
            lda $0d            ; $c78a: a5 0d     
            and #$03           ; $c78c: 29 03     
            ldx $09            ; $c78e: a6 09     
            cpx #$03           ; $c790: e0 03     
            bmi __c7a5         ; $c792: 30 11     
            cpx #$18           ; $c794: e0 18     
            bcs __c7a5         ; $c796: b0 0d     
            ldx $55            ; $c798: a6 55     
            dex                ; $c79a: ca        
            bne __c7a5         ; $c79b: d0 08     
            ldx $09            ; $c79d: a6 09     
            cpx #$03           ; $c79f: e0 03     
            beq __c7a5         ; $c7a1: f0 02     
            ora #$20           ; $c7a3: 09 20     
__c7a5:     sta ($04),y        ; $c7a5: 91 04     
            pla                ; $c7a7: 68        
            tax                ; $c7a8: aa        
            lsr $0a            ; $c7a9: 46 0a     
            ror $0b            ; $c7ab: 66 0b     
            ror $0c            ; $c7ad: 66 0c     
            ror $0d            ; $c7af: 66 0d     
            lsr $0a            ; $c7b1: 46 0a     
            ror $0b            ; $c7b3: 66 0b     
            ror $0c            ; $c7b5: 66 0c     
            ror $0d            ; $c7b7: 66 0d     
            pla                ; $c7b9: 68        
            iny                ; $c7ba: c8        
            iny                ; $c7bb: c8        
            iny                ; $c7bc: c8        
            dex                ; $c7bd: ca        
            bne __c77b         ; $c7be: d0 bb     
            rts                ; $c7c0: 60        

;-------------------------------------------------------------------------------
__c7c1:     ldy #$01           ; $c7c1: a0 01     
            .hex 84            ; $c7c3: 84        Suspected data
__c7c4:     asl                ; $c7c4: 0a        
            lda $08            ; $c7c5: a5 08     
            sec                ; $c7c7: 38        
            sbc $06            ; $c7c8: e5 06     
__c7ca:     tay                ; $c7ca: a8        
            sta $0b            ; $c7cb: 85 0b     
            ldx $06            ; $c7cd: a6 06     
__c7cf:     tya                ; $c7cf: 98        
            pha                ; $c7d0: 48        
            clc                ; $c7d1: 18        
            tya                ; $c7d2: 98        
            adc $02            ; $c7d3: 65 02     
            ldy $0a            ; $c7d5: a4 0a     
            sta ($04),y        ; $c7d7: 91 04     
            iny                ; $c7d9: c8        
            lda ($04),y        ; $c7da: b1 04     
            and #$3f           ; $c7dc: 29 3f     
            eor #$40           ; $c7de: 49 40     
            sta ($04),y        ; $c7e0: 91 04     
            iny                ; $c7e2: c8        
            iny                ; $c7e3: c8        
            iny                ; $c7e4: c8        
            sty $0a            ; $c7e5: 84 0a     
            pla                ; $c7e7: 68        
            tay                ; $c7e8: a8        
            iny                ; $c7e9: c8        
            dex                ; $c7ea: ca        
            bne __c7cf         ; $c7eb: d0 e2     
            lda $0b            ; $c7ed: a5 0b     
            sec                ; $c7ef: 38        
            sbc $06            ; $c7f0: e5 06     
            bpl __c7ca         ; $c7f2: 10 d6     
            rts                ; $c7f4: 60        

;-------------------------------------------------------------------------------
__c7f5:     ldy #$00           ; $c7f5: a0 00     
__c7f7:     ldx $06            ; $c7f7: a6 06     
            lda $01            ; $c7f9: a5 01     
            sta $09            ; $c7fb: 85 09     
__c7fd:     lda $09            ; $c7fd: a5 09     
            sta ($04),y        ; $c7ff: 91 04     
            clc                ; $c801: 18        
            adc #$08           ; $c802: 69 08     
            sta $09            ; $c804: 85 09     
            iny                ; $c806: c8        
            iny                ; $c807: c8        
            iny                ; $c808: c8        
            lda $00            ; $c809: a5 00     
            sta ($04),y        ; $c80b: 91 04     
            iny                ; $c80d: c8        
            dex                ; $c80e: ca        
            bne __c7fd         ; $c80f: d0 ec     
            lda $00            ; $c811: a5 00     
            clc                ; $c813: 18        
            adc #$08           ; $c814: 69 08     
            sta $00            ; $c816: 85 00     
            dec $07            ; $c818: c6 07     
            bne __c7f7         ; $c81a: d0 db     
            rts                ; $c81c: 60        

;-------------------------------------------------------------------------------
__c81d:     ldx #$40           ; $c81d: a2 40     
            lda #$00           ; $c81f: a9 00     
__c821:     sta $04            ; $c821: 85 04     
            lda #$02           ; $c823: a9 02     
            sta $05            ; $c825: 85 05     
            ldy #$00           ; $c827: a0 00     
__c829:     lda #$f8           ; $c829: a9 f8     
            sta ($04),y        ; $c82b: 91 04     
            iny                ; $c82d: c8        
            iny                ; $c82e: c8        
            lda #$00           ; $c82f: a9 00     
            sta ($04),y        ; $c831: 91 04     
            iny                ; $c833: c8        
            iny                ; $c834: c8        
            dex                ; $c835: ca        
            bne __c829         ; $c836: d0 f1     
            rts                ; $c838: 60        

;-------------------------------------------------------------------------------
__c839:     .hex 22            ; $c839: 22        Invalid Opcode - KIL 
            .hex 17 22         ; $c83a: 17 22     Invalid Opcode - SLO $22,x
            .hex 27            ; $c83c: 27        Suspected data
__c83d:     stx $0f            ; $c83d: 86 0f     
            tax                ; $c83f: aa        
            lda $e0,x          ; $c840: b5 e0     
            bne __c853         ; $c842: d0 0f     
            sta $e6,x          ; $c844: 95 e6     
            lda #$08           ; $c846: a9 08     
            sta $e8,x          ; $c848: 95 e8     
            lda #$f0           ; $c84a: a9 f0     
            sta $ea,x          ; $c84c: 95 ea     
            inc $e0,x          ; $c84e: f6 e0     
            jmp __c868         ; $c850: 4c 68 c8  

;-------------------------------------------------------------------------------
__c853:     lda $e6,x          ; $c853: b5 e6     
            cmp #$08           ; $c855: c9 08     
            bcs __c868         ; $c857: b0 0f     
            ldy $2f,x          ; $c859: b4 2f     
            lda $e8,x          ; $c85b: b5 e8     
            adc __c839,y       ; $c85d: 79 39 c8  
            sta $e8,x          ; $c860: 95 e8     
            lda $e6,x          ; $c862: b5 e6     
            adc #$00           ; $c864: 69 00     
            sta $e6,x          ; $c866: 95 e6     
__c868:     lda $ea,x          ; $c868: b5 ea     
            sec                ; $c86a: 38        
            sbc $e2,x          ; $c86b: f5 e2     
            sta $ea,x          ; $c86d: 95 ea     
            lda $01            ; $c86f: a5 01     
            sbc $e4,x          ; $c871: f5 e4     
            pha                ; $c873: 48        
            clc                ; $c874: 18        
            lda $ea,x          ; $c875: b5 ea     
            adc $e8,x          ; $c877: 75 e8     
            sta $ea,x          ; $c879: 95 ea     
            pla                ; $c87b: 68        
            adc $e6,x          ; $c87c: 75 e6     
            sta $01            ; $c87e: 85 01     
            ldx $0f            ; $c880: a6 0f     
            rts                ; $c882: 60        

;-------------------------------------------------------------------------------
__c883:     lda #$10           ; $c883: a9 10     
            jsr __c148         ; $c885: 20 48 c1  
            lda #$00           ; $c888: a9 00     
            sta $12            ; $c88a: 85 12     
            sta $13            ; $c88c: 85 13     
            jmp __cb81         ; $c88e: 4c 81 cb  

;-------------------------------------------------------------------------------
__c891:     lda #$00           ; $c891: a9 00     
            sta $2001          ; $c893: 8d 01 20  
            rts                ; $c896: 60        

;-------------------------------------------------------------------------------
            jsr __c15d         ; $c897: 20 5d c1  
__c89a:     jsr __c891         ; $c89a: 20 91 c8  
            lda #$20           ; $c89d: a9 20     
            jsr __c8a4         ; $c89f: 20 a4 c8  
            lda #$28           ; $c8a2: a9 28     
__c8a4:     sta $00            ; $c8a4: 85 00     
            lda $2002          ; $c8a6: ad 02 20  
            lda $10            ; $c8a9: a5 10     
            and #$fb           ; $c8ab: 29 fb     
            sta $2000          ; $c8ad: 8d 00 20  
            lda $00            ; $c8b0: a5 00     
            sta $2006          ; $c8b2: 8d 06 20  
            lda #$00           ; $c8b5: a9 00     
            sta $2006          ; $c8b7: 8d 06 20  
            tay                ; $c8ba: a8        
            ldx #$04           ; $c8bb: a2 04     
            lda #$38           ; $c8bd: a9 38     
__c8bf:     sta $2007          ; $c8bf: 8d 07 20  
            dey                ; $c8c2: 88        
            bne __c8bf         ; $c8c3: d0 fa     
            dex                ; $c8c5: ca        
            bne __c8bf         ; $c8c6: d0 f7     
            lda $00            ; $c8c8: a5 00     
            clc                ; $c8ca: 18        
            adc #$03           ; $c8cb: 69 03     
            sta $2006          ; $c8cd: 8d 06 20  
            lda #$c0           ; $c8d0: a9 c0     
            sta $2006          ; $c8d2: 8d 06 20  
            ldy #$40           ; $c8d5: a0 40     
            lda #$00           ; $c8d7: a9 00     
__c8d9:     sta $2007          ; $c8d9: 8d 07 20  
            dey                ; $c8dc: 88        
            bne __c8d9         ; $c8dd: d0 fa     
            rts                ; $c8df: 60        

;-------------------------------------------------------------------------------
__c8e0:     sta $00            ; $c8e0: 85 00     
            ldx $00            ; $c8e2: a6 00     
            jsr __c8ee         ; $c8e4: 20 ee c8  
            lda $00            ; $c8e7: a5 00     
            lsr                ; $c8e9: 4a        
            lsr                ; $c8ea: 4a        
            lsr                ; $c8eb: 4a        
            lsr                ; $c8ec: 4a        
            tax                ; $c8ed: aa        
__c8ee:     inx                ; $c8ee: e8        
            txa                ; $c8ef: 8a        
            and #$0f           ; $c8f0: 29 0f     
            cmp #$09           ; $c8f2: c9 09     
            bcs __c94a         ; $c8f4: b0 54     
            asl                ; $c8f6: 0a        
            asl                ; $c8f7: 0a        
            tay                ; $c8f8: a8        
            ldx $0300          ; $c8f9: ae 00 03  
            lda __c680,y       ; $c8fc: b9 80 c6  
            sta $0301,x        ; $c8ff: 9d 01 03  
            jsr __cb8c         ; $c902: 20 8c cb  
            iny                ; $c905: c8        
            lda __c680,y       ; $c906: b9 80 c6  
            sta $0301,x        ; $c909: 9d 01 03  
            jsr __cb8c         ; $c90c: 20 8c cb  
            iny                ; $c90f: c8        
            lda __c680,y       ; $c910: b9 80 c6  
            and #$07           ; $c913: 29 07     
            sta $0301,x        ; $c915: 9d 01 03  
            sta $01            ; $c918: 85 01     
            txa                ; $c91a: 8a        
            sec                ; $c91b: 38        
            adc $01            ; $c91c: 65 01     
            jsr __cb8e         ; $c91e: 20 8e cb  
            tax                ; $c921: aa        
            stx $0300          ; $c922: 8e 00 03  
            lda #$00           ; $c925: a9 00     
            sta $0301,x        ; $c927: 9d 01 03  
            iny                ; $c92a: c8        
__c92b:     dex                ; $c92b: ca        
            lda $07ec,y        ; $c92c: b9 ec 07  
            and #$0f           ; $c92f: 29 0f     
            sta $0301,x        ; $c931: 9d 01 03  
            dec $01            ; $c934: c6 01     
            beq __c94a         ; $c936: f0 12     
            dex                ; $c938: ca        
            lda $07ec,y        ; $c939: b9 ec 07  
            and #$f0           ; $c93c: 29 f0     
            lsr                ; $c93e: 4a        
            lsr                ; $c93f: 4a        
            lsr                ; $c940: 4a        
            lsr                ; $c941: 4a        
            sta $0301,x        ; $c942: 9d 01 03  
            dey                ; $c945: 88        
            dec $01            ; $c946: c6 01     
            bne __c92b         ; $c948: d0 e1     
__c94a:     rts                ; $c94a: 60        

;-------------------------------------------------------------------------------
__c94b:     ldx #$ff           ; $c94b: a2 ff     
            .hex 2c            ; $c94d: 2c        Suspected data
__c94e:     ldx #$00           ; $c94e: a2 00     
            sta $00            ; $c950: 85 00     
            stx $04            ; $c952: 86 04     
            ldx #$00           ; $c954: a2 00     
            stx $05            ; $c956: 86 05     
            stx $06            ; $c958: 86 06     
            stx $07            ; $c95a: 86 07     
            lda $01            ; $c95c: a5 01     
            and #$08           ; $c95e: 29 08     
            bne __c963         ; $c960: d0 01     
            inx                ; $c962: e8        
__c963:     lda $00            ; $c963: a5 00     
            sta $06,x          ; $c965: 95 06     
            lda $01            ; $c967: a5 01     
            and #$07           ; $c969: 29 07     
            asl                ; $c96b: 0a        
            asl                ; $c96c: 0a        
            tax                ; $c96d: aa        
            lda $04            ; $c96e: a5 04     
            beq __c995         ; $c970: f0 23     
            lda $07f0,x        ; $c972: bd f0 07  
            beq __c99a         ; $c975: f0 23     
__c977:     clc                ; $c977: 18        
            jsr __ca44         ; $c978: 20 44 ca  
            jsr __c9d7         ; $c97b: 20 d7 c9  
            jsr __ca2c         ; $c97e: 20 2c ca  
            sta $03            ; $c981: 85 03     
            lda $06            ; $c983: a5 06     
            jsr __c9d7         ; $c985: 20 d7 c9  
            jsr __ca36         ; $c988: 20 36 ca  
            sta $03            ; $c98b: 85 03     
            lda $05            ; $c98d: a5 05     
            jsr __c9d7         ; $c98f: 20 d7 c9  
            jmp __ca40         ; $c992: 4c 40 ca  

;-------------------------------------------------------------------------------
__c995:     lda $07f0,x        ; $c995: bd f0 07  
            beq __c977         ; $c998: f0 dd     
__c99a:     sec                ; $c99a: 38        
            jsr __ca44         ; $c99b: 20 44 ca  
            jsr __ca29         ; $c99e: 20 29 ca  
            sta $03            ; $c9a1: 85 03     
            lda $06            ; $c9a3: a5 06     
            jsr __ca33         ; $c9a5: 20 33 ca  
            sta $03            ; $c9a8: 85 03     
            lda $05            ; $c9aa: a5 05     
            jsr __ca3d         ; $c9ac: 20 3d ca  
            bne __c9bb         ; $c9af: d0 0a     
            lda $07f2,x        ; $c9b1: bd f2 07  
            bne __c9bb         ; $c9b4: d0 05     
            lda $07f3,x        ; $c9b6: bd f3 07  
            beq __c9c2         ; $c9b9: f0 07     
__c9bb:     bcs __c9d6         ; $c9bb: b0 19     
            lda $07f0,x        ; $c9bd: bd f0 07  
            eor #$ff           ; $c9c0: 49 ff     
__c9c2:     sta $07f0,x        ; $c9c2: 9d f0 07  
            sec                ; $c9c5: 38        
            lda #$00           ; $c9c6: a9 00     
            sta $03            ; $c9c8: 85 03     
            lda $07f3,x        ; $c9ca: bd f3 07  
            jsr __ca29         ; $c9cd: 20 29 ca  
            jsr __ca33         ; $c9d0: 20 33 ca  
            jsr __ca3d         ; $c9d3: 20 3d ca  
__c9d6:     rts                ; $c9d6: 60        

;-------------------------------------------------------------------------------
__c9d7:     jsr __ca1a         ; $c9d7: 20 1a ca  
            adc $01            ; $c9da: 65 01     
            cmp #$0a           ; $c9dc: c9 0a     
            bcc __c9e2         ; $c9de: 90 02     
            adc #$05           ; $c9e0: 69 05     
__c9e2:     clc                ; $c9e2: 18        
            adc $02            ; $c9e3: 65 02     
            sta $02            ; $c9e5: 85 02     
            lda $03            ; $c9e7: a5 03     
            and #$f0           ; $c9e9: 29 f0     
            adc $02            ; $c9eb: 65 02     
            bcc __c9f3         ; $c9ed: 90 04     
__c9ef:     adc #$5f           ; $c9ef: 69 5f     
            sec                ; $c9f1: 38        
            rts                ; $c9f2: 60        

;-------------------------------------------------------------------------------
__c9f3:     cmp #$a0           ; $c9f3: c9 a0     
            bcs __c9ef         ; $c9f5: b0 f8     
            rts                ; $c9f7: 60        

;-------------------------------------------------------------------------------
__c9f8:     jsr __ca1a         ; $c9f8: 20 1a ca  
            sbc $01            ; $c9fb: e5 01     
            sta $01            ; $c9fd: 85 01     
            bcs __ca0b         ; $c9ff: b0 0a     
            adc #$0a           ; $ca01: 69 0a     
            sta $01            ; $ca03: 85 01     
            lda $02            ; $ca05: a5 02     
            adc #$0f           ; $ca07: 69 0f     
            sta $02            ; $ca09: 85 02     
__ca0b:     lda $03            ; $ca0b: a5 03     
            and #$f0           ; $ca0d: 29 f0     
            sec                ; $ca0f: 38        
            sbc $02            ; $ca10: e5 02     
            bcs __ca17         ; $ca12: b0 03     
            adc #$a0           ; $ca14: 69 a0     
            clc                ; $ca16: 18        
__ca17:     ora $01            ; $ca17: 05 01     
            rts                ; $ca19: 60        

;-------------------------------------------------------------------------------
__ca1a:     pha                ; $ca1a: 48        
            and #$0f           ; $ca1b: 29 0f     
            sta $01            ; $ca1d: 85 01     
            pla                ; $ca1f: 68        
            and #$f0           ; $ca20: 29 f0     
            sta $02            ; $ca22: 85 02     
            lda $03            ; $ca24: a5 03     
            and #$0f           ; $ca26: 29 0f     
            rts                ; $ca28: 60        

;-------------------------------------------------------------------------------
__ca29:     jsr __c9f8         ; $ca29: 20 f8 c9  
__ca2c:     sta $07f3,x        ; $ca2c: 9d f3 07  
            lda $07f2,x        ; $ca2f: bd f2 07  
            rts                ; $ca32: 60        

;-------------------------------------------------------------------------------
__ca33:     jsr __c9f8         ; $ca33: 20 f8 c9  
__ca36:     sta $07f2,x        ; $ca36: 9d f2 07  
            lda $07f1,x        ; $ca39: bd f1 07  
            rts                ; $ca3c: 60        

;-------------------------------------------------------------------------------
__ca3d:     jsr __c9f8         ; $ca3d: 20 f8 c9  
__ca40:     sta $07f1,x        ; $ca40: 9d f1 07  
            rts                ; $ca43: 60        

;-------------------------------------------------------------------------------
__ca44:     lda $07f3,x        ; $ca44: bd f3 07  
            sta $03            ; $ca47: 85 03     
            lda $07            ; $ca49: a5 07     
            rts                ; $ca4b: 60        

;-------------------------------------------------------------------------------
__ca4c:     lda #$00           ; $ca4c: a9 00     
            sta $04            ; $ca4e: 85 04     
            clc                ; $ca50: 18        
            lda $00            ; $ca51: a5 00     
            adc #$10           ; $ca53: 69 10     
            and #$f0           ; $ca55: 29 f0     
            lsr                ; $ca57: 4a        
            lsr                ; $ca58: 4a        
            tay                ; $ca59: a8        
            lda $00            ; $ca5a: a5 00     
            and #$07           ; $ca5c: 29 07     
            asl                ; $ca5e: 0a        
            asl                ; $ca5f: 0a        
            tax                ; $ca60: aa        
__ca61:     lda $07ec,y        ; $ca61: b9 ec 07  
            beq __cac1         ; $ca64: f0 5b     
            lda $07f0,x        ; $ca66: bd f0 07  
            beq __ca94         ; $ca69: f0 29     
__ca6b:     sec                ; $ca6b: 38        
            lda $07ef,y        ; $ca6c: b9 ef 07  
            sta $03            ; $ca6f: 85 03     
            lda $07f3,x        ; $ca71: bd f3 07  
            jsr __c9f8         ; $ca74: 20 f8 c9  
            lda $07ee,y        ; $ca77: b9 ee 07  
            sta $03            ; $ca7a: 85 03     
            lda $07f2,x        ; $ca7c: bd f2 07  
            jsr __c9f8         ; $ca7f: 20 f8 c9  
            lda $07ed,y        ; $ca82: b9 ed 07  
            sta $03            ; $ca85: 85 03     
            lda $07f1,x        ; $ca87: bd f1 07  
            jsr __c9f8         ; $ca8a: 20 f8 c9  
            bcs __cac6         ; $ca8d: b0 37     
            lda $07ec,y        ; $ca8f: b9 ec 07  
            bne __cacb         ; $ca92: d0 37     
__ca94:     lda #$ff           ; $ca94: a9 ff     
            sta $04            ; $ca96: 85 04     
            sec                ; $ca98: 38        
__ca99:     tya                ; $ca99: 98        
            bne __cac0         ; $ca9a: d0 24     
            bcc __cab4         ; $ca9c: 90 16     
            txa                ; $ca9e: 8a        
            pha                ; $ca9f: 48        
            tya                ; $caa0: 98        
            pha                ; $caa1: 48        
            ldy #$00           ; $caa2: a0 00     
__caa4:     lda $07f0,x        ; $caa4: bd f0 07  
            sta $07ec,y        ; $caa7: 99 ec 07  
            inx                ; $caaa: e8        
            iny                ; $caab: c8        
            cpy #$04           ; $caac: c0 04     
            bcc __caa4         ; $caae: 90 f4     
            pla                ; $cab0: 68        
            tay                ; $cab1: a8        
            pla                ; $cab2: 68        
            tax                ; $cab3: aa        
__cab4:     lda $00            ; $cab4: a5 00     
            and #$08           ; $cab6: 29 08     
            beq __cac0         ; $cab8: f0 06     
            dex                ; $caba: ca        
            dex                ; $cabb: ca        
            dex                ; $cabc: ca        
            dex                ; $cabd: ca        
            bpl __ca61         ; $cabe: 10 a1     
__cac0:     rts                ; $cac0: 60        

;-------------------------------------------------------------------------------
__cac1:     lda $07f0,x        ; $cac1: bd f0 07  
            beq __ca6b         ; $cac4: f0 a5     
__cac6:     lda $07ec,y        ; $cac6: b9 ec 07  
            bne __ca94         ; $cac9: d0 c9     
__cacb:     clc                ; $cacb: 18        
            bcc __ca99         ; $cacc: 90 cb     
__cace:     ldx #$00           ; $cace: a2 00     
            ldy #$05           ; $cad0: a0 05     
            lda $18            ; $cad2: a5 18     
            bne __cad8         ; $cad4: d0 02     
            lda #$37           ; $cad6: a9 37     
__cad8:     and #$02           ; $cad8: 29 02     
            sta $00            ; $cada: 85 00     
            lda $19            ; $cadc: a5 19     
            and #$02           ; $cade: 29 02     
            eor $00            ; $cae0: 45 00     
            clc                ; $cae2: 18        
            beq __cae6         ; $cae3: f0 01     
            sec                ; $cae5: 38        
__cae6:     ror $18,x          ; $cae6: 76 18     
            inx                ; $cae8: e8        
            dey                ; $cae9: 88        
            bne __cae6         ; $caea: d0 fa     
            rts                ; $caec: 60        

;-------------------------------------------------------------------------------
__caed:     jsr __cb35         ; $caed: 20 35 cb  
            lda #$01           ; $caf0: a9 01     
            sta $4016          ; $caf2: 8d 16 40  
            ldx #$00           ; $caf5: a2 00     
            lda #$00           ; $caf7: a9 00     
            sta $4016          ; $caf9: 8d 16 40  
            jsr __cb00         ; $cafc: 20 00 cb  
            inx                ; $caff: e8        
__cb00:     ldy #$08           ; $cb00: a0 08     
__cb02:     pha                ; $cb02: 48        
            lda $4016,x        ; $cb03: bd 16 40  
            sta $00            ; $cb06: 85 00     
            lsr                ; $cb08: 4a        
            ora $00            ; $cb09: 05 00     
            lsr                ; $cb0b: 4a        
            pla                ; $cb0c: 68        
            rol                ; $cb0d: 2a        
            dey                ; $cb0e: 88        
            bne __cb02         ; $cb0f: d0 f1     
            stx $00            ; $cb11: 86 00     
            asl $00            ; $cb13: 06 00     
            ldx $00            ; $cb15: a6 00     
            ldy $14,x          ; $cb17: b4 14     
            sty $00            ; $cb19: 84 00     
            sta $14,x          ; $cb1b: 95 14     
            sta $15,x          ; $cb1d: 95 15     
            ldy #$04           ; $cb1f: a0 04     
__cb21:     lda $02            ; $cb21: a5 02     
            bit $00            ; $cb23: 24 00     
            beq __cb2d         ; $cb25: f0 06     
            lda $15,x          ; $cb27: b5 15     
            and $01            ; $cb29: 25 01     
            sta $15,x          ; $cb2b: 95 15     
__cb2d:     sec                ; $cb2d: 38        
            ror $01            ; $cb2e: 66 01     
            lsr $02            ; $cb30: 46 02     
            dey                ; $cb32: 88        
            bne __cb21         ; $cb33: d0 ec     
__cb35:     lda #$7f           ; $cb35: a9 7f     
            sta $01            ; $cb37: 85 01     
            lda #$80           ; $cb39: a9 80     
            sta $02            ; $cb3b: 85 02     
            rts                ; $cb3d: 60        

;-------------------------------------------------------------------------------
__cb3e:     sta $2006          ; $cb3e: 8d 06 20  
            iny                ; $cb41: c8        
            lda ($00),y        ; $cb42: b1 00     
            sta $2006          ; $cb44: 8d 06 20  
            iny                ; $cb47: c8        
            lda ($00),y        ; $cb48: b1 00     
            asl                ; $cb4a: 0a        
            pha                ; $cb4b: 48        
            lda $10            ; $cb4c: a5 10     
            ora #$04           ; $cb4e: 09 04     
            bcs __cb54         ; $cb50: b0 02     
            and #$fb           ; $cb52: 29 fb     
__cb54:     jsr __c148         ; $cb54: 20 48 c1  
            pla                ; $cb57: 68        
            asl                ; $cb58: 0a        
            bcc __cb5e         ; $cb59: 90 03     
            ora #$02           ; $cb5b: 09 02     
            iny                ; $cb5d: c8        
__cb5e:     lsr                ; $cb5e: 4a        
            lsr                ; $cb5f: 4a        
            tax                ; $cb60: aa        
__cb61:     bcs __cb64         ; $cb61: b0 01     
            iny                ; $cb63: c8        
__cb64:     lda ($00),y        ; $cb64: b1 00     
            sta $2007          ; $cb66: 8d 07 20  
            dex                ; $cb69: ca        
            bne __cb61         ; $cb6a: d0 f5     
            sec                ; $cb6c: 38        
            tya                ; $cb6d: 98        
            adc $00            ; $cb6e: 65 00     
            sta $00            ; $cb70: 85 00     
            lda #$00           ; $cb72: a9 00     
            adc $01            ; $cb74: 65 01     
            sta $01            ; $cb76: 85 01     
__cb78:     ldx $2002          ; $cb78: ae 02 20  
            ldy #$00           ; $cb7b: a0 00     
            lda ($00),y        ; $cb7d: b1 00     
            bne __cb3e         ; $cb7f: d0 bd     
__cb81:     lda $12            ; $cb81: a5 12     
            sta $2005          ; $cb83: 8d 05 20  
            lda $13            ; $cb86: a5 13     
            sta $2005          ; $cb88: 8d 05 20  
            rts                ; $cb8b: 60        

;-------------------------------------------------------------------------------
__cb8c:     inx                ; $cb8c: e8        
            txa                ; $cb8d: 8a        
__cb8e:     cmp #$3f           ; $cb8e: c9 3f     
            bcc __cb9c         ; $cb90: 90 0a     
            ldx $0300          ; $cb92: ae 00 03  
            lda #$00           ; $cb95: a9 00     
            sta $0301,x        ; $cb97: 9d 01 03  
            pla                ; $cb9a: 68        
            pla                ; $cb9b: 68        
__cb9c:     rts                ; $cb9c: 60        

;-------------------------------------------------------------------------------
__cb9d:     ldx #$09           ; $cb9d: a2 09     
            dec $31            ; $cb9f: c6 31     
            bpl __cba9         ; $cba1: 10 06     
            lda #$0a           ; $cba3: a9 0a     
            sta $31            ; $cba5: 85 31     
            ldx #$1d           ; $cba7: a2 1d     
__cba9:     lda $32,x          ; $cba9: b5 32     
            beq __cbaf         ; $cbab: f0 02     
            dec $32,x          ; $cbad: d6 32     
__cbaf:     dex                ; $cbaf: ca        
            bpl __cba9         ; $cbb0: 10 f7     
            rts                ; $cbb2: 60        

;-------------------------------------------------------------------------------
__cbb3:     .hex 5c 62 5c      ; $cbb3: 5c 62 5c  Invalid Opcode - NOP $5c62,x
            lsr $6e,x          ; $cbb6: 56 6e     
            .hex 74 8c         ; $cbb8: 74 8c     Invalid Opcode - NOP $8c,x
            .hex 92            ; $cbba: 92        Invalid Opcode - KIL 
            .hex 7a            ; $cbbb: 7a        Invalid Opcode - NOP 
            .hex 80 86         ; $cbbc: 80 86     Invalid Opcode - NOP #$86
__cbbe:     brk                ; $cbbe: 00        
__cbbf:     brk                ; $cbbf: 00        
            .hex 24            ; $cbc0: 24        Suspected data
__cbc1:     dec $17,x          ; $cbc1: d6 17     
            ror $166f          ; $cbc3: 6e 6f 16  
__cbc6:     .hex 10            ; $cbc6: 10        Suspected data
__cbc7:     php                ; $cbc7: 08        
            sed                ; $cbc8: f8        
            php                ; $cbc9: 08        
            php                ; $cbca: 08        
            sed                ; $cbcb: f8        
            brk                ; $cbcc: 00        
            sed                ; $cbcd: f8        
            php                ; $cbce: 08        
            sed                ; $cbcf: f8        
            brk                ; $cbd0: 00        
            sed                ; $cbd1: f8        
            sed                ; $cbd2: f8        
            brk                ; $cbd3: 00        
            bpl __cbd6         ; $cbd4: 10 00     
__cbd6:     sed                ; $cbd6: f8        
            bpl __cbe9         ; $cbd7: 10 10     
            .hex 10            ; $cbd9: 10        Suspected data
__cbda:     .hex ff 01         ; $cbda: ff 01     Suspected data
__cbdc:     .hex f2            ; $cbdc: f2        Invalid Opcode - KIL 
__cbdd:     beq __cc28         ; $cbdd: f0 49     
            bvc __cc5a         ; $cbdf: 50 79     
            .hex 80 a9         ; $cbe1: 80 a9     Invalid Opcode - NOP #$a9
            bcs __cbbe         ; $cbe3: b0 d9     
            .hex e2 f1         ; $cbe5: e2 f1     Invalid Opcode - NOP #$f1
            .hex fa            ; $cbe7: fa        Invalid Opcode - NOP 
__cbe8:     lsr                ; $cbe8: 4a        
__cbe9:     .hex 7a            ; $cbe9: 7a        Invalid Opcode - NOP 
            tax                ; $cbea: aa        
            .hex da            ; $cbeb: da        Invalid Opcode - NOP 
            .hex f5            ; $cbec: f5        Suspected data
__cbed:     .hex 80 40         ; $cbed: 80 40     Invalid Opcode - NOP #$40
            jsr $0810          ; $cbef: 20 10 08  
            .hex 04 02         ; $cbf2: 04 02     Invalid Opcode - NOP $02
            .hex 01            ; $cbf4: 01        Suspected data
__cbf5:     brk                ; $cbf5: 00        
            .hex 04 08         ; $cbf6: 04 08     Invalid Opcode - NOP $08
__cbf8:     .hex 04 02         ; $cbf8: 04 02     Invalid Opcode - NOP $02
            inc $8ca5,x        ; $cbfa: fe a5 8c  
            bne __cc5e         ; $cbfd: d0 5f     
            lda $15            ; $cbff: a5 15     
            sta $70            ; $cc01: 85 70     
            ldx #$00           ; $cc03: a2 00     
            jsr __cd13         ; $cc05: 20 13 cd  
            ldx #$00           ; $cc08: a2 00     
            jsr __da99         ; $cc0a: 20 99 da  
            lda $58            ; $cc0d: a5 58     
            beq __cc1f         ; $cc0f: f0 0e     
            lda $17            ; $cc11: a5 17     
            sta $71            ; $cc13: 85 71     
            ldx #$01           ; $cc15: a2 01     
            jsr __cd13         ; $cc17: 20 13 cd  
            ldx #$01           ; $cc1a: a2 01     
            jsr __da99         ; $cc1c: 20 99 da  
__cc1f:     jsr __efec         ; $cc1f: 20 ec ef  
            jsr __e189         ; $cc22: 20 89 e1  
            jsr __dc6a         ; $cc25: 20 6a dc  
__cc28:     jsr __d1e5         ; $cc28: 20 e5 d1  
            jsr __de22         ; $cc2b: 20 22 de  
            jsr __ee0d         ; $cc2e: 20 0d ee  
            jsr __ef9a         ; $cc31: 20 9a ef  
            jsr __f10b         ; $cc34: 20 0b f1  
            jsr __d3ac         ; $cc37: 20 ac d3  
            jsr __d212         ; $cc3a: 20 12 d2  
            jsr __d301         ; $cc3d: 20 01 d3  
            jsr __eb7f         ; $cc40: 20 7f eb  
            jsr __ec23         ; $cc43: 20 23 ec  
            jsr __f838         ; $cc46: 20 38 f8  
            jsr __d493         ; $cc49: 20 93 d4  
            jsr __e29a         ; $cc4c: 20 9a e2  
            jsr __e0b9         ; $cc4f: 20 b9 e0  
            jsr __d9cc         ; $cc52: 20 cc d9  
            jsr __da4b         ; $cc55: 20 4b da  
            .hex 20 2e         ; $cc58: 20 2e     Suspected data
__cc5a:     .hex eb 20         ; $cc5a: eb 20     Invalid Opcode - SBC #$20
            .hex bf ec         ; $cc5c: bf ec     Suspected data
__cc5e:     jsr __d463         ; $cc5e: 20 63 d4  
            jsr __d82f         ; $cc61: 20 2f d8  
            jmp __d7de         ; $cc64: 4c de d7  

;-------------------------------------------------------------------------------
__cc67:     lda #$04           ; $cc67: a9 04     
            jmp __d4f5         ; $cc69: 4c f5 d4  

;-------------------------------------------------------------------------------
            jsr __f471         ; $cc6c: 20 71 f4  
            jsr __e88f         ; $cc6f: 20 8f e8  
            lda $45            ; $cc72: a5 45     
            beq __cc7b         ; $cc74: f0 05     
            cmp #$01           ; $cc76: c9 01     
            beq __cc7e         ; $cc78: f0 04     
            rts                ; $cc7a: 60        

;-------------------------------------------------------------------------------
__cc7b:     jmp __e8f2         ; $cc7b: 4c f2 e8  

;-------------------------------------------------------------------------------
__cc7e:     lda $20            ; $cc7e: a5 20     
            cmp #$80           ; $cc80: c9 80     
            beq __cc97         ; $cc82: f0 13     
            inc $59            ; $cc84: e6 59     
            lda $59            ; $cc86: a5 59     
            cmp #$63           ; $cc88: c9 63     
            bcc __cc90         ; $cc8a: 90 04     
            lda #$00           ; $cc8c: a9 00     
            sta $59            ; $cc8e: 85 59     
__cc90:     inc $56            ; $cc90: e6 56     
            lda #$01           ; $cc92: a9 01     
__cc94:     jmp __d4f5         ; $cc94: 4c f5 d4  

;-------------------------------------------------------------------------------
__cc97:     lda #$00           ; $cc97: a9 00     
            sta $51            ; $cc99: 85 51     
            sta $55            ; $cc9b: 85 55     
            rts                ; $cc9d: 60        

;-------------------------------------------------------------------------------
            lda #$06           ; $cc9e: a9 06     
            cmp $6a            ; $cca0: c5 6a     
            beq __cced         ; $cca2: f0 49     
            cmp $6b            ; $cca4: c5 6b     
            beq __cced         ; $cca6: f0 45     
            lda $8c            ; $cca8: a5 8c     
            bne __cce4         ; $ccaa: d0 38     
            ldx $26            ; $ccac: a6 26     
            cpx #$02           ; $ccae: e0 02     
            bne __ccb9         ; $ccb0: d0 07     
            ldx #$00           ; $ccb2: a2 00     
            jsr __ccf6         ; $ccb4: 20 f6 cc  
            ldx #$01           ; $ccb7: a2 01     
__ccb9:     jsr __ccf6         ; $ccb9: 20 f6 cc  
            jsr __d212         ; $ccbc: 20 12 d2  
            jsr __f78b         ; $ccbf: 20 8b f7  
            jsr __d301         ; $ccc2: 20 01 d3  
            jsr __f6a4         ; $ccc5: 20 a4 f6  
            jsr __f71d         ; $ccc8: 20 1d f7  
            jsr __eb2e         ; $cccb: 20 2e eb  
            jsr __e277         ; $ccce: 20 77 e2  
            jsr __e33c         ; $ccd1: 20 3c e3  
            jsr __ecbf         ; $ccd4: 20 bf ec  
__ccd7:     lda $8d            ; $ccd7: a5 8d     
            cmp #$2f           ; $ccd9: c9 2f     
            bmi __cce1         ; $ccdb: 30 04     
            lda $27            ; $ccdd: a5 27     
            bne __cce4         ; $ccdf: d0 03     
__cce1:     jsr __f2ec         ; $cce1: 20 ec f2  
__cce4:     jsr __d724         ; $cce4: 20 24 d7  
            jsr __d8af         ; $cce7: 20 af d8  
            jmp __d890         ; $ccea: 4c 90 d8  

;-------------------------------------------------------------------------------
__cced:     lda $4d            ; $cced: a5 4d     
            bne __cd12         ; $ccef: d0 21     
            lda #$03           ; $ccf1: a9 03     
            jmp __d4f5         ; $ccf3: 4c f5 d4  

;-------------------------------------------------------------------------------
__ccf6:     stx $5f            ; $ccf6: 86 5f     
            txa                ; $ccf8: 8a        
            asl                ; $ccf9: 0a        
            tay                ; $ccfa: a8        
            lda $0015,y        ; $ccfb: b9 15 00  
            sta $70,x          ; $ccfe: 95 70     
            .hex 20 52         ; $cd00: 20 52     Suspected data
__cd02:     cmp $bd,x          ; $cd02: d5 bd     
            .hex 52            ; $cd04: 52        Invalid Opcode - KIL 
            .hex 03 d0         ; $cd05: 03 d0     Invalid Opcode - SLO ($d0,x)
            ora $a6            ; $cd07: 05 a6     
            .hex 5f 20 9c      ; $cd09: 5f 20 9c  Invalid Opcode - SRE $9c20,x
            cmp $a6,x          ; $cd0c: d5 a6     
            .hex 5f 20 07      ; $cd0e: 5f 20 07  Invalid Opcode - SRE $0720,x
            .hex d5            ; $cd11: d5        Suspected data
__cd12:     rts                ; $cd12: 60        

;-------------------------------------------------------------------------------
__cd13:     stx $5f            ; $cd13: 86 5f     
            lda $5a,x          ; $cd15: b5 5a     
            beq __cd61         ; $cd17: f0 48     
            ldy $6a,x          ; $cd19: b4 6a     
            dey                ; $cd1b: 88        
            tya                ; $cd1c: 98        
            jsr __c728         ; $cd1d: 20 28 c7  
            .hex 32            ; $cd20: 32        Invalid Opcode - KIL 
            cmp __ce5d         ; $cd21: cd 5d ce  
            sec                ; $cd24: 38        
            cmp __d008         ; $cd25: cd 08 d0  
            eor $08d0,x        ; $cd28: 5d d0 08  
            bne __ccd7         ; $cd2b: d0 aa     
            bne __cd37         ; $cd2d: d0 08     
            bne __cd31         ; $cd2f: d0 00     
__cd31:     cmp $20,x          ; $cd31: d5 20     
            bcs __cd02         ; $cd33: b0 cd     
            .hex 4c 3b         ; $cd35: 4c 3b     Suspected data
__cd37:     cmp __c620         ; $cd37: cd 20 c6  
            .hex cf 20 62      ; $cd3a: cf 20 62  Invalid Opcode - DCP $6220
            cmp $21b0          ; $cd3d: cd b0 21  
            lda #$05           ; $cd40: a9 05     
            sta $e8,x          ; $cd42: 95 e8     
            sta $6e,x          ; $cd44: 95 6e     
            lda #$04           ; $cd46: a9 04     
            sta $e6,x          ; $cd48: 95 e6     
            lsr                ; $cd4a: 4a        
            sta $6a,x          ; $cd4b: 95 6a     
            lsr                ; $cd4d: 4a        
            sta $e0,x          ; $cd4e: 95 e0     
            sta $86,x          ; $cd50: 95 86     
            lsr                ; $cd52: 4a        
            sta $88,x          ; $cd53: 95 88     
            ldy $68,x          ; $cd55: b4 68     
            beq __cd61         ; $cd57: f0 08     
            lda __cbf8,y       ; $cd59: b9 f8 cb  
            clc                ; $cd5c: 18        
            adc $64,x          ; $cd5d: 75 64     
            sta $64,x          ; $cd5f: 95 64     
__cd61:     rts                ; $cd61: 60        

;-------------------------------------------------------------------------------
__cd62:     lda #$00           ; $cd62: a9 00     
            sta $82,x          ; $cd64: 95 82     
            lda #$06           ; $cd66: a9 06     
__cd68:     sta $01            ; $cd68: 85 01     
            lda $64,x          ; $cd6a: b5 64     
            clc                ; $cd6c: 18        
            adc $01            ; $cd6d: 65 01     
            jsr __dbb4         ; $cd6f: 20 b4 db  
            bmi __cd83         ; $cd72: 30 0f     
            cmp #$04           ; $cd74: c9 04     
            bne __cd8b         ; $cd76: d0 13     
            iny                ; $cd78: c8        
            lda ($03),y        ; $cd79: b1 03     
            bpl __cd8b         ; $cd7b: 10 0e     
            dey                ; $cd7d: 88        
            dey                ; $cd7e: 88        
            lda ($03),y        ; $cd7f: b1 03     
            bpl __cd8b         ; $cd81: 10 08     
__cd83:     lda #$09           ; $cd83: a9 09     
            cmp $01            ; $cd85: c5 01     
            bne __cd68         ; $cd87: d0 df     
            clc                ; $cd89: 18        
            rts                ; $cd8a: 60        

;-------------------------------------------------------------------------------
__cd8b:     sec                ; $cd8b: 38        
            rts                ; $cd8c: 60        

;-------------------------------------------------------------------------------
__cd8d:     .hex 02            ; $cd8d: 02        Invalid Opcode - KIL 
            ora #$06           ; $cd8e: 09 06     
            .hex 04            ; $cd90: 04        Suspected data
__cd91:     .hex 04 02         ; $cd91: 04 02     Invalid Opcode - NOP $02
            .hex 02            ; $cd93: 02        Invalid Opcode - KIL 
            .hex 04            ; $cd94: 04        Suspected data
__cd95:     inc $60,x          ; $cd95: f6 60     
            lda $60,x          ; $cd97: b5 60     
            cmp __cd8d,y       ; $cd99: d9 8d cd  
            bcc __cdaf         ; $cd9c: 90 11     
            lda #$00           ; $cd9e: a9 00     
            sta $60,x          ; $cda0: 95 60     
            inc $6c,x          ; $cda2: f6 6c     
            lda $6c,x          ; $cda4: b5 6c     
            cmp __cd91,y       ; $cda6: d9 91 cd  
            bcc __cdaf         ; $cda9: 90 04     
            lda #$00           ; $cdab: a9 00     
            sta $6c,x          ; $cdad: 95 6c     
__cdaf:     rts                ; $cdaf: 60        

;-------------------------------------------------------------------------------
__cdb0:     lda $55            ; $cdb0: a5 55     
            cmp #$01           ; $cdb2: c9 01     
            bne __cdc4         ; $cdb4: d0 0e     
            txa                ; $cdb6: 8a        
            asl                ; $cdb7: 0a        
            tay                ; $cdb8: a8        
            lda $0014,y        ; $cdb9: b9 14 00  
            and #$40           ; $cdbc: 29 40     
            beq __cdc4         ; $cdbe: f0 04     
            lda #$05           ; $cdc0: a9 05     
            bne __cddb         ; $cdc2: d0 17     
__cdc4:     lda $70,x          ; $cdc4: b5 70     
            and #$01           ; $cdc6: 29 01     
            bne __cddf         ; $cdc8: d0 15     
            lda $70,x          ; $cdca: b5 70     
            and #$02           ; $cdcc: 29 02     
            bne __cde9         ; $cdce: d0 19     
__cdd0:     lda $68,x          ; $cdd0: b5 68     
            beq __cdff         ; $cdd2: f0 2b     
            lda $6e,x          ; $cdd4: b5 6e     
            lsr                ; $cdd6: 4a        
            sta $32,x          ; $cdd7: 95 32     
            lda #$03           ; $cdd9: a9 03     
__cddb:     sta $6a,x          ; $cddb: 95 6a     
            bne __cdff         ; $cddd: d0 20     
__cddf:     lda #$01           ; $cddf: a9 01     
            ldy $68,x          ; $cde1: b4 68     
            cpy #$02           ; $cde3: c0 02     
            beq __cdd0         ; $cde5: f0 e9     
            bne __cdf1         ; $cde7: d0 08     
__cde9:     lda #$02           ; $cde9: a9 02     
            ldy $68,x          ; $cdeb: b4 68     
            cpy #$01           ; $cded: c0 01     
            beq __cdd0         ; $cdef: f0 df     
__cdf1:     sta $68,x          ; $cdf1: 95 68     
            and #$01           ; $cdf3: 29 01     
            sta $62,x          ; $cdf5: 95 62     
            jsr __d143         ; $cdf7: 20 43 d1  
            ldy #$00           ; $cdfa: a0 00     
            jsr __cd95         ; $cdfc: 20 95 cd  
__cdff:     ldy $6c,x          ; $cdff: b4 6c     
            jsr __d17c         ; $ce01: 20 7c d1  
            ldy #$d9           ; $ce04: a0 d9     
            lda $55            ; $ce06: a5 55     
            cmp #$01           ; $ce08: c9 01     
            beq __ce29         ; $ce0a: f0 1d     
            ldy __cbbf,x       ; $ce0c: bc bf cb  
            ldx #$00           ; $ce0f: a2 00     
__ce11:     tya                ; $ce11: 98        
            clc                ; $ce12: 18        
            adc __cbf5,x       ; $ce13: 7d f5 cb  
            tay                ; $ce16: a8        
            lda $0205,y        ; $ce17: b9 05 02  
            clc                ; $ce1a: 18        
            adc #$77           ; $ce1b: 69 77     
            sta $0205,y        ; $ce1d: 99 05 02  
            inx                ; $ce20: e8        
            cpx #$04           ; $ce21: e0 04     
            bcc __ce11         ; $ce23: 90 ec     
            ldy #$df           ; $ce25: a0 df     
            ldx $5f            ; $ce27: a6 5f     
__ce29:     lda $70,x          ; $ce29: b5 70     
            and #$03           ; $ce2b: 29 03     
            bne __ce43         ; $ce2d: d0 14     
            tya                ; $ce2f: 98        
            pha                ; $ce30: 48        
            ldy __cbbf,x       ; $ce31: bc bf cb  
            lda $62,x          ; $ce34: b5 62     
            bne __ce3f         ; $ce36: d0 07     
            pla                ; $ce38: 68        
            sta $0209,y        ; $ce39: 99 09 02  
            jmp __ce43         ; $ce3c: 4c 43 ce  

;-------------------------------------------------------------------------------
__ce3f:     pla                ; $ce3f: 68        
            sta $0215,y        ; $ce40: 99 15 02  
__ce43:     lda $70,x          ; $ce43: b5 70     
            and #$80           ; $ce45: 29 80     
            beq __ce5c         ; $ce47: f0 13     
            lda $55            ; $ce49: a5 55     
            cmp #$01           ; $ce4b: c9 01     
            beq __ce54         ; $ce4d: f0 05     
            dec $66,x          ; $ce4f: d6 66     
            lda #$02           ; $ce51: a9 02     
            .hex 2c            ; $ce53: 2c        Suspected data
__ce54:     lda #$04           ; $ce54: a9 04     
            sta $6a,x          ; $ce56: 95 6a     
            lda #$04           ; $ce58: a9 04     
            sta $ff            ; $ce5a: 85 ff     
__ce5c:     rts                ; $ce5c: 60        

;-------------------------------------------------------------------------------
__ce5d:     lda #$a8           ; $ce5d: a9 a8     
            sta $e2,x          ; $ce5f: 95 e2     
            lda #$03           ; $ce61: a9 03     
            sta $e4,x          ; $ce63: 95 e4     
            lda $68,x          ; $ce65: b5 68     
            bne __ce93         ; $ce67: d0 2a     
            lda $e6,x          ; $ce69: b5 e6     
            cmp #$03           ; $ce6b: c9 03     
            bcc __ce93         ; $ce6d: 90 24     
            lda $70,x          ; $ce6f: b5 70     
            and #$03           ; $ce71: 29 03     
            beq __ce93         ; $ce73: f0 1e     
            sta $68,x          ; $ce75: 95 68     
            cmp #$01           ; $ce77: c9 01     
            beq __ce7e         ; $ce79: f0 03     
            lda #$00           ; $ce7b: a9 00     
            .hex 2c            ; $ce7d: 2c        Suspected data
__ce7e:     lda #$01           ; $ce7e: a9 01     
            sta $62,x          ; $ce80: 95 62     
            lda #$0f           ; $ce82: a9 0f     
            sta $6e,x          ; $ce84: 95 6e     
            bne __ce93         ; $ce86: d0 0b     
__ce88:     lda #$f0           ; $ce88: a9 f0     
            .hex 2c            ; $ce8a: 2c        Suspected data
__ce8b:     lda #$b0           ; $ce8b: a9 b0     
            sta $e2,x          ; $ce8d: 95 e2     
            lda #$00           ; $ce8f: a9 00     
            sta $e4,x          ; $ce91: 95 e4     
__ce93:     lda $68,x          ; $ce93: b5 68     
            beq __ce9a         ; $ce95: f0 03     
            jsr __d160         ; $ce97: 20 60 d1  
__ce9a:     jsr __d133         ; $ce9a: 20 33 d1  
            jsr __ceef         ; $ce9d: 20 ef ce  
            jsr __cf1a         ; $cea0: 20 1a cf  
            bcc __ced0         ; $cea3: 90 2b     
            lda $0e            ; $cea5: a5 0e     
            sec                ; $cea7: 38        
            sbc #$19           ; $cea8: e9 19     
            sta $66,x          ; $ceaa: 95 66     
            lda #$00           ; $ceac: a9 00     
            sta $e0,x          ; $ceae: 95 e0     
            sta $86,x          ; $ceb0: 95 86     
            sta $88,x          ; $ceb2: 95 88     
            sta $60,x          ; $ceb4: 95 60     
            ldx $5f            ; $ceb6: a6 5f     
            lda #$01           ; $ceb8: a9 01     
            sta $6a,x          ; $ceba: 95 6a     
            lda $68,x          ; $cebc: b5 68     
            beq __ceee         ; $cebe: f0 2e     
            lda #$03           ; $cec0: a9 03     
            sta $6a,x          ; $cec2: 95 6a     
            lda $6e,x          ; $cec4: b5 6e     
            ldy $5a,x          ; $cec6: b4 5a     
            cpy #$08           ; $cec8: c0 08     
            bcs __cecd         ; $ceca: b0 01     
            lsr                ; $cecc: 4a        
__cecd:     lsr                ; $cecd: 4a        
            sta $32,x          ; $cece: 95 32     
__ced0:     lda $6a,x          ; $ced0: b5 6a     
            cmp #$04           ; $ced2: c9 04     
            bcs __ceee         ; $ced4: b0 18     
            ldy #$07           ; $ced6: a0 07     
            jmp __d17c         ; $ced8: 4c 7c d1  

;-------------------------------------------------------------------------------
__cedb:     ldy #$00           ; $cedb: a0 00     
__cedd:     cmp __cbdc,y       ; $cedd: d9 dc cb  
            bcc __cee7         ; $cee0: 90 05     
            cmp __cbdd,y       ; $cee2: d9 dd cb  
            bcc __ceee         ; $cee5: 90 07     
__cee7:     iny                ; $cee7: c8        
            iny                ; $cee8: c8        
            cpy #$0c           ; $cee9: c0 0c     
            bne __cedd         ; $ceeb: d0 f0     
            sec                ; $ceed: 38        
__ceee:     rts                ; $ceee: 60        

;-------------------------------------------------------------------------------
__ceef:     lda $86,x          ; $ceef: b5 86     
            bne __cf19         ; $cef1: d0 26     
            lda $66,x          ; $cef3: b5 66     
            clc                ; $cef5: 18        
            adc #$fa           ; $cef6: 69 fa     
            jsr __cedb         ; $cef8: 20 db ce  
            bcs __cf19         ; $cefb: b0 1c     
            jsr __cf5b         ; $cefd: 20 5b cf  
            sta $0b            ; $cf00: 85 0b     
            lda $64,x          ; $cf02: b5 64     
            clc                ; $cf04: 18        
            adc #$08           ; $cf05: 69 08     
            jsr __dbb0         ; $cf07: 20 b0 db  
            bpl __cf12         ; $cf0a: 10 06     
            ldy $0b            ; $cf0c: a4 0b     
            beq __cf19         ; $cf0e: f0 09     
            bne __cf15         ; $cf10: d0 03     
__cf12:     lda #$08           ; $cf12: a9 08     
            .hex 2c            ; $cf14: 2c        Suspected data
__cf15:     lda #$06           ; $cf15: a9 06     
            sta $6a,x          ; $cf17: 95 6a     
__cf19:     rts                ; $cf19: 60        

;-------------------------------------------------------------------------------
__cf1a:     lda $66,x          ; $cf1a: b5 66     
            clc                ; $cf1c: 18        
            adc #$18           ; $cf1d: 69 18     
            jsr __cedb         ; $cf1f: 20 db ce  
            bcs __cf51         ; $cf22: b0 2d     
            tya                ; $cf24: 98        
            sty $07            ; $cf25: 84 07     
            cmp $88,x          ; $cf27: d5 88     
            beq __cf55         ; $cf29: f0 2a     
            lda __cbdc,y       ; $cf2b: b9 dc cb  
            sta $0e            ; $cf2e: 85 0e     
            lda $e6,x          ; $cf30: b5 e6     
            cmp #$03           ; $cf32: c9 03     
            bcs __cf46         ; $cf34: b0 10     
            cmp #$02           ; $cf36: c9 02     
            bcc __cf55         ; $cf38: 90 1b     
            lda $6a,x          ; $cf3a: b5 6a     
            cmp #$08           ; $cf3c: c9 08     
            beq __cf46         ; $cf3e: f0 06     
            lda $e8,x          ; $cf40: b5 e8     
            cmp #$c0           ; $cf42: c9 c0     
            bcc __cf55         ; $cf44: 90 0f     
__cf46:     ldy $07            ; $cf46: a4 07     
            sty $88,x          ; $cf48: 94 88     
            jsr __cd62         ; $cf4a: 20 62 cd  
            bcc __cf55         ; $cf4d: 90 06     
            sec                ; $cf4f: 38        
            rts                ; $cf50: 60        

;-------------------------------------------------------------------------------
__cf51:     lda #$00           ; $cf51: a9 00     
            sta $88,x          ; $cf53: 95 88     
__cf55:     clc                ; $cf55: 18        
            rts                ; $cf56: 60        

;-------------------------------------------------------------------------------
__cf57:     ora ($80,x)        ; $cf57: 01 80     
__cf59:     .hex 03 0d         ; $cf59: 03 0d     Invalid Opcode - SLO ($0d,x)
__cf5b:     lda #$01           ; $cf5b: a9 01     
            sta $82,x          ; $cf5d: 95 82     
            lsr                ; $cf5f: 4a        
            sta $0a            ; $cf60: 85 0a     
            lda #$08           ; $cf62: a9 08     
            jsr __cfc0         ; $cf64: 20 c0 cf  
            bmi __cf6d         ; $cf67: 30 04     
            lda #$ff           ; $cf69: a9 ff     
            bne __cfa7         ; $cf6b: d0 3a     
__cf6d:     lda $68,x          ; $cf6d: b5 68     
            bne __cf89         ; $cf6f: d0 18     
            lda #$06           ; $cf71: a9 06     
            jsr __cfc0         ; $cf73: 20 c0 cf  
            bmi __cf7c         ; $cf76: 30 04     
            lda #$e0           ; $cf78: a9 e0     
            sta $0a            ; $cf7a: 85 0a     
__cf7c:     lda #$0a           ; $cf7c: a9 0a     
            jsr __cfc0         ; $cf7e: 20 c0 cf  
            bmi __cfa9         ; $cf81: 30 26     
            lda $0a            ; $cf83: a5 0a     
            ora #$07           ; $cf85: 09 07     
            bne __cfa7         ; $cf87: d0 1e     
__cf89:     lda #$01           ; $cf89: a9 01     
            sta $0c            ; $cf8b: 85 0c     
            ldy $62,x          ; $cf8d: b4 62     
            lda __cf59,y       ; $cf8f: b9 59 cf  
            jsr __cfc0         ; $cf92: 20 c0 cf  
            bpl __cf99         ; $cf95: 10 02     
            dec $0c            ; $cf97: c6 0c     
__cf99:     ldy $68,x          ; $cf99: b4 68     
            dey                ; $cf9b: 88        
            lda $0c            ; $cf9c: a5 0c     
            bne __cfa4         ; $cf9e: d0 04     
            lda #$00           ; $cfa0: a9 00     
            beq __cfa7         ; $cfa2: f0 03     
__cfa4:     lda __cf57,y       ; $cfa4: b9 57 cf  
__cfa7:     sta $0a            ; $cfa7: 85 0a     
__cfa9:     lda $64,x          ; $cfa9: b5 64     
            clc                ; $cfab: 18        
            adc #$08           ; $cfac: 69 08     
            and #$07           ; $cfae: 29 07     
            tay                ; $cfb0: a8        
            lda __cbed,y       ; $cfb1: b9 ed cb  
            ora $0a            ; $cfb4: 05 0a     
            cmp $0a            ; $cfb6: c5 0a     
            bne __cfbd         ; $cfb8: d0 03     
            lda #$01           ; $cfba: a9 01     
            rts                ; $cfbc: 60        

;-------------------------------------------------------------------------------
__cfbd:     lda #$00           ; $cfbd: a9 00     
            rts                ; $cfbf: 60        

;-------------------------------------------------------------------------------
__cfc0:     clc                ; $cfc0: 18        
            adc $64,x          ; $cfc1: 75 64     
            jmp __dbb4         ; $cfc3: 4c b4 db  

;-------------------------------------------------------------------------------
__cfc6:     lda $68,x          ; $cfc6: b5 68     
            beq __cfd3         ; $cfc8: f0 09     
            cmp #$01           ; $cfca: c9 01     
            beq __cfd1         ; $cfcc: f0 03     
            dec $64,x          ; $cfce: d6 64     
            .hex 2c            ; $cfd0: 2c        Suspected data
__cfd1:     inc $64,x          ; $cfd1: f6 64     
__cfd3:     ldy #$05           ; $cfd3: a0 05     
            jsr __d17c         ; $cfd5: 20 7c d1  
            lda $32,x          ; $cfd8: b5 32     
            beq __cfeb         ; $cfda: f0 0f     
            lda $5a,x          ; $cfdc: b5 5a     
            cmp #$06           ; $cfde: c9 06     
            bcc __cfeb         ; $cfe0: 90 09     
            lda $70,x          ; $cfe2: b5 70     
            and #$40           ; $cfe4: 29 40     
            beq __cffc         ; $cfe6: f0 14     
            lda #$05           ; $cfe8: a9 05     
            .hex 2c            ; $cfea: 2c        Suspected data
__cfeb:     lda #$01           ; $cfeb: a9 01     
            sta $6a,x          ; $cfed: 95 6a     
__cfef:     lda #$00           ; $cfef: a9 00     
            sta $32,x          ; $cff1: 95 32     
            sta $68,x          ; $cff3: 95 68     
            sta $60,x          ; $cff5: 95 60     
            sta $6c,x          ; $cff7: 95 6c     
            sta $6e,x          ; $cff9: 95 6e     
__cffb:     rts                ; $cffb: 60        

;-------------------------------------------------------------------------------
__cffc:     lda $70,x          ; $cffc: b5 70     
            and #$80           ; $cffe: 29 80     
            beq __cffb         ; $d000: f0 f9     
            jsr __ce43         ; $d002: 20 43 ce  
            jmp __cfef         ; $d005: 4c ef cf  

;-------------------------------------------------------------------------------
__d008:     lda $6a,x          ; $d008: b5 6a     
            cmp #$06           ; $d00a: c9 06     
            beq __d018         ; $d00c: f0 0a     
            cmp #$08           ; $d00e: c9 08     
            beq __d01e         ; $d010: f0 0c     
            jsr __ce5d         ; $d012: 20 5d ce  
            jmp __d021         ; $d015: 4c 21 d0  

;-------------------------------------------------------------------------------
__d018:     jsr __ce88         ; $d018: 20 88 ce  
            .hex 4c 21         ; $d01b: 4c 21     Suspected data
__d01d:     .hex d0            ; $d01d: d0        Suspected data
__d01e:     jsr __ce8b         ; $d01e: 20 8b ce  
__d021:     lda $e0,x          ; $d021: b5 e0     
            beq __cffb         ; $d023: f0 d6     
__d025:     ldx $5f            ; $d025: a6 5f     
            lda $86,x          ; $d027: b5 86     
            bne __d04f         ; $d029: d0 24     
            lda $6a,x          ; $d02b: b5 6a     
__d02d:     cmp #$04           ; $d02d: c9 04     
            beq __d04f         ; $d02f: f0 1e     
            lda $5f            ; $d031: a5 5f     
            asl                ; $d033: 0a        
            asl                ; $d034: 0a        
            tay                ; $d035: a8        
            lda $021c,y        ; $d036: b9 1c 02  
            sec                ; $d039: 38        
            sbc #$01           ; $d03a: e9 01     
            jsr __cedb         ; $d03c: 20 db ce  
            bcs __d04f         ; $d03f: b0 0e     
            lda $e6,x          ; $d041: b5 e6     
            cmp #$03           ; $d043: c9 03     
            bcs __d04f         ; $d045: b0 08     
            lda #$01           ; $d047: a9 01     
            sta $80,x          ; $d049: 95 80     
            sta $86,x          ; $d04b: 95 86     
            sta $82,x          ; $d04d: 95 82     
__d04f:     ldy #$07           ; $d04f: a0 07     
            lda $60,x          ; $d051: b5 60     
            cmp #$0b           ; $d053: c9 0b     
            bcs __d05a         ; $d055: b0 03     
            inc $60,x          ; $d057: f6 60     
            dey                ; $d059: 88        
__d05a:     jmp __d17c         ; $d05a: 4c 7c d1  

;-------------------------------------------------------------------------------
            inc $60,x          ; $d05d: f6 60     
            lda $60,x          ; $d05f: b5 60     
            cmp #$14           ; $d061: c9 14     
            bcs __d07c         ; $d063: b0 17     
            cmp #$01           ; $d065: c9 01     
            bcc __cffb         ; $d067: 90 92     
            ldy #$0a           ; $d069: a0 0a     
            cmp #$0b           ; $d06b: c9 0b     
            bcs __d079         ; $d06d: b0 0a     
            cmp #$07           ; $d06f: c9 07     
            bcs __d077         ; $d071: b0 04     
            ldy #$07           ; $d073: a0 07     
            bne __d079         ; $d075: d0 02     
__d077:     ldy #$09           ; $d077: a0 09     
__d079:     jmp __d17c         ; $d079: 4c 7c d1  

;-------------------------------------------------------------------------------
__d07c:     lda #$01           ; $d07c: a9 01     
            sta $6a,x          ; $d07e: 95 6a     
            lsr                ; $d080: 4a        
            sta $60,x          ; $d081: 95 60     
            tay                ; $d083: a8        
            beq __d079         ; $d084: f0 f3     
__d086:     .hex 8e            ; $d086: 8e        Suspected data
__d087:     bne __d01d         ; $d087: d0 94     
            bne __d025         ; $d089: d0 9a     
            bne __d02d         ; $d08b: d0 a0     
            bne __d0f7         ; $d08d: d0 68     
            adc #$6a           ; $d08f: 69 6a     
            .hex 6b 6c         ; $d091: 6b 6c     Invalid Opcode - ARR #$6c
            adc $696a          ; $d093: 6d 6a 69  
            pla                ; $d096: 68        
            adc $6b6c          ; $d097: 6d 6c 6b  
            adc $6b6c          ; $d09a: 6d 6c 6b  
            ror                ; $d09d: 6a        
            adc #$68           ; $d09e: 69 68     
            .hex 6b 6c         ; $d0a0: 6b 6c     Invalid Opcode - ARR #$6c
            adc $6968          ; $d0a2: 6d 68 69  
            ror                ; $d0a5: 6a        
__d0a6:     brk                ; $d0a6: 00        
            .hex 80 c0         ; $d0a7: 80 c0     Invalid Opcode - NOP #$c0
__d0a9:     rti                ; $d0a9: 40        

;-------------------------------------------------------------------------------
            lda $32,x          ; $d0aa: b5 32     
            beq __d0ca         ; $d0ac: f0 1c     
            cmp #$10           ; $d0ae: c9 10     
            beq __d0b8         ; $d0b0: f0 06     
            bcs __d0c0         ; $d0b2: b0 0c     
            ldy #$0b           ; $d0b4: a0 0b     
            bne __d0c7         ; $d0b6: d0 0f     
__d0b8:     txa                ; $d0b8: 8a        
            clc                ; $d0b9: 18        
            adc #$0b           ; $d0ba: 69 0b     
            tax                ; $d0bc: aa        
            jmp __f691         ; $d0bd: 4c 91 f6  

;-------------------------------------------------------------------------------
__d0c0:     lda #$00           ; $d0c0: a9 00     
            sta $e0,x          ; $d0c2: 95 e0     
            rts                ; $d0c4: 60        

;-------------------------------------------------------------------------------
__d0c5:     ldy #$00           ; $d0c5: a0 00     
__d0c7:     jmp __d17c         ; $d0c7: 4c 7c d1  

;-------------------------------------------------------------------------------
__d0ca:     ldx $5f            ; $d0ca: a6 5f     
            jsr __d127         ; $d0cc: 20 27 d1  
            jsr __d0c5         ; $d0cf: 20 c5 d0  
            ldy #$03           ; $d0d2: a0 03     
            jsr __cd95         ; $d0d4: 20 95 cd  
            lda $6c,x          ; $d0d7: b5 6c     
            asl                ; $d0d9: 0a        
            tay                ; $d0da: a8        
            lda __d086,y       ; $d0db: b9 86 d0  
            sta $00            ; $d0de: 85 00     
            lda __d087,y       ; $d0e0: b9 87 d0  
            sta $01            ; $d0e3: 85 01     
            ldy $6c,x          ; $d0e5: b4 6c     
            lda __d0a6,y       ; $d0e7: b9 a6 d0  
            sta $02            ; $d0ea: 85 02     
            lda #$01           ; $d0ec: a9 01     
            cpx #$00           ; $d0ee: e0 00     
            beq __d0f4         ; $d0f0: f0 02     
            lda #$25           ; $d0f2: a9 25     
__d0f4:     tax                ; $d0f4: aa        
            ldy #$00           ; $d0f5: a0 00     
__d0f7:     lda ($00),y        ; $d0f7: b1 00     
            sta $0200,x        ; $d0f9: 9d 00 02  
            inx                ; $d0fc: e8        
            lda $0200,x        ; $d0fd: bd 00 02  
            and #$03           ; $d100: 29 03     
            ora $02            ; $d102: 05 02     
            sta $0200,x        ; $d104: 9d 00 02  
            inx                ; $d107: e8        
            inx                ; $d108: e8        
            inx                ; $d109: e8        
            iny                ; $d10a: c8        
            cpy #$06           ; $d10b: c0 06     
            bcc __d0f7         ; $d10d: 90 e8     
            ldx $5f            ; $d10f: a6 5f     
__d111:     lda $32,x          ; $d111: b5 32     
            bne __d126         ; $d113: d0 11     
            ldy #$0b           ; $d115: a0 0b     
__d117:     lda $0090,y        ; $d117: b9 90 00  
            cmp #$20           ; $d11a: c9 20     
            bne __d123         ; $d11c: d0 05     
            lda #$ff           ; $d11e: a9 ff     
            sta $0090,y        ; $d120: 99 90 00  
__d123:     dey                ; $d123: 88        
            bne __d117         ; $d124: d0 f1     
__d126:     rts                ; $d126: 60        

;-------------------------------------------------------------------------------
__d127:     lda #$01           ; $d127: a9 01     
            sta $e4,x          ; $d129: 95 e4     
            lda #$80           ; $d12b: a9 80     
            sta $e2,x          ; $d12d: 95 e2     
            lda #$01           ; $d12f: a9 01     
            sta $2f,x          ; $d131: 95 2f     
__d133:     lda $66,x          ; $d133: b5 66     
            sta $01            ; $d135: 85 01     
            lda $5f            ; $d137: a5 5f     
            jsr __c83d         ; $d139: 20 3d c8  
            ldx $5f            ; $d13c: a6 5f     
            lda $01            ; $d13e: a5 01     
            sta $66,x          ; $d140: 95 66     
            rts                ; $d142: 60        

;-------------------------------------------------------------------------------
__d143:     ldy $6a,x          ; $d143: b4 6a     
            cpy #$01           ; $d145: c0 01     
            bne __d160         ; $d147: d0 17     
            lda $6e,x          ; $d149: b5 6e     
            cmp #$18           ; $d14b: c9 18     
            bcs __d151         ; $d14d: b0 02     
            inc $6e,x          ; $d14f: f6 6e     
__d151:     lda $76,x          ; $d151: b5 76     
            clc                ; $d153: 18        
            adc #$20           ; $d154: 69 20     
            sta $76,x          ; $d156: 95 76     
            bcc __d171         ; $d158: 90 17     
            jsr __d171         ; $d15a: 20 71 d1  
            jmp __d171         ; $d15d: 4c 71 d1  

;-------------------------------------------------------------------------------
__d160:     lda #$90           ; $d160: a9 90     
            ldy $6e,x          ; $d162: b4 6e     
            cpy #$0c           ; $d164: c0 0c     
            bcs __d16a         ; $d166: b0 02     
            lda #$45           ; $d168: a9 45     
__d16a:     clc                ; $d16a: 18        
            adc $72,x          ; $d16b: 75 72     
            sta $72,x          ; $d16d: 95 72     
            bcc __d17b         ; $d16f: 90 0a     
__d171:     ldy $62,x          ; $d171: b4 62     
            lda __cbda,y       ; $d173: b9 da cb  
            clc                ; $d176: 18        
            adc $64,x          ; $d177: 75 64     
            sta $64,x          ; $d179: 95 64     
__d17b:     rts                ; $d17b: 60        

;-------------------------------------------------------------------------------
__d17c:     lda __cbb3,y       ; $d17c: b9 b3 cb  
            sta $02            ; $d17f: 85 02     
            tya                ; $d181: 98        
            pha                ; $d182: 48        
            ldx $5f            ; $d183: a6 5f     
            lda $64,x          ; $d185: b5 64     
            sta $00            ; $d187: 85 00     
            lda $66,x          ; $d189: b5 66     
            cpy #$0a           ; $d18b: c0 0a     
            bne __d192         ; $d18d: d0 03     
            sec                ; $d18f: 38        
            sbc #$08           ; $d190: e9 08     
__d192:     sta $01            ; $d192: 85 01     
            lda $62,x          ; $d194: b5 62     
            sta $0f            ; $d196: 85 0f     
            txa                ; $d198: 8a        
            tay                ; $d199: a8        
            iny                ; $d19a: c8        
            jsr __d1db         ; $d19b: 20 db d1  
            pla                ; $d19e: 68        
            cmp #$0b           ; $d19f: c9 0b     
            beq __d1a7         ; $d1a1: f0 04     
            cmp #$06           ; $d1a3: c9 06     
            bcs __d1ab         ; $d1a5: b0 04     
__d1a7:     lda #$f8           ; $d1a7: a9 f8     
            bne __d1d2         ; $d1a9: d0 27     
__d1ab:     sec                ; $d1ab: 38        
            sbc #$06           ; $d1ac: e9 06     
            sta $07            ; $d1ae: 85 07     
            ldy $07            ; $d1b0: a4 07     
            lda __cbc1,y       ; $d1b2: b9 c1 cb  
            sta $02            ; $d1b5: 85 02     
            lda $07            ; $d1b7: a5 07     
            asl                ; $d1b9: 0a        
            asl                ; $d1ba: 0a        
            tay                ; $d1bb: a8        
            ldx $5f            ; $d1bc: a6 5f     
            lda $62,x          ; $d1be: b5 62     
            beq __d1c4         ; $d1c0: f0 02     
            iny                ; $d1c2: c8        
            iny                ; $d1c3: c8        
__d1c4:     lda __cbc6,y       ; $d1c4: b9 c6 cb  
            clc                ; $d1c7: 18        
            adc $64,x          ; $d1c8: 75 64     
            sta $00            ; $d1ca: 85 00     
            lda __cbc7,y       ; $d1cc: b9 c7 cb  
            clc                ; $d1cf: 18        
            adc $66,x          ; $d1d0: 75 66     
__d1d2:     sta $01            ; $d1d2: 85 01     
            ldy #$0b           ; $d1d4: a0 0b     
            cpx #$00           ; $d1d6: e0 00     
            beq __d1db         ; $d1d8: f0 01     
            iny                ; $d1da: c8        
__d1db:     lda #$01           ; $d1db: a9 01     
            sta $0e            ; $d1dd: 85 0e     
            jsr __eafc         ; $d1df: 20 fc ea  
            ldx $5f            ; $d1e2: a6 5f     
            rts                ; $d1e4: 60        

;-------------------------------------------------------------------------------
__d1e5:     ldx #$01           ; $d1e5: a2 01     
__d1e7:     lda $5a,x          ; $d1e7: b5 5a     
            beq __d1f5         ; $d1e9: f0 0a     
            lda $66,x          ; $d1eb: b5 66     
            clc                ; $d1ed: 18        
            adc #$18           ; $d1ee: 69 18     
            jsr __d1f9         ; $d1f0: 20 f9 d1  
            sta $5a,x          ; $d1f3: 95 5a     
__d1f5:     dex                ; $d1f5: ca        
            bpl __d1e7         ; $d1f6: 10 ef     
            rts                ; $d1f8: 60        

;-------------------------------------------------------------------------------
__d1f9:     ldy #$00           ; $d1f9: a0 00     
__d1fb:     cmp __cbe8,y       ; $d1fb: d9 e8 cb  
            bcc __d206         ; $d1fe: 90 06     
            iny                ; $d200: c8        
            cpy #$05           ; $d201: c0 05     
            bne __d1fb         ; $d203: d0 f6     
            dey                ; $d205: 88        
__d206:     sty $0a            ; $d206: 84 0a     
            lda $90            ; $d208: a5 90     
            sec                ; $d20a: 38        
            sbc $0a            ; $d20b: e5 0a     
            bne __d211         ; $d20d: d0 02     
            lda #$01           ; $d20f: a9 01     
__d211:     rts                ; $d211: 60        

;-------------------------------------------------------------------------------
__d212:     lda $5a            ; $d212: a5 5a     
            and $5b            ; $d214: 25 5b     
            beq __d211         ; $d216: f0 f9     
            lda $2d            ; $d218: a5 2d     
            ora $2e            ; $d21a: 05 2e     
            bne __d211         ; $d21c: d0 f3     
            lda #$07           ; $d21e: a9 07     
            cmp $6a            ; $d220: c5 6a     
            beq __d211         ; $d222: f0 ed     
            cmp $6b            ; $d224: c5 6b     
            beq __d211         ; $d226: f0 e9     
            jsr __d2d9         ; $d228: 20 d9 d2  
            bcs __d211         ; $d22b: b0 e4     
            lda #$00           ; $d22d: a9 00     
            sta $02            ; $d22f: 85 02     
            lda $6a            ; $d231: a5 6a     
            lsr                ; $d233: 4a        
            bcs __d25a         ; $d234: b0 24     
            lda $00            ; $d236: a5 00     
            cmp #$09           ; $d238: c9 09     
            bcs __d25a         ; $d23a: b0 1e     
            lda $66            ; $d23c: a5 66     
            cmp $67            ; $d23e: c5 67     
            bcs __d249         ; $d240: b0 07     
            cmp #$c3           ; $d242: c9 c3     
            bcs __d24b         ; $d244: b0 05     
            dec $66            ; $d246: c6 66     
            .hex 2c            ; $d248: 2c        Suspected data
__d249:     inc $66            ; $d249: e6 66     
__d24b:     lda $62            ; $d24b: a5 62     
            beq __d252         ; $d24d: f0 03     
            inc $64            ; $d24f: e6 64     
            .hex 2c            ; $d251: 2c        Suspected data
__d252:     dec $64            ; $d252: c6 64     
            lda #$01           ; $d254: a9 01     
            sta $02            ; $d256: 85 02     
            bne __d269         ; $d258: d0 0f     
__d25a:     ldx #$00           ; $d25a: a2 00     
            lda $03            ; $d25c: a5 03     
            bpl __d264         ; $d25e: 10 04     
            lda #$00           ; $d260: a9 00     
            beq __d266         ; $d262: f0 02     
__d264:     lda #$01           ; $d264: a9 01     
__d266:     jsr __d2bc         ; $d266: 20 bc d2  
__d269:     lda $6b            ; $d269: a5 6b     
            and #$01           ; $d26b: 29 01     
            bne __d2b6         ; $d26d: d0 47     
            lda $00            ; $d26f: a5 00     
            cmp #$09           ; $d271: c9 09     
            bcs __d2b6         ; $d273: b0 41     
            lda $67            ; $d275: a5 67     
            cmp $66            ; $d277: c5 66     
            bcs __d282         ; $d279: b0 07     
            cmp #$c3           ; $d27b: c9 c3     
            bcs __d284         ; $d27d: b0 05     
            dec $67            ; $d27f: c6 67     
            .hex 2c            ; $d281: 2c        Suspected data
__d282:     inc $67            ; $d282: e6 67     
__d284:     lda $02            ; $d284: a5 02     
            beq __d2b5         ; $d286: f0 2d     
            lda $e6            ; $d288: a5 e6     
            pha                ; $d28a: 48        
            lda $e7            ; $d28b: a5 e7     
            sta $e6            ; $d28d: 85 e6     
            pla                ; $d28f: 68        
            sta $e7            ; $d290: 85 e7     
            lda $e8            ; $d292: a5 e8     
            pha                ; $d294: 48        
            lda $e9            ; $d295: a5 e9     
            sta $e8            ; $d297: 85 e8     
            pla                ; $d299: 68        
            sta $e9            ; $d29a: 85 e9     
            ldx #$01           ; $d29c: a2 01     
__d29e:     lda $e6,x          ; $d29e: b5 e6     
            cmp #$06           ; $d2a0: c9 06     
            bcc __d2a8         ; $d2a2: 90 04     
            lda #$05           ; $d2a4: a9 05     
            sta $e6,x          ; $d2a6: 95 e6     
__d2a8:     dex                ; $d2a8: ca        
            bpl __d29e         ; $d2a9: 10 f3     
            lda #$00           ; $d2ab: a9 00     
            sta $86            ; $d2ad: 85 86     
            sta $87            ; $d2af: 85 87     
            sta $88            ; $d2b1: 85 88     
            sta $89            ; $d2b3: 85 89     
__d2b5:     rts                ; $d2b5: 60        

;-------------------------------------------------------------------------------
__d2b6:     ldx #$01           ; $d2b6: a2 01     
            lda $62            ; $d2b8: a5 62     
            eor #$01           ; $d2ba: 49 01     
__d2bc:     sta $62,x          ; $d2bc: 95 62     
            beq __d2c7         ; $d2be: f0 07     
            inc $64,x          ; $d2c0: f6 64     
            inc $64,x          ; $d2c2: f6 64     
            jmp __d2cb         ; $d2c4: 4c cb d2  

;-------------------------------------------------------------------------------
__d2c7:     dec $64,x          ; $d2c7: d6 64     
            dec $64,x          ; $d2c9: d6 64     
__d2cb:     lda $68,x          ; $d2cb: b5 68     
            lsr                ; $d2cd: 4a        
            bcc __d2d2         ; $d2ce: 90 02     
            lda #$02           ; $d2d0: a9 02     
__d2d2:     sta $68,x          ; $d2d2: 95 68     
            lda #$18           ; $d2d4: a9 18     
            sta $6e,x          ; $d2d6: 95 6e     
            rts                ; $d2d8: 60        

;-------------------------------------------------------------------------------
__d2d9:     lda $64            ; $d2d9: a5 64     
            sec                ; $d2db: 38        
            sbc $65            ; $d2dc: e5 65     
            sta $03            ; $d2de: 85 03     
            jsr __d2f9         ; $d2e0: 20 f9 d2  
            sta $00            ; $d2e3: 85 00     
            cmp #$0a           ; $d2e5: c9 0a     
            bcs __d2f8         ; $d2e7: b0 0f     
            lda $66            ; $d2e9: a5 66     
            sec                ; $d2eb: 38        
            sbc $67            ; $d2ec: e5 67     
            jsr __d2f9         ; $d2ee: 20 f9 d2  
            sta $01            ; $d2f1: 85 01     
            cmp #$15           ; $d2f3: c9 15     
            bcc __d2f8         ; $d2f5: 90 01     
            sec                ; $d2f7: 38        
__d2f8:     rts                ; $d2f8: 60        

;-------------------------------------------------------------------------------
__d2f9:     bpl __d300         ; $d2f9: 10 05     
__d2fb:     eor #$ff           ; $d2fb: 49 ff     
            clc                ; $d2fd: 18        
            adc #$01           ; $d2fe: 69 01     
__d300:     rts                ; $d300: 60        

;-------------------------------------------------------------------------------
__d301:     ldx #$00           ; $d301: a2 00     
            jsr __d308         ; $d303: 20 08 d3  
            ldx #$01           ; $d306: a2 01     
__d308:     lda $5a,x          ; $d308: b5 5a     
            beq __d371         ; $d30a: f0 65     
            lda $6a,x          ; $d30c: b5 6a     
            beq __d371         ; $d30e: f0 61     
            cmp #$07           ; $d310: c9 07     
            beq __d371         ; $d312: f0 5d     
            cmp #$09           ; $d314: c9 09     
            beq __d371         ; $d316: f0 59     
            lda $2d,x          ; $d318: b5 2d     
            bne __d371         ; $d31a: d0 55     
            lda $64,x          ; $d31c: b5 64     
            clc                ; $d31e: 18        
            adc #$08           ; $d31f: 69 08     
            sta $0a            ; $d321: 85 0a     
            lda $66,x          ; $d323: b5 66     
            clc                ; $d325: 18        
            adc #$0c           ; $d326: 69 0c     
            sta $0b            ; $d328: 85 0b     
            txa                ; $d32a: 8a        
            pha                ; $d32b: 48        
            ldy #$00           ; $d32c: a0 00     
__d32e:     lda #$01           ; $d32e: a9 01     
            jsr __db1d         ; $d330: 20 1d db  
            bcs __d33c         ; $d333: b0 07     
            iny                ; $d335: c8        
            cpy #$0b           ; $d336: c0 0b     
            bcc __d32e         ; $d338: 90 f4     
            pla                ; $d33a: 68        
            rts                ; $d33b: 60        

;-------------------------------------------------------------------------------
__d33c:     pla                ; $d33c: 68        
            tax                ; $d33d: aa        
            lda $55            ; $d33e: a5 55     
            cmp #$02           ; $d340: c9 02     
            beq __d393         ; $d342: f0 4f     
            cpy #$01           ; $d344: c0 01     
            beq __d372         ; $d346: f0 2a     
            jsr __d446         ; $d348: 20 46 d4  
            lda #$20           ; $d34b: a9 20     
            sta $0091,y        ; $d34d: 99 91 00  
            cpy #$02           ; $d350: c0 02     
            bcc __d371         ; $d352: 90 1d     
            cpy #$08           ; $d354: c0 08     
            bcs __d371         ; $d356: b0 19     
            cpy #$05           ; $d358: c0 05     
            bcs __d367         ; $d35a: b0 0b     
            lda $0094,y        ; $d35c: b9 94 00  
            bpl __d371         ; $d35f: 10 10     
            lda #$20           ; $d361: a9 20     
            sta $0094,y        ; $d363: 99 94 00  
            rts                ; $d366: 60        

;-------------------------------------------------------------------------------
__d367:     lda $008e,y        ; $d367: b9 8e 00  
            bpl __d371         ; $d36a: 10 05     
            lda #$20           ; $d36c: a9 20     
            sta $008e,y        ; $d36e: 99 8e 00  
__d371:     rts                ; $d371: 60        

;-------------------------------------------------------------------------------
__d372:     ldy #$01           ; $d372: a0 01     
            lda $00            ; $d374: a5 00     
            bmi __d37f         ; $d376: 30 07     
            dec $64,x          ; $d378: d6 64     
            dec $64,x          ; $d37a: d6 64     
            iny                ; $d37c: c8        
            bne __d383         ; $d37d: d0 04     
__d37f:     inc $64,x          ; $d37f: f6 64     
            inc $64,x          ; $d381: f6 64     
__d383:     lda $6a,x          ; $d383: b5 6a     
            and #$01           ; $d385: 29 01     
            beq __d390         ; $d387: f0 07     
            sty $68,x          ; $d389: 94 68     
            tya                ; $d38b: 98        
            and #$01           ; $d38c: 29 01     
            sta $62,x          ; $d38e: 95 62     
__d390:     rts                ; $d390: 60        

;-------------------------------------------------------------------------------
__d391:     brk                ; $d391: 00        
            .hex 05            ; $d392: 05        Suspected data
__d393:     cpy #$03           ; $d393: c0 03     
            bcc __d3ab         ; $d395: 90 14     
            cpy #$09           ; $d397: c0 09     
            bcs __d3ab         ; $d399: b0 10     
            lda #$01           ; $d39b: a9 01     
            sta $0091,y        ; $d39d: 99 91 00  
            lda __d391,x       ; $d3a0: bd 91 d3  
            tax                ; $d3a3: aa        
            inc $0361,x        ; $d3a4: fe 61 03  
            lda #$10           ; $d3a7: a9 10     
            sta $fe            ; $d3a9: 85 fe     
__d3ab:     rts                ; $d3ab: 60        

;-------------------------------------------------------------------------------
__d3ac:     ldx #$00           ; $d3ac: a2 00     
            jsr __d3b3         ; $d3ae: 20 b3 d3  
            ldx #$01           ; $d3b1: a2 01     
__d3b3:     lda $5a,x          ; $d3b3: b5 5a     
            beq __d3f5         ; $d3b5: f0 3e     
            txa                ; $d3b7: 8a        
            asl                ; $d3b8: 0a        
            asl                ; $d3b9: 0a        
            tay                ; $d3ba: a8        
            lda $021c,y        ; $d3bb: b9 1c 02  
            clc                ; $d3be: 18        
            adc #$0a           ; $d3bf: 69 0a     
            sta $0b            ; $d3c1: 85 0b     
            lda $021f,y        ; $d3c3: b9 1f 02  
            clc                ; $d3c6: 18        
            adc #$04           ; $d3c7: 69 04     
            sta $0a            ; $d3c9: 85 0a     
            stx $09            ; $d3cb: 86 09     
            ldy #$0a           ; $d3cd: a0 0a     
__d3cf:     ldx $09            ; $d3cf: a6 09     
            cpy #$00           ; $d3d1: c0 00     
            beq __d3d9         ; $d3d3: f0 04     
            cpy #$08           ; $d3d5: c0 08     
            bcc __d3df         ; $d3d7: 90 06     
__d3d9:     lda $6a,x          ; $d3d9: b5 6a     
            cmp #$04           ; $d3db: c9 04     
            beq __d3eb         ; $d3dd: f0 0c     
__d3df:     lda $6a,x          ; $d3df: b5 6a     
            cmp #$05           ; $d3e1: c9 05     
            bne __d3f2         ; $d3e3: d0 0d     
            lda $60,x          ; $d3e5: b5 60     
            cmp #$09           ; $d3e7: c9 09     
            bne __d3f2         ; $d3e9: d0 07     
__d3eb:     lda #$00           ; $d3eb: a9 00     
            jsr __db1d         ; $d3ed: 20 1d db  
            bcs __d3f6         ; $d3f0: b0 04     
__d3f2:     dey                ; $d3f2: 88        
            bpl __d3cf         ; $d3f3: 10 da     
__d3f5:     rts                ; $d3f5: 60        

;-------------------------------------------------------------------------------
__d3f6:     ldx $09            ; $d3f6: a6 09     
            lda #$01           ; $d3f8: a9 01     
            cpy #$01           ; $d3fa: c0 01     
            bne __d400         ; $d3fc: d0 02     
            lda #$05           ; $d3fe: a9 05     
__d400:     sta $0091,y        ; $d400: 99 91 00  
            lda #$00           ; $d403: a9 00     
            sta $03b1,y        ; $d405: 99 b1 03  
            lda #$ff           ; $d408: a9 ff     
            sta $03d2,y        ; $d40a: 99 d2 03  
            txa                ; $d40d: 8a        
            pha                ; $d40e: 48        
            jsr __d421         ; $d40f: 20 21 d4  
            pla                ; $d412: 68        
            tax                ; $d413: aa        
            cpy #$00           ; $d414: c0 00     
            beq __d3f5         ; $d416: f0 dd     
            cpy #$08           ; $d418: c0 08     
            bcs __d3f5         ; $d41a: b0 d9     
            stx $5f            ; $d41c: 86 5f     
            jmp __d07c         ; $d41e: 4c 7c d0  

;-------------------------------------------------------------------------------
__d421:     lda __d391,x       ; $d421: bd 91 d3  
            tax                ; $d424: aa        
            cpy #$00           ; $d425: c0 00     
            bne __d431         ; $d427: d0 08     
            inc $0363,x        ; $d429: fe 63 03  
            lda #$01           ; $d42c: a9 01     
            sta $fe            ; $d42e: 85 fe     
            rts                ; $d430: 60        

;-------------------------------------------------------------------------------
__d431:     cpy #$05           ; $d431: c0 05     
            bcc __d43c         ; $d433: 90 07     
            cpy #$08           ; $d435: c0 08     
            bcs __d441         ; $d437: b0 08     
            inc $0362,x        ; $d439: fe 62 03  
__d43c:     lda #$08           ; $d43c: a9 08     
            sta $ff            ; $d43e: 85 ff     
            rts                ; $d440: 60        

;-------------------------------------------------------------------------------
__d441:     lda #$02           ; $d441: a9 02     
            sta $fc            ; $d443: 85 fc     
            rts                ; $d445: 60        

;-------------------------------------------------------------------------------
__d446:     lda #$07           ; $d446: a9 07     
            sta $6a,x          ; $d448: 95 6a     
            lda $5a,x          ; $d44a: b5 5a     
            sta $0382,x        ; $d44c: 9d 82 03  
            txa                ; $d44f: 8a        
            pha                ; $d450: 48        
            clc                ; $d451: 18        
            adc #$0d           ; $d452: 69 0d     
            tax                ; $d454: aa        
            jsr __f691         ; $d455: 20 91 f6  
            pla                ; $d458: 68        
            tax                ; $d459: aa        
            lda #$40           ; $d45a: a9 40     
            sta $32,x          ; $d45c: 95 32     
            lda #$01           ; $d45e: a9 01     
            sta $ff            ; $d460: 85 ff     
            rts                ; $d462: 60        

;-------------------------------------------------------------------------------
__d463:     ldx #$00           ; $d463: a2 00     
__d465:     lda $5a,x          ; $d465: b5 5a     
            beq __d487         ; $d467: f0 1e     
            lda $66,x          ; $d469: b5 66     
            clc                ; $d46b: 18        
            adc #$19           ; $d46c: 69 19     
            jsr __cedb         ; $d46e: 20 db ce  
            bcs __d487         ; $d471: b0 14     
            cpy #$0a           ; $d473: c0 0a     
            bne __d487         ; $d475: d0 10     
            lda #$00           ; $d477: a9 00     
            sta $5a,x          ; $d479: 95 5a     
            sta $e0,x          ; $d47b: 95 e0     
            lda $2d,x          ; $d47d: b5 2d     
            bne __d483         ; $d47f: d0 02     
            dec $20,x          ; $d481: d6 20     
__d483:     lda #$08           ; $d483: a9 08     
            sta $3f,x          ; $d485: 95 3f     
__d487:     inx                ; $d487: e8        
            cpx #$02           ; $d488: e0 02     
            bne __d465         ; $d48a: d0 d9     
__d48c:     rts                ; $d48c: 60        

;-------------------------------------------------------------------------------
__d48d:     bit $ac64          ; $d48d: 2c 64 ac  
__d490:     jmp __cc94         ; $d490: 4c 94 cc  

;-------------------------------------------------------------------------------
__d493:     ldx #$01           ; $d493: a2 01     
__d495:     lda $5a,x          ; $d495: b5 5a     
            cmp #$09           ; $d497: c9 09     
            bne __d4ce         ; $d499: d0 33     
            ldy #$02           ; $d49b: a0 02     
__d49d:     lda $64,x          ; $d49d: b5 64     
            cmp __d48d,y       ; $d49f: d9 8d d4  
            bcc __d4a9         ; $d4a2: 90 05     
            cmp __d490,y       ; $d4a4: d9 90 d4  
            bcc __d4ae         ; $d4a7: 90 05     
__d4a9:     dey                ; $d4a9: 88        
            bpl __d49d         ; $d4aa: 10 f1     
            bmi __d4ce         ; $d4ac: 30 20     
__d4ae:     lda $e6,x          ; $d4ae: b5 e6     
            cmp #$03           ; $d4b0: c9 03     
            bcc __d4c0         ; $d4b2: 90 0c     
            lda $66,x          ; $d4b4: b5 66     
            cmp #$14           ; $d4b6: c9 14     
            bcs __d4ce         ; $d4b8: b0 14     
            cmp #$10           ; $d4ba: c9 10     
            bcs __d4d2         ; $d4bc: b0 14     
            bcc __d4ce         ; $d4be: 90 0e     
__d4c0:     lda $66,x          ; $d4c0: b5 66     
            cmp #$2c           ; $d4c2: c9 2c     
            bcs __d4ce         ; $d4c4: b0 08     
            cmp #$28           ; $d4c6: c9 28     
            bcc __d4ce         ; $d4c8: 90 04     
            lda #$03           ; $d4ca: a9 03     
            sta $e6,x          ; $d4cc: 95 e6     
__d4ce:     dex                ; $d4ce: ca        
            bpl __d495         ; $d4cf: 10 c4     
            rts                ; $d4d1: 60        

;-------------------------------------------------------------------------------
__d4d2:     lda #$10           ; $d4d2: a9 10     
            sta $66,x          ; $d4d4: 95 66     
            lda #$09           ; $d4d6: a9 09     
            cmp $5a            ; $d4d8: c5 5a     
            beq __d4e4         ; $d4da: f0 08     
            cmp $5b            ; $d4dc: c5 5b     
            bne __d48c         ; $d4de: d0 ac     
            lda #$01           ; $d4e0: a9 01     
            bne __d4ee         ; $d4e2: d0 0a     
__d4e4:     lda #$00           ; $d4e4: a9 00     
            ldy $5b            ; $d4e6: a4 5b     
            cpy #$09           ; $d4e8: c0 09     
            bne __d4ee         ; $d4ea: d0 02     
            lda #$02           ; $d4ec: a9 02     
__d4ee:     sta $26            ; $d4ee: 85 26     
            lda #$02           ; $d4f0: a9 02     
            bit $01a9          ; $d4f2: 2c a9 01  
__d4f5:     sta $55            ; $d4f5: 85 55     
            lda #$80           ; $d4f7: a9 80     
            sta $fb            ; $d4f9: 85 fb     
            asl                ; $d4fb: 0a        
            sta $34            ; $d4fc: 85 34     
            sta $51            ; $d4fe: 85 51     
            rts                ; $d500: 60        

;-------------------------------------------------------------------------------
__d501:     ora ($02,x)        ; $d501: 01 02     
            .hex 04 04         ; $d503: 04 04     Invalid Opcode - NOP $04
__d505:     asl                ; $d505: 0a        
            .hex 05            ; $d506: 05        Suspected data
__d507:     lda $13            ; $d507: a5 13     
            bne __d547         ; $d509: d0 3c     
            lda $66,x          ; $d50b: b5 66     
            cmp #$26           ; $d50d: c9 26     
            bcs __d547         ; $d50f: b0 36     
            lda $0361          ; $d511: ad 61 03  
            adc $0366          ; $d514: 6d 66 03  
            lsr                ; $d517: 4a        
            and #$03           ; $d518: 29 03     
            tay                ; $d51a: a8        
            lda __d501,y       ; $d51b: b9 01 d5  
            sta $01            ; $d51e: 85 01     
            ldy $d5            ; $d520: a4 d5     
            lda __d505,y       ; $d522: b9 05 d5  
            clc                ; $d525: 18        
            adc $d6            ; $d526: 65 d6     
            sta $00            ; $d528: 85 00     
            cmp $64,x          ; $d52a: d5 64     
            bcs __d547         ; $d52c: b0 19     
            adc $01            ; $d52e: 65 01     
            cmp $64,x          ; $d530: d5 64     
            bcc __d547         ; $d532: 90 13     
            lda $00            ; $d534: a5 00     
            sta $64,x          ; $d536: 95 64     
            inx                ; $d538: e8        
            stx $1e            ; $d539: 86 1e     
            dex                ; $d53b: ca        
            lda #$06           ; $d53c: a9 06     
            sta $6a,x          ; $d53e: 95 6a     
            lda #$10           ; $d540: a9 10     
            sta $fb            ; $d542: 85 fb     
            asl                ; $d544: 0a        
            sta $4d            ; $d545: 85 4d     
__d547:     lda $5f            ; $d547: a5 5f     
            asl                ; $d549: 0a        
            asl                ; $d54a: 0a        
            tay                ; $d54b: a8        
            lda #$f8           ; $d54c: a9 f8     
            sta $021c,y        ; $d54e: 99 1c 02  
            rts                ; $d551: 60        

;-------------------------------------------------------------------------------
            lda $6a,x          ; $d552: b5 6a     
            cmp #$01           ; $d554: c9 01     
            beq __d561         ; $d556: f0 09     
            cmp #$02           ; $d558: c9 02     
            beq __d567         ; $d55a: f0 0b     
            cmp #$03           ; $d55c: c9 03     
            beq __d564         ; $d55e: f0 04     
            rts                ; $d560: 60        

;-------------------------------------------------------------------------------
__d561:     jmp __cdb0         ; $d561: 4c b0 cd  

;-------------------------------------------------------------------------------
__d564:     jmp __cfc6         ; $d564: 4c c6 cf  

;-------------------------------------------------------------------------------
__d567:     lda #$a8           ; $d567: a9 a8     
            sta $e2,x          ; $d569: 95 e2     
            lda #$03           ; $d56b: a9 03     
            sta $e4,x          ; $d56d: 95 e4     
            lda $68,x          ; $d56f: b5 68     
            bne __d58d         ; $d571: d0 1a     
            lda $e6,x          ; $d573: b5 e6     
            cmp #$03           ; $d575: c9 03     
            bcc __d58d         ; $d577: 90 14     
            lda $70,x          ; $d579: b5 70     
            and #$03           ; $d57b: 29 03     
            beq __d58d         ; $d57d: f0 0e     
            sta $68,x          ; $d57f: 95 68     
            cmp #$01           ; $d581: c9 01     
            beq __d587         ; $d583: f0 02     
            lda #$00           ; $d585: a9 00     
__d587:     sta $62,x          ; $d587: 95 62     
            lda #$0f           ; $d589: a9 0f     
            sta $6e,x          ; $d58b: 95 6e     
__d58d:     lda $68,x          ; $d58d: b5 68     
            beq __d594         ; $d58f: f0 03     
            jsr __d160         ; $d591: 20 60 d1  
__d594:     jsr __d133         ; $d594: 20 33 d1  
            ldy #$07           ; $d597: a0 07     
            jmp __d17c         ; $d599: 4c 7c d1  

;-------------------------------------------------------------------------------
            lda #$00           ; $d59c: a9 00     
            sta $2a,x          ; $d59e: 95 2a     
            lda $13            ; $d5a0: a5 13     
            clc                ; $d5a2: 18        
            adc $66,x          ; $d5a3: 75 66     
            bcs __d5b0         ; $d5a5: b0 09     
            sta $28,x          ; $d5a7: 95 28     
            ldy $27            ; $d5a9: a4 27     
            beq __d5b4         ; $d5ab: f0 07     
            sec                ; $d5ad: 38        
            sbc #$10           ; $d5ae: e9 10     
__d5b0:     sta $28,x          ; $d5b0: 95 28     
            inc $2a,x          ; $d5b2: f6 2a     
__d5b4:     lda $2a,x          ; $d5b4: b5 2a     
            sta $09            ; $d5b6: 85 09     
            lda $28,x          ; $d5b8: b5 28     
            sta $0b            ; $d5ba: 85 0b     
            clc                ; $d5bc: 18        
            adc #$18           ; $d5bd: 69 18     
            sta $0a            ; $d5bf: 85 0a     
            bcc __d5c5         ; $d5c1: 90 02     
            inc $09            ; $d5c3: e6 09     
__d5c5:     lda $64,x          ; $d5c5: b5 64     
            sta $0d            ; $d5c7: 85 0d     
            clc                ; $d5c9: 18        
            adc #$10           ; $d5ca: 69 10     
            sta $0c            ; $d5cc: 85 0c     
            lda $0352,x        ; $d5ce: bd 52 03  
            bne __d648         ; $d5d1: d0 75     
            ldy #$00           ; $d5d3: a0 00     
__d5d5:     lda $06e0,y        ; $d5d5: b9 e0 06  
            bmi __d603         ; $d5d8: 30 29     
            cmp $09            ; $d5da: c5 09     
            bne __d603         ; $d5dc: d0 25     
            lda $0668,y        ; $d5de: b9 68 06  
            sbc #$08           ; $d5e1: e9 08     
            cmp $64,x          ; $d5e3: d5 64     
            bcs __d603         ; $d5e5: b0 1c     
            lda $0686,y        ; $d5e7: b9 86 06  
            sec                ; $d5ea: 38        
            sbc #$08           ; $d5eb: e9 08     
            cmp $64,x          ; $d5ed: d5 64     
            bcc __d603         ; $d5ef: 90 12     
            lda $0a            ; $d5f1: a5 0a     
            sbc #$03           ; $d5f3: e9 03     
            cmp $06a4,y        ; $d5f5: d9 a4 06  
            beq __d617         ; $d5f8: f0 1d     
            bcs __d603         ; $d5fa: b0 07     
            adc #$04           ; $d5fc: 69 04     
            cmp $06a4,y        ; $d5fe: d9 a4 06  
            bcs __d617         ; $d601: b0 14     
__d603:     iny                ; $d603: c8        
            cpy #$1e           ; $d604: c0 1e     
            bne __d5d5         ; $d606: d0 cd     
            lda #$02           ; $d608: a9 02     
            cmp $6a,x          ; $d60a: d5 6a     
            beq __d63b         ; $d60c: f0 2d     
            sta $6a,x          ; $d60e: 95 6a     
            lda #$03           ; $d610: a9 03     
            sta $e6,x          ; $d612: 95 e6     
            lsr                ; $d614: 4a        
            bne __d639         ; $d615: d0 22     
__d617:     tya                ; $d617: 98        
            sta $0783,x        ; $d618: 9d 83 07  
            lda $6a,x          ; $d61b: b5 6a     
            cmp #$01           ; $d61d: c9 01     
            beq __d62f         ; $d61f: f0 0e     
            cmp #$03           ; $d621: c9 03     
            beq __d63b         ; $d623: f0 16     
            lda $e6,x          ; $d625: b5 e6     
            cmp #$03           ; $d627: c9 03     
            bcc __d63b         ; $d629: 90 10     
            lda #$03           ; $d62b: a9 03     
            sta $6a,x          ; $d62d: 95 6a     
__d62f:     lda $06a4,y        ; $d62f: b9 a4 06  
            sec                ; $d632: 38        
            sbc #$19           ; $d633: e9 19     
            sta $28,x          ; $d635: 95 28     
            lda #$00           ; $d637: a9 00     
__d639:     sta $e0,x          ; $d639: 95 e0     
__d63b:     jsr __d6e0         ; $d63b: 20 e0 d6  
            lda $28,x          ; $d63e: b5 28     
            sec                ; $d640: 38        
            sbc $0b            ; $d641: e5 0b     
            clc                ; $d643: 18        
            adc $66,x          ; $d644: 75 66     
            sta $66,x          ; $d646: 95 66     
__d648:     ldx $5f            ; $d648: a6 5f     
            lda #$00           ; $d64a: a9 00     
            sta $0352,x        ; $d64c: 9d 52 03  
            lda $6a,x          ; $d64f: b5 6a     
            beq __d6cb         ; $d651: f0 78     
            lda $13            ; $d653: a5 13     
            ora $2a,x          ; $d655: 15 2a     
            bne __d669         ; $d657: d0 10     
            lda $64,x          ; $d659: b5 64     
            cmp #$2b           ; $d65b: c9 2b     
            bcc __d6cc         ; $d65d: 90 6d     
            cmp #$c6           ; $d65f: c9 c6     
            bcs __d6cc         ; $d661: b0 69     
            lda $28,x          ; $d663: b5 28     
            cmp #$58           ; $d665: c9 58     
            bcc __d6cb         ; $d667: 90 62     
__d669:     lda #$00           ; $d669: a9 00     
            sta $09            ; $d66b: 85 09     
            lda $28,x          ; $d66d: b5 28     
            sec                ; $d66f: 38        
            sbc #$57           ; $d670: e9 57     
            bcc __d680         ; $d672: 90 0c     
            ldy $2a,x          ; $d674: b4 2a     
            sty $09            ; $d676: 84 09     
            beq __d684         ; $d678: f0 0a     
            clc                ; $d67a: 18        
            adc #$20           ; $d67b: 69 20     
            jmp __d684         ; $d67d: 4c 84 d6  

;-------------------------------------------------------------------------------
__d680:     ldy $2a,x          ; $d680: b4 2a     
            beq __d697         ; $d682: f0 13     
__d684:     ldy #$00           ; $d684: a0 00     
__d686:     cmp #$38           ; $d686: c9 38     
            bcc __d68f         ; $d688: 90 05     
            sbc #$38           ; $d68a: e9 38     
            iny                ; $d68c: c8        
            bne __d686         ; $d68d: d0 f7     
__d68f:     lda $09            ; $d68f: a5 09     
            beq __d697         ; $d691: f0 04     
            iny                ; $d693: c8        
            iny                ; $d694: c8        
            iny                ; $d695: c8        
            iny                ; $d696: c8        
__d697:     lda #$a8           ; $d697: a9 a8     
__d699:     cpy #$00           ; $d699: c0 00     
            beq __d6a3         ; $d69b: f0 06     
            clc                ; $d69d: 18        
            adc #$08           ; $d69e: 69 08     
            dey                ; $d6a0: 88        
            bne __d699         ; $d6a1: d0 f6     
__d6a3:     sta $0a            ; $d6a3: 85 0a     
            sec                ; $d6a5: 38        
            sbc #$a8           ; $d6a6: e9 a8     
            sta $09            ; $d6a8: 85 09     
            lda #$48           ; $d6aa: a9 48     
            sec                ; $d6ac: 38        
            sbc $09            ; $d6ad: e5 09     
            sta $0b            ; $d6af: 85 0b     
            lda $64,x          ; $d6b1: b5 64     
            cmp $0a            ; $d6b3: c5 0a     
            bcc __d6bf         ; $d6b5: 90 08     
            lda $0a            ; $d6b7: a5 0a     
            sta $64,x          ; $d6b9: 95 64     
            lda #$00           ; $d6bb: a9 00     
            beq __d6c9         ; $d6bd: f0 0a     
__d6bf:     cmp $0b            ; $d6bf: c5 0b     
            bcs __d6cb         ; $d6c1: b0 08     
            lda $0b            ; $d6c3: a5 0b     
            sta $64,x          ; $d6c5: 95 64     
            lda #$01           ; $d6c7: a9 01     
__d6c9:     sta $62,x          ; $d6c9: 95 62     
__d6cb:     rts                ; $d6cb: 60        

;-------------------------------------------------------------------------------
__d6cc:     lda #$02           ; $d6cc: a9 02     
            cmp $6a,x          ; $d6ce: d5 6a     
            beq __d6dc         ; $d6d0: f0 0a     
            sta $6a,x          ; $d6d2: 95 6a     
            lda #$03           ; $d6d4: a9 03     
            sta $e6,x          ; $d6d6: 95 e6     
            lda #$01           ; $d6d8: a9 01     
            sta $e0,x          ; $d6da: 95 e0     
__d6dc:     inc $0352,x        ; $d6dc: fe 52 03  
            rts                ; $d6df: 60        

;-------------------------------------------------------------------------------
__d6e0:     lda $e6,x          ; $d6e0: b5 e6     
            cmp #$04           ; $d6e2: c9 04     
            bcs __d71a         ; $d6e4: b0 34     
            ldy #$00           ; $d6e6: a0 00     
__d6e8:     lda $06e0,y        ; $d6e8: b9 e0 06  
            bmi __d715         ; $d6eb: 30 28     
            cmp $2a,x          ; $d6ed: d5 2a     
            bne __d715         ; $d6ef: d0 24     
            lda $0b            ; $d6f1: a5 0b     
            sec                ; $d6f3: 38        
            sbc #$02           ; $d6f4: e9 02     
            cmp $06c2,y        ; $d6f6: d9 c2 06  
            bcs __d715         ; $d6f9: b0 1a     
            adc #$04           ; $d6fb: 69 04     
            cmp $06c2,y        ; $d6fd: d9 c2 06  
            bcc __d715         ; $d700: 90 13     
            lda $0668,y        ; $d702: b9 68 06  
            sbc #$0a           ; $d705: e9 0a     
            cmp $64,x          ; $d707: d5 64     
            bcs __d715         ; $d709: b0 0a     
            lda $0686,y        ; $d70b: b9 86 06  
            sec                ; $d70e: 38        
            sbc #$06           ; $d70f: e9 06     
            cmp $64,x          ; $d711: d5 64     
__d713:     bcs __d71b         ; $d713: b0 06     
__d715:     iny                ; $d715: c8        
            cpy #$1e           ; $d716: c0 1e     
            bne __d6e8         ; $d718: d0 ce     
__d71a:     rts                ; $d71a: 60        

;-------------------------------------------------------------------------------
__d71b:     lda #$04           ; $d71b: a9 04     
            sta $e6,x          ; $d71d: 95 e6     
            lda #$20           ; $d71f: a9 20     
            sta $e8,x          ; $d721: 95 e8     
__d723:     rts                ; $d723: 60        

;-------------------------------------------------------------------------------
__d724:     ldx #$01           ; $d724: a2 01     
__d726:     lda $6a,x          ; $d726: b5 6a     
            cmp #$06           ; $d728: c9 06     
            beq __d74c         ; $d72a: f0 20     
            lda $66,x          ; $d72c: b5 66     
            cmp #$d4           ; $d72e: c9 d4     
            bcc __d74c         ; $d730: 90 1a     
            lda #$f8           ; $d732: a9 f8     
            sta $66,x          ; $d734: 95 66     
            lda #$00           ; $d736: a9 00     
            sta $6a,x          ; $d738: 95 6a     
            sta $5a,x          ; $d73a: 95 5a     
            lda $20,x          ; $d73c: b5 20     
            bmi __d74c         ; $d73e: 30 0c     
            txa                ; $d740: 8a        
            pha                ; $d741: 48        
            lda __cbbf,x       ; $d742: bd bf cb  
            ldx #$06           ; $d745: a2 06     
            jsr __c821         ; $d747: 20 21 c8  
            pla                ; $d74a: 68        
            tax                ; $d74b: aa        
__d74c:     dex                ; $d74c: ca        
            bpl __d726         ; $d74d: 10 d7     
            lda $6a            ; $d74f: a5 6a     
            bne __d723         ; $d751: d0 d0     
            lda $6b            ; $d753: a5 6b     
            bne __d723         ; $d755: d0 cc     
            sta $1e            ; $d757: 85 1e     
            lda #$03           ; $d759: a9 03     
            jmp __d4f5         ; $d75b: 4c f5 d4  

;-------------------------------------------------------------------------------
__d75e:     .hex 80 5d         ; $d75e: 80 5d     Invalid Opcode - NOP #$5d
            .hex 3e 1f         ; $d760: 3e 1f     Suspected data
__d762:     .hex 02            ; $d762: 02        Invalid Opcode - KIL 
            brk                ; $d763: 00        
            clc                ; $d764: 18        
            bmi __d7af         ; $d765: 30 48     
            rts                ; $d767: 60        

;-------------------------------------------------------------------------------
            sei                ; $d768: 78        
            bcc __d713         ; $d769: 90 a8     
            cpy #$d8           ; $d76b: c0 d8     
            rol                ; $d76d: 2a        
            and #$28           ; $d76e: 29 28     
            .hex 23 22         ; $d770: 23 22     Invalid Opcode - RLA ($22,x)
            .hex 22            ; $d772: 22        Invalid Opcode - KIL 
            and ($20,x)        ; $d773: 21 20     
            .hex 2b 20         ; $d775: 2b 20     Invalid Opcode - ANC #$20
            rts                ; $d777: 60        

;-------------------------------------------------------------------------------
            ldy #$a0           ; $d778: a0 a0     
            cpx #$20           ; $d77a: e0 20     
            rts                ; $d77c: 60        

;-------------------------------------------------------------------------------
            ldy #$a0           ; $d77d: a0 a0     
__d77f:     brk                ; $d77f: 00        
            ora ($02,x)        ; $d780: 01 02     
            .hex 03 04         ; $d782: 03 04     Invalid Opcode - SLO ($04,x)
            .hex ff            ; $d784: ff        Suspected data
__d785:     .hex eb 90         ; $d785: eb 90     Invalid Opcode - SBC #$90
__d787:     sta ($eb),y        ; $d787: 91 eb     
            .hex eb 38         ; $d789: eb 38     Invalid Opcode - SBC #$38
__d78b:     rol                ; $d78b: 2a        
            and #$28           ; $d78c: 29 28     
            plp                ; $d78e: 28        
            .hex 23 22         ; $d78f: 23 22     Invalid Opcode - RLA ($22,x)
            and ($20,x)        ; $d791: 21 20     
            .hex 20            ; $d793: 20        Suspected data
__d794:     rti                ; $d794: 40        

;-------------------------------------------------------------------------------
            .hex 80 c0         ; $d795: 80 c0     Invalid Opcode - NOP #$c0
            brk                ; $d797: 00        
            brk                ; $d798: 00        
            rti                ; $d799: 40        

;-------------------------------------------------------------------------------
            .hex 80 c0         ; $d79a: 80 c0     Invalid Opcode - NOP #$c0
            brk                ; $d79c: 00        
__d79d:     .hex eb 90         ; $d79d: eb 90     Invalid Opcode - SBC #$90
            .hex 92            ; $d79f: 92        Invalid Opcode - KIL 
            .hex eb eb         ; $d7a0: eb eb     Invalid Opcode - SBC #$eb
            sec                ; $d7a2: 38        
__d7a3:     jsr $2020          ; $d7a3: 20 20 20  
            plp                ; $d7a6: 28        
            plp                ; $d7a7: 28        
            plp                ; $d7a8: 28        
            bmi __d7db         ; $d7a9: 30 30     
            bmi __d7dd         ; $d7ab: 30 30     
__d7ad:     cpx #$e0           ; $d7ad: e0 e0     
__d7af:     cpx #$d8           ; $d7af: e0 d8     
            cld                ; $d7b1: d8        
            cld                ; $d7b2: d8        
            bne __d785         ; $d7b3: d0 d0     
            bne __d787         ; $d7b5: d0 d0     
__d7b7:     .hex 0c 08 0c      ; $d7b7: 0c 08 0c  Invalid Opcode - NOP $0c08
            .hex 0c 0c 08      ; $d7ba: 0c 0c 08  Invalid Opcode - NOP $080c
__d7bd:     php                ; $d7bd: 08        
            php                ; $d7be: 08        
            php                ; $d7bf: 08        
            php                ; $d7c0: 08        
            php                ; $d7c1: 08        
            .hex 04 04         ; $d7c2: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $d7c4: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $d7c6: 04 04     Invalid Opcode - NOP $04
__d7c8:     .hex 0b 10         ; $d7c8: 0b 10     Invalid Opcode - ANC #$10
            .hex 0b 0b         ; $d7ca: 0b 0b     Invalid Opcode - ANC #$0b
            .hex 0b 08         ; $d7cc: 0b 08     Invalid Opcode - ANC #$08
            php                ; $d7ce: 08        
            php                ; $d7cf: 08        
            php                ; $d7d0: 08        
            php                ; $d7d1: 08        
            php                ; $d7d2: 08        
__d7d3:     php                ; $d7d3: 08        
            .hex 0c 08 08      ; $d7d4: 0c 08 08  Invalid Opcode - NOP $0808
            php                ; $d7d7: 08        
            php                ; $d7d8: 08        
            php                ; $d7d9: 08        
            php                ; $d7da: 08        
__d7db:     asl $06            ; $d7db: 06 06     
__d7dd:     .hex 06            ; $d7dd: 06        Suspected data
__d7de:     lda $8c            ; $d7de: a5 8c     
            bne __d82e         ; $d7e0: d0 4c     
            lda $3d            ; $d7e2: a5 3d     
            bne __d7fc         ; $d7e4: d0 16     
            lda $2c            ; $d7e6: a5 2c     
            beq __d7f1         ; $d7e8: f0 07     
            dec $2c            ; $d7ea: c6 2c     
            lda #$ff           ; $d7ec: a9 ff     
            sta $3d            ; $d7ee: 85 3d     
            rts                ; $d7f0: 60        

;-------------------------------------------------------------------------------
__d7f1:     lda $7c            ; $d7f1: a5 7c     
            bne __d7f8         ; $d7f3: d0 03     
            inc $7c            ; $d7f5: e6 7c     
            rts                ; $d7f7: 60        

;-------------------------------------------------------------------------------
__d7f8:     cmp #$80           ; $d7f8: c9 80     
            beq __d816         ; $d7fa: f0 1a     
__d7fc:     ldx #$01           ; $d7fc: a2 01     
__d7fe:     lda $6a,x          ; $d7fe: b5 6a     
            cmp #$01           ; $d800: c9 01     
            bne __d80a         ; $d802: d0 06     
            lda $90            ; $d804: a5 90     
            cmp $5a,x          ; $d806: d5 5a     
            beq __d80f         ; $d808: f0 05     
__d80a:     dex                ; $d80a: ca        
            bpl __d7fe         ; $d80b: 10 f1     
            bmi __d82e         ; $d80d: 30 1f     
__d80f:     lda #$01           ; $d80f: a9 01     
            sta $0376          ; $d811: 8d 76 03  
            bne __d819         ; $d814: d0 03     
__d816:     jsr __e215         ; $d816: 20 15 e2  
__d819:     lda $90            ; $d819: a5 90     
            cmp #$09           ; $d81b: c9 09     
            beq __d82e         ; $d81d: f0 0f     
__d81f:     lda #$0c           ; $d81f: a9 0c     
            sta $8b            ; $d821: 85 8b     
            sta $8c            ; $d823: 85 8c     
            inc $90            ; $d825: e6 90     
            lda $8a            ; $d827: a5 8a     
            clc                ; $d829: 18        
            adc #$06           ; $d82a: 69 06     
            sta $8a            ; $d82c: 85 8a     
__d82e:     rts                ; $d82e: 60        

;-------------------------------------------------------------------------------
__d82f:     lda $8c            ; $d82f: a5 8c     
            beq __d887         ; $d831: f0 54     
            jsr __e27a         ; $d833: 20 7a e2  
            jsr __e002         ; $d836: 20 02 e0  
            jsr __ec51         ; $d839: 20 51 ec  
            jsr __d90f         ; $d83c: 20 0f d9  
            ldx #$00           ; $d83f: a2 00     
            jsr __d111         ; $d841: 20 11 d1  
            ldx #$01           ; $d844: a2 01     
            jsr __d111         ; $d846: 20 11 d1  
            lda $13            ; $d849: a5 13     
            sec                ; $d84b: 38        
            sbc #$04           ; $d84c: e9 04     
            sta $13            ; $d84e: 85 13     
            jsr __d8ea         ; $d850: 20 ea d8  
            dec $8b            ; $d853: c6 8b     
            bne __d887         ; $d855: d0 30     
            lda #$00           ; $d857: a9 00     
            sta $8c            ; $d859: 85 8c     
            jsr __d8fd         ; $d85b: 20 fd d8  
            jsr __e63d         ; $d85e: 20 3d e6  
            ldx #$07           ; $d861: a2 07     
__d863:     cpx #$00           ; $d863: e0 00     
            beq __d884         ; $d865: f0 1d     
            lda $91,x          ; $d867: b5 91     
            beq __d884         ; $d869: f0 19     
            lda $90            ; $d86b: a5 90     
            sec                ; $d86d: 38        
            sbc $b2,x          ; $d86e: f5 b2     
            cmp #$04           ; $d870: c9 04     
            bcc __d884         ; $d872: 90 10     
            jsr __d888         ; $d874: 20 88 d8  
            cpx #$02           ; $d877: e0 02     
            bcc __d884         ; $d879: 90 09     
            cpx #$05           ; $d87b: e0 05     
            bcs __d884         ; $d87d: b0 05     
            lda #$00           ; $d87f: a9 00     
            sta $0382,x        ; $d881: 9d 82 03  
__d884:     dex                ; $d884: ca        
            bpl __d863         ; $d885: 10 dc     
__d887:     rts                ; $d887: 60        

;-------------------------------------------------------------------------------
__d888:     txa                ; $d888: 8a        
            clc                ; $d889: 18        
            adc #$83           ; $d88a: 69 83     
            sta $03e8,x        ; $d88c: 9d e8 03  
            rts                ; $d88f: 60        

;-------------------------------------------------------------------------------
__d890:     lda $8c            ; $d890: a5 8c     
            bne __d8a5         ; $d892: d0 11     
            ldx #$01           ; $d894: a2 01     
__d896:     lda $6a,x          ; $d896: b5 6a     
            cmp #$01           ; $d898: c9 01     
            bne __d8a2         ; $d89a: d0 06     
            lda $66,x          ; $d89c: b5 66     
            cmp #$60           ; $d89e: c9 60     
            bcc __d8a6         ; $d8a0: 90 04     
__d8a2:     dex                ; $d8a2: ca        
            bpl __d896         ; $d8a3: 10 f1     
__d8a5:     rts                ; $d8a5: 60        

;-------------------------------------------------------------------------------
__d8a6:     lda $13            ; $d8a6: a5 13     
            ora $27            ; $d8a8: 05 27     
            beq __d8a5         ; $d8aa: f0 f9     
            jmp __d81f         ; $d8ac: 4c 1f d8  

;-------------------------------------------------------------------------------
__d8af:     lda $8c            ; $d8af: a5 8c     
            beq __d8a5         ; $d8b1: f0 f2     
            lda $13            ; $d8b3: a5 13     
            sec                ; $d8b5: 38        
            sbc #$04           ; $d8b6: e9 04     
            sta $13            ; $d8b8: 85 13     
            cmp #$f0           ; $d8ba: c9 f0     
            bcc __d8c8         ; $d8bc: 90 0a     
            lda $27            ; $d8be: a5 27     
            bne __d8c6         ; $d8c0: d0 04     
            sta $13            ; $d8c2: 85 13     
            beq __d8c8         ; $d8c4: f0 02     
__d8c6:     dec $27            ; $d8c6: c6 27     
__d8c8:     jsr __d8ea         ; $d8c8: 20 ea d8  
            jsr __e277         ; $d8cb: 20 77 e2  
            jsr __ec51         ; $d8ce: 20 51 ec  
            jsr __d90f         ; $d8d1: 20 0f d9  
            lda $13            ; $d8d4: a5 13     
            beq __d8dc         ; $d8d6: f0 04     
            dec $8b            ; $d8d8: c6 8b     
            bne __d8a5         ; $d8da: d0 c9     
__d8dc:     lda #$00           ; $d8dc: a9 00     
            sta $8c            ; $d8de: 85 8c     
            lda $24            ; $d8e0: a5 24     
            clc                ; $d8e2: 18        
            adc #$06           ; $d8e3: 69 06     
            sta $24            ; $d8e5: 85 24     
            jmp __e573         ; $d8e7: 4c 73 e5  

;-------------------------------------------------------------------------------
__d8ea:     lda $13            ; $d8ea: a5 13     
            and #$f0           ; $d8ec: 29 f0     
            cmp #$f0           ; $d8ee: c9 f0     
            bne __d8fc         ; $d8f0: d0 0a     
            lda $13            ; $d8f2: a5 13     
            and #$ef           ; $d8f4: 29 ef     
            sta $13            ; $d8f6: 85 13     
            inc $de            ; $d8f8: e6 de     
            dec $7a            ; $d8fa: c6 7a     
__d8fc:     rts                ; $d8fc: 60        

;-------------------------------------------------------------------------------
__d8fd:     ldy $56            ; $d8fd: a4 56     
            cpy #$04           ; $d8ff: c0 04     
            bcc __d905         ; $d901: 90 02     
            ldy #$04           ; $d903: a0 04     
__d905:     lda __d75e,y       ; $d905: b9 5e d7  
            sta $3d            ; $d908: 85 3d     
            lda #$01           ; $d90a: a9 01     
            sta $2c            ; $d90c: 85 2c     
__d90e:     rts                ; $d90e: 60        

;-------------------------------------------------------------------------------
__d90f:     lda $8d            ; $d90f: a5 8d     
            cmp $8a            ; $d911: c5 8a     
            bcs __d90e         ; $d913: b0 f9     
            jmp __f2ec         ; $d915: 4c ec f2  

;-------------------------------------------------------------------------------
__d918:     sed                ; $d918: f8        
            php                ; $d919: 08        
__d91a:     brk                ; $d91a: 00        
            .hex 05            ; $d91b: 05        Suspected data
__d91c:     txa                ; $d91c: 8a        
            pha                ; $d91d: 48        
            tya                ; $d91e: 98        
            pha                ; $d91f: 48        
            txa                ; $d920: 8a        
            asl                ; $d921: 0a        
            asl                ; $d922: 0a        
            tay                ; $d923: a8        
            lda $021c,y        ; $d924: b9 1c 02  
            sta $0b            ; $d927: 85 0b     
            lda $021f,y        ; $d929: b9 1f 02  
            sta $0a            ; $d92c: 85 0a     
            lda $62,x          ; $d92e: b5 62     
            sta $0c            ; $d930: 85 0c     
            txa                ; $d932: 8a        
            pha                ; $d933: 48        
            lda __d91a,x       ; $d934: bd 1a d9  
            tax                ; $d937: aa        
            lda $0364,x        ; $d938: bd 64 03  
            cmp #$63           ; $d93b: c9 63     
            bcs __d942         ; $d93d: b0 03     
            inc $0364,x        ; $d93f: fe 64 03  
__d942:     pla                ; $d942: 68        
            tax                ; $d943: aa        
            ldy #$00           ; $d944: a0 00     
__d946:     lda $02d0,y        ; $d946: b9 d0 02  
            cmp #$f8           ; $d949: c9 f8     
            beq __d957         ; $d94b: f0 0a     
            iny                ; $d94d: c8        
            iny                ; $d94e: c8        
            iny                ; $d94f: c8        
            iny                ; $d950: c8        
            cpy #$18           ; $d951: c0 18     
            bcc __d946         ; $d953: 90 f1     
            bcs __d9a8         ; $d955: b0 51     
__d957:     lda $d7,x          ; $d957: b5 d7     
            cmp #$06           ; $d959: c9 06     
            bcs __d967         ; $d95b: b0 0a     
            cmp #$03           ; $d95d: c9 03     
            bcc __d964         ; $d95f: 90 03     
            jsr __d9ad         ; $d961: 20 ad d9  
__d964:     lda #$03           ; $d964: a9 03     
            .hex 2c            ; $d966: 2c        Suspected data
__d967:     lda #$02           ; $d967: a9 02     
            sta $02d2,y        ; $d969: 99 d2 02  
            ldx $0c            ; $d96c: a6 0c     
            lda __d918,x       ; $d96e: bd 18 d9  
            clc                ; $d971: 18        
            adc $0a            ; $d972: 65 0a     
            sta $02d3,y        ; $d974: 99 d3 02  
            lda $0b            ; $d977: a5 0b     
            sec                ; $d979: 38        
            sbc #$08           ; $d97a: e9 08     
            sta $02d0,y        ; $d97c: 99 d0 02  
            lda #$0b           ; $d97f: a9 0b     
            ldx $063e          ; $d981: ae 3e 06  
            bne __d988         ; $d984: d0 02     
            lda #$0a           ; $d986: a9 0a     
__d988:     sta $02d1,y        ; $d988: 99 d1 02  
            tya                ; $d98b: 98        
            lsr                ; $d98c: 4a        
            lsr                ; $d98d: 4a        
            tay                ; $d98e: a8        
            lda #$00           ; $d98f: a9 00     
            sta $0650,y        ; $d991: 99 50 06  
            sta $0640,y        ; $d994: 99 40 06  
            sta $0660,y        ; $d997: 99 60 06  
            lda #$fe           ; $d99a: a9 fe     
            sta $0648,y        ; $d99c: 99 48 06  
            lda $0c            ; $d99f: a5 0c     
            bne __d9a5         ; $d9a1: d0 02     
            lda #$ff           ; $d9a3: a9 ff     
__d9a5:     sta $0658,y        ; $d9a5: 99 58 06  
__d9a8:     pla                ; $d9a8: 68        
            tay                ; $d9a9: a8        
            pla                ; $d9aa: 68        
            tax                ; $d9ab: aa        
            rts                ; $d9ac: 60        

;-------------------------------------------------------------------------------
__d9ad:     lda $063f          ; $d9ad: ad 3f 06  
            ora $0301          ; $d9b0: 0d 01 03  
            bne __d9c3         ; $d9b3: d0 0e     
            txa                ; $d9b5: 8a        
            pha                ; $d9b6: 48        
            ldx #$0f           ; $d9b7: a2 0f     
            jsr __f691         ; $d9b9: 20 91 f6  
            lda #$01           ; $d9bc: a9 01     
            sta $063f          ; $d9be: 8d 3f 06  
            pla                ; $d9c1: 68        
            tax                ; $d9c2: aa        
__d9c3:     rts                ; $d9c3: 60        

;-------------------------------------------------------------------------------
__d9c4:     brk                ; $d9c4: 00        
            rti                ; $d9c5: 40        

;-------------------------------------------------------------------------------
            cpy #$80           ; $d9c6: c0 80     
            rti                ; $d9c8: 40        

;-------------------------------------------------------------------------------
            brk                ; $d9c9: 00        
            .hex 80 c0         ; $d9ca: 80 c0     Invalid Opcode - NOP #$c0
__d9cc:     ldy #$14           ; $d9cc: a0 14     
__d9ce:     lda $02d0,y        ; $d9ce: b9 d0 02  
            cmp #$f8           ; $d9d1: c9 f8     
            beq __da44         ; $d9d3: f0 6f     
            tya                ; $d9d5: 98        
            lsr                ; $d9d6: 4a        
            lsr                ; $d9d7: 4a        
            tax                ; $d9d8: aa        
            lda $0650,x        ; $d9d9: bd 50 06  
            clc                ; $d9dc: 18        
            adc $0640,x        ; $d9dd: 7d 40 06  
            sta $0640,x        ; $d9e0: 9d 40 06  
            lda $02d0,y        ; $d9e3: b9 d0 02  
            adc $0648,x        ; $d9e6: 7d 48 06  
            sta $02d0,y        ; $d9e9: 99 d0 02  
            cmp #$f4           ; $d9ec: c9 f4     
            bcs __da3a         ; $d9ee: b0 4a     
            lda $0658,x        ; $d9f0: bd 58 06  
            sta $03            ; $d9f3: 85 03     
            adc $02d3,y        ; $d9f5: 79 d3 02  
            sta $02d3,y        ; $d9f8: 99 d3 02  
            inc $0660,x        ; $d9fb: fe 60 06  
            txa                ; $d9fe: 8a        
            pha                ; $d9ff: 48        
            lda $0660,x        ; $da00: bd 60 06  
            and #$30           ; $da03: 29 30     
            lsr                ; $da05: 4a        
            lsr                ; $da06: 4a        
            lsr                ; $da07: 4a        
            lsr                ; $da08: 4a        
            ldx $03            ; $da09: a6 03     
            dex                ; $da0b: ca        
            beq __da11         ; $da0c: f0 03     
            clc                ; $da0e: 18        
            adc #$04           ; $da0f: 69 04     
__da11:     tax                ; $da11: aa        
            lda $02d2,y        ; $da12: b9 d2 02  
            and #$03           ; $da15: 29 03     
            ora __d9c4,x       ; $da17: 1d c4 d9  
            sta $02d2,y        ; $da1a: 99 d2 02  
            pla                ; $da1d: 68        
            tax                ; $da1e: aa        
            lda $0648,x        ; $da1f: bd 48 06  
            cmp #$05           ; $da22: c9 05     
            bpl __da44         ; $da24: 10 1e     
            lda $0650,x        ; $da26: bd 50 06  
            clc                ; $da29: 18        
            adc #$40           ; $da2a: 69 40     
            sta $0650,x        ; $da2c: 9d 50 06  
            lda $0648,x        ; $da2f: bd 48 06  
            adc #$00           ; $da32: 69 00     
            sta $0648,x        ; $da34: 9d 48 06  
            jmp __da44         ; $da37: 4c 44 da  

;-------------------------------------------------------------------------------
__da3a:     lda #$f8           ; $da3a: a9 f8     
            sta $02d0,y        ; $da3c: 99 d0 02  
            lda #$00           ; $da3f: a9 00     
            sta $02d3,y        ; $da41: 99 d3 02  
__da44:     dey                ; $da44: 88        
            dey                ; $da45: 88        
            dey                ; $da46: 88        
            dey                ; $da47: 88        
            bpl __d9ce         ; $da48: 10 84     
            rts                ; $da4a: 60        

;-------------------------------------------------------------------------------
__da4b:     ldx #$01           ; $da4b: a2 01     
__da4d:     lda $66,x          ; $da4d: b5 66     
            clc                ; $da4f: 18        
            adc #$0c           ; $da50: 69 0c     
            jsr __d1f9         ; $da52: 20 f9 d1  
            tay                ; $da55: a8        
            cpy #$09           ; $da56: c0 09     
            beq __da93         ; $da58: f0 39     
            cpy $0786          ; $da5a: cc 86 07  
            beq __da64         ; $da5d: f0 05     
            cpy $0787          ; $da5f: cc 87 07  
            bne __da93         ; $da62: d0 2f     
__da64:     lda $062f,y        ; $da64: b9 2f 06  
            cmp #$01           ; $da67: c9 01     
            bne __da93         ; $da69: d0 28     
            lda $64,x          ; $da6b: b5 64     
            sec                ; $da6d: 38        
            sbc #$02           ; $da6e: e9 02     
            cmp __d7a3,y       ; $da70: d9 a3 d7  
            bcc __da87         ; $da73: 90 12     
            clc                ; $da75: 18        
            adc #$12           ; $da76: 69 12     
            cmp __d7ad,y       ; $da78: d9 ad d7  
            bcc __da93         ; $da7b: 90 16     
            lda __d7ad,y       ; $da7d: b9 ad d7  
            sec                ; $da80: 38        
            sbc #$10           ; $da81: e9 10     
            ldy #$00           ; $da83: a0 00     
            beq __da8f         ; $da85: f0 08     
__da87:     lda __d7a3,y       ; $da87: b9 a3 d7  
            sec                ; $da8a: 38        
            sbc #$fe           ; $da8b: e9 fe     
            ldy #$01           ; $da8d: a0 01     
__da8f:     sta $64,x          ; $da8f: 95 64     
            sty $62,x          ; $da91: 94 62     
__da93:     dex                ; $da93: ca        
            bpl __da4d         ; $da94: 10 b7     
            rts                ; $da96: 60        

;-------------------------------------------------------------------------------
__da97:     .hex fc 0c         ; $da97: fc 0c     Suspected data
__da99:     jsr __ddc9         ; $da99: 20 c9 dd  
            bcc __dad3         ; $da9c: 90 35     
            lda #$00           ; $da9e: a9 00     
            sta $80,x          ; $daa0: 95 80     
            lda #$04           ; $daa2: a9 04     
            sta $00            ; $daa4: 85 00     
            jsr __dab2         ; $daa6: 20 b2 da  
            bcc __dad4         ; $daa9: 90 29     
            ldy $62,x          ; $daab: b4 62     
            lda __da97,y       ; $daad: b9 97 da  
            sta $00            ; $dab0: 85 00     
__dab2:     jsr __dad5         ; $dab2: 20 d5 da  
            bcs __dabc         ; $dab5: b0 05     
__dab7:     lda #$04           ; $dab7: a9 04     
            sta $fc            ; $dab9: 85 fc     
            rts                ; $dabb: 60        

;-------------------------------------------------------------------------------
__dabc:     jsr __dbb4         ; $dabc: 20 b4 db  
            sty $5c,x          ; $dabf: 94 5c     
            lda $03            ; $dac1: a5 03     
            sta $7d,x          ; $dac3: 95 7d     
            jsr __daf2         ; $dac5: 20 f2 da  
            bcs __dab7         ; $dac8: b0 ed     
            jsr __d91c         ; $daca: 20 1c d9  
            lda $84,x          ; $dacd: b5 84     
            ora #$01           ; $dacf: 09 01     
            sta $84,x          ; $dad1: 95 84     
__dad3:     clc                ; $dad3: 18        
__dad4:     rts                ; $dad4: 60        

;-------------------------------------------------------------------------------
__dad5:     txa                ; $dad5: 8a        
            asl                ; $dad6: 0a        
            asl                ; $dad7: 0a        
            tay                ; $dad8: a8        
            lda $021f,y        ; $dad9: b9 1f 02  
            clc                ; $dadc: 18        
            adc $00            ; $dadd: 65 00     
            ldy $5a,x          ; $dadf: b4 5a     
            iny                ; $dae1: c8        
            cpy #$0a           ; $dae2: c0 0a     
            bcs __dad3         ; $dae4: b0 ed     
            cmp __d7a3,y       ; $dae6: d9 a3 d7  
            bcc __dad3         ; $dae9: 90 e8     
            cmp __d7ad,y       ; $daeb: d9 ad d7  
            bcs __dad3         ; $daee: b0 e3     
__daf0:     sec                ; $daf0: 38        
            rts                ; $daf1: 60        

;-------------------------------------------------------------------------------
__daf2:     lda #$00           ; $daf2: a9 00     
            sta $063e          ; $daf4: 8d 3e 06  
            lda ($03),y        ; $daf7: b1 03     
            beq __daf0         ; $daf9: f0 f5     
            cmp #$03           ; $dafb: c9 03     
            bpl __daf0         ; $dafd: 10 f1     
            cmp #$ff           ; $daff: c9 ff     
            beq __daf0         ; $db01: f0 ed     
            cmp #$02           ; $db03: c9 02     
            bne __db0e         ; $db05: d0 07     
            pha                ; $db07: 48        
            lda #$01           ; $db08: a9 01     
            sta $063e          ; $db0a: 8d 3e 06  
            pla                ; $db0d: 68        
__db0e:     clc                ; $db0e: 18        
            adc $02            ; $db0f: 65 02     
            sta ($03),y        ; $db11: 91 03     
            cmp #$03           ; $db13: c9 03     
            bmi __db1b         ; $db15: 30 04     
            lda #$ff           ; $db17: a9 ff     
            sta ($03),y        ; $db19: 91 03     
__db1b:     clc                ; $db1b: 18        
            rts                ; $db1c: 60        

;-------------------------------------------------------------------------------
__db1d:     sta $08            ; $db1d: 85 08     
            bne __db2c         ; $db1f: d0 0b     
            cpy #$08           ; $db21: c0 08     
            bcc __db2c         ; $db23: 90 07     
            lda $0091,y        ; $db25: b9 91 00  
            cmp #$02           ; $db28: c9 02     
            beq __db31         ; $db2a: f0 05     
__db2c:     lda $0091,y        ; $db2c: b9 91 00  
            bpl __dba4         ; $db2f: 10 73     
__db31:     lda $55            ; $db31: a5 55     
            beq __db65         ; $db33: f0 30     
            cmp #$02           ; $db35: c9 02     
            beq __db65         ; $db37: f0 2c     
            cpy #$08           ; $db39: c0 08     
            bcs __db65         ; $db3b: b0 28     
            ldx $b2,y          ; $db3d: b6 b2     
            lda $08            ; $db3f: a5 08     
            bne __db54         ; $db41: d0 11     
            lda $009c,y        ; $db43: b9 9c 00  
            bmi __db4b         ; $db46: 30 03     
            lda #$10           ; $db48: a9 10     
            .hex 2c            ; $db4a: 2c        Suspected data
__db4b:     lda #$f8           ; $db4b: a9 f8     
            clc                ; $db4d: 18        
            adc $009c,y        ; $db4e: 79 9c 00  
            jmp __db57         ; $db51: 4c 57 db  

;-------------------------------------------------------------------------------
__db54:     lda $009c,y        ; $db54: b9 9c 00  
__db57:     clc                ; $db57: 18        
            adc __d7bd,y       ; $db58: 79 bd d7  
            cmp __d7a3,x       ; $db5b: dd a3 d7  
            bcc __dba4         ; $db5e: 90 44     
            cmp __d7ad,x       ; $db60: dd ad d7  
            bcs __dba4         ; $db63: b0 3f     
__db65:     lda $009c,y        ; $db65: b9 9c 00  
            clc                ; $db68: 18        
            adc __d7bd,y       ; $db69: 79 bd d7  
            sec                ; $db6c: 38        
            sbc $0a            ; $db6d: e5 0a     
            sta $00            ; $db6f: 85 00     
            jsr __d2f9         ; $db71: 20 f9 d2  
            pha                ; $db74: 48        
            lda $08            ; $db75: a5 08     
            beq __db81         ; $db77: f0 08     
            pla                ; $db79: 68        
            cmp __d7d3,y       ; $db7a: d9 d3 d7  
            bcs __dba4         ; $db7d: b0 25     
            bcc __db86         ; $db7f: 90 05     
__db81:     pla                ; $db81: 68        
            cmp #$0c           ; $db82: c9 0c     
            bcs __dba4         ; $db84: b0 1e     
__db86:     lda $00a7,y        ; $db86: b9 a7 00  
            clc                ; $db89: 18        
            adc __d7b7,y       ; $db8a: 79 b7 d7  
            sec                ; $db8d: 38        
            sbc $0b            ; $db8e: e5 0b     
            jsr __d2f9         ; $db90: 20 f9 d2  
            pha                ; $db93: 48        
            cpy #$00           ; $db94: c0 00     
            bne __db9c         ; $db96: d0 04     
            lda $08            ; $db98: a5 08     
            beq __dba6         ; $db9a: f0 0a     
__db9c:     pla                ; $db9c: 68        
            cmp __d7c8,y       ; $db9d: d9 c8 d7  
            bcs __dba4         ; $dba0: b0 02     
__dba2:     sec                ; $dba2: 38        
            rts                ; $dba3: 60        

;-------------------------------------------------------------------------------
__dba4:     clc                ; $dba4: 18        
            rts                ; $dba5: 60        

;-------------------------------------------------------------------------------
__dba6:     pla                ; $dba6: 68        
            cmp #$10           ; $dba7: c9 10     
            bcs __dba4         ; $dba9: b0 f9     
            bcc __dba2         ; $dbab: 90 f5     
__dbad:     lda #$ff           ; $dbad: a9 ff     
            rts                ; $dbaf: 60        

;-------------------------------------------------------------------------------
__dbb0:     ldy #$05           ; $dbb0: a0 05     
            bne __dbb6         ; $dbb2: d0 02     
__dbb4:     ldy #$04           ; $dbb4: a0 04     
__dbb6:     sty $04            ; $dbb6: 84 04     
            sta $00            ; $dbb8: 85 00     
            lda #$ff           ; $dbba: a9 ff     
            sta $0783,x        ; $dbbc: 9d 83 07  
            lda #$00           ; $dbbf: a9 00     
            sta $0343,x        ; $dbc1: 9d 43 03  
            ldy $5a,x          ; $dbc4: b4 5a     
            lda $82,x          ; $dbc6: b5 82     
            beq __dbcb         ; $dbc8: f0 01     
            iny                ; $dbca: c8        
__dbcb:     sty $d7,x          ; $dbcb: 94 d7     
            cpy #$0a           ; $dbcd: c0 0a     
            bcs __dbad         ; $dbcf: b0 dc     
            lda $00            ; $dbd1: a5 00     
            cmp __d7a3,y       ; $dbd3: d9 a3 d7  
            bcc __dc56         ; $dbd6: 90 7e     
            cmp __d7ad,y       ; $dbd8: d9 ad d7  
            bcs __dc56         ; $dbdb: b0 79     
            lda #$02           ; $dbdd: a9 02     
            sta $02            ; $dbdf: 85 02     
            lda $00            ; $dbe1: a5 00     
            jsr __edbf         ; $dbe3: 20 bf ed  
            sta $d4,x          ; $dbe6: 95 d4     
            ldy $d7,x          ; $dbe8: b4 d7     
            lda __d762,y       ; $dbea: b9 62 d7  
            sta $03            ; $dbed: 85 03     
            lda $d4,x          ; $dbef: b5 d4     
            sec                ; $dbf1: 38        
            sbc #$04           ; $dbf2: e9 04     
            pha                ; $dbf4: 48        
            tay                ; $dbf5: a8        
            lda ($03),y        ; $dbf6: b1 03     
            bpl __dbfd         ; $dbf8: 10 03     
            inc $0343,x        ; $dbfa: fe 43 03  
__dbfd:     lda $d7,x          ; $dbfd: b5 d7     
            ldy #$00           ; $dbff: a0 00     
            cmp $0786          ; $dc01: cd 86 07  
            beq __dc0c         ; $dc04: f0 06     
            iny                ; $dc06: c8        
            cmp $0787          ; $dc07: cd 87 07  
            bne __dc4d         ; $dc0a: d0 41     
__dc0c:     sty $00            ; $dc0c: 84 00     
            lda $6a,x          ; $dc0e: b5 6a     
            cmp #$04           ; $dc10: c9 04     
            beq __dc18         ; $dc12: f0 04     
            cmp #$02           ; $dc14: c9 02     
            bne __dc34         ; $dc16: d0 1c     
__dc18:     lda $68,x          ; $dc18: b5 68     
            beq __dc34         ; $dc1a: f0 18     
            lda $07d7,y        ; $dc1c: b9 d7 07  
            beq __dc2b         ; $dc1f: f0 0a     
            lda $68,x          ; $dc21: b5 68     
            cmp #$01           ; $dc23: c9 01     
            bne __dc34         ; $dc25: d0 0d     
            lda #$14           ; $dc27: a9 14     
            bne __dc36         ; $dc29: d0 0b     
__dc2b:     lda $68,x          ; $dc2b: b5 68     
            cmp #$02           ; $dc2d: c9 02     
            bne __dc34         ; $dc2f: d0 03     
            lda #$04           ; $dc31: a9 04     
            .hex 2c            ; $dc33: 2c        Suspected data
__dc34:     lda #$09           ; $dc34: a9 09     
__dc36:     clc                ; $dc36: 18        
            adc $64,x          ; $dc37: 75 64     
            cmp $0788,y        ; $dc39: d9 88 07  
            bcc __dc43         ; $dc3c: 90 05     
            cmp $078a,y        ; $dc3e: d9 8a 07  
            bcc __dc59         ; $dc41: 90 16     
__dc43:     cmp $078c,y        ; $dc43: d9 8c 07  
            bcc __dc4d         ; $dc46: 90 05     
            cmp $078e,y        ; $dc48: d9 8e 07  
            bcc __dc59         ; $dc4b: 90 0c     
__dc4d:     lda $2d,x          ; $dc4d: b5 2d     
            bne __dc5e         ; $dc4f: d0 0d     
            pla                ; $dc51: 68        
            tay                ; $dc52: a8        
__dc53:     lda ($03),y        ; $dc53: b1 03     
            rts                ; $dc55: 60        

;-------------------------------------------------------------------------------
__dc56:     lda #$00           ; $dc56: a9 00     
__dc58:     rts                ; $dc58: 60        

;-------------------------------------------------------------------------------
__dc59:     lda $00            ; $dc59: a5 00     
            sta $0783,x        ; $dc5b: 9d 83 07  
__dc5e:     pla                ; $dc5e: 68        
            tay                ; $dc5f: a8        
            lda ($03),y        ; $dc60: b1 03     
            bmi __dc56         ; $dc62: 30 f2     
            cmp #$04           ; $dc64: c9 04     
            beq __dc56         ; $dc66: f0 ee     
            bne __dc53         ; $dc68: d0 e9     
__dc6a:     lda $0301          ; $dc6a: ad 01 03  
            bne __dc58         ; $dc6d: d0 e9     
            sta $0300          ; $dc6f: 8d 00 03  
            lda $84            ; $dc72: a5 84     
            beq __dc80         ; $dc74: f0 0a     
            ldx #$00           ; $dc76: a2 00     
            ldy #$00           ; $dc78: a0 00     
            jsr __dc97         ; $dc7a: 20 97 dc  
            jsr __dda9         ; $dc7d: 20 a9 dd  
__dc80:     lda $85            ; $dc80: a5 85     
            beq __dc58         ; $dc82: f0 d4     
            ldx #$01           ; $dc84: a2 01     
            ldy $0300          ; $dc86: ac 00 03  
            jsr __dc97         ; $dc89: 20 97 dc  
            jmp __dda9         ; $dc8c: 4c a9 dd  

;-------------------------------------------------------------------------------
            jmp ($75d7)        ; $dc8f: 6c d7 75  

;-------------------------------------------------------------------------------
            .hex d7 8a         ; $dc92: d7 8a     Invalid Opcode - DCP $8a,x
            .hex d7 93         ; $dc94: d7 93     Invalid Opcode - DCP $93,x
            .hex d7            ; $dc96: d7        Suspected data
__dc97:     lda $84,x          ; $dc97: b5 84     
            and #$01           ; $dc99: 29 01     
            bne __dca4         ; $dc9b: d0 07     
            lda $84,x          ; $dc9d: b5 84     
            and #$02           ; $dc9f: 29 02     
            bne __dcad         ; $dca1: d0 0a     
            rts                ; $dca3: 60        

;-------------------------------------------------------------------------------
__dca4:     jsr __ddb6         ; $dca4: 20 b6 dd  
            jsr __dcf0         ; $dca7: 20 f0 dc  
            jmp __dcb3         ; $dcaa: 4c b3 dc  

;-------------------------------------------------------------------------------
__dcad:     jsr __ddb6         ; $dcad: 20 b6 dd  
            jsr __dcf6         ; $dcb0: 20 f6 dc  
__dcb3:     lda $d7,x          ; $dcb3: b5 d7     
            pha                ; $dcb5: 48        
            tay                ; $dcb6: a8        
            lda ($05),y        ; $dcb7: b1 05     
            jsr __dcea         ; $dcb9: 20 ea dc  
            iny                ; $dcbc: c8        
            sty $00            ; $dcbd: 84 00     
            pla                ; $dcbf: 68        
            tay                ; $dcc0: a8        
            lda $d4,x          ; $dcc1: b5 d4     
            clc                ; $dcc3: 18        
            adc ($07),y        ; $dcc4: 71 07     
            jsr __dcea         ; $dcc6: 20 ea dc  
            iny                ; $dcc9: c8        
            lda #$01           ; $dcca: a9 01     
            sta $0301,y        ; $dccc: 99 01 03  
            iny                ; $dccf: c8        
            sty $00            ; $dcd0: 84 00     
            lda $7d,x          ; $dcd2: b5 7d     
            sta $03            ; $dcd4: 85 03     
            ldy $5c,x          ; $dcd6: b4 5c     
            jsr __de12         ; $dcd8: 20 12 de  
            jsr __dcea         ; $dcdb: 20 ea dc  
            lda #$00           ; $dcde: a9 00     
            sta $0302,y        ; $dce0: 99 02 03  
            iny                ; $dce3: c8        
            sty $0300          ; $dce4: 8c 00 03  
            ldx $0f            ; $dce7: a6 0f     
            rts                ; $dce9: 60        

;-------------------------------------------------------------------------------
__dcea:     ldy $00            ; $dcea: a4 00     
            sta $0301,y        ; $dcec: 99 01 03  
            rts                ; $dcef: 60        

;-------------------------------------------------------------------------------
__dcf0:     lda #$04           ; $dcf0: a9 04     
            ldy #$03           ; $dcf2: a0 03     
            bne __dcfa         ; $dcf4: d0 04     
__dcf6:     lda #$05           ; $dcf6: a9 05     
            ldy #$07           ; $dcf8: a0 07     
__dcfa:     sta $04            ; $dcfa: 85 04     
            ldx #$03           ; $dcfc: a2 03     
__dcfe:     .hex b9            ; $dcfe: b9        Suspected data
__dcff:     .hex 8f dc 95      ; $dcff: 8f dc 95  Invalid Opcode - SAX $95dc
            ora $88            ; $dd02: 05 88     
            dex                ; $dd04: ca        
            bpl __dcfe         ; $dd05: 10 f7     
            ldy $00            ; $dd07: a4 00     
            ldx $0f            ; $dd09: a6 0f     
__dd0b:     rts                ; $dd0b: 60        

;-------------------------------------------------------------------------------
__dd0c:     clc                ; $dd0c: 18        
            clc                ; $dd0d: 18        
            clc                ; $dd0e: 18        
            asl $16,x          ; $dd0f: 16 16     
            asl $14,x          ; $dd11: 16 14     
            .hex 14 14         ; $dd13: 14 14     Invalid Opcode - NOP $14,x
            .hex 14            ; $dd15: 14        Suspected data
__dd16:     jsr __dcf6         ; $dd16: 20 f6 dc  
            ldx #$01           ; $dd19: a2 01     
            bne __dd22         ; $dd1b: d0 05     
__dd1d:     jsr __dcf0         ; $dd1d: 20 f0 dc  
            ldx #$00           ; $dd20: a2 00     
__dd22:     stx $0b            ; $dd22: 86 0b     
__dd24:     lda $da,x          ; $dd24: b5 da     
            cmp #$0a           ; $dd26: c9 0a     
            beq __dd0b         ; $dd28: f0 e1     
            tay                ; $dd2a: a8        
            tax                ; $dd2b: aa        
            jsr __dda1         ; $dd2c: 20 a1 dd  
            clc                ; $dd2f: 18        
            adc __d762,x       ; $dd30: 7d 62 d7  
            sta $03            ; $dd33: 85 03     
            jsr __dda1         ; $dd35: 20 a1 dd  
            clc                ; $dd38: 18        
            adc #$04           ; $dd39: 69 04     
            clc                ; $dd3b: 18        
            adc ($07),y        ; $dd3c: 71 07     
            sta $0302          ; $dd3e: 8d 02 03  
            lda __dd0c,x       ; $dd41: bd 0c dd  
            sta $0303          ; $dd44: 8d 03 03  
            lda ($05),y        ; $dd47: b1 05     
            sta $0301          ; $dd49: 8d 01 03  
            ldy #$00           ; $dd4c: a0 00     
            sty $02            ; $dd4e: 84 02     
__dd50:     jsr __de12         ; $dd50: 20 12 de  
            ldy $02            ; $dd53: a4 02     
            sta $0304,y        ; $dd55: 99 04 03  
            iny                ; $dd58: c8        
            sty $02            ; $dd59: 84 02     
            tya                ; $dd5b: 98        
            cmp __dd0c,x       ; $dd5c: dd 0c dd  
            bcc __dd50         ; $dd5f: 90 ef     
            lda #$00           ; $dd61: a9 00     
            sta $0304,y        ; $dd63: 99 04 03  
            ldx $0b            ; $dd66: a6 0b     
            bne __dd97         ; $dd68: d0 2d     
            ldy $da,x          ; $dd6a: b4 da     
            lda $062f,y        ; $dd6c: b9 2f 06  
            bpl __dd97         ; $dd6f: 10 26     
            sta $00            ; $dd71: 85 00     
            ldy #$03           ; $dd73: a0 03     
__dd75:     lda $00            ; $dd75: a5 00     
            ldx $0301,y        ; $dd77: be 01 03  
            beq __dd97         ; $dd7a: f0 1b     
            cpx #$38           ; $dd7c: e0 38     
            beq __dd94         ; $dd7e: f0 14     
            cpx #$eb           ; $dd80: e0 eb     
            bne __dd91         ; $dd82: d0 0d     
            cmp #$90           ; $dd84: c9 90     
            bcc __dd91         ; $dd86: 90 09     
            cmp #$d3           ; $dd88: c9 d3     
            beq __dd8f         ; $dd8a: f0 03     
            lda #$8f           ; $dd8c: a9 8f     
            .hex 2c            ; $dd8e: 2c        Suspected data
__dd8f:     lda #$8c           ; $dd8f: a9 8c     
__dd91:     sta $0301,y        ; $dd91: 99 01 03  
__dd94:     iny                ; $dd94: c8        
            bne __dd75         ; $dd95: d0 de     
__dd97:     jsr __c14e         ; $dd97: 20 4e c1  
            ldx $0b            ; $dd9a: a6 0b     
            inc $da,x          ; $dd9c: f6 da     
            jmp __dd24         ; $dd9e: 4c 24 dd  

;-------------------------------------------------------------------------------
__dda1:     lda #$18           ; $dda1: a9 18     
            sec                ; $dda3: 38        
            sbc __dd0c,x       ; $dda4: fd 0c dd  
            lsr                ; $dda7: 4a        
            rts                ; $dda8: 60        

;-------------------------------------------------------------------------------
__dda9:     lda #$02           ; $dda9: a9 02     
            sta $fc            ; $ddab: 85 fc     
            lda $0e            ; $ddad: a5 0e     
            eor #$ff           ; $ddaf: 49 ff     
            and $84,x          ; $ddb1: 35 84     
            sta $84,x          ; $ddb3: 95 84     
            rts                ; $ddb5: 60        

;-------------------------------------------------------------------------------
__ddb6:     sta $0e            ; $ddb6: 85 0e     
            stx $0f            ; $ddb8: 86 0f     
            sty $00            ; $ddba: 84 00     
            rts                ; $ddbc: 60        

;-------------------------------------------------------------------------------
__ddbd:     ldy #$06           ; $ddbd: a0 06     
__ddbf:     dey                ; $ddbf: 88        
            cmp __d77f,y       ; $ddc0: d9 7f d7  
            bne __ddbf         ; $ddc3: d0 fa     
            lda __d785,y       ; $ddc5: b9 85 d7  
            rts                ; $ddc8: 60        

;-------------------------------------------------------------------------------
__ddc9:     lda $80,x          ; $ddc9: b5 80     
            beq __de10         ; $ddcb: f0 43     
            lda #$00           ; $ddcd: a9 00     
            sta $80,x          ; $ddcf: 95 80     
            lda #$04           ; $ddd1: a9 04     
            sta $00            ; $ddd3: 85 00     
            jsr __dde1         ; $ddd5: 20 e1 dd  
            bcc __de11         ; $ddd8: 90 37     
            ldy $62,x          ; $ddda: b4 62     
            lda __da97,y       ; $dddc: b9 97 da  
            sta $00            ; $dddf: 85 00     
__dde1:     jsr __dad5         ; $dde1: 20 d5 da  
            bcs __ddec         ; $dde4: b0 06     
            lda #$04           ; $dde6: a9 04     
            sta $fc            ; $dde8: 85 fc     
            clc                ; $ddea: 18        
            rts                ; $ddeb: 60        

;-------------------------------------------------------------------------------
__ddec:     jsr __dbb0         ; $ddec: 20 b0 db  
            lda $90            ; $ddef: a5 90     
            sec                ; $ddf1: 38        
            sbc $d7,x          ; $ddf2: f5 d7     
            cmp #$03           ; $ddf4: c9 03     
            bcs __de10         ; $ddf6: b0 18     
            sty $5c,x          ; $ddf8: 94 5c     
            lda $03            ; $ddfa: a5 03     
            sta $7d,x          ; $ddfc: 95 7d     
            jsr __daf2         ; $ddfe: 20 f2 da  
            bcc __de07         ; $de01: 90 04     
            lda $82,x          ; $de03: b5 82     
            bne __de11         ; $de05: d0 0a     
__de07:     jsr __d91c         ; $de07: 20 1c d9  
            lda $84,x          ; $de0a: b5 84     
            ora #$02           ; $de0c: 09 02     
            sta $84,x          ; $de0e: 95 84     
__de10:     clc                ; $de10: 18        
__de11:     rts                ; $de11: 60        

;-------------------------------------------------------------------------------
__de12:     lda $04            ; $de12: a5 04     
            cmp #$05           ; $de14: c9 05     
            beq __de1d         ; $de16: f0 05     
            lda ($03),y        ; $de18: b1 03     
            jmp __ddbd         ; $de1a: 4c bd dd  

;-------------------------------------------------------------------------------
__de1d:     lda ($03),y        ; $de1d: b1 03     
            jmp __deea         ; $de1f: 4c ea de  

;-------------------------------------------------------------------------------
__de22:     lda $0301          ; $de22: ad 01 03  
            bne __de11         ; $de25: d0 ea     
            sta $0300          ; $de27: 8d 00 03  
            lda #$05           ; $de2a: a9 05     
            sta $0f            ; $de2c: 85 0f     
__de2e:     tax                ; $de2e: aa        
            lda $91,x          ; $de2f: b5 91     
            bpl __de9c         ; $de31: 10 69     
            lda $b2,x          ; $de33: b5 b2     
            beq __de9c         ; $de35: f0 65     
            sta $d9            ; $de37: 85 d9     
            lda $9c,x          ; $de39: b5 9c     
            clc                ; $de3b: 18        
            adc #$08           ; $de3c: 69 08     
            sta $0e            ; $de3e: 85 0e     
            lda #$00           ; $de40: a9 00     
            sta $0d            ; $de42: 85 0d     
__de44:     jsr __deb2         ; $de44: 20 b2 de  
            bpl __dea5         ; $de47: 10 5c     
            lda #$01           ; $de49: a9 01     
            sta ($03),y        ; $de4b: 91 03     
            ldx #$02           ; $de4d: a2 02     
            sty $5c,x          ; $de4f: 94 5c     
            lda $03            ; $de51: a5 03     
            sta $7d,x          ; $de53: 95 7d     
            lda $0e            ; $de55: a5 0e     
            jsr __edbf         ; $de57: 20 bf ed  
            sta $d6            ; $de5a: 85 d6     
            jsr __dcf0         ; $de5c: 20 f0 dc  
            ldy $0300          ; $de5f: ac 00 03  
            sty $00            ; $de62: 84 00     
            ldx #$02           ; $de64: a2 02     
            jsr __dcb3         ; $de66: 20 b3 dc  
            ldy $d9            ; $de69: a4 d9     
            lda $062f,y        ; $de6b: b9 2f 06  
            bpl __de83         ; $de6e: 10 13     
            cmp #$90           ; $de70: c9 90     
            bcs __de7d         ; $de72: b0 09     
            cmp #$8c           ; $de74: c9 8c     
            beq __de7b         ; $de76: f0 03     
__de78:     lda #$cd           ; $de78: a9 cd     
            .hex 2c            ; $de7a: 2c        Suspected data
__de7b:     lda #$d3           ; $de7b: a9 d3     
__de7d:     ldy $0300          ; $de7d: ac 00 03  
            sta $0300,y        ; $de80: 99 00 03  
__de83:     lda $0d            ; $de83: a5 0d     
            bne __dea9         ; $de85: d0 22     
            ldx $0f            ; $de87: a6 0f     
            lda $bd,x          ; $de89: b5 bd     
            bmi __de90         ; $de8b: 30 03     
            lda #$08           ; $de8d: a9 08     
            .hex 2c            ; $de8f: 2c        Suspected data
__de90:     lda #$f8           ; $de90: a9 f8     
            sta $0d            ; $de92: 85 0d     
            clc                ; $de94: 18        
            adc $0e            ; $de95: 65 0e     
            sta $0e            ; $de97: 85 0e     
            jmp __de44         ; $de99: 4c 44 de  

;-------------------------------------------------------------------------------
__de9c:     inc $0f            ; $de9c: e6 0f     
            lda $0f            ; $de9e: a5 0f     
            cmp #$08           ; $dea0: c9 08     
            bcc __de2e         ; $dea2: 90 8a     
            rts                ; $dea4: 60        

;-------------------------------------------------------------------------------
__dea5:     lda $0d            ; $dea5: a5 0d     
            beq __de9c         ; $dea7: f0 f3     
__dea9:     lda #$02           ; $dea9: a9 02     
            sta $fc            ; $deab: 85 fc     
            ldx $0f            ; $dead: a6 0f     
            jmp __d888         ; $deaf: 4c 88 d8  

;-------------------------------------------------------------------------------
__deb2:     ldx $0f            ; $deb2: a6 0f     
            lda $b2,x          ; $deb4: b5 b2     
            and #$0f           ; $deb6: 29 0f     
            .hex 2c            ; $deb8: 2c        Suspected data
__deb9:     lda $0f            ; $deb9: a5 0f     
            pha                ; $debb: 48        
            lda $0e            ; $debc: a5 0e     
            cmp #$20           ; $debe: c9 20     
            bcc __dee4         ; $dec0: 90 22     
            cmp #$e0           ; $dec2: c9 e0     
            bcs __dee4         ; $dec4: b0 1e     
__dec6:     jsr __edbf         ; $dec6: 20 bf ed  
            sec                ; $dec9: 38        
            sbc #$04           ; $deca: e9 04     
            sta $02            ; $decc: 85 02     
            pla                ; $dece: 68        
            tay                ; $decf: a8        
            lda __d762,y       ; $ded0: b9 62 d7  
            sta $03            ; $ded3: 85 03     
            lda #$05           ; $ded5: a9 05     
            sta $04            ; $ded7: 85 04     
            .hex a4            ; $ded9: a4        Suspected data
__deda:     .hex 02            ; $deda: 02        Invalid Opcode - KIL 
            lda ($03),y        ; $dedb: b1 03     
            sta $02            ; $dedd: 85 02     
            dec $04            ; $dedf: c6 04     
            lda ($03),y        ; $dee1: b1 03     
            rts                ; $dee3: 60        

;-------------------------------------------------------------------------------
__dee4:     pla                ; $dee4: 68        
            lda #$01           ; $dee5: a9 01     
            sta $02            ; $dee7: 85 02     
            rts                ; $dee9: 60        

;-------------------------------------------------------------------------------
__deea:     ldy #$06           ; $deea: a0 06     
__deec:     dey                ; $deec: 88        
            cmp __d77f,y       ; $deed: d9 7f d7  
            bne __deec         ; $def0: d0 fa     
            lda __d79d,y       ; $def2: b9 9d d7  
            rts                ; $def5: 60        

;-------------------------------------------------------------------------------
__def6:     bvc __de78         ; $def6: 50 80     
            bcs __deda         ; $def8: b0 e0     
__defa:     brk                ; $defa: 00        
__defb:     brk                ; $defb: 00        
            brk                ; $defc: 00        
            .hex 02            ; $defd: 02        Invalid Opcode - KIL 
            .hex 04 07         ; $defe: 04 07     Invalid Opcode - NOP $07
            php                ; $df00: 08        
            .hex 0c 0e 12      ; $df01: 0c 0e 12  Invalid Opcode - NOP $120e
            .hex 12            ; $df04: 12        Invalid Opcode - KIL 
            ora $17,x          ; $df05: 15 17     
            .hex 17            ; $df07: 17        Suspected data
__df08:     clc                ; $df08: 18        
            .hex 23 23         ; $df09: 23 23     Invalid Opcode - RLA ($23,x)
            rol $2d            ; $df0b: 26 2d     
            bmi __df48         ; $df0d: 30 39     
            .hex 44 4e         ; $df0f: 44 4e     Invalid Opcode - NOP $4e
            .hex 53 5a         ; $df11: 53 5a     Invalid Opcode - SRE ($5a),y
            rts                ; $df13: 60        

;-------------------------------------------------------------------------------
            ror                ; $df14: 6a        
            ror $736f          ; $df15: 6e 6f 73  
            sei                ; $df18: 78        
            sta ($89,x)        ; $df19: 81 89     
__df1b:     .hex 89 85         ; $df1b: 89 85     Invalid Opcode - NOP #$85
            .hex b2            ; $df1d: b2        Invalid Opcode - KIL 
            sta ($ab),y        ; $df1e: 91 ab     
            .hex 27 67         ; $df20: 27 67     Invalid Opcode - RLA $67
            jmp ($2793)        ; $df22: 6c 93 27  

;-------------------------------------------------------------------------------
            adc $81            ; $df25: 65 81     
            sta __f2cb         ; $df27: 8d cb f2  
            .hex 22            ; $df2a: 22        Invalid Opcode - KIL 
            ldx #$ae           ; $df2b: a2 ae     
            iny                ; $df2d: c8        
            .hex 27 c7         ; $df2e: 27 c7     Invalid Opcode - RLA $c7
            bne __def6         ; $df30: d0 c4     
__df32:     .hex d2            ; $df32: d2        Invalid Opcode - KIL 
            sta ($4a,x)        ; $df33: 81 4a     
            sty $8c            ; $df35: 84 8c     
            sty $a8,x          ; $df37: 94 a8     
            .hex c2 44         ; $df39: c2 44     Invalid Opcode - NOP #$44
            lsr                ; $df3b: 4a        
            bvc __df08         ; $df3c: 50 ca     
            cmp ($48),y        ; $df3e: d1 48     
            bvs __dec6         ; $df40: 70 84     
            rol $2e            ; $df42: 26 2e     
            .hex 64 70         ; $df44: 64 70     Invalid Opcode - NOP $70
            .hex c7 cd         ; $df46: c7 cd     Invalid Opcode - DCP $cd
__df48:     .hex d3 a2         ; $df48: d3 a2     Invalid Opcode - DCP ($a2),y
            .hex ab b1         ; $df4a: ab b1     Invalid Opcode - LAX #$b1
            bit $8b85          ; $df4c: 2c 85 8b  
            sta ($96),y        ; $df4f: 91 96     
            .hex a7 ae         ; $df51: a7 ae     Invalid Opcode - LAX $ae
            .hex cf d4 27      ; $df53: cf d4 27  Invalid Opcode - DCP $27d4
            .hex 44 50         ; $df56: 44 50     Invalid Opcode - NOP $50
            .hex 63 6d         ; $df58: 63 6d     Invalid Opcode - RRA ($6d,x)
__df5a:     stx $90            ; $df5a: 86 90     
            .hex a3 a9         ; $df5c: a3 a9     Invalid Opcode - LAX ($a9,x)
            .hex af e3 e5      ; $df5e: af e3 e5  Invalid Opcode - LAX __e5e3
            sbc $48f4          ; $df61: ed f4 48  
            .hex 4f a3 ab      ; $df64: 4f a3 ab  Invalid Opcode - SRE $aba3
            .hex b3 c3         ; $df67: b3 c3     Invalid Opcode - LAX ($c3),y
            .hex cb 6d         ; $df69: cb 6d     Invalid Opcode - AXS #$6d
            .hex 92            ; $df6b: 92        Invalid Opcode - KIL 
            lda $af            ; $df6c: a5 af     
            .hex eb 64         ; $df6e: eb 64     Invalid Opcode - SBC #$64
            dey                ; $df70: 88        
            stx $ac94          ; $df71: 8e 94 ac  
__df74:     cpx $a7f2          ; $df74: ec f2 a7  
            ldx __c7c4         ; $df77: ae c4 c7  
            .hex d3 ce         ; $df7a: d3 ce     Invalid Opcode - DCP ($ce),y
            .hex 23 64         ; $df7c: 23 64     Invalid Opcode - RLA ($64,x)
            stx __d0a9         ; $df7e: 8e a9 d0  
            cpx $e9            ; $df81: e4 e9     
            iny                ; $df83: c8        
            bne __df5a         ; $df84: d0 d4     
            .hex 8b c9         ; $df86: 8b c9     Invalid Opcode - XAA #$c9
            .hex d4 cf         ; $df88: d4 cf     Invalid Opcode - NOP $cf,x
            .hex cb 88         ; $df8a: cb 88     Invalid Opcode - AXS #$88
            bcc __df32         ; $df8c: 90 a4     
            .hex d4 c7         ; $df8e: d4 c7     Invalid Opcode - NOP $c7,x
            bne __df74         ; $df90: d0 e2     
            sbc #$f1           ; $df92: e9 f1     
            .hex 2b 50         ; $df94: 2b 50     Invalid Opcode - ANC #$50
            .hex 67 70         ; $df96: 67 70     Invalid Opcode - RRA $70
            .hex 82 8b         ; $df98: 82 8b     Invalid Opcode - NOP #$8b
            .hex c2 c9         ; $df9a: c2 c9     Invalid Opcode - NOP #$c9
            cmp ($48),y        ; $df9c: d1 48     
            eor ($87),y        ; $df9e: 51 87     
            sta $b0,x          ; $dfa0: 95 b0     
            cpx $ed            ; $dfa2: e4 ed     
            .hex f5            ; $dfa4: f5        Suspected data
__dfa5:     lda $59            ; $dfa5: a5 59     
            and #$1f           ; $dfa7: 29 1f     
            tay                ; $dfa9: a8        
            rts                ; $dfaa: 60        

;-------------------------------------------------------------------------------
__dfab:     jsr __dfea         ; $dfab: 20 ea df  
            beq __dfe9         ; $dfae: f0 39     
            tax                ; $dfb0: aa        
__dfb1:     lda #$04           ; $dfb1: a9 04     
            sta $04            ; $dfb3: 85 04     
            sta $06            ; $dfb5: 85 06     
            jsr __dff8         ; $dfb7: 20 f8 df  
            lda __df1b,x       ; $dfba: bd 1b df  
            and #$1f           ; $dfbd: 29 1f     
            clc                ; $dfbf: 18        
            adc __d762,y       ; $dfc0: 79 62 d7  
            sec                ; $dfc3: 38        
            sbc #$01           ; $dfc4: e9 01     
            sta $03            ; $dfc6: 85 03     
            clc                ; $dfc8: 18        
            adc #$18           ; $dfc9: 69 18     
            sta $05            ; $dfcb: 85 05     
            ldy #$02           ; $dfcd: a0 02     
__dfcf:     lda #$03           ; $dfcf: a9 03     
            sta ($03),y        ; $dfd1: 91 03     
            cpy #$01           ; $dfd3: c0 01     
            bne __dfe1         ; $dfd5: d0 0a     
            lda #$04           ; $dfd7: a9 04     
            sta ($05),y        ; $dfd9: 91 05     
            inc $06            ; $dfdb: e6 06     
            sta ($05),y        ; $dfdd: 91 05     
            dec $06            ; $dfdf: c6 06     
__dfe1:     dey                ; $dfe1: 88        
            bpl __dfcf         ; $dfe2: 10 eb     
            dex                ; $dfe4: ca        
            cpx $0a            ; $dfe5: e4 0a     
            bne __dfb1         ; $dfe7: d0 c8     
__dfe9:     rts                ; $dfe9: 60        

;-------------------------------------------------------------------------------
__dfea:     jsr __dfa5         ; $dfea: 20 a5 df  
            lda __defa,y       ; $dfed: b9 fa de  
            sta $0a            ; $dff0: 85 0a     
            lda __defb,y       ; $dff2: b9 fb de  
            cmp $0a            ; $dff5: c5 0a     
            rts                ; $dff7: 60        

;-------------------------------------------------------------------------------
__dff8:     lda __df1b,x       ; $dff8: bd 1b df  
            lsr                ; $dffb: 4a        
            lsr                ; $dffc: 4a        
            lsr                ; $dffd: 4a        
            lsr                ; $dffe: 4a        
            lsr                ; $dfff: 4a        
            tay                ; $e000: a8        
            rts                ; $e001: 60        

;-------------------------------------------------------------------------------
__e002:     ldx #$0b           ; $e002: a2 0b     
__e004:     lda #$00           ; $e004: a9 00     
            sta $0600,x        ; $e006: 9d 00 06  
            sta $0610,x        ; $e009: 9d 10 06  
            sta $0620,x        ; $e00c: 9d 20 06  
            dex                ; $e00f: ca        
            bpl __e004         ; $e010: 10 f2     
            jsr __dfea         ; $e012: 20 ea df  
            beq __e05d         ; $e015: f0 46     
            sta $0b            ; $e017: 85 0b     
            ldx #$00           ; $e019: a2 00     
__e01b:     ldy $0b            ; $e01b: a4 0b     
            lda __df1b,y       ; $e01d: b9 1b df  
            lsr                ; $e020: 4a        
            lsr                ; $e021: 4a        
            lsr                ; $e022: 4a        
            lsr                ; $e023: 4a        
            lsr                ; $e024: 4a        
            sta $00            ; $e025: 85 00     
            lda $90            ; $e027: a5 90     
            sec                ; $e029: 38        
            sbc $00            ; $e02a: e5 00     
            cmp #$04           ; $e02c: c9 04     
            bcs __e054         ; $e02e: b0 24     
            tay                ; $e030: a8        
            lda __def6,y       ; $e031: b9 f6 de  
            sta $0610,x        ; $e034: 9d 10 06  
            ldy $0b            ; $e037: a4 0b     
            lda __df1b,y       ; $e039: b9 1b df  
            and #$1f           ; $e03c: 29 1f     
            adc #$04           ; $e03e: 69 04     
            asl                ; $e040: 0a        
            asl                ; $e041: 0a        
            asl                ; $e042: 0a        
            sta $0600,x        ; $e043: 9d 00 06  
            lda __df1b,y       ; $e046: b9 1b df  
            and #$1f           ; $e049: 29 1f     
            clc                ; $e04b: 18        
            adc #$05           ; $e04c: 69 05     
            asl                ; $e04e: 0a        
            asl                ; $e04f: 0a        
            asl                ; $e050: 0a        
            sta $0620,x        ; $e051: 9d 20 06  
__e054:     inx                ; $e054: e8        
            dec $0b            ; $e055: c6 0b     
            lda $0b            ; $e057: a5 0b     
            cmp $0a            ; $e059: c5 0a     
            bne __e01b         ; $e05b: d0 be     
__e05d:     rts                ; $e05d: 60        

;-------------------------------------------------------------------------------
__e05e:     jsr __dfea         ; $e05e: 20 ea df  
            beq __e05d         ; $e061: f0 fa     
            sta $01            ; $e063: 85 01     
            lda #$00           ; $e065: a9 00     
            sta $00            ; $e067: 85 00     
__e069:     ldx $01            ; $e069: a6 01     
            jsr __dff8         ; $e06b: 20 f8 df  
            lda __d794,y       ; $e06e: b9 94 d7  
            sta $02            ; $e071: 85 02     
            lda __d78b,y       ; $e073: b9 8b d7  
            jsr __e0a7         ; $e076: 20 a7 e0  
            jsr __e097         ; $e079: 20 97 e0  
            lda $00            ; $e07c: a5 00     
            clc                ; $e07e: 18        
            adc #$04           ; $e07f: 69 04     
            sta $00            ; $e081: 85 00     
            cmp #$38           ; $e083: c9 38     
            bcs __e08f         ; $e085: b0 08     
            dec $01            ; $e087: c6 01     
            lda $01            ; $e089: a5 01     
            cmp $0a            ; $e08b: c5 0a     
            bne __e069         ; $e08d: d0 da     
__e08f:     ldy $00            ; $e08f: a4 00     
            sty $0300          ; $e091: 8c 00 03  
            jmp __c14e         ; $e094: 4c 4e c1  

;-------------------------------------------------------------------------------
__e097:     lda #$c5           ; $e097: a9 c5     
            sta $0303,y        ; $e099: 99 03 03  
            lda #$eb           ; $e09c: a9 eb     
            sta $0304,y        ; $e09e: 99 04 03  
            lda #$00           ; $e0a1: a9 00     
            sta $0305,y        ; $e0a3: 99 05 03  
            rts                ; $e0a6: 60        

;-------------------------------------------------------------------------------
__e0a7:     jsr __dcea         ; $e0a7: 20 ea dc  
            lda __df1b,x       ; $e0aa: bd 1b df  
            and #$1f           ; $e0ad: 29 1f     
            clc                ; $e0af: 18        
            adc #$04           ; $e0b0: 69 04     
            clc                ; $e0b2: 18        
            adc $02            ; $e0b3: 65 02     
            sta $0302,y        ; $e0b5: 99 02 03  
            rts                ; $e0b8: 60        

;-------------------------------------------------------------------------------
__e0b9:     ldx #$00           ; $e0b9: a2 00     
            jsr __e0c0         ; $e0bb: 20 c0 e0  
            ldx #$01           ; $e0be: a2 01     
__e0c0:     lda $3a,x          ; $e0c0: b5 3a     
            bne __e11b         ; $e0c2: d0 57     
            lda $5a,x          ; $e0c4: b5 5a     
            beq __e11a         ; $e0c6: f0 52     
            lda $6a,x          ; $e0c8: b5 6a     
            cmp #$07           ; $e0ca: c9 07     
            beq __e11a         ; $e0cc: f0 4c     
            lda $2d,x          ; $e0ce: b5 2d     
            bne __e11a         ; $e0d0: d0 48     
            lda $64,x          ; $e0d2: b5 64     
            clc                ; $e0d4: 18        
            adc #$08           ; $e0d5: 69 08     
            sta $0a            ; $e0d7: 85 0a     
            lda $66,x          ; $e0d9: b5 66     
            clc                ; $e0db: 18        
            adc #$0c           ; $e0dc: 69 0c     
            sta $0b            ; $e0de: 85 0b     
            ldy #$00           ; $e0e0: a0 00     
__e0e2:     lda $0600,y        ; $e0e2: b9 00 06  
            beq __e115         ; $e0e5: f0 2e     
            clc                ; $e0e7: 18        
            adc #$04           ; $e0e8: 69 04     
            sec                ; $e0ea: 38        
            sbc $0a            ; $e0eb: e5 0a     
            sta $00            ; $e0ed: 85 00     
            jsr __d2f9         ; $e0ef: 20 f9 d2  
            cmp #$0c           ; $e0f2: c9 0c     
            bcs __e115         ; $e0f4: b0 1f     
            lda $0610,y        ; $e0f6: b9 10 06  
            sec                ; $e0f9: 38        
            sbc #$1c           ; $e0fa: e9 1c     
            sec                ; $e0fc: 38        
            sbc $0b            ; $e0fd: e5 0b     
            jsr __d2f9         ; $e0ff: 20 f9 d2  
            pha                ; $e102: 48        
            lda $e6,x          ; $e103: b5 e6     
            cmp #$02           ; $e105: c9 02     
            bcs __e110         ; $e107: b0 07     
            pla                ; $e109: 68        
            cmp #$1c           ; $e10a: c9 1c     
            bcc __e12f         ; $e10c: 90 21     
            bcs __e115         ; $e10e: b0 05     
__e110:     pla                ; $e110: 68        
            cmp #$24           ; $e111: c9 24     
            bcc __e12f         ; $e113: 90 1a     
__e115:     iny                ; $e115: c8        
            cpy #$0b           ; $e116: c0 0b     
            bcc __e0e2         ; $e118: 90 c8     
__e11a:     rts                ; $e11a: 60        

;-------------------------------------------------------------------------------
__e11b:     lda $50            ; $e11b: a5 50     
            and #$01           ; $e11d: 29 01     
            beq __e12e         ; $e11f: f0 0d     
            lda $68,x          ; $e121: b5 68     
            beq __e12e         ; $e123: f0 09     
            cmp #$02           ; $e125: c9 02     
            beq __e12c         ; $e127: f0 03     
            inc $64,x          ; $e129: f6 64     
            .hex 2c            ; $e12b: 2c        Suspected data
__e12c:     dec $64,x          ; $e12c: d6 64     
__e12e:     rts                ; $e12e: 60        

;-------------------------------------------------------------------------------
__e12f:     pha                ; $e12f: 48        
            lda $e6,x          ; $e130: b5 e6     
            cmp #$02           ; $e132: c9 02     
            bcs __e13d         ; $e134: b0 07     
            pla                ; $e136: 68        
            cmp #$18           ; $e137: c9 18     
            bcc __e158         ; $e139: 90 1d     
            bcs __e142         ; $e13b: b0 05     
__e13d:     pla                ; $e13d: 68        
            cmp #$23           ; $e13e: c9 23     
            bcc __e158         ; $e140: 90 16     
__e142:     lda $68,x          ; $e142: b5 68     
            beq __e158         ; $e144: f0 12     
            lda $00            ; $e146: a5 00     
            cmp #$03           ; $e148: c9 03     
            bcc __e153         ; $e14a: 90 07     
            cmp #$fd           ; $e14c: c9 fd     
            bcs __e153         ; $e14e: b0 03     
            jsr __e176         ; $e150: 20 76 e1  
__e153:     lda #$08           ; $e153: a9 08     
            sta $3a,x          ; $e155: 95 3a     
            rts                ; $e157: 60        

;-------------------------------------------------------------------------------
__e158:     lda $00            ; $e158: a5 00     
            bmi __e165         ; $e15a: 30 09     
            lda $0600,y        ; $e15c: b9 00 06  
            sec                ; $e15f: 38        
            sbc #$10           ; $e160: e9 10     
            jmp __e16b         ; $e162: 4c 6b e1  

;-------------------------------------------------------------------------------
__e165:     lda $0600,y        ; $e165: b9 00 06  
            clc                ; $e168: 18        
            adc #$07           ; $e169: 69 07     
__e16b:     sta $64,x          ; $e16b: 95 64     
            lda $6a,x          ; $e16d: b5 6a     
            and #$01           ; $e16f: 29 01     
            bne __e184         ; $e171: d0 11     
            jmp __e176         ; $e173: 4c 76 e1  

;-------------------------------------------------------------------------------
__e176:     lda $00            ; $e176: a5 00     
            asl                ; $e178: 0a        
            lda #$01           ; $e179: a9 01     
            bcs __e17e         ; $e17b: b0 01     
            asl                ; $e17d: 0a        
__e17e:     sta $68,x          ; $e17e: 95 68     
            and #$01           ; $e180: 29 01     
            sta $62,x          ; $e182: 95 62     
__e184:     rts                ; $e184: 60        

;-------------------------------------------------------------------------------
__e185:     plp                ; $e185: 28        
            cli                ; $e186: 58        
            dey                ; $e187: 88        
            clv                ; $e188: b8        
__e189:     ldx $90            ; $e189: a6 90     
            cpx #$09           ; $e18b: e0 09     
            beq __e1e0         ; $e18d: f0 51     
            ldx $7c            ; $e18f: a6 7c     
            dex                ; $e191: ca        
            bne __e1e1         ; $e192: d0 4d     
            ldx #$02           ; $e194: a2 02     
__e196:     lda $99,x          ; $e196: b5 99     
            bne __e1e0         ; $e198: d0 46     
            dex                ; $e19a: ca        
            bpl __e196         ; $e19b: 10 f9     
            ldy $92            ; $e19d: a4 92     
__e19f:     bne __e1e0         ; $e19f: d0 3f     
            txa                ; $e1a1: 8a        
            jsr __e23e         ; $e1a2: 20 3e e2  
            sta $92            ; $e1a5: 85 92     
            sta $03d3          ; $e1a7: 8d d3 03  
            sty $0376          ; $e1aa: 8c 76 03  
            sty $03b2          ; $e1ad: 8c b2 03  
            sty $03c8          ; $e1b0: 8c c8 03  
            lda #$40           ; $e1b3: a9 40     
            sta $03bd          ; $e1b5: 8d bd 03  
            asl                ; $e1b8: 0a        
            sta $03a7          ; $e1b9: 8d a7 03  
            iny                ; $e1bc: c8        
            sty $be            ; $e1bd: 84 be     
            lda #$04           ; $e1bf: a9 04     
            sta $9d            ; $e1c1: 85 9d     
            ldx $90            ; $e1c3: a6 90     
            inx                ; $e1c5: e8        
__e1c6:     dex                ; $e1c6: ca        
            cpx $0786          ; $e1c7: ec 86 07  
            beq __e1c6         ; $e1ca: f0 fa     
            cpx $0787          ; $e1cc: ec 87 07  
            beq __e1c6         ; $e1cf: f0 f5     
            stx $b3            ; $e1d1: 86 b3     
            lda $90            ; $e1d3: a5 90     
            sec                ; $e1d5: 38        
            sbc $b3            ; $e1d6: e5 b3     
            tax                ; $e1d8: aa        
            lda __e185,x       ; $e1d9: bd 85 e1  
            sta $a8            ; $e1dc: 85 a8     
            .hex e6            ; $e1de: e6        Suspected data
__e1df:     .hex 7c            ; $e1df: 7c        Suspected data
__e1e0:     rts                ; $e1e0: 60        

;-------------------------------------------------------------------------------
__e1e1:     dex                ; $e1e1: ca        
            bne __e1ee         ; $e1e2: d0 0a     
__e1e4:     lda $0376          ; $e1e4: ad 76 03  
            bne __e215         ; $e1e7: d0 2c     
            dec $df            ; $e1e9: c6 df     
            beq __e202         ; $e1eb: f0 15     
            rts                ; $e1ed: 60        

;-------------------------------------------------------------------------------
__e1ee:     dex                ; $e1ee: ca        
            bne __e21a         ; $e1ef: d0 29     
            lda $0376          ; $e1f1: ad 76 03  
            bne __e215         ; $e1f4: d0 1f     
            lda $a8            ; $e1f6: a5 a8     
            cmp #$17           ; $e1f8: c9 17     
            bne __e1e4         ; $e1fa: d0 e8     
            lda $9d            ; $e1fc: a5 9d     
            cmp #$78           ; $e1fe: c9 78     
            bne __e1e4         ; $e200: d0 e2     
__e202:     lda #$04           ; $e202: a9 04     
            sta $7c            ; $e204: 85 7c     
            lda #$0c           ; $e206: a9 0c     
            sta $df            ; $e208: 85 df     
            lda $92            ; $e20a: a5 92     
            cmp #$ff           ; $e20c: c9 ff     
            bne __e214         ; $e20e: d0 04     
            lda #$04           ; $e210: a9 04     
            sta $92            ; $e212: 85 92     
__e214:     rts                ; $e214: 60        

;-------------------------------------------------------------------------------
__e215:     lda #$00           ; $e215: a9 00     
            sta $7c            ; $e217: 85 7c     
            rts                ; $e219: 60        

;-------------------------------------------------------------------------------
__e21a:     dex                ; $e21a: ca        
            bne __e235         ; $e21b: d0 18     
            dec $df            ; $e21d: c6 df     
            bpl __e225         ; $e21f: 10 04     
            lda #$03           ; $e221: a9 03     
            bne __e23e         ; $e223: d0 19     
__e225:     beq __e214         ; $e225: f0 ed     
            lda $92            ; $e227: a5 92     
            cmp #$04           ; $e229: c9 04     
            bne __e234         ; $e22b: d0 07     
            lda $a8            ; $e22d: a5 a8     
            sec                ; $e22f: 38        
            sbc #$01           ; $e230: e9 01     
            sta $a8            ; $e232: 85 a8     
__e234:     rts                ; $e234: 60        

;-------------------------------------------------------------------------------
__e235:     dex                ; $e235: ca        
            bne __e251         ; $e236: d0 19     
            dec $df            ; $e238: c6 df     
            bne __e243         ; $e23a: d0 07     
            lda #$10           ; $e23c: a9 10     
__e23e:     sta $df            ; $e23e: 85 df     
            inc $7c            ; $e240: e6 7c     
            rts                ; $e242: 60        

;-------------------------------------------------------------------------------
__e243:     lda $92            ; $e243: a5 92     
            cmp #$04           ; $e245: c9 04     
            bne __e250         ; $e247: d0 07     
            lda #$05           ; $e249: a9 05     
            clc                ; $e24b: 18        
            adc $a8            ; $e24c: 65 a8     
            sta $a8            ; $e24e: 85 a8     
__e250:     rts                ; $e250: 60        

;-------------------------------------------------------------------------------
__e251:     dex                ; $e251: ca        
            bne __e250         ; $e252: d0 fc     
            dec $df            ; $e254: c6 df     
            bne __e250         ; $e256: d0 f8     
            lda $92            ; $e258: a5 92     
            cmp #$04           ; $e25a: c9 04     
            bne __e265         ; $e25c: d0 07     
            lda #$ff           ; $e25e: a9 ff     
            sta $92            ; $e260: 85 92     
            sta $03d3          ; $e262: 8d d3 03  
__e265:     lda $0376          ; $e265: ad 76 03  
            bne __e215         ; $e268: d0 ab     
            lda #$80           ; $e26a: a9 80     
            sta $7c            ; $e26c: 85 7c     
            lda #$02           ; $e26e: a9 02     
            sta $ff            ; $e270: 85 ff     
            rts                ; $e272: 60        

;-------------------------------------------------------------------------------
__e273:     brk                ; $e273: 00        
            clc                ; $e274: 18        
            bmi __e2bf         ; $e275: 30 48     
__e277:     ldx #$03           ; $e277: a2 03     
            .hex 2c            ; $e279: 2c        Suspected data
__e27a:     ldx #$01           ; $e27a: a2 01     
__e27c:     lda __e273,x       ; $e27c: bd 73 e2  
            tay                ; $e27f: a8        
            lda $0786,x        ; $e280: bd 86 07  
            beq __e296         ; $e283: f0 11     
            lda $02a0,y        ; $e285: b9 a0 02  
            cmp #$ec           ; $e288: c9 ec     
            bcc __e296         ; $e28a: 90 0a     
            lda #$00           ; $e28c: a9 00     
            sta $0786,x        ; $e28e: 9d 86 07  
            lda #$ff           ; $e291: a9 ff     
            sta $06f5,x        ; $e293: 9d f5 06  
__e296:     dex                ; $e296: ca        
            bpl __e27c         ; $e297: 10 e3     
            rts                ; $e299: 60        

;-------------------------------------------------------------------------------
__e29a:     ldx #$08           ; $e29a: a2 08     
            jsr __e303         ; $e29c: 20 03 e3  
            ldy #$2c           ; $e29f: a0 2c     
            ldx #$01           ; $e2a1: a2 01     
__e2a3:     lda $0786,x        ; $e2a3: bd 86 07  
            beq __e2be         ; $e2a6: f0 16     
            jsr __e321         ; $e2a8: 20 21 e3  
            txa                ; $e2ab: 8a        
            clc                ; $e2ac: 18        
            adc #$06           ; $e2ad: 69 06     
            tay                ; $e2af: a8        
__e2b0:     lda $07b7,x        ; $e2b0: bd b7 07  
            clc                ; $e2b3: 18        
            adc $0788,y        ; $e2b4: 79 88 07  
            sta $0788,y        ; $e2b7: 99 88 07  
            dey                ; $e2ba: 88        
            dey                ; $e2bb: 88        
            bpl __e2b0         ; $e2bc: 10 f2     
__e2be:     .hex a0            ; $e2be: a0        Suspected data
__e2bf:     .hex 14 ca         ; $e2bf: 14 ca     Invalid Opcode - NOP $ca,x
            bpl __e2a3         ; $e2c1: 10 e0     
            ldy #$01           ; $e2c3: a0 01     
__e2c5:     lda $006a,y        ; $e2c5: b9 6a 00  
            cmp #$01           ; $e2c8: c9 01     
            beq __e2d0         ; $e2ca: f0 04     
            cmp #$03           ; $e2cc: c9 03     
            bne __e2f4         ; $e2ce: d0 24     
__e2d0:     ldx $5a,y          ; $e2d0: b6 5a     
            beq __e2f4         ; $e2d2: f0 20     
            cpx #$02           ; $e2d4: e0 02     
            bmi __e2f4         ; $e2d6: 30 1c     
            cpx #$09           ; $e2d8: e0 09     
            beq __e2f4         ; $e2da: f0 18     
            lda $002d,y        ; $e2dc: b9 2d 00  
            bne __e2e6         ; $e2df: d0 05     
            lda $0343,y        ; $e2e1: b9 43 03  
            bne __e2ec         ; $e2e4: d0 06     
__e2e6:     lda $07ae,x        ; $e2e6: bd ae 07  
            jsr __e2fb         ; $e2e9: 20 fb e2  
__e2ec:     ldx $0783,y        ; $e2ec: be 83 07  
            bmi __e2f4         ; $e2ef: 30 03     
            jsr __e2f8         ; $e2f1: 20 f8 e2  
__e2f4:     dey                ; $e2f4: 88        
            bpl __e2c5         ; $e2f5: 10 ce     
            rts                ; $e2f7: 60        

;-------------------------------------------------------------------------------
__e2f8:     lda $07b7,x        ; $e2f8: bd b7 07  
__e2fb:     clc                ; $e2fb: 18        
            adc $0064,y        ; $e2fc: 79 64 00  
            sta $0064,y        ; $e2ff: 99 64 00  
            rts                ; $e302: 60        

;-------------------------------------------------------------------------------
__e303:     lda $07c0,x        ; $e303: bd c0 07  
            clc                ; $e306: 18        
            adc $07a0,x        ; $e307: 7d a0 07  
            sta $07c0,x        ; $e30a: 9d c0 07  
            lda #$00           ; $e30d: a9 00     
            adc $0790,x        ; $e30f: 7d 90 07  
            ldy $07d0,x        ; $e312: bc d0 07  
            beq __e31a         ; $e315: f0 03     
            jsr __d2fb         ; $e317: 20 fb d2  
__e31a:     sta $07b0,x        ; $e31a: 9d b0 07  
            dex                ; $e31d: ca        
            bpl __e303         ; $e31e: 10 e3     
            rts                ; $e320: 60        

;-------------------------------------------------------------------------------
__e321:     lda #$05           ; $e321: a9 05     
            sta $01            ; $e323: 85 01     
__e325:     lda $07b7,x        ; $e325: bd b7 07  
            clc                ; $e328: 18        
            adc $02a3,y        ; $e329: 79 a3 02  
            sta $02a3,y        ; $e32c: 99 a3 02  
            dey                ; $e32f: 88        
            dey                ; $e330: 88        
            dey                ; $e331: 88        
            dey                ; $e332: 88        
            dec $01            ; $e333: c6 01     
            bpl __e325         ; $e335: 10 ee     
            rts                ; $e337: 60        

;-------------------------------------------------------------------------------
__e338:     .hex 14 2c         ; $e338: 14 2c     Invalid Opcode - NOP $2c,x
            .hex 44 5c         ; $e33a: 44 5c     Invalid Opcode - NOP $5c
__e33c:     ldx #$0a           ; $e33c: a2 0a     
            jsr __e303         ; $e33e: 20 03 e3  
__e341:     ldx #$03           ; $e341: a2 03     
__e343:     lda $0786,x        ; $e343: bd 86 07  
            beq __e362         ; $e346: f0 1a     
            lda __e338,x       ; $e348: bd 38 e3  
            tay                ; $e34b: a8        
            jsr __e321         ; $e34c: 20 21 e3  
            lda $07b7,x        ; $e34f: bd b7 07  
            pha                ; $e352: 48        
            clc                ; $e353: 18        
            adc $0682,x        ; $e354: 7d 82 06  
            sta $0682,x        ; $e357: 9d 82 06  
            pla                ; $e35a: 68        
            clc                ; $e35b: 18        
            adc $06a0,x        ; $e35c: 7d a0 06  
            sta $06a0,x        ; $e35f: 9d a0 06  
__e362:     dex                ; $e362: ca        
            bpl __e343         ; $e363: 10 de     
            ldy #$01           ; $e365: a0 01     
            lda $006a,y        ; $e367: b9 6a 00  
            cmp #$01           ; $e36a: c9 01     
            beq __e372         ; $e36c: f0 04     
            cmp #$03           ; $e36e: c9 03     
            bne __e37e         ; $e370: d0 0c     
__e372:     lda $0783,y        ; $e372: b9 83 07  
            sec                ; $e375: 38        
            sbc #$1a           ; $e376: e9 1a     
            bmi __e37e         ; $e378: 30 04     
            tax                ; $e37a: aa        
            jsr __e2f8         ; $e37b: 20 f8 e2  
__e37e:     dey                ; $e37e: 88        
            .hex 10            ; $e37f: 10        Suspected data
__e380:     inc $60            ; $e380: e6 60     
__e382:     brk                ; $e382: 00        
            brk                ; $e383: 00        
            brk                ; $e384: 00        
            brk                ; $e385: 00        
            brk                ; $e386: 00        
            brk                ; $e387: 00        
            brk                ; $e388: 00        
            brk                ; $e389: 00        
            brk                ; $e38a: 00        
            lda ($00,x)        ; $e38b: a1 00     
            brk                ; $e38d: 00        
            brk                ; $e38e: 00        
            brk                ; $e38f: 00        
            bcs __e392         ; $e390: b0 00     
__e392:     bmi __e394         ; $e392: 30 00     
__e394:     brk                ; $e394: 00        
            lda ($00),y        ; $e395: b1 00     
            php                ; $e397: 08        
            lda ($00,x)        ; $e398: a1 00     
            bmi __e39c         ; $e39a: 30 00     
__e39c:     bcs __e341         ; $e39c: b0 a3     
            beq __e3a0         ; $e39e: f0 00     
__e3a0:     brk                ; $e3a0: 00        
            cmp $00            ; $e3a1: c5 00     
            .hex b3 32         ; $e3a3: b3 32     Invalid Opcode - LAX ($32),y
            ldy #$d4           ; $e3a5: a0 d4     
            brk                ; $e3a7: 00        
            .hex 23 08         ; $e3a8: 23 08     Invalid Opcode - RLA ($08,x)
            ldx $00,y          ; $e3aa: b6 00     
            .hex c3 31         ; $e3ac: c3 31     Invalid Opcode - DCP ($31,x)
            brk                ; $e3ae: 00        
            php                ; $e3af: 08        
            php                ; $e3b0: 08        
            lda ($23),y        ; $e3b1: b1 23     
            brk                ; $e3b3: 00        
            inc $24            ; $e3b4: e6 24     
            lda $00            ; $e3b6: a5 00     
            .hex 32            ; $e3b8: 32        Invalid Opcode - KIL 
            cmp $00,x          ; $e3b9: d5 00     
            cpy $b7            ; $e3bb: c4 b7     
            bmi __e3e2         ; $e3bd: 30 23     
            .hex 3c f3 d7      ; $e3bf: 3c f3 d7  Invalid Opcode - NOP __d7f3,x
            brk                ; $e3c2: 00        
            stx $00            ; $e3c3: 86 00     
            .hex 2b 33         ; $e3c5: 2b 33     Invalid Opcode - ANC #$33
            .hex d7 34         ; $e3c7: d7 34     Invalid Opcode - DCP $34,x
            brk                ; $e3c9: 00        
            ldx $08,y          ; $e3ca: b6 08     
            brk                ; $e3cc: 00        
            php                ; $e3cd: 08        
            ror $2a,x          ; $e3ce: 76 2a     
            .hex 23 00         ; $e3d0: 23 00     Invalid Opcode - RLA ($00,x)
            .hex b2            ; $e3d2: b2        Invalid Opcode - KIL 
            .hex 33 a6         ; $e3d3: 33 a6     Invalid Opcode - RLA ($a6),y
            .hex 34 e6         ; $e3d5: 34 e6     Invalid Opcode - NOP $e6,x
            .hex 33 75         ; $e3d7: 33 75     Invalid Opcode - RLA ($75),y
            brk                ; $e3d9: 00        
            jsr $00a6          ; $e3da: 20 a6 00  
            dec $d5            ; $e3dd: c6 d5     
            brk                ; $e3df: 00        
            .hex 3a            ; $e3e0: 3a        Invalid Opcode - NOP 
            brk                ; $e3e1: 00        
__e3e2:     cpx $f7            ; $e3e2: e4 f7     
            brk                ; $e3e4: 00        
            dec $00,x          ; $e3e5: d6 00     
            .hex 22            ; $e3e7: 22        Invalid Opcode - KIL 
            brk                ; $e3e8: 00        
            ldx $d7            ; $e3e9: a6 d7     
            .hex d7 00         ; $e3eb: d7 00     Invalid Opcode - DCP $00,x
            dec $00            ; $e3ed: c6 00     
            brk                ; $e3ef: 00        
            .hex 33 f6         ; $e3f0: 33 f6     Invalid Opcode - RLA ($f6),y
            jsr $2231          ; $e3f2: 20 31 22  
            .hex 33 a4         ; $e3f5: 33 a4     Invalid Opcode - RLA ($a4),y
            ldx $24,y          ; $e3f7: b6 24     
            adc $a4,x          ; $e3f9: 75 a4     
            brk                ; $e3fb: 00        
            sec                ; $e3fc: 38        
            .hex 34 a5         ; $e3fd: 34 a5     Invalid Opcode - NOP $a5,x
            .hex 34 38         ; $e3ff: 34 38     Invalid Opcode - NOP $38,x
            .hex f4 a4         ; $e401: f4 a4     Invalid Opcode - NOP $a4,x
            brk                ; $e403: 00        
            brk                ; $e404: 00        
            dec $2b,x          ; $e405: d6 2b     
            cpy $00            ; $e407: c4 00     
            .hex 32            ; $e409: 32        Invalid Opcode - KIL 
            bit $00            ; $e40a: 24 00     
            lda $d3,x          ; $e40c: b5 d3     
            and #$22           ; $e40e: 29 22     
            .hex 34 24         ; $e410: 34 24     Invalid Opcode - NOP $24,x
            .hex f2            ; $e412: f2        Invalid Opcode - KIL 
            ldx $00,y          ; $e413: b6 00     
            sty $08,x          ; $e415: 94 08     
            lda $00            ; $e417: a5 00     
            brk                ; $e419: 00        
            dec $00,x          ; $e41a: d6 00     
            brk                ; $e41c: 00        
            brk                ; $e41d: 00        
            brk                ; $e41e: 00        
            bit $00            ; $e41f: 24 00     
            cmp $00            ; $e421: c5 00     
            brk                ; $e423: 00        
            ror $65,x          ; $e424: 76 65     
            .hex 23 34         ; $e426: 23 34     Invalid Opcode - RLA ($34,x)
            .hex 34 d6         ; $e428: 34 d6     Invalid Opcode - NOP $d6,x
            brk                ; $e42a: 00        
            dec $b5            ; $e42b: c6 b5     
            .hex 22            ; $e42d: 22        Invalid Opcode - KIL 
            .hex 32            ; $e42e: 32        Invalid Opcode - KIL 
            .hex 34 e7         ; $e42f: 34 e7     Invalid Opcode - NOP $e7,x
            brk                ; $e431: 00        
            ror $76            ; $e432: 66 76     
            ldx $00            ; $e434: a6 00     
            bit $c7            ; $e436: 24 c7     
            sbc $00            ; $e438: e5 00     
            sbc $2b,x          ; $e43a: f5 2b     
            brk                ; $e43c: 00        
            jsr __f6c7         ; $e43d: 20 c7 f6  
            brk                ; $e440: 00        
            .hex 33 e5         ; $e441: 33 e5     Invalid Opcode - RLA ($e5),y
            brk                ; $e443: 00        
            inc $34,x          ; $e444: f6 34     
            .hex 33 d6         ; $e446: 33 d6     Invalid Opcode - RLA ($d6),y
            jsr $3300          ; $e448: 20 00 33  
            ldx $00            ; $e44b: a6 00     
            .hex 67 d6         ; $e44d: 67 d6     Invalid Opcode - RRA $d6
            .hex 23 3b         ; $e44f: 23 3b     Invalid Opcode - RLA ($3b,x)
            brk                ; $e451: 00        
            .hex 7d e6 00      ; $e452: 7d e6 00  Bad Addr Mode - ADC $00e6,x
            sbc $7623,x        ; $e455: fd 23 76  
            bit $33            ; $e458: 24 33     
            .hex c7 23         ; $e45a: c7 23     Invalid Opcode - DCP $23
            .hex e7 9e         ; $e45c: e7 9e     Invalid Opcode - ISC $9e
            brk                ; $e45e: 00        
            .hex 3b 2e d7      ; $e45f: 3b 2e d7  Invalid Opcode - RLA __d72e,y
__e462:     brk                ; $e462: 00        
            rti                ; $e463: 40        

;-------------------------------------------------------------------------------
            rti                ; $e464: 40        

;-------------------------------------------------------------------------------
            brk                ; $e465: 00        
            rti                ; $e466: 40        

;-------------------------------------------------------------------------------
            adc $2074          ; $e467: 6d 74 20  
            brk                ; $e46a: 00        
            bpl __e497         ; $e46b: 10 2a     
            ora ($41,x)        ; $e46d: 01 41     
            asl                ; $e46f: 0a        
            pha                ; $e470: 48        
            brk                ; $e471: 00        
__e472:     brk                ; $e472: 00        
            pha                ; $e473: 48        
            brk                ; $e474: 00        
            brk                ; $e475: 00        
            adc #$24           ; $e476: 69 24     
            bit $00            ; $e478: 24 00     
            brk                ; $e47a: 00        
            .hex 44 21         ; $e47b: 44 21     Invalid Opcode - NOP $21
            adc ($04,x)        ; $e47d: 61 04     
            php                ; $e47f: 08        
            .hex 12            ; $e480: 12        Invalid Opcode - KIL 
            .hex 10            ; $e481: 10        Suspected data
__e482:     brk                ; $e482: 00        
            rti                ; $e483: 40        

;-------------------------------------------------------------------------------
            ora #$40           ; $e484: 09 40     
            pla                ; $e486: 68        
            .hex 04 48         ; $e487: 04 48     Invalid Opcode - NOP $48
            brk                ; $e489: 00        
            .hex 02            ; $e48a: 02        Invalid Opcode - KIL 
            jmp ($0408)        ; $e48b: 6c 08 04  

;-------------------------------------------------------------------------------
            bpl __e4d8         ; $e48e: 10 48     
            brk                ; $e490: 00        
            .hex 66            ; $e491: 66        Suspected data
__e492:     .hex ff f7 b7      ; $e492: ff f7 b7  Invalid Opcode - ISC $b7f7,x
            .hex ff 9e         ; $e495: ff 9e     Suspected data
__e497:     dec $fb,x          ; $e497: d6 fb     
            .hex df ff af      ; $e499: df ff af  Invalid Opcode - DCP $afff,x
            dec $fe,x          ; $e49c: d6 fe     
            .hex bb f5 e5      ; $e49e: bb f5 e5  Invalid Opcode - LAS __e5f5,y
            .hex ef            ; $e4a1: ef        Suspected data
__e4a2:     brk                ; $e4a2: 00        
__e4a3:     .hex 80 00         ; $e4a3: 80 00     Invalid Opcode - NOP #$00
            ldy #$00           ; $e4a5: a0 00     
            cpy #$00           ; $e4a7: c0 00     
            cpx #$01           ; $e4a9: e0 01     
            brk                ; $e4ab: 00        
            ora ($40,x)        ; $e4ac: 01 40     
            ora ($80,x)        ; $e4ae: 01 80     
            .hex 02            ; $e4b0: 02        Invalid Opcode - KIL 
            brk                ; $e4b1: 00        
__e4b2:     inx                ; $e4b2: e8        
            .hex 02            ; $e4b3: 02        Invalid Opcode - KIL 
            brk                ; $e4b4: 00        
            .hex 1c 00         ; $e4b5: 1c 00     Suspected data
__e4b7:     clc                ; $e4b7: 18        
            pha                ; $e4b8: 48        
            sei                ; $e4b9: 78        
            tay                ; $e4ba: a8        
__e4bb:     cld                ; $e4bb: d8        
            inc __dcff,x       ; $e4bc: fe ff dc  
            inc __dcff,x       ; $e4bf: fe ff dc  
__e4c2:     jsr __e523         ; $e4c2: 20 23 e5  
            jsr __e719         ; $e4c5: 20 19 e7  
            sta $00            ; $e4c8: 85 00     
            ldy #$00           ; $e4ca: a0 00     
__e4cc:     ldx $00            ; $e4cc: a6 00     
            lda __e382,x       ; $e4ce: bd 82 e3  
            sta $01            ; $e4d1: 85 01     
            and #$e0           ; $e4d3: 29 e0     
            beq __e502         ; $e4d5: f0 2b     
            .hex c9            ; $e4d7: c9        Suspected data
__e4d8:     adc ($b0,x)        ; $e4d8: 61 b0     
            .hex 27 48         ; $e4da: 27 48     Invalid Opcode - RLA $48
            lda $01            ; $e4dc: a5 01     
            and #$07           ; $e4de: 29 07     
            tax                ; $e4e0: aa        
            pla                ; $e4e1: 68        
            cmp #$60           ; $e4e2: c9 60     
            bne __e4ec         ; $e4e4: d0 06     
            dex                ; $e4e6: ca        
            dex                ; $e4e7: ca        
            bpl __e4ec         ; $e4e8: 10 02     
            ldx #$06           ; $e4ea: a2 06     
__e4ec:     txa                ; $e4ec: 8a        
            asl                ; $e4ed: 0a        
            tax                ; $e4ee: aa        
            lda __e4a2,x       ; $e4ef: bd a2 e4  
            sta $0790,y        ; $e4f2: 99 90 07  
            lda __e4a3,x       ; $e4f5: bd a3 e4  
            sta $07a0,y        ; $e4f8: 99 a0 07  
            lda $01            ; $e4fb: a5 01     
            and #$10           ; $e4fd: 29 10     
            sta $07d0,y        ; $e4ff: 99 d0 07  
__e502:     lda $01            ; $e502: a5 01     
            lsr                ; $e504: 4a        
            lsr                ; $e505: 4a        
            lsr                ; $e506: 4a        
            lsr                ; $e507: 4a        
            ror $0785          ; $e508: 6e 85 07  
            inc $00            ; $e50b: e6 00     
            iny                ; $e50d: c8        
            cpy #$07           ; $e50e: c0 07     
            bne __e4cc         ; $e510: d0 ba     
            ldy #$05           ; $e512: a0 05     
            sty $0782          ; $e514: 8c 82 07  
__e517:     ldy $0782          ; $e517: ac 82 07  
            jsr __e640         ; $e51a: 20 40 e6  
            dec $0782          ; $e51d: ce 82 07  
            bne __e517         ; $e520: d0 f5     
            rts                ; $e522: 60        

;-------------------------------------------------------------------------------
__e523:     lda #$00           ; $e523: a9 00     
            ldx #$2d           ; $e525: a2 2d     
__e527:     sta $0790,x        ; $e527: 9d 90 07  
            dex                ; $e52a: ca        
            bpl __e527         ; $e52b: 10 fa     
            ldx #$03           ; $e52d: a2 03     
__e52f:     sta $0786,x        ; $e52f: 9d 86 07  
            dex                ; $e532: ca        
            bpl __e52f         ; $e533: 10 fa     
            sta $0785          ; $e535: 8d 85 07  
            rts                ; $e538: 60        

;-------------------------------------------------------------------------------
__e539:     .hex cb 1b         ; $e539: cb 1b     Invalid Opcode - AXS #$1b
            .hex ff 4a 92      ; $e53b: ff 4a 92  Invalid Opcode - ISC $924a,x
            .hex 1b a4 ff      ; $e53e: 1b a4 ff  Invalid Opcode - SLO __ffa4,y
            .hex 0b 50         ; $e541: 0b 50     Invalid Opcode - ANC #$50
            sta $da,x          ; $e543: 95 da     
            sbc #$ff           ; $e545: e9 ff     
            .hex cb a1         ; $e547: cb a1     Invalid Opcode - AXS #$a1
            adc $ff            ; $e549: 65 ff     
            .hex 9b            ; $e54b: 9b        Invalid Opcode - TAS 
            dec $8bff,x        ; $e54c: de ff 8b  
            eor $a0,x          ; $e54f: 55 a0     
            .hex 64 ff         ; $e551: 64 ff     Invalid Opcode - NOP $ff
            cmp $ff,x          ; $e553: d5 ff     
            .hex 52            ; $e555: 52        Invalid Opcode - KIL 
            stx $5a,y          ; $e556: 96 5a     
            inx                ; $e558: e8        
            .hex ff            ; $e559: ff        Suspected data
__e55a:     brk                ; $e55a: 00        
            .hex 03 08         ; $e55b: 03 08     Invalid Opcode - SLO ($08,x)
            asl $1512          ; $e55d: 0e 12 15  
            .hex 1a            ; $e560: 1a        Invalid Opcode - NOP 
            .hex 1c            ; $e561: 1c        Suspected data
__e562:     jsr __e523         ; $e562: 20 23 e5  
            lda #$19           ; $e565: a9 19     
            sta $24            ; $e567: 85 24     
            lda $59            ; $e569: a5 59     
            and #$07           ; $e56b: 29 07     
            tax                ; $e56d: aa        
            lda __e55a,x       ; $e56e: bd 5a e5  
            sta $25            ; $e571: 85 25     
__e573:     ldx $25            ; $e573: a6 25     
            lda __e539,x       ; $e575: bd 39 e5  
            pha                ; $e578: 48        
            and #$3f           ; $e579: 29 3f     
            cmp $24            ; $e57b: c5 24     
            beq __e583         ; $e57d: f0 04     
            bcc __e583         ; $e57f: 90 02     
            pla                ; $e581: 68        
            rts                ; $e582: 60        

;-------------------------------------------------------------------------------
__e583:     inc $25            ; $e583: e6 25     
            ldy #$03           ; $e585: a0 03     
__e587:     lda $0786,y        ; $e587: b9 86 07  
            beq __e58f         ; $e58a: f0 03     
            dey                ; $e58c: 88        
            bpl __e587         ; $e58d: 10 f8     
__e58f:     pla                ; $e58f: 68        
            sta $0786,y        ; $e590: 99 86 07  
            pha                ; $e593: 48        
            ldx #$00           ; $e594: a2 00     
            and #$40           ; $e596: 29 40     
            bne __e59b         ; $e598: d0 01     
            dex                ; $e59a: ca        
__e59b:     txa                ; $e59b: 8a        
            sta $07d7,y        ; $e59c: 99 d7 07  
            pla                ; $e59f: 68        
            pha                ; $e5a0: 48        
            ldx #$c0           ; $e5a1: a2 c0     
            and #$80           ; $e5a3: 29 80     
            bne __e5a9         ; $e5a5: d0 02     
            ldx #$80           ; $e5a7: a2 80     
__e5a9:     txa                ; $e5a9: 8a        
            sta $07a7,y        ; $e5aa: 99 a7 07  
            lda #$00           ; $e5ad: a9 00     
            sta $0797,y        ; $e5af: 99 97 07  
            ldx #$06           ; $e5b2: a2 06     
            lda $59            ; $e5b4: a5 59     
            and #$04           ; $e5b6: 29 04     
            beq __e5bb         ; $e5b8: f0 01     
            tax                ; $e5ba: aa        
__e5bb:     stx $03            ; $e5bb: 86 03     
            pla                ; $e5bd: 68        
            and #$3f           ; $e5be: 29 3f     
            pha                ; $e5c0: 48        
            cmp #$1e           ; $e5c1: c9 1e     
            bmi __e5c8         ; $e5c3: 30 03     
            ldx #$00           ; $e5c5: a2 00     
            .hex 2c            ; $e5c7: 2c        Suspected data
__e5c8:     ldx #$01           ; $e5c8: a2 01     
            txa                ; $e5ca: 8a        
            sta $06fa,y        ; $e5cb: 99 fa 06  
            pla                ; $e5ce: 68        
            tax                ; $e5cf: aa        
            lda #$de           ; $e5d0: a9 de     
__e5d2:     sec                ; $e5d2: 38        
            sbc #$08           ; $e5d3: e9 08     
            dex                ; $e5d5: ca        
            bne __e5d2         ; $e5d6: d0 fa     
            sta $08            ; $e5d8: 85 08     
            sta $06be,y        ; $e5da: 99 be 06  
            clc                ; $e5dd: 18        
            adc #$05           ; $e5de: 69 05     
            sta $06dc,y        ; $e5e0: 99 dc 06  
            lda #$e8           ; $e5e3: a9 e8     
            sta $0682,y        ; $e5e5: 99 82 06  
            lda #$18           ; $e5e8: a9 18     
            ldx $03            ; $e5ea: a6 03     
            cpx #$04           ; $e5ec: e0 04     
            bne __e5f2         ; $e5ee: d0 02     
            lda #$08           ; $e5f0: a9 08     
__e5f2:     sta $06a0,y        ; $e5f2: 99 a0 06  
            lda $27            ; $e5f5: a5 27     
            beq __e5ff         ; $e5f7: f0 06     
            lda $08            ; $e5f9: a5 08     
            clc                ; $e5fb: 18        
            adc #$10           ; $e5fc: 69 10     
            .hex 2c            ; $e5fe: 2c        Suspected data
__e5ff:     lda $08            ; $e5ff: a5 08     
            sec                ; $e601: 38        
            sbc $13            ; $e602: e5 13     
            sta $05            ; $e604: 85 05     
            dec $05            ; $e606: c6 05     
            lda #$dc           ; $e608: a9 dc     
            sta $07            ; $e60a: 85 07     
            lda #$e8           ; $e60c: a9 e8     
            sta $01            ; $e60e: 85 01     
            lda __e273,y       ; $e610: b9 73 e2  
            tay                ; $e613: a8        
__e614:     lda #$00           ; $e614: a9 00     
            sta $02a2,y        ; $e616: 99 a2 02  
            lda $05            ; $e619: a5 05     
            sta $02a0,y        ; $e61b: 99 a0 02  
            jsr __e881         ; $e61e: 20 81 e8  
            lda $07            ; $e621: a5 07     
            sta $02a1,y        ; $e623: 99 a1 02  
            lda #$ff           ; $e626: a9 ff     
            sta $07            ; $e628: 85 07     
            dec $03            ; $e62a: c6 03     
            beq __e635         ; $e62c: f0 07     
            iny                ; $e62e: c8        
            iny                ; $e62f: c8        
            iny                ; $e630: c8        
            iny                ; $e631: c8        
            jmp __e614         ; $e632: 4c 14 e6  

;-------------------------------------------------------------------------------
__e635:     lda #$fe           ; $e635: a9 fe     
            sta $02a1,y        ; $e637: 99 a1 02  
            jmp __e573         ; $e63a: 4c 73 e5  

;-------------------------------------------------------------------------------
__e63d:     ldy $90            ; $e63d: a4 90     
            iny                ; $e63f: c8        
__e640:     cpy #$09           ; $e640: c0 09     
            bpl __e64d         ; $e642: 10 09     
            cpy #$01           ; $e644: c0 01     
            beq __e64d         ; $e646: f0 05     
            jsr __e64e         ; $e648: 20 4e e6  
            bcs __e662         ; $e64b: b0 15     
__e64d:     rts                ; $e64d: 60        

;-------------------------------------------------------------------------------
__e64e:     jsr __e719         ; $e64e: 20 19 e7  
            sta $0c            ; $e651: 85 0c     
            tya                ; $e653: 98        
            clc                ; $e654: 18        
            adc $0c            ; $e655: 65 0c     
            tax                ; $e657: aa        
            lda __e380,x       ; $e658: bd 80 e3  
            sta $0c            ; $e65b: 85 0c     
            and #$e0           ; $e65d: 29 e0     
            cmp #$60           ; $e65f: c9 60     
            rts                ; $e661: 60        

;-------------------------------------------------------------------------------
__e662:     sta $0e            ; $e662: 85 0e     
            sty $00            ; $e664: 84 00     
            ldx #$05           ; $e666: a2 05     
__e668:     lda __e4b2,x       ; $e668: bd b2 e4  
            sta $01,x          ; $e66b: 95 01     
            dex                ; $e66d: ca        
            bpl __e668         ; $e66e: 10 f8     
            lda $0c            ; $e670: a5 0c     
            and #$10           ; $e672: 29 10     
            bne __e678         ; $e674: d0 02     
            inc $05            ; $e676: e6 05     
__e678:     lda $0c            ; $e678: a5 0c     
            and #$07           ; $e67a: 29 07     
            asl                ; $e67c: 0a        
            tax                ; $e67d: aa        
            lda __e4a2,x       ; $e67e: bd a2 e4  
            sta $06            ; $e681: 85 06     
            lda __e4a3,x       ; $e683: bd a3 e4  
            sta $07            ; $e686: 85 07     
            lda $19            ; $e688: a5 19     
            and #$1f           ; $e68a: 29 1f     
            clc                ; $e68c: 18        
            adc #$80           ; $e68d: 69 80     
            ldx $0e            ; $e68f: a6 0e     
            cpx #$e0           ; $e691: e0 e0     
            beq __e69b         ; $e693: f0 06     
            cpx #$c0           ; $e695: e0 c0     
            bne __e6a5         ; $e697: d0 0c     
            lda #$f0           ; $e699: a9 f0     
__e69b:     clc                ; $e69b: 18        
            adc $03            ; $e69c: 65 03     
            sta $03            ; $e69e: 85 03     
            clc                ; $e6a0: 18        
            adc #$1b           ; $e6a1: 69 1b     
            sta $04            ; $e6a3: 85 04     
__e6a5:     ldx #$00           ; $e6a5: a2 00     
            lda $0786          ; $e6a7: ad 86 07  
            beq __e6ad         ; $e6aa: f0 01     
            inx                ; $e6ac: e8        
__e6ad:     lda $05            ; $e6ad: a5 05     
            sta $07d7,x        ; $e6af: 9d d7 07  
            lda $06            ; $e6b2: a5 06     
            sta $0797,x        ; $e6b4: 9d 97 07  
            lda $07            ; $e6b7: a5 07     
            sta $07a7,x        ; $e6b9: 9d a7 07  
            ldy #$00           ; $e6bc: a0 00     
__e6be:     lda $0000,y        ; $e6be: b9 00 00  
            sta $0786,x        ; $e6c1: 9d 86 07  
            inx                ; $e6c4: e8        
            inx                ; $e6c5: e8        
            iny                ; $e6c6: c8        
            cpy #$05           ; $e6c7: c0 05     
            bne __e6be         ; $e6c9: d0 f3     
            ldy #$00           ; $e6cb: a0 00     
            cpx #$0a           ; $e6cd: e0 0a     
            beq __e6d3         ; $e6cf: f0 02     
            ldy #$18           ; $e6d1: a0 18     
__e6d3:     ldx #$06           ; $e6d3: a2 06     
            stx $0a            ; $e6d5: 86 0a     
__e6d7:     lda #$22           ; $e6d7: a9 22     
            sta $02a2,y        ; $e6d9: 99 a2 02  
            ldx $0a            ; $e6dc: a6 0a     
            lda __e4bb,x       ; $e6de: bd bb e4  
            cpx #$03           ; $e6e1: e0 03     
            beq __e6e9         ; $e6e3: f0 04     
            cpx #$04           ; $e6e5: e0 04     
            bne __e6f1         ; $e6e7: d0 08     
__e6e9:     ldx $0e            ; $e6e9: a6 0e     
            cpx #$e0           ; $e6eb: e0 e0     
            beq __e6f1         ; $e6ed: f0 02     
            lda #$ff           ; $e6ef: a9 ff     
__e6f1:     sta $02a1,y        ; $e6f1: 99 a1 02  
            jsr __e881         ; $e6f4: 20 81 e8  
            lda $90            ; $e6f7: a5 90     
            sec                ; $e6f9: 38        
            sbc $00            ; $e6fa: e5 00     
            tax                ; $e6fc: aa        
            inx                ; $e6fd: e8        
            lda __e4b7,x       ; $e6fe: bd b7 e4  
            sta $02a0,y        ; $e701: 99 a0 02  
            iny                ; $e704: c8        
            iny                ; $e705: c8        
            iny                ; $e706: c8        
            iny                ; $e707: c8        
            dec $0a            ; $e708: c6 0a     
            beq __e726         ; $e70a: f0 1a     
            lda $0a            ; $e70c: a5 0a     
            cmp #$03           ; $e70e: c9 03     
            bne __e6d7         ; $e710: d0 c5     
            lda $03            ; $e712: a5 03     
            sta $01            ; $e714: 85 01     
            jmp __e6d7         ; $e716: 4c d7 e6  

;-------------------------------------------------------------------------------
__e719:     lda $59            ; $e719: a5 59     
            and #$1f           ; $e71b: 29 1f     
            tax                ; $e71d: aa        
            lda #$f9           ; $e71e: a9 f9     
__e720:     clc                ; $e720: 18        
            adc #$07           ; $e721: 69 07     
            dex                ; $e723: ca        
            bpl __e720         ; $e724: 10 fa     
__e726:     rts                ; $e726: 60        

;-------------------------------------------------------------------------------
__e727:     .hex d3 8c         ; $e727: d3 8c     Invalid Opcode - DCP ($8c),y
            .hex cd 8f         ; $e729: cd 8f     Suspected data
__e72b:     lda $59            ; $e72b: a5 59     
            tax                ; $e72d: aa        
            and #$0f           ; $e72e: 29 0f     
            tay                ; $e730: a8        
            lda __e492,y       ; $e731: b9 92 e4  
            sta $00            ; $e734: 85 00     
            lda __e482,y       ; $e736: b9 82 e4  
            sta $01            ; $e739: 85 01     
            lda __e472,y       ; $e73b: b9 72 e4  
            sta $02            ; $e73e: 85 02     
            lda __e462,y       ; $e740: b9 62 e4  
            sta $03            ; $e743: 85 03     
            ldy #$07           ; $e745: a0 07     
__e747:     lda #$00           ; $e747: a9 00     
            ldx #$03           ; $e749: a2 03     
__e74b:     lsr $00,x          ; $e74b: 56 00     
            rol                ; $e74d: 2a        
            dex                ; $e74e: ca        
            bpl __e74b         ; $e74f: 10 fa     
            pha                ; $e751: 48        
            iny                ; $e752: c8        
            jsr __e64e         ; $e753: 20 4e e6  
            dey                ; $e756: 88        
            cmp #$a0           ; $e757: c9 a0     
            pla                ; $e759: 68        
            bcc __e75e         ; $e75a: 90 02     
            lda #$00           ; $e75c: a9 00     
__e75e:     sta $0004,y        ; $e75e: 99 04 00  
            lda $0c            ; $e761: a5 0c     
            tax                ; $e763: aa        
            and #$e0           ; $e764: 29 e0     
            cmp #$a0           ; $e766: c9 a0     
            bcs __e77c         ; $e768: b0 12     
            and #$70           ; $e76a: 29 70     
            beq __e779         ; $e76c: f0 0b     
            txa                ; $e76e: 8a        
            lsr                ; $e76f: 4a        
            lsr                ; $e770: 4a        
            lsr                ; $e771: 4a        
            and #$03           ; $e772: 29 03     
            tax                ; $e774: aa        
            lda __e727,x       ; $e775: bd 27 e7  
            .hex 2c            ; $e778: 2c        Suspected data
__e779:     lda #$00           ; $e779: a9 00     
            .hex 2c            ; $e77b: 2c        Suspected data
__e77c:     lda #$01           ; $e77c: a9 01     
            sta $0630,y        ; $e77e: 99 30 06  
            dey                ; $e781: 88        
            bne __e747         ; $e782: d0 c3     
            lda #$01           ; $e784: a9 01     
            sta $04            ; $e786: 85 04     
            lsr                ; $e788: 4a        
            sta $0630,y        ; $e789: 99 30 06  
            rts                ; $e78c: 60        

;-------------------------------------------------------------------------------
__e78d:     and ($4e,x)        ; $e78d: 21 4e     
            .hex 20            ; $e78f: 20        Suspected data
__e790:     eor $4242          ; $e790: 4d 42 42  
            .hex 42            ; $e793: 42        Invalid Opcode - KIL 
            .hex 42            ; $e794: 42        Invalid Opcode - KIL 
            .hex 42            ; $e795: 42        Invalid Opcode - KIL 
            pha                ; $e796: 48        
            lsr $9d9d          ; $e797: 4e 9d 9d  
            sta $9d9d,x        ; $e79a: 9d 9d 9d  
__e79d:     lda #$08           ; $e79d: a9 08     
            sta $0f            ; $e79f: 85 0f     
__e7a1:     ldy $0f            ; $e7a1: a4 0f     
            cpy #$01           ; $e7a3: c0 01     
            beq __e7b2         ; $e7a5: f0 0b     
            jsr __e64e         ; $e7a7: 20 4e e6  
            cmp #$81           ; $e7aa: c9 81     
            bcc __e7b2         ; $e7ac: 90 04     
            lda #$01           ; $e7ae: a9 01     
            bne __e7b8         ; $e7b0: d0 06     
__e7b2:     lda #$a4           ; $e7b2: a9 a4     
            sta $04            ; $e7b4: 85 04     
            lda #$00           ; $e7b6: a9 00     
__e7b8:     sta $0d            ; $e7b8: 85 0d     
            ldx $0f            ; $e7ba: a6 0f     
            lda __d78b,x       ; $e7bc: bd 8b d7  
            sta $01            ; $e7bf: 85 01     
            lda __d794,x       ; $e7c1: bd 94 d7  
            sta $00            ; $e7c4: 85 00     
            ldy #$00           ; $e7c6: a0 00     
            sty $066c          ; $e7c8: 8c 6c 06  
__e7cb:     lda #$86           ; $e7cb: a9 86     
            sta $0602,y        ; $e7cd: 99 02 06  
            lda $00            ; $e7d0: a5 00     
            sta $0601,y        ; $e7d2: 99 01 06  
            lda $01            ; $e7d5: a5 01     
            sta $0600,y        ; $e7d7: 99 00 06  
            inc $00            ; $e7da: e6 00     
            ldx $0d            ; $e7dc: a6 0d     
            beq __e7e7         ; $e7de: f0 07     
            lda __e790,x       ; $e7e0: bd 90 e7  
            sta $04            ; $e7e3: 85 04     
            inc $0d            ; $e7e5: e6 0d     
__e7e7:     ldx #$06           ; $e7e7: a2 06     
            iny                ; $e7e9: c8        
            iny                ; $e7ea: c8        
            iny                ; $e7eb: c8        
            cpy #$30           ; $e7ec: c0 30     
            bne __e7f7         ; $e7ee: d0 07     
            lda $00            ; $e7f0: a5 00     
            clc                ; $e7f2: 18        
            adc #$14           ; $e7f3: 69 14     
            sta $00            ; $e7f5: 85 00     
__e7f7:     lda $04            ; $e7f7: a5 04     
            sta $0600,y        ; $e7f9: 99 00 06  
            inc $04            ; $e7fc: e6 04     
            iny                ; $e7fe: c8        
            cpy #$6c           ; $e7ff: c0 6c     
            beq __e80d         ; $e801: f0 0a     
            dex                ; $e803: ca        
            bne __e7f7         ; $e804: d0 f1     
            lda #$eb           ; $e806: a9 eb     
            sta $05ff,y        ; $e808: 99 ff 05  
            bne __e7cb         ; $e80b: d0 be     
__e80d:     lda $0f            ; $e80d: a5 0f     
            asl                ; $e80f: 0a        
            clc                ; $e810: 18        
            adc #$ea           ; $e811: 69 ea     
            ldy #$03           ; $e813: a0 03     
__e815:     cpy #$01           ; $e815: c0 01     
            bne __e81c         ; $e817: d0 03     
            clc                ; $e819: 18        
            adc #$01           ; $e81a: 69 01     
__e81c:     ldx __e78d,y       ; $e81c: be 8d e7  
            sta $0600,x        ; $e81f: 9d 00 06  
            dey                ; $e822: 88        
            bpl __e815         ; $e823: 10 f0     
            lda $0f            ; $e825: a5 0f     
            cmp #$06           ; $e827: c9 06     
            bpl __e875         ; $e829: 10 4a     
            ldy #$08           ; $e82b: a0 08     
            cmp #$03           ; $e82d: c9 03     
            bpl __e833         ; $e82f: 10 02     
            ldy #$10           ; $e831: a0 10     
__e833:     sty $0a            ; $e833: 84 0a     
            ldx #$05           ; $e835: a2 05     
__e837:     ldy $0a            ; $e837: a4 0a     
            lda #$38           ; $e839: a9 38     
            sta $06            ; $e83b: 85 06     
            sta $07            ; $e83d: 85 07     
            sta $08            ; $e83f: 85 08     
            sta $09            ; $e841: 85 09     
__e843:     ror $06            ; $e843: 66 06     
            ror $07            ; $e845: 66 07     
            ror $0639,x        ; $e847: 7e 39 06  
            ror $0642,x        ; $e84a: 7e 42 06  
            ror $064b,x        ; $e84d: 7e 4b 06  
            ror $0654,x        ; $e850: 7e 54 06  
            ror $065d,x        ; $e853: 7e 5d 06  
            ror $0666,x        ; $e856: 7e 66 06  
            rol $08            ; $e859: 26 08     
            rol $09            ; $e85b: 26 09     
            rol $0630,x        ; $e85d: 3e 30 06  
            rol $0627,x        ; $e860: 3e 27 06  
            rol $061e,x        ; $e863: 3e 1e 06  
            rol $0615,x        ; $e866: 3e 15 06  
            rol $060c,x        ; $e869: 3e 0c 06  
            rol $0603,x        ; $e86c: 3e 03 06  
            dey                ; $e86f: 88        
            bne __e843         ; $e870: d0 d1     
            dex                ; $e872: ca        
            bpl __e837         ; $e873: 10 c2     
__e875:     ldx #$09           ; $e875: a2 09     
            jsr __c150         ; $e877: 20 50 c1  
            dec $0f            ; $e87a: c6 0f     
            beq __e88b         ; $e87c: f0 0d     
            jmp __e7a1         ; $e87e: 4c a1 e7  

;-------------------------------------------------------------------------------
__e881:     lda $01            ; $e881: a5 01     
            sta $02a3,y        ; $e883: 99 a3 02  
            clc                ; $e886: 18        
            adc #$08           ; $e887: 69 08     
            sta $01            ; $e889: 85 01     
__e88b:     rts                ; $e88b: 60        

;-------------------------------------------------------------------------------
            .hex ff            ; $e88c: ff        Suspected data
__e88d:     brk                ; $e88d: 00        
            .hex 05            ; $e88e: 05        Suspected data
__e88f:     ldx #$01           ; $e88f: a2 01     
__e891:     lda $22,x          ; $e891: b5 22     
            bne __e8ab         ; $e893: d0 16     
            lda $20,x          ; $e895: b5 20     
            bmi __e8ab         ; $e897: 30 12     
            ldy __e88d,x       ; $e899: bc 8d e8  
            lda $0361,y        ; $e89c: b9 61 03  
            beq __e8ab         ; $e89f: f0 0a     
            lda $56            ; $e8a1: a5 56     
            cmp #$04           ; $e8a3: c9 04     
            bne __e8ab         ; $e8a5: d0 04     
            sta $22,x          ; $e8a7: 95 22     
            inc $20,x          ; $e8a9: f6 20     
__e8ab:     dex                ; $e8ab: ca        
            bpl __e891         ; $e8ac: 10 e3     
__e8ae:     rts                ; $e8ae: 60        

;-------------------------------------------------------------------------------
            and ($67,x)        ; $e8af: 21 67     
            .hex 07 38         ; $e8b1: 07 38     Invalid Opcode - SLO $38
            sec                ; $e8b3: 38        
            brk                ; $e8b4: 00        
            brk                ; $e8b5: 00        
            .hex 5c 38 00      ; $e8b6: 5c 38 00  Bad Addr Mode - NOP $0038,x
            and ($75,x)        ; $e8b9: 21 75     
            .hex 07 38         ; $e8bb: 07 38     Invalid Opcode - SLO $38
            sec                ; $e8bd: 38        
            brk                ; $e8be: 00        
            brk                ; $e8bf: 00        
            .hex 5c 38 00      ; $e8c0: 5c 38 00  Bad Addr Mode - NOP $0038,x
__e8c3:     brk                ; $e8c3: 00        
            bit $27            ; $e8c4: 24 27     
            .hex 24            ; $e8c6: 24        Suspected data
__e8c7:     .hex 27 60         ; $e8c7: 27 60     Invalid Opcode - RLA $60
            .hex 6e 81         ; $e8c9: 6e 81     Suspected data
__e8cb:     .hex 97            ; $e8cb: 97        Suspected data
__e8cc:     .hex 52            ; $e8cc: 52        Invalid Opcode - KIL 
            .hex ac e0         ; $e8cd: ac e0     Suspected data
__e8cf:     asl                ; $e8cf: 0a        
            .hex 13 08         ; $e8d0: 13 08     Invalid Opcode - SLO ($08),y
            ora $1b,x          ; $e8d2: 15 1b     
__e8d4:     ora ($00,x)        ; $e8d4: 01 00     
__e8d6:     plp                ; $e8d6: 28        
            bvc __e8dd         ; $e8d7: 50 04     
__e8d9:     php                ; $e8d9: 08        
            brk                ; $e8da: 00        
            brk                ; $e8db: 00        
            brk                ; $e8dc: 00        
__e8dd:     brk                ; $e8dd: 00        
__e8de:     .hex 03 05         ; $e8de: 03 05     Invalid Opcode - SLO ($05,x)
            asl $07            ; $e8e0: 06 07     
            php                ; $e8e2: 08        
            asl                ; $e8e3: 0a        
            .hex 14 1e         ; $e8e4: 14 1e     Invalid Opcode - NOP $1e,x
            plp                ; $e8e6: 28        
            .hex 32            ; $e8e7: 32        Invalid Opcode - KIL 
__e8e8:     asl $3c32,x        ; $e8e8: 1e 32 3c  
            lsr $50            ; $e8eb: 46 50     
            ora ($02,x)        ; $e8ed: 01 02     
            .hex 03 04         ; $e8ef: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 05            ; $e8f1: 05        Suspected data
__e8f2:     lda $34            ; $e8f2: a5 34     
            bne __e903         ; $e8f4: d0 0d     
            ldy $03a3          ; $e8f6: ac a3 03  
            beq __e900         ; $e8f9: f0 05     
            lda $50            ; $e8fb: a5 50     
            lsr                ; $e8fd: 4a        
            bcc __e91a         ; $e8fe: 90 1a     
__e900:     jmp __e9ce         ; $e900: 4c ce e9  

;-------------------------------------------------------------------------------
__e903:     ldy $03a3          ; $e903: ac a3 03  
            beq __e90c         ; $e906: f0 04     
            cmp #$31           ; $e908: c9 31     
            beq __e90f         ; $e90a: f0 03     
__e90c:     jmp __ea35         ; $e90c: 4c 35 ea  

;-------------------------------------------------------------------------------
__e90f:     ldx #$09           ; $e90f: a2 09     
__e911:     lda $0360,x        ; $e911: bd 60 03  
            sta $038f,x        ; $e914: 9d 8f 03  
            dex                ; $e917: ca        
            bpl __e911         ; $e918: 10 f7     
__e91a:     ldx #$15           ; $e91a: a2 15     
__e91c:     lda __e8ae,x       ; $e91c: bd ae e8  
            sta $0300,x        ; $e91f: 9d 00 03  
            dex                ; $e922: ca        
            bne __e91c         ; $e923: d0 f7     
__e925:     ldy $03a3          ; $e925: ac a3 03  
__e928:     beq __e947         ; $e928: f0 1d     
            lda $0302,x        ; $e92a: bd 02 03  
            clc                ; $e92d: 18        
            adc #$40           ; $e92e: 69 40     
            sta $0302,x        ; $e930: 9d 02 03  
            lda $0301,x        ; $e933: bd 01 03  
            adc #$00           ; $e936: 69 00     
            sta $0301,x        ; $e938: 9d 01 03  
            dey                ; $e93b: 88        
            bne __e928         ; $e93c: d0 ea     
            txa                ; $e93e: 8a        
            clc                ; $e93f: 18        
            adc #$0a           ; $e940: 69 0a     
            tax                ; $e942: aa        
            cpx #$0b           ; $e943: e0 0b     
            bcc __e925         ; $e945: 90 de     
__e947:     ldy $03a3          ; $e947: ac a3 03  
            ldx #$00           ; $e94a: a2 00     
__e94c:     tya                ; $e94c: 98        
            pha                ; $e94d: 48        
            lda $0399,y        ; $e94e: b9 99 03  
            jsr __ea4a         ; $e951: 20 4a ea  
            sta $030a,x        ; $e954: 9d 0a 03  
            tya                ; $e957: 98        
            sta $0309,x        ; $e958: 9d 09 03  
            jsr __ea5c         ; $e95b: 20 5c ea  
            pla                ; $e95e: 68        
            tay                ; $e95f: a8        
            lda $0399,y        ; $e960: b9 99 03  
            cmp $038f,y        ; $e963: d9 8f 03  
            beq __e974         ; $e966: f0 0c     
            cmp #$63           ; $e968: c9 63     
            bcs __e974         ; $e96a: b0 08     
            lda $0399,y        ; $e96c: b9 99 03  
            adc #$01           ; $e96f: 69 01     
            sta $0399,y        ; $e971: 99 99 03  
__e974:     iny                ; $e974: c8        
            iny                ; $e975: c8        
            iny                ; $e976: c8        
            iny                ; $e977: c8        
            iny                ; $e978: c8        
            txa                ; $e979: 8a        
            clc                ; $e97a: 18        
            adc #$0a           ; $e97b: 69 0a     
            tax                ; $e97d: aa        
            cpx #$0b           ; $e97e: e0 0b     
            bcc __e94c         ; $e980: 90 ca     
            ldx $58            ; $e982: a6 58     
            bne __e989         ; $e984: d0 03     
            stx $030b          ; $e986: 8e 0b 03  
__e989:     ldy $03a3          ; $e989: ac a3 03  
            dey                ; $e98c: 88        
            bne __e999         ; $e98d: d0 0a     
            lda $20            ; $e98f: a5 20     
            cmp #$80           ; $e991: c9 80     
            bne __e999         ; $e993: d0 04     
            sty $0301          ; $e995: 8c 01 03  
            rts                ; $e998: 60        

;-------------------------------------------------------------------------------
__e999:     txa                ; $e999: 8a        
            stx $06            ; $e99a: 86 06     
            pha                ; $e99c: 48        
            ldx $03a3          ; $e99d: ae a3 03  
            lda __e8cb,x       ; $e9a0: bd cb e8  
            cpx #$01           ; $e9a3: e0 01     
            bne __e9aa         ; $e9a5: d0 03     
            lda $05fe          ; $e9a7: ad fe 05  
__e9aa:     sta $02            ; $e9aa: 85 02     
            lda __e8c7,x       ; $e9ac: bd c7 e8  
            sta $01            ; $e9af: 85 01     
            sta $0e            ; $e9b1: 85 0e     
            lda __e8cf,x       ; $e9b3: bd cf e8  
            clc                ; $e9b6: 18        
            adc $06            ; $e9b7: 65 06     
            tay                ; $e9b9: a8        
            lda __e8c3,x       ; $e9ba: bd c3 e8  
            ldx $06            ; $e9bd: a6 06     
            beq __e9c3         ; $e9bf: f0 02     
            adc #$70           ; $e9c1: 69 70     
__e9c3:     sta $00            ; $e9c3: 85 00     
__e9c5:     jsr __eafc         ; $e9c5: 20 fc ea  
            pla                ; $e9c8: 68        
            tax                ; $e9c9: aa        
            dex                ; $e9ca: ca        
            bpl __e999         ; $e9cb: 10 cc     
            rts                ; $e9cd: 60        

;-------------------------------------------------------------------------------
__e9ce:     lda $0360,y        ; $e9ce: b9 60 03  
            ora $0365,y        ; $e9d1: 19 65 03  
            beq __ea3a         ; $e9d4: f0 64     
            lda $58            ; $e9d6: a5 58     
            sta $0e            ; $e9d8: 85 0e     
            tya                ; $e9da: 98        
            tax                ; $e9db: aa        
            pha                ; $e9dc: 48        
            lda $0360,x        ; $e9dd: bd 60 03  
            beq __ea26         ; $e9e0: f0 44     
            dec $0360,x        ; $e9e2: de 60 03  
            lda __e8d9,y       ; $e9e5: b9 d9 e8  
            cpy #$01           ; $e9e8: c0 01     
            bne __e9f5         ; $e9ea: d0 09     
            jsr __ea8e         ; $e9ec: 20 8e ea  
            cpy #$05           ; $e9ef: c0 05     
            bcc __e9f5         ; $e9f1: 90 02     
            lda #$08           ; $e9f3: a9 08     
__e9f5:     cpx #$05           ; $e9f5: e0 05     
            adc #$00           ; $e9f7: 69 00     
            sta $01            ; $e9f9: 85 01     
            ldy $03a3          ; $e9fb: ac a3 03  
            lda __e8d4,y       ; $e9fe: b9 d4 e8  
            ldx $03a3          ; $ea01: ae a3 03  
            cpx #$04           ; $ea04: e0 04     
            beq __ea14         ; $ea06: f0 0c     
            cpx #$01           ; $ea08: e0 01     
            bne __ea17         ; $ea0a: d0 0b     
            jsr __ea8e         ; $ea0c: 20 8e ea  
            lda __e8e8,y       ; $ea0f: b9 e8 e8  
            bne __ea17         ; $ea12: d0 03     
__ea14:     jsr __ea97         ; $ea14: 20 97 ea  
__ea17:     jsr __ea4a         ; $ea17: 20 4a ea  
            sta $00            ; $ea1a: 85 00     
            tya                ; $ea1c: 98        
            asl                ; $ea1d: 0a        
            asl                ; $ea1e: 0a        
            asl                ; $ea1f: 0a        
            asl                ; $ea20: 0a        
            adc $00            ; $ea21: 65 00     
            jsr __c94e         ; $ea23: 20 4e c9  
__ea26:     ldy $03a3          ; $ea26: ac a3 03  
            pla                ; $ea29: 68        
            clc                ; $ea2a: 18        
            adc #$05           ; $ea2b: 69 05     
            dec $0e            ; $ea2d: c6 0e     
            .hex 10            ; $ea2f: 10        Suspected data
__ea30:     tax                ; $ea30: aa        
            lda #$08           ; $ea31: a9 08     
__ea33:     sta $fe            ; $ea33: 85 fe     
__ea35:     lda $58            ; $ea35: a5 58     
            jmp __c8e0         ; $ea37: 4c e0 c8  

;-------------------------------------------------------------------------------
__ea3a:     cpy #$04           ; $ea3a: c0 04     
            bcc __ea42         ; $ea3c: 90 04     
            ldx #$10           ; $ea3e: a2 10     
            stx $45            ; $ea40: 86 45     
__ea42:     inc $03a3          ; $ea42: ee a3 03  
            lda #$40           ; $ea45: a9 40     
            sta $34            ; $ea47: 85 34     
__ea49:     rts                ; $ea49: 60        

;-------------------------------------------------------------------------------
__ea4a:     ldy #$00           ; $ea4a: a0 00     
__ea4c:     cmp #$0a           ; $ea4c: c9 0a     
            bcc __ea49         ; $ea4e: 90 f9     
            sbc #$0a           ; $ea50: e9 0a     
            iny                ; $ea52: c8        
            bne __ea4c         ; $ea53: d0 f7     
__ea55:     jsr __ea8e         ; $ea55: 20 8e ea  
            lda __e8de,y       ; $ea58: b9 de e8  
            rts                ; $ea5b: 60        

;-------------------------------------------------------------------------------
__ea5c:     ldy $03a3          ; $ea5c: ac a3 03  
            cpy #$01           ; $ea5f: c0 01     
            beq __ea6e         ; $ea61: f0 0b     
            cpy #$04           ; $ea63: c0 04     
            beq __ea7e         ; $ea65: f0 17     
            lda __e8d6,y       ; $ea67: b9 d6 e8  
            sta $0305,x        ; $ea6a: 9d 05 03  
            rts                ; $ea6d: 60        

;-------------------------------------------------------------------------------
__ea6e:     jsr __ea55         ; $ea6e: 20 55 ea  
            jsr __ea4a         ; $ea71: 20 4a ea  
            sta $0305,x        ; $ea74: 9d 05 03  
            tya                ; $ea77: 98        
            beq __ea7d         ; $ea78: f0 03     
            sta $0304,x        ; $ea7a: 9d 04 03  
__ea7d:     rts                ; $ea7d: 60        

;-------------------------------------------------------------------------------
__ea7e:     jsr __ea97         ; $ea7e: 20 97 ea  
            jsr __ea4a         ; $ea81: 20 4a ea  
            sta $0306,x        ; $ea84: 9d 06 03  
            tya                ; $ea87: 98        
            beq __ea8d         ; $ea88: f0 03     
            sta $0305,x        ; $ea8a: 9d 05 03  
__ea8d:     rts                ; $ea8d: 60        

;-------------------------------------------------------------------------------
__ea8e:     ldy $56            ; $ea8e: a4 56     
            cpy #$0a           ; $ea90: c0 0a     
            bcc __ea96         ; $ea92: 90 02     
            ldy #$09           ; $ea94: a0 09     
__ea96:     rts                ; $ea96: 60        

;-------------------------------------------------------------------------------
__ea97:     ldy $59            ; $ea97: a4 59     
            iny                ; $ea99: c8        
            tya                ; $ea9a: 98        
            cmp #$21           ; $ea9b: c9 21     
            bcc __eaa1         ; $ea9d: 90 02     
            sbc #$20           ; $ea9f: e9 20     
__eaa1:     rts                ; $eaa1: 60        

;-------------------------------------------------------------------------------
__eaa2:     brk                ; $eaa2: 00        
            bit $60            ; $eaa3: 24 60     
            rti                ; $eaa5: 40        

;-------------------------------------------------------------------------------
            bvs __ea30         ; $eaa6: 70 88     
            ldy #$80           ; $eaa8: a0 80     
            tya                ; $eaaa: 98        
            bcs __eac9         ; $eaab: b0 1c     
            jsr $40e0          ; $eaad: 20 e0 40  
            rts                ; $eab0: 60        

;-------------------------------------------------------------------------------
            bvs __ea33         ; $eab1: 70 80     
            bcc __ea55         ; $eab3: 90 a0     
            bcs __eb13         ; $eab5: b0 5c     
            jmp ($407c)        ; $eab7: 6c 7c 40  

;-------------------------------------------------------------------------------
            pha                ; $eaba: 48        
            bvc __ead9         ; $eabb: 50 1c     
            .hex 20 00         ; $eabd: 20 00     Suspected data
__eabf:     jsr $5500          ; $eabf: 20 00 55  
            eor $55,x          ; $eac2: 55 55     
            brk                ; $eac4: 00        
            brk                ; $eac5: 00        
            brk                ; $eac6: 00        
            tax                ; $eac7: aa        
            tax                ; $eac8: aa        
__eac9:     tax                ; $eac9: aa        
            brk                ; $eaca: 00        
            eor $ff,x          ; $eacb: 55 ff     
            tax                ; $eacd: aa        
            .hex ff ff ff      ; $eace: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ead1: ff ff ff  Invalid Opcode - ISC $ffff,x
            eor $55,x          ; $ead4: 55 55     
            eor $aa,x          ; $ead6: 55 aa     
            tax                ; $ead8: aa        
__ead9:     tax                ; $ead9: aa        
            tax                ; $eada: aa        
            tax                ; $eadb: aa        
            brk                ; $eadc: 00        
__eadd:     eor $32,x          ; $eadd: 55 32     
            .hex 32            ; $eadf: 32        Invalid Opcode - KIL 
            .hex 22            ; $eae0: 22        Invalid Opcode - KIL 
            .hex 42            ; $eae1: 42        Invalid Opcode - KIL 
            .hex 22            ; $eae2: 22        Invalid Opcode - KIL 
            .hex 22            ; $eae3: 22        Invalid Opcode - KIL 
            .hex 22            ; $eae4: 22        Invalid Opcode - KIL 
            and ($21,x)        ; $eae5: 21 21     
            and ($11,x)        ; $eae7: 21 11     
            ora ($22),y        ; $eae9: 11 22     
            bit $22            ; $eaeb: 24 22     
            .hex 22            ; $eaed: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaee: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaef: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaf0: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaf1: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaf2: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaf3: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaf4: 22        Invalid Opcode - KIL 
            and ($21,x)        ; $eaf5: 21 21     
            and ($11,x)        ; $eaf7: 21 11     
            ora ($24),y        ; $eaf9: 11 24     
            .hex 24            ; $eafb: 24        Suspected data
__eafc:     sty $09            ; $eafc: 84 09     
            lda __eaa1,y       ; $eafe: b9 a1 ea  
            sta $04            ; $eb01: 85 04     
            lda __eabf,y       ; $eb03: b9 bf ea  
            sta $0a            ; $eb06: 85 0a     
            sta $0b            ; $eb08: 85 0b     
            sta $0c            ; $eb0a: 85 0c     
            sta $0d            ; $eb0c: 85 0d     
            lda __eadd,y       ; $eb0e: b9 dd ea  
            .hex 4c 3d         ; $eb11: 4c 3d     Suspected data
__eb13:     .hex c7 06         ; $eb13: c7 06     Invalid Opcode - DCP $06
            asl $04            ; $eb15: 06 04     
            php                ; $eb17: 08        
            .hex 04 04         ; $eb18: 04 04     Invalid Opcode - NOP $04
            .hex 04 02         ; $eb1a: 04 02     Invalid Opcode - NOP $02
            .hex 02            ; $eb1c: 02        Invalid Opcode - KIL 
            .hex 02            ; $eb1d: 02        Invalid Opcode - KIL 
            ora ($01,x)        ; $eb1e: 01 01     
            .hex 04 06         ; $eb20: 04 06     Invalid Opcode - NOP $06
            .hex 04 04         ; $eb22: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $eb24: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $eb26: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $eb28: 04 04     Invalid Opcode - NOP $04
            .hex 04 02         ; $eb2a: 04 02     Invalid Opcode - NOP $02
            .hex 02            ; $eb2c: 02        Invalid Opcode - KIL 
            .hex 02            ; $eb2d: 02        Invalid Opcode - KIL 
__eb2e:     ldx #$0a           ; $eb2e: a2 0a     
__eb30:     lda $03e8,x        ; $eb30: bd e8 03  
            beq __eb68         ; $eb33: f0 33     
            pha                ; $eb35: 48        
            and #$1f           ; $eb36: 29 1f     
            beq __eb62         ; $eb38: f0 28     
            tay                ; $eb3a: a8        
            pla                ; $eb3b: 68        
            bmi __eb6c         ; $eb3c: 30 2e     
            and #$40           ; $eb3e: 29 40     
            sta $0e            ; $eb40: 85 0e     
            lda $9c,x          ; $eb42: b5 9c     
            sta $00            ; $eb44: 85 00     
            lda $a7,x          ; $eb46: b5 a7     
            sta $01            ; $eb48: 85 01     
            lda $03dd,x        ; $eb4a: bd dd 03  
            sta $02            ; $eb4d: 85 02     
            lda $bd,x          ; $eb4f: b5 bd     
            bpl __eb56         ; $eb51: 10 03     
            lda #$00           ; $eb53: a9 00     
            .hex 2c            ; $eb55: 2c        Suspected data
__eb56:     lda #$01           ; $eb56: a9 01     
            sta $0f            ; $eb58: 85 0f     
            txa                ; $eb5a: 8a        
            pha                ; $eb5b: 48        
            jsr __eafc         ; $eb5c: 20 fc ea  
__eb5f:     pla                ; $eb5f: 68        
            tax                ; $eb60: aa        
            .hex 24            ; $eb61: 24        Suspected data
__eb62:     pla                ; $eb62: 68        
            lda #$00           ; $eb63: a9 00     
            sta $03e8,x        ; $eb65: 9d e8 03  
__eb68:     dex                ; $eb68: ca        
            bpl __eb30         ; $eb69: 10 c5     
__eb6b:     rts                ; $eb6b: 60        

;-------------------------------------------------------------------------------
__eb6c:     lda #$00           ; $eb6c: a9 00     
            sta $91,x          ; $eb6e: 95 91     
            txa                ; $eb70: 8a        
            pha                ; $eb71: 48        
            lda __eb13,y       ; $eb72: b9 13 eb  
            tax                ; $eb75: aa        
            lda __eaa1,y       ; $eb76: b9 a1 ea  
            jsr __c821         ; $eb79: 20 21 c8  
            jmp __eb5f         ; $eb7c: 4c 5f eb  

;-------------------------------------------------------------------------------
__eb7f:     ldx #$00           ; $eb7f: a2 00     
            jsr __eb8a         ; $eb81: 20 8a eb  
            lda $58            ; $eb84: a5 58     
            beq __eb6b         ; $eb86: f0 e3     
            ldx #$01           ; $eb88: a2 01     
__eb8a:     lda $5a,x          ; $eb8a: b5 5a     
            bne __eb6b         ; $eb8c: d0 dd     
            lda $20,x          ; $eb8e: b5 20     
            bmi __eb6b         ; $eb90: 30 d9     
            txa                ; $eb92: 8a        
            pha                ; $eb93: 48        
            asl                ; $eb94: 0a        
            asl                ; $eb95: 0a        
            tay                ; $eb96: a8        
            lda #$f8           ; $eb97: a9 f8     
            sta $021c,y        ; $eb99: 99 1c 02  
            lda __eaa2,x       ; $eb9c: bd a2 ea  
            ldx #$06           ; $eb9f: a2 06     
            jsr __c821         ; $eba1: 20 21 c8  
            pla                ; $eba4: 68        
            tax                ; $eba5: aa        
            lda $3f,x          ; $eba6: b5 3f     
            bne __eb6b         ; $eba8: d0 c1     
            jsr __cfeb         ; $ebaa: 20 eb cf  
            sta $e0,x          ; $ebad: 95 e0     
            sta $80,x          ; $ebaf: 95 80     
            sta $86,x          ; $ebb1: 95 86     
            lda #$00           ; $ebb3: a9 00     
            sta $2f,x          ; $ebb5: 95 2f     
            lda $90            ; $ebb7: a5 90     
            sec                ; $ebb9: 38        
            sbc #$03           ; $ebba: e9 03     
            sta $00            ; $ebbc: 85 00     
            lda $0382,x        ; $ebbe: bd 82 03  
            cmp $90            ; $ebc1: c5 90     
            bcs __ebce         ; $ebc3: b0 09     
            cmp $00            ; $ebc5: c5 00     
            bcs __ebd3         ; $ebc7: b0 0a     
            lda $00            ; $ebc9: a5 00     
            jmp __ebd3         ; $ebcb: 4c d3 eb  

;-------------------------------------------------------------------------------
__ebce:     lda $00            ; $ebce: a5 00     
            clc                ; $ebd0: 18        
            adc #$02           ; $ebd1: 69 02     
__ebd3:     cmp $0786          ; $ebd3: cd 86 07  
            beq __ebdd         ; $ebd6: f0 05     
            cmp $0787          ; $ebd8: cd 87 07  
            bne __ebe9         ; $ebdb: d0 0c     
__ebdd:     sec                ; $ebdd: 38        
            sbc #$01           ; $ebde: e9 01     
            cmp $00            ; $ebe0: c5 00     
            bcs __ebd3         ; $ebe2: b0 ef     
            adc #$03           ; $ebe4: 69 03     
            jmp __ebd3         ; $ebe6: 4c d3 eb  

;-------------------------------------------------------------------------------
__ebe9:     sta $5a,x          ; $ebe9: 95 5a     
            jsr __edd5         ; $ebeb: 20 d5 ed  
            sec                ; $ebee: 38        
            sbc #$08           ; $ebef: e9 08     
            sta $66,x          ; $ebf1: 95 66     
            lda $5a,x          ; $ebf3: b5 5a     
            sta $0f            ; $ebf5: 85 0f     
            lda $64,x          ; $ebf7: b5 64     
            clc                ; $ebf9: 18        
            adc #$08           ; $ebfa: 69 08     
            sta $0e            ; $ebfc: 85 0e     
__ebfe:     jsr __deb9         ; $ebfe: 20 b9 de  
            bmi __ec07         ; $ec01: 30 04     
            cmp #$03           ; $ec03: c9 03     
            bne __ec12         ; $ec05: d0 0b     
__ec07:     lda $0e            ; $ec07: a5 0e     
            clc                ; $ec09: 18        
            adc #$08           ; $ec0a: 69 08     
            sta $0e            ; $ec0c: 85 0e     
            cmp #$e0           ; $ec0e: c9 e0     
            bcc __ebfe         ; $ec10: 90 ec     
__ec12:     lda $0e            ; $ec12: a5 0e     
            sec                ; $ec14: 38        
            sbc #$08           ; $ec15: e9 08     
            sta $64,x          ; $ec17: 95 64     
            lda #$01           ; $ec19: a9 01     
            sta $2d,x          ; $ec1b: 95 2d     
            jsr __d0b8         ; $ec1d: 20 b8 d0  
            jmp __d8fd         ; $ec20: 4c fd d8  

;-------------------------------------------------------------------------------
__ec23:     ldx #$00           ; $ec23: a2 00     
            jsr __ec2a         ; $ec25: 20 2a ec  
            ldx #$01           ; $ec28: a2 01     
__ec2a:     lda $2d,x          ; $ec2a: b5 2d     
            beq __ec50         ; $ec2c: f0 22     
            lda $20,x          ; $ec2e: b5 20     
            bmi __ec50         ; $ec30: 30 1e     
            txa                ; $ec32: 8a        
            asl                ; $ec33: 0a        
            tay                ; $ec34: a8        
            lda $0014,y        ; $ec35: b9 14 00  
            ora $70,x          ; $ec38: 15 70     
            and #$cf           ; $ec3a: 29 cf     
            beq __ec42         ; $ec3c: f0 04     
            lda #$00           ; $ec3e: a9 00     
            sta $2d,x          ; $ec40: 95 2d     
__ec42:     lda $50            ; $ec42: a5 50     
            and #$01           ; $ec44: 29 01     
            beq __ec50         ; $ec46: f0 08     
            lda __eaa2,x       ; $ec48: bd a2 ea  
            ldx #$06           ; $ec4b: a2 06     
            jmp __c821         ; $ec4d: 4c 21 c8  

;-------------------------------------------------------------------------------
__ec50:     rts                ; $ec50: 60        

;-------------------------------------------------------------------------------
__ec51:     ldx #$07           ; $ec51: a2 07     
__ec53:     lda $91,x          ; $ec53: b5 91     
            beq __ec74         ; $ec55: f0 1d     
            lda $a7,x          ; $ec57: b5 a7     
            cpx #$00           ; $ec59: e0 00     
            bne __ec63         ; $ec5b: d0 06     
            cmp #$f0           ; $ec5d: c9 f0     
            bcc __ec63         ; $ec5f: 90 02     
            lda #$ec           ; $ec61: a9 ec     
__ec63:     clc                ; $ec63: 18        
            adc #$04           ; $ec64: 69 04     
            sta $a7,x          ; $ec66: 95 a7     
            cpx #$00           ; $ec68: e0 00     
            beq __ec74         ; $ec6a: f0 08     
            cmp #$f8           ; $ec6c: c9 f8     
            bcc __ec74         ; $ec6e: 90 04     
            lda #$00           ; $ec70: a9 00     
            sta $91,x          ; $ec72: 95 91     
__ec74:     cpx #$02           ; $ec74: e0 02     
            bcs __ec82         ; $ec76: b0 0a     
            lda $5a,x          ; $ec78: b5 5a     
            beq __ec82         ; $ec7a: f0 06     
            lda $66,x          ; $ec7c: b5 66     
            adc #$04           ; $ec7e: 69 04     
            sta $66,x          ; $ec80: 95 66     
__ec82:     cpx #$03           ; $ec82: e0 03     
            bcs __ec92         ; $ec84: b0 0c     
            lda $af,x          ; $ec86: b5 af     
            beq __ec92         ; $ec88: f0 08     
            cmp #$f0           ; $ec8a: c9 f0     
            bcs __ec92         ; $ec8c: b0 04     
            adc #$04           ; $ec8e: 69 04     
            sta $af,x          ; $ec90: 95 af     
__ec92:     dex                ; $ec92: ca        
            bpl __ec53         ; $ec93: 10 be     
            ldx #$e4           ; $ec95: a2 e4     
            lda $55            ; $ec97: a5 55     
            cmp #$02           ; $ec99: c9 02     
            bne __ec9f         ; $ec9b: d0 02     
            ldx #$fc           ; $ec9d: a2 fc     
__ec9f:     lda $0200,x        ; $ec9f: bd 00 02  
            cmp #$f2           ; $eca2: c9 f2     
            bcc __eca8         ; $eca4: 90 02     
            lda #$f4           ; $eca6: a9 f4     
__eca8:     clc                ; $eca8: 18        
            adc #$04           ; $eca9: 69 04     
            sta $0200,x        ; $ecab: 9d 00 02  
            dex                ; $ecae: ca        
            dex                ; $ecaf: ca        
            dex                ; $ecb0: ca        
            dex                ; $ecb1: ca        
            cpx #$fc           ; $ecb2: e0 fc     
            bne __ec9f         ; $ecb4: d0 e9     
            rts                ; $ecb6: 60        

;-------------------------------------------------------------------------------
__ecb7:     jsr $30f0          ; $ecb7: 20 f0 30  
            ora __f0c0,x       ; $ecba: 1d c0 f0  
            bmi __ecdd         ; $ecbd: 30 1e     
__ecbf:     ldx $58            ; $ecbf: a6 58     
__ecc1:     lda $20,x          ; $ecc1: b5 20     
            bmi __ecc7         ; $ecc3: 30 02     
            lda #$fb           ; $ecc5: a9 fb     
__ecc7:     eor #$ff           ; $ecc7: 49 ff     
            jsr __ecf0         ; $ecc9: 20 f0 ec  
            dex                ; $eccc: ca        
            bpl __ecc1         ; $eccd: 10 f2     
            lda #$fc           ; $eccf: a9 fc     
            cmp $20            ; $ecd1: c5 20     
            bne __ed08         ; $ecd3: d0 33     
            ldy $58            ; $ecd5: a4 58     
            beq __ecdd         ; $ecd7: f0 04     
            cmp $21            ; $ecd9: c5 21     
            bne __ed08         ; $ecdb: d0 2b     
__ecdd:     ldy $43            ; $ecdd: a4 43     
            beq __ed08         ; $ecdf: f0 27     
            dey                ; $ece1: 88        
__ece2:     bne __ed08         ; $ece2: d0 24     
            lda #$80           ; $ece4: a9 80     
            sta $20            ; $ece6: 85 20     
            asl                ; $ece8: 0a        
            .hex 85            ; $ece9: 85        Suspected data
__ecea:     asl $04a9,x        ; $ecea: 1e a9 04  
            jmp __d4f5         ; $eced: 4c f5 d4  

;-------------------------------------------------------------------------------
__ecf0:     jsr __c728         ; $ecf0: 20 28 c7  
            bpl __ece2         ; $ecf3: 10 ed     
            sbc $09ec,x        ; $ecf5: fd ec 09  
            sbc __ed08         ; $ecf8: ed 08 ed  
            bvs __ecea         ; $ecfb: 70 ed     
            jsr __ed51         ; $ecfd: 20 51 ed  
            bcs __ed08         ; $ed00: b0 06     
            lda #$10           ; $ed02: a9 10     
            sta $43            ; $ed04: 85 43     
            dec $20,x          ; $ed06: d6 20     
__ed08:     rts                ; $ed08: 60        

;-------------------------------------------------------------------------------
            ldy $43            ; $ed09: a4 43     
            dey                ; $ed0b: 88        
            bne __ed08         ; $ed0c: d0 fa     
            beq __ed14         ; $ed0e: f0 04     
            lda #$01           ; $ed10: a9 01     
            sta $fc            ; $ed12: 85 fc     
__ed14:     dec $20,x          ; $ed14: d6 20     
            jsr __ed63         ; $ed16: 20 63 ed  
__ed19:     lda __ecb7,y       ; $ed19: b9 b7 ec  
            sta $0358,y        ; $ed1c: 99 58 03  
            iny                ; $ed1f: c8        
            tya                ; $ed20: 98        
            and #$03           ; $ed21: 29 03     
            bne __ed19         ; $ed23: d0 f4     
__ed25:     txa                ; $ed25: 8a        
            pha                ; $ed26: 48        
            jsr __ed63         ; $ed27: 20 63 ed  
            ldx #$00           ; $ed2a: a2 00     
__ed2c:     lda $0358,y        ; $ed2c: b9 58 03  
            sta $00,x          ; $ed2f: 95 00     
            iny                ; $ed31: c8        
            inx                ; $ed32: e8        
            cpx #$04           ; $ed33: e0 04     
            bne __ed2c         ; $ed35: d0 f5     
            ldy #$01           ; $ed37: a0 01     
            sty $0e            ; $ed39: 84 0e     
            dey                ; $ed3b: 88        
            sty $0f            ; $ed3c: 84 0f     
            ldy $03            ; $ed3e: a4 03     
            jsr __eafc         ; $ed40: 20 fc ea  
            ldy #$00           ; $ed43: a0 00     
            pla                ; $ed45: 68        
            tax                ; $ed46: aa        
            beq __ed4b         ; $ed47: f0 02     
            ldy #$20           ; $ed49: a0 20     
__ed4b:     lda #$35           ; $ed4b: a9 35     
            sta $0219,y        ; $ed4d: 99 19 02  
            rts                ; $ed50: 60        

;-------------------------------------------------------------------------------
__ed51:     jsr __ed25         ; $ed51: 20 25 ed  
            jsr __ed63         ; $ed54: 20 63 ed  
            lda $0359,y        ; $ed57: b9 59 03  
            sec                ; $ed5a: 38        
            sbc #$02           ; $ed5b: e9 02     
            sta $0359,y        ; $ed5d: 99 59 03  
            cmp #$30           ; $ed60: c9 30     
            rts                ; $ed62: 60        

;-------------------------------------------------------------------------------
__ed63:     txa                ; $ed63: 8a        
            asl                ; $ed64: 0a        
            asl                ; $ed65: 0a        
            tay                ; $ed66: a8        
            rts                ; $ed67: 60        

;-------------------------------------------------------------------------------
__ed68:     inx                ; $ed68: e8        
            .hex f4            ; $ed69: f4        Suspected data
__ed6a:     brk                ; $ed6a: 00        
            .hex 01            ; $ed6b: 01        Suspected data
__ed6c:     sec                ; $ed6c: 38        
            .hex b0            ; $ed6d: b0        Suspected data
__ed6e:     brk                ; $ed6e: 00        
            .hex 0c a5 55      ; $ed6f: 0c a5 55  Invalid Opcode - NOP $55a5
            cmp #$02           ; $ed72: c9 02     
            beq __edbe         ; $ed74: f0 48     
            txa                ; $ed76: 8a        
            pha                ; $ed77: 48        
            lda __ed68,x       ; $ed78: bd 68 ed  
            ldx #$03           ; $ed7b: a2 03     
            jsr __c821         ; $ed7d: 20 21 c8  
            pla                ; $ed80: 68        
            pha                ; $ed81: 48        
            tax                ; $ed82: aa        
            ldy $20,x          ; $ed83: b4 20     
            dey                ; $ed85: 88        
            bmi __edbc         ; $ed86: 30 34     
            cpy #$03           ; $ed88: c0 03     
            bcc __ed8e         ; $ed8a: 90 02     
            ldy #$02           ; $ed8c: a0 02     
__ed8e:     lda __ed6a,x       ; $ed8e: bd 6a ed  
            sta $02            ; $ed91: 85 02     
            lda __ed6c,x       ; $ed93: bd 6c ed  
            sta $03            ; $ed96: 85 03     
            lda __ed6e,x       ; $ed98: bd 6e ed  
            tax                ; $ed9b: aa        
__ed9c:     lda #$21           ; $ed9c: a9 21     
            sta $02e8,x        ; $ed9e: 9d e8 02  
            lda #$36           ; $eda1: a9 36     
            sta $02e9,x        ; $eda3: 9d e9 02  
            lda $02            ; $eda6: a5 02     
            sta $02ea,x        ; $eda8: 9d ea 02  
            lda $03            ; $edab: a5 03     
            sta $02eb,x        ; $edad: 9d eb 02  
            inx                ; $edb0: e8        
            inx                ; $edb1: e8        
            inx                ; $edb2: e8        
            inx                ; $edb3: e8        
            clc                ; $edb4: 18        
            adc #$08           ; $edb5: 69 08     
            sta $03            ; $edb7: 85 03     
            dey                ; $edb9: 88        
            bpl __ed9c         ; $edba: 10 e0     
__edbc:     pla                ; $edbc: 68        
            tax                ; $edbd: aa        
__edbe:     rts                ; $edbe: 60        

;-------------------------------------------------------------------------------
__edbf:     pha                ; $edbf: 48        
            and #$80           ; $edc0: 29 80     
            lsr                ; $edc2: 4a        
            lsr                ; $edc3: 4a        
            lsr                ; $edc4: 4a        
            sta $00            ; $edc5: 85 00     
            pla                ; $edc7: 68        
            and #$78           ; $edc8: 29 78     
            lsr                ; $edca: 4a        
            lsr                ; $edcb: 4a        
            lsr                ; $edcc: 4a        
            adc $00            ; $edcd: 65 00     
            rts                ; $edcf: 60        

;-------------------------------------------------------------------------------
            lda $5a            ; $edd0: a5 5a     
            bit $5ba5          ; $edd2: 2c a5 5b  
__edd5:     sta $00            ; $edd5: 85 00     
            lda $90            ; $edd7: a5 90     
            sec                ; $edd9: 38        
            sbc $00            ; $edda: e5 00     
            tay                ; $eddc: a8        
            lda #$08           ; $eddd: a9 08     
__eddf:     clc                ; $eddf: 18        
            adc #$30           ; $ede0: 69 30     
            dey                ; $ede2: 88        
            bpl __eddf         ; $ede3: 10 fa     
__ede5:     rts                ; $ede5: 60        

;-------------------------------------------------------------------------------
            brk                ; $ede6: 00        
            ora $05            ; $ede7: 05 05     
            ora $0a            ; $ede9: 05 0a     
__edeb:     asl                ; $edeb: 0a        
            asl                ; $edec: 0a        
__eded:     pla                ; $eded: 68        
            tya                ; $edee: 98        
            iny                ; $edef: c8        
            .hex f0            ; $edf0: f0        Suspected data
__edf1:     clc                ; $edf1: 18        
            jsr $2028          ; $edf2: 20 28 20  
            .hex ff a0 a4      ; $edf5: ff a0 a4  Invalid Opcode - ISC $a4a0,x
            tay                ; $edf8: a8        
            ldy $ff            ; $edf9: a4 ff     
            .hex ac ff         ; $edfb: ac ff     Suspected data
__edfd:     .hex 12            ; $edfd: 12        Invalid Opcode - KIL 
            .hex 14 ff         ; $edfe: 14 ff     Invalid Opcode - NOP $ff,x
__ee00:     inc __ff00,x       ; $ee00: fe 00 ff  
            brk                ; $ee03: 00        
            .hex ff 00 00      ; $ee04: ff 00 00  Bad Addr Mode - ISC $0000,x
            brk                ; $ee07: 00        
            ora ($00,x)        ; $ee08: 01 00     
            ora ($00,x)        ; $ee0a: 01 00     
            .hex 02            ; $ee0c: 02        Invalid Opcode - KIL 
__ee0d:     ldx #$07           ; $ee0d: a2 07     
__ee0f:     cpx #$00           ; $ee0f: e0 00     
            beq __ee54         ; $ee11: f0 41     
            lda $03e8,x        ; $ee13: bd e8 03  
            bmi __ee54         ; $ee16: 30 3c     
            lda $91,x          ; $ee18: b5 91     
            beq __ee54         ; $ee1a: f0 38     
            bpl __ee58         ; $ee1c: 10 3a     
            jsr __ef70         ; $ee1e: 20 70 ef  
            bcc __ee26         ; $ee21: 90 03     
            jsr __ef7b         ; $ee23: 20 7b ef  
__ee26:     jsr __ef56         ; $ee26: 20 56 ef  
            cpx #$01           ; $ee29: e0 01     
            bne __ee31         ; $ee2b: d0 04     
            lda $3d            ; $ee2d: a5 3d     
            beq __ee38         ; $ee2f: f0 07     
__ee31:     lda $9c,x          ; $ee31: b5 9c     
            bne __ee38         ; $ee33: d0 03     
            jmp __eebd         ; $ee35: 4c bd ee  

;-------------------------------------------------------------------------------
__ee38:     jsr __ef8e         ; $ee38: 20 8e ef  
            cmp #$ff           ; $ee3b: c9 ff     
            bne __ee44         ; $ee3d: d0 05     
            lda #$00           ; $ee3f: a9 00     
            sta $03b1,x        ; $ee41: 9d b1 03  
__ee44:     jsr __ef8e         ; $ee44: 20 8e ef  
            sta $03dd,x        ; $ee47: 9d dd 03  
__ee4a:     txa                ; $ee4a: 8a        
            clc                ; $ee4b: 18        
            adc #$03           ; $ee4c: 69 03     
            ora $03e8,x        ; $ee4e: 1d e8 03  
            sta $03e8,x        ; $ee51: 9d e8 03  
__ee54:     dex                ; $ee54: ca        
            bpl __ee0f         ; $ee55: 10 b8     
            rts                ; $ee57: 60        

;-------------------------------------------------------------------------------
__ee58:     cpx #$01           ; $ee58: e0 01     
            beq __eea7         ; $ee5a: f0 4b     
            cmp #$01           ; $ee5c: c9 01     
            bne __eec5         ; $ee5e: d0 65     
            cpx #$05           ; $ee60: e0 05     
            bcs __eeaa         ; $ee62: b0 46     
            lda #$00           ; $ee64: a9 00     
            sta $0382,x        ; $ee66: 9d 82 03  
            inc $03d2,x        ; $ee69: fe d2 03  
            lda $03d2,x        ; $ee6c: bd d2 03  
            and #$07           ; $ee6f: 29 07     
            bne __ee82         ; $ee71: d0 0f     
            jsr __ef4e         ; $ee73: 20 4e ef  
            tay                ; $ee76: a8        
            lda $03d2,x        ; $ee77: bd d2 03  
            and #$0f           ; $ee7a: 29 0f     
            bne __ee82         ; $ee7c: d0 04     
            tya                ; $ee7e: 98        
            sta $03b1,x        ; $ee7f: 9d b1 03  
__ee82:     jsr __ef70         ; $ee82: 20 70 ef  
            bcc __ee8d         ; $ee85: 90 06     
            lda $03b1,x        ; $ee87: bd b1 03  
            jsr __ef7d         ; $ee8a: 20 7d ef  
__ee8d:     lda $9c,x          ; $ee8d: b5 9c     
            beq __eebd         ; $ee8f: f0 2c     
            jsr __ef42         ; $ee91: 20 42 ef  
            bpl __ee9d         ; $ee94: 10 07     
            inc $91,x          ; $ee96: f6 91     
            lda #$00           ; $ee98: a9 00     
            sta $03b1,x        ; $ee9a: 9d b1 03  
__ee9d:     lda #$06           ; $ee9d: a9 06     
            sta $03dd,x        ; $ee9f: 9d dd 03  
__eea2:     jsr __ef6a         ; $eea2: 20 6a ef  
            bne __ee4a         ; $eea5: d0 a3     
__eea7:     jmp __ef06         ; $eea7: 4c 06 ef  

;-------------------------------------------------------------------------------
__eeaa:     lda #$10           ; $eeaa: a9 10     
            sta $03bc,x        ; $eeac: 9d bc 03  
            jsr __ef56         ; $eeaf: 20 56 ef  
            ldy $03b1,x        ; $eeb2: bc b1 03  
            lda __edfd,y       ; $eeb5: b9 fd ed  
            sta $03dd,x        ; $eeb8: 9d dd 03  
            bpl __eec2         ; $eebb: 10 05     
__eebd:     lda #$80           ; $eebd: a9 80     
            sta $03e8,x        ; $eebf: 9d e8 03  
__eec2:     jmp __ee4a         ; $eec2: 4c 4a ee  

;-------------------------------------------------------------------------------
__eec5:     cmp #$02           ; $eec5: c9 02     
            bne __eec2         ; $eec7: d0 f9     
            inc $a7,x          ; $eec9: f6 a7     
            jsr __ef70         ; $eecb: 20 70 ef  
            bcc __ef03         ; $eece: 90 33     
            jsr __ef6a         ; $eed0: 20 6a ef  
            inc $a7,x          ; $eed3: f6 a7     
            lda $90            ; $eed5: a5 90     
            sec                ; $eed7: 38        
            sbc $b2,x          ; $eed8: f5 b2     
            sta $05            ; $eeda: 85 05     
            tay                ; $eedc: a8        
            lda __eded,y       ; $eedd: b9 ed ed  
            cmp $a7,x          ; $eee0: d5 a7     
            bcs __ef03         ; $eee2: b0 1f     
            sta $a7,x          ; $eee4: 95 a7     
            lda $05            ; $eee6: a5 05     
            cmp #$03           ; $eee8: c9 03     
            bcs __eebd         ; $eeea: b0 d1     
            dec $b2,x          ; $eeec: d6 b2     
            jsr __ef42         ; $eeee: 20 42 ef  
            bmi __ef03         ; $eef1: 30 10     
            lda #$01           ; $eef3: a9 01     
            sta $91,x          ; $eef5: 95 91     
            lsr                ; $eef7: 4a        
            sta $03b1,x        ; $eef8: 9d b1 03  
            lda #$ff           ; $eefb: a9 ff     
            sta $03d2,x        ; $eefd: 9d d2 03  
            jsr __ef6a         ; $ef00: 20 6a ef  
__ef03:     jmp __ee9d         ; $ef03: 4c 9d ee  

;-------------------------------------------------------------------------------
__ef06:     cmp #$04           ; $ef06: c9 04     
            beq __eec2         ; $ef08: f0 b8     
            cmp #$05           ; $ef0a: c9 05     
            bne __eec2         ; $ef0c: d0 b4     
            jsr __ef70         ; $ef0e: 20 70 ef  
            bcc __ef19         ; $ef11: 90 06     
            jsr __ef6a         ; $ef13: 20 6a ef  
            jsr __ef7b         ; $ef16: 20 7b ef  
__ef19:     lda $9c,x          ; $ef19: b5 9c     
            beq __eebd         ; $ef1b: f0 a0     
            jsr __ef83         ; $ef1d: 20 83 ef  
            bcc __ef3a         ; $ef20: 90 18     
            lda $03b1,x        ; $ef22: bd b1 03  
            tay                ; $ef25: a8        
            lda __ee00,y       ; $ef26: b9 00 ee  
            clc                ; $ef29: 18        
            adc $a7,x          ; $ef2a: 75 a7     
            sta $a7,x          ; $ef2c: 95 a7     
            inc $03b1,x        ; $ef2e: fe b1 03  
            cpy #$0c           ; $ef31: c0 0c     
            bne __ef3a         ; $ef33: d0 05     
            lda #$00           ; $ef35: a9 00     
            sta $03b1,x        ; $ef37: 9d b1 03  
__ef3a:     lda #$98           ; $ef3a: a9 98     
            sta $03dd,x        ; $ef3c: 9d dd 03  
            jmp __eea2         ; $ef3f: 4c a2 ee  

;-------------------------------------------------------------------------------
__ef42:     lda $9c,x          ; $ef42: b5 9c     
            clc                ; $ef44: 18        
            adc #$08           ; $ef45: 69 08     
__ef47:     sta $0e            ; $ef47: 85 0e     
            stx $0f            ; $ef49: 86 0f     
            jmp __deb2         ; $ef4b: 4c b2 de  

;-------------------------------------------------------------------------------
__ef4e:     lda $bd,x          ; $ef4e: b5 bd     
            jsr __d2fb         ; $ef50: 20 fb d2  
            sta $bd,x          ; $ef53: 95 bd     
            rts                ; $ef55: 60        

;-------------------------------------------------------------------------------
__ef56:     lda $03d2,x        ; $ef56: bd d2 03  
            cmp #$ff           ; $ef59: c9 ff     
            bne __ef62         ; $ef5b: d0 05     
            inc $03d2,x        ; $ef5d: fe d2 03  
            beq __ef6a         ; $ef60: f0 08     
__ef62:     jsr __ef83         ; $ef62: 20 83 ef  
            bcc __ef6f         ; $ef65: 90 08     
            inc $03b1,x        ; $ef67: fe b1 03  
__ef6a:     lda #$40           ; $ef6a: a9 40     
            sta $03e8,x        ; $ef6c: 9d e8 03  
__ef6f:     rts                ; $ef6f: 60        

;-------------------------------------------------------------------------------
__ef70:     lda $03a6,x        ; $ef70: bd a6 03  
            clc                ; $ef73: 18        
            adc $03c7,x        ; $ef74: 7d c7 03  
            sta $03c7,x        ; $ef77: 9d c7 03  
            rts                ; $ef7a: 60        

;-------------------------------------------------------------------------------
__ef7b:     lda $bd,x          ; $ef7b: b5 bd     
__ef7d:     clc                ; $ef7d: 18        
            adc $9c,x          ; $ef7e: 75 9c     
            sta $9c,x          ; $ef80: 95 9c     
            rts                ; $ef82: 60        

;-------------------------------------------------------------------------------
__ef83:     .hex bd            ; $ef83: bd        Suspected data
__ef84:     ldy $1803,x        ; $ef84: bc 03 18  
            adc $03d2,x        ; $ef87: 7d d2 03  
            sta $03d2,x        ; $ef8a: 9d d2 03  
            rts                ; $ef8d: 60        

;-------------------------------------------------------------------------------
__ef8e:     lda $03b1,x        ; $ef8e: bd b1 03  
            clc                ; $ef91: 18        
            adc __ede5,x       ; $ef92: 7d e5 ed  
            tay                ; $ef95: a8        
            lda __edf1,y       ; $ef96: b9 f1 ed  
            rts                ; $ef99: 60        

;-------------------------------------------------------------------------------
__ef9a:     ldy $dc            ; $ef9a: a4 dc     
            dey                ; $ef9c: 88        
            dey                ; $ef9d: 88        
            bmi __efb7         ; $ef9e: 30 17     
            bne __efa8         ; $efa0: d0 06     
            lda #$18           ; $efa2: a9 18     
            sta $dd            ; $efa4: 85 dd     
            inc $dc            ; $efa6: e6 dc     
__efa8:     inc $a8            ; $efa8: e6 a8     
            inc $a8            ; $efaa: e6 a8     
            dec $dd            ; $efac: c6 dd     
            .hex d0            ; $efae: d0        Suspected data
__efaf:     asl $a9            ; $efaf: 06 a9     
            brk                ; $efb1: 00        
            sta $dc            ; $efb2: 85 dc     
            dec $b3            ; $efb4: c6 b3     
__efb6:     rts                ; $efb6: 60        

;-------------------------------------------------------------------------------
__efb7:     ldx #$01           ; $efb7: a2 01     
            lda $91,x          ; $efb9: b5 91     
            beq __efe1         ; $efbb: f0 24     
            lda $90            ; $efbd: a5 90     
            sec                ; $efbf: 38        
            sbc $b2,x          ; $efc0: f5 b2     
            cmp #$04           ; $efc2: c9 04     
            bcc __efcb         ; $efc4: 90 05     
            lda #$84           ; $efc6: a9 84     
            sta $03e8,x        ; $efc8: 9d e8 03  
__efcb:     lda $9c,x          ; $efcb: b5 9c     
            ldy $bd,x          ; $efcd: b4 bd     
            bmi __efd3         ; $efcf: 30 02     
            adc #$08           ; $efd1: 69 08     
__efd3:     jsr __ef47         ; $efd3: 20 47 ef  
            bpl __efe1         ; $efd6: 10 09     
            lda $dc            ; $efd8: a5 dc     
            bne __efdf         ; $efda: d0 03     
            jsr __ef4e         ; $efdc: 20 4e ef  
__efdf:     .hex e6            ; $efdf: e6        Suspected data
__efe0:     .hex dc            ; $efe0: dc        Suspected data
__efe1:     rts                ; $efe1: 60        

;-------------------------------------------------------------------------------
            clc                ; $efe2: 18        
            .hex 30            ; $efe3: 30        Suspected data
__efe4:     rti                ; $efe4: 40        

;-------------------------------------------------------------------------------
            rti                ; $efe5: 40        

;-------------------------------------------------------------------------------
            bvc __f048         ; $efe6: 50 60     
            bvs __ef6a         ; $efe8: 70 80     
            bcc __ef84         ; $efea: 90 98     
__efec:     ldx #$02           ; $efec: a2 02     
            jsr __eff3         ; $efee: 20 f3 ef  
            ldx #$03           ; $eff1: a2 03     
__eff3:     lda $91,x          ; $eff3: b5 91     
            beq __f03b         ; $eff5: f0 44     
            bpl __f014         ; $eff7: 10 1b     
            jsr __ef42         ; $eff9: 20 42 ef  
            bpl __f014         ; $effc: 10 16     
            lda $03a6,x        ; $effe: bd a6 03  
            .hex c9            ; $f001: c9        Suspected data
__f002:     cpy #$d0           ; $f002: c0 d0     
            bpl __efaf         ; $f004: 10 a9     
            .hex 04 85         ; $f006: 04 85     Invalid Opcode - NOP $85
            inc $954a,x        ; $f008: fe 4a 95  
            sta ($a9),y        ; $f00b: 91 a9     
            brk                ; $f00d: 00        
            sta $03d2,x        ; $f00e: 9d d2 03  
            sta $0382,x        ; $f011: 9d 82 03  
__f014:     rts                ; $f014: 60        

;-------------------------------------------------------------------------------
            lda $b2,x          ; $f015: b5 b2     
            sta $0386,x        ; $f017: 9d 86 03  
            lda $bd,x          ; $f01a: b5 bd     
            sta $0382,x        ; $f01c: 9d 82 03  
            lda #$c0           ; $f01f: a9 c0     
            sta $03a6,x        ; $f021: 9d a6 03  
            lda __efe0,x       ; $f024: bd e0 ef  
            sta $48,x          ; $f027: 95 48     
            jsr __ef4e         ; $f029: 20 4e ef  
            jmp __ef7d         ; $f02c: 4c 7d ef  

;-------------------------------------------------------------------------------
__f02f:     ora ($03,x)        ; $f02f: 01 03     
            ora $03            ; $f031: 05 03     
            ora $03            ; $f033: 05 03     
            ora $07            ; $f035: 05 07     
            ora $07            ; $f037: 05 07     
            asl $07            ; $f039: 06 07     
__f03b:     lda $0382,x        ; $f03b: bd 82 03  
            beq __f043         ; $f03e: f0 03     
            jmp __f0c9         ; $f040: 4c c9 f0  

;-------------------------------------------------------------------------------
__f043:     lda $48,x          ; $f043: b5 48     
            bne __f014         ; $f045: d0 cd     
            .hex b5            ; $f047: b5        Suspected data
__f048:     asl $29,x          ; $f048: 16 29     
            ora ($d0,x)        ; $f04a: 01 d0     
            .hex 02            ; $f04c: 02        Invalid Opcode - KIL 
            lda #$ff           ; $f04d: a9 ff     
            sta $bd,x          ; $f04f: 95 bd     
            sta $9c,x          ; $f051: 95 9c     
            txa                ; $f053: 8a        
            sec                ; $f054: 38        
            sbc #$02           ; $f055: e9 02     
            sta $00            ; $f057: 85 00     
            lda $90            ; $f059: a5 90     
            sec                ; $f05b: 38        
            sbc #$04           ; $f05c: e9 04     
            asl                ; $f05e: 0a        
            clc                ; $f05f: 18        
            adc $00            ; $f060: 65 00     
            tay                ; $f062: a8        
            lda __f02f,y       ; $f063: b9 2f f0  
            cpy #$0b           ; $f066: c0 0b     
            bne __f075         ; $f068: d0 0b     
            cmp #$07           ; $f06a: c9 07     
            bne __f075         ; $f06c: d0 07     
            lda $19            ; $f06e: a5 19     
            and #$01           ; $f070: 29 01     
            clc                ; $f072: 18        
            adc #$07           ; $f073: 69 07     
__f075:     cmp $0786          ; $f075: cd 86 07  
            beq __f07f         ; $f078: f0 05     
            cmp $0787          ; $f07a: cd 87 07  
            bne __f092         ; $f07d: d0 13     
__f07f:     clc                ; $f07f: 18        
            adc #$01           ; $f080: 69 01     
            cmp $0786          ; $f082: cd 86 07  
            beq __f0c8         ; $f085: f0 41     
            cmp $0787          ; $f087: cd 87 07  
            beq __f0c8         ; $f08a: f0 3c     
            cmp $90            ; $f08c: c5 90     
            beq __f092         ; $f08e: f0 02     
            bcs __f0c8         ; $f090: b0 36     
__f092:     cmp #$09           ; $f092: c9 09     
            bcs __f0c8         ; $f094: b0 32     
            sta $00            ; $f096: 85 00     
            lda $90            ; $f098: a5 90     
            sec                ; $f09a: 38        
            sbc #$04           ; $f09b: e9 04     
            cmp $00            ; $f09d: c5 00     
            bcs __f0c8         ; $f09f: b0 27     
            lda $00            ; $f0a1: a5 00     
            sta $b2,x          ; $f0a3: 95 b2     
            lda #$ff           ; $f0a5: a9 ff     
            sta $91,x          ; $f0a7: 95 91     
            sta $03d2,x        ; $f0a9: 9d d2 03  
            lda $56            ; $f0ac: a5 56     
            and #$07           ; $f0ae: 29 07     
            tay                ; $f0b0: a8        
            lda __efe4,y       ; $f0b1: b9 e4 ef  
            sta $03a6,x        ; $f0b4: 9d a6 03  
            lda #$40           ; $f0b7: a9 40     
            sta $03bc,x        ; $f0b9: 9d bc 03  
            lda $b2,x          ; $f0bc: b5 b2     
            .hex 20 d5         ; $f0be: 20 d5     Suspected data
__f0c0:     sbc $a795          ; $f0c0: ed 95 a7  
            lda __efe0,x       ; $f0c3: bd e0 ef  
            sta $48,x          ; $f0c6: 95 48     
__f0c8:     rts                ; $f0c8: 60        

;-------------------------------------------------------------------------------
__f0c9:     sta $bd,x          ; $f0c9: 95 bd     
            sta $9c,x          ; $f0cb: 95 9c     
            lda #$00           ; $f0cd: a9 00     
            sta $0382,x        ; $f0cf: 9d 82 03  
            sta $00            ; $f0d2: 85 00     
            lda $0386,x        ; $f0d4: bd 86 03  
            jsr __f075         ; $f0d7: 20 75 f0  
            txa                ; $f0da: 8a        
            pha                ; $f0db: 48        
__f0dc:     lda $91,x          ; $f0dc: b5 91     
            sta $94,x          ; $f0de: 95 94     
            lda $03a6,x        ; $f0e0: bd a6 03  
            sta $03a9,x        ; $f0e3: 9d a9 03  
            txa                ; $f0e6: 8a        
            clc                ; $f0e7: 18        
            adc #$0b           ; $f0e8: 69 0b     
            tax                ; $f0ea: aa        
            cpx #$37           ; $f0eb: e0 37     
            bcc __f0dc         ; $f0ed: 90 ed     
            pla                ; $f0ef: 68        
            tax                ; $f0f0: aa        
            lda #$0e           ; $f0f1: a9 0e     
            ldy $bd,x          ; $f0f3: b4 bd     
            bpl __f0f9         ; $f0f5: 10 02     
            lda #$fa           ; $f0f7: a9 fa     
__f0f9:     clc                ; $f0f9: 18        
            adc $9c,x          ; $f0fa: 75 9c     
            sta $9f,x          ; $f0fc: 95 9f     
            lda #$00           ; $f0fe: a9 00     
            sta $03b4,x        ; $f100: 9d b4 03  
            sta $03bf,x        ; $f103: 9d bf 03  
            rts                ; $f106: 60        

;-------------------------------------------------------------------------------
__f107:     bpl __f117         ; $f107: 10 0e     
            .hex 0c 0c         ; $f109: 0c 0c     Suspected data
__f10b:     ldx #$02           ; $f10b: a2 02     
            lda $59            ; $f10d: a5 59     
            cmp #$20           ; $f10f: c9 20     
            bcs __f11c         ; $f111: b0 09     
            ldx $56            ; $f113: a6 56     
            beq __f13a         ; $f115: f0 23     
__f117:     dex                ; $f117: ca        
            beq __f11c         ; $f118: f0 02     
            ldx #$01           ; $f11a: a2 01     
__f11c:     txa                ; $f11c: 8a        
            clc                ; $f11d: 18        
            adc #$18           ; $f11e: 69 18     
            ora #$40           ; $f120: 09 40     
            sta $03f0,x        ; $f122: 9d f0 03  
            lda $c5,x          ; $f125: b5 c5     
            adc #$60           ; $f127: 69 60     
            sta $c5,x          ; $f129: 95 c5     
            lda $99,x          ; $f12b: b5 99     
            cmp #$20           ; $f12d: c9 20     
            beq __f137         ; $f12f: f0 06     
            clc                ; $f131: 18        
            adc #$01           ; $f132: 69 01     
            jsr __f13b         ; $f134: 20 3b f1  
__f137:     dex                ; $f137: ca        
            bpl __f11c         ; $f138: 10 e2     
__f13a:     rts                ; $f13a: 60        

;-------------------------------------------------------------------------------
__f13b:     jsr __c728         ; $f13b: 20 28 c7  
            sta $48f1          ; $f13e: 8d f1 48  
            sbc ($96),y        ; $f141: f1 96     
            sbc ($56),y        ; $f143: f1 56     
            sbc ($50),y        ; $f145: f1 50     
            sbc ($de),y        ; $f147: f1 de     
            .hex cf 03 d0      ; $f149: cf 03 d0  Invalid Opcode - DCP __d003
            .hex 03 20         ; $f14c: 03 20     Invalid Opcode - SLO ($20,x)
            ldx $a9f1          ; $f14e: ae f1 a9  
            brk                ; $f151: 00        
            sta $03f0,x        ; $f152: 9d f0 03  
            rts                ; $f155: 60        

;-------------------------------------------------------------------------------
            dec $03da,x        ; $f156: de da 03  
            bne __f163         ; $f159: d0 08     
            lda #$02           ; $f15b: a9 02     
            sta $fe            ; $f15d: 85 fe     
            lda #$ff           ; $f15f: a9 ff     
            sta $99,x          ; $f161: 95 99     
__f163:     jsr __f222         ; $f163: 20 22 f2  
            bmi __f174         ; $f166: 30 0c     
            txa                ; $f168: 8a        
            asl                ; $f169: 0a        
            asl                ; $f16a: 0a        
            asl                ; $f16b: 0a        
            clc                ; $f16c: 18        
            adc #$08           ; $f16d: 69 08     
            adc $0788,y        ; $f16f: 79 88 07  
            sta $a4,x          ; $f172: 95 a4     
__f174:     lda $03da,x        ; $f174: bd da 03  
            asl                ; $f177: 0a        
            rol                ; $f178: 2a        
            rol                ; $f179: 2a        
            and #$03           ; $f17a: 29 03     
            tay                ; $f17c: a8        
            lda __f107,y       ; $f17d: b9 07 f1  
            sta $03e5,x        ; $f180: 9d e5 03  
            lda $af,x          ; $f183: b5 af     
            and #$f8           ; $f185: 29 f8     
            sta $af,x          ; $f187: 95 af     
            jsr __f1f3         ; $f189: 20 f3 f1  
__f18c:     rts                ; $f18c: 60        

;-------------------------------------------------------------------------------
            lda #$02           ; $f18d: a9 02     
            jsr __f215         ; $f18f: 20 15 f2  
            cmp #$f0           ; $f192: c9 f0     
            bcc __f18c         ; $f194: 90 f6     
__f196:     lda $03f0,x        ; $f196: bd f0 03  
            ora #$80           ; $f199: 09 80     
            sta $03f0,x        ; $f19b: 9d f0 03  
__f19e:     jsr __f7ab         ; $f19e: 20 ab f7  
            asl                ; $f1a1: 0a        
            asl                ; $f1a2: 0a        
            sta $03cf,x        ; $f1a3: 9d cf 03  
            lda #$00           ; $f1a6: a9 00     
            sta $03da,x        ; $f1a8: 9d da 03  
__f1ab:     rts                ; $f1ab: 60        

;-------------------------------------------------------------------------------
            .hex 07 03         ; $f1ac: 07 03     Invalid Opcode - SLO $03
            lda $92            ; $f1ae: a5 92     
            ora $7c            ; $f1b0: 05 7c     
            bne __f196         ; $f1b2: d0 e2     
            lda $18,x          ; $f1b4: b5 18     
            and #$f8           ; $f1b6: 29 f8     
            cmp #$38           ; $f1b8: c9 38     
            bcc __f1c3         ; $f1ba: 90 07     
            cmp #$c9           ; $f1bc: c9 c9     
            bcc __f1c5         ; $f1be: 90 05     
            sbc #$38           ; $f1c0: e9 38     
            .hex 2c            ; $f1c2: 2c        Suspected data
__f1c3:     adc #$38           ; $f1c3: 69 38     
__f1c5:     cmp $a4            ; $f1c5: c5 a4     
            beq __f21d         ; $f1c7: f0 54     
            cmp $a5            ; $f1c9: c5 a5     
            beq __f21d         ; $f1cb: f0 50     
            cmp $a6            ; $f1cd: c5 a6     
            beq __f21d         ; $f1cf: f0 4c     
            sta $a4,x          ; $f1d1: 95 a4     
            lda $90            ; $f1d3: a5 90     
            tay                ; $f1d5: a8        
            dey                ; $f1d6: 88        
            dey                ; $f1d7: 88        
            sec                ; $f1d8: 38        
            sbc #$08           ; $f1d9: e9 08     
            beq __f1e3         ; $f1db: f0 06     
            bpl __f1e7         ; $f1dd: 10 08     
            lda #$20           ; $f1df: a9 20     
            iny                ; $f1e1: c8        
            .hex 2c            ; $f1e2: 2c        Suspected data
__f1e3:     lda #$50           ; $f1e3: a9 50     
            iny                ; $f1e5: c8        
            .hex 2c            ; $f1e6: 2c        Suspected data
__f1e7:     lda #$80           ; $f1e7: a9 80     
            sta $af,x          ; $f1e9: 95 af     
            iny                ; $f1eb: c8        
            tya                ; $f1ec: 98        
            sta $ba,x          ; $f1ed: 95 ba     
            lda #$02           ; $f1ef: a9 02     
            sta $99,x          ; $f1f1: 95 99     
__f1f3:     jsr __f222         ; $f1f3: 20 22 f2  
            bpl __f221         ; $f1f6: 10 29     
            txa                ; $f1f8: 8a        
            pha                ; $f1f9: 48        
            lda $a4,x          ; $f1fa: b5 a4     
            sta $0e            ; $f1fc: 85 0e     
            lda $ba,x          ; $f1fe: b5 ba     
            sta $0f            ; $f200: 85 0f     
            jsr __deb9         ; $f202: 20 b9 de  
            tay                ; $f205: a8        
            bmi __f21b         ; $f206: 30 13     
            pla                ; $f208: 68        
            tax                ; $f209: aa        
            ldy $02            ; $f20a: a4 02     
            bmi __f221         ; $f20c: 30 13     
            cpy #$04           ; $f20e: c0 04     
            beq __f21d         ; $f210: f0 0b     
            lda __f1ab,y       ; $f212: b9 ab f1  
__f215:     clc                ; $f215: 18        
            adc $af,x          ; $f216: 75 af     
            sta $af,x          ; $f218: 95 af     
            rts                ; $f21a: 60        

;-------------------------------------------------------------------------------
__f21b:     pla                ; $f21b: 68        
            tax                ; $f21c: aa        
__f21d:     lda #$01           ; $f21d: a9 01     
            sta $99,x          ; $f21f: 95 99     
__f221:     rts                ; $f221: 60        

;-------------------------------------------------------------------------------
__f222:     ldy #$01           ; $f222: a0 01     
            lda $ba,x          ; $f224: b5 ba     
__f226:     cmp $0786,y        ; $f226: d9 86 07  
            beq __f22e         ; $f229: f0 03     
            dey                ; $f22b: 88        
            bpl __f226         ; $f22c: 10 f8     
__f22e:     rts                ; $f22e: 60        

;-------------------------------------------------------------------------------
__f22f:     asl $3839          ; $f22f: 0e 39 38  
            .hex 37 36         ; $f232: 37 36     Invalid Opcode - RLA $36,x
            .hex 1b 1a 19      ; $f234: 1b 1a 19  Invalid Opcode - SLO $191a,y
            clc                ; $f237: 18        
__f238:     sec                ; $f238: 38        
            .hex 34 5b         ; $f239: 34 5b     Invalid Opcode - NOP $5b,x
            .hex 5a            ; $f23b: 5a        Invalid Opcode - NOP 
            .hex 93 91         ; $f23c: 93 91     Invalid Opcode - AHX ($91),y
            sec                ; $f23e: 38        
            sec                ; $f23f: 38        
            sta ($3a),y        ; $f240: 91 3a     
            .hex 33 36         ; $f242: 33 36     Invalid Opcode - RLA ($36),y
            and $4d38,x        ; $f244: 3d 38 4d  
            .hex 53 53         ; $f247: 53 53     Invalid Opcode - SRE ($53),y
            .hex 53 53         ; $f249: 53 53     Invalid Opcode - SRE ($53),y
            lda #$af           ; $f24b: a9 af     
            .hex 3a            ; $f24d: 3a        Invalid Opcode - NOP 
            .hex 3b 3c 3d      ; $f24e: 3b 3c 3d  Invalid Opcode - RLA $3d3c,y
            lda $af,x          ; $f251: b5 af     
            .hex 04 00         ; $f253: 04 00     Invalid Opcode - NOP $00
            eor $b500,x        ; $f255: 5d 00 b5  
            .hex bb c1 c1      ; $f258: bb c1 c1  Invalid Opcode - LAS __c1c1,y
            cmp ($c1,x)        ; $f25b: c1 c1     
            .hex c7            ; $f25d: c7        Suspected data
__f25e:     ora $1913          ; $f25e: 0d 13 19  
            .hex 1f 25 13      ; $f261: 1f 25 13  Invalid Opcode - SLO $1325,x
            ora $251f,y        ; $f264: 19 1f 25  
__f267:     ora ($01,x)        ; $f267: 01 01     
            ora ($01,x)        ; $f269: 01 01     
            ora $05            ; $f26b: 05 05     
            ora $09            ; $f26d: 05 09     
            .hex 0b 0c         ; $f26f: 0b 0c     Invalid Opcode - ANC #$0c
            .hex 0f 10 11      ; $f271: 0f 10 11  Invalid Opcode - SLO $1110
            .hex 13 15         ; $f274: 13 15     Invalid Opcode - SLO ($15),y
            asl $1a,x          ; $f276: 16 1a     
            .hex 1a            ; $f278: 1a        Invalid Opcode - NOP 
            .hex 1a            ; $f279: 1a        Invalid Opcode - NOP 
            .hex 1a            ; $f27a: 1a        Invalid Opcode - NOP 
            .hex 1a            ; $f27b: 1a        Invalid Opcode - NOP 
            .hex 1a            ; $f27c: 1a        Invalid Opcode - NOP 
            .hex 1b 1b 1e      ; $f27d: 1b 1b 1e  Invalid Opcode - SLO $1e1b,y
            .hex 1f 1f 20      ; $f280: 1f 1f 20  Invalid Opcode - SLO $201f,x
            and ($21,x)        ; $f283: 21 21     
            bit $24            ; $f285: 24 24     
            bit $24            ; $f287: 24 24     
            rol $29            ; $f289: 26 29     
            rol                ; $f28b: 2a        
            rol $2e2e          ; $f28c: 2e 2e 2e  
            .hex 2e 00         ; $f28f: 2e 00     Suspected data
__f291:     lda ($a9,x)        ; $f291: a1 a9     
            lda ($d9),y        ; $f293: b1 d9     
            ror $ad            ; $f295: 66 ad     
            ror $74,x          ; $f297: 76 74     
            ror                ; $f299: 6a        
            ror                ; $f29a: 6a        
            .hex 72            ; $f29b: 72        Invalid Opcode - KIL 
            .hex 72            ; $f29c: 72        Invalid Opcode - KIL 
            cmp $74            ; $f29d: c5 74     
            eor $ac,x          ; $f29f: 55 ac     
            tax                ; $f2a1: aa        
            bcs __f30b         ; $f2a2: b0 67     
            eor $7752          ; $f2a4: 4d 52 77  
            ror $f2            ; $f2a7: 66 f2     
            sty $6f69          ; $f2a9: 8c 69 6f  
            bvs __f31c         ; $f2ac: 70 6e     
            pha                ; $f2ae: 48        
            pha                ; $f2af: 48        
            lsr                ; $f2b0: 4a        
            adc ($53),y        ; $f2b1: 71 53     
            jmp $ad6e          ; $f2b3: 4c 6e ad  

;-------------------------------------------------------------------------------
            .hex 0c 51 a6      ; $f2b6: 0c 51 a6  Invalid Opcode - NOP $a651
            .hex b4            ; $f2b9: b4        Suspected data
__f2ba:     .hex ff ff ff      ; $f2ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 1b 0a      ; $f2c0: ff 1b 0a  Invalid Opcode - ISC $0a1b,x
            eor ($0b,x)        ; $f2c3: 41 0b     
            .hex d4 9e         ; $f2c5: d4 9e     Invalid Opcode - NOP $9e,x
            .hex 02            ; $f2c7: 02        Invalid Opcode - KIL 
            dey                ; $f2c8: 88        
            cld                ; $f2c9: d8        
            .hex 02            ; $f2ca: 02        Invalid Opcode - KIL 
__f2cb:     .hex 02            ; $f2cb: 02        Invalid Opcode - KIL 
            .hex 04 04         ; $f2cc: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $f2ce: 04 04     Invalid Opcode - NOP $04
            bpl __f2e2         ; $f2d0: 10 10     
            ora ($40,x)        ; $f2d2: 01 40     
            rts                ; $f2d4: 60        

;-------------------------------------------------------------------------------
            .hex 80 02         ; $f2d5: 80 02     Invalid Opcode - NOP #$02
            .hex 80 20         ; $f2d7: 80 20     Invalid Opcode - NOP #$20
            .hex 2b 09         ; $f2d9: 2b 09     Invalid Opcode - ANC #$09
            ldx #$80           ; $f2db: a2 80     
            tya                ; $f2dd: 98        
            lsr $a8            ; $f2de: 46 a8     
            plp                ; $f2e0: 28        
            .hex ff            ; $f2e1: ff        Suspected data
__f2e2:     .hex ff ff         ; $f2e2: ff ff     Suspected data
__f2e4:     sbc $38            ; $f2e4: e5 38     
            sec                ; $f2e6: 38        
            cmp $3838,y        ; $f2e7: d9 38 38  
            .hex df 38         ; $f2ea: df 38     Suspected data
__f2ec:     lda $52            ; $f2ec: a5 52     
            ora $0300          ; $f2ee: 0d 00 03  
            bne __f35a         ; $f2f1: d0 67     
            lda $8d            ; $f2f3: a5 8d     
            tay                ; $f2f5: a8        
            beq __f35a         ; $f2f6: f0 62     
            cmp #$01           ; $f2f8: c9 01     
            beq __f305         ; $f2fa: f0 09     
            cmp #$3e           ; $f2fc: c9 3e     
            bcc __f32e         ; $f2fe: 90 2e     
            lda #$00           ; $f300: a9 00     
            sta $8d            ; $f302: 85 8d     
            rts                ; $f304: 60        

;-------------------------------------------------------------------------------
__f305:     lda #$ff           ; $f305: a9 ff     
            ldx #$77           ; $f307: a2 77     
__f309:     .hex 9d 68         ; $f309: 9d 68     Suspected data
__f30b:     asl $ca            ; $f30b: 06 ca     
            bpl __f309         ; $f30d: 10 fa     
            lda #$00           ; $f30f: a9 00     
            sta $0346          ; $f311: 8d 46 03  
            sta $0347          ; $f314: 8d 47 03  
            lda #$d8           ; $f317: a9 d8     
            sta $034a          ; $f319: 8d 4a 03  
__f31c:     jsr __f45b         ; $f31c: 20 5b f4  
            lda $59            ; $f31f: a5 59     
            and #$07           ; $f321: 29 07     
            tax                ; $f323: aa        
            lda #$00           ; $f324: a9 00     
            sec                ; $f326: 38        
__f327:     ror                ; $f327: 6a        
            dex                ; $f328: ca        
            bpl __f327         ; $f329: 10 fc     
            sta $0345          ; $f32b: 8d 45 03  
__f32e:     jsr __f35b         ; $f32e: 20 5b f3  
            jsr __f3d2         ; $f331: 20 d2 f3  
            inc $8d            ; $f334: e6 8d     
            lda $8d            ; $f336: a5 8d     
            ldx #$08           ; $f338: a2 08     
__f33a:     cmp __f22f,x       ; $f33a: dd 2f f2  
            beq __f343         ; $f33d: f0 04     
            dex                ; $f33f: ca        
            bpl __f33a         ; $f340: 10 f8     
            rts                ; $f342: 60        

;-------------------------------------------------------------------------------
__f343:     ldy #$15           ; $f343: a0 15     
            txa                ; $f345: 8a        
            beq __f34a         ; $f346: f0 02     
            ldy #$06           ; $f348: a0 06     
__f34a:     lda __f25e,x       ; $f34a: bd 5e f2  
            tax                ; $f34d: aa        
__f34e:     lda __f238,x       ; $f34e: bd 38 f2  
            sta $0305,y        ; $f351: 99 05 03  
            dex                ; $f354: ca        
            bmi __f35a         ; $f355: 30 03     
            dey                ; $f357: 88        
            bne __f34e         ; $f358: d0 f4     
__f35a:     rts                ; $f35a: 60        

;-------------------------------------------------------------------------------
__f35b:     lda #$38           ; $f35b: a9 38     
            bit $90a9          ; $f35d: 2c a9 90  
            ldy #$1f           ; $f360: a0 1f     
__f362:     sta $0304,y        ; $f362: 99 04 03  
            dey                ; $f365: 88        
            bpl __f362         ; $f366: 10 fa     
            lda #$23           ; $f368: a9 23     
            sta $0300          ; $f36a: 8d 00 03  
            lda $0349          ; $f36d: ad 49 03  
            sta $0301          ; $f370: 8d 01 03  
            lda $0348          ; $f373: ad 48 03  
            sta $0302          ; $f376: 8d 02 03  
            lda #$20           ; $f379: a9 20     
            sta $0303          ; $f37b: 8d 03 03  
            lda #$00           ; $f37e: a9 00     
            sta $0324          ; $f380: 8d 24 03  
            ldy $8d            ; $f383: a4 8d     
            cpy #$2e           ; $f385: c0 2e     
            bcs __f3d1         ; $f387: b0 48     
            dey                ; $f389: 88        
            tya                ; $f38a: 98        
            ldy #$00           ; $f38b: a0 00     
__f38d:     sec                ; $f38d: 38        
            sbc #$07           ; $f38e: e9 07     
            bcc __f395         ; $f390: 90 03     
            iny                ; $f392: c8        
            bcs __f38d         ; $f393: b0 f8     
__f395:     tya                ; $f395: 98        
            sta $00            ; $f396: 85 00     
            eor #$ff           ; $f398: 49 ff     
            sec                ; $f39a: 38        
            adc #$1d           ; $f39b: 69 1d     
            pha                ; $f39d: 48        
            tay                ; $f39e: a8        
__f39f:     ldx #$04           ; $f39f: a2 04     
__f3a1:     rol $19,x          ; $f3a1: 36 19     
            dex                ; $f3a3: ca        
            bpl __f3a1         ; $f3a4: 10 fb     
            lda $19            ; $f3a6: a5 19     
            and #$07           ; $f3a8: 29 07     
            tax                ; $f3aa: aa        
            lda __f2e4,x       ; $f3ab: bd e4 f2  
            sta $0304,y        ; $f3ae: 99 04 03  
            dey                ; $f3b1: 88        
            cpy $00            ; $f3b2: c4 00     
            bne __f39f         ; $f3b4: d0 e9     
            pla                ; $f3b6: 68        
            tay                ; $f3b7: a8        
            jsr __f3bd         ; $f3b8: 20 bd f3  
            ldy $00            ; $f3bb: a4 00     
__f3bd:     lda $8d            ; $f3bd: a5 8d     
            and #$01           ; $f3bf: 29 01     
            bne __f3c6         ; $f3c1: d0 03     
            lda #$55           ; $f3c3: a9 55     
            .hex 2c            ; $f3c5: 2c        Suspected data
__f3c6:     lda #$58           ; $f3c6: a9 58     
            sta $0304,y        ; $f3c8: 99 04 03  
            sta $0305,y        ; $f3cb: 99 05 03  
            sta $0306,y        ; $f3ce: 99 06 03  
__f3d1:     rts                ; $f3d1: 60        

;-------------------------------------------------------------------------------
__f3d2:     ldy $0346          ; $f3d2: ac 46 03  
            lda __f2ba,y       ; $f3d5: b9 ba f2  
            and $0345          ; $f3d8: 2d 45 03  
            beq __f430         ; $f3db: f0 53     
            lda __f267,y       ; $f3dd: b9 67 f2  
            cmp $8d            ; $f3e0: c5 8d     
            bne __f436         ; $f3e2: d0 52     
            lda __f291,y       ; $f3e4: b9 91 f2  
            pha                ; $f3e7: 48        
            and #$1f           ; $f3e8: 29 1f     
            tay                ; $f3ea: a8        
            pla                ; $f3eb: 68        
            lsr                ; $f3ec: 4a        
            lsr                ; $f3ed: 4a        
            lsr                ; $f3ee: 4a        
            lsr                ; $f3ef: 4a        
            lsr                ; $f3f0: 4a        
            tax                ; $f3f1: aa        
            sty $00            ; $f3f2: 84 00     
            stx $01            ; $f3f4: 86 01     
            lda #$eb           ; $f3f6: a9 eb     
__f3f8:     sta $0304,y        ; $f3f8: 99 04 03  
            iny                ; $f3fb: c8        
            dex                ; $f3fc: ca        
            bpl __f3f8         ; $f3fd: 10 f9     
            ldy $0347          ; $f3ff: ac 47 03  
            lda $00            ; $f402: a5 00     
            pha                ; $f404: 48        
            asl                ; $f405: 0a        
            asl                ; $f406: 0a        
            asl                ; $f407: 0a        
            sta $0668,y        ; $f408: 99 68 06  
            pla                ; $f40b: 68        
            sec                ; $f40c: 38        
            adc $01            ; $f40d: 65 01     
            asl                ; $f40f: 0a        
            asl                ; $f410: 0a        
            asl                ; $f411: 0a        
            sta $0686,y        ; $f412: 99 86 06  
            lda $034a          ; $f415: ad 4a 03  
            sta $06a4,y        ; $f418: 99 a4 06  
            clc                ; $f41b: 18        
            adc #$03           ; $f41c: 69 03     
            sta $06c2,y        ; $f41e: 99 c2 06  
            lda #$00           ; $f421: a9 00     
            ldx #$1d           ; $f423: a2 1d     
            cpx $8d            ; $f425: e4 8d     
            bcc __f42a         ; $f427: 90 01     
            rol                ; $f429: 2a        
__f42a:     sta $06e0,y        ; $f42a: 99 e0 06  
            inc $0347          ; $f42d: ee 47 03  
__f430:     inc $0346          ; $f430: ee 46 03  
            jmp __f3d2         ; $f433: 4c d2 f3  

;-------------------------------------------------------------------------------
__f436:     lda $034a          ; $f436: ad 4a 03  
            sec                ; $f439: 38        
            sbc #$08           ; $f43a: e9 08     
            sta $034a          ; $f43c: 8d 4a 03  
            lda $0348          ; $f43f: ad 48 03  
            sec                ; $f442: 38        
            sbc #$20           ; $f443: e9 20     
            sta $0348          ; $f445: 8d 48 03  
            lda $0349          ; $f448: ad 49 03  
            sbc #$00           ; $f44b: e9 00     
            sta $0349          ; $f44d: 8d 49 03  
            cmp #$1f           ; $f450: c9 1f     
            beq __f45b         ; $f452: f0 07     
            cmp #$27           ; $f454: c9 27     
            bne __f465         ; $f456: d0 0d     
            lda #$23           ; $f458: a9 23     
            .hex 2c            ; $f45a: 2c        Suspected data
__f45b:     lda #$2b           ; $f45b: a9 2b     
            sta $0349          ; $f45d: 8d 49 03  
            lda #$a0           ; $f460: a9 a0     
            sta $0348          ; $f462: 8d 48 03  
__f465:     rts                ; $f465: 60        

;-------------------------------------------------------------------------------
__f466:     inc $38f4          ; $f466: ee f4 38  
            inx                ; $f469: e8        
__f46a:     .hex 20 90         ; $f46a: 20 90     Suspected data
__f46c:     asl $1000,x        ; $f46c: 1e 00 10  
__f46f:     brk                ; $f46f: 00        
            .hex 24            ; $f470: 24        Suspected data
__f471:     ldx $58            ; $f471: a6 58     
            lda $84            ; $f473: a5 84     
            bne __f499         ; $f475: d0 22     
__f477:     ldy #$00           ; $f477: a0 00     
            sty $6c,x          ; $f479: 94 6c     
            iny                ; $f47b: c8        
            sty $e4,x          ; $f47c: 94 e4     
            iny                ; $f47e: c8        
            sty $6a,x          ; $f47f: 94 6a     
            lda #$f0           ; $f481: a9 f0     
            sta $e2,x          ; $f483: 95 e2     
            lda #$3f           ; $f485: a9 3f     
            sta $66,x          ; $f487: 95 66     
            dex                ; $f489: ca        
            bpl __f477         ; $f48a: 10 eb     
            ldx $1e            ; $f48c: a6 1e     
            beq __f494         ; $f48e: f0 04     
            lda #$00           ; $f490: a9 00     
            sta $69,x          ; $f492: 95 69     
__f494:     inc $84            ; $f494: e6 84     
            jmp __f63b         ; $f496: 4c 3b f6  

;-------------------------------------------------------------------------------
__f499:     lda $37,x          ; $f499: b5 37     
            bne __f4a0         ; $f49b: d0 03     
            jsr __f504         ; $f49d: 20 04 f5  
__f4a0:     lda $66,x          ; $f4a0: b5 66     
            sta $01            ; $f4a2: 85 01     
            lda $6a,x          ; $f4a4: b5 6a     
            ora $6c,x          ; $f4a6: 15 6c     
            pha                ; $f4a8: 48        
            cmp #$01           ; $f4a9: c9 01     
            bne __f4c9         ; $f4ab: d0 1c     
            lda $01            ; $f4ad: a5 01     
            cmp #$3f           ; $f4af: c9 3f     
            bne __f4b7         ; $f4b1: d0 04     
            lda #$04           ; $f4b3: a9 04     
            sta $ff            ; $f4b5: 85 ff     
__f4b7:     lda #$00           ; $f4b7: a9 00     
            sta $2f,x          ; $f4b9: 95 2f     
            txa                ; $f4bb: 8a        
            jsr __c83d         ; $f4bc: 20 3d c8  
            lda $01            ; $f4bf: a5 01     
            cmp #$3f           ; $f4c1: c9 3f     
            bcc __f4c7         ; $f4c3: 90 02     
            lda #$3f           ; $f4c5: a9 3f     
__f4c7:     sta $66,x          ; $f4c7: 95 66     
__f4c9:     pla                ; $f4c9: 68        
            pha                ; $f4ca: 48        
            tay                ; $f4cb: a8        
            lda __f466,y       ; $f4cc: b9 66 f4  
            sta $02            ; $f4cf: 85 02     
            lda __f46a,x       ; $f4d1: bd 6a f4  
            sta $00            ; $f4d4: 85 00     
            sta $0e            ; $f4d6: 85 0e     
            lda #$00           ; $f4d8: a9 00     
            sta $0f            ; $f4da: 85 0f     
            txa                ; $f4dc: 8a        
            pha                ; $f4dd: 48        
            tay                ; $f4de: a8        
            iny                ; $f4df: c8        
            jsr __eafc         ; $f4e0: 20 fc ea  
            pla                ; $f4e3: 68        
            tax                ; $f4e4: aa        
            pla                ; $f4e5: 68        
            cmp #$01           ; $f4e6: c9 01     
            bne __f500         ; $f4e8: d0 16     
            lda __f46f,x       ; $f4ea: bd 6f f4  
            tay                ; $f4ed: a8        
            lda $0203,y        ; $f4ee: b9 03 02  
            clc                ; $f4f1: 18        
            adc #$08           ; $f4f2: 69 08     
            sta $0203,y        ; $f4f4: 99 03 02  
            lda $020f,y        ; $f4f7: b9 0f 02  
            clc                ; $f4fa: 18        
            adc #$08           ; $f4fb: 69 08     
            sta $020f,y        ; $f4fd: 99 0f 02  
__f500:     dex                ; $f500: ca        
            bpl __f499         ; $f501: 10 96     
            rts                ; $f503: 60        

;-------------------------------------------------------------------------------
__f504:     ldy $6a,x          ; $f504: b4 6a     
            lda __f46c,y       ; $f506: b9 6c f4  
            sta $37,x          ; $f509: 95 37     
            lda $6c,x          ; $f50b: b5 6c     
            eor #$01           ; $f50d: 49 01     
            sta $6c,x          ; $f50f: 95 6c     
            bne __f517         ; $f511: d0 04     
            lda #$08           ; $f513: a9 08     
            sta $ff            ; $f515: 85 ff     
__f517:     lda #$00           ; $f517: a9 00     
            sta $e0,x          ; $f519: 95 e0     
__f51b:     rts                ; $f51b: 60        

;-------------------------------------------------------------------------------
            .hex 20 89         ; $f51c: 20 89     Suspected data
__f51e:     sty $3b,x          ; $f51e: 94 3b     
            .hex 5a            ; $f520: 5a        Invalid Opcode - NOP 
            .hex 5a            ; $f521: 5a        Invalid Opcode - NOP 
            .hex 3d 8e         ; $f522: 3d 8e     Suspected data
__f524:     ldx $1e            ; $f524: a6 1e     
            beq __f537         ; $f526: f0 0f     
            ldy __f51b,x       ; $f528: bc 1b f5  
            ldx #$05           ; $f52b: a2 05     
__f52d:     lda __f51e,x       ; $f52d: bd 1e f5  
            sta $0400,y        ; $f530: 99 00 04  
            dey                ; $f533: 88        
            dex                ; $f534: ca        
            bpl __f52d         ; $f535: 10 f6     
__f537:     rts                ; $f537: 60        

;-------------------------------------------------------------------------------
__f538:     .hex 22            ; $f538: 22        Invalid Opcode - KIL 
            .hex 93 02         ; $f539: 93 02     Invalid Opcode - AHX ($02),y
            jsr $0273          ; $f53b: 20 73 02  
__f53e:     ldy $59            ; $f53e: a4 59     
            dey                ; $f540: 88        
            lda $14            ; $f541: a5 14     
            and #$0f           ; $f543: 29 0f     
            beq __f560         ; $f545: f0 19     
            and #$05           ; $f547: 29 05     
            beq __f54d         ; $f549: f0 02     
            iny                ; $f54b: c8        
            iny                ; $f54c: c8        
__f54d:     tya                ; $f54d: 98        
            and #$1f           ; $f54e: 29 1f     
            ldy $37            ; $f550: a4 37     
            bne __f562         ; $f552: d0 0e     
            sta $59            ; $f554: 85 59     
            lda #$80           ; $f556: a9 80     
            sta $4e            ; $f558: 85 4e     
            lda #$08           ; $f55a: a9 08     
            sta $fe            ; $f55c: 85 fe     
            lda #$0f           ; $f55e: a9 0f     
__f560:     sta $37            ; $f560: 85 37     
__f562:     ldy #$02           ; $f562: a0 02     
__f564:     ldx #$02           ; $f564: a2 02     
__f566:     lda __f538,y       ; $f566: b9 38 f5  
            sta $0301,x        ; $f569: 9d 01 03  
            dey                ; $f56c: 88        
            dex                ; $f56d: ca        
            bpl __f566         ; $f56e: 10 f6     
            inx                ; $f570: e8        
            stx $0306          ; $f571: 8e 06 03  
            ldy $59            ; $f574: a4 59     
            iny                ; $f576: c8        
            tya                ; $f577: 98        
            .hex 20 4a         ; $f578: 20 4a     Suspected data
__f57a:     nop                ; $f57a: ea        
            sty $0304          ; $f57b: 8c 04 03  
            sta $0305          ; $f57e: 8d 05 03  
__f581:     rts                ; $f581: 60        

;-------------------------------------------------------------------------------
            brk                ; $f582: 00        
__f583:     ora $00            ; $f583: 05 00     
            .hex 0e            ; $f585: 0e        Suspected data
__f586:     ldx $1e            ; $f586: a6 1e     
            beq __f5c4         ; $f588: f0 3a     
            lda #$21           ; $f58a: a9 21     
            sta $0301          ; $f58c: 8d 01 03  
            lda #$48           ; $f58f: a9 48     
            clc                ; $f591: 18        
            adc __f583,x       ; $f592: 7d 83 f5  
            sta $0302          ; $f595: 8d 02 03  
            lda #$05           ; $f598: a9 05     
            sta $0303          ; $f59a: 8d 03 03  
            jsr __ea55         ; $f59d: 20 55 ea  
            ldx $1e            ; $f5a0: a6 1e     
            ldy __f581,x       ; $f5a2: bc 81 f5  
            sta $0360,y        ; $f5a5: 99 60 03  
            jsr __ea4a         ; $f5a8: 20 4a ea  
            cpy #$00           ; $f5ab: c0 00     
            bne __f5b1         ; $f5ad: d0 02     
            ldy #$38           ; $f5af: a0 38     
__f5b1:     sty $0304          ; $f5b1: 8c 04 03  
            sta $0305          ; $f5b4: 8d 05 03  
            ldx #$03           ; $f5b7: a2 03     
            lda #$00           ; $f5b9: a9 00     
__f5bb:     sta $0306,x        ; $f5bb: 9d 06 03  
            dex                ; $f5be: ca        
            bpl __f5bb         ; $f5bf: 10 fa     
            jsr __c14e         ; $f5c1: 20 4e c1  
__f5c4:     ldy #$05           ; $f5c4: a0 05     
            jmp __f564         ; $f5c6: 4c 64 f5  

;-------------------------------------------------------------------------------
__f5c9:     .hex 52            ; $f5c9: 52        Invalid Opcode - KIL 
            bvs __f57a         ; $f5ca: 70 ae     
            ldx $ba,y          ; $f5cc: b6 ba     
            .hex c2 c6         ; $f5ce: c2 c6     Invalid Opcode - NOP #$c6
            dex                ; $f5d0: ca        
            .hex be fa         ; $f5d1: be fa     Suspected data
__f5d3:     bmi __f5e8         ; $f5d3: 30 13     
            ora ($30,x)        ; $f5d5: 01 30     
            asl $19,x          ; $f5d7: 16 19     
            bmi __f614         ; $f5d9: 30 39     
            and #$30           ; $f5db: 29 30     
            .hex 3a            ; $f5dd: 3a        Invalid Opcode - NOP 
            .hex 1a            ; $f5de: 1a        Invalid Opcode - NOP 
            and #$26           ; $f5df: 29 26     
            .hex 07 30         ; $f5e1: 07 30     Invalid Opcode - SLO $30
            asl $19,x          ; $f5e3: 16 19     
            bmi __f5fd         ; $f5e5: 30 16     
            .hex 26            ; $f5e7: 26        Suspected data
__f5e8:     bmi __f601         ; $f5e8: 30 17     
            and #$30           ; $f5ea: 29 30     
            .hex 17 06         ; $f5ec: 17 06     Invalid Opcode - SLO $06,x
            bmi __f607         ; $f5ee: 30 17     
            asl $30            ; $f5f0: 06 30     
            asl $27,x          ; $f5f2: 16 27     
            bmi __f607         ; $f5f4: 30 11     
            rol $30            ; $f5f6: 26 30     
            .hex 15            ; $f5f8: 15        Suspected data
__f5f9:     rol $30            ; $f5f9: 26 30     
            and ($26,x)        ; $f5fb: 21 26     
__f5fd:     bmi __f624         ; $f5fd: 30 25     
            rol $27            ; $f5ff: 26 27     
__f601:     .hex 17 07         ; $f601: 17 07     Invalid Opcode - SLO $07,x
            clc                ; $f603: 18        
__f604:     bpl __f61a         ; $f604: 10 14     
            .hex 10            ; $f606: 10        Suspected data
__f607:     .hex 14 1c         ; $f607: 14 1c     Invalid Opcode - NOP $1c,x
__f609:     .hex 3f 1c 04      ; $f609: 3f 1c 04  Invalid Opcode - RLA $041c,x
            .hex 0f f0 f0      ; $f60c: 0f f0 f0  Invalid Opcode - SLO __f0f0
__f60f:     jsr __f63b         ; $f60f: 20 3b f6  
            lda $55            ; $f612: a5 55     
__f614:     and #$01           ; $f614: 29 01     
            eor $51            ; $f616: 45 51     
            tax                ; $f618: aa        
            .hex bd            ; $f619: bd        Suspected data
__f61a:     .hex 0d f6         ; $f61a: 0d f6     Suspected data
__f61c:     sta $05fd          ; $f61c: 8d fd 05  
            lda #$78           ; $f61f: a9 78     
            sta $05fc          ; $f621: 8d fc 05  
__f624:     ldx #$02           ; $f624: a2 02     
__f626:     lda $05fc,x        ; $f626: bd fc 05  
            sta $00,x          ; $f629: 95 00     
            dex                ; $f62b: ca        
            bpl __f626         ; $f62c: 10 f8     
            ldy #$0d           ; $f62e: a0 0d     
__f630:     lda $d5            ; $f630: a5 d5     
            sta $0f            ; $f632: 85 0f     
            lda #$01           ; $f634: a9 01     
            sta $0e            ; $f636: 85 0e     
            jmp __eafc         ; $f638: 4c fc ea  

;-------------------------------------------------------------------------------
__f63b:     lda $56            ; $f63b: a5 56     
__f63d:     cmp #$0a           ; $f63d: c9 0a     
            bcc __f645         ; $f63f: 90 04     
            sbc #$0a           ; $f641: e9 0a     
            bcs __f63d         ; $f643: b0 f8     
__f645:     tax                ; $f645: aa        
            lda __f5c9,x       ; $f646: bd c9 f5  
            sta $05fe          ; $f649: 8d fe 05  
__f64c:     stx $0f            ; $f64c: 86 0f     
            txa                ; $f64e: 8a        
            asl                ; $f64f: 0a        
            clc                ; $f650: 18        
            adc $0f            ; $f651: 65 0f     
            tay                ; $f653: a8        
            ldx $0300          ; $f654: ae 00 03  
            lda #$00           ; $f657: a9 00     
            sta $0308,x        ; $f659: 9d 08 03  
            lda #$03           ; $f65c: a9 03     
            sta $00            ; $f65e: 85 00     
__f660:     lda __f5d3,y       ; $f660: b9 d3 f5  
            sta $0305,x        ; $f663: 9d 05 03  
            iny                ; $f666: c8        
            inx                ; $f667: e8        
            dec $00            ; $f668: c6 00     
            bne __f660         ; $f66a: d0 f4     
            ldx $0300          ; $f66c: ae 00 03  
            ldy #$00           ; $f66f: a0 00     
__f671:     lda __f609,y       ; $f671: b9 09 f6  
            sta $0301,x        ; $f674: 9d 01 03  
            inx                ; $f677: e8        
            iny                ; $f678: c8        
            cpy #$04           ; $f679: c0 04     
            bne __f671         ; $f67b: d0 f4     
            rts                ; $f67d: 60        

;-------------------------------------------------------------------------------
__f67e:     lda $d6            ; $f67e: a5 d6     
            clc                ; $f680: 18        
            adc #$0a           ; $f681: 69 0a     
            sta $05fc          ; $f683: 8d fc 05  
            lda $d7            ; $f686: a5 d7     
            clc                ; $f688: 18        
            adc #$0e           ; $f689: 69 0e     
            sta $05fd          ; $f68b: 8d fd 05  
            jmp __f624         ; $f68e: 4c 24 f6  

;-------------------------------------------------------------------------------
__f691:     tya                ; $f691: 98        
            pha                ; $f692: 48        
            lda __f5f9,x       ; $f693: bd f9 f5  
            pha                ; $f696: 48        
            jsr __f64c         ; $f697: 20 4c f6  
            pla                ; $f69a: 68        
            ldy $0300          ; $f69b: ac 00 03  
            sta $0302,y        ; $f69e: 99 02 03  
            pla                ; $f6a1: 68        
            tay                ; $f6a2: a8        
            rts                ; $f6a3: 60        

;-------------------------------------------------------------------------------
__f6a4:     lda $3b            ; $f6a4: a5 3b     
            bne __f6da         ; $f6a6: d0 32     
            lda $07fa          ; $f6a8: ad fa 07  
            ora $07fb          ; $f6ab: 0d fb 07  
            beq __f6db         ; $f6ae: f0 2b     
            lda #$02           ; $f6b0: a9 02     
            sta $01            ; $f6b2: 85 01     
            lda #$01           ; $f6b4: a9 01     
            ldy $07fb          ; $f6b6: ac fb 07  
            beq __f6bd         ; $f6b9: f0 02     
            lda #$11           ; $f6bb: a9 11     
__f6bd:     pha                ; $f6bd: 48        
            jsr __c94b         ; $f6be: 20 4b c9  
            lda #$03           ; $f6c1: a9 03     
            sta $01            ; $f6c3: 85 01     
            pla                ; $f6c5: 68        
            .hex 20            ; $f6c6: 20        Suspected data
__f6c7:     .hex 4b c9         ; $f6c7: 4b c9     Invalid Opcode - ALR #$c9
            lda #$23           ; $f6c9: a9 23     
            jsr __c8e0         ; $f6cb: 20 e0 c8  
            lda #$5d           ; $f6ce: a9 5d     
            sta $0306          ; $f6d0: 8d 06 03  
            sta $030d          ; $f6d3: 8d 0d 03  
            lda #$06           ; $f6d6: a9 06     
            sta $3b            ; $f6d8: 85 3b     
__f6da:     rts                ; $f6da: 60        

;-------------------------------------------------------------------------------
__f6db:     sta $1e            ; $f6db: 85 1e     
            lda #$06           ; $f6dd: a9 06     
            sta $6a            ; $f6df: 85 6a     
            lda #$0a           ; $f6e1: a9 0a     
            sta $4d            ; $f6e3: 85 4d     
            lda #$80           ; $f6e5: a9 80     
            sta $fb            ; $f6e7: 85 fb     
            rts                ; $f6e9: 60        

;-------------------------------------------------------------------------------
__f6ea:     bpl __f72c         ; $f6ea: 10 40     
            tya                ; $f6ec: 98        
            tya                ; $f6ed: 98        
__f6ee:     rts                ; $f6ee: 60        

;-------------------------------------------------------------------------------
            ldy #$30           ; $f6ef: a0 30     
            .hex c0            ; $f6f1: c0        Suspected data
__f6f2:     ldx #$0a           ; $f6f2: a2 0a     
__f6f4:     lda #$00           ; $f6f4: a9 00     
            sta $91,x          ; $f6f6: 95 91     
            cpx #$04           ; $f6f8: e0 04     
            bcs __f719         ; $f6fa: b0 1d     
            lda __f6ee,x       ; $f6fc: bd ee f6  
            sta $9f,x          ; $f6ff: 95 9f     
            lda __f6ea,x       ; $f701: bd ea f6  
            sta $aa,x          ; $f704: 95 aa     
            lda #$ff           ; $f706: a9 ff     
            sta $94,x          ; $f708: 95 94     
            sta $c0,x          ; $f70a: 95 c0     
            lda $05fe          ; $f70c: ad fe 05  
            sta $03e0,x        ; $f70f: 9d e0 03  
            txa                ; $f712: 8a        
            clc                ; $f713: 18        
            adc #$4f           ; $f714: 69 4f     
            sta $03eb,x        ; $f716: 9d eb 03  
__f719:     dex                ; $f719: ca        
            bpl __f6f4         ; $f71a: 10 d8     
            rts                ; $f71c: 60        

;-------------------------------------------------------------------------------
__f71d:     ldx #$03           ; $f71d: a2 03     
__f71f:     lda $94,x          ; $f71f: b5 94     
            cmp #$01           ; $f721: c9 01     
            bne __f72c         ; $f723: d0 07     
            txa                ; $f725: 8a        
            clc                ; $f726: 18        
            adc #$8f           ; $f727: 69 8f     
            sta $03eb,x        ; $f729: 9d eb 03  
__f72c:     dex                ; $f72c: ca        
            bpl __f71f         ; $f72d: 10 f0     
            rts                ; $f72f: 60        

;-------------------------------------------------------------------------------
__f730:     rol $4646,x        ; $f730: 3e 46 46  
__f733:     bvc __f786         ; $f733: 50 51     
            .hex 4e 4f         ; $f735: 4e 4f     Suspected data
__f737:     inc $d3            ; $f737: e6 d3     
            lda $d3            ; $f739: a5 d3     
            cmp #$08           ; $f73b: c9 08     
            bcc __f74f         ; $f73d: 90 10     
            lda #$00           ; $f73f: a9 00     
            sta $d3            ; $f741: 85 d3     
            inc $d4            ; $f743: e6 d4     
            lda $d4            ; $f745: a5 d4     
            cmp #$03           ; $f747: c9 03     
            bcc __f74f         ; $f749: 90 04     
            lda #$00           ; $f74b: a9 00     
            sta $d4            ; $f74d: 85 d4     
__f74f:     ldy $d4            ; $f74f: a4 d4     
            lda __f730,y       ; $f751: b9 30 f7  
            sta $02            ; $f754: 85 02     
            ldy #$0e           ; $f756: a0 0e     
            lda $d6            ; $f758: a5 d6     
            sta $00            ; $f75a: 85 00     
            lda $d7            ; $f75c: a5 d7     
            sta $01            ; $f75e: 85 01     
            jsr __f630         ; $f760: 20 30 f6  
            lda $d4            ; $f763: a5 d4     
            cmp #$02           ; $f765: c9 02     
            bne __f78a         ; $f767: d0 21     
            ldy #$0c           ; $f769: a0 0c     
            ldx #$03           ; $f76b: a2 03     
            lda $d5            ; $f76d: a5 d5     
            bne __f773         ; $f76f: d0 02     
            ldx #$51           ; $f771: a2 51     
__f773:     lda $d5            ; $f773: a5 d5     
            bne __f77d         ; $f775: d0 06     
            txa                ; $f777: 8a        
            sta $0251,y        ; $f778: 99 51 02  
            bne __f783         ; $f77b: d0 06     
__f77d:     lda __f733,x       ; $f77d: bd 33 f7  
            sta $0241,y        ; $f780: 99 41 02  
__f783:     dex                ; $f783: ca        
            dey                ; $f784: 88        
            dey                ; $f785: 88        
__f786:     dey                ; $f786: 88        
            dey                ; $f787: 88        
            bpl __f773         ; $f788: 10 e9     
__f78a:     rts                ; $f78a: 60        

;-------------------------------------------------------------------------------
__f78b:     lda #$ff           ; $f78b: a9 ff     
            ldx $d5            ; $f78d: a6 d5     
            beq __f793         ; $f78f: f0 02     
            lda #$01           ; $f791: a9 01     
__f793:     clc                ; $f793: 18        
            adc $d6            ; $f794: 65 d6     
            sta $d6            ; $f796: 85 d6     
            cmp #$60           ; $f798: c9 60     
            bne __f7a2         ; $f79a: d0 06     
            lda $19            ; $f79c: a5 19     
            and #$01           ; $f79e: 29 01     
            sta $d5            ; $f7a0: 85 d5     
__f7a2:     lda $13            ; $f7a2: a5 13     
            ora $27            ; $f7a4: 05 27     
            bne __f78a         ; $f7a6: d0 e2     
            jmp __f737         ; $f7a8: 4c 37 f7  

;-------------------------------------------------------------------------------
__f7ab:     lda $56            ; $f7ab: a5 56     
            and #$3c           ; $f7ad: 29 3c     
            eor #$3c           ; $f7af: 49 3c     
            asl                ; $f7b1: 0a        
            asl                ; $f7b2: 0a        
            ora #$0f           ; $f7b3: 09 0f     
            and $18,x          ; $f7b5: 35 18     
            rts                ; $f7b7: 60        

;-------------------------------------------------------------------------------
__f7b8:     .hex ff 08 11      ; $f7b8: ff 08 11  Invalid Opcode - ISC $1108,x
            .hex 1e            ; $f7bb: 1e        Suspected data
__f7bc:     .hex 04 00         ; $f7bc: 04 00     Invalid Opcode - NOP $00
            asl $03            ; $f7be: 06 03     
            ora $00            ; $f7c0: 05 00     
            asl $02            ; $f7c2: 06 02     
            .hex ff 05 01      ; $f7c4: ff 05 01  Invalid Opcode - ISC $0105,x
            .hex 07 02         ; $f7c7: 07 02     Invalid Opcode - SLO $02
            .hex 04 01         ; $f7c9: 04 01     Invalid Opcode - NOP $01
            .hex 07 03         ; $f7cb: 07 03     Invalid Opcode - SLO $03
            .hex ff 04 00      ; $f7cd: ff 04 00  Bad Addr Mode - ISC $0004,x
            asl $03            ; $f7d0: 06 03     
            ora $00            ; $f7d2: 05 00     
            .hex 04 01         ; $f7d4: 04 01     Invalid Opcode - NOP $01
            .hex 07 02         ; $f7d6: 07 02     Invalid Opcode - SLO $02
            .hex 04 00         ; $f7d8: 04 00     Invalid Opcode - NOP $00
__f7da:     .hex ff 05         ; $f7da: ff 05     Suspected data
__f7dc:     ora ($07,x)        ; $f7dc: 01 07     
            .hex 02            ; $f7de: 02        Invalid Opcode - KIL 
            .hex 04 01         ; $f7df: 04 01     Invalid Opcode - NOP $01
            ora $00            ; $f7e1: 05 00     
            asl $03            ; $f7e3: 06 03     
            ora $01            ; $f7e5: 05 01     
            .hex ff            ; $f7e7: ff        Suspected data
__f7e8:     bpl __f7da         ; $f7e8: 10 f0     
            bpl __f7dc         ; $f7ea: 10 f0     
__f7ec:     brk                ; $f7ec: 00        
            brk                ; $f7ed: 00        
            brk                ; $f7ee: 00        
            brk                ; $f7ef: 00        
            ora ($00,x)        ; $f7f0: 01 00     
            ora ($01,x)        ; $f7f2: 01 01     
            ora ($01,x)        ; $f7f4: 01 01     
            ora ($02,x)        ; $f7f6: 01 02     
            ora ($02,x)        ; $f7f8: 01 02     
            .hex 02            ; $f7fa: 02        Invalid Opcode - KIL 
            .hex 02            ; $f7fb: 02        Invalid Opcode - KIL 
            .hex 02            ; $f7fc: 02        Invalid Opcode - KIL 
            .hex 02            ; $f7fd: 02        Invalid Opcode - KIL 
            .hex 02            ; $f7fe: 02        Invalid Opcode - KIL 
            .hex 02            ; $f7ff: 02        Invalid Opcode - KIL 
            .hex 03 02         ; $f800: 03 02     Invalid Opcode - SLO ($02,x)
            .hex 03 03         ; $f802: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $f804: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 04         ; $f806: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 03 04         ; $f808: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 04         ; $f80a: 04 04     Invalid Opcode - NOP $04
__f80c:     lda $18            ; $f80c: a5 18     
            and #$03           ; $f80e: 29 03     
            tay                ; $f810: a8        
            lda #$20           ; $f811: a9 20     
            sta $a7            ; $f813: 85 a7     
            lda __f7e8,y       ; $f815: b9 e8 f7  
            sta $9c            ; $f818: 85 9c     
            lda __f7b8,y       ; $f81a: b9 b8 f7  
            sta $03bc          ; $f81d: 8d bc 03  
            lda #$00           ; $f820: a9 00     
            sta $03b1          ; $f822: 8d b1 03  
            sta $91            ; $f825: 85 91     
            lda $56            ; $f827: a5 56     
            cmp #$3d           ; $f829: c9 3d     
            bcc __f82f         ; $f82b: 90 02     
            lda #$3d           ; $f82d: a9 3d     
__f82f:     asl                ; $f82f: 0a        
            asl                ; $f830: 0a        
            clc                ; $f831: 18        
            adc #$2f           ; $f832: 69 2f     
            sta $03a6          ; $f834: 8d a6 03  
            rts                ; $f837: 60        

;-------------------------------------------------------------------------------
__f838:     lda #$03           ; $f838: a9 03     
            sta $03e8          ; $f83a: 8d e8 03  
            lda $91            ; $f83d: a5 91     
            beq __f877         ; $f83f: f0 36     
            cmp #$20           ; $f841: c9 20     
            beq __f898         ; $f843: f0 53     
            cmp #$01           ; $f845: c9 01     
            beq __f899         ; $f847: f0 50     
            cmp #$02           ; $f849: c9 02     
            beq __f87c         ; $f84b: f0 2f     
            ldx #$00           ; $f84d: a2 00     
            jsr __ef70         ; $f84f: 20 70 ef  
            bcc __f85c         ; $f852: 90 08     
            jsr __f8db         ; $f854: 20 db f8  
            bmi __f85c         ; $f857: 30 03     
            jsr __f8ac         ; $f859: 20 ac f8  
__f85c:     lda $b2            ; $f85c: a5 b2     
            lsr                ; $f85e: 4a        
            ror                ; $f85f: 6a        
            eor #$80           ; $f860: 49 80     
            sta $bd            ; $f862: 85 bd     
            lda $50            ; $f864: a5 50     
            and #$08           ; $f866: 29 08     
            lsr                ; $f868: 4a        
            ora #$e0           ; $f869: 09 e0     
__f86b:     sta $03dd          ; $f86b: 8d dd 03  
            lda $03e8          ; $f86e: ad e8 03  
            ora #$40           ; $f871: 09 40     
            sta $03e8          ; $f873: 8d e8 03  
            rts                ; $f876: 60        

;-------------------------------------------------------------------------------
__f877:     sta $03e8          ; $f877: 8d e8 03  
            beq __f889         ; $f87a: f0 0d     
__f87c:     jsr __f7ab         ; $f87c: 20 ab f7  
            sta $4e            ; $f87f: 85 4e     
            lda $03e8          ; $f881: ad e8 03  
            ora #$80           ; $f884: 09 80     
            sta $03e8          ; $f886: 8d e8 03  
__f889:     lda $4e            ; $f889: a5 4e     
            bne __f898         ; $f88b: d0 0b     
            lda $91            ; $f88d: a5 91     
            bmi __f898         ; $f88f: 30 07     
            jsr __f80c         ; $f891: 20 0c f8  
            lda #$ff           ; $f894: a9 ff     
            sta $91            ; $f896: 85 91     
__f898:     rts                ; $f898: 60        

;-------------------------------------------------------------------------------
__f899:     lda $a7            ; $f899: a5 a7     
            clc                ; $f89b: 18        
            adc #$02           ; $f89c: 69 02     
            sta $a7            ; $f89e: 85 a7     
            cmp #$f0           ; $f8a0: c9 f0     
            bcc __f8a8         ; $f8a2: 90 04     
            lda #$02           ; $f8a4: a9 02     
            sta $91            ; $f8a6: 85 91     
__f8a8:     lda #$b2           ; $f8a8: a9 b2     
            bne __f86b         ; $f8aa: d0 bf     
__f8ac:     ldy $03b1          ; $f8ac: ac b1 03  
            lda __f7ec,y       ; $f8af: b9 ec f7  
            pha                ; $f8b2: 48        
            lda $b2            ; $f8b3: a5 b2     
            and #$01           ; $f8b5: 29 01     
            beq __f8be         ; $f8b7: f0 05     
            pla                ; $f8b9: 68        
            jsr __d2fb         ; $f8ba: 20 fb d2  
            pha                ; $f8bd: 48        
__f8be:     pla                ; $f8be: 68        
            jsr __ef7d         ; $f8bf: 20 7d ef  
            lda $b2            ; $f8c2: a5 b2     
            and #$02           ; $f8c4: 29 02     
            beq __f8cb         ; $f8c6: f0 03     
            dec $a7            ; $f8c8: c6 a7     
            .hex 2c            ; $f8ca: 2c        Suspected data
__f8cb:     inc $a7            ; $f8cb: e6 a7     
            lda $b2            ; $f8cd: a5 b2     
            and #$04           ; $f8cf: 29 04     
            bne __f8d7         ; $f8d1: d0 04     
            inc $03b1          ; $f8d3: ee b1 03  
            rts                ; $f8d6: 60        

;-------------------------------------------------------------------------------
__f8d7:     dec $03b1          ; $f8d7: ce b1 03  
            rts                ; $f8da: 60        

;-------------------------------------------------------------------------------
__f8db:     lda $03b1          ; $f8db: ad b1 03  
            and #$1f           ; $f8de: 29 1f     
            bne __f8f4         ; $f8e0: d0 12     
__f8e2:     inc $03bc          ; $f8e2: ee bc 03  
            ldy $03bc          ; $f8e5: ac bc 03  
            lda __f7bc,y       ; $f8e8: b9 bc f7  
            and #$04           ; $f8eb: 29 04     
            beq __f8f1         ; $f8ed: f0 02     
            lda #$1f           ; $f8ef: a9 1f     
__f8f1:     sta $03b1          ; $f8f1: 8d b1 03  
__f8f4:     lda $9c            ; $f8f4: a5 9c     
            cmp #$0f           ; $f8f6: c9 0f     
            bcc __f911         ; $f8f8: 90 17     
            cmp #$f1           ; $f8fa: c9 f1     
            bcs __f911         ; $f8fc: b0 13     
            lda $a7            ; $f8fe: a5 a7     
            cmp #$f0           ; $f900: c9 f0     
            bcs __f911         ; $f902: b0 0d     
            ldy $03bc          ; $f904: ac bc 03  
            bmi __f8e2         ; $f907: 30 d9     
            lda __f7bc,y       ; $f909: b9 bc f7  
            cmp #$ff           ; $f90c: c9 ff     
            bne __f919         ; $f90e: d0 09     
            .hex 2c            ; $f910: 2c        Suspected data
__f911:     lda #$ff           ; $f911: a9 ff     
            pha                ; $f913: 48        
            lda #$02           ; $f914: a9 02     
            sta $91            ; $f916: 85 91     
            pla                ; $f918: 68        
__f919:     sta $b2            ; $f919: 85 b2     
            rts                ; $f91b: 60        

;-------------------------------------------------------------------------------
            .hex ff ff         ; $f91c: ff ff     Suspected data
__f91e:     lda #$ff           ; $f91e: a9 ff     
            sta $4017          ; $f920: 8d 17 40  
            jsr __f9eb         ; $f923: 20 eb f9  
            jsr __fac4         ; $f926: 20 c4 fa  
            jsr __fba1         ; $f929: 20 a1 fb  
            jsr __fbfc         ; $f92c: 20 fc fb  
            lda #$00           ; $f92f: a9 00     
            sta $ff            ; $f931: 85 ff     
            sta $fe            ; $f933: 85 fe     
            sta $fc            ; $f935: 85 fc     
            sta $fb            ; $f937: 85 fb     
            ldy $0711          ; $f939: ac 11 07  
            lda $f3            ; $f93c: a5 f3     
            and #$0c           ; $f93e: 29 0c     
            beq __f949         ; $f940: f0 07     
            inc $0711          ; $f942: ee 11 07  
            cpy #$30           ; $f945: c0 30     
            bcc __f94f         ; $f947: 90 06     
__f949:     tya                ; $f949: 98        
            beq __f94f         ; $f94a: f0 03     
            dec $0711          ; $f94c: ce 11 07  
__f94f:     sty $4011          ; $f94f: 8c 11 40  
            rts                ; $f952: 60        

;-------------------------------------------------------------------------------
__f953:     stx $4000          ; $f953: 8e 00 40  
            sty $4001          ; $f956: 8c 01 40  
            rts                ; $f959: 60        

;-------------------------------------------------------------------------------
__f95a:     stx $4004          ; $f95a: 8e 04 40  
            sty $4005          ; $f95d: 8c 05 40  
            rts                ; $f960: 60        

;-------------------------------------------------------------------------------
__f961:     jsr __f953         ; $f961: 20 53 f9  
__f964:     ldx #$00           ; $f964: a2 00     
__f966:     tay                ; $f966: a8        
            lda __ff01,y       ; $f967: b9 01 ff  
            beq __f977         ; $f96a: f0 0b     
            sta $4002,x        ; $f96c: 9d 02 40  
            lda __ff00,y       ; $f96f: b9 00 ff  
            ora #$08           ; $f972: 09 08     
            sta $4003,x        ; $f974: 9d 03 40  
__f977:     rts                ; $f977: 60        

;-------------------------------------------------------------------------------
__f978:     jsr __f95a         ; $f978: 20 5a f9  
__f97b:     ldx #$04           ; $f97b: a2 04     
            bne __f966         ; $f97d: d0 e7     
__f97f:     ldx #$08           ; $f97f: a2 08     
            bne __f966         ; $f981: d0 e3     
__f983:     tax                ; $f983: aa        
            ror                ; $f984: 6a        
            txa                ; $f985: 8a        
            rol                ; $f986: 2a        
            rol                ; $f987: 2a        
            rol                ; $f988: 2a        
            and #$07           ; $f989: 29 07     
            clc                ; $f98b: 18        
            adc $f5            ; $f98c: 65 f5     
            tay                ; $f98e: a8        
            lda __ff40,y       ; $f98f: b9 40 ff  
            rts                ; $f992: 60        

;-------------------------------------------------------------------------------
__f993:     tya                ; $f993: 98        
            .hex 5a            ; $f994: 5a        Invalid Opcode - NOP 
            sta $5a9b,y        ; $f995: 99 9b 5a  
            .hex 5c 9b 5d      ; $f998: 5c 9b 5d  Invalid Opcode - NOP $5d9b,x
            .hex 9c 9e 5d      ; $f99b: 9c 9e 5d  Invalid Opcode - SHY $5d9e,x
            .hex 5f            ; $f99e: 5f        Suspected data
__f99f:     .hex bf be aa      ; $f99f: bf be aa  Invalid Opcode - LAX $aabe,y
            lda #$98           ; $f9a2: a9 98     
            .hex 97 87         ; $f9a4: 97 87     Invalid Opcode - SAX $87,y
            stx $78            ; $f9a6: 86 78     
            .hex 77 6b         ; $f9a8: 77 6b     Invalid Opcode - RRA $6b,x
            ror                ; $f9aa: 6a        
__f9ab:     sty $f0            ; $f9ab: 84 f0     
            lda #$2f           ; $f9ad: a9 2f     
            sta $f4            ; $f9af: 85 f4     
__f9b1:     lda $f4            ; $f9b1: a5 f4     
            lsr                ; $f9b3: 4a        
            lsr                ; $f9b4: 4a        
            tay                ; $f9b5: a8        
            lda __f99f,y       ; $f9b6: b9 9f f9  
            sta $4002          ; $f9b9: 8d 02 40  
            lda #$08           ; $f9bc: a9 08     
            sta $4003          ; $f9be: 8d 03 40  
            ldx __f993,y       ; $f9c1: be 93 f9  
            ldy #$81           ; $f9c4: a0 81     
            bne __fa2f         ; $f9c6: d0 67     
__f9c8:     sty $f0            ; $f9c8: 84 f0     
            lda #$20           ; $f9ca: a9 20     
            sta $f4            ; $f9cc: 85 f4     
            bne __f9d6         ; $f9ce: d0 06     
__f9d0:     lda $f4            ; $f9d0: a5 f4     
            cmp #$1b           ; $f9d2: c9 1b     
            bne __fa32         ; $f9d4: d0 5c     
__f9d6:     ldx #$88           ; $f9d6: a2 88     
            ldy #$d3           ; $f9d8: a0 d3     
            lda #$00           ; $f9da: a9 00     
            jsr __f961         ; $f9dc: 20 61 f9  
            lda #$20           ; $f9df: a9 20     
            jsr __f97f         ; $f9e1: 20 7f f9  
            lda #$1c           ; $f9e4: a9 1c     
            sta $4008          ; $f9e6: 8d 08 40  
            bne __fa32         ; $f9e9: d0 47     
__f9eb:     ldy $ff            ; $f9eb: a4 ff     
            lda $f0            ; $f9ed: a5 f0     
            lsr $ff            ; $f9ef: 46 ff     
            bcs __f9ab         ; $f9f1: b0 b8     
            lsr                ; $f9f3: 4a        
            bcs __f9b1         ; $f9f4: b0 bb     
            lsr $ff            ; $f9f6: 46 ff     
            bcs __f9c8         ; $f9f8: b0 ce     
            lsr                ; $f9fa: 4a        
            bcs __f9d0         ; $f9fb: b0 d3     
            lsr $ff            ; $f9fd: 46 ff     
            bcs __fa0c         ; $f9ff: b0 0b     
            lsr                ; $fa01: 4a        
            bcs __fa1b         ; $fa02: b0 17     
            lsr $ff            ; $fa04: 46 ff     
            bcs __fa40         ; $fa06: b0 38     
            lsr                ; $fa08: 4a        
            bcs __fa4a         ; $fa09: b0 3f     
            rts                ; $fa0b: 60        

;-------------------------------------------------------------------------------
__fa0c:     sty $f0            ; $fa0c: 84 f0     
            lda #$28           ; $fa0e: a9 28     
            sta $f4            ; $fa10: 85 f4     
            ldx #$9a           ; $fa12: a2 9a     
            ldy #$a7           ; $fa14: a0 a7     
            lda #$36           ; $fa16: a9 36     
            jsr __f961         ; $fa18: 20 61 f9  
__fa1b:     lda $f4            ; $fa1b: a5 f4     
            cmp #$25           ; $fa1d: c9 25     
            bne __fa27         ; $fa1f: d0 06     
            ldx #$47           ; $fa21: a2 47     
            ldy #$f6           ; $fa23: a0 f6     
            bne __fa2f         ; $fa25: d0 08     
__fa27:     cmp #$20           ; $fa27: c9 20     
            bne __fa32         ; $fa29: d0 07     
            ldy #$bc           ; $fa2b: a0 bc     
            ldx #$4c           ; $fa2d: a2 4c     
__fa2f:     jsr __f953         ; $fa2f: 20 53 f9  
__fa32:     dec $f4            ; $fa32: c6 f4     
            bne __fa3f         ; $fa34: d0 09     
__fa36:     lda #$00           ; $fa36: a9 00     
            sta $f0            ; $fa38: 85 f0     
__fa3a:     lda #$90           ; $fa3a: a9 90     
            sta $4000          ; $fa3c: 8d 00 40  
__fa3f:     rts                ; $fa3f: 60        

;-------------------------------------------------------------------------------
__fa40:     sty $f0            ; $fa40: 84 f0     
            lda #$0b           ; $fa42: a9 0b     
            sta $f4            ; $fa44: 85 f4     
            lda #$57           ; $fa46: a9 57     
            bne __fa52         ; $fa48: d0 08     
__fa4a:     lda $f4            ; $fa4a: a5 f4     
            cmp #$07           ; $fa4c: c9 07     
            bne __fa32         ; $fa4e: d0 e2     
            lda #$02           ; $fa50: a9 02     
__fa52:     sta $4002          ; $fa52: 8d 02 40  
            lda #$3b           ; $fa55: a9 3b     
            sta $4003          ; $fa57: 8d 03 40  
            ldx #$bd           ; $fa5a: a2 bd     
            ldy #$8a           ; $fa5c: a0 8a     
            .hex d0            ; $fa5e: d0        Suspected data
__fa5f:     .hex cf 20 1e      ; $fa5f: cf 20 1e  Invalid Opcode - DCP $1e20
            .hex 1c 1a         ; $fa62: 1c 1a     Suspected data
__fa64:     sty $f1            ; $fa64: 84 f1     
            lda #$30           ; $fa66: a9 30     
            sta $0712          ; $fa68: 8d 12 07  
__fa6b:     lda $0712          ; $fa6b: ad 12 07  
            ldx #$03           ; $fa6e: a2 03     
__fa70:     lsr                ; $fa70: 4a        
            bcs __fab5         ; $fa71: b0 42     
            dex                ; $fa73: ca        
            bne __fa70         ; $fa74: d0 fa     
            tay                ; $fa76: a8        
            lda __fa5f,y       ; $fa77: b9 5f fa  
            ldy #$8b           ; $fa7a: a0 8b     
__fa7c:     ldx #$b8           ; $fa7c: a2 b8     
            jsr __f978         ; $fa7e: 20 78 f9  
            bne __fab5         ; $fa81: d0 32     
__fa83:     sty $f1            ; $fa83: 84 f1     
            lda #$5e           ; $fa85: a9 5e     
            sta $0712          ; $fa87: 8d 12 07  
            lda #$91           ; $fa8a: a9 91     
            sta $0709          ; $fa8c: 8d 09 07  
            lda #$3c           ; $fa8f: a9 3c     
            jsr __f97b         ; $fa91: 20 7b f9  
__fa94:     lda $0709          ; $fa94: ad 09 07  
            sta $4004          ; $fa97: 8d 04 40  
            cmp #$95           ; $fa9a: c9 95     
            beq __faa1         ; $fa9c: f0 03     
            inc $0709          ; $fa9e: ee 09 07  
__faa1:     lda $0712          ; $faa1: ad 12 07  
            and #$07           ; $faa4: 29 07     
            bne __faac         ; $faa6: d0 04     
            lda #$9f           ; $faa8: a9 9f     
            bne __fab2         ; $faaa: d0 06     
__faac:     cmp #$06           ; $faac: c9 06     
            bne __fab5         ; $faae: d0 05     
            lda #$a3           ; $fab0: a9 a3     
__fab2:     sta $4005          ; $fab2: 8d 05 40  
__fab5:     dec $0712          ; $fab5: ce 12 07  
            bne __fac3         ; $fab8: d0 09     
            lda #$00           ; $faba: a9 00     
            sta $f1            ; $fabc: 85 f1     
            lda #$90           ; $fabe: a9 90     
            sta $4004          ; $fac0: 8d 04 40  
__fac3:     rts                ; $fac3: 60        

;-------------------------------------------------------------------------------
__fac4:     ldy $fe            ; $fac4: a4 fe     
            lda $f1            ; $fac6: a5 f1     
            lsr $fe            ; $fac8: 46 fe     
            bcs __fa64         ; $faca: b0 98     
            lsr                ; $facc: 4a        
            bcs __fa6b         ; $facd: b0 9c     
            lsr $fe            ; $facf: 46 fe     
            bcs __fa83         ; $fad1: b0 b0     
            lsr                ; $fad3: 4a        
            bcs __fa94         ; $fad4: b0 be     
            lsr $fe            ; $fad6: 46 fe     
            bcs __faec         ; $fad8: b0 12     
            lsr                ; $fada: 4a        
            bcs __fab5         ; $fadb: b0 d8     
            lsr                ; $fadd: 4a        
            bcs __fb09         ; $fade: b0 29     
            lsr $fe            ; $fae0: 46 fe     
            bcs __faf9         ; $fae2: b0 15     
            lsr $fe            ; $fae4: 46 fe     
            bcs __fb17         ; $fae6: b0 2f     
            lsr                ; $fae8: 4a        
            bcs __fab5         ; $fae9: b0 ca     
            rts                ; $faeb: 60        

;-------------------------------------------------------------------------------
__faec:     sty $f1            ; $faec: 84 f1     
            lda #$20           ; $faee: a9 20     
            sta $0712          ; $faf0: 8d 12 07  
            lda #$18           ; $faf3: a9 18     
            ldy #$b3           ; $faf5: a0 b3     
            bne __fa7c         ; $faf7: d0 83     
__faf9:     sty $f1            ; $faf9: 84 f1     
            lda #$08           ; $fafb: a9 08     
            sta $0712          ; $fafd: 8d 12 07  
            ldx #$1f           ; $fb00: a2 1f     
            ldy #$7f           ; $fb02: a0 7f     
            lda #$04           ; $fb04: a9 04     
            jsr __f978         ; $fb06: 20 78 f9  
__fb09:     lda $0712          ; $fb09: ad 12 07  
            cmp #$04           ; $fb0c: c9 04     
            bne __fab5         ; $fb0e: d0 a5     
            lda #$a9           ; $fb10: a9 a9     
            sta $4006          ; $fb12: 8d 06 40  
            bne __fab5         ; $fb15: d0 9e     
__fb17:     sty $f1            ; $fb17: 84 f1     
            lda #$18           ; $fb19: a9 18     
            sta $0712          ; $fb1b: 8d 12 07  
            ldx #$1f           ; $fb1e: a2 1f     
            ldy #$92           ; $fb20: a0 92     
            lda #$3e           ; $fb22: a9 3e     
            jsr __f978         ; $fb24: 20 78 f9  
            lda #$08           ; $fb27: a9 08     
            sta $4007          ; $fb29: 8d 07 40  
            lda $0712          ; $fb2c: ad 12 07  
            cmp #$10           ; $fb2f: c9 10     
            bne __fb38         ; $fb31: d0 05     
            lda #$32           ; $fb33: a9 32     
            sta $4006          ; $fb35: 8d 06 40  
__fb38:     jmp __fab5         ; $fb38: 4c b5 fa  

;-------------------------------------------------------------------------------
__fb3b:     asl $10,x          ; $fb3b: 16 10     
            .hex 17 18         ; $fb3d: 17 18     Invalid Opcode - SLO $18,x
            ora $1b1a,y        ; $fb3f: 19 1a 1b  
            .hex 1f 1f 1f      ; $fb42: 1f 1f 1f  Invalid Opcode - SLO $1f1f,x
            .hex 1f 1c 1a      ; $fb45: 1f 1c 1a  Invalid Opcode - SLO $1a1c,x
            .hex 17 15         ; $fb48: 17 15     Invalid Opcode - SLO $15,x
            .hex 14            ; $fb4a: 14        Suspected data
__fb4b:     .hex 02            ; $fb4b: 02        Invalid Opcode - KIL 
            .hex 04 06         ; $fb4c: 04 06     Invalid Opcode - NOP $06
            php                ; $fb4e: 08        
            asl                ; $fb4f: 0a        
            .hex 0b 0c         ; $fb50: 0b 0c     Invalid Opcode - ANC #$0c
__fb52:     ora $1410          ; $fb52: 0d 10 14  
            ora $1d1b,y        ; $fb55: 19 1b 1d  
            .hex 1f 1f 13      ; $fb58: 1f 1f 13  Invalid Opcode - SLO $131f,x
            ora $1a,x          ; $fb5b: 15 1a     
            .hex 1c 1e 1f      ; $fb5d: 1c 1e 1f  Invalid Opcode - NOP $1f1e,x
            .hex 1f 1f         ; $fb60: 1f 1f     Suspected data
__fb62:     .hex 1f 06 0a      ; $fb62: 1f 06 0a  Invalid Opcode - SLO $0a06,x
            .hex 0b 09         ; $fb65: 0b 09     Invalid Opcode - ANC #$09
            .hex 0c 0f 0e      ; $fb67: 0c 0f 0e  Invalid Opcode - NOP $0e0f
__fb6a:     .hex 0f 10 1f      ; $fb6a: 0f 10 1f  Invalid Opcode - SLO $1f10
            .hex 1f            ; $fb6d: 1f        Suspected data
__fb6e:     .hex 1f 09 0b      ; $fb6e: 1f 09 0b  Invalid Opcode - SLO $0b09,x
__fb71:     sty $f2            ; $fb71: 84 f2     
            lda #$7f           ; $fb73: a9 7f     
            sta $070e          ; $fb75: 8d 0e 07  
__fb78:     lda $070e          ; $fb78: ad 0e 07  
            lsr                ; $fb7b: 4a        
            lsr                ; $fb7c: 4a        
            lsr                ; $fb7d: 4a        
            lsr                ; $fb7e: 4a        
            tay                ; $fb7f: a8        
            ldx __fb4b,y       ; $fb80: be 4b fb  
            lda $070e          ; $fb83: ad 0e 07  
            and #$0f           ; $fb86: 29 0f     
            tay                ; $fb88: a8        
            lda __fb3b,y       ; $fb89: b9 3b fb  
__fb8c:     sta $400c          ; $fb8c: 8d 0c 40  
            stx $400e          ; $fb8f: 8e 0e 40  
            lda #$08           ; $fb92: a9 08     
            sta $400f          ; $fb94: 8d 0f 40  
            dec $070e          ; $fb97: ce 0e 07  
            bne __fba0         ; $fb9a: d0 04     
            lda #$00           ; $fb9c: a9 00     
            sta $f2            ; $fb9e: 85 f2     
__fba0:     rts                ; $fba0: 60        

;-------------------------------------------------------------------------------
__fba1:     ldy $fc            ; $fba1: a4 fc     
            lda $f2            ; $fba3: a5 f2     
            lsr $fc            ; $fba5: 46 fc     
            bcs __fb71         ; $fba7: b0 c8     
            lsr                ; $fba9: 4a        
            bcs __fb78         ; $fbaa: b0 cc     
            lsr $fc            ; $fbac: 46 fc     
            bcs __fbbb         ; $fbae: b0 0b     
            lsr                ; $fbb0: 4a        
            bcs __fbcb         ; $fbb1: b0 18     
            lsr $fc            ; $fbb3: 46 fc     
            bcs __fbdb         ; $fbb5: b0 24     
            lsr                ; $fbb7: 4a        
            bcs __fbeb         ; $fbb8: b0 31     
            rts                ; $fbba: 60        

;-------------------------------------------------------------------------------
__fbbb:     sty $f2            ; $fbbb: 84 f2     
            lda #$10           ; $fbbd: a9 10     
            sta $070e          ; $fbbf: 8d 0e 07  
            lda $f0            ; $fbc2: a5 f0     
            cmp #$04           ; $fbc4: c9 04     
            bne __fbcb         ; $fbc6: d0 03     
            jsr __fa36         ; $fbc8: 20 36 fa  
__fbcb:     lda $070e          ; $fbcb: ad 0e 07  
            lsr                ; $fbce: 4a        
            tay                ; $fbcf: a8        
            ldx __fb62,y       ; $fbd0: be 62 fb  
            ldy $070e          ; $fbd3: ac 0e 07  
            lda __fb52,y       ; $fbd6: b9 52 fb  
            bne __fb8c         ; $fbd9: d0 b1     
__fbdb:     sty $f2            ; $fbdb: 84 f2     
            lda #$04           ; $fbdd: a9 04     
            sta $070e          ; $fbdf: 8d 0e 07  
            lda $f0            ; $fbe2: a5 f0     
            cmp #$04           ; $fbe4: c9 04     
            bne __fbeb         ; $fbe6: d0 03     
            jsr __fa36         ; $fbe8: 20 36 fa  
__fbeb:     lda $070e          ; $fbeb: ad 0e 07  
            lsr                ; $fbee: 4a        
            tay                ; $fbef: a8        
            ldx __fb6e,y       ; $fbf0: be 6e fb  
            ldy $070e          ; $fbf3: ac 0e 07  
            lda __fb6a,y       ; $fbf6: b9 6a fb  
            jmp __fb8c         ; $fbf9: 4c 8c fb  

;-------------------------------------------------------------------------------
__fbfc:     lda $fb            ; $fbfc: a5 fb     
            bne __fc05         ; $fbfe: d0 05     
            lda $f3            ; $fc00: a5 f3     
            bne __fc51         ; $fc02: d0 4d     
            rts                ; $fc04: 60        

;-------------------------------------------------------------------------------
__fc05:     cmp #$20           ; $fc05: c9 20     
            bne __fc11         ; $fc07: d0 08     
            lda $f3            ; $fc09: a5 f3     
            and #$0e           ; $fc0b: 29 0e     
            sta $fd            ; $fc0d: 85 fd     
            lda $fb            ; $fc0f: a5 fb     
__fc11:     sta $f3            ; $fc11: 85 f3     
            ldy #$00           ; $fc13: a0 00     
            sty $f8            ; $fc15: 84 f8     
__fc17:     iny                ; $fc17: c8        
            lsr                ; $fc18: 4a        
            bcc __fc17         ; $fc19: 90 fc     
            lda __fd21,y       ; $fc1b: b9 21 fd  
            tay                ; $fc1e: a8        
            lda __fd22,y       ; $fc1f: b9 22 fd  
            sta $f5            ; $fc22: 85 f5     
            lda __fd23,y       ; $fc24: b9 23 fd  
            sta $f6            ; $fc27: 85 f6     
            lda __fd24,y       ; $fc29: b9 24 fd  
            sta $f7            ; $fc2c: 85 f7     
            lda __fd25,y       ; $fc2e: b9 25 fd  
            sta $fa            ; $fc31: 85 fa     
            lda __fd26,y       ; $fc33: b9 26 fd  
            sta $f9            ; $fc36: 85 f9     
            lda __fd27,y       ; $fc38: b9 27 fd  
            sta $0705          ; $fc3b: 8d 05 07  
            lda #$01           ; $fc3e: a9 01     
            sta $0701          ; $fc40: 8d 01 07  
            sta $0703          ; $fc43: 8d 03 07  
            sta $0704          ; $fc46: 8d 04 07  
            sta $0706          ; $fc49: 8d 06 07  
            lda #$7f           ; $fc4c: a9 7f     
            sta $0700          ; $fc4e: 8d 00 07  
__fc51:     dec $0701          ; $fc51: ce 01 07  
            bne __fcac         ; $fc54: d0 56     
            ldy $f8            ; $fc56: a4 f8     
            inc $f8            ; $fc58: e6 f8     
            lda ($f6),y        ; $fc5a: b1 f6     
            bne __fc84         ; $fc5c: d0 26     
            lda $f3            ; $fc5e: a5 f3     
            cmp #$40           ; $fc60: c9 40     
            bne __fc68         ; $fc62: d0 04     
            lda $fd            ; $fc64: a5 fd     
            bne __fc11         ; $fc66: d0 a9     
__fc68:     cmp #$02           ; $fc68: c9 02     
            beq __fc11         ; $fc6a: f0 a5     
            and #$0c           ; $fc6c: 29 0c     
            beq __fc79         ; $fc6e: f0 09     
            lsr                ; $fc70: 4a        
            cmp #$04           ; $fc71: c9 04     
            beq __fc11         ; $fc73: f0 9c     
            lda #$08           ; $fc75: a9 08     
            bne __fc11         ; $fc77: d0 98     
__fc79:     lda #$00           ; $fc79: a9 00     
            sta $f3            ; $fc7b: 85 f3     
            jsr __fa3a         ; $fc7d: 20 3a fa  
            sta $4004          ; $fc80: 8d 04 40  
            rts                ; $fc83: 60        

;-------------------------------------------------------------------------------
__fc84:     jsr __f983         ; $fc84: 20 83 f9  
            sta $0701          ; $fc87: 8d 01 07  
            lda $f1            ; $fc8a: a5 f1     
            bne __fcc4         ; $fc8c: d0 36     
            txa                ; $fc8e: 8a        
            and #$3e           ; $fc8f: 29 3e     
            jsr __f97b         ; $fc91: 20 7b f9  
            tay                ; $fc94: a8        
            beq __fc99         ; $fc95: f0 02     
            ldy #$1f           ; $fc97: a0 1f     
__fc99:     sty $0702          ; $fc99: 8c 02 07  
            ldx #$84           ; $fc9c: a2 84     
            lda $0701          ; $fc9e: ad 01 07  
            cmp #$10           ; $fca1: c9 10     
            bcs __fca7         ; $fca3: b0 02     
            ldx #$82           ; $fca5: a2 82     
__fca7:     ldy #$7f           ; $fca7: a0 7f     
            jsr __f95a         ; $fca9: 20 5a f9  
__fcac:     lda $f1            ; $fcac: a5 f1     
            bne __fcc4         ; $fcae: d0 14     
            lda $f3            ; $fcb0: a5 f3     
            and #$0c           ; $fcb2: 29 0c     
            beq __fcc4         ; $fcb4: f0 0e     
            ldy $0702          ; $fcb6: ac 02 07  
            beq __fcbe         ; $fcb9: f0 03     
            dec $0702          ; $fcbb: ce 02 07  
__fcbe:     lda __ffd9,y       ; $fcbe: b9 d9 ff  
            sta $4004          ; $fcc1: 8d 04 40  
__fcc4:     ldy $f9            ; $fcc4: a4 f9     
            beq __fcfa         ; $fcc6: f0 32     
            dec $0703          ; $fcc8: ce 03 07  
            bne __fcfa         ; $fccb: d0 2d     
__fccd:     ldy $f9            ; $fccd: a4 f9     
            inc $f9            ; $fccf: e6 f9     
            lda ($f6),y        ; $fcd1: b1 f6     
            bne __fce0         ; $fcd3: d0 0b     
            ldy $f9            ; $fcd5: a4 f9     
            inc $f9            ; $fcd7: e6 f9     
            lda ($f6),y        ; $fcd9: b1 f6     
            sta $0700          ; $fcdb: 8d 00 07  
            bne __fccd         ; $fcde: d0 ed     
__fce0:     jsr __f983         ; $fce0: 20 83 f9  
            sta $0703          ; $fce3: 8d 03 07  
            txa                ; $fce6: 8a        
            and #$3e           ; $fce7: 29 3e     
            jsr __f964         ; $fce9: 20 64 f9  
            bne __fcf2         ; $fcec: d0 04     
            ldx #$10           ; $fcee: a2 10     
            bne __fcf4         ; $fcf0: d0 02     
__fcf2:     ldx #$06           ; $fcf2: a2 06     
__fcf4:     ldy $0700          ; $fcf4: ac 00 07  
            jsr __f953         ; $fcf7: 20 53 f9  
__fcfa:     ldy $fa            ; $fcfa: a4 fa     
            beq __fd21         ; $fcfc: f0 23     
            dec $0704          ; $fcfe: ce 04 07  
            bne __fd21         ; $fd01: d0 1e     
            inc $fa            ; $fd03: e6 fa     
            lda ($f6),y        ; $fd05: b1 f6     
            jsr __f983         ; $fd07: 20 83 f9  
            sta $0704          ; $fd0a: 8d 04 07  
            clc                ; $fd0d: 18        
            adc #$fe           ; $fd0e: 69 fe     
            cmp #$0e           ; $fd10: c9 0e     
            bcc __fd16         ; $fd12: 90 02     
            lda #$0e           ; $fd14: a9 0e     
__fd16:     asl                ; $fd16: 0a        
            asl                ; $fd17: 0a        
            sta $4008          ; $fd18: 8d 08 40  
            txa                ; $fd1b: 8a        
            and #$3e           ; $fd1c: 29 3e     
            jsr __f97f         ; $fd1e: 20 7f f9  
__fd21:     rts                ; $fd21: 60        

;-------------------------------------------------------------------------------
__fd22:     .hex 21            ; $fd22: 21        Suspected data
__fd23:     php                ; $fd23: 08        
__fd24:     .hex 0d            ; $fd24: 0d        Suspected data
__fd25:     .hex 12            ; $fd25: 12        Invalid Opcode - KIL 
__fd26:     .hex 26            ; $fd26: 26        Suspected data
__fd27:     .hex 17 17         ; $fd27: 17 17     Invalid Opcode - SLO $17,x
            .hex 1c 06 4a      ; $fd29: 1c 06 4a  Invalid Opcode - NOP $4a06,x
            .hex fe 09 00      ; $fd2c: fe 09 00  Bad Addr Mode - INC $0009,x
            asl $4d            ; $fd2f: 06 4d     
            sbc $4282,x        ; $fd31: fd 82 42  
            asl $ef            ; $fd34: 06 ef     
            sbc $2549,x        ; $fd36: fd 49 25  
            brk                ; $fd39: 00        
            .hex d2            ; $fd3a: d2        Invalid Opcode - KIL 
            .hex ff 00 00      ; $fd3b: ff 00 00  Bad Addr Mode - ISC $0000,x
            brk                ; $fd3e: 00        
            cld                ; $fd3f: d8        
            .hex ff 00 00      ; $fd40: ff 00 00  Bad Addr Mode - ISC $0000,x
            asl $b9            ; $fd43: 06 b9     
            inc $2495,x        ; $fd45: fe 95 24  
            asl $71            ; $fd48: 06 71     
            .hex ff 40 28      ; $fd4a: ff 40 28  Invalid Opcode - ISC $2840,x
            .hex 42            ; $fd4d: 42        Invalid Opcode - KIL 
            .hex 02            ; $fd4e: 02        Invalid Opcode - KIL 
            .hex 04 82         ; $fd4f: 04 82     Invalid Opcode - NOP $82
            .hex 04 30         ; $fd51: 04 30     Invalid Opcode - NOP $30
            .hex 04 30         ; $fd53: 04 30     Invalid Opcode - NOP $30
            .hex 44 02         ; $fd55: 44 02     Invalid Opcode - NOP $02
            .hex 04 4b         ; $fd57: 04 4b     Invalid Opcode - NOP $4b
            sty $02            ; $fd59: 84 02     
            plp                ; $fd5b: 28        
            .hex af e9 ef      ; $fd5c: af e9 ef  Invalid Opcode - LAX __efe9
            .hex 42            ; $fd5f: 42        Invalid Opcode - KIL 
            .hex 02            ; $fd60: 02        Invalid Opcode - KIL 
            .hex 04 82         ; $fd61: 04 82     Invalid Opcode - NOP $82
            sty $44            ; $fd63: 84 44     
            .hex 02            ; $fd65: 02        Invalid Opcode - KIL 
            .hex 04 4b         ; $fd66: 04 4b     Invalid Opcode - NOP $4b
            sty $02            ; $fd68: 84 02     
            plp                ; $fd6a: 28        
            .hex af e9 ef      ; $fd6b: af e9 ef  Invalid Opcode - LAX __efe9
            .hex 82 45         ; $fd6e: 82 45     Invalid Opcode - NOP #$45
            adc $488a          ; $fd70: 6d 8a 48  
            .hex 02            ; $fd73: 02        Invalid Opcode - KIL 
            .hex 04 6e         ; $fd74: 04 6e     Invalid Opcode - NOP $6e
            .hex 02            ; $fd76: 02        Invalid Opcode - KIL 
            plp                ; $fd77: 28        
            ror $02            ; $fd78: 66 02     
            bit $60            ; $fd7a: 24 60     
            .hex 02            ; $fd7c: 02        Invalid Opcode - KIL 
            .hex e2 28         ; $fd7d: e2 28     Invalid Opcode - NOP #$28
            .hex ab ed         ; $fd7f: ab ed     Invalid Opcode - LAX #$ed
            cmp $91            ; $fd81: c5 91     
            .hex cf cb 85      ; $fd83: cf cb 85  Invalid Opcode - DCP $85cb
            .hex ef e9 a7      ; $fd86: ef e9 a7  Invalid Opcode - ISC $a7e9
            sbc $e1            ; $fd89: e5 e1     
            .hex 9b            ; $fd8b: 9b        Invalid Opcode - TAS 
            sbc ($e5,x)        ; $fd8c: e1 e5     
            brk                ; $fd8e: 00        
            .hex 42            ; $fd8f: 42        Invalid Opcode - KIL 
            .hex 02            ; $fd90: 02        Invalid Opcode - KIL 
            .hex 22            ; $fd91: 22        Invalid Opcode - KIL 
            .hex 82 a2         ; $fd92: 82 a2     Invalid Opcode - NOP #$a2
            .hex 62            ; $fd94: 62        Invalid Opcode - KIL 
            .hex 02            ; $fd95: 02        Invalid Opcode - KIL 
            .hex 22            ; $fd96: 22        Invalid Opcode - KIL 
            .hex 63 a2         ; $fd97: 63 a2     Invalid Opcode - RRA ($a2,x)
            .hex 02            ; $fd99: 02        Invalid Opcode - KIL 
            asl __dfa5,x       ; $fd9a: 1e a5 df  
            sbc $42            ; $fd9d: e5 42     
            .hex 02            ; $fd9f: 02        Invalid Opcode - KIL 
            .hex 22            ; $fda0: 22        Invalid Opcode - KIL 
            .hex 82 a2         ; $fda1: 82 a2     Invalid Opcode - NOP #$a2
            .hex 62            ; $fda3: 62        Invalid Opcode - KIL 
            .hex 02            ; $fda4: 02        Invalid Opcode - KIL 
            .hex 22            ; $fda5: 22        Invalid Opcode - KIL 
            .hex 63 a2         ; $fda6: 63 a2     Invalid Opcode - RRA ($a2,x)
            .hex 02            ; $fda8: 02        Invalid Opcode - KIL 
            asl __dfa5,x       ; $fda9: 1e a5 df  
            sbc $82            ; $fdac: e5 82     
            adc ($61,x)        ; $fdae: 61 61     
            ldy $026c          ; $fdb0: ac 6c 02  
            bit $0268          ; $fdb3: 2c 68 02  
            bit $60            ; $fdb6: 24 60     
            .hex 02            ; $fdb8: 02        Invalid Opcode - KIL 
            asl $025a,x        ; $fdb9: 1e 5a 02  
            .hex 1a            ; $fdbc: 1a        Invalid Opcode - NOP 
            .hex 43 02         ; $fdbd: 43 02     Invalid Opcode - SRE ($02,x)
            bit $a5            ; $fdbf: 24 a5     
            .hex e7 ed         ; $fdc1: e7 ed     Invalid Opcode - ISC $ed
__fdc3:     .hex 8b c9         ; $fdc3: 8b c9     Invalid Opcode - XAA #$c9
            cmp $ad            ; $fdc5: c5 ad     
            sbc #$e1           ; $fdc7: e9 e1     
            lda ($df,x)        ; $fdc9: a1 df     
            .hex db b3 db      ; $fdcb: db b3 db  Invalid Opcode - DCP __dbb3,y
            .hex df 9a a2      ; $fdce: df 9a a2  Invalid Opcode - DCP $a29a,x
            tay                ; $fdd1: a8        
            ldy $acae          ; $fdd2: ac ae ac  
__fdd5:     tay                ; $fdd5: a8        
            ldx #$9a           ; $fdd6: a2 9a     
            ldx #$a8           ; $fdd8: a2 a8     
            ldy $acae          ; $fdda: ac ae ac  
            tay                ; $fddd: a8        
            ldx #$a4           ; $fdde: a2 a4     
            ldy $8884          ; $fde0: ac 84 88  
            txa                ; $fde3: 8a        
            dey                ; $fde4: 88        
            sty $ac            ; $fde5: 84 ac     
            txs                ; $fde7: 9a        
            ldx #$a8           ; $fde8: a2 a8     
            ldy $acae          ; $fdea: ac ae ac  
            tay                ; $fded: a8        
            ldx #$a7           ; $fdee: a2 a7     
            sbc #$e9           ; $fdf0: e9 e9     
            .hex a7 e9         ; $fdf2: a7 e9     Invalid Opcode - LAX $e9
            sbc #$87           ; $fdf4: e9 87     
            cmp #$c9           ; $fdf6: c9 c9     
            .hex 87 c9         ; $fdf8: 87 c9     Invalid Opcode - SAX $c9
            cmp #$92           ; $fdfa: c9 92     
            stx $024a          ; $fdfc: 8e 4a 02  
            sty $04            ; $fdff: 84 04     
            .hex 44 02         ; $fe01: 44 02     Invalid Opcode - NOP $02
            ldx #$02           ; $fe03: a2 02     
            ldy $a6            ; $fe05: a4 a6     
            lda #$e7           ; $fe07: a9 e7     
            sbc #$ab           ; $fe09: e9 ab     
            sbc #$eb           ; $fe0b: e9 eb     
            lda __edeb         ; $fe0d: ad eb ed  
            lda ($ed),y        ; $fe10: b1 ed     
            sbc ($00),y        ; $fe12: f1 00     
            .hex 9f df df      ; $fe14: 9f df df  Invalid Opcode - AHX __dfdf,y
            .hex 9f df df      ; $fe17: 9f df df  Invalid Opcode - AHX __dfdf,y
            .hex a7 e7         ; $fe1a: a7 e7     Invalid Opcode - LAX $e7
            .hex e7 ad         ; $fe1c: e7 ad     Invalid Opcode - ISC $ad
            sbc $88ed          ; $fe1e: ed ed 88  
            dey                ; $fe21: 88        
            .hex 44 02         ; $fe22: 44 02     Invalid Opcode - NOP $02
            ldy $682c          ; $fe24: ac 2c 68  
            .hex 02            ; $fe27: 02        Invalid Opcode - KIL 
            txs                ; $fe28: 9a        
            .hex 02            ; $fe29: 02        Invalid Opcode - KIL 
            .hex 9e a0 bb      ; $fe2a: 9e a0 bb  Invalid Opcode - SHX $bba0,y
            sbc $9bfb,y        ; $fe2d: f9 fb 9b  
            .hex fb db 9d      ; $fe30: fb db 9d  Invalid Opcode - ISC $9ddb,y
            .hex db dd a9      ; $fe33: db dd a9  Invalid Opcode - DCP $a9dd,y
            sbc $e9            ; $fe36: e5 e9     
            tay                ; $fe38: a8        
            bcs __fdc3         ; $fe39: b0 88     
            bcc __fdd5         ; $fe3b: 90 98     
            tya                ; $fe3d: 98        
            .hex 54 02         ; $fe3e: 54 02     Invalid Opcode - NOP $02,x
            stx $9a0e          ; $fe40: 8e 0e 9a  
            ldx #$a4           ; $fe43: a2 a4     
            ldx $a8            ; $fe45: a6 a8     
            tax                ; $fe47: aa        
            ldy $03b0          ; $fe48: ac b0 03  
            .hex 03 03         ; $fe4b: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $fe4d: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $fe4f: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 00         ; $fe51: 03 00     Invalid Opcode - SLO ($00,x)
            pla                ; $fe53: 68        
            .hex 02            ; $fe54: 02        Invalid Opcode - KIL 
            .hex 22            ; $fe55: 22        Invalid Opcode - KIL 
            .hex 64 02         ; $fe56: 64 02     Invalid Opcode - NOP $02
            plp                ; $fe58: 28        
            .hex 42            ; $fe59: 42        Invalid Opcode - KIL 
            .hex 02            ; $fe5a: 02        Invalid Opcode - KIL 
            .hex 04 30         ; $fe5b: 04 30     Invalid Opcode - NOP $30
            .hex 04 30         ; $fe5d: 04 30     Invalid Opcode - NOP $30
            .hex 04 68         ; $fe5f: 04 68     Invalid Opcode - NOP $68
            .hex 02            ; $fe61: 02        Invalid Opcode - KIL 
            .hex 22            ; $fe62: 22        Invalid Opcode - KIL 
            .hex 64 02         ; $fe63: 64 02     Invalid Opcode - NOP $02
            plp                ; $fe65: 28        
            .hex 42            ; $fe66: 42        Invalid Opcode - KIL 
            .hex 02            ; $fe67: 02        Invalid Opcode - KIL 
            .hex 04 30         ; $fe68: 04 30     Invalid Opcode - NOP $30
            .hex 04 30         ; $fe6a: 04 30     Invalid Opcode - NOP $30
            .hex 04 6c         ; $fe6c: 04 6c     Invalid Opcode - NOP $6c
            .hex 02            ; $fe6e: 02        Invalid Opcode - KIL 
            bit $68            ; $fe6f: 24 68     
            .hex 02            ; $fe71: 02        Invalid Opcode - KIL 
            bit $0242          ; $fe72: 2c 42 02  
            php                ; $fe75: 08        
            asl $08            ; $fe76: 06 08     
            asl $08            ; $fe78: 06 08     
            jmp ($2402)        ; $fe7a: 6c 02 24  

;-------------------------------------------------------------------------------
            pla                ; $fe7d: 68        
            .hex 02            ; $fe7e: 02        Invalid Opcode - KIL 
            bit $0242          ; $fe7f: 2c 42 02  
            php                ; $fe82: 08        
            asl $08            ; $fe83: 06 08     
            asl $08            ; $fe85: 06 08     
            bvs __fe8b         ; $fe87: 70 02     
            plp                ; $fe89: 28        
            .hex 6c            ; $fe8a: 6c        Suspected data
__fe8b:     .hex 02            ; $fe8b: 02        Invalid Opcode - KIL 
            bmi __fed0         ; $fe8c: 30 42     
            .hex 02            ; $fe8e: 02        Invalid Opcode - KIL 
            asl $0e0c          ; $fe8f: 0e 0c 0e  
            .hex 0c 0e 70      ; $fe92: 0c 0e 70  Invalid Opcode - NOP $700e
            .hex 02            ; $fe95: 02        Invalid Opcode - KIL 
            plp                ; $fe96: 28        
            jmp ($3002)        ; $fe97: 6c 02 30  

;-------------------------------------------------------------------------------
            .hex 42            ; $fe9a: 42        Invalid Opcode - KIL 
            .hex 02            ; $fe9b: 02        Invalid Opcode - KIL 
            asl $0e0c          ; $fe9c: 0e 0c 0e  
            .hex 0c 0e 8d      ; $fe9f: 0c 0e 8d  Invalid Opcode - NOP $8d0e
            cmp $e9            ; $fea2: c5 e9     
            sta __e9c5         ; $fea4: 8d c5 e9  
            .hex 8f c9 ed      ; $fea7: 8f c9 ed  Invalid Opcode - SAX __edc9
            .hex 8f c9 ed      ; $feaa: 8f c9 ed  Invalid Opcode - SAX __edc9
            sta ($c9),y        ; $fead: 91 c9     
            cmp $91            ; $feaf: c5 91     
            cmp #$c5           ; $feb1: c9 c5     
            .hex 93 cf         ; $feb3: 93 cf     Invalid Opcode - AHX ($cf),y
            cmp #$b1           ; $feb5: c9 b1     
            .hex ef ed 5a      ; $feb7: ef ed 5a  Invalid Opcode - ISC $5aed
            .hex 5c 5e 60      ; $feba: 5c 5e 60  Invalid Opcode - NOP $605e,x
            ldx #$69           ; $febd: a2 69     
            .hex 67 6b         ; $febf: 67 6b     Invalid Opcode - RRA $6b
            tay                ; $fec1: a8        
            sty $68            ; $fec2: 84 68     
            ror $02            ; $fec4: 66 02     
            bit $60            ; $fec6: 24 60     
            .hex 02            ; $fec8: 02        Invalid Opcode - KIL 
            txs                ; $fec9: 9a        
            .hex 1a            ; $feca: 1a        Invalid Opcode - NOP 
            sta __e1df,x       ; $fecb: 9d df e1  
            .hex a3 e5         ; $fece: a3 e5     Invalid Opcode - LAX ($e5,x)
__fed0:     .hex e7 a9         ; $fed0: e7 a9     Invalid Opcode - ISC $a9
            .hex eb ed         ; $fed2: eb ed     Invalid Opcode - SBC #$ed
            beq __ff18         ; $fed4: f0 42     
            .hex 02            ; $fed6: 02        Invalid Opcode - KIL 
            .hex 04 4a         ; $fed7: 04 4a     Invalid Opcode - NOP $4a
            .hex 02            ; $fed9: 02        Invalid Opcode - KIL 
            .hex cc 02 00      ; $feda: cc 02 00  Bad Addr Mode - CPY $0002
            .hex 72            ; $fedd: 72        Invalid Opcode - KIL 
            .hex 74 76         ; $fede: 74 76     Invalid Opcode - NOP $76,x
            sei                ; $fee0: 78        
            tsx                ; $fee1: ba        
            .hex 5f 5d 61      ; $fee2: 5f 5d 61  Invalid Opcode - SRE $615d,x
            .hex 9e a8 5e      ; $fee5: 9e a8 5e  Invalid Opcode - SHX $5ea8,y
            .hex 5c 02 1a      ; $fee8: 5c 02 1a  Invalid Opcode - NOP $1a02,x
            sei                ; $feeb: 78        
            .hex 02            ; $feec: 02        Invalid Opcode - KIL 
            .hex b2            ; $feed: b2        Invalid Opcode - KIL 
            sec                ; $feee: 38        
            lda ($db),y        ; $feef: b1 db     
            cmp __e19f,x       ; $fef1: dd 9f e1  
            .hex e3 a5         ; $fef4: e3 a5     Invalid Opcode - ISC ($a5,x)
            .hex e7 e9         ; $fef6: e7 e9     Invalid Opcode - ISC $e9
            cpx $0242          ; $fef8: ec 42 02  
            plp                ; $fefb: 28        
            ror __f002         ; $fefc: 6e 02 f0  
            .hex 02            ; $feff: 02        Invalid Opcode - KIL 
__ff00:     .hex 03            ; $ff00: 03        Suspected data
__ff01:     .hex 57 00         ; $ff01: 57 00     Invalid Opcode - SRE $00,x
            brk                ; $ff03: 00        
            brk                ; $ff04: 00        
            .hex d4 00         ; $ff05: d4 00     Invalid Opcode - NOP $00,x
            iny                ; $ff07: c8        
            brk                ; $ff08: 00        
            lda $b200,x        ; $ff09: bd 00 b2  
            brk                ; $ff0c: 00        
            tay                ; $ff0d: a8        
            brk                ; $ff0e: 00        
            .hex 9f 00 96      ; $ff0f: 9f 00 96  Invalid Opcode - AHX $9600,y
            brk                ; $ff12: 00        
            sta $7e00          ; $ff13: 8d 00 7e  
            brk                ; $ff16: 00        
            .hex 76            ; $ff17: 76        Suspected data
__ff18:     brk                ; $ff18: 00        
            bvs __ff1c         ; $ff19: 70 01     
            .hex ab            ; $ff1b: ab        Suspected data
__ff1c:     ora ($93,x)        ; $ff1c: 01 93     
            ora ($7c,x)        ; $ff1e: 01 7c     
            ora ($67,x)        ; $ff20: 01 67     
            ora ($52,x)        ; $ff22: 01 52     
            ora ($3f,x)        ; $ff24: 01 3f     
            ora ($2d,x)        ; $ff26: 01 2d     
            ora ($1c,x)        ; $ff28: 01 1c     
            ora ($0c,x)        ; $ff2a: 01 0c     
            brk                ; $ff2c: 00        
            sbc __ee00,x       ; $ff2d: fd 00 ee  
            brk                ; $ff30: 00        
            sbc ($02,x)        ; $ff31: e1 02     
            .hex 3a            ; $ff33: 3a        Invalid Opcode - NOP 
            .hex 02            ; $ff34: 02        Invalid Opcode - KIL 
            .hex 1a            ; $ff35: 1a        Invalid Opcode - NOP 
            ora ($fc,x)        ; $ff36: 01 fc     
            ora ($df,x)        ; $ff38: 01 df     
            ora ($c4,x)        ; $ff3a: 01 c4     
            brk                ; $ff3c: 00        
            asl $7504          ; $ff3d: 0e 04 75  
__ff40:     ora $0a            ; $ff40: 05 0a     
            .hex 14 28         ; $ff42: 14 28     Invalid Opcode - NOP $28,x
            bvc __ff64         ; $ff44: 50 1e     
            ora $0a            ; $ff46: 05 0a     
            .hex 14 28         ; $ff48: 14 28     Invalid Opcode - NOP $28,x
            bvc __ff6a         ; $ff4a: 50 1e     
            asl $07            ; $ff4c: 06 07     
            .hex 5a            ; $ff4e: 5a        Invalid Opcode - NOP 
            .hex 5c 5e 60      ; $ff4f: 5c 5e 60  Invalid Opcode - NOP $605e,x
            ldx #$69           ; $ff52: a2 69     
            .hex 67 6b         ; $ff54: 67 6b     Invalid Opcode - RRA $6b
            tay                ; $ff56: a8        
            sty $68            ; $ff57: 84 68     
            ror $02            ; $ff59: 66 02     
            bit $60            ; $ff5b: 24 60     
            .hex 02            ; $ff5d: 02        Invalid Opcode - KIL 
            txs                ; $ff5e: 9a        
            plp                ; $ff5f: 28        
            .hex ab ed         ; $ff60: ab ed     Invalid Opcode - LAX #$ed
            .hex ef b1         ; $ff62: ef b1     Suspected data
__ff64:     cmp $c7            ; $ff64: c5 c7     
            .hex 89 cb         ; $ff66: 89 cb     Invalid Opcode - NOP #$cb
            .hex cd d0         ; $ff68: cd d0     Suspected data
__ff6a:     .hex 42            ; $ff6a: 42        Invalid Opcode - KIL 
            .hex 02            ; $ff6b: 02        Invalid Opcode - KIL 
            .hex 04 4a         ; $ff6c: 04 4a     Invalid Opcode - NOP $4a
            .hex 02            ; $ff6e: 02        Invalid Opcode - KIL 
            cpy $a302          ; $ff6f: cc 02 a3  
            .hex e3 e3         ; $ff72: e3 e3     Invalid Opcode - ISC ($e3,x)
            .hex 64 02         ; $ff74: 64 02     Invalid Opcode - NOP $02
            ldx $28            ; $ff76: a6 28     
            rol                ; $ff78: 2a        
            plp                ; $ff79: 28        
            rol                ; $ff7a: 2a        
            plp                ; $ff7b: 28        
            .hex a7 e9         ; $ff7c: a7 e9     Invalid Opcode - LAX $e9
            cmp $4a            ; $ff7e: c5 4a     
            .hex 02            ; $ff80: 02        Invalid Opcode - KIL 
            sty $2e            ; $ff81: 84 2e     
            lda #$e7           ; $ff83: a9 e7     
            sbc $a3            ; $ff85: e5 a3     
            .hex e3 e3         ; $ff87: e3 e3     Invalid Opcode - ISC ($e3,x)
            .hex 64 02         ; $ff89: 64 02     Invalid Opcode - NOP $02
            ldx $28            ; $ff8b: a6 28     
            rol                ; $ff8d: 2a        
            plp                ; $ff8e: 28        
            rol                ; $ff8f: 2a        
            plp                ; $ff90: 28        
            .hex 52            ; $ff91: 52        Invalid Opcode - KIL 
            .hex 02            ; $ff92: 02        Invalid Opcode - KIL 
            asl $024a          ; $ff93: 0e 4a 02  
            cpy $02            ; $ff96: c4 02     
            brk                ; $ff98: 00        
            .hex 9b            ; $ff99: 9b        Invalid Opcode - TAS 
            .hex db db 5e      ; $ff9a: db db 5e  Invalid Opcode - DCP $5edb,y
            .hex 02            ; $ff9d: 02        Invalid Opcode - KIL 
            txs                ; $ff9e: 9a        
            .hex 9e 02 03      ; $ff9f: 9e 02 03  Invalid Opcode - SHX $0302,y
            .hex 9b            ; $ffa2: 9b        Invalid Opcode - TAS 
            .hex db db 5e      ; $ffa3: db db 5e  Invalid Opcode - DCP $5edb,y
            .hex 02            ; $ffa6: 02        Invalid Opcode - KIL 
            txs                ; $ffa7: 9a        
            .hex 9e 02 48      ; $ffa8: 9e 02 48  Invalid Opcode - SHX $4802,y
            .hex 02            ; $ffab: 02        Invalid Opcode - KIL 
            php                ; $ffac: 08        
            .hex 44 02         ; $ffad: 44 02     Invalid Opcode - NOP $02
            inx                ; $ffaf: e8        
            .hex 02            ; $ffb0: 02        Invalid Opcode - KIL 
            lda #$e9           ; $ffb1: a9 e9     
            sbc #$6c           ; $ffb3: e9 6c     
            .hex 02            ; $ffb5: 02        Invalid Opcode - KIL 
            tax                ; $ffb6: aa        
            bcs __ffbb         ; $ffb7: b0 02     
            .hex a7 e9         ; $ffb9: a7 e9     Invalid Opcode - LAX $e9
__ffbb:     cmp $4a            ; $ffbb: c5 4a     
            .hex 02            ; $ffbd: 02        Invalid Opcode - KIL 
            sty $2e            ; $ffbe: 84 2e     
            lda #$e7           ; $ffc0: a9 e7     
            sbc $a9            ; $ffc2: e5 a9     
            sbc #$e9           ; $ffc4: e9 e9     
            jmp ($aa02)        ; $ffc6: 6c 02 aa  

;-------------------------------------------------------------------------------
            bcs __ffcd         ; $ffc9: b0 02     
            cli                ; $ffcb: 58        
            .hex 02            ; $ffcc: 02        Invalid Opcode - KIL 
__ffcd:     clc                ; $ffcd: 18        
            .hex 54 02         ; $ffce: 54 02     Invalid Opcode - NOP $02,x
            cpy $2802          ; $ffd0: cc 02 28  
            rol $28            ; $ffd3: 26 28     
            rol $e8            ; $ffd5: 26 e8     
            brk                ; $ffd7: 00        
            brk                ; $ffd8: 00        
__ffd9:     .hex 50 51         ; $ffd9: 50 51     Illegal Branch - BVC #$51
            eor ($51),y        ; $ffdb: 51 51     
            eor ($51),y        ; $ffdd: 51 51     
            eor ($51),y        ; $ffdf: 51 51     
            eor ($52),y        ; $ffe1: 51 52     
            .hex 52            ; $ffe3: 52        Invalid Opcode - KIL 
            .hex 52            ; $ffe4: 52        Invalid Opcode - KIL 
            .hex 52            ; $ffe5: 52        Invalid Opcode - KIL 
            .hex 52            ; $ffe6: 52        Invalid Opcode - KIL 
            .hex 52            ; $ffe7: 52        Invalid Opcode - KIL 
            .hex 53 53         ; $ffe8: 53 53     Invalid Opcode - SRE ($53),y
            .hex 53 53         ; $ffea: 53 53     Invalid Opcode - SRE ($53),y
            .hex 53 54         ; $ffec: 53 54     Invalid Opcode - SRE ($54),y
            .hex 54 54         ; $ffee: 54 54     Invalid Opcode - NOP $54,x

;-------------------------------------------------------------------------------
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        .hex 54 55         ; $fff0: 54 55     Invalid Opcode - NOP $55,x
            eor $55,x          ; $fff2: 55 55     
            lsr $56,x          ; $fff4: 56 56     
            lsr $56,x          ; $fff6: 56 56     
            .hex 57 ff         ; $fff8: 57 ff     Invalid Opcode - SRE $ff,x

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: 76 c0     Vector table
            .dw reset                      ; $fffc: 14 c0     Vector table
            .dw irq                        ; $fffe: f0 ff     Vector table
