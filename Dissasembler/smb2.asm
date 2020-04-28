;-------------------------------------------------------------------------------
; smb2.nes disasembled by DISASM6 v1.5
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 8              ; 8 x 16k PRG banks
            .db 16             ; 16 x 8k CHR banks
            .db %01000000      ; Mirroring: Horizontal
                               ; SRAM: Not used
                               ; 512k Trainer: Not used
                               ; 4 Screen VRAM: Not used
                               ; Mapper: 4
            .db %00000000      ; RomType: NES
            .hex 00 00 00 00   ; iNES Tail 
            .hex 00 00 00 00    

;-------------------------------------------------------------------------------
; Program Origin
;-------------------------------------------------------------------------------
            .org $8000         ; Set program counter

;-------------------------------------------------------------------------------
; ROM Start
;-------------------------------------------------------------------------------
__8000:     lda $0502          ; $8000: ad 02 05  
            .hex d0            ; $8003: d0        Suspected data
__8004:     cli                ; $8004: 58        
            lda #$01           ; $8005: a9 01     
            .hex 20            ; $8007: 20        Suspected data
__8008:     ldy #$ff           ; $8008: a0 ff     
            .hex ad 33         ; $800a: ad 33     Suspected data
__800c:     ora $d0            ; $800c: 05 d0     
            .hex 04 a9         ; $800e: 04 a9     Invalid Opcode - NOP $a9
            ora #$d0           ; $8010: 09 d0     
            .hex 03 38         ; $8012: 03 38     Invalid Opcode - SLO ($38,x)
            sbc #$01           ; $8014: e9 01     
            ora #$c0           ; $8016: 09 c0     
            sta $cf            ; $8018: 85 cf     
            sec                ; $801a: 38        
            sbc #$40           ; $801b: e9 40     
            sta $ce            ; $801d: 85 ce     
            lda $0533          ; $801f: ad 33 05  
            clc                ; $8022: 18        
            adc #$01           ; $8023: 69 01     
            cmp #$0a           ; $8025: c9 0a     
            bne __802b         ; $8027: d0 02     
            lda #$00           ; $8029: a9 00     
__802b:     ora #$10           ; $802b: 09 10     
            sta $d0            ; $802d: 85 d0     
            lda $0533          ; $802f: ad 33 05  
            ldy #$00           ; $8032: a0 00     
            jsr __86ee         ; $8034: 20 ee 86  
            lda #$20           ; $8037: a9 20     
            sta $d3            ; $8039: 85 d3     
            lda #$60           ; $803b: a9 60     
            sta $d4            ; $803d: 85 d4     
            inc $0502          ; $803f: ee 02 05  
            lda #$e0           ; $8042: a9 e0     
            sta $e2            ; $8044: 85 e2     
            lda #$01           ; $8046: a9 01     
            sta $e4            ; $8048: 85 e4     
            sta $053a          ; $804a: 8d 3a 05  
            lsr                ; $804d: 4a        
            sta $d2            ; $804e: 85 d2     
            ldy $0533          ; $8050: ac 33 05  
            jsr __95af         ; $8053: 20 af 95  
            sta $cb            ; $8056: 85 cb     
            sty $ca            ; $8058: 84 ca     
            jsr __946d         ; $805a: 20 6d 94  
            lda #$00           ; $805d: a9 00     
            sta $06            ; $805f: 85 06     
            lda #$ff           ; $8061: a9 ff     
            sta $0505          ; $8063: 8d 05 05  
            lda #$a0           ; $8066: a9 a0     
            sta $0507          ; $8068: 8d 07 05  
            jsr __823d         ; $806b: 20 3d 82  
            lda $053a          ; $806e: ad 3a 05  
            bne __8082         ; $8071: d0 0f     
            inc $13            ; $8073: e6 13     
            lda #$e8           ; $8075: a9 e8     
            sta $e1            ; $8077: 85 e1     
            lda #$c8           ; $8079: a9 c8     
            sta $e2            ; $807b: 85 e2     
            lda #$00           ; $807d: a9 00     
            .hex 8d 02         ; $807f: 8d 02     Suspected data
__8081:     .hex 05            ; $8081: 05        Suspected data
__8082:     rts                ; $8082: 60        

;-------------------------------------------------------------------------------
            lda $d8            ; $8083: a5 d8     
            and #$04           ; $8085: 29 04     
            bne __809d         ; $8087: d0 14     
            lda $d8            ; $8089: a5 d8     
            and #$07           ; $808b: 29 07     
            bne __8092         ; $808d: d0 03     
            jmp __819c         ; $808f: 4c 9c 81  

;-------------------------------------------------------------------------------
__8092:     lda $d8            ; $8092: a5 d8     
            ora #$04           ; $8094: 09 04     
            sta $d8            ; $8096: 85 d8     
            lda #$12           ; $8098: a9 12     
            sta $0504          ; $809a: 8d 04 05  
__809d:     lda $d8            ; $809d: a5 d8     
            lsr                ; $809f: 4a        
            lda $fc            ; $80a0: a5 fc     
            bcc __8103         ; $80a2: 90 5f     
            bne __80b1         ; $80a4: d0 0b     
            lda $cf            ; $80a6: a5 cf     
            and #$0f           ; $80a8: 29 0f     
            cmp #$09           ; $80aa: c9 09     
            bne __80b1         ; $80ac: d0 03     
            jmp __819c         ; $80ae: 4c 9c 81  

;-------------------------------------------------------------------------------
__80b1:     lda #$01           ; $80b1: a9 01     
            jsr __895d         ; $80b3: 20 5d 89  
            lda $fc            ; $80b6: a5 fc     
            sec                ; $80b8: 38        
            sbc #$04           ; $80b9: e9 04     
            sta $fc            ; $80bb: 85 fc     
            lda $cb            ; $80bd: a5 cb     
            sec                ; $80bf: 38        
            sbc #$04           ; $80c0: e9 04     
            sta $cb            ; $80c2: 85 cb     
            bcs __80c8         ; $80c4: b0 02     
            dec $ca            ; $80c6: c6 ca     
__80c8:     lda $fc            ; $80c8: a5 fc     
            cmp #$fc           ; $80ca: c9 fc     
            bne __80db         ; $80cc: d0 0d     
            lda #$ec           ; $80ce: a9 ec     
            sta $fc            ; $80d0: 85 fc     
            lda $c8            ; $80d2: a5 c8     
            eor #$02           ; $80d4: 49 02     
            sta $c8            ; $80d6: 85 c8     
            lsr                ; $80d8: 4a        
            sta $c9            ; $80d9: 85 c9     
__80db:     lda $fc            ; $80db: a5 fc     
            and #$07           ; $80dd: 29 07     
            beq __80e2         ; $80df: f0 01     
            rts                ; $80e1: 60        

;-------------------------------------------------------------------------------
__80e2:     ldx #$00           ; $80e2: a2 00     
            jsr __8287         ; $80e4: 20 87 82  
            inx                ; $80e7: e8        
            jsr __8287         ; $80e8: 20 87 82  
            lda $fc            ; $80eb: a5 fc     
            and #$0f           ; $80ed: 29 0f     
            bne __80fb         ; $80ef: d0 0a     
            ldx #$00           ; $80f1: a2 00     
            jsr __8297         ; $80f3: 20 97 82  
            ldx #$01           ; $80f6: a2 01     
            jsr __8297         ; $80f8: 20 97 82  
__80fb:     ldx #$01           ; $80fb: a2 01     
            jsr __82e2         ; $80fd: 20 e2 82  
            jmp __8170         ; $8100: 4c 70 81  

;-------------------------------------------------------------------------------
__8103:     bne __8121         ; $8103: d0 1c     
            lda $053f          ; $8105: ad 3f 05  
            sta $0f            ; $8108: 85 0f     
            cmp #$09           ; $810a: c9 09     
            bne __8114         ; $810c: d0 06     
            lda #$00           ; $810e: a9 00     
            sta $0f            ; $8110: 85 0f     
            beq __8116         ; $8112: f0 02     
__8114:     inc $0f            ; $8114: e6 0f     
__8116:     lda $d0            ; $8116: a5 d0     
            and #$0f           ; $8118: 29 0f     
            cmp $0f            ; $811a: c5 0f     
            bne __8121         ; $811c: d0 03     
            jmp __819c         ; $811e: 4c 9c 81  

;-------------------------------------------------------------------------------
__8121:     lda #$01           ; $8121: a9 01     
            jsr __895d         ; $8123: 20 5d 89  
            lda $fc            ; $8126: a5 fc     
            clc                ; $8128: 18        
            adc #$04           ; $8129: 69 04     
            sta $fc            ; $812b: 85 fc     
            lda $cb            ; $812d: a5 cb     
            clc                ; $812f: 18        
            adc #$04           ; $8130: 69 04     
            sta $cb            ; $8132: 85 cb     
            bcc __8138         ; $8134: 90 02     
            inc $ca            ; $8136: e6 ca     
__8138:     lda $fc            ; $8138: a5 fc     
            and #$07           ; $813a: 29 07     
            beq __813f         ; $813c: f0 01     
            rts                ; $813e: 60        

;-------------------------------------------------------------------------------
__813f:     lda $fc            ; $813f: a5 fc     
            cmp #$f0           ; $8141: c9 f0     
            bne __8152         ; $8143: d0 0d     
            lda #$00           ; $8145: a9 00     
            sta $fc            ; $8147: 85 fc     
            lda $c8            ; $8149: a5 c8     
            eor #$02           ; $814b: 49 02     
            sta $c8            ; $814d: 85 c8     
            lsr                ; $814f: 4a        
            sta $c9            ; $8150: 85 c9     
__8152:     ldx #$02           ; $8152: a2 02     
            jsr __828f         ; $8154: 20 8f 82  
            dex                ; $8157: ca        
            jsr __828f         ; $8158: 20 8f 82  
            lda $d4            ; $815b: a5 d4     
            and #$20           ; $815d: 29 20     
            bne __816b         ; $815f: d0 0a     
            ldx #$02           ; $8161: a2 02     
            jsr __82be         ; $8163: 20 be 82  
            ldx #$01           ; $8166: a2 01     
            jsr __82be         ; $8168: 20 be 82  
__816b:     .hex a2            ; $816b: a2        Suspected data
__816c:     .hex 02            ; $816c: 02        Invalid Opcode - KIL 
            jsr __82e2         ; $816d: 20 e2 82  
__8170:     lda $0504          ; $8170: ad 04 05  
            cmp #$12           ; $8173: c9 12     
            bne __818f         ; $8175: d0 18     
            lda #$01           ; $8177: a9 01     
            sta $e4            ; $8179: 85 e4     
            lda $d8            ; $817b: a5 d8     
            lsr                ; $817d: 4a        
            bcc __8186         ; $817e: 90 06     
__8180:     ldx #$01           ; $8180: a2 01     
            lda #$00           ; $8182: a9 00     
            beq __818a         ; $8184: f0 04     
__8186:     ldx #$02           ; $8186: a2 02     
            lda #$10           ; $8188: a9 10     
__818a:     sta $01            ; $818a: 85 01     
            jsr __8314         ; $818c: 20 14 83  
__818f:     jsr __833e         ; $818f: 20 3e 83  
            dec $0504          ; $8192: ce 04 05  
            bne __81a0         ; $8195: d0 09     
            lda #$00           ; $8197: a9 00     
            .hex 20 5d         ; $8199: 20 5d     Suspected data
__819b:     .hex 89            ; $819b: 89        Suspected data
__819c:     lda #$00           ; $819c: a9 00     
            sta $d8            ; $819e: 85 d8     
__81a0:     rts                ; $81a0: 60        

;-------------------------------------------------------------------------------
            ora ($a5,x)        ; $81a1: 01 a5     
            .hex fc 8d 09      ; $81a3: fc 8d 09  Invalid Opcode - NOP $098d,x
            ora $a5            ; $81a6: 05 a5     
            sbc $0a8d,x        ; $81a8: fd 8d 0a  
            ora $a5            ; $81ab: 05 a5     
            iny                ; $81ad: c8        
            sta $050b          ; $81ae: 8d 0b 05  
            lda $c9            ; $81b1: a5 c9     
            sta $050c          ; $81b3: 8d 0c 05  
            lda $ca            ; $81b6: a5 ca     
            sta $0513          ; $81b8: 8d 13 05  
            lda $cb            ; $81bb: a5 cb     
            sta $0515          ; $81bd: 8d 15 05  
            lda $04be          ; $81c0: ad be 04  
            sta $0514          ; $81c3: 8d 14 05  
            lda $e1            ; $81c6: a5 e1     
            sta $0517          ; $81c8: 8d 17 05  
            lda #$00           ; $81cb: a9 00     
            sta $fc            ; $81cd: 85 fc     
            sta $fd            ; $81cf: 85 fd     
            sta $c8            ; $81d1: 85 c8     
            sta $c9            ; $81d3: 85 c9     
            rts                ; $81d5: 60        

;-------------------------------------------------------------------------------
            lda $0509          ; $81d6: ad 09 05  
            sta $fc            ; $81d9: 85 fc     
            lda $050a          ; $81db: ad 0a 05  
            sta $fd            ; $81de: 85 fd     
            sta $04c0          ; $81e0: 8d c0 04  
            lda $050b          ; $81e3: ad 0b 05  
            sta $c8            ; $81e6: 85 c8     
            lda $050c          ; $81e8: ad 0c 05  
            sta $c9            ; $81eb: 85 c9     
            lda $0514          ; $81ed: ad 14 05  
            sta $04be          ; $81f0: 8d be 04  
            lda $0513          ; $81f3: ad 13 05  
            sta $ca            ; $81f6: 85 ca     
            lda $0515          ; $81f8: ad 15 05  
            sta $cb            ; $81fb: 85 cb     
            rts                ; $81fd: 60        

;-------------------------------------------------------------------------------
            lda $cf            ; $81fe: a5 cf     
            and #$10           ; $8200: 29 10     
            beq __820b         ; $8202: f0 07     
            lda $e1            ; $8204: a5 e1     
            sec                ; $8206: 38        
            .hex e9            ; $8207: e9        Suspected data
__8208:     php                ; $8208: 08        
            sta $e1            ; $8209: 85 e1     
__820b:     lda #$01           ; $820b: a9 01     
            .hex 85            ; $820d: 85        Suspected data
__820e:     cpx $a5            ; $820e: e4 a5     
            .hex cf 85 ce      ; $8210: cf 85 ce  Invalid Opcode - DCP __ce85
            .hex a9            ; $8213: a9        Suspected data
__8214:     bpl __819b         ; $8214: 10 85     
            ora ($a2,x)        ; $8216: 01 a2     
            brk                ; $8218: 00        
            jsr __8314         ; $8219: 20 14 83  
            lda $d3            ; $821c: a5 d3     
            sta $d2            ; $821e: 85 d2     
            lda $e1            ; $8220: a5 e1     
            sta $e2            ; $8222: 85 e2     
            ldx #$01           ; $8224: a2 01     
            jsr __846a         ; $8226: 20 6a 84  
            lda #$f0           ; $8229: a9 f0     
            sta $0506          ; $822b: 8d 06 05  
            sta $0507          ; $822e: 8d 07 05  
            lda $d0            ; $8231: a5 d0     
            sta $0505          ; $8233: 8d 05 05  
            inc $d5            ; $8236: e6 d5     
            lda #$01           ; $8238: a9 01     
            sta $06            ; $823a: 85 06     
            rts                ; $823c: 60        

;-------------------------------------------------------------------------------
__823d:     ldx #$00           ; $823d: a2 00     
            stx $0537          ; $823f: 8e 37 05  
            jsr __82e2         ; $8242: 20 e2 82  
            jsr __833e         ; $8245: 20 3e 83  
            ldx #$00           ; $8248: a2 00     
            jsr __828f         ; $824a: 20 8f 82  
            lda $0506          ; $824d: ad 06 05  
            .hex c5            ; $8250: c5        Suspected data
__8251:     cmp ($d0),y        ; $8251: d1 d0     
__8253:     .hex 23 ad         ; $8253: 23 ad     Invalid Opcode - RLA ($ad,x)
            .hex 07            ; $8255: 07        Suspected data
__8256:     ora $18            ; $8256: 05 18     
            adc #$20           ; $8258: 69 20     
            cmp $d2            ; $825a: c5 d2     
            bne __8277         ; $825c: d0 19     
__825e:     lda $06            ; $825e: a5 06     
            tax                ; $8260: aa        
            beq __8268         ; $8261: f0 05     
            lda $0517          ; $8263: ad 17 05  
            sta $e1            ; $8266: 85 e1     
__8268:     inc $0537          ; $8268: ee 37 05  
            lda #$00           ; $826b: a9 00     
            sta $053a,x        ; $826d: 9d 3a 05  
            sta $053d          ; $8270: 8d 3d 05  
            sta $053e          ; $8273: 8d 3e 05  
            rts                ; $8276: 60        

;-------------------------------------------------------------------------------
__8277:     lda $d2            ; $8277: a5 d2     
            and #$20           ; $8279: 29 20     
            bne __828e         ; $827b: d0 11     
__827d:     lda $ce            ; $827d: a5 ce     
            cmp $0505          ; $827f: cd 05 05  
            beq __825e         ; $8282: f0 da     
            jmp __82be         ; $8284: 4c be 82  

;-------------------------------------------------------------------------------
__8287:     .hex b5            ; $8287: b5        Suspected data
__8288:     .hex d3 38         ; $8288: d3 38     Invalid Opcode - DCP ($38),y
            sbc #$20           ; $828a: e9 20     
            sta $d3,x          ; $828c: 95 d3     
__828e:     rts                ; $828e: 60        

;-------------------------------------------------------------------------------
__828f:     lda $d2,x          ; $828f: b5 d2     
            clc                ; $8291: 18        
            adc #$20           ; $8292: 69 20     
            sta $d2,x          ; $8294: 95 d2     
            rts                ; $8296: 60        

;-------------------------------------------------------------------------------
__8297:     lda $cf,x          ; $8297: b5 cf     
            sec                ; $8299: 38        
            sbc #$10           ; $829a: e9 10     
            sta $cf,x          ; $829c: 95 cf     
            and #$f0           ; $829e: 29 f0     
            cmp #$f0           ; $82a0: c9 f0     
            bne __82bd         ; $82a2: d0 19     
            lda $cf,x          ; $82a4: b5 cf     
            and #$0f           ; $82a6: 29 0f     
            clc                ; $82a8: 18        
            adc #$e0           ; $82a9: 69 e0     
            sta $cf,x          ; $82ab: 95 cf     
            dec $cf,x          ; $82ad: d6 cf     
            lda $cf,x          ; $82af: b5 cf     
            cmp #$df           ; $82b1: c9 df     
            bne __82b9         ; $82b3: d0 04     
            lda #$e9           ; $82b5: a9 e9     
            sta $cf,x          ; $82b7: 95 cf     
__82b9:     lda #$a0           ; $82b9: a9 a0     
            sta $d3,x          ; $82bb: 95 d3     
__82bd:     rts                ; $82bd: 60        

;-------------------------------------------------------------------------------
__82be:     lda $ce,x          ; $82be: b5 ce     
            clc                ; $82c0: 18        
            adc #$10           ; $82c1: 69 10     
            sta $ce,x          ; $82c3: 95 ce     
            and #$f0           ; $82c5: 29 f0     
            cmp #$f0           ; $82c7: c9 f0     
            bne __82e1         ; $82c9: d0 16     
            lda $ce,x          ; $82cb: b5 ce     
            and #$0f           ; $82cd: 29 0f     
            sta $ce,x          ; $82cf: 95 ce     
            inc $ce,x          ; $82d1: f6 ce     
            lda $ce,x          ; $82d3: b5 ce     
            cmp #$0a           ; $82d5: c9 0a     
            bne __82dd         ; $82d7: d0 04     
            lda #$00           ; $82d9: a9 00     
            sta $ce,x          ; $82db: 95 ce     
__82dd:     lda #$00           ; $82dd: a9 00     
            sta $d2,x          ; $82df: 95 d2     
__82e1:     rts                ; $82e1: 60        

;-------------------------------------------------------------------------------
__82e2:     lda $ce,x          ; $82e2: b5 ce     
            and #$0f           ; $82e4: 29 0f     
            tay                ; $82e6: a8        
            lda __ba5b,y       ; $82e7: b9 5b ba  
            sta $e9            ; $82ea: 85 e9     
            lda __ba66,y       ; $82ec: b9 66 ba  
            sta $ea            ; $82ef: 85 ea     
            lda $ce,x          ; $82f1: b5 ce     
            and #$f0           ; $82f3: 29 f0     
            sta $d7            ; $82f5: 85 d7     
            lda $ce,x          ; $82f7: b5 ce     
            lsr                ; $82f9: 4a        
            bcc __8300         ; $82fa: 90 04     
            lda #$20           ; $82fc: a9 20     
            bne __8302         ; $82fe: d0 02     
__8300:     lda #$28           ; $8300: a9 28     
__8302:     sta $d1            ; $8302: 85 d1     
            lda $ce,x          ; $8304: b5 ce     
            and #$c0           ; $8306: 29 c0     
            asl                ; $8308: 0a        
            rol                ; $8309: 2a        
            rol                ; $830a: 2a        
            adc $d1            ; $830b: 65 d1     
            sta $d1            ; $830d: 85 d1     
            lda $d2,x          ; $830f: b5 d2     
__8311:     sta $d2            ; $8311: 85 d2     
__8313:     rts                ; $8313: 60        

;-------------------------------------------------------------------------------
__8314:     .hex b5            ; $8314: b5        Suspected data
__8315:     dec $1029          ; $8315: ce 29 10  
            beq __8313         ; $8318: f0 f9     
            lda $ce,x          ; $831a: b5 ce     
            sta $03            ; $831c: 85 03     
            sec                ; $831e: 38        
            sbc $01            ; $831f: e5 01     
            sta $ce,x          ; $8321: 95 ce     
__8323:     jsr __82e2         ; $8323: 20 e2 82  
            lda #$0f           ; $8326: a9 0f     
            sta $e3            ; $8328: 85 e3     
            lda #$00           ; $832a: a9 00     
            sta $d6            ; $832c: 85 d6     
__832e:     jsr __84ac         ; $832e: 20 ac 84  
            lda $e3            ; $8331: a5 e3     
            bpl __832e         ; $8333: 10 f9     
            lda $03            ; $8335: a5 03     
            sta $ce,x          ; $8337: 95 ce     
            dec $e4            ; $8339: c6 e4     
            jmp __82e2         ; $833b: 4c e2 82  

;-------------------------------------------------------------------------------
__833e:     ldx $0300          ; $833e: ae 00 03  
            lda $d1            ; $8341: a5 d1     
            sta $0301,x        ; $8343: 9d 01 03  
            inx                ; $8346: e8        
            lda $d2            ; $8347: a5 d2     
            sta $0301,x        ; $8349: 9d 01 03  
            inx                ; $834c: e8        
            lda #$20           ; $834d: a9 20     
            sta $0301,x        ; $834f: 9d 01 03  
            inx                ; $8352: e8        
            lda #$00           ; $8353: a9 00     
            sta $d6            ; $8355: 85 d6     
            lda #$0f           ; $8357: a9 0f     
            sta $e3            ; $8359: 85 e3     
            lda $d5            ; $835b: a5 d5     
            beq __836c         ; $835d: f0 0d     
            ldy $d7            ; $835f: a4 d7     
            cpy #$e0           ; $8361: c0 e0     
            bne __836c         ; $8363: d0 07     
            lda #$00           ; $8365: a9 00     
            sta $e4            ; $8367: 85 e4     
            inc $0539          ; $8369: ee 39 05  
__836c:     ldy $d7            ; $836c: a4 d7     
            lda ($e9),y        ; $836e: b1 e9     
            sta $051b          ; $8370: 8d 1b 05  
            and #$c0           ; $8373: 29 c0     
            asl                ; $8375: 0a        
            rol                ; $8376: 2a        
__8377:     rol                ; $8377: 2a        
            tay                ; $8378: a8        
            lda __f7e9,y       ; $8379: b9 e9 f7  
            sta $00            ; $837c: 85 00     
            lda __f7ed,y       ; $837e: b9 ed f7  
            sta $01            ; $8381: 85 01     
            ldy $d7            ; $8383: a4 d7     
            lda ($e9),y        ; $8385: b1 e9     
            asl                ; $8387: 0a        
            asl                ; $8388: 0a        
            tay                ; $8389: a8        
            lda $d5            ; $838a: a5 d5     
            beq __8390         ; $838c: f0 02     
            iny                ; $838e: c8        
            iny                ; $838f: c8        
__8390:     lda ($00),y        ; $8390: b1 00     
            sta $0301,x        ; $8392: 9d 01 03  
            inc $d6            ; $8395: e6 d6     
            inx                ; $8397: e8        
            iny                ; $8398: c8        
            lda $d6            ; $8399: a5 d6     
            lsr                ; $839b: 4a        
            bcs __8390         ; $839c: b0 f2     
            inc $d7            ; $839e: e6 d7     
            lda $d5            ; $83a0: a5 d5     
            beq __83a7         ; $83a2: f0 03     
            jsr __8488         ; $83a4: 20 88 84  
__83a7:     lda $d6            ; $83a7: a5 d6     
            cmp #$20           ; $83a9: c9 20     
            bcc __836c         ; $83ab: 90 bf     
            lda #$00           ; $83ad: a9 00     
            sta $0301,x        ; $83af: 9d 01 03  
            stx $0300          ; $83b2: 8e 00 03  
            lda $d5            ; $83b5: a5 d5     
            beq __840b         ; $83b7: f0 52     
            lda $e4            ; $83b9: a5 e4     
            beq __83c2         ; $83bb: f0 05     
            dec $e4            ; $83bd: c6 e4     
            jmp __83de         ; $83bf: 4c de 83  

;-------------------------------------------------------------------------------
__83c2:     lda $d8            ; $83c2: a5 d8     
            lsr                ; $83c4: 4a        
            bcs __83d4         ; $83c5: b0 0d     
            ldx #$01           ; $83c7: a2 01     
            jsr __8412         ; $83c9: 20 12 84  
            ldx #$01           ; $83cc: a2 01     
            jsr __846a         ; $83ce: 20 6a 84  
            jmp __83de         ; $83d1: 4c de 83  

;-------------------------------------------------------------------------------
__83d4:     ldx #$00           ; $83d4: a2 00     
            jsr __8412         ; $83d6: 20 12 84  
            ldx #$00           ; $83d9: a2 00     
            jsr __8478         ; $83db: 20 78 84  
__83de:     ldx #$00           ; $83de: a2 00     
            lda $d8            ; $83e0: a5 d8     
            lsr                ; $83e2: 4a        
            bcc __83fa         ; $83e3: 90 15     
            inx                ; $83e5: e8        
            lda $cf,x          ; $83e6: b5 cf     
            and #$f0           ; $83e8: 29 f0     
            cmp #$e0           ; $83ea: c9 e0     
            beq __83f4         ; $83ec: f0 06     
            lda $cf,x          ; $83ee: b5 cf     
            and #$10           ; $83f0: 29 10     
            bne __840b         ; $83f2: d0 17     
__83f4:     jsr __8478         ; $83f4: 20 78 84  
            jmp __840b         ; $83f7: 4c 0b 84  

;-------------------------------------------------------------------------------
__83fa:     lda $cf,x          ; $83fa: b5 cf     
            and #$f0           ; $83fc: 29 f0     
            cmp #$e0           ; $83fe: c9 e0     
            beq __8408         ; $8400: f0 06     
            lda $cf,x          ; $8402: b5 cf     
            and #$10           ; $8404: 29 10     
            beq __840b         ; $8406: f0 03     
__8408:     jsr __846a         ; $8408: 20 6a 84  
__840b:     lda $d5            ; $840b: a5 d5     
            eor #$01           ; $840d: 49 01     
            sta $d5            ; $840f: 85 d5     
            rts                ; $8411: 60        

;-------------------------------------------------------------------------------
__8412:     ldy $0300          ; $8412: ac 00 03  
            lda $d1            ; $8415: a5 d1     
            ora #$03           ; $8417: 09 03     
            sta $0301,y        ; $8419: 99 01 03  
            iny                ; $841c: c8        
            lda $e1,x          ; $841d: b5 e1     
            sta $0301,y        ; $841f: 99 01 03  
            iny                ; $8422: c8        
            lda #$08           ; $8423: a9 08     
            sta $0301,y        ; $8425: 99 01 03  
            iny                ; $8428: c8        
            ldx #$07           ; $8429: a2 07     
__842b:     lda $0539          ; $842b: ad 39 05  
            beq __843b         ; $842e: f0 0b     
            lda $d9,x          ; $8430: b5 d9     
            lsr                ; $8432: 4a        
            lsr                ; $8433: 4a        
            lsr                ; $8434: 4a        
            lsr                ; $8435: 4a        
            sta $d9,x          ; $8436: 95 d9     
            jmp __8452         ; $8438: 4c 52 84  

;-------------------------------------------------------------------------------
__843b:     lda $d8            ; $843b: a5 d8     
            lsr                ; $843d: 4a        
            bcc __8452         ; $843e: 90 12     
            .hex b5            ; $8440: b5        Suspected data
__8441:     cmp $0a0a,y        ; $8441: d9 0a 0a  
            asl                ; $8444: 0a        
            asl                ; $8445: 0a        
            sta $01            ; $8446: 85 01     
            lda $d9,x          ; $8448: b5 d9     
            lsr                ; $844a: 4a        
            lsr                ; $844b: 4a        
            lsr                ; $844c: 4a        
            lsr                ; $844d: 4a        
            ora $01            ; $844e: 05 01     
            sta $d9,x          ; $8450: 95 d9     
__8452:     lda $d9,x          ; $8452: b5 d9     
            sta $0301,y        ; $8454: 99 01 03  
            iny                ; $8457: c8        
            dex                ; $8458: ca        
            bpl __842b         ; $8459: 10 d0     
            lda #$01           ; $845b: a9 01     
__845d:     sta $e4            ; $845d: 85 e4     
            lsr                ; $845f: 4a        
            .hex 8d            ; $8460: 8d        Suspected data
__8461:     and __9905,y       ; $8461: 39 05 99  
            ora ($03,x)        ; $8464: 01 03     
            sty $0300          ; $8466: 8c 00 03  
            rts                ; $8469: 60        

;-------------------------------------------------------------------------------
__846a:     lda $e1,x          ; $846a: b5 e1     
            clc                ; $846c: 18        
            adc #$08           ; $846d: 69 08     
            sta $e1,x          ; $846f: 95 e1     
            bcc __8477         ; $8471: 90 04     
            lda #$c0           ; $8473: a9 c0     
            sta $e1,x          ; $8475: 95 e1     
__8477:     rts                ; $8477: 60        

;-------------------------------------------------------------------------------
__8478:     lda $e1,x          ; $8478: b5 e1     
            sec                ; $847a: 38        
            sbc #$08           ; $847b: e9 08     
            sta $e1,x          ; $847d: 95 e1     
            cmp #$c0           ; $847f: c9 c0     
            bcs __8487         ; $8481: b0 04     
            lda #$f8           ; $8483: a9 f8     
            sta $e1,x          ; $8485: 95 e1     
__8487:     rts                ; $8487: 60        

;-------------------------------------------------------------------------------
__8488:     lda $e3            ; $8488: a5 e3     
            lsr                ; $848a: 4a        
            tay                ; $848b: a8        
            lda $00d9,y        ; $848c: b9 d9 00  
__848f:     lsr                ; $848f: 4a        
            lsr                ; $8490: 4a        
            .hex 99            ; $8491: 99        Suspected data
__8492:     cmp __ad00,y       ; $8492: d9 00 ad  
__8495:     .hex 1b 05 29      ; $8495: 1b 05 29  Invalid Opcode - SLO $2905,y
            cpy #$19           ; $8498: c0 19     
            cmp __9900,y       ; $849a: d9 00 99  
            cmp __c600,y       ; $849d: d9 00 c6  
            .hex e3 60         ; $84a0: e3 60     Invalid Opcode - ISC ($60,x)
            ldx #$07           ; $84a2: a2 07     
            lda #$00           ; $84a4: a9 00     
__84a6:     sta $d9,x          ; $84a6: 95 d9     
            dex                ; $84a8: ca        
__84a9:     bne __84a6         ; $84a9: d0 fb     
            rts                ; $84ab: 60        

;-------------------------------------------------------------------------------
__84ac:     ldy $d7            ; $84ac: a4 d7     
            lda ($e9),y        ; $84ae: b1 e9     
            sta $051b          ; $84b0: 8d 1b 05  
            inc $d7            ; $84b3: e6 d7     
            jmp __8488         ; $84b5: 4c 88 84  

;-------------------------------------------------------------------------------
            .hex ff            ; $84b8: ff        Suspected data
__84b9:     .hex ff ff ff      ; $84b9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84bc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84bf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84c2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84c5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84c8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $84cb: ff ff     Suspected data
__84cd:     .hex ff ff ff      ; $84cd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84d0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84d3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84d6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84d9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84dc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84df: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84e2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84e5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84e8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84eb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84ee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $84f1: ff        Suspected data
__84f2:     .hex ff ff ff      ; $84f2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84f5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84f8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $84fb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ad      ; $84fe: ff ff ad  Invalid Opcode - ISC __adff,x
            .hex 02            ; $8501: 02        Invalid Opcode - KIL 
            ora $d0            ; $8502: 05 d0     
            .hex 57 a9         ; $8504: 57 a9     Invalid Opcode - SRE $a9,x
            brk                ; $8506: 00        
            .hex 20 a0         ; $8507: 20 a0     Suspected data
__8509:     .hex ff 20 6d      ; $8509: ff 20 6d  Invalid Opcode - ISC $6d20,x
            sty $a9,x          ; $850c: 94 a9     
            brk                ; $850e: 00        
            sta $fc            ; $850f: 85 fc     
            lda $0533          ; $8511: ad 33 05  
            bne __851a         ; $8514: d0 04     
            lda #$09           ; $8516: a9 09     
            bne __851d         ; $8518: d0 03     
__851a:     sec                ; $851a: 38        
            sbc #$01           ; $851b: e9 01     
__851d:     ora #$d0           ; $851d: 09 d0     
            sta $cf            ; $851f: 85 cf     
            sec                ; $8521: 38        
            sbc #$20           ; $8522: e9 20     
            sta $ce            ; $8524: 85 ce     
            lda $0533          ; $8526: ad 33 05  
            clc                ; $8529: 18        
            adc #$01           ; $852a: 69 01     
            cmp #$0a           ; $852c: c9 0a     
            bne __8532         ; $852e: d0 02     
            lda #$00           ; $8530: a9 00     
__8532:     ora #$10           ; $8532: 09 10     
            sta $d0            ; $8534: 85 d0     
            lda $0533          ; $8536: ad 33 05  
            ldy #$01           ; $8539: a0 01     
            jsr __86ee         ; $853b: 20 ee 86  
            inc $0502          ; $853e: ee 02 05  
            lda $0533          ; $8541: ad 33 05  
            sta $04be          ; $8544: 8d be 04  
            lda #$01           ; $8547: a9 01     
            sta $053a          ; $8549: 8d 3a 05  
            lsr                ; $854c: 4a        
            sta $06            ; $854d: 85 06     
            lda #$ff           ; $854f: a9 ff     
            sta $0505          ; $8551: 8d 05 05  
            lda #$0f           ; $8554: a9 0f     
            sta $0507          ; $8556: 8d 07 05  
            jsr __856a         ; $8559: 20 6a 85  
            jsr __87aa         ; $855c: 20 aa 87  
            lda $053a          ; $855f: ad 3a 05  
            bne __8569         ; $8562: d0 05     
            sta $0502          ; $8564: 8d 02 05  
            inc $13            ; $8567: e6 13     
__8569:     rts                ; $8569: 60        

;-------------------------------------------------------------------------------
__856a:     lda $0533          ; $856a: ad 33 05  
            bne __8576         ; $856d: d0 07     
            lda $ba            ; $856f: a5 ba     
            bmi __85e7         ; $8571: 30 74     
            .hex ad            ; $8573: ad        Suspected data
__8574:     .hex 33 05         ; $8574: 33 05     Invalid Opcode - RLA ($05),y
__8576:     .hex cd            ; $8576: cd        Suspected data
__8577:     .hex 3f 05 d0      ; $8577: 3f 05 d0  Invalid Opcode - RLA __d005,x
            .hex 04 a5         ; $857a: 04 a5     Invalid Opcode - NOP $a5
            tsx                ; $857c: ba        
            bpl __85e7         ; $857d: 10 68     
__857f:     ldx #$02           ; $857f: a2 02     
            lda $ba            ; $8581: a5 ba     
            bpl __858b         ; $8583: 10 06     
            lda #$ff           ; $8585: a9 ff     
            sta $0b            ; $8587: 85 0b     
            bne __858f         ; $8589: d0 04     
__858b:     lda #$00           ; $858b: a9 00     
            sta $0b            ; $858d: 85 0b     
__858f:     lda $ba            ; $858f: a5 ba     
            and #$f0           ; $8591: 29 f0     
            clc                ; $8593: 18        
            adc $ce,x          ; $8594: 75 ce     
            php                ; $8596: 08        
            adc $0b            ; $8597: 65 0b     
            plp                ; $8599: 28        
            sta $0c            ; $859a: 85 0c     
            lda $0b            ; $859c: a5 0b     
            bne __85b1         ; $859e: d0 11     
            bcc __85c2         ; $85a0: 90 20     
            lda $ce,x          ; $85a2: b5 ce     
            and #$0f           ; $85a4: 29 0f     
            cmp #$09           ; $85a6: c9 09     
            bne __85c2         ; $85a8: d0 18     
            lda $0c            ; $85aa: a5 0c     
            and #$f0           ; $85ac: 29 f0     
            jmp __85c4         ; $85ae: 4c c4 85  

;-------------------------------------------------------------------------------
__85b1:     bcs __85c2         ; $85b1: b0 0f     
            lda $ce,x          ; $85b3: b5 ce     
            and #$0f           ; $85b5: 29 0f     
            bne __85c2         ; $85b7: d0 09     
            lda $0c            ; $85b9: a5 0c     
            and #$f0           ; $85bb: 29 f0     
            adc #$09           ; $85bd: 69 09     
            jmp __85c4         ; $85bf: 4c c4 85  

;-------------------------------------------------------------------------------
__85c2:     lda $0c            ; $85c2: a5 0c     
__85c4:     sta $ce,x          ; $85c4: 95 ce     
            dex                ; $85c6: ca        
            bpl __858f         ; $85c7: 10 c6     
            lda $ba            ; $85c9: a5 ba     
            sta $fd            ; $85cb: 85 fd     
            sta $04c0          ; $85cd: 8d c0 04  
            and #$f0           ; $85d0: 29 f0     
            sta $0536          ; $85d2: 8d 36 05  
            lda $ba            ; $85d5: a5 ba     
            bpl __85e7         ; $85d7: 10 0e     
            dec $04be          ; $85d9: ce be 04  
            lda $c9            ; $85dc: a5 c9     
            eor #$01           ; $85de: 49 01     
            sta $c9            ; $85e0: 85 c9     
            lda #$01           ; $85e2: a9 01     
            sta $0507          ; $85e4: 8d 07 05  
__85e7:     lda #$00           ; $85e7: a9 00     
            sta $ba            ; $85e9: 85 ba     
            rts                ; $85eb: 60        

;-------------------------------------------------------------------------------
            lda #$00           ; $85ec: a9 00     
            .hex 8d            ; $85ee: 8d        Suspected data
__85ef:     .hex 1c 05         ; $85ef: 1c 05     Suspected data
__85f1:     lda $0538          ; $85f1: ad 38 05  
            beq __862c         ; $85f4: f0 36     
            .hex ad            ; $85f6: ad        Suspected data
__85f7:     sec                ; $85f7: 38        
            ora $4a            ; $85f8: 05 4a     
            bcs __8618         ; $85fa: b0 1c     
            ldx #$02           ; $85fc: a2 02     
            stx $09            ; $85fe: 86 09     
            lda #$10           ; $8600: a9 10     
            sta $01            ; $8602: 85 01     
            dex                ; $8604: ca        
            lda $0538          ; $8605: ad 38 05  
            sta $d8            ; $8608: 85 d8     
            jsr __8901         ; $860a: 20 01 89  
            lda $03            ; $860d: a5 03     
            sta $d0            ; $860f: 85 d0     
            lda #$00           ; $8611: a9 00     
            sta $0538          ; $8613: 8d 38 05  
            beq __862c         ; $8616: f0 14     
__8618:     ldx #$01           ; $8618: a2 01     
            stx $09            ; $861a: 86 09     
            dex                ; $861c: ca        
            stx $01            ; $861d: 86 01     
            lda $0538          ; $861f: ad 38 05  
            sta $d8            ; $8622: 85 d8     
            jsr __8901         ; $8624: 20 01 89  
            lda #$00           ; $8627: a9 00     
            sta $0538          ; $8629: 8d 38 05  
__862c:     lda $ba            ; $862c: a5 ba     
            bne __8631         ; $862e: d0 01     
            rts                ; $8630: 60        

;-------------------------------------------------------------------------------
__8631:     lda $ba            ; $8631: a5 ba     
            bpl __863c         ; $8633: 10 07     
            lda #$01           ; $8635: a9 01     
            sta $d8            ; $8637: 85 d8     
            jmp __869a         ; $8639: 4c 9a 86  

;-------------------------------------------------------------------------------
__863c:     lda #$02           ; $863c: a9 02     
            sta $d8            ; $863e: 85 d8     
            ldx $ba            ; $8640: a6 ba     
__8642:     lda $fd            ; $8642: a5 fd     
            bne __8651         ; $8644: d0 0b     
            lda $04be          ; $8646: ad be 04  
            .hex cd            ; $8649: cd        Suspected data
__864a:     .hex 3f 05 d0      ; $864a: 3f 05 d0  Invalid Opcode - RLA __d005,x
            .hex 03 4c         ; $864d: 03 4c     Invalid Opcode - SLO ($4c,x)
            sbc #$86           ; $864f: e9 86     
__8651:     lda $fd            ; $8651: a5 fd     
__8653:     clc                ; $8653: 18        
            adc #$01           ; $8654: 69 01     
            sta $fd            ; $8656: 85 fd     
            sta $04c0          ; $8658: 8d c0 04  
            .hex 90            ; $865b: 90        Suspected data
__865c:     .hex 0c ee be      ; $865c: 0c ee be  Invalid Opcode - NOP __beee
            .hex 04 a5         ; $865f: 04 a5     Invalid Opcode - NOP $a5
            cmp #$49           ; $8661: c9 49     
            ora ($85,x)        ; $8663: 01 85     
__8665:     cmp #$0a           ; $8665: c9 0a     
            sta $c8            ; $8667: 85 c8     
            lda $04be          ; $8669: ad be 04  
            .hex cd 3f         ; $866c: cd 3f     Suspected data
__866e:     ora $f0            ; $866e: 05 f0     
__8670:     .hex 14 a5         ; $8670: 14 a5     Invalid Opcode - NOP $a5,x
            sbc __f029,x       ; $8672: fd 29 f0  
            cmp $0536          ; $8675: cd 36 05  
            beq __8682         ; $8678: f0 08     
            sta $0536          ; $867a: 8d 36 05  
            lda #$01           ; $867d: a9 01     
            sta $051c          ; $867f: 8d 1c 05  
__8682:     dex                ; $8682: ca        
            bne __8642         ; $8683: d0 bd     
            lda $051c          ; $8685: ad 1c 05  
            beq __86e9         ; $8688: f0 5f     
            ldx #$02           ; $868a: a2 02     
__868c:     jsr __87fc         ; $868c: 20 fc 87  
            dex                ; $868f: ca        
            bne __868c         ; $8690: d0 fa     
            ldx #$02           ; $8692: a2 02     
            jsr __8812         ; $8694: 20 12 88  
            jmp __86e6         ; $8697: 4c e6 86  

;-------------------------------------------------------------------------------
__869a:     ldx $ba            ; $869a: a6 ba     
__869c:     lda $fd            ; $869c: a5 fd     
            bne __86a8         ; $869e: d0 08     
            lda $04be          ; $86a0: ad be 04  
            bne __86a8         ; $86a3: d0 03     
            jmp __86e9         ; $86a5: 4c e9 86  

;-------------------------------------------------------------------------------
__86a8:     lda $fd            ; $86a8: a5 fd     
__86aa:     sec                ; $86aa: 38        
            sbc #$01           ; $86ab: e9 01     
            sta $fd            ; $86ad: 85 fd     
            sta $04c0          ; $86af: 8d c0 04  
            bcs __86c0         ; $86b2: b0 0c     
            dec $04be          ; $86b4: ce be 04  
            lda $c9            ; $86b7: a5 c9     
            eor #$01           ; $86b9: 49 01     
            sta $c9            ; $86bb: 85 c9     
            asl                ; $86bd: 0a        
            sta $c8            ; $86be: 85 c8     
__86c0:     lda $fd            ; $86c0: a5 fd     
            and #$f0           ; $86c2: 29 f0     
            cmp $0536          ; $86c4: cd 36 05  
            beq __86d1         ; $86c7: f0 08     
            sta $0536          ; $86c9: 8d 36 05  
            lda #$01           ; $86cc: a9 01     
            sta $051c          ; $86ce: 8d 1c 05  
__86d1:     inx                ; $86d1: e8        
            bne __869c         ; $86d2: d0 c8     
            lda $051c          ; $86d4: ad 1c 05  
            beq __86e9         ; $86d7: f0 10     
            ldx #$02           ; $86d9: a2 02     
__86db:     jsr __87e6         ; $86db: 20 e6 87  
            dex                ; $86de: ca        
            bne __86db         ; $86df: d0 fa     
            ldx #$01           ; $86e1: a2 01     
            jsr __8812         ; $86e3: 20 12 88  
__86e6:     jsr __8872         ; $86e6: 20 72 88  
__86e9:     lda #$00           ; $86e9: a9 00     
            sta $d8            ; $86eb: 85 d8     
            rts                ; $86ed: 60        

;-------------------------------------------------------------------------------
__86ee:     lsr                ; $86ee: 4a        
            bcs __86fc         ; $86ef: b0 0b     
            lda #$01           ; $86f1: a9 01     
            sta $c9            ; $86f3: 85 c9     
            asl                ; $86f5: 0a        
            sta $c8            ; $86f6: 85 c8     
            lda #$20           ; $86f8: a9 20     
            bne __8705         ; $86fa: d0 09     
__86fc:     lda #$00           ; $86fc: a9 00     
            sta $c9            ; $86fe: 85 c9     
            sta $c8            ; $8700: 85 c8     
            lda __8709,y       ; $8702: b9 09 87  
__8705:     sta $0506          ; $8705: 8d 06 05  
            rts                ; $8708: 60        

;-------------------------------------------------------------------------------
__8709:     plp                ; $8709: 28        
            .hex 24            ; $870a: 24        Suspected data
__870b:     asl                ; $870b: 0a        
            lda $fd            ; $870c: a5 fd     
            sta $050a          ; $870e: 8d 0a 05  
            lda $c9            ; $8711: a5 c9     
            sta $050c          ; $8713: 8d 0c 05  
            lda $04be          ; $8716: ad be 04  
            sta $0514          ; $8719: 8d 14 05  
            inc $053d          ; $871c: ee 3d 05  
            lda __870b         ; $871f: ad 0b 87  
            sta $0533          ; $8722: 8d 33 05  
            jsr __86ee         ; $8725: 20 ee 86  
            lda #$00           ; $8728: a9 00     
            sta $fd            ; $872a: 85 fd     
            sta $04c0          ; $872c: 8d c0 04  
            lda __870b         ; $872f: ad 0b 87  
            sta $04be          ; $8732: 8d be 04  
            jsr __946d         ; $8735: 20 6d 94  
            lda __870b         ; $8738: ad 0b 87  
            sta $ce            ; $873b: 85 ce     
            lda #$e0           ; $873d: a9 e0     
            sta $0506          ; $873f: 8d 06 05  
            lda __870b         ; $8742: ad 0b 87  
            clc                ; $8745: 18        
            adc #$f0           ; $8746: 69 f0     
            sta $0505          ; $8748: 8d 05 05  
            rts                ; $874b: 60        

;-------------------------------------------------------------------------------
            lda $050a          ; $874c: ad 0a 05  
            sta $fd            ; $874f: 85 fd     
            sta $04c0          ; $8751: 8d c0 04  
            lda $050c          ; $8754: ad 0c 05  
            sta $c9            ; $8757: 85 c9     
            lda $0514          ; $8759: ad 14 05  
            sta $04be          ; $875c: 8d be 04  
            lda $053d          ; $875f: ad 3d 05  
            bne __8784         ; $8762: d0 20     
            inc $053e          ; $8764: ee 3e 05  
            inc $053d          ; $8767: ee 3d 05  
            inc $d5            ; $876a: e6 d5     
            jsr __9428         ; $876c: 20 28 94  
            lda $cf            ; $876f: a5 cf     
            sta $ce            ; $8771: 85 ce     
            lda #$10           ; $8773: a9 10     
            sta $01            ; $8775: 85 01     
            lda #$f0           ; $8777: a9 f0     
            sta $0506          ; $8779: 8d 06 05  
            sta $0507          ; $877c: 8d 07 05  
            lda $d0            ; $877f: a5 d0     
            sta $0505          ; $8781: 8d 05 05  
__8784:     rts                ; $8784: 60        

;-------------------------------------------------------------------------------
            lda $cf            ; $8785: a5 cf     
            sta $ce            ; $8787: 85 ce     
            lda #$10           ; $8789: a9 10     
            sta $01            ; $878b: 85 01     
            lda #$f0           ; $878d: a9 f0     
            sta $0506          ; $878f: 8d 06 05  
            sta $0507          ; $8792: 8d 07 05  
            lda $d0            ; $8795: a5 d0     
            clc                ; $8797: 18        
__8798:     adc #$10           ; $8798: 69 10     
            adc #$00           ; $879a: 69 00     
            cmp #$0a           ; $879c: c9 0a     
            bne __87a2         ; $879e: d0 02     
            lda #$00           ; $87a0: a9 00     
__87a2:     .hex 8d 05         ; $87a2: 8d 05     Suspected data
__87a4:     ora $a9            ; $87a4: 05 a9     
            ora ($85,x)        ; $87a6: 01 85     
            asl $60            ; $87a8: 06 60     
__87aa:     ldx #$00           ; $87aa: a2 00     
            stx $0537          ; $87ac: 8e 37 05  
            stx $051c          ; $87af: 8e 1c 05  
            stx $d8            ; $87b2: 86 d8     
            jsr __8812         ; $87b4: 20 12 88  
            jsr __8872         ; $87b7: 20 72 88  
            lda $0506          ; $87ba: ad 06 05  
            cmp $d1            ; $87bd: c5 d1     
            bne __87da         ; $87bf: d0 19     
            lda $0507          ; $87c1: ad 07 05  
            clc                ; $87c4: 18        
            adc #$01           ; $87c5: 69 01     
            cmp $d2            ; $87c7: c5 d2     
            bne __87da         ; $87c9: d0 0f     
__87cb:     lda #$00           ; $87cb: a9 00     
            sta $053a          ; $87cd: 8d 3a 05  
            sta $053d          ; $87d0: 8d 3d 05  
            sta $053e          ; $87d3: 8d 3e 05  
            inc $0537          ; $87d6: ee 37 05  
            rts                ; $87d9: 60        

;-------------------------------------------------------------------------------
__87da:     lda $ce            ; $87da: a5 ce     
            cmp $0505          ; $87dc: cd 05 05  
            beq __87cb         ; $87df: f0 ea     
            ldx #$00           ; $87e1: a2 00     
            jmp __87fc         ; $87e3: 4c fc 87  

;-------------------------------------------------------------------------------
__87e6:     lda $ce,x          ; $87e6: b5 ce     
            sec                ; $87e8: 38        
            sbc #$10           ; $87e9: e9 10     
            sta $ce,x          ; $87eb: 95 ce     
            bcs __87fb         ; $87ed: b0 0c     
            dec $ce,x          ; $87ef: d6 ce     
            lda $ce,x          ; $87f1: b5 ce     
            cmp #$ef           ; $87f3: c9 ef     
            bne __87fb         ; $87f5: d0 04     
            lda #$f9           ; $87f7: a9 f9     
            sta $ce,x          ; $87f9: 95 ce     
__87fb:     rts                ; $87fb: 60        

;-------------------------------------------------------------------------------
__87fc:     lda $ce,x          ; $87fc: b5 ce     
            clc                ; $87fe: 18        
            adc #$10           ; $87ff: 69 10     
            sta $ce,x          ; $8801: 95 ce     
            bcc __8811         ; $8803: 90 0c     
            inc $ce,x          ; $8805: f6 ce     
            lda $ce,x          ; $8807: b5 ce     
            cmp #$0a           ; $8809: c9 0a     
            bne __8811         ; $880b: d0 04     
            lda #$00           ; $880d: a9 00     
            sta $ce,x          ; $880f: 95 ce     
__8811:     rts                ; $8811: 60        

;-------------------------------------------------------------------------------
__8812:     sty $0f            ; $8812: 84 0f     
            lda $ce,x          ; $8814: b5 ce     
            and #$0f           ; $8816: 29 0f     
            tay                ; $8818: a8        
            lda __ba5b,y       ; $8819: b9 5b ba  
            sta $e9            ; $881c: 85 e9     
            lda __ba66,y       ; $881e: b9 66 ba  
            sta $ea            ; $8821: 85 ea     
            lda $ce,x          ; $8823: b5 ce     
            lsr                ; $8825: 4a        
            lsr                ; $8826: 4a        
            lsr                ; $8827: 4a        
            lsr                ; $8828: 4a        
            sta $d7            ; $8829: 85 d7     
            asl                ; $882b: 0a        
            sta $d2            ; $882c: 85 d2     
            ldy #$20           ; $882e: a0 20     
            lda $ce,x          ; $8830: b5 ce     
            lsr                ; $8832: 4a        
            bcs __8837         ; $8833: b0 02     
            ldy #$24           ; $8835: a0 24     
__8837:     sty $d1            ; $8837: 84 d1     
            ldy $0f            ; $8839: a4 0f     
            rts                ; $883b: 60        

;-------------------------------------------------------------------------------
__883c:     stx $08            ; $883c: 86 08     
            ldx $09            ; $883e: a6 09     
            ldy #$02           ; $8840: a0 02     
__8842:     lda $ce,x          ; $8842: b5 ce     
            sta $03            ; $8844: 85 03     
            sec                ; $8846: 38        
            sbc $01            ; $8847: e5 01     
            sta $ce,x          ; $8849: 95 ce     
            jsr __8812         ; $884b: 20 12 88  
            lda #$07           ; $884e: a9 07     
            sta $e3            ; $8850: 85 e3     
            lda #$00           ; $8852: a9 00     
            sta $d6            ; $8854: 85 d6     
__8856:     jsr __8925         ; $8856: 20 25 89  
            lda $e3            ; $8859: a5 e3     
            bpl __8856         ; $885b: 10 f9     
            lda $d2            ; $885d: a5 d2     
            and #$1c           ; $885f: 29 1c     
            lsr                ; $8861: 4a        
            lsr                ; $8862: 4a        
            ora #$c0           ; $8863: 09 c0     
            sta $03bd          ; $8865: 8d bd 03  
            lda $d1            ; $8868: a5 d1     
            ora #$03           ; $886a: 09 03     
            sta $03bc          ; $886c: 8d bc 03  
            ldx $08            ; $886f: a6 08     
            rts                ; $8871: 60        

;-------------------------------------------------------------------------------
__8872:     lda #$0f           ; $8872: a9 0f     
            sta $e3            ; $8874: 85 e3     
            lda #$00           ; $8876: a9 00     
            sta $d6            ; $8878: 85 d6     
            sta $d5            ; $887a: 85 d5     
            tax                ; $887c: aa        
__887d:     ldy $d7            ; $887d: a4 d7     
            lda ($e9),y        ; $887f: b1 e9     
            sta $051b          ; $8881: 8d 1b 05  
            and #$c0           ; $8884: 29 c0     
            asl                ; $8886: 0a        
            rol                ; $8887: 2a        
            rol                ; $8888: 2a        
            tay                ; $8889: a8        
            lda __f7e9,y       ; $888a: b9 e9 f7  
            sta $00            ; $888d: 85 00     
            lda __f7ed,y       ; $888f: b9 ed f7  
            sta $01            ; $8892: 85 01     
__8894:     ldy $d7            ; $8894: a4 d7     
            lda ($e9),y        ; $8896: b1 e9     
            asl                ; $8898: 0a        
            asl                ; $8899: 0a        
            tay                ; $889a: a8        
            lda $d5            ; $889b: a5 d5     
            beq __88a0         ; $889d: f0 01     
            iny                ; $889f: c8        
__88a0:     lda ($00),y        ; $88a0: b1 00     
            sta $0380,x        ; $88a2: 9d 80 03  
            iny                ; $88a5: c8        
            lda ($00),y        ; $88a6: b1 00     
            sta $039e,x        ; $88a8: 9d 9e 03  
            iny                ; $88ab: c8        
            lda ($00),y        ; $88ac: b1 00     
            sta $0381,x        ; $88ae: 9d 81 03  
            iny                ; $88b1: c8        
            lda ($00),y        ; $88b2: b1 00     
            sta $039f,x        ; $88b4: 9d 9f 03  
            inc $d6            ; $88b7: e6 d6     
            inx                ; $88b9: e8        
            inx                ; $88ba: e8        
            lda $d7            ; $88bb: a5 d7     
            clc                ; $88bd: 18        
            adc #$10           ; $88be: 69 10     
            sta $d7            ; $88c0: 85 d7     
            lda $d6            ; $88c2: a5 d6     
            cmp #$0f           ; $88c4: c9 0f     
            bcc __887d         ; $88c6: 90 b5     
            lda #$00           ; $88c8: a9 00     
            sta $03bc          ; $88ca: 8d bc 03  
            lda $d8            ; $88cd: a5 d8     
            lsr                ; $88cf: 4a        
            bcs __88f2         ; $88d0: b0 20     
            lda $d2            ; $88d2: a5 d2     
            and #$02           ; $88d4: 29 02     
            beq __88fd         ; $88d6: f0 25     
            lda $d8            ; $88d8: a5 d8     
            bne __88f8         ; $88da: d0 1c     
            lda #$10           ; $88dc: a9 10     
            sta $01            ; $88de: 85 01     
__88e0:     ldx #$00           ; $88e0: a2 00     
            stx $09            ; $88e2: 86 09     
__88e4:     inx                ; $88e4: e8        
            jsr __8901         ; $88e5: 20 01 89  
__88e8:     lda $03            ; $88e8: a5 03     
            sta $ce            ; $88ea: 85 ce     
            jsr __8812         ; $88ec: 20 12 88  
            jmp __88fd         ; $88ef: 4c fd 88  

;-------------------------------------------------------------------------------
__88f2:     lda $d2            ; $88f2: a5 d2     
            and #$02           ; $88f4: 29 02     
            bne __88fd         ; $88f6: d0 05     
__88f8:     lda $d8            ; $88f8: a5 d8     
            sta $0538          ; $88fa: 8d 38 05  
__88fd:     inc $051c          ; $88fd: ee 1c 05  
            rts                ; $8900: 60        

;-------------------------------------------------------------------------------
__8901:     jsr __883c         ; $8901: 20 3c 88  
            ldx #$07           ; $8904: a2 07     
            stx $0e            ; $8906: 86 0e     
            ldy #$00           ; $8908: a0 00     
__890a:     ldx $0e            ; $890a: a6 0e     
            lda $d9,x          ; $890c: b5 d9     
            sta $03be,y        ; $890e: 99 be 03  
            iny                ; $8911: c8        
            dex                ; $8912: ca        
            dex                ; $8913: ca        
            dex                ; $8914: ca        
            dex                ; $8915: ca        
            lda $d9,x          ; $8916: b5 d9     
            sta $03be,y        ; $8918: 99 be 03  
            iny                ; $891b: c8        
            dec $0e            ; $891c: c6 0e     
            lda $0e            ; $891e: a5 0e     
            cmp #$03           ; $8920: c9 03     
            bne __890a         ; $8922: d0 e6     
            rts                ; $8924: 60        

;-------------------------------------------------------------------------------
__8925:     sty $0f            ; $8925: 84 0f     
            lda #$01           ; $8927: a9 01     
            sta $04            ; $8929: 85 04     
            ldy $d7            ; $892b: a4 d7     
            ldx $e3            ; $892d: a6 e3     
__892f:     lda $d9,x          ; $892f: b5 d9     
            lsr                ; $8931: 4a        
            lsr                ; $8932: 4a        
            sta $d9,x          ; $8933: 95 d9     
            lda ($e9),y        ; $8935: b1 e9     
            and #$c0           ; $8937: 29 c0     
            ora $d9,x          ; $8939: 15 d9     
            sta $d9,x          ; $893b: 95 d9     
            iny                ; $893d: c8        
            lda $d9,x          ; $893e: b5 d9     
            lsr                ; $8940: 4a        
            lsr                ; $8941: 4a        
            sta $d9,x          ; $8942: 95 d9     
            lda ($e9),y        ; $8944: b1 e9     
            and #$c0           ; $8946: 29 c0     
            ora $d9,x          ; $8948: 15 d9     
            sta $d9,x          ; $894a: 95 d9     
            lda $d7            ; $894c: a5 d7     
            clc                ; $894e: 18        
            adc #$10           ; $894f: 69 10     
            tay                ; $8951: a8        
            sta $d7            ; $8952: 85 d7     
            dec $04            ; $8954: c6 04     
            bpl __892f         ; $8956: 10 d7     
            dec $e3            ; $8958: c6 e3     
            ldy $0f            ; $895a: a4 0f     
            rts                ; $895c: 60        

;-------------------------------------------------------------------------------
__895d:     ldx #$07           ; $895d: a2 07     
__895f:     sta $041b,x        ; $895f: 9d 1b 04  
            dex                ; $8962: ca        
            bpl __895f         ; $8963: 10 fa     
            rts                ; $8965: 60        

;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $8966: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8969: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $896c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $896f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8972: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8975: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8978: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $897b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $897e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8981: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8984: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8987: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $898a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $898d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8990: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8993: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8996: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $8999: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $899c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $899f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89a2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89a5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $89a8: ff        Suspected data
__89a9:     .hex ff ff ff      ; $89a9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89ac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89af: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89b2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89b5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89b8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89bb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89be: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89c1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89c4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89c7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89ca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89cd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89d0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89d3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89d6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89d9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89dc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89df: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89e2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89e5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89e8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89eb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89ee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89f1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89f4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89f7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89fa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $89fd: ff ff ff  Invalid Opcode - ISC Array,x
__8a00:     php                ; $8a00: 08        
            jsr $50a5          ; $8a01: 20 a5 50  
            cmp #$02           ; $8a04: c9 02     
            bcs __8a26         ; $8a06: b0 1e     
            lda #$00           ; $8a08: a9 00     
            ldy #$10           ; $8a0a: a0 10     
            cpy $04c2          ; $8a0c: cc c2 04  
            rol                ; $8a0f: 2a        
            eor $06f6          ; $8a10: 4d f6 06  
            beq __8a26         ; $8a13: f0 11     
            ldy $06f6          ; $8a15: ac f6 06  
            lda __8a00,y       ; $8a18: b9 00 8a  
            sta $0604          ; $8a1b: 8d 04 06  
            lda #$1e           ; $8a1e: a9 1e     
            sta $82            ; $8a20: 85 82     
            lda #$08           ; $8a22: a9 08     
            sta $50            ; $8a24: 85 50     
__8a26:     lda #$00           ; $8a26: a9 00     
            sta $64            ; $8a28: 85 64     
            lda $50            ; $8a2a: a5 50     
            jsr __e125         ; $8a2c: 20 25 e1  
            eor ($8a,x)        ; $8a2f: 41 8a     
            cmp ($8a),y        ; $8a31: d1 8a     
            .hex 87 8a         ; $8a33: 87 8a     Invalid Opcode - SAX $8a
            sta $468b          ; $8a35: 8d 8b 46  
            .hex 8b 78         ; $8a38: 8b 78     Invalid Opcode - XAA #$78
            .hex 8b cb         ; $8a3a: 8b cb     Invalid Opcode - XAA #$cb
            .hex 8b 5c         ; $8a3c: 8b 5c     Invalid Opcode - XAA #$5c
            txa                ; $8a3e: 8a        
            sbc ($8b),y        ; $8a3f: f1 8b     
            jsr __8cd9         ; $8a41: 20 d9 8c  
            jsr __8c1a         ; $8a44: 20 1a 8c  
            jsr __8efa         ; $8a47: 20 fa 8e  
            jsr __9316         ; $8a4a: 20 16 93  
            jsr __8ea4         ; $8a4d: 20 a4 8e  
__8a50:     ldx #$00           ; $8a50: a2 00     
            .hex 20            ; $8a52: 20        Suspected data
__8a53:     ldx $8e            ; $8a53: a6 8e     
            lda $ec            ; $8a55: a5 ec     
            bne __8a5b         ; $8a57: d0 02     
            sta $14            ; $8a59: 85 14     
__8a5b:     rts                ; $8a5b: 60        

;-------------------------------------------------------------------------------
            lda $82            ; $8a5c: a5 82     
            bne __8a86         ; $8a5e: d0 26     
            lda $042a          ; $8a60: ad 2a 04  
            cmp #$02           ; $8a63: c9 02     
            beq __8a77         ; $8a65: f0 10     
            jsr __8ea4         ; $8a67: 20 a4 8e  
            lda $46            ; $8a6a: a5 46     
            bmi __8a72         ; $8a6c: 30 04     
            cmp #$39           ; $8a6e: c9 39     
            bcs __8a86         ; $8a70: b0 14     
__8a72:     inc $46            ; $8a72: e6 46     
            inc $46            ; $8a74: e6 46     
            rts                ; $8a76: 60        

;-------------------------------------------------------------------------------
__8a77:     lda #$02           ; $8a77: a9 02     
            sta $c7            ; $8a79: 85 c7     
            ldy #$01           ; $8a7b: a0 01     
            dec $04ed          ; $8a7d: ce ed 04  
            bne __8a83         ; $8a80: d0 01     
            iny                ; $8a82: c8        
__8a83:     sty $04ec          ; $8a83: 8c ec 04  
__8a86:     rts                ; $8a86: 60        

;-------------------------------------------------------------------------------
            .hex a5            ; $8a87: a5        Suspected data
__8a88:     .hex 82 d0         ; $8a88: 82 d0     Invalid Opcode - NOP #$d0
            rol $ae,x          ; $8a8a: 36 ae     
            and __b404         ; $8a8c: 2d 04 b4  
            tay                ; $8a8f: a8        
            cpy #$02           ; $8a90: c0 02     
            bcc __8abb         ; $8a92: 90 27     
            cpy #$07           ; $8a94: c0 07     
            bne __8a9d         ; $8a96: d0 05     
            lda #$08           ; $8a98: a9 08     
            sta $0601          ; $8a9a: 8d 01 06  
__8a9d:     dec $a8,x          ; $8a9d: d6 a8     
            lda __8ac6,y       ; $8a9f: b9 c6 8a  
            sta $c7            ; $8aa2: 85 c7     
            lda $51,x          ; $8aa4: b5 51     
            cmp #$06           ; $8aa6: c9 06     
            beq __8ab0         ; $8aa8: f0 06     
            lda $90,x          ; $8aaa: b5 90     
            cmp #$32           ; $8aac: c9 32     
            bne __8ab5         ; $8aae: d0 05     
__8ab0:     lda __8ac0,y       ; $8ab0: b9 c0 8a  
            bpl __8ab8         ; $8ab3: 10 03     
__8ab5:     .hex b9 44         ; $8ab5: b9 44     Suspected data
__8ab7:     .hex 05            ; $8ab7: 05        Suspected data
__8ab8:     sta $82            ; $8ab8: 85 82     
            rts                ; $8aba: 60        

;-------------------------------------------------------------------------------
__8abb:     sta $50            ; $8abb: 85 50     
            inc $99            ; $8abd: e6 99     
            .hex e6            ; $8abf: e6        Suspected data
__8ac0:     txs                ; $8ac0: 9a        
__8ac1:     rts                ; $8ac1: 60        

;-------------------------------------------------------------------------------
__8ac2:     brk                ; $8ac2: 00        
            ora ($01,x)        ; $8ac3: 01 01     
            .hex 01            ; $8ac5: 01        Suspected data
__8ac6:     ora ($02,x)        ; $8ac6: 01 02     
            .hex 04 04         ; $8ac8: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $8aca: 04 04     Invalid Opcode - NOP $04
            php                ; $8acc: 08        
            php                ; $8acd: 08        
__8ace:     brk                ; $8ace: 00        
            bpl __8ac1         ; $8acf: 10 f0     
            lda $f7            ; $8ad1: a5 f7     
            and #$0c           ; $8ad3: 29 0c     
            lsr                ; $8ad5: 4a        
            lsr                ; $8ad6: 4a        
            tay                ; $8ad7: a8        
            cpy #$02           ; $8ad8: c0 02     
            bne __8adf         ; $8ada: d0 03     
            jsr __8b19         ; $8adc: 20 19 8b  
__8adf:     lda __f225,y       ; $8adf: b9 25 f2  
            sta $46            ; $8ae2: 85 46     
            lda $f7            ; $8ae4: a5 f7     
            and #$03           ; $8ae6: 29 03     
            tay                ; $8ae8: a8        
            lda __8ace,y       ; $8ae9: b9 ce 8a  
            sta $3c            ; $8aec: 85 3c     
            lda $28            ; $8aee: a5 28     
            clc                ; $8af0: 18        
            adc #$04           ; $8af1: 69 04     
            and #$0f           ; $8af3: 29 0f     
            cmp #$08           ; $8af5: c9 08     
            bcs __8b14         ; $8af7: b0 1b     
            ldy __f00b         ; $8af9: ac 0b f0  
            lda $46            ; $8afc: a5 46     
            bmi __8b01         ; $8afe: 30 01     
            iny                ; $8b00: c8        
__8b01:     ldx #$00           ; $8b01: a2 00     
            .hex 20            ; $8b03: 20        Suspected data
__8b04:     and $8b,x          ; $8b04: 35 8b     
__8b06:     bcs __8b0e         ; $8b06: b0 06     
            lda $46            ; $8b08: a5 46     
            bpl __8b14         ; $8b0a: 10 08     
            stx $46            ; $8b0c: 86 46     
__8b0e:     jsr __8a50         ; $8b0e: 20 50 8a  
            jmp __8ea4         ; $8b11: 4c a4 8e  

;-------------------------------------------------------------------------------
__8b14:     lda #$00           ; $8b14: a9 00     
            sta $50            ; $8b16: 85 50     
            rts                ; $8b18: 60        

;-------------------------------------------------------------------------------
__8b19:     lda $10            ; $8b19: a5 10     
            and #$07           ; $8b1b: 29 07     
            bne __8b2a         ; $8b1d: d0 0b     
            lda $9d            ; $8b1f: a5 9d     
            eor #$01           ; $8b21: 49 01     
            sta $9d            ; $8b23: 85 9d     
            lda #$02           ; $8b25: a9 02     
            sta $0604          ; $8b27: 8d 04 06  
__8b2a:     rts                ; $8b2a: 60        

;-------------------------------------------------------------------------------
__8b2b:     .hex c2 d4         ; $8b2b: c2 d4     Invalid Opcode - NOP #$d4
            .hex c3 c4         ; $8b2d: c3 c4     Invalid Opcode - DCP ($c4,x)
            .hex 07 80         ; $8b2f: 07 80     Invalid Opcode - SLO $80
            sta ($94,x)        ; $8b31: 81 94     
            sta $17,x          ; $8b33: 95 17     
__8b35:     .hex 20            ; $8b35: 20        Suspected data
__8b36:     .hex 4f 92 a5      ; $8b36: 4f 92 a5  Invalid Opcode - SRE __a592
            brk                ; $8b39: 00        
            ldy #$09           ; $8b3a: a0 09     
__8b3c:     cmp __8b2b,y       ; $8b3c: d9 2b 8b  
            beq __8b45         ; $8b3f: f0 04     
            dey                ; $8b41: 88        
            bpl __8b3c         ; $8b42: 10 f8     
            clc                ; $8b44: 18        
__8b45:     rts                ; $8b45: 60        

;-------------------------------------------------------------------------------
            lda #$20           ; $8b46: a9 20     
            sta $64            ; $8b48: 85 64     
            inc $32            ; $8b4a: e6 32     
            lda $32            ; $8b4c: a5 32     
            and #$0f           ; $8b4e: 29 0f     
            bne __8b77         ; $8b50: d0 25     
            sta $50            ; $8b52: 85 50     
            jsr __f6da         ; $8b54: 20 da f6  
            pla                ; $8b57: 68        
            pla                ; $8b58: 68        
            .hex 20 0e         ; $8b59: 20 0e     Suspected data
__8b5b:     sty $a9,x          ; $8b5b: 94 a9     
            .hex 02            ; $8b5d: 02        Invalid Opcode - KIL 
            sta $0534          ; $8b5e: 8d 34 05  
            lda $04ee          ; $8b61: ad ee 04  
            bne __8b6c         ; $8b64: d0 06     
            lda #$04           ; $8b66: a9 04     
            sta $04ec          ; $8b68: 8d ec 04  
            rts                ; $8b6b: 60        

;-------------------------------------------------------------------------------
__8b6c:     cmp #$01           ; $8b6c: c9 01     
            beq __8b74         ; $8b6e: f0 04     
            sta $0627          ; $8b70: 8d 27 06  
            rts                ; $8b73: 60        

;-------------------------------------------------------------------------------
__8b74:     sta $0628          ; $8b74: 8d 28 06  
__8b77:     rts                ; $8b77: 60        

;-------------------------------------------------------------------------------
            lda #$20           ; $8b78: a9 20     
            sta $64            ; $8b7a: 85 64     
            dec $32            ; $8b7c: c6 32     
            lda $32            ; $8b7e: a5 32     
            and #$0f           ; $8b80: 29 0f     
            bne __8b86         ; $8b82: d0 02     
            sta $50            ; $8b84: 85 50     
__8b86:     rts                ; $8b86: 60        

;-------------------------------------------------------------------------------
__8b87:     brk                ; $8b87: 00        
            .hex ff            ; $8b88: ff        Suspected data
__8b89:     .hex ee de         ; $8b89: ee de     Suspected data
__8b8b:     ora #$a1           ; $8b8b: 09 a1     
            lda $46            ; $8b8d: a5 46     
            asl                ; $8b8f: 0a        
            rol                ; $8b90: 2a        
            and #$01           ; $8b91: 29 01     
            tay                ; $8b93: a8        
            lda $042a          ; $8b94: ad 2a 04  
            cmp __8b87,y       ; $8b97: d9 87 8b  
            bne __8bb0         ; $8b9a: d0 14     
            lda $042b          ; $8b9c: ad 2b 04  
            cmp __8b89,y       ; $8b9f: d9 89 8b  
            bne __8bb0         ; $8ba2: d0 0c     
            jsr __f6da         ; $8ba4: 20 da f6  
            inc $0627          ; $8ba7: ee 27 06  
            lda #$03           ; $8baa: a9 03     
            sta $0534          ; $8bac: 8d 34 05  
            rts                ; $8baf: 60        

;-------------------------------------------------------------------------------
__8bb0:     lda $042a          ; $8bb0: ad 2a 04  
            bne __8bbd         ; $8bb3: d0 08     
            lda $042b          ; $8bb5: ad 2b 04  
            cmp __8b8b,y       ; $8bb8: d9 8b 8b  
            beq __8bc6         ; $8bbb: f0 09     
__8bbd:     tya                ; $8bbd: 98        
            beq __8bc3         ; $8bbe: f0 03     
            jsr __8b19         ; $8bc0: 20 19 8b  
__8bc3:     jmp __8ea4         ; $8bc3: 4c a4 8e  

;-------------------------------------------------------------------------------
__8bc6:     lda #$01           ; $8bc6: a9 01     
            sta $50            ; $8bc8: 85 50     
            rts                ; $8bca: 60        

;-------------------------------------------------------------------------------
            lda $82            ; $8bcb: a5 82     
            beq __8be9         ; $8bcd: f0 1a     
            jsr __8ea4         ; $8bcf: 20 a4 8e  
            .hex ad 5a 00      ; $8bd2: ad 5a 00  Bad Addr Mode - LDA $005a
            beq __8beb         ; $8bd5: f0 14     
            lda #$20           ; $8bd7: a9 20     
            sta $64            ; $8bd9: 85 64     
            lda #$04           ; $8bdb: a9 04     
            sta $3c            ; $8bdd: 85 3c     
            lda #$01           ; $8bdf: a9 01     
            sta $9d            ; $8be1: 85 9d     
            jsr __8a50         ; $8be3: 20 50 8a  
            jmp __8d6f         ; $8be6: 4c 6f 8d  

;-------------------------------------------------------------------------------
__8be9:     sta $50            ; $8be9: 85 50     
__8beb:     rts                ; $8beb: 60        

;-------------------------------------------------------------------------------
__8bec:     ora $0a            ; $8bec: 05 0a     
            .hex 0f 14 19      ; $8bee: 0f 14 19  Invalid Opcode - SLO $1914
            lda $82            ; $8bf1: a5 82     
            beq __8c0d         ; $8bf3: f0 18     
            inc $85            ; $8bf5: e6 85     
            ldy #$04           ; $8bf7: a0 04     
__8bf9:     cmp __8bec,y       ; $8bf9: d9 ec 8b  
            bne __8c09         ; $8bfc: d0 0b     
            lda $06f6          ; $8bfe: ad f6 06  
            eor #$01           ; $8c01: 49 01     
__8c03:     .hex 8d f6         ; $8c03: 8d f6     Suspected data
__8c05:     asl $4c            ; $8c05: 06 4c     
            .hex 33 fe         ; $8c07: 33 fe     Invalid Opcode - RLA ($fe),y
__8c09:     dey                ; $8c09: 88        
            bpl __8bf9         ; $8c0a: 10 ed     
            rts                ; $8c0c: 60        

;-------------------------------------------------------------------------------
__8c0d:     ldy $c7            ; $8c0d: a4 c7     
            cpy #$0a           ; $8c0f: c0 0a     
            bne __8c15         ; $8c11: d0 02     
            lda #$01           ; $8c13: a9 01     
__8c15:     sta $50            ; $8c15: 85 50     
            rts                ; $8c17: 60        

;-------------------------------------------------------------------------------
__8c18:     .hex fe 02         ; $8c18: fe 02     Suspected data
__8c1a:     jsr __8d6f         ; $8c1a: 20 6f 8d  
            lda $99            ; $8c1d: a5 99     
            bne __8c63         ; $8c1f: d0 42     
            lda $9a            ; $8c21: a5 9a     
            beq __8c2b         ; $8c23: f0 06     
            lda $82            ; $8c25: a5 82     
            bne __8c92         ; $8c27: d0 69     
            dec $9a            ; $8c29: c6 9a     
__8c2b:     lda $f5            ; $8c2b: a5 f5     
            bpl __8c3d         ; $8c2d: 10 0e     
            inc $99            ; $8c2f: e6 99     
            lda #$06           ; $8c31: a9 06     
            sta $c7            ; $8c33: 85 c7     
            jsr __8c99         ; $8c35: 20 99 8c  
            lda #$01           ; $8c38: a9 01     
            sta $0604          ; $8c3a: 8d 04 06  
__8c3d:     lda $04b2          ; $8c3d: ad b2 04  
            bne __8c92         ; $8c40: d0 50     
            lda $04df          ; $8c42: ad df 04  
            bne __8c63         ; $8c45: d0 1c     
            lda $f7            ; $8c47: a5 f7     
            and #$04           ; $8c49: 29 04     
            beq __8c63         ; $8c4b: f0 16     
__8c4d:     inc $9a            ; $8c4d: e6 9a     
            lda #$04           ; $8c4f: a9 04     
            sta $c7            ; $8c51: 85 c7     
            lda $99            ; $8c53: a5 99     
            bne __8c63         ; $8c55: d0 0c     
            lda $04ca          ; $8c57: ad ca 04  
            cmp #$3c           ; $8c5a: c9 3c     
            bcs __8c92         ; $8c5c: b0 34     
            inc $04ca          ; $8c5e: ee ca 04  
            bne __8c92         ; $8c61: d0 2f     
__8c63:     lda $04ca          ; $8c63: ad ca 04  
            cmp #$3c           ; $8c66: c9 3c     
            bcs __8c6f         ; $8c68: b0 05     
            lda #$00           ; $8c6a: a9 00     
            sta $04ca          ; $8c6c: 8d ca 04  
__8c6f:     lda $f7            ; $8c6f: a5 f7     
            and #$03           ; $8c71: 29 03     
            beq __8c92         ; $8c73: f0 1d     
            and #$01           ; $8c75: 29 01     
            sta $9d            ; $8c77: 85 9d     
            tay                ; $8c79: a8        
            lda $0624          ; $8c7a: ad 24 06  
            lsr                ; $8c7d: 4a        
            lsr                ; $8c7e: 4a        
            and $10            ; $8c7f: 25 10     
            bne __8c8b         ; $8c81: d0 08     
            lda $3c            ; $8c83: a5 3c     
            clc                ; $8c85: 18        
            adc __8c18,y       ; $8c86: 79 18 8c  
            sta $3c            ; $8c89: 85 3c     
__8c8b:     lda #$00           ; $8c8b: a9 00     
            sta $04ca          ; $8c8d: 8d ca 04  
            beq __8c95         ; $8c90: f0 03     
__8c92:     jsr __8d2c         ; $8c92: 20 2c 8d  
__8c95:     jsr __8dc0         ; $8c95: 20 c0 8d  
            rts                ; $8c98: 60        

;-------------------------------------------------------------------------------
__8c99:     lda $04df          ; $8c99: ad df 04  
            cmp #$02           ; $8c9c: c9 02     
            bcc __8ca7         ; $8c9e: 90 07     
            lda $0552          ; $8ca0: ad 52 05  
            sta $46            ; $8ca3: 85 46     
            bne __8cd3         ; $8ca5: d0 2c     
__8ca7:     lda $3c            ; $8ca7: a5 3c     
            bpl __8cb0         ; $8ca9: 10 05     
            eor #$ff           ; $8cab: 49 ff     
            clc                ; $8cad: 18        
            adc #$01           ; $8cae: 69 01     
__8cb0:     .hex c9            ; $8cb0: c9        Suspected data
__8cb1:     php                ; $8cb1: 08        
            lda #$00           ; $8cb2: a9 00     
            sta $0411          ; $8cb4: 8d 11 04  
            rol                ; $8cb7: 2a        
            ldy $04ca          ; $8cb8: ac ca 04  
            cpy #$3c           ; $8cbb: c0 3c     
            bcc __8cc3         ; $8cbd: 90 04     
            lda #$00           ; $8cbf: a9 00     
            sta $f7            ; $8cc1: 85 f7     
__8cc3:     rol                ; $8cc3: 2a        
            asl                ; $8cc4: 0a        
            ora $9c            ; $8cc5: 05 9c     
            tay                ; $8cc7: a8        
            lda $054c,y        ; $8cc8: b9 4c 05  
            sta $46            ; $8ccb: 85 46     
            lda $0553          ; $8ccd: ad 53 05  
            sta $04c9          ; $8cd0: 8d c9 04  
__8cd3:     lda #$00           ; $8cd3: a9 00     
            sta $04ca          ; $8cd5: 8d ca 04  
            rts                ; $8cd8: 60        

;-------------------------------------------------------------------------------
__8cd9:     lda $04df          ; $8cd9: ad df 04  
            cmp #$02           ; $8cdc: c9 02     
            bcc __8ce5         ; $8cde: 90 05     
            lda $0556          ; $8ce0: ad 56 05  
            bne __8d13         ; $8ce3: d0 2e     
__8ce5:     lda $0554          ; $8ce5: ad 54 05  
            ldy $f7            ; $8ce8: a4 f7     
            bpl __8d0b         ; $8cea: 10 1f     
            lda $0555          ; $8cec: ad 55 05  
            ldy $46            ; $8cef: a4 46     
            cpy #$fc           ; $8cf1: c0 fc     
            bmi __8d0b         ; $8cf3: 30 16     
            ldy $04c9          ; $8cf5: ac c9 04  
            beq __8d0b         ; $8cf8: f0 11     
            dec $04c9          ; $8cfa: ce c9 04  
            lda $10            ; $8cfd: a5 10     
            lsr                ; $8cff: 4a        
            lsr                ; $8d00: 4a        
            lsr                ; $8d01: 4a        
            and #$03           ; $8d02: 29 03     
            tay                ; $8d04: a8        
            lda __8d26,y       ; $8d05: b9 26 8d  
            sta $46            ; $8d08: 85 46     
            rts                ; $8d0a: 60        

;-------------------------------------------------------------------------------
__8d0b:     ldy $46            ; $8d0b: a4 46     
            bmi __8d13         ; $8d0d: 30 04     
            cpy #$39           ; $8d0f: c0 39     
            bcs __8d18         ; $8d11: b0 05     
__8d13:     clc                ; $8d13: 18        
            adc $46            ; $8d14: 65 46     
            sta $46            ; $8d16: 85 46     
__8d18:     lda $04c9          ; $8d18: ad c9 04  
            cmp $0553          ; $8d1b: cd 53 05  
            beq __8d25         ; $8d1e: f0 05     
            lda #$00           ; $8d20: a9 00     
            sta $04c9          ; $8d22: 8d c9 04  
__8d25:     rts                ; $8d25: 60        

;-------------------------------------------------------------------------------
__8d26:     .hex fc 00 04      ; $8d26: fc 00 04  Invalid Opcode - NOP $0400,x
            brk                ; $8d29: 00        
__8d2a:     .hex fd 03         ; $8d2a: fd 03     Suspected data
__8d2c:     lda $99            ; $8d2c: a5 99     
            bne __8d61         ; $8d2e: d0 31     
            lda $10            ; $8d30: a5 10     
            and $0624          ; $8d32: 2d 24 06  
            bne __8d4d         ; $8d35: d0 16     
            lda $3c            ; $8d37: a5 3c     
            and #$80           ; $8d39: 29 80     
            asl                ; $8d3b: 0a        
            rol                ; $8d3c: 2a        
            tay                ; $8d3d: a8        
            lda $3c            ; $8d3e: a5 3c     
            adc __8d2a,y       ; $8d40: 79 2a 8d  
            tax                ; $8d43: aa        
            eor __8c18,y       ; $8d44: 59 18 8c  
            bmi __8d4b         ; $8d47: 30 02     
            ldx #$00           ; $8d49: a2 00     
__8d4b:     stx $3c            ; $8d4b: 86 3c     
__8d4d:     lda $9a            ; $8d4d: a5 9a     
            bne __8d61         ; $8d4f: d0 10     
            lda $c7            ; $8d51: a5 c7     
            cmp #$09           ; $8d53: c9 09     
            beq __8d61         ; $8d55: f0 0a     
            lda #$02           ; $8d57: a9 02     
            sta $c7            ; $8d59: 85 c7     
            lda #$00           ; $8d5b: a9 00     
            sta $84            ; $8d5d: 85 84     
            sta $9b            ; $8d5f: 85 9b     
__8d61:     rts                ; $8d61: 60        

;-------------------------------------------------------------------------------
__8d62:     .hex 0c 0a 08      ; $8d62: 0c 0a 08  Invalid Opcode - NOP $080a
            ora $03            ; $8d65: 05 03     
            .hex 02            ; $8d67: 02        Invalid Opcode - KIL 
            .hex 02            ; $8d68: 02        Invalid Opcode - KIL 
            .hex 02            ; $8d69: 02        Invalid Opcode - KIL 
            .hex 02            ; $8d6a: 02        Invalid Opcode - KIL 
            .hex 02            ; $8d6b: 02        Invalid Opcode - KIL 
__8d6c:     .hex 02            ; $8d6c: 02        Invalid Opcode - KIL 
            brk                ; $8d6d: 00        
            .hex 09            ; $8d6e: 09        Suspected data
__8d6f:     lda $9a            ; $8d6f: a5 9a     
            bne __8db1         ; $8d71: d0 3e     
            .hex a5            ; $8d73: a5        Suspected data
__8d74:     sta $0ef0,y        ; $8d74: 99 f0 0e  
            lda $8f            ; $8d77: a5 8f     
            cmp #$03           ; $8d79: c9 03     
            bne __8db1         ; $8d7b: d0 34     
            lda $84            ; $8d7d: a5 84     
            bne __8daa         ; $8d7f: d0 29     
            lda #$02           ; $8d81: a9 02     
            bne __8da0         ; $8d83: d0 1b     
            lda $84            ; $8d85: a5 84     
            bne __8daa         ; $8d87: d0 21     
            lda #$05           ; $8d89: a9 05     
            ldy $0624          ; $8d8b: ac 24 06  
            bne __8da0         ; $8d8e: d0 10     
            lda $3c            ; $8d90: a5 3c     
            bpl __8d99         ; $8d92: 10 05     
            eor #$ff           ; $8d94: 49 ff     
            clc                ; $8d96: 18        
            adc #$01           ; $8d97: 69 01     
__8d99:     lsr                ; $8d99: 4a        
            lsr                ; $8d9a: 4a        
            lsr                ; $8d9b: 4a        
            tay                ; $8d9c: a8        
__8d9d:     lda __8d62,y       ; $8d9d: b9 62 8d  
__8da0:     sta $84            ; $8da0: 85 84     
            dec $9b            ; $8da2: c6 9b     
            bpl __8daa         ; $8da4: 10 04     
            lda #$01           ; $8da6: a9 01     
            sta $9b            ; $8da8: 85 9b     
__8daa:     ldy $9b            ; $8daa: a4 9b     
            lda __8d6c,y       ; $8dac: b9 6c 8d  
            sta $c7            ; $8daf: 85 c7     
__8db1:     rts                ; $8db1: 60        

;-------------------------------------------------------------------------------
__8db2:     brk                ; $8db2: 00        
            brk                ; $8db3: 00        
            bne __8de6         ; $8db4: d0 30     
            bne __8de8         ; $8db6: d0 30     
            bne __8dea         ; $8db8: d0 30     
            clc                ; $8dba: 18        
            brk                ; $8dbb: 00        
            clc                ; $8dbc: 18        
            sed                ; $8dbd: f8        
            beq __8dd0         ; $8dbe: f0 10     
__8dc0:     ldy #$02           ; $8dc0: a0 02     
            lda $04df          ; $8dc2: ad df 04  
            cmp #$02           ; $8dc5: c9 02     
            bcs __8de0         ; $8dc7: b0 17     
            dey                ; $8dc9: 88        
            lda $9c            ; $8dca: a5 9c     
            beq __8ddf         ; $8dcc: f0 11     
            .hex ae 2d         ; $8dce: ae 2d     Suspected data
__8dd0:     .hex 04 b5         ; $8dd0: 04 b5     Invalid Opcode - NOP $b5
            bcc __8d9d         ; $8dd2: 90 c9     
            .hex 32            ; $8dd4: 32        Invalid Opcode - KIL 
            bcc __8de0         ; $8dd5: 90 09     
            cmp #$39           ; $8dd7: c9 39     
            bcc __8ddf         ; $8dd9: 90 04     
            cmp #$3b           ; $8ddb: c9 3b     
            bcc __8de0         ; $8ddd: 90 01     
__8ddf:     dey                ; $8ddf: 88        
__8de0:     lda $0557,y        ; $8de0: b9 57 05  
            .hex 24            ; $8de3: 24        Suspected data
__8de4:     .hex f7 50         ; $8de4: f7 50     Invalid Opcode - ISC $50,x
__8de6:     ora $4a            ; $8de6: 05 4a     
__8de8:     clc                ; $8de8: 18        
            .hex 79            ; $8de9: 79        Suspected data
__8dea:     .hex 57 05         ; $8dea: 57 05     Invalid Opcode - SRE $05,x
            cmp $3c            ; $8dec: c5 3c     
            bpl __8df2         ; $8dee: 10 02     
            sta $3c            ; $8df0: 85 3c     
__8df2:     lda $055a,y        ; $8df2: b9 5a 05  
            bit $f7            ; $8df5: 24 f7     
            bvc __8dff         ; $8df7: 50 06     
            sec                ; $8df9: 38        
            ror                ; $8dfa: 6a        
            clc                ; $8dfb: 18        
            adc $055a,y        ; $8dfc: 79 5a 05  
__8dff:     cmp $3c            ; $8dff: c5 3c     
            bmi __8e05         ; $8e01: 30 02     
            sta $3c            ; $8e03: 85 3c     
__8e05:     bit $f5            ; $8e05: 24 f5     
            bvc __8e41         ; $8e07: 50 38     
            lda $9c            ; $8e09: a5 9c     
            beq __8e41         ; $8e0b: f0 34     
            ldy #$00           ; $8e0d: a0 00     
            ldx $042d          ; $8e0f: ae 2d 04  
            .hex b5            ; $8e12: b5        Suspected data
__8e13:     eor ($c9),y        ; $8e13: 51 c9     
            asl $f0            ; $8e15: 06 f0     
            and #$b5           ; $8e17: 29 b5     
            bcc __8de4         ; $8e19: 90 c9     
            and $0490,y        ; $8e1b: 39 90 04  
            cmp #$3a           ; $8e1e: c9 3a     
            bcc __8e28         ; $8e20: 90 06     
            cmp #$37           ; $8e22: c9 37     
            bcc __8e42         ; $8e24: 90 1c     
            ldy #$02           ; $8e26: a0 02     
__8e28:     sty $07            ; $8e28: 84 07     
            lda $9d            ; $8e2a: a5 9d     
            asl                ; $8e2c: 0a        
            ora $9a            ; $8e2d: 05 9a     
            tax                ; $8e2f: aa        
            ldy __f006,x       ; $8e30: bc 06 f0  
            ldx #$00           ; $8e33: a2 00     
            jsr __924f         ; $8e35: 20 4f 92  
            lda $00            ; $8e38: a5 00     
            ldy $07            ; $8e3a: a4 07     
            jsr __9053         ; $8e3c: 20 53 90  
            bcc __8e42         ; $8e3f: 90 01     
__8e41:     rts                ; $8e41: 60        

;-------------------------------------------------------------------------------
__8e42:     lda #$09           ; $8e42: a9 09     
            sta $c7            ; $8e44: 85 c7     
            lda #$02           ; $8e46: a9 02     
            sta $9b            ; $8e48: 85 9b     
            lda #$0a           ; $8e4a: a9 0a     
            sta $84            ; $8e4c: 85 84     
            dec $9c            ; $8e4e: c6 9c     
            lda #$08           ; $8e50: a9 08     
            sta $0602          ; $8e52: 8d 02 06  
            lda #$00           ; $8e55: a9 00     
            sta $9a            ; $8e57: 85 9a     
            sta $f5            ; $8e59: 85 f5     
            sta $01            ; $8e5b: 85 01     
            ldx $042d          ; $8e5d: ae 2d 04  
            lda #$36           ; $8e60: a9 36     
            cmp $90,x          ; $8e62: d5 90     
            rol $01            ; $8e64: 26 01     
            lda $3c            ; $8e66: a5 3c     
            bpl __8e6f         ; $8e68: 10 05     
            eor #$ff           ; $8e6a: 49 ff     
            clc                ; $8e6c: 18        
            adc #$01           ; $8e6d: 69 01     
__8e6f:     cmp #$08           ; $8e6f: c9 08     
            rol $01            ; $8e71: 26 01     
            bne __8e89         ; $8e73: d0 14     
            ldy $9d            ; $8e75: a4 9d     
            .hex b9 be         ; $8e77: b9 be     Suspected data
__8e79:     sta $7518          ; $8e79: 8d 18 75  
            and #$95           ; $8e7c: 29 95     
            and #$a5           ; $8e7e: 29 a5     
            cpx $06f0          ; $8e80: ec f0 06  
            dey                ; $8e83: 88        
            tya                ; $8e84: 98        
__8e85:     adc $15,x          ; $8e85: 75 15     
            sta $15,x          ; $8e87: 95 15     
__8e89:     ldy $01            ; $8e89: a4 01     
            .hex b9            ; $8e8b: b9        Suspected data
__8e8c:     tsx                ; $8e8c: ba        
            sta $4795          ; $8e8d: 8d 95 47  
            lda $01            ; $8e90: a5 01     
            asl                ; $8e92: 0a        
            ora $9d            ; $8e93: 05 9d     
            tay                ; $8e95: a8        
            lda __8db2,y       ; $8e96: b9 b2 8d  
            sta $3d,x          ; $8e99: 95 3d     
            lda #$01           ; $8e9b: a9 01     
            sta $042f,x        ; $8e9d: 9d 2f 04  
            lsr                ; $8ea0: 4a        
            sta $a8,x          ; $8ea1: 95 a8     
            rts                ; $8ea3: 60        

;-------------------------------------------------------------------------------
__8ea4:     ldx #$0a           ; $8ea4: a2 0a     
            lda $3c,x          ; $8ea6: b5 3c     
            clc                ; $8ea8: 18        
            .hex 7d cb         ; $8ea9: 7d cb     Suspected data
__8eab:     .hex 04 08         ; $8eab: 04 08     Invalid Opcode - NOP $08
            bpl __8eb4         ; $8ead: 10 05     
            eor #$ff           ; $8eaf: 49 ff     
            clc                ; $8eb1: 18        
            adc #$01           ; $8eb2: 69 01     
__8eb4:     pha                ; $8eb4: 48        
            lsr                ; $8eb5: 4a        
            lsr                ; $8eb6: 4a        
            lsr                ; $8eb7: 4a        
            lsr                ; $8eb8: 4a        
            tay                ; $8eb9: a8        
            pla                ; $8eba: 68        
            asl                ; $8ebb: 0a        
            asl                ; $8ebc: 0a        
            asl                ; $8ebd: 0a        
__8ebe:     asl                ; $8ebe: 0a        
            clc                ; $8ebf: 18        
__8ec0:     .hex 7d 07         ; $8ec0: 7d 07     Suspected data
__8ec2:     .hex 04 9d         ; $8ec2: 04 9d     Invalid Opcode - NOP $9d
            .hex 07 04         ; $8ec4: 07 04     Invalid Opcode - SLO $04
            tya                ; $8ec6: 98        
            adc #$00           ; $8ec7: 69 00     
            plp                ; $8ec9: 28        
            bpl __8ed1         ; $8eca: 10 05     
            eor #$ff           ; $8ecc: 49 ff     
            clc                ; $8ece: 18        
            adc #$01           ; $8ecf: 69 01     
__8ed1:     ldy #$00           ; $8ed1: a0 00     
            cmp #$00           ; $8ed3: c9 00     
            bpl __8ed8         ; $8ed5: 10 01     
            dey                ; $8ed7: 88        
__8ed8:     clc                ; $8ed8: 18        
            adc $28,x          ; $8ed9: 75 28     
            sta $28,x          ; $8edb: 95 28     
            tya                ; $8edd: 98        
            adc $14,x          ; $8ede: 75 14     
            sta $14,x          ; $8ee0: 95 14     
            lda #$00           ; $8ee2: a9 00     
            sta $04cb,x        ; $8ee4: 9d cb 04  
            rts                ; $8ee7: 60        

;-------------------------------------------------------------------------------
__8ee8:     .hex 02            ; $8ee8: 02        Invalid Opcode - KIL 
            .hex 02            ; $8ee9: 02        Invalid Opcode - KIL 
            ora ($01,x)        ; $8eea: 01 01     
            .hex 02            ; $8eec: 02        Invalid Opcode - KIL 
            .hex 02            ; $8eed: 02        Invalid Opcode - KIL 
            .hex 02            ; $8eee: 02        Invalid Opcode - KIL 
            .hex 02            ; $8eef: 02        Invalid Opcode - KIL 
__8ef0:     php                ; $8ef0: 08        
            php                ; $8ef1: 08        
            .hex 04 04         ; $8ef2: 04 04     Invalid Opcode - NOP $04
            .hex 02            ; $8ef4: 02        Invalid Opcode - KIL 
            .hex 02            ; $8ef5: 02        Invalid Opcode - KIL 
            ora ($01,x)        ; $8ef6: 01 01     
__8ef8:     beq __8f0a         ; $8ef8: f0 10     
__8efa:     lda #$00           ; $8efa: a9 00     
            sta $5a            ; $8efc: 85 5a     
            sta $0624          ; $8efe: 8d 24 06  
            sta $07            ; $8f01: 85 07     
            sta $0a            ; $8f03: 85 0a     
            sta $0e            ; $8f05: 85 0e     
            sta $0c            ; $8f07: 85 0c     
            .hex 20            ; $8f09: 20        Suspected data
__8f0a:     sbc __a58f,x       ; $8f0a: fd 8f a5  
            txs                ; $8f0d: 9a        
            asl                ; $8f0e: 0a        
            ora $9c            ; $8f0f: 05 9c     
            tax                ; $8f11: aa        
            lda __f000,x       ; $8f12: bd 00 f0  
            sta $08            ; $8f15: 85 08     
            lda $46            ; $8f17: a5 46     
            clc                ; $8f19: 18        
            adc $04d5          ; $8f1a: 6d d5 04  
            bpl __8f2b         ; $8f1d: 10 0c     
            jsr __8fb2         ; $8f1f: 20 b2 8f  
            jsr __8ff5         ; $8f22: 20 f5 8f  
            lda $5a            ; $8f25: a5 5a     
__8f27:     bne __8f7a         ; $8f27: d0 51     
            beq __8f95         ; $8f29: f0 6a     
__8f2b:     jsr __8ff5         ; $8f2b: 20 f5 8f  
            jsr __8fb2         ; $8f2e: 20 b2 8f  
            lda $5a            ; $8f31: a5 5a     
            bne __8f4f         ; $8f33: d0 1a     
            lda #$00           ; $8f35: a9 00     
            ldx #$01           ; $8f37: a2 01     
            ldy $0635          ; $8f39: ac 35 06  
            cpy #$01           ; $8f3c: c0 01     
            beq __8f44         ; $8f3e: f0 04     
            cpy #$05           ; $8f40: c0 05     
            bne __8f47         ; $8f42: d0 03     
__8f44:     jsr __ba7c         ; $8f44: 20 7c ba  
__8f47:     sta $04df          ; $8f47: 8d df 04  
            stx $99            ; $8f4a: 86 99     
            jmp __8f95         ; $8f4c: 4c 95 8f  

;-------------------------------------------------------------------------------
__8f4f:     lda #$00           ; $8f4f: a9 00     
            .hex 8d            ; $8f51: 8d        Suspected data
__8f52:     .hex df 04 a5      ; $8f52: df 04 a5  Invalid Opcode - DCP __a504,x
            .hex 32            ; $8f55: 32        Invalid Opcode - KIL 
            and #$0c           ; $8f56: 29 0c     
            bne __8f95         ; $8f58: d0 3b     
            sta $99            ; $8f5a: 85 99     
            lda $32            ; $8f5c: a5 32     
            and #$f0           ; $8f5e: 29 f0     
            sta $32            ; $8f60: 85 32     
            lsr $0a            ; $8f62: 46 0a     
            bcc __8f6e         ; $8f64: 90 08     
            ldx $0a            ; $8f66: a6 0a     
            lda __8ef8,x       ; $8f68: bd f8 8e  
            sta $04cb          ; $8f6b: 8d cb 04  
__8f6e:     .hex 46            ; $8f6e: 46        Suspected data
__8f6f:     .hex 0c 90 05      ; $8f6f: 0c 90 05  Invalid Opcode - NOP $0590
            lda #$0f           ; $8f72: a9 0f     
__8f74:     sta $0624          ; $8f74: 8d 24 06  
            jsr __910c         ; $8f77: 20 0c 91  
__8f7a:     lda #$00           ; $8f7a: a9 00     
            sta $46            ; $8f7c: 85 46     
            sta $04d5          ; $8f7e: 8d d5 04  
            lda $04e0          ; $8f81: ad e0 04  
            bne __8f95         ; $8f84: d0 0f     
            lsr $0e            ; $8f86: 46 0e     
            bcc __8f95         ; $8f88: 90 0b     
            lda $0428          ; $8f8a: ad 28 04  
__8f8d:     sta $0429          ; $8f8d: 8d 29 04  
            ror $12            ; $8f90: 66 12     
            jsr __babf         ; $8f92: 20 bf ba  
__8f95:     ldy #$02           ; $8f95: a0 02     
            lda $3c            ; $8f97: a5 3c     
            clc                ; $8f99: 18        
            adc $04cb          ; $8f9a: 6d cb 04  
__8f9d:     bmi __8fa3         ; $8f9d: 30 04     
            dey                ; $8f9f: 88        
__8fa0:     jsr __8ff5         ; $8fa0: 20 f5 8f  
__8fa3:     sty $6e            ; $8fa3: 84 6e     
            jsr __8fb2         ; $8fa5: 20 b2 8f  
            lda $5a            ; $8fa8: a5 5a     
            and #$03           ; $8faa: 29 03     
            beq __8fb1         ; $8fac: f0 03     
            jmp __9333         ; $8fae: 4c 33 93  

;-------------------------------------------------------------------------------
__8fb1:     rts                ; $8fb1: 60        

;-------------------------------------------------------------------------------
__8fb2:     jsr __8fb5         ; $8fb2: 20 b5 8f  
__8fb5:     ldx #$00           ; $8fb5: a2 00     
            ldy $08            ; $8fb7: a4 08     
            jsr __924f         ; $8fb9: 20 4f 92  
            ldx $07            ; $8fbc: a6 07     
            ldy __8ee8,x       ; $8fbe: bc e8 8e  
            lda $00            ; $8fc1: a5 00     
            jsr __9053         ; $8fc3: 20 53 90  
            bcc __8ff2         ; $8fc6: 90 2a     
            cmp #$1a           ; $8fc8: c9 1a     
            bne __8fd3         ; $8fca: d0 07     
            lda __8ee8,x       ; $8fcc: bd e8 8e  
            sta $0e            ; $8fcf: 85 0e     
            bne __8feb         ; $8fd1: d0 18     
__8fd3:     cmp #$16           ; $8fd3: c9 16     
            bne __8fde         ; $8fd5: d0 07     
            lda __8ee8,x       ; $8fd7: bd e8 8e  
            sta $0c            ; $8fda: 85 0c     
            bne __8feb         ; $8fdc: d0 0d     
__8fde:     sec                ; $8fde: 38        
            sbc #$67           ; $8fdf: e9 67     
            cmp #$02           ; $8fe1: c9 02     
            bcs __8feb         ; $8fe3: b0 06     
            asl                ; $8fe5: 0a        
            ora __8ee8,x       ; $8fe6: 1d e8 8e  
            sta $0a            ; $8fe9: 85 0a     
__8feb:     lda __8ef0,x       ; $8feb: bd f0 8e  
            ora $5a            ; $8fee: 05 5a     
            sta $5a            ; $8ff0: 85 5a     
__8ff2:     jmp __8ff8         ; $8ff2: 4c f8 8f  

;-------------------------------------------------------------------------------
__8ff5:     jsr __8ff8         ; $8ff5: 20 f8 8f  
__8ff8:     inc $07            ; $8ff8: e6 07     
            inc $08            ; $8ffa: e6 08     
            rts                ; $8ffc: 60        

;-------------------------------------------------------------------------------
            ldy __f00a         ; $8ffd: ac 0a f0  
            lda $10            ; $9000: a5 10     
            lsr                ; $9002: 4a        
            .hex b0            ; $9003: b0        Suspected data
__9004:     ora ($c8,x)        ; $9004: 01 c8     
            ldx #$00           ; $9006: a2 00     
            jsr __8b35         ; $9008: 20 35 8b  
            bcs __902d         ; $900b: b0 20     
            lda $00            ; $900d: a5 00     
            cmp #$4e           ; $900f: c9 4e     
            bne __9052         ; $9011: d0 3f     
            inc $062a          ; $9013: ee 2a 06  
            lda $062a          ; $9016: ad 2a 06  
            sbc #$05           ; $9019: e9 05     
            bne __9023         ; $901b: d0 06     
            sta $062a          ; $901d: 8d 2a 06  
__9020:     jsr __b9b8         ; $9020: 20 b8 b9  
__9023:     lda #$04           ; $9023: a9 04     
            sta $0602          ; $9025: 8d 02 06  
            lda #$40           ; $9028: a9 40     
            jmp __937c         ; $902a: 4c 7c 93  

;-------------------------------------------------------------------------------
__902d:     lda $f7            ; $902d: a5 f7     
            and #$0c           ; $902f: 29 0c     
            beq __9052         ; $9031: f0 1f     
            ldy $9c            ; $9033: a4 9c     
            bne __9052         ; $9035: d0 1b     
            lda $28            ; $9037: a5 28     
            clc                ; $9039: 18        
            adc #$04           ; $903a: 69 04     
            and #$0f           ; $903c: 29 0f     
            cmp #$08           ; $903e: c9 08     
            bcs __9052         ; $9040: b0 10     
            lda #$01           ; $9042: a9 01     
            sta $50            ; $9044: 85 50     
            sty $99            ; $9046: 84 99     
            sty $9a            ; $9048: 84 9a     
            lda #$0a           ; $904a: a9 0a     
            sta $c7            ; $904c: 85 c7     
            pla                ; $904e: 68        
            pla                ; $904f: 68        
            pla                ; $9050: 68        
            pla                ; $9051: 68        
__9052:     rts                ; $9052: 60        

;-------------------------------------------------------------------------------
__9053:     pha                ; $9053: 48        
            and #$c0           ; $9054: 29 c0     
            asl                ; $9056: 0a        
            rol                ; $9057: 2a        
            rol                ; $9058: 2a        
            adc __9062,y       ; $9059: 79 62 90  
__905c:     tay                ; $905c: a8        
            pla                ; $905d: 68        
            cmp __f64e,y       ; $905e: d9 4e f6  
            rts                ; $9061: 60        

;-------------------------------------------------------------------------------
__9062:     brk                ; $9062: 00        
            .hex 04 08         ; $9063: 04 08     Invalid Opcode - NOP $08
__9065:     and $3939,y        ; $9065: 39 39 39  
            .hex 3a            ; $9068: 3a        Invalid Opcode - NOP 
            rol $33,x          ; $9069: 36 33     
            .hex 32            ; $906b: 32        Invalid Opcode - KIL 
            sec                ; $906c: 38        
            and $37,x          ; $906d: 35 37     
            rol $3a40,x        ; $906f: 3e 40 3a  
            ora #$39           ; $9072: 09 39     
__9074:     ldx #$06           ; $9074: a2 06     
__9076:     lda $51,x          ; $9076: b5 51     
            beq __9080         ; $9078: f0 06     
            inx                ; $907a: e8        
            cpx #$09           ; $907b: e0 09     
            bcc __9076         ; $907d: 90 f7     
            rts                ; $907f: 60        

;-------------------------------------------------------------------------------
__9080:     lda $00            ; $9080: a5 00     
            sta $79,x          ; $9082: 95 79     
            lda $03            ; $9084: a5 03     
            sta $15,x          ; $9086: 95 15     
            lda $04            ; $9088: a5 04     
            sta $1f,x          ; $908a: 95 1f     
            lda $05            ; $908c: a5 05     
            sta $29,x          ; $908e: 95 29     
            lda $06            ; $9090: a5 06     
            sta $33,x          ; $9092: 95 33     
            lda #$00           ; $9094: a9 00     
            sta $042f,x        ; $9096: 9d 2f 04  
            sta $9f,x          ; $9099: 95 9f     
            sta $b1,x          ; $909b: 95 b1     
            jsr __ba48         ; $909d: 20 48 ba  
            lda #$01           ; $90a0: a9 01     
            ldy $09            ; $90a2: a4 09     
            cpy #$0e           ; $90a4: c0 0e     
            bne __90ae         ; $90a6: d0 06     
            lda #$20           ; $90a8: a9 20     
            sta $86,x          ; $90aa: 95 86     
            lda #$06           ; $90ac: a9 06     
__90ae:     sta $51,x          ; $90ae: 95 51     
            lda __9065,y       ; $90b0: b9 65 90  
            sta $90,x          ; $90b3: 95 90     
            ldy #$ff           ; $90b5: a0 ff     
            cmp #$37           ; $90b7: c9 37     
            beq __90c1         ; $90b9: f0 06     
            cmp #$09           ; $90bb: c9 09     
            bne __90c5         ; $90bd: d0 06     
            ldy #$50           ; $90bf: a0 50     
__90c1:     sty $86,x          ; $90c1: 94 86     
__90c3:     bne __90ea         ; $90c3: d0 25     
__90c5:     cmp #$40           ; $90c5: c9 40     
            bne __90d5         ; $90c7: d0 0c     
            lda $0620          ; $90c9: ad 20 06  
            beq __90ea         ; $90cc: f0 1c     
            lda #$32           ; $90ce: a9 32     
            sta $90,x          ; $90d0: 95 90     
            jmp __90ea         ; $90d2: 4c ea 90  

;-------------------------------------------------------------------------------
__90d5:     cmp #$33           ; $90d5: c9 33     
            bne __90ea         ; $90d7: d0 11     
            ldy $062c          ; $90d9: ac 2c 06  
            iny                ; $90dc: c8        
            cpy #$05           ; $90dd: c0 05     
            bcc __90e7         ; $90df: 90 06     
            lda #$46           ; $90e1: a9 46     
            sta $90,x          ; $90e3: 95 90     
            ldy #$00           ; $90e5: a0 00     
__90e7:     sty $062c          ; $90e7: 8c 2c 06  
__90ea:     jsr __b9eb         ; $90ea: 20 eb b9  
            lda #$04           ; $90ed: a9 04     
            sta $5b,x          ; $90ef: 95 5b     
            lda #$40           ; $90f1: a9 40     
            jsr __934f         ; $90f3: 20 4f 93  
            lda #$07           ; $90f6: a9 07     
            sta $a8,x          ; $90f8: 95 a8     
            .hex 8e            ; $90fa: 8e        Suspected data
__90fb:     and __a904         ; $90fb: 2d 04 a9  
            .hex 02            ; $90fe: 02        Invalid Opcode - KIL 
            sta $50            ; $90ff: 85 50     
            lda #$06           ; $9101: a9 06     
            sta $82            ; $9103: 85 82     
            lda #$08           ; $9105: a9 08     
            sta $c7            ; $9107: 85 c7     
            inc $9c            ; $9109: e6 9c     
__910b:     rts                ; $910b: 60        

;-------------------------------------------------------------------------------
__910c:     .hex a4            ; $910c: a4        Suspected data
__910d:     .hex 9c d0 6c      ; $910d: 9c d0 6c  Invalid Opcode - SHY $6cd0,x
            lda $9a            ; $9110: a5 9a     
            beq __9155         ; $9112: f0 41     
            lda $00            ; $9114: a5 00     
            ldx $0628          ; $9116: ae 28 06  
            cpx #$02           ; $9119: e0 02     
            bne __9123         ; $911b: d0 06     
            cmp #$74           ; $911d: c9 74     
            beq __912d         ; $911f: f0 0c     
            .hex d0            ; $9121: d0        Suspected data
__9122:     .hex 59            ; $9122: 59        Suspected data
__9123:     iny                ; $9123: c8        
            cmp #$73           ; $9124: c9 73     
            beq __912d         ; $9126: f0 05     
            cmp #$6f           ; $9128: c9 6f     
            bne __917c         ; $912a: d0 50     
            iny                ; $912c: c8        
__912d:     lda $28            ; $912d: a5 28     
            clc                ; $912f: 18        
            adc #$04           ; $9130: 69 04     
            and #$0f           ; $9132: 29 0f     
            cmp #$08           ; $9134: c9 08     
            .hex b0            ; $9136: b0        Suspected data
__9137:     .hex 44 a9         ; $9137: 44 a9     Invalid Opcode - NOP $a9
            brk                ; $9139: 00        
            sta $3c            ; $913a: 85 3c     
            lda #$04           ; $913c: a9 04     
            sta $50            ; $913e: 85 50     
            sty $04ee          ; $9140: 8c ee 04  
__9143:     lda $28            ; $9143: a5 28     
            clc                ; $9145: 18        
            adc #$08           ; $9146: 69 08     
            and #$f0           ; $9148: 29 f0     
            sta $28            ; $914a: 85 28     
            bcc __9154         ; $914c: 90 06     
            lda $ec            ; $914e: a5 ec     
            beq __9154         ; $9150: f0 02     
            inc $14            ; $9152: e6 14     
__9154:     rts                ; $9154: 60        

;-------------------------------------------------------------------------------
__9155:     bit $f5            ; $9155: 24 f5     
            bvc __917c         ; $9157: 50 23     
            lda $28            ; $9159: a5 28     
            clc                ; $915b: 18        
            adc #$06           ; $915c: 69 06     
            and #$0f           ; $915e: 29 0f     
            cmp #$0c           ; $9160: c9 0c     
            bcs __917c         ; $9162: b0 18     
            lda $00            ; $9164: a5 00     
            cmp #$93           ; $9166: c9 93     
            bne __916e         ; $9168: d0 04     
            lda #$0e           ; $916a: a9 0e     
            bne __9177         ; $916c: d0 09     
__916e:     cmp #$6d           ; $916e: c9 6d     
            bcs __917c         ; $9170: b0 0a     
            sec                ; $9172: 38        
            sbc #$69           ; $9173: e9 69     
            bcc __917c         ; $9175: 90 05     
__9177:     sta $09            ; $9177: 85 09     
            jmp __9074         ; $9179: 4c 74 90  

;-------------------------------------------------------------------------------
__917c:     lda $9a            ; $917c: a5 9a     
            bne __91ce         ; $917e: d0 4e     
            lda $06            ; $9180: a5 06     
            sec                ; $9182: 38        
            .hex e9            ; $9183: e9        Suspected data
__9184:     bpl __910b         ; $9184: 10 85     
            asl $85            ; $9186: 06 85     
            inc $a5            ; $9188: e6 a5     
            .hex 04 e9         ; $918a: 04 e9     Invalid Opcode - NOP $e9
            brk                ; $918c: 00        
            sta $04            ; $918d: 85 04     
            sta $01            ; $918f: 85 01     
            lda $03            ; $9191: a5 03     
            sta $02            ; $9193: 85 02     
            jsr __92c1         ; $9195: 20 c1 92  
            bcs __91ce         ; $9198: b0 34     
            jsr __ba4e         ; $919a: 20 4e ba  
            ldy $e7            ; $919d: a4 e7     
            lda ($01),y        ; $919f: b1 01     
            ldx $9c            ; $91a1: a6 9c     
            beq __91ae         ; $91a3: f0 09     
            ldx $042d          ; $91a5: ae 2d 04  
            ldy $90,x          ; $91a8: b4 90     
            cpy #$3d           ; $91aa: c0 3d     
            bne __91ce         ; $91ac: d0 20     
__91ae:     .hex ae 28         ; $91ae: ae 28     Suspected data
__91b0:     asl $e0            ; $91b0: 06 e0     
            .hex 02            ; $91b2: 02        Invalid Opcode - KIL 
            beq __91bf         ; $91b3: f0 0a     
            ldy #$04           ; $91b5: a0 04     
__91b7:     cmp __924a,y       ; $91b7: d9 4a 92  
            beq __91eb         ; $91ba: f0 2f     
            dey                ; $91bc: 88        
            bpl __91b7         ; $91bd: 10 f8     
__91bf:     bit $f5            ; $91bf: 24 f5     
            bvc __91ce         ; $91c1: 50 0b     
            sta $00            ; $91c3: 85 00     
__91c5:     cmp #$4d           ; $91c5: c9 4d     
__91c7:     bcs __91ce         ; $91c7: b0 05     
            sec                ; $91c9: 38        
            sbc #$43           ; $91ca: e9 43     
            bcs __91cf         ; $91cc: b0 01     
__91ce:     rts                ; $91ce: 60        

;-------------------------------------------------------------------------------
__91cf:     ldx $0628          ; $91cf: ae 28 06  
            cpx #$02           ; $91d2: e0 02     
            bne __91e3         ; $91d4: d0 0d     
            lda $0621          ; $91d6: ad 21 06  
            cmp #$02           ; $91d9: c9 02     
            bcs __91e2         ; $91db: b0 05     
            inc $0622          ; $91dd: ee 22 06  
            ldx #$00           ; $91e0: a2 00     
__91e2:     txa                ; $91e2: 8a        
__91e3:     clc                ; $91e3: 18        
            adc #$04           ; $91e4: 69 04     
            sta $09            ; $91e6: 85 09     
            jmp __9074         ; $91e8: 4c 74 90  

;-------------------------------------------------------------------------------
__91eb:     lda $f5            ; $91eb: a5 f5     
            and #$08           ; $91ed: 29 08     
            beq __91ce         ; $91ef: f0 dd     
            lda $28            ; $91f1: a5 28     
            clc                ; $91f3: 18        
            adc #$05           ; $91f4: 69 05     
            and #$0f           ; $91f6: 29 0f     
            cmp #$0a           ; $91f8: c9 0a     
            bcs __91ce         ; $91fa: b0 d2     
            cpy #$04           ; $91fc: c0 04     
            bne __9205         ; $91fe: d0 05     
            dey                ; $9200: 88        
            sty $04ec          ; $9201: 8c ec 04  
            rts                ; $9204: 60        

;-------------------------------------------------------------------------------
__9205:     lda #$01           ; $9205: a9 01     
            sta $0534          ; $9207: 8d 34 05  
            tya                ; $920a: 98        
            jsr __e125         ; $920b: 20 25 e1  
            asl $92,x          ; $920e: 16 92     
            plp                ; $9210: 28        
            .hex 92            ; $9211: 92        Invalid Opcode - KIL 
__9212:     .hex 44            ; $9212: 44        Suspected data
__9213:     .hex 92            ; $9213: 92        Invalid Opcode - KIL 
            .hex 44 92         ; $9214: 44 92     Invalid Opcode - NOP $92
            jsr __b964         ; $9216: 20 64 b9  
__9219:     inc $04bd          ; $9219: ee bd 04  
            inc $041b          ; $921c: ee 1b 04  
            jsr __9143         ; $921f: 20 43 91  
            lda #$01           ; $9222: a9 01     
            sta $0601          ; $9224: 8d 01 06  
__9227:     rts                ; $9227: 60        

;-------------------------------------------------------------------------------
            lda $9c            ; $9228: a5 9c     
            beq __9227         ; $922a: f0 fb     
            ldy $042d          ; $922c: ac 2d 04  
            lda $0090,y        ; $922f: b9 90 00  
            cmp #$3d           ; $9232: c9 3d     
            bne __9227         ; $9234: d0 f1     
            inc $04b0          ; $9236: ee b0 04  
            tya                ; $9239: 98        
            tax                ; $923a: aa        
            jsr __ba33         ; $923b: 20 33 ba  
            jsr __b960         ; $923e: 20 60 b9  
            jmp __9219         ; $9241: 4c 19 92  

;-------------------------------------------------------------------------------
            inc $0627          ; $9244: ee 27 06  
            .hex 4c da         ; $9247: 4c da     Suspected data
__9249:     .hex f6            ; $9249: f6        Suspected data
__924a:     eor ($50),y        ; $924a: 51 50     
            .hex 83 52         ; $924c: 83 52     Invalid Opcode - SAX ($52,x)
            .hex 56            ; $924e: 56        Suspected data
__924f:     txa                ; $924f: 8a        
            pha                ; $9250: 48        
            lda #$00           ; $9251: a9 00     
            sta $00            ; $9253: 85 00     
            sta $01            ; $9255: 85 01     
            lda __f011,y       ; $9257: b9 11 f0  
            bpl __925e         ; $925a: 10 02     
            dec $00            ; $925c: c6 00     
__925e:     clc                ; $925e: 18        
            adc $28,x          ; $925f: 75 28     
            and #$f0           ; $9261: 29 f0     
            sta $05            ; $9263: 85 05     
            php                ; $9265: 08        
            lsr                ; $9266: 4a        
            lsr                ; $9267: 4a        
            lsr                ; $9268: 4a        
            lsr                ; $9269: 4a        
            sta $e5            ; $926a: 85 e5     
            plp                ; $926c: 28        
            lda $14,x          ; $926d: b5 14     
            adc $00            ; $926f: 65 00     
            sta $02            ; $9271: 85 02     
            .hex 85            ; $9273: 85        Suspected data
__9274:     .hex 03 a5         ; $9274: 03 a5     Invalid Opcode - SLO ($a5,x)
            .hex ec            ; $9276: ec        Suspected data
__9277:     bne __927d         ; $9277: d0 04     
            .hex 85            ; $9279: 85        Suspected data
__927a:     .hex 02            ; $927a: 02        Invalid Opcode - KIL 
            sta $03            ; $927b: 85 03     
__927d:     lda __f055,y       ; $927d: b9 55 f0  
            bpl __9284         ; $9280: 10 02     
            dec $01            ; $9282: c6 01     
__9284:     clc                ; $9284: 18        
            adc $32,x          ; $9285: 75 32     
            and #$f0           ; $9287: 29 f0     
__9289:     sta $06            ; $9289: 85 06     
            sta $e6            ; $928b: 85 e6     
            lda $1e,x          ; $928d: b5 1e     
            adc $01            ; $928f: 65 01     
            sta $01            ; $9291: 85 01     
            sta $04            ; $9293: 85 04     
            jsr __92c1         ; $9295: 20 c1 92  
            bcc __929e         ; $9298: 90 04     
            lda #$00           ; $929a: a9 00     
            beq __92a5         ; $929c: f0 07     
__929e:     jsr __ba4e         ; $929e: 20 4e ba  
            ldy $e7            ; $92a1: a4 e7     
            lda ($01),y        ; $92a3: b1 01     
__92a5:     sta $00            ; $92a5: 85 00     
            pla                ; $92a7: 68        
            tax                ; $92a8: aa        
            rts                ; $92a9: 60        

;-------------------------------------------------------------------------------
            sta $0f            ; $92aa: 85 0f     
            tya                ; $92ac: 98        
            bmi __92c0         ; $92ad: 30 11     
            asl                ; $92af: 0a        
            asl                ; $92b0: 0a        
            asl                ; $92b1: 0a        
            asl                ; $92b2: 0a        
            clc                ; $92b3: 18        
            adc $0f            ; $92b4: 65 0f     
            bcs __92bc         ; $92b6: b0 04     
            cmp #$f0           ; $92b8: c9 f0     
            bcc __92c0         ; $92ba: 90 04     
__92bc:     clc                ; $92bc: 18        
            adc #$10           ; $92bd: 69 10     
            iny                ; $92bf: c8        
__92c0:     rts                ; $92c0: 60        

;-------------------------------------------------------------------------------
__92c1:     ldy $01            ; $92c1: a4 01     
            .hex a5            ; $92c3: a5        Suspected data
__92c4:     inc $20            ; $92c4: e6 20     
            tax                ; $92c6: aa        
            .hex 92            ; $92c7: 92        Invalid Opcode - KIL 
__92c8:     sty $01            ; $92c8: 84 01     
            sta $e6            ; $92ca: 85 e6     
            ldy $ec            ; $92cc: a4 ec     
            lda $0001,y        ; $92ce: b9 01 00  
            sta $e8            ; $92d1: 85 e8     
            lda $02            ; $92d3: a5 02     
            cmp __92e1,y       ; $92d5: d9 e1 92  
            bcs __92df         ; $92d8: b0 05     
            lda $01            ; $92da: a5 01     
            cmp __92e0,y       ; $92dc: d9 e0 92  
__92df:     rts                ; $92df: 60        

;-------------------------------------------------------------------------------
__92e0:     asl                ; $92e0: 0a        
__92e1:     ora ($0b,x)        ; $92e1: 01 0b     
            ldx $d8            ; $92e3: a6 d8     
            bne __9311         ; $92e5: d0 2a     
            lda $50            ; $92e7: a5 50     
            cmp #$02           ; $92e9: c9 02     
            bcs __9311         ; $92eb: b0 24     
            lda $042b          ; $92ed: ad 2b 04  
            ldy $042a          ; $92f0: ac 2a 04  
            bmi __92ff         ; $92f3: 30 0a     
            bne __9305         ; $92f5: d0 0e     
            cmp #$b4           ; $92f7: c9 b4     
            bcs __9305         ; $92f9: b0 0a     
            cmp #$21           ; $92fb: c9 21     
            bcs __9307         ; $92fd: b0 08     
__92ff:     ldy $99            ; $92ff: a4 99     
            bne __9307         ; $9301: d0 04     
            beq __9306         ; $9303: f0 01     
__9305:     inx                ; $9305: e8        
__9306:     inx                ; $9306: e8        
__9307:     .hex ad            ; $9307: ad        Suspected data
__9308:     and $04            ; $9308: 25 04     
__930a:     stx $0425          ; $930a: 8e 25 04  
__930d:     bne __9311         ; $930d: d0 02     
            .hex 86            ; $930f: 86        Suspected data
__9310:     cld                ; $9310: d8        
__9311:     rts                ; $9311: 60        

;-------------------------------------------------------------------------------
            .hex 01            ; $9312: 01        Suspected data
__9313:     .hex 02            ; $9313: 02        Invalid Opcode - KIL 
            .hex 80 00         ; $9314: 80 00     Invalid Opcode - NOP #$00
__9316:     lda $ec            ; $9316: a5 ec     
            beq __9327         ; $9318: f0 0d     
            lda $0428          ; $931a: ad 28 04  
            ldy $6e            ; $931d: a4 6e     
            cpy #$01           ; $931f: c0 01     
            beq __9328         ; $9321: f0 05     
            cmp #$08           ; $9323: c9 08     
            bcc __932c         ; $9325: 90 05     
__9327:     rts                ; $9327: 60        

;-------------------------------------------------------------------------------
__9328:     cmp #$e8           ; $9328: c9 e8     
            bcc __9327         ; $932a: 90 fb     
__932c:     lda $5a            ; $932c: a5 5a     
            ora __9311,y       ; $932e: 19 11 93  
            sta $5a            ; $9331: 85 5a     
__9333:     ldx #$00           ; $9333: a2 00     
            ldy $6e            ; $9335: a4 6e     
            lda $3c            ; $9337: a5 3c     
            eor __9313,y       ; $9339: 59 13 93  
            bpl __9340         ; $933c: 10 02     
            stx $3c            ; $933e: 86 3c     
__9340:     lda $04cb          ; $9340: ad cb 04  
            eor __9313,y       ; $9343: 59 13 93  
            bpl __934b         ; $9346: 10 03     
            stx $04cb          ; $9348: 8e cb 04  
__934b:     stx $0407          ; $934b: 8e 07 04  
__934e:     rts                ; $934e: 60        

;-------------------------------------------------------------------------------
__934f:     pha                ; $934f: 48        
            lda $29,x          ; $9350: b5 29     
            clc                ; $9352: 18        
            adc #$08           ; $9353: 69 08     
            php                ; $9355: 08        
            lsr                ; $9356: 4a        
            lsr                ; $9357: 4a        
            lsr                ; $9358: 4a        
            lsr                ; $9359: 4a        
            sta $e5            ; $935a: 85 e5     
            plp                ; $935c: 28        
            lda $15,x          ; $935d: b5 15     
            ldy $ec            ; $935f: a4 ec     
            beq __9365         ; $9361: f0 02     
            adc #$00           ; $9363: 69 00     
__9365:     sta $02            ; $9365: 85 02     
            lda $33,x          ; $9367: b5 33     
            clc                ; $9369: 18        
            adc #$08           ; $936a: 69 08     
            and #$f0           ; $936c: 29 f0     
            sta $e6            ; $936e: 85 e6     
            lda $1f,x          ; $9370: b5 1f     
            adc #$00           ; $9372: 69 00     
            sta $01            ; $9374: 85 01     
            jsr __92c1         ; $9376: 20 c1 92  
            pla                ; $9379: 68        
            bcs __934e         ; $937a: b0 d2     
__937c:     stx $03            ; $937c: 86 03     
            pha                ; $937e: 48        
            jsr __ba4e         ; $937f: 20 4e ba  
            pla                ; $9382: 68        
            ldy $e7            ; $9383: a4 e7     
            sta ($01),y        ; $9385: 91 01     
            pha                ; $9387: 48        
            ldx $0300          ; $9388: ae 00 03  
            lda #$00           ; $938b: a9 00     
            sta $0301,x        ; $938d: 9d 01 03  
            tya                ; $9390: 98        
            and #$f0           ; $9391: 29 f0     
            asl                ; $9393: 0a        
            rol $0301,x        ; $9394: 3e 01 03  
            asl                ; $9397: 0a        
            rol $0301,x        ; $9398: 3e 01 03  
            sta $0302,x        ; $939b: 9d 02 03  
            tya                ; $939e: 98        
            and #$0f           ; $939f: 29 0f     
            asl                ; $93a1: 0a        
            adc $0302,x        ; $93a2: 7d 02 03  
            sta $0302,x        ; $93a5: 9d 02 03  
            clc                ; $93a8: 18        
            adc #$20           ; $93a9: 69 20     
            sta $0307,x        ; $93ab: 9d 07 03  
            lda $ec            ; $93ae: a5 ec     
            asl                ; $93b0: 0a        
            tay                ; $93b1: a8        
            lda $01            ; $93b2: a5 01     
            and #$10           ; $93b4: 29 10     
            .hex d0            ; $93b6: d0        Suspected data
__93b7:     ora ($c8,x)        ; $93b7: 01 c8     
            lda __940a,y       ; $93b9: b9 0a 94  
            clc                ; $93bc: 18        
            adc $0301,x        ; $93bd: 7d 01 03  
            sta $0301,x        ; $93c0: 9d 01 03  
            sta $0306,x        ; $93c3: 9d 06 03  
            lda #$02           ; $93c6: a9 02     
            sta $0303,x        ; $93c8: 9d 03 03  
            sta $0308,x        ; $93cb: 9d 08 03  
            pla                ; $93ce: 68        
            pha                ; $93cf: 48        
            and #$c0           ; $93d0: 29 c0     
            asl                ; $93d2: 0a        
            rol                ; $93d3: 2a        
            rol                ; $93d4: 2a        
            tay                ; $93d5: a8        
            lda __f7e9,y       ; $93d6: b9 e9 f7  
            sta $00            ; $93d9: 85 00     
            lda __f7ed,y       ; $93db: b9 ed f7  
            sta $01            ; $93de: 85 01     
            pla                ; $93e0: 68        
            asl                ; $93e1: 0a        
            asl                ; $93e2: 0a        
            tay                ; $93e3: a8        
            lda ($00),y        ; $93e4: b1 00     
            sta $0304,x        ; $93e6: 9d 04 03  
            iny                ; $93e9: c8        
            lda ($00),y        ; $93ea: b1 00     
            sta $0305,x        ; $93ec: 9d 05 03  
            iny                ; $93ef: c8        
            lda ($00),y        ; $93f0: b1 00     
            sta $0309,x        ; $93f2: 9d 09 03  
            iny                ; $93f5: c8        
            lda ($00),y        ; $93f6: b1 00     
            sta $030a,x        ; $93f8: 9d 0a 03  
            lda #$00           ; $93fb: a9 00     
            sta $030b,x        ; $93fd: 9d 0b 03  
            txa                ; $9400: 8a        
            clc                ; $9401: 18        
            adc #$0a           ; $9402: 69 0a     
            sta $0300          ; $9404: 8d 00 03  
            ldx $03            ; $9407: a6 03     
            rts                ; $9409: 60        

;-------------------------------------------------------------------------------
__940a:     jsr $2028          ; $940a: 20 28 20  
            bit $ad            ; $940d: 24 ad     
            plp                ; $940f: 28        
            asl $d0            ; $9410: 06 d0     
            .hex 14 a5         ; $9412: 14 a5     Invalid Opcode - NOP $a5,x
            .hex 14 8d         ; $9414: 14 8d     Invalid Opcode - NOP $8d,x
            .hex 0f 05 a5      ; $9416: 0f 05 a5  Invalid Opcode - SLO __a505
            plp                ; $9419: 28        
            sta $0511          ; $941a: 8d 11 05  
            lda $1e            ; $941d: a5 1e     
            sta $0510          ; $941f: 8d 10 05  
            lda $32            ; $9422: a5 32     
            sta $0512          ; $9424: 8d 12 05  
__9427:     rts                ; $9427: 60        

;-------------------------------------------------------------------------------
__9428:     lda $050f          ; $9428: ad 0f 05  
            sta $14            ; $942b: 85 14     
            lda $0511          ; $942d: ad 11 05  
__9430:     sta $28            ; $9430: 85 28     
            lda $0510          ; $9432: ad 10 05  
            sta $1e            ; $9435: 85 1e     
            lda $0512          ; $9437: ad 12 05  
            .hex 85            ; $943a: 85        Suspected data
__943b:     .hex 32            ; $943b: 32        Invalid Opcode - KIL 
            lda $28            ; $943c: a5 28     
            sec                ; $943e: 38        
            sbc $04c0          ; $943f: ed c0 04  
            sta $0428          ; $9442: 8d 28 04  
            lda $32            ; $9445: a5 32     
            sec                ; $9447: 38        
            sbc $cb            ; $9448: e5 cb     
            sta $042b          ; $944a: 8d 2b 04  
            lda $1e            ; $944d: a5 1e     
            sbc $ca            ; $944f: e5 ca     
            sta $042a          ; $9451: 8d 2a 04  
            lda $0534          ; $9454: ad 34 05  
            sec                ; $9457: 38        
            sbc #$04           ; $9458: e9 04     
            bne __9427         ; $945a: d0 cb     
            sta $50            ; $945c: 85 50     
            sta $041b          ; $945e: 8d 1b 04  
            sta $04b7          ; $9461: 8d b7 04  
            jsr __b964         ; $9464: 20 64 b9  
            lda #$0a           ; $9467: a9 0a     
            sta $04b3          ; $9469: 8d b3 04  
            rts                ; $946c: 60        

;-------------------------------------------------------------------------------
__946d:     lda $0534          ; $946d: ad 34 05  
__9470:     cmp #$02           ; $9470: c9 02     
            bne __947f         ; $9472: d0 0b     
            lda $04ee          ; $9474: ad ee 04  
            bne __947f         ; $9477: d0 06     
            jsr __9428         ; $9479: 20 28 94  
            jmp __94c2         ; $947c: 4c c2 94  

;-------------------------------------------------------------------------------
__947f:     lda $0533          ; $947f: ad 33 05  
            ldy #$00           ; $9482: a0 00     
            ldx $ec            ; $9484: a6 ec     
__9486:     bne __948e         ; $9486: d0 06     
            sty $14            ; $9488: 84 14     
            sta $1e            ; $948a: 85 1e     
            beq __9492         ; $948c: f0 04     
__948e:     sta $14            ; $948e: 85 14     
            sty $1e            ; $9490: 84 1e     
__9492:     jsr __94ca         ; $9492: 20 ca 94  
            ldy $1e            ; $9495: a4 1e     
            lda $32            ; $9497: a5 32     
            jsr __95af         ; $9499: 20 af 95  
            sty $1e            ; $949c: 84 1e     
            sta $32            ; $949e: 85 32     
            lda $28            ; $94a0: a5 28     
            sec                ; $94a2: 38        
            sbc $04c0          ; $94a3: ed c0 04  
            sta $0428          ; $94a6: 8d 28 04  
            lda $32            ; $94a9: a5 32     
            sec                ; $94ab: 38        
            sbc $cb            ; $94ac: e5 cb     
            sta $042b          ; $94ae: 8d 2b 04  
            lda $1e            ; $94b1: a5 1e     
            sbc $ca            ; $94b3: e5 ca     
            sta $042a          ; $94b5: 8d 2a 04  
            lda $0534          ; $94b8: ad 34 05  
            cmp #$04           ; $94bb: c9 04     
            bne __94c2         ; $94bd: d0 03     
            jsr __b964         ; $94bf: 20 64 b9  
__94c2:     lda $28            ; $94c2: a5 28     
            sec                ; $94c4: 38        
            sbc #$78           ; $94c5: e9 78     
            sta $ba            ; $94c7: 85 ba     
            rts                ; $94c9: 60        

;-------------------------------------------------------------------------------
__94ca:     lda $0534          ; $94ca: ad 34 05  
            jsr __e125         ; $94cd: 20 25 e1  
            .hex dc 94 14      ; $94d0: dc 94 14  Invalid Opcode - NOP $1494,x
            sta $5d,x          ; $94d3: 95 5d     
            sta $6a,x          ; $94d5: 95 6a     
            sta $8c,x          ; $94d7: 95 8c     
            sta $a7,x          ; $94d9: 95 a7     
            sta $a9,x          ; $94db: 95 a9     
            ora ($85,x)        ; $94dd: 01 85     
            sta $6120,x        ; $94df: 9d 20 61  
            sta $4a,x          ; $94e2: 95 4a     
            lsr                ; $94e4: 4a        
            lsr                ; $94e5: 4a        
            lsr                ; $94e6: 4a        
            sta $e5            ; $94e7: 85 e5     
            lda #$d0           ; $94e9: a9 d0     
            sta $32            ; $94eb: 85 32     
            sta $e6            ; $94ed: 85 e6     
            lda $0533          ; $94ef: ad 33 05  
            sta $e8            ; $94f2: 85 e8     
            lda #$0c           ; $94f4: a9 0c     
            sta $03            ; $94f6: 85 03     
__94f8:     jsr __ba4e         ; $94f8: 20 4e ba  
            ldy $e7            ; $94fb: a4 e7     
            lda ($01),y        ; $94fd: b1 01     
            cmp #$40           ; $94ff: c9 40     
            beq __950c         ; $9501: f0 09     
            jsr __950c         ; $9503: 20 0c 95  
            sta $e6            ; $9506: 85 e6     
            dec $03            ; $9508: c6 03     
            bne __94f8         ; $950a: d0 ec     
__950c:     lda $32            ; $950c: a5 32     
            sec                ; $950e: 38        
            sbc #$10           ; $950f: e9 10     
            sta $32            ; $9511: 85 32     
            rts                ; $9513: 60        

;-------------------------------------------------------------------------------
            lda $28            ; $9514: a5 28     
            clc                ; $9516: 18        
            adc #$08           ; $9517: 69 08     
            and #$f0           ; $9519: 29 f0     
            eor #$f0           ; $951b: 49 f0     
            sta $28            ; $951d: 85 28     
            lsr                ; $951f: 4a        
            lsr                ; $9520: 4a        
            lsr                ; $9521: 4a        
            lsr                ; $9522: 4a        
            sta $e5            ; $9523: 85 e5     
            lda #$e0           ; $9525: a9 e0     
            sta $32            ; $9527: 85 32     
            sta $e6            ; $9529: 85 e6     
            lda $0533          ; $952b: ad 33 05  
            sta $e8            ; $952e: 85 e8     
            lda #$0d           ; $9530: a9 0d     
            sta $03            ; $9532: 85 03     
__9534:     jsr __ba4e         ; $9534: 20 4e ba  
            ldy $e7            ; $9537: a4 e7     
            lda ($01),y        ; $9539: b1 01     
            ldy #$05           ; $953b: a0 05     
__953d:     cmp __9249,y       ; $953d: d9 49 92  
            beq __9554         ; $9540: f0 12     
            dey                ; $9542: 88        
            bne __953d         ; $9543: d0 f8     
            dec $03            ; $9545: c6 03     
            beq __9551         ; $9547: f0 08     
            jsr __950c         ; $9549: 20 0c 95  
            sta $e6            ; $954c: 85 e6     
            jmp __9534         ; $954e: 4c 34 95  

;-------------------------------------------------------------------------------
__9551:     jsr __9561         ; $9551: 20 61 95  
__9554:     jsr __950c         ; $9554: 20 0c 95  
            lda #$00           ; $9557: a9 00     
            sta $041b          ; $9559: 8d 1b 04  
            rts                ; $955c: 60        

;-------------------------------------------------------------------------------
            lda #$00           ; $955d: a9 00     
            sta $32            ; $955f: 85 32     
__9561:     lda #$01           ; $9561: a9 01     
            sta $99            ; $9563: 85 99     
            lda #$78           ; $9565: a9 78     
            sta $28            ; $9567: 85 28     
            rts                ; $9569: 60        

;-------------------------------------------------------------------------------
            lda $28            ; $956a: a5 28     
            clc                ; $956c: 18        
            adc #$08           ; $956d: 69 08     
            and #$f0           ; $956f: 29 f0     
            eor #$f0           ; $9571: 49 f0     
            sta $28            ; $9573: 85 28     
            lda $042b          ; $9575: ad 2b 04  
            clc                ; $9578: 18        
            adc #$08           ; $9579: 69 08     
            and #$f0           ; $957b: 29 f0     
            eor #$10           ; $957d: 49 10     
            sta $32            ; $957f: 85 32     
            cmp #$f0           ; $9581: c9 f0     
            beq __9587         ; $9583: f0 02     
            dec $1e            ; $9585: c6 1e     
__9587:     lda #$0a           ; $9587: a9 0a     
            sta $c7            ; $9589: 85 c7     
__958b:     rts                ; $958b: 60        

;-------------------------------------------------------------------------------
            lda $0428          ; $958c: ad 28 04  
            sec                ; $958f: 38        
            sbc $ba            ; $9590: e5 ba     
            eor #$ff           ; $9592: 49 ff     
            clc                ; $9594: 18        
            adc #$f1           ; $9595: 69 f1     
            sta $28            ; $9597: 85 28     
__9599:     lda $042b          ; $9599: ad 2b 04  
            sta $32            ; $959c: 85 32     
            dec $041b          ; $959e: ce 1b 04  
            lda #$60           ; $95a1: a9 60     
            sta $04b7          ; $95a3: 8d b7 04  
            rts                ; $95a6: 60        

;-------------------------------------------------------------------------------
            jsr __9561         ; $95a7: 20 61 95  
__95aa:     lda #$60           ; $95aa: a9 60     
            sta $32            ; $95ac: 85 32     
            rts                ; $95ae: 60        

;-------------------------------------------------------------------------------
__95af:     .hex c0            ; $95af: c0        Suspected data
__95b0:     brk                ; $95b0: 00        
            bmi __95c2         ; $95b1: 30 0f     
            pha                ; $95b3: 48        
            tya                ; $95b4: 98        
            asl                ; $95b5: 0a        
            asl                ; $95b6: 0a        
            asl                ; $95b7: 0a        
            asl                ; $95b8: 0a        
            sta $0f            ; $95b9: 85 0f     
__95bb:     pla                ; $95bb: 68        
            sec                ; $95bc: 38        
            sbc $0f            ; $95bd: e5 0f     
            bcs __95c2         ; $95bf: b0 01     
            dey                ; $95c1: 88        
__95c2:     rts                ; $95c2: 60        

;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $95c3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95c6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $95c9: ff        Suspected data
__95ca:     .hex ff ff ff      ; $95ca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $95cd: ff        Suspected data
__95ce:     .hex ff ff         ; $95ce: ff ff     Suspected data
__95d0:     .hex ff ff ff      ; $95d0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95d3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95d6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95d9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95dc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95df: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95e2: ff ff ff  Invalid Opcode - ISC Array,x
__95e5:     .hex ff ff ff      ; $95e5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95e8: ff ff ff  Invalid Opcode - ISC Array,x
__95eb:     .hex ff ff ff      ; $95eb: ff ff ff  Invalid Opcode - ISC Array,x
__95ee:     .hex ff ff ff      ; $95ee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95f1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95f4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95f7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95fa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $95fd: ff ff ff  Invalid Opcode - ISC Array,x
__9600:     .hex 01            ; $9600: 01        Suspected data
__9601:     .hex 03 1f         ; $9601: 03 1f     Invalid Opcode - SLO ($1f,x)
            .hex 96            ; $9603: 96        Suspected data
__9604:     lda #$1e           ; $9604: a9 1e     
            .hex 85            ; $9606: 85        Suspected data
__9607:     .hex fe            ; $9607: fe        Suspected data
__9608:     lda $11            ; $9608: a5 11     
            asl                ; $960a: 0a        
            tax                ; $960b: aa        
            lda __9600,x       ; $960c: bd 00 96  
__960f:     sta $f0            ; $960f: 85 f0     
            lda __9601,x       ; $9611: bd 01 96  
            sta $f1            ; $9614: 85 f1     
            lda #$00           ; $9616: a9 00     
            sta $eb            ; $9618: 85 eb     
__961a:     lda $eb            ; $961a: a5 eb     
            bpl __961a         ; $961c: 10 fc     
            rts                ; $961e: 60        

;-------------------------------------------------------------------------------
            jsr __de00         ; $961f: 20 00 de  
            sbc $0120,x        ; $9622: fd 20 01  
            dec $20fd,x        ; $9625: de fd 20  
            .hex 02            ; $9628: 02        Invalid Opcode - KIL 
            dec $20fd,x        ; $9629: de fd 20  
            .hex 03 de         ; $962c: 03 de     Invalid Opcode - SLO ($de,x)
            sbc $1c20,x        ; $962e: fd 20 1c  
            dec $20fd,x        ; $9631: de fd 20  
            ora __fdde,x       ; $9634: 1d de fd  
            jsr __de1e         ; $9637: 20 1e de  
            sbc $1f20,x        ; $963a: fd 20 1f  
            dec $20fd,x        ; $963d: de fd 20  
            .hex 03 5d         ; $9640: 03 5d     Invalid Opcode - SLO ($5d,x)
            sbc $2320,x        ; $9642: fd 20 23  
            eor $20fd,x        ; $9645: 5d fd 20  
            .hex 43 5d         ; $9648: 43 5d     Invalid Opcode - SRE ($5d,x)
            sbc $6320,x        ; $964a: fd 20 63  
            eor $23fd,x        ; $964d: 5d fd 23  
            .hex 63 5d         ; $9650: 63 5d     Invalid Opcode - RRA ($5d,x)
            sbc __8323,x       ; $9652: fd 23 83  
            eor $23fd,x        ; $9655: 5d fd 23  
            .hex a3 5d         ; $9658: a3 5d     Invalid Opcode - LAX ($5d,x)
            sbc $6820,x        ; $965a: fd 20 68  
            bpl __96a7         ; $965d: 10 48     
            lsr                ; $965f: 4a        
            jmp $504e          ; $9660: 4c 4e 50  

;-------------------------------------------------------------------------------
            eor ($52),y        ; $9663: 51 52     
            .hex 53 54         ; $9665: 53 54     Invalid Opcode - SRE ($54),y
            eor $56,x          ; $9667: 55 56     
            .hex 57 58         ; $9669: 57 58     Invalid Opcode - SRE $58,x
            .hex 5a            ; $966b: 5a        Invalid Opcode - NOP 
            .hex 5c 5e 20      ; $966c: 5c 5e 20  Invalid Opcode - NOP $205e,x
            sty $08            ; $966f: 84 08     
            sbc $2322,x        ; $9671: fd 22 23  
            bit $49            ; $9674: 24 49     
            .hex 4b 4d         ; $9676: 4b 4d     Invalid Opcode - ALR #$4d
            .hex 4f 20 94      ; $9678: 4f 20 94  Invalid Opcode - SRE __9420
            php                ; $967b: 08        
            eor $5d5b,y        ; $967c: 59 5b 5d  
            .hex 5f 2e         ; $967f: 5f 2e     Suspected data
__9681:     .hex 2f 30 fd      ; $9681: 2f 30 fd  Invalid Opcode - RLA __fd30
            jsr $03a4          ; $9684: 20 a4 03  
            and $26            ; $9687: 25 26     
            .hex 27 20         ; $9689: 27 20     Invalid Opcode - RLA $20
            lda $3103,y        ; $968b: b9 03 31  
__968e:     .hex 32            ; $968e: 32        Invalid Opcode - KIL 
            .hex 33 20         ; $968f: 33 20     Invalid Opcode - RLA ($20),y
            .hex c4            ; $9691: c4        Suspected data
__9692:     .hex 03 28         ; $9692: 03 28     Invalid Opcode - SLO ($28,x)
            and #$2a           ; $9694: 29 2a     
            jsr $03d9          ; $9696: 20 d9 03  
            .hex 34 35         ; $9699: 34 35     Invalid Opcode - NOP $35,x
            rol $20,x          ; $969b: 36 20     
            .hex e3 03         ; $969d: e3 03     Invalid Opcode - ISC ($03,x)
            .hex 2b 2c         ; $969f: 2b 2c     Invalid Opcode - ANC #$2c
            and __fa20         ; $96a1: 2d 20 fa  
            .hex 03 37         ; $96a4: 03 37     Invalid Opcode - SLO ($37,x)
            sec                ; $96a6: 38        
__96a7:     and $0321,y        ; $96a7: 39 21 03  
            .hex 02            ; $96aa: 02        Invalid Opcode - KIL 
            .hex 3a            ; $96ab: 3a        Invalid Opcode - NOP 
            .hex 3b            ; $96ac: 3b        Suspected data
__96ad:     and ($1b,x)        ; $96ad: 21 1b     
            .hex 02            ; $96af: 02        Invalid Opcode - KIL 
            rti                ; $96b0: 40        

;-------------------------------------------------------------------------------
            eor ($21,x)        ; $96b1: 41 21     
            .hex 23 c6         ; $96b3: 23 c6     Invalid Opcode - RLA ($c6,x)
            .hex 3c 21 3c      ; $96b5: 3c 21 3c  Invalid Opcode - NOP $3c21,x
            dec $42            ; $96b8: c6 42     
            and ($e3,x)        ; $96ba: 21 e3     
            ora ($3d,x)        ; $96bc: 01 3d     
            and ($fc,x)        ; $96be: 21 fc     
            ora ($60,x)        ; $96c0: 01 60     
            .hex 22            ; $96c2: 22        Invalid Opcode - KIL 
            .hex 02            ; $96c3: 02        Invalid Opcode - KIL 
            .hex 02            ; $96c4: 02        Invalid Opcode - KIL 
            rol $223f,x        ; $96c5: 3e 3f 22  
            .hex 1c 02 61      ; $96c8: 1c 02 61  Invalid Opcode - NOP $6102,x
            .hex 62            ; $96cb: 62        Invalid Opcode - KIL 
            .hex 22            ; $96cc: 22        Invalid Opcode - KIL 
            .hex 22            ; $96cd: 22        Invalid Opcode - KIL 
            .hex 02            ; $96ce: 02        Invalid Opcode - KIL 
            .hex 43 44         ; $96cf: 43 44     Invalid Opcode - SRE ($44,x)
            .hex 22            ; $96d1: 22        Invalid Opcode - KIL 
            .hex 3c 02 63      ; $96d2: 3c 02 63  Invalid Opcode - NOP $6302,x
            .hex 64 22         ; $96d5: 64 22     Invalid Opcode - NOP $22
            .hex 43 01         ; $96d7: 43 01     Invalid Opcode - SRE ($01,x)
            eor $22            ; $96d9: 45 22     
            .hex 5c 01 65      ; $96db: 5c 01 65  Invalid Opcode - NOP $6501,x
            .hex 22            ; $96de: 22        Invalid Opcode - KIL 
            .hex 63 c6         ; $96df: 63 c6     Invalid Opcode - RRA ($c6,x)
            .hex 3c 22 7c      ; $96e1: 3c 22 7c  Invalid Opcode - NOP $7c22,x
            cpy $42            ; $96e4: c4 42     
            .hex 22            ; $96e6: 22        Invalid Opcode - KIL 
            cpy $02            ; $96e7: c4 02     
            ldx $a8            ; $96e9: a6 a8     
            .hex 22            ; $96eb: 22        Invalid Opcode - KIL 
            cpx $02            ; $96ec: e4 02     
            .hex a7 a9         ; $96ee: a7 a9     Invalid Opcode - LAX $a9
            .hex 22            ; $96f0: 22        Invalid Opcode - KIL 
            .hex fa            ; $96f1: fa        Invalid Opcode - NOP 
            .hex 04 80         ; $96f2: 04 80     Invalid Opcode - NOP $80
            .hex 82 88         ; $96f4: 82 88     Invalid Opcode - NOP #$88
            txa                ; $96f6: 8a        
            .hex 23 04         ; $96f7: 23 04     Invalid Opcode - RLA ($04,x)
            .hex 02            ; $96f9: 02        Invalid Opcode - KIL 
            bcc __968e         ; $96fa: 90 92     
            .hex 23 14         ; $96fc: 23 14     Invalid Opcode - RLA ($14,x)
            .hex 02            ; $96fe: 02        Invalid Opcode - KIL 
            .hex 9e a0 23      ; $96ff: 9e a0 23  Invalid Opcode - SHX $23a0,y
            .hex 1a            ; $9702: 1a        Invalid Opcode - NOP 
            .hex 04 81         ; $9703: 04 81     Invalid Opcode - NOP $81
            .hex 83 89         ; $9705: 83 89     Invalid Opcode - SAX ($89,x)
            .hex 8b 23         ; $9707: 8b 23     Invalid Opcode - XAA #$23
            .hex 23 03         ; $9709: 23 03     Invalid Opcode - RLA ($03,x)
            lsr $91            ; $970b: 46 91     
            .hex 93 23         ; $970d: 93 23     Invalid Opcode - AHX ($23),y
            rol                ; $970f: 2a        
            .hex 02            ; $9710: 02        Invalid Opcode - KIL 
            ldx #$a4           ; $9711: a2 a4     
            .hex 23 2e         ; $9713: 23 2e     Invalid Opcode - RLA ($2e,x)
            .hex 0b 67         ; $9715: 0b 67     Invalid Opcode - ANC #$67
            jmp ($706e)        ; $9717: 6c 6e 70  

;-------------------------------------------------------------------------------
            .hex 72            ; $971a: 72        Invalid Opcode - KIL 
            adc #$9f           ; $971b: 69 9f     
            lda ($75,x)        ; $971d: a1 75     
            tya                ; $971f: 98        
            txs                ; $9720: 9a        
            .hex 23 3a         ; $9721: 23 3a     Invalid Opcode - RLA ($3a,x)
            .hex 04 84         ; $9723: 04 84     Invalid Opcode - NOP $84
            stx $8c            ; $9725: 86 8c     
            stx $4323          ; $9727: 8e 23 43  
            .hex 1b 47 94      ; $972a: 1b 47 94  Invalid Opcode - SLO __9447,y
            stx $74,y          ; $972d: 96 74     
            .hex 74 74         ; $972f: 74 74     Invalid Opcode - NOP $74,x
            .hex 74 a3         ; $9731: 74 a3     Invalid Opcode - NOP $a3,x
            lda $74            ; $9733: a5 74     
            ror $68            ; $9735: 66 68     
            adc $716f          ; $9737: 6d 6f 71  
            .hex 73 6a         ; $973a: 73 6a     Invalid Opcode - RRA ($6a),y
            .hex 6b 74         ; $973c: 6b 74     Invalid Opcode - ARR #$74
            .hex 74 99         ; $973e: 74 99     Invalid Opcode - NOP $99,x
            .hex 9b            ; $9740: 9b        Invalid Opcode - TAS 
            .hex 74 85         ; $9741: 74 85     Invalid Opcode - NOP $85,x
            .hex 87 8d         ; $9743: 87 8d     Invalid Opcode - SAX $8d
            .hex 8f 23 64      ; $9745: 8f 23 64  Invalid Opcode - SAX $6423
            ora $95            ; $9748: 05 95     
            .hex 97 fd         ; $974a: 97 fd     Invalid Opcode - SAX $fd,y
            tax                ; $974c: aa        
            .hex ab 23         ; $974d: ab 23     Invalid Opcode - LAX #$23
            .hex 77 04         ; $974f: 77 04     Invalid Opcode - RRA $04,x
            .hex 9c 9d aa      ; $9751: 9c 9d aa  Invalid Opcode - SHY __aa9d,x
            .hex ab 23         ; $9754: ab 23     Invalid Opcode - LAX #$23
            .hex 89 02         ; $9756: 89 02     Invalid Opcode - NOP #$02
            tax                ; $9758: aa        
            .hex ab 20         ; $9759: ab 20     Invalid Opcode - LAX #$20
            .hex cb 0a         ; $975b: cb 0a     Invalid Opcode - AXS #$0a
            brk                ; $975d: 00        
            ora ($08,x)        ; $975e: 01 08     
            php                ; $9760: 08        
            .hex fc 01 fc      ; $9761: fc 01 fc  Invalid Opcode - NOP __fc01,x
            php                ; $9764: 08        
            .hex fc 01 20      ; $9765: fc 01 20  Invalid Opcode - NOP $2001,x
            .hex eb 0a         ; $9768: eb 0a     Invalid Opcode - SBC #$0a
            .hex 02            ; $976a: 02        Invalid Opcode - KIL 
            .hex 03 08         ; $976b: 03 08     Invalid Opcode - SLO ($08,x)
__976d:     php                ; $976d: 08        
            asl                ; $976e: 0a        
            ora $0b            ; $976f: 05 0b     
            .hex 0c 0a 0d      ; $9771: 0c 0a 0d  Invalid Opcode - NOP $0d0a
            and ($0b,x)        ; $9774: 21 0b     
            asl                ; $9776: 0a        
            .hex 04 05         ; $9777: 04 05     Invalid Opcode - NOP $05
            .hex 04 05         ; $9779: 04 05     Invalid Opcode - NOP $05
            asl __fc07         ; $977b: 0e 07 fc  
            php                ; $977e: 08        
            asl $2108          ; $977f: 0e 08 21  
            .hex 2b 05         ; $9782: 2b 05     Invalid Opcode - ANC #$05
            asl $07            ; $9784: 06 07     
            asl $07            ; $9786: 06 07     
            ora #$21           ; $9788: 09 21     
            and ($04),y        ; $978a: 31 04     
            ror $09,x          ; $978c: 76 09     
            ora #$09           ; $978e: 09 09     
            and ($38,x)        ; $9790: 21 38     
            .hex 02            ; $9792: 02        Invalid Opcode - KIL 
            sbc $21fa,y        ; $9793: f9 fa 21  
            lsr $0a            ; $9796: 46 0a     
            brk                ; $9798: 00        
            .hex 0f 01 00      ; $9799: 0f 01 00  Bad Addr Mode - SLO $0001
            ora ($fc,x)        ; $979c: 01 fc     
            ora ($08,x)        ; $979e: 01 08     
            brk                ; $97a0: 00        
            ora ($21,x)        ; $97a1: 01 21     
            ror $0a            ; $97a3: 66 0a     
            bpl __97b7         ; $97a5: 10 10     
            php                ; $97a7: 08        
            bpl __97b2         ; $97a8: 10 08     
            bpl __97b4         ; $97aa: 10 08     
            php                ; $97ac: 08        
            bpl __97b7         ; $97ad: 10 08     
            and ($86,x)        ; $97af: 21 86     
            asl                ; $97b1: 0a        
__97b2:     php                ; $97b2: 08        
            php                ; $97b3: 08        
__97b4:     php                ; $97b4: 08        
            php                ; $97b5: 08        
            php                ; $97b6: 08        
__97b7:     .hex 13 0d         ; $97b7: 13 0d     Invalid Opcode - SLO ($0d),y
            php                ; $97b9: 08        
            php                ; $97ba: 08        
            php                ; $97bb: 08        
            and ($a6,x)        ; $97bc: 21 a6     
            asl                ; $97be: 0a        
            php                ; $97bf: 08        
            php                ; $97c0: 08        
            php                ; $97c1: 08        
            .hex fc 08 0e      ; $97c2: fc 08 0e  Invalid Opcode - NOP $0e08,x
            php                ; $97c5: 08        
            php                ; $97c6: 08        
            php                ; $97c7: 08        
            php                ; $97c8: 08        
            and ($c6,x)        ; $97c9: 21 c6     
            asl                ; $97cb: 0a        
            php                ; $97cc: 08        
            php                ; $97cd: 08        
            php                ; $97ce: 08        
            bpl __97d9         ; $97cf: 10 08     
            php                ; $97d1: 08        
            php                ; $97d2: 08        
            php                ; $97d3: 08        
            .hex 04 05         ; $97d4: 04 05     Invalid Opcode - NOP $05
            and ($e6,x)        ; $97d6: 21 e6     
            asl                ; $97d8: 0a        
__97d9:     ora #$09           ; $97d9: 09 09     
            ora #$09           ; $97db: 09 09     
            ora #$09           ; $97dd: 09 09     
            ora #$09           ; $97df: 09 09     
            asl $07            ; $97e1: 06 07     
            and ($51,x)        ; $97e3: 21 51     
            php                ; $97e5: 08        
            .hex fc 01 fc      ; $97e6: fc 01 fc  Invalid Opcode - NOP __fc01,x
            ora ($00,x)        ; $97e9: 01 00     
            ora ($00,x)        ; $97eb: 01 00     
            ora ($21,x)        ; $97ed: 01 21     
            adc ($08),y        ; $97ef: 71 08     
            bpl __97fb         ; $97f1: 10 08     
            bpl __97fd         ; $97f3: 10 08     
            bpl __97ff         ; $97f5: 10 08     
            bpl __9801         ; $97f7: 10 08     
            and ($91,x)        ; $97f9: 21 91     
__97fb:     php                ; $97fb: 08        
            .hex 13            ; $97fc: 13        Suspected data
__97fd:     .hex 0d 13         ; $97fd: 0d 13     Suspected data
__97ff:     .hex 0d            ; $97ff: 0d        Suspected data
__9800:     php                ; $9800: 08        
__9801:     php                ; $9801: 08        
            .hex 77 03         ; $9802: 77 03     Invalid Opcode - RRA $03,x
            and ($b1,x)        ; $9804: 21 b1     
            php                ; $9806: 08        
            .hex 0e            ; $9807: 0e        Suspected data
__9808:     php                ; $9808: 08        
            asl $0808          ; $9809: 0e 08 08  
__980c:     php                ; $980c: 08        
            .hex 12            ; $980d: 12        Invalid Opcode - KIL 
            php                ; $980e: 08        
            and ($d1,x)        ; $980f: 21 d1     
            ora #$13           ; $9811: 09 13     
            ora $08            ; $9813: 05 08     
            php                ; $9815: 08        
            .hex 04 05         ; $9816: 04 05     Invalid Opcode - NOP $05
            .hex 04 05         ; $9818: 04 05     Invalid Opcode - NOP $05
            php                ; $981a: 08        
            and ($f1,x)        ; $981b: 21 f1     
            ora #$11           ; $981d: 09 11     
            .hex 07 09         ; $981f: 07 09     Invalid Opcode - SLO $09
            ora #$06           ; $9821: 09 06     
            .hex 07 06         ; $9823: 07 06     Invalid Opcode - SLO $06
            .hex 07 09         ; $9825: 07 09     Invalid Opcode - SLO $09
            .hex 22            ; $9827: 22        Invalid Opcode - KIL 
            asl $1404          ; $9828: 0e 04 14  
            ora $16,x          ; $982b: 15 16     
            .hex 17 22         ; $982d: 17 22     Invalid Opcode - SLO $22,x
            rol $1804          ; $982f: 2e 04 18  
            ora $1b1a,y        ; $9832: 19 1a 1b  
            .hex 22            ; $9835: 22        Invalid Opcode - KIL 
            lsr $1c04          ; $9836: 4e 04 1c  
            ora $1f1e,x        ; $9839: 1d 1e 1f  
            .hex 22            ; $983c: 22        Invalid Opcode - KIL 
            ror __fc04         ; $983d: 6e 04 fc  
            .hex fc fc 20      ; $9840: fc fc 20  Invalid Opcode - NOP $20fc,x
            .hex 22            ; $9843: 22        Invalid Opcode - KIL 
            stx $7604          ; $9844: 8e 04 76  
            .hex 76            ; $9847: 76        Suspected data
__9848:     ror $21,x          ; $9848: 76 21     
            .hex 22            ; $984a: 22        Invalid Opcode - KIL 
            sbc #$05           ; $984b: e9 05     
            sed                ; $984d: f8        
            cmp ($d9),y        ; $984e: d1 d9     
            cmp $22d9,y        ; $9850: d9 d9 22  
            .hex ef 08 ac      ; $9853: ef 08 ac  Invalid Opcode - ISC __ac08
            lda __afae         ; $9856: ad ae af  
            bcs __980c         ; $9859: b0 b1     
            .hex b2            ; $985b: b2        Invalid Opcode - KIL 
            .hex b3 23         ; $985c: b3 23     Invalid Opcode - LAX ($23),y
            dex                ; $985e: ca        
            .hex 04 80         ; $985f: 04 80     Invalid Opcode - NOP $80
            ldy #$a0           ; $9861: a0 a0     
            jsr __d123         ; $9863: 20 23 d1  
            asl __a880         ; $9866: 0e 80 a8  
            tax                ; $9869: aa        
            tax                ; $986a: aa        
            ldx #$22           ; $986b: a2 22     
            brk                ; $986d: 00        
            brk                ; $986e: 00        
            dey                ; $986f: 88        
            tax                ; $9870: aa        
            tax                ; $9871: aa        
            tax                ; $9872: aa        
            tax                ; $9873: aa        
            .hex 22            ; $9874: 22        Invalid Opcode - KIL 
            .hex 23 e3         ; $9875: 23 e3     Invalid Opcode - RLA ($e3,x)
            .hex 02            ; $9877: 02        Invalid Opcode - KIL 
            dey                ; $9878: 88        
            .hex 22            ; $9879: 22        Invalid Opcode - KIL 
            .hex 23 ea         ; $987a: 23 ea     Invalid Opcode - RLA ($ea,x)
            .hex 04 f0         ; $987c: 04 f0     Invalid Opcode - NOP $f0
            sed                ; $987e: f8        
            .hex f2            ; $987f: f2        Invalid Opcode - KIL 
            beq __9882         ; $9880: f0 00     
__9882:     .hex 1a            ; $9882: 1a        Invalid Opcode - NOP 
            bmi __989b         ; $9883: 30 16     
            .hex 07 1a         ; $9885: 07 1a     Invalid Opcode - SLO $1a
            bmi __98ba         ; $9887: 30 31     
            .hex 0f 1a 30      ; $9889: 0f 1a 30  Invalid Opcode - SLO $301a
            .hex 0f 0f 1a      ; $988c: 0f 0f 1a  Invalid Opcode - SLO $1a0f
            bmi __98a0         ; $988f: 30 0f     
            .hex 0f 1a 30      ; $9891: 0f 1a 30  Invalid Opcode - SLO $301a
            plp                ; $9894: 28        
            .hex 0f 1a         ; $9895: 0f 1a     Suspected data
__9897:     bmi __98be         ; $9897: 30 25     
            .hex 0f 1a         ; $9899: 0f 1a     Suspected data
__989b:     bmi __98af         ; $989b: 30 12     
            .hex 0f 1a 30      ; $989d: 0f 1a 30  Invalid Opcode - SLO $301a
__98a0:     .hex 23 0f         ; $98a0: 23 0f     Invalid Opcode - RLA ($0f,x)
__98a2:     cpx __e8ed         ; $98a2: ec ed e8  
            .hex eb            ; $98a5: eb        Suspected data
__98a6:     .hex f2            ; $98a6: f2        Invalid Opcode - KIL 
__98a7:     tya                ; $98a7: 98        
            tya                ; $98a8: 98        
            tya                ; $98a9: 98        
            .hex 99 99         ; $98aa: 99 99     Suspected data
__98ac:     sta __9999,y       ; $98ac: 99 99 99  
__98af:     sta __9999,y       ; $98af: 99 99 99  
            sta __9999,y       ; $98b2: 99 99 99  
            sta __9999,y       ; $98b5: 99 99 99  
__98b8:     cmp #$dd           ; $98b8: c9 dd     
__98ba:     sbc ($05),y        ; $98ba: f1 05     
            .hex 19 2d         ; $98bc: 19 2d     Suspected data
__98be:     eor ($55,x)        ; $98be: 41 55     
            eor $69,x          ; $98c0: 55 69     
            .hex 7d 91         ; $98c2: 7d 91     Suspected data
__98c4:     lda $b9            ; $98c4: a5 b9     
            cmp __f5e1         ; $98c6: cd e1 f5  
            beq __98ac         ; $98c9: f0 e1     
            .hex de e7         ; $98cb: de e7     Suspected data
__98cd:     .hex fb fb e6      ; $98cd: fb fb e6  Invalid Opcode - ISC __e6fb,y
            .hex da            ; $98d0: da        Invalid Opcode - NOP 
            .hex eb e2         ; $98d1: eb e2     Invalid Opcode - SBC #$e2
            inx                ; $98d3: e8        
            .hex fb e8         ; $98d4: fb e8     Suspected data
__98d6:     sbc #$de           ; $98d6: e9 de     
            .hex e7 de         ; $98d8: e7 de     Invalid Opcode - ISC $de
            cmp __dafb,x       ; $98da: dd fb da  
            cmp __e8e8,x       ; $98dd: dd e8 e8  
            .hex eb fb         ; $98e0: eb fb     Invalid Opcode - SBC #$fb
            .hex da            ; $98e2: da        Invalid Opcode - NOP 
            .hex df ed de      ; $98e3: df ed de  Invalid Opcode - DCP __deed,x
            .hex eb fb         ; $98e6: eb fb     Invalid Opcode - SBC #$fb
            .hex fb dc e5      ; $98e8: fb dc e5  Invalid Opcode - ISC __e5dc,y
            .hex e2 e6         ; $98eb: e2 e6     Invalid Opcode - NOP #$e6
            .hex db e2 e7      ; $98ed: db e2 e7  Invalid Opcode - DCP __e7e2,y
            cpx #$da           ; $98f0: e0 da     
            .hex fb e5 e8      ; $98f2: fb e5 e8  Invalid Opcode - ISC __e8e5,y
            .hex e7 e0         ; $98f5: e7 e0     Invalid Opcode - ISC $e0
            .hex fb ec ed      ; $98f7: fb ec ed  Invalid Opcode - ISC __edec,y
            .hex da            ; $98fa: da        Invalid Opcode - NOP 
            .hex e2 eb         ; $98fb: e2 eb     Invalid Opcode - NOP #$eb
            .hex fb            ; $98fd: fb        Suspected data
__98fe:     .hex e2 e7         ; $98fe: e2 e7     Invalid Opcode - NOP #$e7
__9900:     .hex fb fb e1      ; $9900: fb fb e1  Invalid Opcode - ISC __e1fb,y
            .hex e2 ec         ; $9903: e2 ec     Invalid Opcode - NOP #$ec
__9905:     cmp __deeb,x       ; $9905: dd eb de  
            .hex da            ; $9908: da        Invalid Opcode - NOP 
            inc $f7            ; $9909: e6 f7     
            .hex fb da e7      ; $990b: fb da e7  Invalid Opcode - ISC __e7da,y
            inx                ; $990e: e8        
            sbc __dee1         ; $990f: ed e1 de  
            .hex eb fb         ; $9912: eb fb     Invalid Opcode - SBC #$fb
            beq __98fe         ; $9914: f0 e8     
            .hex eb e5         ; $9916: eb e5     Invalid Opcode - SBC #$e5
            cmp __e9ec,x       ; $9918: dd ec e9  
            .hex eb de         ; $991b: eb de     Invalid Opcode - SBC #$de
            .hex da            ; $991d: da        Invalid Opcode - NOP 
            cmp __fbfb,x       ; $991e: dd fb fb  
__9921:     .hex fb db de      ; $9921: fb db de  Invalid Opcode - ISC __dedb,y
            .hex df e8 eb      ; $9924: df e8 eb  Invalid Opcode - DCP __ebe8,x
            dec __fbfb,x       ; $9927: de fb fb  
            sbc ($e2,x)        ; $992a: e1 e2     
            inc $da            ; $992c: e6 da     
            .hex e7 dd         ; $992e: e7 dd     Invalid Opcode - ISC $dd
            .hex fb e1 de      ; $9930: fb e1 de  Invalid Opcode - ISC __dee1,y
            .hex fb e1         ; $9933: fb e1     Suspected data
__9935:     .hex de da         ; $9935: de da     Suspected data
__9937:     .hex eb dd         ; $9937: eb dd     Invalid Opcode - SBC #$dd
            .hex fb da fb      ; $9939: fb da fb  Invalid Opcode - ISC __fbda,y
            .hex ef e8 e2      ; $993c: ef e8 e2  Invalid Opcode - ISC __e2e8
            .hex dc de dc      ; $993f: dc de dc  Invalid Opcode - NOP __dcde,x
            .hex da            ; $9942: da        Invalid Opcode - NOP 
            sbc $e5            ; $9943: e5 e5     
            .hex fb df e8      ; $9945: fb df e8  Invalid Opcode - ISC __e8df,y
            .hex eb fb         ; $9948: eb fb     Invalid Opcode - SBC #$fb
            sbc ($de,x)        ; $994a: e1 de     
            sbc $e9            ; $994c: e5 e9     
            .hex fb ed e8      ; $994e: fb ed e8  Invalid Opcode - ISC __e8ed,y
            .hex fb fb db      ; $9951: fb fb db  Invalid Opcode - ISC __dbfb,y
            dec __dffb,x       ; $9954: de fb df  
            .hex eb de         ; $9957: eb de     Invalid Opcode - SBC #$de
            dec __fbdd,x       ; $9959: de dd fb  
            .hex fb df eb      ; $995c: fb df eb  Invalid Opcode - ISC __ebdf,y
            inx                ; $995f: e8        
            inc $fb            ; $9960: e6 fb     
            .hex da            ; $9962: da        Invalid Opcode - NOP 
            .hex fb ec e9      ; $9963: fb ec e9  Invalid Opcode - ISC __e9ec,y
            dec __e5e5,x       ; $9966: de e5 e5  
            .hex da            ; $9969: da        Invalid Opcode - NOP 
            .hex df ed de      ; $996a: df ed de  Invalid Opcode - DCP __deed,x
            .hex eb fb         ; $996d: eb fb     Invalid Opcode - SBC #$fb
            .hex fb da f0      ; $996f: fb da f0  Invalid Opcode - ISC __f0da,y
            .hex da            ; $9972: da        Invalid Opcode - NOP 
            .hex e4            ; $9973: e4        Suspected data
__9974:     dec __e2e7,x       ; $9974: de e7 e2  
            .hex e7 e0         ; $9977: e7 e0     Invalid Opcode - ISC $e0
            .hex f7            ; $9979: f7        Suspected data
__997a:     .hex fb fb fb      ; $997a: fb fb fb  Invalid Opcode - ISC __fbfb,y
            inc $da            ; $997d: e6 da     
            .hex eb e2         ; $997f: eb e2     Invalid Opcode - SBC #$e2
            inx                ; $9981: e8        
            .hex fb fb f0      ; $9982: fb fb f0  Invalid Opcode - ISC __f0fb,y
            dec __ede7,x       ; $9985: de e7 ed  
            .hex fb ed e8      ; $9988: fb ed e8  Invalid Opcode - ISC __e8ed,y
            .hex fb fb da      ; $998b: fb fb da  Invalid Opcode - ISC __dafb,y
            .hex fb fb fb      ; $998e: fb fb fb  Invalid Opcode - ISC __fbfb,y
            .hex dc da ef      ; $9991: dc da ef  Invalid Opcode - NOP __efda,x
            dec __fbfb,x       ; $9994: de fb fb  
            .hex e7            ; $9997: e7        Suspected data
__9998:     .hex de            ; $9998: de        Suspected data
__9999:     .hex da            ; $9999: da        Invalid Opcode - NOP 
            .hex eb db         ; $999a: eb db     Invalid Opcode - SBC #$db
            .hex f2            ; $999c: f2        Invalid Opcode - KIL 
            .hex fb da e7      ; $999d: fb da e7  Invalid Opcode - ISC __e7da,y
            cmp __fbfb,x       ; $99a0: dd fb fb  
            sbc __e1e8         ; $99a3: ed e8 e1  
            .hex e2 ec         ; $99a6: e2 ec     Invalid Opcode - NOP #$ec
            .hex fb fb ec      ; $99a8: fb fb ec  Invalid Opcode - ISC __ecfb,y
            inc __e9eb         ; $99ab: ee eb e9  
            .hex eb e2         ; $99ae: eb e2     Invalid Opcode - SBC #$e2
__99b0:     cpx __fbde         ; $99b0: ec de fb  
            .hex e1            ; $99b3: e1        Suspected data
__99b4:     .hex de            ; $99b4: de        Suspected data
__99b5:     .hex fb ec da      ; $99b5: fb ec da  Invalid Opcode - ISC __daec,y
            beq __9998         ; $99b8: f0 de     
            sbc ($da),y        ; $99ba: f1 da     
            .hex dc ed e5      ; $99bc: dc ed e5  Invalid Opcode - NOP __e5ed,x
            .hex f2            ; $99bf: f2        Invalid Opcode - KIL 
            .hex fb fb f0      ; $99c0: fb fb f0  Invalid Opcode - ISC __f0fb,y
            sbc ($da,x)        ; $99c3: e1 da     
            sbc __e1fb         ; $99c5: ed fb e1  
            dec __ecfb,x       ; $99c8: de fb ec  
            .hex da            ; $99cb: da        Invalid Opcode - NOP 
            beq __99b0         ; $99cc: f0 e2     
            .hex e7 fb         ; $99ce: e7 fb     Invalid Opcode - ISC $fb
            sbc ($e2,x)        ; $99d0: e1 e2     
            cpx __ddfb         ; $99d2: ec fb dd  
            .hex eb de         ; $99d5: eb de     Invalid Opcode - SBC #$de
            .hex da            ; $99d7: da        Invalid Opcode - NOP 
            inc $f6            ; $99d8: e6 f6     
            inc $f6,x          ; $99da: f6 f6     
            inc $fb,x          ; $99dc: f6 fb     
            .hex fb fb fb      ; $99de: fb fb fb  Invalid Opcode - ISC __fbfb,y
            .hex fb fb fb      ; $99e1: fb fb fb  Invalid Opcode - ISC __fbfb,y
            .hex fb fb fb      ; $99e4: fb fb fb  Invalid Opcode - ISC __fbfb,y
            .hex fb fb fb      ; $99e7: fb fb fb  Invalid Opcode - ISC __fbfb,y
            .hex fb fb fb      ; $99ea: fb fb fb  Invalid Opcode - ISC __fbfb,y
            .hex fb fb fb      ; $99ed: fb fb fb  Invalid Opcode - ISC __fbfb,y
            .hex fb fb fb      ; $99f0: fb fb fb  Invalid Opcode - ISC __fbfb,y
            .hex fb fb fb      ; $99f3: fb fb fb  Invalid Opcode - ISC __fbfb,y
            .hex fb e6 de      ; $99f6: fb e6 de  Invalid Opcode - ISC __dee6,y
            .hex eb eb         ; $99f9: eb eb     Invalid Opcode - SBC #$eb
            .hex f2            ; $99fb: f2        Invalid Opcode - KIL 
            .hex fb dc e1      ; $99fc: fb dc e1  Invalid Opcode - ISC __e1dc,y
            .hex eb e2         ; $99ff: eb e2     Invalid Opcode - SBC #$e2
            cpx __e6ed         ; $9a01: ec ed e6  
            .hex da            ; $9a04: da        Invalid Opcode - NOP 
            cpx __fbf5         ; $9a05: ec f5 fb  
            .hex fb            ; $9a08: fb        Suspected data
__9a09:     .hex 23 cb         ; $9a09: 23 cb     Invalid Opcode - RLA ($cb,x)
            .hex 42            ; $9a0b: 42        Invalid Opcode - KIL 
            .hex ff 23 d1      ; $9a0c: ff 23 d1  Invalid Opcode - ISC __d123,x
            ora ($cc,x)        ; $9a0f: 01 cc     
            .hex 23 d2         ; $9a11: 23 d2     Invalid Opcode - RLA ($d2,x)
            .hex 44 ff         ; $9a13: 44 ff     Invalid Opcode - NOP $ff
            .hex 23 d6         ; $9a15: 23 d6     Invalid Opcode - RLA ($d6,x)
            ora ($33,x)        ; $9a17: 01 33     
            .hex 23 d9         ; $9a19: 23 d9     Invalid Opcode - RLA ($d9,x)
            ora ($cc,x)        ; $9a1b: 01 cc     
            .hex 23 da         ; $9a1d: 23 da     Invalid Opcode - RLA ($da,x)
            .hex 44 ff         ; $9a1f: 44 ff     Invalid Opcode - NOP $ff
__9a21:     .hex 23 de         ; $9a21: 23 de     Invalid Opcode - RLA ($de,x)
            ora ($33,x)        ; $9a23: 01 33     
            .hex 23 e1         ; $9a25: 23 e1     Invalid Opcode - RLA ($e1,x)
            ora ($cc,x)        ; $9a27: 01 cc     
            .hex 23 e2         ; $9a29: 23 e2     Invalid Opcode - RLA ($e2,x)
            .hex 44 ff         ; $9a2b: 44 ff     Invalid Opcode - NOP $ff
            .hex 23 e6         ; $9a2d: 23 e6     Invalid Opcode - RLA ($e6,x)
            ora ($33,x)        ; $9a2f: 01 33     
            .hex 23 ea         ; $9a31: 23 ea     Invalid Opcode - RLA ($ea,x)
            .hex 44 ff         ; $9a33: 44 ff     Invalid Opcode - NOP $ff
            .hex 23 e9         ; $9a35: 23 e9     Invalid Opcode - RLA ($e9,x)
            ora ($cc,x)        ; $9a37: 01 cc     
            .hex 23 ee         ; $9a39: 23 ee     Invalid Opcode - RLA ($ee,x)
            ora ($33,x)        ; $9a3b: 01 33     
            ldy #$07           ; $9a3d: a0 07     
            sty $01            ; $9a3f: 84 01     
            ldy #$00           ; $9a41: a0 00     
            sty $00            ; $9a43: 84 00     
            tya                ; $9a45: 98        
__9a46:     sta ($00),y        ; $9a46: 91 00     
            dey                ; $9a48: 88        
            bne __9a46         ; $9a49: d0 fb     
            dec $01            ; $9a4b: c6 01     
__9a4d:     ldx $01            ; $9a4d: a6 01     
            cpx #$02           ; $9a4f: e0 02     
            bcs __9a46         ; $9a51: b0 f3     
            lda #$00           ; $9a53: a9 00     
            tay                ; $9a55: a8        
__9a56:     sta $0000,y        ; $9a56: 99 00 00  
            iny                ; $9a59: c8        
            bne __9a56         ; $9a5a: d0 fa     
            jsr __fe41         ; $9a5c: 20 41 fe  
            jsr __ec8a         ; $9a5f: 20 8a ec  
            lda $2002          ; $9a62: ad 02 20  
            lda #$3f           ; $9a65: a9 3f     
            ldy #$00           ; $9a67: a0 00     
            sta $2006          ; $9a69: 8d 06 20  
            .hex 8c 06         ; $9a6c: 8c 06     Suspected data
__9a6e:     .hex 20            ; $9a6e: 20        Suspected data
__9a6f:     lda __9882,y       ; $9a6f: b9 82 98  
            sta $2007          ; $9a72: 8d 07 20  
            iny                ; $9a75: c8        
            cpy #$20           ; $9a76: c0 20     
            bcc __9a6f         ; $9a78: 90 f5     
            lda #$01           ; $9a7a: a9 01     
            sta $f0            ; $9a7c: 85 f0     
            lda #$03           ; $9a7e: a9 03     
            sta $f1            ; $9a80: 85 f1     
            lda #$40           ; $9a82: a9 40     
            sta $0100          ; $9a84: 8d 00 01  
            lda #$90           ; $9a87: a9 90     
            sta $ff            ; $9a89: 85 ff     
            sta $2000          ; $9a8b: 8d 00 20  
            jsr __9608         ; $9a8e: 20 08 96  
            lda #$01           ; $9a91: a9 01     
            sta $11            ; $9a93: 85 11     
            jsr __9608         ; $9a95: 20 08 96  
            lda #$80           ; $9a98: a9 80     
            sta $0600          ; $9a9a: 8d 00 06  
            jsr __9604         ; $9a9d: 20 04 96  
            lda #$03           ; $9aa0: a9 03     
            sta $10            ; $9aa2: 85 10     
            lda #$25           ; $9aa4: a9 25     
            sta $02            ; $9aa6: 85 02     
            lda #$20           ; $9aa8: a9 20     
            sta $14            ; $9aaa: 85 14     
            lda #$c7           ; $9aac: a9 c7     
            sta $15            ; $9aae: 85 15     
            lda #$52           ; $9ab0: a9 52     
            sta $16            ; $9ab2: 85 16     
__9ab4:     .hex 20            ; $9ab4: 20        Suspected data
__9ab5:     php                ; $9ab5: 08        
            stx $a5,y          ; $9ab6: 96 a5     
            .hex 17 d0         ; $9ab8: 17 d0     Invalid Opcode - SLO $d0,x
            sec                ; $9aba: 38        
__9abb:     inc $10            ; $9abb: e6 10     
            lda $10            ; $9abd: a5 10     
            and #$0f           ; $9abf: 29 0f     
            beq __9ac6         ; $9ac1: f0 03     
            jmp __9b4d         ; $9ac3: 4c 4d 9b  

;-------------------------------------------------------------------------------
__9ac6:     dec $02            ; $9ac6: c6 02     
            lda $02            ; $9ac8: a5 02     
            cmp #$06           ; $9aca: c9 06     
            bne __9a4d         ; $9acc: d0 7f     
            inc $17            ; $9ace: e6 17     
            lda $14            ; $9ad0: a5 14     
            sta $0301          ; $9ad2: 8d 01 03  
            lda $15            ; $9ad5: a5 15     
__9ad7:     sta $0302          ; $9ad7: 8d 02 03  
            lda $16            ; $9ada: a5 16     
            sta $0303          ; $9adc: 8d 03 03  
            lda #$e6           ; $9adf: a9 e6     
            sta $15            ; $9ae1: 85 15     
            lda #$54           ; $9ae3: a9 54     
            sta $16            ; $9ae5: 85 16     
            lda #$fb           ; $9ae7: a9 fb     
            sta $0304          ; $9ae9: 8d 04 03  
            lda #$00           ; $9aec: a9 00     
            sta $0305          ; $9aee: 8d 05 03  
            .hex f0            ; $9af1: f0        Suspected data
__9af2:     .hex 5a            ; $9af2: 5a        Invalid Opcode - NOP 
            lda $14            ; $9af3: a5 14     
            sta $0301          ; $9af5: 8d 01 03  
            lda $15            ; $9af8: a5 15     
            sta $0302          ; $9afa: 8d 02 03  
            lda $16            ; $9afd: a5 16     
            sta $0303          ; $9aff: 8d 03 03  
            lda #$fb           ; $9b02: a9 fb     
            sta $0304          ; $9b04: 8d 04 03  
            lda #$00           ; $9b07: a9 00     
            sta $0305          ; $9b09: 8d 05 03  
            lda $15            ; $9b0c: a5 15     
            clc                ; $9b0e: 18        
            adc #$20           ; $9b0f: 69 20     
            sta $15            ; $9b11: 85 15     
            lda $14            ; $9b13: a5 14     
            adc #$00           ; $9b15: 69 00     
            sta $14            ; $9b17: 85 14     
            cmp #$23           ; $9b19: c9 23     
__9b1b:     bcc __9b4d         ; $9b1b: 90 30     
            lda #$20           ; $9b1d: a9 20     
            sta $10            ; $9b1f: 85 10     
            ldx #$17           ; $9b21: a2 17     
            ldy #$00           ; $9b23: a0 00     
__9b25:     lda __9a09,y       ; $9b25: b9 09 9a  
            sta $0305,y        ; $9b28: 99 05 03  
            iny                ; $9b2b: c8        
            dex                ; $9b2c: ca        
            bpl __9b25         ; $9b2d: 10 f6     
            lda #$00           ; $9b2f: a9 00     
            sta $0305,y        ; $9b31: 99 05 03  
            jsr __9608         ; $9b34: 20 08 96  
            ldx #$1b           ; $9b37: a2 1b     
            ldy #$00           ; $9b39: a0 00     
__9b3b:     lda __9a21,y       ; $9b3b: b9 21 9a  
            sta $0301,y        ; $9b3e: 99 01 03  
            iny                ; $9b41: c8        
            dex                ; $9b42: ca        
            bpl __9b3b         ; $9b43: 10 f6     
            lda #$00           ; $9b45: a9 00     
            sta $0301,y        ; $9b47: 99 01 03  
            jmp __9b59         ; $9b4a: 4c 59 9b  

;-------------------------------------------------------------------------------
__9b4d:     lda $f5            ; $9b4d: a5 f5     
            and #$10           ; $9b4f: 29 10     
            beq __9b56         ; $9b51: f0 03     
            jmp __9c1f         ; $9b53: 4c 1f 9c  

;-------------------------------------------------------------------------------
__9b56:     jmp __9ab4         ; $9b56: 4c b4 9a  

;-------------------------------------------------------------------------------
__9b59:     jsr __9608         ; $9b59: 20 08 96  
            lda $19            ; $9b5c: a5 19     
            beq __9b63         ; $9b5e: f0 03     
            jmp __9c19         ; $9b60: 4c 19 9c  

;-------------------------------------------------------------------------------
__9b63:     lda $18            ; $9b63: a5 18     
            cmp #$09           ; $9b65: c9 09     
            beq __9b93         ; $9b67: f0 2a     
            lda $18            ; $9b69: a5 18     
            bne __9ba3         ; $9b6b: d0 36     
            dec $10            ; $9b6d: c6 10     
            bmi __9b74         ; $9b6f: 30 03     
            jmp __9c19         ; $9b71: 4c 19 9c  

;-------------------------------------------------------------------------------
__9b74:     lda #$20           ; $9b74: a9 20     
            sta $0301          ; $9b76: 8d 01 03  
            lda #$ae           ; $9b79: a9 ae     
            sta $0302          ; $9b7b: 8d 02 03  
            lda #$05           ; $9b7e: a9 05     
            sta $0303          ; $9b80: 8d 03 03  
            ldy #$04           ; $9b83: a0 04     
__9b85:     lda __98a2,y       ; $9b85: b9 a2 98  
            sta $0304,y        ; $9b88: 99 04 03  
            dey                ; $9b8b: 88        
            bpl __9b85         ; $9b8c: 10 f7     
            lda #$00           ; $9b8e: a9 00     
            sta $0309          ; $9b90: 8d 09 03  
__9b93:     inc $18            ; $9b93: e6 18     
            lda #$21           ; $9b95: a9 21     
            sta $14            ; $9b97: 85 14     
            lda #$06           ; $9b99: a9 06     
            sta $15            ; $9b9b: 85 15     
            lda #$40           ; $9b9d: a9 40     
            sta $1a            ; $9b9f: 85 1a     
            bne __9c19         ; $9ba1: d0 76     
__9ba3:     dec $1a            ; $9ba3: c6 1a     
            bpl __9c19         ; $9ba5: 10 72     
__9ba7:     lda #$40           ; $9ba7: a9 40     
            sta $1a            ; $9ba9: 85 1a     
            lda $14            ; $9bab: a5 14     
            sta $0301          ; $9bad: 8d 01 03  
            lda $15            ; $9bb0: a5 15     
            .hex 8d            ; $9bb2: 8d        Suspected data
__9bb3:     .hex 02            ; $9bb3: 02        Invalid Opcode - KIL 
            .hex 03 a9         ; $9bb4: 03 a9     Invalid Opcode - SLO ($a9,x)
            .hex 14 8d         ; $9bb6: 14 8d     Invalid Opcode - NOP $8d,x
            .hex 03 03         ; $9bb8: 03 03     Invalid Opcode - SLO ($03,x)
            ldx $18            ; $9bba: a6 18     
            dex                ; $9bbc: ca        
            lda __98a7,x       ; $9bbd: bd a7 98  
            sta $04            ; $9bc0: 85 04     
            lda __98b8,x       ; $9bc2: bd b8 98  
            sta $03            ; $9bc5: 85 03     
            ldy #$00           ; $9bc7: a0 00     
            ldx #$13           ; $9bc9: a2 13     
__9bcb:     lda ($03),y        ; $9bcb: b1 03     
            sta $0304,y        ; $9bcd: 99 04 03  
            iny                ; $9bd0: c8        
            dex                ; $9bd1: ca        
            bpl __9bcb         ; $9bd2: 10 f7     
            lda #$00           ; $9bd4: a9 00     
            sta $0304,y        ; $9bd6: 99 04 03  
            inc $18            ; $9bd9: e6 18     
            lda $15            ; $9bdb: a5 15     
            clc                ; $9bdd: 18        
            adc #$40           ; $9bde: 69 40     
            sta $15            ; $9be0: 85 15     
            lda $14            ; $9be2: a5 14     
            adc #$00           ; $9be4: 69 00     
            sta $14            ; $9be6: 85 14     
            lda $18            ; $9be8: a5 18     
            cmp #$09           ; $9bea: c9 09     
            bcc __9c19         ; $9bec: 90 2b     
            bne __9c0b         ; $9bee: d0 1b     
            lda #$09           ; $9bf0: a9 09     
            sta $02            ; $9bf2: 85 02     
            lda #$03           ; $9bf4: a9 03     
            sta $10            ; $9bf6: 85 10     
            lda #$20           ; $9bf8: a9 20     
            sta $14            ; $9bfa: 85 14     
            lda #$c7           ; $9bfc: a9 c7     
            sta $15            ; $9bfe: 85 15     
            lda #$52           ; $9c00: a9 52     
            sta $16            ; $9c02: 85 16     
            lda #$00           ; $9c04: a9 00     
            sta $17            ; $9c06: 85 17     
            jmp __9abb         ; $9c08: 4c bb 9a  

;-------------------------------------------------------------------------------
__9c0b:     cmp #$12           ; $9c0b: c9 12     
            bcc __9c19         ; $9c0d: 90 0a     
            inc $19            ; $9c0f: e6 19     
            lda #$25           ; $9c11: a9 25     
            sta $02            ; $9c13: 85 02     
            lda #$03           ; $9c15: a9 03     
            sta $10            ; $9c17: 85 10     
__9c19:     lda $f7            ; $9c19: a5 f7     
            and #$10           ; $9c1b: 29 10     
            beq __9c35         ; $9c1d: f0 16     
__9c1f:     lda #$80           ; $9c1f: a9 80     
            sta $0603          ; $9c21: 8d 03 06  
            jsr __9608         ; $9c24: 20 08 96  
            lda #$00           ; $9c27: a9 00     
            tay                ; $9c29: a8        
__9c2a:     sta $0000,y        ; $9c2a: 99 00 00  
            iny                ; $9c2d: c8        
            cpy #$f0           ; $9c2e: c0 f0     
            bcc __9c2a         ; $9c30: 90 f8     
            jmp __eca0         ; $9c32: 4c a0 ec  

;-------------------------------------------------------------------------------
__9c35:     lda $19            ; $9c35: a5 19     
            beq __9c4b         ; $9c37: f0 12     
            inc $10            ; $9c39: e6 10     
            lda $10            ; $9c3b: a5 10     
            and #$0f           ; $9c3d: 29 0f     
            bne __9c4b         ; $9c3f: d0 0a     
            dec $02            ; $9c41: c6 02     
            lda $02            ; $9c43: a5 02     
            cmp #$06           ; $9c45: c9 06     
            bne __9c4b         ; $9c47: d0 02     
            beq __9c4e         ; $9c49: f0 03     
__9c4b:     jmp __9b59         ; $9c4b: 4c 59 9b  

;-------------------------------------------------------------------------------
__9c4e:     lda #$10           ; $9c4e: a9 10     
            sta $ff            ; $9c50: 85 ff     
            .hex 8d            ; $9c52: 8d        Suspected data
__9c53:     brk                ; $9c53: 00        
            jsr $534c          ; $9c54: 20 4c 53  
            txs                ; $9c57: 9a        
            .hex ff ff ff      ; $9c58: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c5b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c5e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c61: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c64: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c67: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c6a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c6d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c70: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c73: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c76: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $9c79: ff        Suspected data
__9c7a:     .hex ff ff ff      ; $9c7a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c7d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c80: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c83: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c86: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c89: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c8c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c8f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c92: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c95: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c98: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c9b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9c9e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ca1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ca4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ca7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9caa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cad: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cb0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cb3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cb6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cb9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cbc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cbf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cc2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cc5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cc8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ccb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cce: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cd1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cd4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cd7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cda: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cdd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ce0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ce3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ce6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ce9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cec: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cef: ff ff ff  Invalid Opcode - ISC Array,x
__9cf2:     .hex ff ff ff      ; $9cf2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cf5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cf8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cfb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9cfe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d01: ff ff ff  Invalid Opcode - ISC Array,x
__9d04:     .hex ff ff ff      ; $9d04: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d07: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d0a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d0d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d10: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d13: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d16: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d19: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d1c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d1f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d22: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d25: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d28: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d2b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d2e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d31: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d34: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d37: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d3a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d3d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d40: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d43: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d46: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d49: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d4c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d4f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d52: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d55: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d58: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d5b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d5e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d61: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d64: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d67: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d6a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d6d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d70: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d73: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d76: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d79: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d7c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d7f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d82: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d85: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d88: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d8b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d8e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d91: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d94: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d97: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d9a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9d9d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9da0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9da3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9da6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9da9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9daf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9db2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9db5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9db8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dbb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dbe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dc1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dc4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dc7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dcd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dd0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dd3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dd6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dd9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ddc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ddf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9de2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9de5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9de8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9deb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $9df1: ff        Suspected data
__9df2:     .hex ff            ; $9df2: ff        Suspected data
__9df3:     .hex ff ff ff      ; $9df3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9df6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $9df9: ff        Suspected data
__9dfa:     .hex ff ff ff      ; $9dfa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9dfd: ff ff ff  Invalid Opcode - ISC Array,x
__9e00:     .hex ff ff ff      ; $9e00: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e03: ff ff ff  Invalid Opcode - ISC Array,x
__9e06:     .hex ff ff ff      ; $9e06: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e09: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e0c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e0f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e12: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e15: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e18: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e1b: ff ff ff  Invalid Opcode - ISC Array,x
__9e1e:     .hex ff ff ff      ; $9e1e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e21: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e24: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e27: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e2a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e2d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e30: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e33: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e36: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $9e39: ff ff     Suspected data
__9e3b:     .hex ff ff ff      ; $9e3b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e3e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e41: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e44: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e47: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $9e4a: ff        Suspected data
__9e4b:     .hex ff ff ff      ; $9e4b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $9e4e: ff ff     Suspected data
__9e50:     .hex ff ff ff      ; $9e50: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e53: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e56: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e59: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e5c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e5f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e62: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e65: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e68: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e6b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e6e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e71: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e74: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e77: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e7a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e7d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e80: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e83: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e86: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e89: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $9e8c: ff ff     Suspected data
__9e8e:     .hex ff ff ff      ; $9e8e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e91: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e94: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e97: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e9a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9e9d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ea0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ea3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ea6: ff ff ff  Invalid Opcode - ISC Array,x
__9ea9:     .hex ff ff ff      ; $9ea9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9eac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9eaf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9eb2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9eb5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9eb8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ebb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ebe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ec1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ec4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ec7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9eca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ecd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ed0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ed3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ed6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ed9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9edc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9edf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ee2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ee5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ee8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9eeb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9eee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ef1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ef4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ef7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9efa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9efd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f00: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f03: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f06: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f09: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f0c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f0f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f12: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f15: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f18: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f1b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f1e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f21: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f24: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f27: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f2a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f2d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f30: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f33: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f36: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f39: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f3c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f3f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f42: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f45: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f48: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f4b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f4e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f51: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f54: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f57: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f5a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f5d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f60: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f63: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f66: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f69: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f6c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f6f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f72: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f75: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f78: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f7b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f7e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f81: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f84: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f87: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f8a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f8d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f90: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f93: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f96: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f99: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f9c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9f9f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fa2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fa5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fa8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fab: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fae: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fb1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fb4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fb7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fba: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fbd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fc0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fc3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fc6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fc9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fcc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fcf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fd2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fd5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fd8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fdb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fde: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fe1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fe4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fe7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fea: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fed: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ff0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ff3: ff ff ff  Invalid Opcode - ISC Array,x
__9ff6:     .hex ff ff ff      ; $9ff6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ff9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9ffc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $9fff: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a002: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a005: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a008: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a00b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a00e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a011: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a014: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a017: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a01a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a01d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a020: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a023: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a026: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a029: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a02c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $a02f: ff        Suspected data
__a030:     .hex ff            ; $a030: ff        Suspected data
__a031:     .hex ff            ; $a031: ff        Suspected data
__a032:     .hex ff ff ff      ; $a032: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a035: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a038: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a03b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a03e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a041: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a044: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a047: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a04a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a04d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a050: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a053: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a056: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a059: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a05c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a05f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a062: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a065: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a068: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a06b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a06e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a071: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a074: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a077: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a07a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a07d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a080: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a083: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a086: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a089: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a08c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a08f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a092: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a095: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a098: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a09b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a09e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0a1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0a4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0a7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0aa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0ad: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0b0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0b3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0b6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0b9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0bc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0bf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0c2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0c5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0c8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0cb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0ce: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0d1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0d4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0d7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0da: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0dd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0e0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0e3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0e6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0e9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0ec: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0ef: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0f2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0f5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0f8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0fb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a0fe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a101: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a104: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a107: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a10a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a10d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a110: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a113: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a116: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a119: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a11c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $a11f: ff        Suspected data
__a120:     .hex ff ff ff      ; $a120: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a123: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $a126: ff ff     Suspected data
__a128:     .hex ff ff ff      ; $a128: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a12b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a12e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a131: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a134: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a137: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a13a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a13d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a140: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a143: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a146: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a149: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a14c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a14f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a152: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a155: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a158: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a15b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a15e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a161: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a164: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a167: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a16a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a16d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a170: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a173: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a176: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a179: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a17c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a17f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a182: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a185: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a188: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a18b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a18e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a191: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a194: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a197: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a19a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a19d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1a0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1a3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1a6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1a9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1ac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1af: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1b2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1b5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1b8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1bb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1be: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1c1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1c4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1c7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1ca: ff ff ff  Invalid Opcode - ISC Array,x
__a1cd:     .hex ff ff ff      ; $a1cd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1d0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $a1d3: ff ff     Suspected data
__a1d5:     .hex ff ff ff      ; $a1d5: ff ff ff  Invalid Opcode - ISC Array,x
__a1d8:     .hex ff ff ff      ; $a1d8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $a1db: ff        Suspected data
__a1dc:     .hex ff ff ff      ; $a1dc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1df: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $a1e2: ff ff     Suspected data
__a1e4:     .hex ff ff ff      ; $a1e4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1e7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1ea: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1ed: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1f0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1f3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1f6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1f9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $a1fc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $a1ff: ff        Suspected data
__a200:     .hex 01            ; $a200: 01        Suspected data
__a201:     .hex 03 39         ; $a201: 03 39     Invalid Opcode - SLO ($39,x)
            ldx #$4c           ; $a203: a2 4c     
            ldx $8d            ; $a205: a6 8d     
            .hex a7 c6         ; $a207: a7 c6     Invalid Opcode - LAX $c6
            lda #$ea           ; $a209: a9 ea     
            lda #$0e           ; $a20b: a9 0e     
            tax                ; $a20d: aa        
            .hex 74 a9         ; $a20e: 74 a9     Invalid Opcode - NOP $a9,x
            .hex bb a9 13      ; $a210: bb a9 13  Invalid Opcode - LAS $13a9,y
            ldx __ae1f         ; $a213: ae 1f ae  
            .hex 2b ae         ; $a216: 2b ae     Invalid Opcode - ANC #$ae
            .hex 37 ae         ; $a218: 37 ae     Invalid Opcode - RLA $ae,x
__a21a:     lda #$00           ; $a21a: a9 00     
            beq __a220         ; $a21c: f0 02     
__a21e:     lda #$1e           ; $a21e: a9 1e     
__a220:     sta $fe            ; $a220: 85 fe     
__a222:     lda $11            ; $a222: a5 11     
            asl                ; $a224: 0a        
            tax                ; $a225: aa        
            lda __a200,x       ; $a226: bd 00 a2  
            sta $f0            ; $a229: 85 f0     
            lda __a201,x       ; $a22b: bd 01 a2  
            sta $f1            ; $a22e: 85 f1     
            lda #$00           ; $a230: a9 00     
            sta $eb            ; $a232: 85 eb     
__a234:     lda $eb            ; $a234: a5 eb     
            bpl __a234         ; $a236: 10 fc     
            rts                ; $a238: 60        

;-------------------------------------------------------------------------------
            jsr __9e00         ; $a239: 20 00 9e  
            .hex 72            ; $a23c: 72        Invalid Opcode - KIL 
            .hex 73 72         ; $a23d: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a23f: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a241: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a243: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a245: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a247: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a249: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a24b: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a24d: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a24f: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a251: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a253: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a255: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a257: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 20         ; $a259: 73 20     Invalid Opcode - RRA ($20),y
            ora ($9e,x)        ; $a25b: 01 9e     
            .hex 73 72         ; $a25d: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a25f: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a261: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a263: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a265: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a267: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a269: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a26b: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a26d: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a26f: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a271: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a273: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a275: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a277: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a279: 73 72     Invalid Opcode - RRA ($72),y
            .hex 22            ; $a27b: 22        Invalid Opcode - KIL 
            .hex 02            ; $a27c: 02        Invalid Opcode - KIL 
            stx $7372          ; $a27d: 8e 72 73  
            .hex 72            ; $a280: 72        Invalid Opcode - KIL 
            .hex 73 72         ; $a281: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a283: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a285: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a287: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a289: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 22         ; $a28b: 73 22     Invalid Opcode - RRA ($22),y
            .hex 03 8e         ; $a28d: 03 8e     Invalid Opcode - SLO ($8e,x)
            .hex 73 72         ; $a28f: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a291: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a293: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a295: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a297: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a299: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a29b: 73 72     Invalid Opcode - RRA ($72),y
            .hex 23 44         ; $a29d: 23 44     Invalid Opcode - RLA ($44,x)
            clc                ; $a29f: 18        
            .hex 72            ; $a2a0: 72        Invalid Opcode - KIL 
            .hex 73 72         ; $a2a1: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2a3: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2a5: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2a7: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2a9: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2ab: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2ad: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2af: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2b1: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2b3: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2b5: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 23         ; $a2b7: 73 23     Invalid Opcode - RRA ($23),y
            .hex 64 18         ; $a2b9: 64 18     Invalid Opcode - NOP $18
            .hex 73 72         ; $a2bb: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2bd: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2bf: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2c1: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2c3: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2c5: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2c7: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2c9: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2cb: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2cd: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2cf: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2d1: 73 72     Invalid Opcode - RRA ($72),y
            .hex 23 84         ; $a2d3: 23 84     Invalid Opcode - RLA ($84,x)
            clc                ; $a2d5: 18        
            .hex 72            ; $a2d6: 72        Invalid Opcode - KIL 
            .hex 73 72         ; $a2d7: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2d9: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2db: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2dd: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2df: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2e1: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2e3: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2e5: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2e7: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2e9: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2eb: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 23         ; $a2ed: 73 23     Invalid Opcode - RRA ($23),y
            ldy $18            ; $a2ef: a4 18     
            .hex 73 72         ; $a2f1: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2f3: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2f5: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2f7: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2f9: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2fb: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2fd: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a2ff: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a301: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a303: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a305: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a307: 73 72     Invalid Opcode - RRA ($72),y
            .hex 22            ; $a309: 22        Invalid Opcode - KIL 
            .hex 1c 8e 72      ; $a30a: 1c 8e 72  Invalid Opcode - NOP $728e,x
            .hex 73 72         ; $a30d: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a30f: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73            ; $a311: 73        Suspected data
__a312:     .hex 72            ; $a312: 72        Invalid Opcode - KIL 
            .hex 73 72         ; $a313: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a315: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a317: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 22         ; $a319: 73 22     Invalid Opcode - RRA ($22),y
            ora $738e,x        ; $a31b: 1d 8e 73  
            .hex 72            ; $a31e: 72        Invalid Opcode - KIL 
            .hex 73 72         ; $a31f: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a321: 73 72     Invalid Opcode - RRA ($72),y
__a323:     .hex 73 72         ; $a323: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a325: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a327: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a329: 73 72     Invalid Opcode - RRA ($72),y
            jsr __9e1e         ; $a32b: 20 1e 9e  
            .hex 72            ; $a32e: 72        Invalid Opcode - KIL 
            .hex 73 72         ; $a32f: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a331: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a333: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a335: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a337: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a339: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a33b: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a33d: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a33f: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a341: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a343: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a345: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a347: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a349: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 20         ; $a34b: 73 20     Invalid Opcode - RRA ($20),y
            .hex 1f 9e 73      ; $a34d: 1f 9e 73  Invalid Opcode - SLO $739e,x
            .hex 72            ; $a350: 72        Invalid Opcode - KIL 
            .hex 73 72         ; $a351: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a353: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a355: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a357: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a359: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a35b: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a35d: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a35f: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a361: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a363: 73 72     Invalid Opcode - RRA ($72),y
__a365:     .hex 73 72         ; $a365: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a367: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a369: 73 72     Invalid Opcode - RRA ($72),y
            .hex 73 72         ; $a36b: 73 72     Invalid Opcode - RRA ($72),y
            .hex 22            ; $a36d: 22        Invalid Opcode - KIL 
            dec $c4            ; $a36e: c6 c4     
            .hex fc 22 c7      ; $a370: fc 22 c7  Invalid Opcode - NOP __c722,x
            cpy $fc            ; $a373: c4 fc     
            .hex 22            ; $a375: 22        Invalid Opcode - KIL 
            iny                ; $a376: c8        
            sty $ad            ; $a377: 84 ad     
            ldy __acac         ; $a379: ac ac ac  
            .hex 22            ; $a37c: 22        Invalid Opcode - KIL 
            sbc #$83           ; $a37d: e9 83     
            .hex ad ac         ; $a37f: ad ac     Suspected data
__a381:     ldy $0a23          ; $a381: ac 23 0a  
            .hex 82 ad         ; $a384: 82 ad     Invalid Opcode - NOP #$ad
            ldy $2b23          ; $a386: ac 23 2b  
            ora ($ad,x)        ; $a389: 01 ad     
            .hex 22            ; $a38b: 22        Invalid Opcode - KIL 
            bcc __a312         ; $a38c: 90 84     
            dey                ; $a38e: 88        
            .hex 89 89         ; $a38f: 89 89     Invalid Opcode - NOP #$89
            sty __9122         ; $a391: 8c 22 91  
            sty $8a            ; $a394: 84 8a     
            .hex 8b 8b         ; $a396: 8b 8b     Invalid Opcode - XAA #$8b
            sta $0e23          ; $a398: 8d 23 0e  
            asl $74            ; $a39b: 06 74     
            ror $74,x          ; $a39d: 76 74     
            ror $74,x          ; $a39f: 76 74     
            ror $23,x          ; $a3a1: 76 23     
            rol $7506          ; $a3a3: 2e 06 75  
            .hex 77 75         ; $a3a6: 77 75     Invalid Opcode - RRA $75,x
            .hex 77 75         ; $a3a8: 77 75     Invalid Opcode - RRA $75,x
            .hex 77 23         ; $a3aa: 77 23     Invalid Opcode - RRA $23,x
            cpy #$20           ; $a3ac: c0 20     
            .hex 22            ; $a3ae: 22        Invalid Opcode - KIL 
            brk                ; $a3af: 00        
            brk                ; $a3b0: 00        
            brk                ; $a3b1: 00        
            brk                ; $a3b2: 00        
            brk                ; $a3b3: 00        
            brk                ; $a3b4: 00        
            dey                ; $a3b5: 88        
            .hex 22            ; $a3b6: 22        Invalid Opcode - KIL 
            brk                ; $a3b7: 00        
            brk                ; $a3b8: 00        
            brk                ; $a3b9: 00        
            brk                ; $a3ba: 00        
            brk                ; $a3bb: 00        
            brk                ; $a3bc: 00        
            dey                ; $a3bd: 88        
            .hex 22            ; $a3be: 22        Invalid Opcode - KIL 
            brk                ; $a3bf: 00        
            brk                ; $a3c0: 00        
            brk                ; $a3c1: 00        
            brk                ; $a3c2: 00        
            brk                ; $a3c3: 00        
            brk                ; $a3c4: 00        
            dey                ; $a3c5: 88        
            .hex 22            ; $a3c6: 22        Invalid Opcode - KIL 
            brk                ; $a3c7: 00        
            brk                ; $a3c8: 00        
            brk                ; $a3c9: 00        
            brk                ; $a3ca: 00        
            brk                ; $a3cb: 00        
            brk                ; $a3cc: 00        
            dey                ; $a3cd: 88        
            .hex 23 e0         ; $a3ce: 23 e0     Invalid Opcode - RLA ($e0,x)
            jsr $00aa          ; $a3d0: 20 aa 00  
            brk                ; $a3d3: 00        
            brk                ; $a3d4: 00        
            brk                ; $a3d5: 00        
            brk                ; $a3d6: 00        
            brk                ; $a3d7: 00        
            tax                ; $a3d8: aa        
            tax                ; $a3d9: aa        
            brk                ; $a3da: 00        
            brk                ; $a3db: 00        
            brk                ; $a3dc: 00        
            ora ($00),y        ; $a3dd: 11 00     
            brk                ; $a3df: 00        
            tax                ; $a3e0: aa        
            tax                ; $a3e1: aa        
            ldy #$a0           ; $a3e2: a0 a0     
            ldy $a5            ; $a3e4: a4 a5     
            ldy #$a0           ; $a3e6: a0 a0     
            tax                ; $a3e8: aa        
            asl                ; $a3e9: 0a        
__a3ea:     asl                ; $a3ea: 0a        
            asl                ; $a3eb: 0a        
            asl                ; $a3ec: 0a        
            asl                ; $a3ed: 0a        
            asl                ; $a3ee: 0a        
            asl                ; $a3ef: 0a        
            asl                ; $a3f0: 0a        
            brk                ; $a3f1: 00        
            and ($0c,x)        ; $a3f2: 21 0c     
            ora #$ed           ; $a3f4: 09 ed     
            sbc ($da,x)        ; $a3f6: e1 da     
            .hex e7 e4         ; $a3f8: e7 e4     Invalid Opcode - ISC $e4
            .hex fb f2 e8      ; $a3fa: fb f2 e8  Invalid Opcode - ISC __e8f2,y
            .hex ee 00         ; $a3fd: ee 00     Suspected data
__a3ff:     bmi __a381         ; $a3ff: 30 80     
            .hex 80 80         ; $a401: 80 80     Invalid Opcode - NOP #$80
            .hex 80 80         ; $a403: 80 80     Invalid Opcode - NOP #$80
            .hex 80 80         ; $a405: 80 80     Invalid Opcode - NOP #$80
            .hex 80 80         ; $a407: 80 80     Invalid Opcode - NOP #$80
__a409:     .hex b0            ; $a409: b0        Suspected data
__a40a:     ldy #$a0           ; $a40a: a0 a0     
            ldy #$a0           ; $a40c: a0 a0     
            ldy #$a0           ; $a40e: a0 a0     
            ldy #$a0           ; $a410: a0 a0     
            sta $10,x          ; $a412: 95 10     
            .hex f4 0c         ; $a414: f4 0c     Invalid Opcode - NOP $0c,x
            inx                ; $a416: e8        
            clc                ; $a417: 18        
            cpx __f814         ; $a418: ec 14 f8  
            php                ; $a41b: 08        
            brk                ; $a41c: 00        
__a41d:     brk                ; $a41d: 00        
            cpy $c4            ; $a41e: c4 c4     
            clv                ; $a420: b8        
            clv                ; $a421: b8        
            tay                ; $a422: a8        
            tay                ; $a423: a8        
            ldy #$a0           ; $a424: a0 a0     
            brk                ; $a426: 00        
            brk                ; $a427: 00        
            beq __a40a         ; $a428: f0 e0     
__a42a:     cpy #$a0           ; $a42a: c0 a0     
            .hex 80 60         ; $a42c: 80 60     Invalid Opcode - NOP #$60
            rti                ; $a42e: 40        

;-------------------------------------------------------------------------------
            jsr $0000          ; $a42f: 20 00 00  
__a432:     and ($61,x)        ; $a432: 21 61     
            and ($61,x)        ; $a434: 21 61     
            and ($61,x)        ; $a436: 21 61     
            and ($61,x)        ; $a438: 21 61     
            .hex 22            ; $a43a: 22        Invalid Opcode - KIL 
            jsr __a21a         ; $a43b: 20 1a a2  
            .hex 20 8a         ; $a43e: 20 8a     Suspected data
__a440:     cpx $40a9          ; $a440: ec a9 40  
            sta $0100          ; $a443: 8d 00 01  
            lda #$b0           ; $a446: a9 b0     
            sta $ff            ; $a448: 85 ff     
            sta $2000          ; $a44a: 8d 00 20  
            jsr __a222         ; $a44d: 20 22 a2  
            lda #$01           ; $a450: a9 01     
            sta $11            ; $a452: 85 11     
            jsr __a222         ; $a454: 20 22 a2  
            lda #$60           ; $a457: a9 60     
            sta $83            ; $a459: 85 83     
            lda #$01           ; $a45b: a9 01     
            sta $9d            ; $a45d: 85 9d     
            lsr                ; $a45f: 4a        
            sta $50            ; $a460: 85 50     
            sta $8e            ; $a462: 85 8e     
            sta $04ca          ; $a464: 8d ca 04  
            sta $e6            ; $a467: 85 e6     
            sta $e5            ; $a469: 85 e5     
            sta $0400          ; $a46b: 8d 00 04  
            ldx #$09           ; $a46e: a2 09     
__a470:     lda __a3ff,x       ; $a470: bd ff a3  
            sta $28,x          ; $a473: 95 28     
            lda __a409,x       ; $a475: bd 09 a4  
__a478:     sta $32,x          ; $a478: 95 32     
            .hex bd            ; $a47a: bd        Suspected data
__a47b:     .hex 13 a4         ; $a47b: 13 a4     Invalid Opcode - SLO ($a4),y
            sta $3c,x          ; $a47d: 95 3c     
__a47f:     lda __a41d,x       ; $a47f: bd 1d a4  
            .hex 95            ; $a482: 95        Suspected data
__a483:     lsr $bd            ; $a483: 46 bd     
__a485:     .hex 27 a4         ; $a485: 27 a4     Invalid Opcode - RLA $a4
__a487:     sta $85,x          ; $a487: 95 85     
__a489:     .hex bd 31         ; $a489: bd 31     Suspected data
__a48b:     ldy $95            ; $a48b: a4 95     
            .hex 64 ca         ; $a48d: 64 ca     Invalid Opcode - NOP $ca
            bpl __a470         ; $a48f: 10 df     
__a491:     jsr __a21e         ; $a491: 20 1e a2  
__a494:     inc $10            ; $a494: e6 10     
            jsr __eca0         ; $a496: 20 a0 ec  
            jsr __a4c0         ; $a499: 20 c0 a4  
            jsr __a5de         ; $a49c: 20 de a5  
            lda $83            ; $a49f: a5 83     
            beq __a4b8         ; $a4a1: f0 15     
            lda $10            ; $a4a3: a5 10     
            and #$07           ; $a4a5: 29 07     
            bne __a491         ; $a4a7: d0 e8     
            dec $83            ; $a4a9: c6 83     
            lda $83            ; $a4ab: a5 83     
            cmp #$25           ; $a4ad: c9 25     
            bne __a491         ; $a4af: d0 e0     
            ldy #$04           ; $a4b1: a0 04     
            sty $0603          ; $a4b3: 8c 03 06  
            bne __a491         ; $a4b6: d0 d9     
__a4b8:     jsr __ab90         ; $a4b8: 20 90 ab  
            lda $e6            ; $a4bb: a5 e6     
            beq __a491         ; $a4bd: f0 d2     
            rts                ; $a4bf: 60        

;-------------------------------------------------------------------------------
__a4c0:     lda $84            ; $a4c0: a5 84     
            beq __a4c6         ; $a4c2: f0 02     
            dec $84            ; $a4c4: c6 84     
__a4c6:     lda $82            ; $a4c6: a5 82     
            beq __a4cc         ; $a4c8: f0 02     
            dec $82            ; $a4ca: c6 82     
__a4cc:     lda $28            ; $a4cc: a5 28     
            sta $0428          ; $a4ce: 8d 28 04  
            lda $32            ; $a4d1: a5 32     
            sta $042b          ; $a4d3: 8d 2b 04  
            jsr __f31a         ; $a4d6: 20 1a f3  
            lda $50            ; $a4d9: a5 50     
            jsr __e125         ; $a4db: 20 25 e1  
            inx                ; $a4de: e8        
            ldy $04            ; $a4df: a4 04     
            lda $30            ; $a4e1: a5 30     
            lda $56            ; $a4e3: a5 56     
            lda $78            ; $a4e5: a5 78     
            lda $20            ; $a4e7: a5 20     
            .hex 6f 8d 20      ; $a4e9: 6f 8d 20  Invalid Opcode - RRA $208d
            bvc __a478         ; $a4ec: 50 8a     
            lda $28            ; $a4ee: a5 28     
            cmp #$3e           ; $a4f0: c9 3e     
            bcc __a52f         ; $a4f2: 90 3b     
            inc $50            ; $a4f4: e6 50     
            inc $99            ; $a4f6: e6 99     
            lda #$06           ; $a4f8: a9 06     
            sta $c7            ; $a4fa: 85 c7     
__a4fc:     lda #$01           ; $a4fc: a9 01     
            sta $0604          ; $a4fe: 8d 04 06  
            .hex 4c            ; $a501: 4c        Suspected data
__a502:     sta $208c,y        ; $a502: 99 8c 20  
            .hex 6f 8d 20      ; $a505: 6f 8d 20  Invalid Opcode - RRA $208d
__a508:     bvc __a494         ; $a508: 50 8a     
            jsr __a596         ; $a50a: 20 96 a5  
            jsr __8ea4         ; $a50d: 20 a4 8e  
            lda $46            ; $a510: a5 46     
            bmi __a52f         ; $a512: 30 1b     
            lda $32            ; $a514: a5 32     
            cmp #$a0           ; $a516: c9 a0     
            bcc __a521         ; $a518: 90 07     
            lda #$0c           ; $a51a: a9 0c     
            sta $3c            ; $a51c: 85 3c     
            jmp __a4fc         ; $a51e: 4c fc a4  

;-------------------------------------------------------------------------------
__a521:     cmp #$75           ; $a521: c9 75     
            bcc __a52f         ; $a523: 90 0a     
            lda $28            ; $a525: a5 28     
            cmp #$70           ; $a527: c9 70     
            bcc __a52f         ; $a529: 90 04     
            inc $50            ; $a52b: e6 50     
            dec $99            ; $a52d: c6 99     
__a52f:     rts                ; $a52f: 60        

;-------------------------------------------------------------------------------
            jsr __8d6f         ; $a530: 20 6f 8d  
            jsr __8a50         ; $a533: 20 50 8a  
            lda $28            ; $a536: a5 28     
            cmp #$80           ; $a538: c9 80     
            bcc __a52f         ; $a53a: 90 f3     
            inc $50            ; $a53c: e6 50     
            inc $9c            ; $a53e: e6 9c     
            lda #$08           ; $a540: a9 08     
            sta $c7            ; $a542: 85 c7     
            lda #$05           ; $a544: a9 05     
            sta $8e            ; $a546: 85 8e     
            lda #$28           ; $a548: a9 28     
            sta $82            ; $a54a: 85 82     
__a54c:     rts                ; $a54c: 60        

;-------------------------------------------------------------------------------
            .hex 14 0a         ; $a54d: 14 0a     Invalid Opcode - NOP $0a,x
            .hex 14 0a         ; $a54f: 14 0a     Invalid Opcode - NOP $0a,x
            .hex 1c            ; $a551: 1c        Suspected data
__a552:     .hex 1b 1e 1d      ; $a552: 1b 1e 1d  Invalid Opcode - SLO $1d1e,y
            .hex 1f a5 82      ; $a555: 1f a5 82  Invalid Opcode - SLO __82a5,x
            bne __a577         ; $a558: d0 1d     
            dec $8e            ; $a55a: c6 8e     
            bne __a570         ; $a55c: d0 12     
            inc $50            ; $a55e: e6 50     
            inc $99            ; $a560: e6 99     
            lda #$06           ; $a562: a9 06     
            sta $c7            ; $a564: 85 c7     
            lda #$08           ; $a566: a9 08     
            sta $0601          ; $a568: 8d 01 06  
            lda #$a0           ; $a56b: a9 a0     
            sta $4f            ; $a56d: 85 4f     
            rts                ; $a56f: 60        

;-------------------------------------------------------------------------------
__a570:     ldy $8e            ; $a570: a4 8e     
            lda __a54c,y       ; $a572: b9 4c a5  
            sta $82            ; $a575: 85 82     
__a577:     rts                ; $a577: 60        

;-------------------------------------------------------------------------------
            jsr __a5a1         ; $a578: 20 a1 a5  
            jsr __a596         ; $a57b: 20 96 a5  
            jsr __8d6f         ; $a57e: 20 6f 8d  
            jsr __8ea4         ; $a581: 20 a4 8e  
            lda $46            ; $a584: a5 46     
            bmi __a591         ; $a586: 30 09     
            lda $32            ; $a588: a5 32     
            cmp #$80           ; $a58a: c9 80     
            bcc __a591         ; $a58c: 90 03     
            .hex 4c            ; $a58e: 4c        Suspected data
__a58f:     .hex 99 8c         ; $a58f: 99 8c     Suspected data
__a591:     rts                ; $a591: 60        

;-------------------------------------------------------------------------------
__a592:     .hex 04 04         ; $a592: 04 04     Invalid Opcode - NOP $04
            .hex 04 01         ; $a594: 04 01     Invalid Opcode - NOP $01
__a596:     ldy $8f            ; $a596: a4 8f     
            lda __a592,y       ; $a598: b9 92 a5  
            clc                ; $a59b: 18        
            adc $46            ; $a59c: 65 46     
            sta $46            ; $a59e: 85 46     
            rts                ; $a5a0: 60        

;-------------------------------------------------------------------------------
__a5a1:     ldx #$07           ; $a5a1: a2 07     
__a5a3:     stx $12            ; $a5a3: 86 12     
            lda $86,x          ; $a5a5: b5 86     
            beq __a5b4         ; $a5a7: f0 0b     
            cmp #$01           ; $a5a9: c9 01     
            bne __a5d8         ; $a5ab: d0 2b     
            lda #$08           ; $a5ad: a9 08     
            sta $0602          ; $a5af: 8d 02 06  
            bne __a5d8         ; $a5b2: d0 24     
__a5b4:     jsr __b948         ; $a5b4: 20 48 b9  
            lda $47,x          ; $a5b7: b5 47     
            cmp #$08           ; $a5b9: c9 08     
            bmi __a5cc         ; $a5bb: 30 0f     
            lda #$00           ; $a5bd: a9 00     
            sta $3d,x          ; $a5bf: 95 3d     
            lda #$f9           ; $a5c1: a9 f9     
            sta $47,x          ; $a5c3: 95 47     
            lda __a432,x       ; $a5c5: bd 32 a4  
            eor #$40           ; $a5c8: 49 40     
            sta $65,x          ; $a5ca: 95 65     
__a5cc:     lda $10            ; $a5cc: a5 10     
            asl                ; $a5ce: 0a        
            and #$02           ; $a5cf: 29 02     
            sta $0f            ; $a5d1: 85 0f     
            jsr __a60e         ; $a5d3: 20 0e a6  
            inc $86,x          ; $a5d6: f6 86     
__a5d8:     dec $86,x          ; $a5d8: d6 86     
            dex                ; $a5da: ca        
            bpl __a5a3         ; $a5db: 10 c6     
            rts                ; $a5dd: 60        

;-------------------------------------------------------------------------------
__a5de:     lda #$04           ; $a5de: a9 04     
            sta $0f            ; $a5e0: 85 0f     
            ldx #$08           ; $a5e2: a2 08     
            stx $12            ; $a5e4: 86 12     
            jsr __a60e         ; $a5e6: 20 0e a6  
            ldy $8e            ; $a5e9: a4 8e     
            bne __a5f6         ; $a5eb: d0 09     
            lda $3b            ; $a5ed: a5 3b     
            cmp #$f0           ; $a5ef: c9 f0     
            bcs __a5fe         ; $a5f1: b0 0b     
            jmp __b907         ; $a5f3: 4c 07 b9  

;-------------------------------------------------------------------------------
__a5f6:     .hex b9 50         ; $a5f6: b9 50     Suspected data
__a5f8:     lda $18            ; $a5f8: a5 18     
            adc $32            ; $a5fa: 65 32     
            sta $3b            ; $a5fc: 85 3b     
__a5fe:     rts                ; $a5fe: 60        

;-------------------------------------------------------------------------------
__a5ff:     inx                ; $a5ff: e8        
__a600:     nop                ; $a600: ea        
            cpx $61ee          ; $a601: ec ee 61  
            .hex 63            ; $a604: 63        Suspected data
__a605:     bmi __a63f         ; $a605: 30 38     
            rti                ; $a607: 40        

;-------------------------------------------------------------------------------
            pha                ; $a608: 48        
            bvc __a663         ; $a609: 50 58     
            rts                ; $a60b: 60        

;-------------------------------------------------------------------------------
            pla                ; $a60c: 68        
            brk                ; $a60d: 00        
__a60e:     ldy __a605,x       ; $a60e: bc 05 a6  
            lda $33,x          ; $a611: b5 33     
            sta $0200,y        ; $a613: 99 00 02  
            sta $0204,y        ; $a616: 99 04 02  
            lda $29,x          ; $a619: b5 29     
            sta $0203,y        ; $a61b: 99 03 02  
            clc                ; $a61e: 18        
            adc #$08           ; $a61f: 69 08     
            sta $0207,y        ; $a621: 99 07 02  
            lda $65,x          ; $a624: b5 65     
            sta $0202,y        ; $a626: 99 02 02  
            sta $0206,y        ; $a629: 99 06 02  
            ldx $0f            ; $a62c: a6 0f     
            and #$40           ; $a62e: 29 40     
            bne __a63d         ; $a630: d0 0b     
            lda __a5ff,x       ; $a632: bd ff a5  
            sta $0201,y        ; $a635: 99 01 02  
            lda __a600,x       ; $a638: bd 00 a6  
            bne __a646         ; $a63b: d0 09     
__a63d:     .hex bd 00         ; $a63d: bd 00     Suspected data
__a63f:     ldx $99            ; $a63f: a6 99     
            ora ($02,x)        ; $a641: 01 02     
            lda __a5ff,x       ; $a643: bd ff a5  
__a646:     .hex 99 05         ; $a646: 99 05     Suspected data
__a648:     .hex 02            ; $a648: 02        Invalid Opcode - KIL 
            ldx $12            ; $a649: a6 12     
            rts                ; $a64b: 60        

;-------------------------------------------------------------------------------
            jsr $2000          ; $a64c: 20 00 20  
            .hex 80 81         ; $a64f: 80 81     Invalid Opcode - NOP #$81
__a651:     .hex 80 81         ; $a651: 80 81     Invalid Opcode - NOP #$81
            .hex 80            ; $a653: 80        Suspected data
__a654:     sta ($80,x)        ; $a654: 81 80     
            sta ($80,x)        ; $a656: 81 80     
            sta ($80,x)        ; $a658: 81 80     
            sta ($80,x)        ; $a65a: 81 80     
            sta ($80,x)        ; $a65c: 81 80     
            sta ($80,x)        ; $a65e: 81 80     
            sta ($80,x)        ; $a660: 81 80     
            .hex 81            ; $a662: 81        Suspected data
__a663:     .hex 80 81         ; $a663: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a665: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a667: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a669: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a66b: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a66d: 80 81     Invalid Opcode - NOP #$81
            jsr $2020          ; $a66f: 20 20 20  
            sta ($80,x)        ; $a672: 81 80     
            sta ($80,x)        ; $a674: 81 80     
            sta ($80,x)        ; $a676: 81 80     
            sta ($80,x)        ; $a678: 81 80     
            sta ($80,x)        ; $a67a: 81 80     
            sta ($80,x)        ; $a67c: 81 80     
            sta ($80,x)        ; $a67e: 81 80     
            sta ($80,x)        ; $a680: 81 80     
            sta ($80,x)        ; $a682: 81 80     
            sta ($80,x)        ; $a684: 81 80     
            sta ($80,x)        ; $a686: 81 80     
            sta ($80,x)        ; $a688: 81 80     
            sta ($80,x)        ; $a68a: 81 80     
            sta ($80,x)        ; $a68c: 81 80     
            sta ($80,x)        ; $a68e: 81 80     
            sta ($80,x)        ; $a690: 81 80     
            jsr $2040          ; $a692: 20 40 20  
            .hex 80 81         ; $a695: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a697: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a699: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a69b: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a69d: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a69f: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a6a1: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a6a3: 80 81     Invalid Opcode - NOP #$81
            .hex 80            ; $a6a5: 80        Suspected data
__a6a6:     sta ($80,x)        ; $a6a6: 81 80     
            sta ($80,x)        ; $a6a8: 81 80     
            sta ($80,x)        ; $a6aa: 81 80     
            sta ($80,x)        ; $a6ac: 81 80     
            sta ($80,x)        ; $a6ae: 81 80     
            sta ($80,x)        ; $a6b0: 81 80     
            sta ($80,x)        ; $a6b2: 81 80     
            sta ($20,x)        ; $a6b4: 81 20     
            rts                ; $a6b6: 60        

;-------------------------------------------------------------------------------
            jsr __8081         ; $a6b7: 20 81 80  
            sta ($80,x)        ; $a6ba: 81 80     
            sta ($80,x)        ; $a6bc: 81 80     
            sta ($80,x)        ; $a6be: 81 80     
            sta ($80,x)        ; $a6c0: 81 80     
            sta ($80,x)        ; $a6c2: 81 80     
            sta ($80,x)        ; $a6c4: 81 80     
            sta ($80,x)        ; $a6c6: 81 80     
            sta ($80,x)        ; $a6c8: 81 80     
            sta ($80,x)        ; $a6ca: 81 80     
            sta ($80,x)        ; $a6cc: 81 80     
            sta ($80,x)        ; $a6ce: 81 80     
            sta ($80,x)        ; $a6d0: 81 80     
            sta ($80,x)        ; $a6d2: 81 80     
            sta ($80,x)        ; $a6d4: 81 80     
            sta ($80,x)        ; $a6d6: 81 80     
            jsr $0188          ; $a6d8: 20 88 01  
            .hex 5a            ; $a6db: 5a        Invalid Opcode - NOP 
            jsr $4e89          ; $a6dc: 20 89 4e  
            txs                ; $a6df: 9a        
            .hex 20            ; $a6e0: 20        Suspected data
__a6e1:     .hex 97 01         ; $a6e1: 97 01     Invalid Opcode - SAX $01,y
            .hex 5c 20 a8      ; $a6e3: 5c 20 a8  Invalid Opcode - NOP __a820,x
            .hex c3 9b         ; $a6e6: c3 9b     Invalid Opcode - DCP ($9b,x)
            jsr __c3b7         ; $a6e8: 20 b7 c3  
            .hex 9b            ; $a6eb: 9b        Invalid Opcode - TAS 
            and ($08,x)        ; $a6ec: 21 08     
            ora ($5b,x)        ; $a6ee: 01 5b     
            and ($09,x)        ; $a6f0: 21 09     
            lsr $219a          ; $a6f2: 4e 9a 21  
            .hex 17 01         ; $a6f5: 17 01     Invalid Opcode - SLO $01,x
            eor __ab20,x       ; $a6f7: 5d 20 ab  
__a6fa:     .hex 0b dc         ; $a6fa: 0b dc     Invalid Opcode - ANC #$dc
            inx                ; $a6fc: e8        
            .hex e7 ed         ; $a6fd: e7 ed     Invalid Opcode - ISC $ed
            .hex eb e2         ; $a6ff: eb e2     Invalid Opcode - SBC #$e2
            .hex db ee ed      ; $a701: db ee ed  Invalid Opcode - DCP __edee,y
            inx                ; $a704: e8        
            .hex eb 20         ; $a705: eb 20     Invalid Opcode - SBC #$20
            .hex e3 04         ; $a707: e3 04     Invalid Opcode - ISC ($04,x)
            rti                ; $a709: 40        

;-------------------------------------------------------------------------------
            .hex 42            ; $a70a: 42        Invalid Opcode - KIL 
            .hex 44 46         ; $a70b: 44 46     Invalid Opcode - NOP $46
            jsr $04f9          ; $a70d: 20 f9 04  
            rti                ; $a710: 40        

;-------------------------------------------------------------------------------
            .hex 42            ; $a711: 42        Invalid Opcode - KIL 
            .hex 44 46         ; $a712: 44 46     Invalid Opcode - NOP $46
            and ($23,x)        ; $a714: 21 23     
            cmp #$48           ; $a716: c9 48     
            and ($24,x)        ; $a718: 21 24     
            cmp #$49           ; $a71a: c9 49     
            and ($25,x)        ; $a71c: 21 25     
            cmp #$4a           ; $a71e: c9 4a     
            and ($26,x)        ; $a720: 21 26     
            cmp #$4b           ; $a722: c9 4b     
            .hex 22            ; $a724: 22        Invalid Opcode - KIL 
            .hex 43 04         ; $a725: 43 04     Invalid Opcode - SRE ($04,x)
            jmp $4e4d          ; $a727: 4c 4d 4e  

;-------------------------------------------------------------------------------
            .hex 4f 21 03      ; $a72a: 4f 21 03  Invalid Opcode - SRE $0321
            .hex 04 41         ; $a72d: 04 41     Invalid Opcode - NOP $41
            .hex 43 45         ; $a72f: 43 45     Invalid Opcode - SRE ($45,x)
            .hex 47 21         ; $a731: 47 21     Invalid Opcode - SRE $21
            .hex 19            ; $a733: 19        Suspected data
__a734:     .hex 04 41         ; $a734: 04 41     Invalid Opcode - NOP $41
            .hex 43 45         ; $a736: 43 45     Invalid Opcode - SRE ($45,x)
            .hex 47 21         ; $a738: 47 21     Invalid Opcode - SRE $21
            and $48c9,y        ; $a73a: 39 c9 48  
            and ($3a,x)        ; $a73d: 21 3a     
            cmp #$49           ; $a73f: c9 49     
            and ($3b,x)        ; $a741: 21 3b     
            .hex c9            ; $a743: c9        Suspected data
__a744:     lsr                ; $a744: 4a        
            and ($3c,x)        ; $a745: 21 3c     
            cmp #$4b           ; $a747: c9 4b     
            .hex 22            ; $a749: 22        Invalid Opcode - KIL 
            eor $4c04,y        ; $a74a: 59 04 4c  
            eor $4f4e          ; $a74d: 4d 4e 4f  
__a750:     and ($ca,x)        ; $a750: 21 ca     
            jmp $2154          ; $a752: 4c 54 21  

;-------------------------------------------------------------------------------
            nop                ; $a755: ea        
            jmp $2255          ; $a756: 4c 55 22  

;-------------------------------------------------------------------------------
            .hex 0b 0a         ; $a759: 0b 0a     Invalid Opcode - ANC #$0a
            bvc __a7af         ; $a75b: 50 52     
            bvc __a7b1         ; $a75d: 50 52     
            bvc __a7b3         ; $a75f: 50 52     
            bvc __a7b5         ; $a761: 50 52     
            bvc __a7b7         ; $a763: 50 52     
            .hex 22            ; $a765: 22        Invalid Opcode - KIL 
            .hex 2b 0a         ; $a766: 2b 0a     Invalid Opcode - ANC #$0a
            eor ($53),y        ; $a768: 51 53     
            eor ($53),y        ; $a76a: 51 53     
            eor ($53),y        ; $a76c: 51 53     
            eor ($53),y        ; $a76e: 51 53     
            eor ($53),y        ; $a770: 51 53     
            .hex 22            ; $a772: 22        Invalid Opcode - KIL 
            jmp $3a02          ; $a773: 4c 02 3a  

;-------------------------------------------------------------------------------
            .hex 3b 22 6c      ; $a776: 3b 22 6c  Invalid Opcode - RLA $6c22,y
            cmp $3c            ; $a779: c5 3c     
            .hex 22            ; $a77b: 22        Invalid Opcode - KIL 
            adc $3dc5          ; $a77c: 6d c5 3d  
            .hex 22            ; $a77f: 22        Invalid Opcode - KIL 
            .hex 52            ; $a780: 52        Invalid Opcode - KIL 
            .hex 02            ; $a781: 02        Invalid Opcode - KIL 
            .hex 3a            ; $a782: 3a        Invalid Opcode - NOP 
__a783:     .hex 3b 22 72      ; $a783: 3b 22 72  Invalid Opcode - RLA $7222,y
            cmp $3c            ; $a786: c5 3c     
            .hex 22            ; $a788: 22        Invalid Opcode - KIL 
            .hex 73 c5         ; $a789: 73 c5     Invalid Opcode - RRA ($c5),y
            and $2300,x        ; $a78b: 3d 00 23  
            brk                ; $a78e: 00        
            jsr $0200          ; $a78f: 20 00 02  
            php                ; $a792: 08        
            asl                ; $a793: 0a        
            .hex 0c 0e 04      ; $a794: 0c 0e 04  Invalid Opcode - NOP $040e
            asl $08            ; $a797: 06 08     
            asl                ; $a799: 0a        
            .hex 04 06         ; $a79a: 04 06     Invalid Opcode - NOP $06
            .hex 0c 0e 04      ; $a79c: 0c 0e 04  Invalid Opcode - NOP $040e
            asl $08            ; $a79f: 06 08     
            asl                ; $a7a1: 0a        
            brk                ; $a7a2: 00        
            .hex 02            ; $a7a3: 02        Invalid Opcode - KIL 
            .hex 0c 0e 0c      ; $a7a4: 0c 0e 0c  Invalid Opcode - NOP $0c0e
            asl $0200          ; $a7a7: 0e 00 02  
            .hex 04 06         ; $a7aa: 04 06     Invalid Opcode - NOP $06
            .hex 04 06         ; $a7ac: 04 06     Invalid Opcode - NOP $06
            php                ; $a7ae: 08        
__a7af:     asl                ; $a7af: 0a        
            .hex 23            ; $a7b0: 23        Suspected data
__a7b1:     .hex 20 20         ; $a7b1: 20 20     Suspected data
__a7b3:     ora ($03,x)        ; $a7b3: 01 03     
__a7b5:     ora #$0b           ; $a7b5: 09 0b     
__a7b7:     ora $050f          ; $a7b7: 0d 0f 05  
            .hex 07 09         ; $a7ba: 07 09     Invalid Opcode - SLO $09
            .hex 0b 05         ; $a7bc: 0b 05     Invalid Opcode - ANC #$05
            .hex 07 0d         ; $a7be: 07 0d     Invalid Opcode - SLO $0d
            .hex 0f 05 07      ; $a7c0: 0f 05 07  Invalid Opcode - SLO $0705
            ora #$0b           ; $a7c3: 09 0b     
            ora ($03,x)        ; $a7c5: 01 03     
            ora $0d0f          ; $a7c7: 0d 0f 0d  
            .hex 0f 01 03      ; $a7ca: 0f 01 03  Invalid Opcode - SLO $0301
            ora $07            ; $a7cd: 05 07     
            ora $07            ; $a7cf: 05 07     
            ora #$0b           ; $a7d1: 09 0b     
            .hex 27 00         ; $a7d3: 27 00     Invalid Opcode - RLA $00
            jsr $7674          ; $a7d5: 20 74 76  
            .hex 74 76         ; $a7d8: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7da: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7dc: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7de: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7e0: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7e2: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7e4: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7e6: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7e8: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7ea: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7ec: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7ee: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7f0: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7f2: 74 76     Invalid Opcode - NOP $76,x
            .hex 74 76         ; $a7f4: 74 76     Invalid Opcode - NOP $76,x
            .hex 27 20         ; $a7f6: 27 20     Invalid Opcode - RLA $20
            jsr $7775          ; $a7f8: 20 75 77  
            adc $77,x          ; $a7fb: 75 77     
            adc $77,x          ; $a7fd: 75 77     
            adc $77,x          ; $a7ff: 75 77     
            adc $77,x          ; $a801: 75 77     
            adc $77,x          ; $a803: 75 77     
            adc $77,x          ; $a805: 75 77     
            adc $77,x          ; $a807: 75 77     
            adc $77,x          ; $a809: 75 77     
            adc $77,x          ; $a80b: 75 77     
            adc $77,x          ; $a80d: 75 77     
            adc $77,x          ; $a80f: 75 77     
            adc $77,x          ; $a811: 75 77     
            adc $77,x          ; $a813: 75 77     
            adc $77,x          ; $a815: 75 77     
            adc $77,x          ; $a817: 75 77     
            .hex 23 40         ; $a819: 23 40     Invalid Opcode - RLA ($40,x)
            jsr __8180         ; $a81b: 20 80 81  
            .hex 80 81         ; $a81e: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a820: 80 81     Invalid Opcode - NOP #$81
            .hex 80            ; $a822: 80        Suspected data
__a823:     sta ($80,x)        ; $a823: 81 80     
            sta ($80,x)        ; $a825: 81 80     
            sta ($80,x)        ; $a827: 81 80     
            sta ($80,x)        ; $a829: 81 80     
            sta ($80,x)        ; $a82b: 81 80     
            sta ($80,x)        ; $a82d: 81 80     
            sta ($80,x)        ; $a82f: 81 80     
            sta ($80,x)        ; $a831: 81 80     
            sta ($80,x)        ; $a833: 81 80     
            sta ($80,x)        ; $a835: 81 80     
            sta ($80,x)        ; $a837: 81 80     
            sta ($80,x)        ; $a839: 81 80     
            sta ($23,x)        ; $a83b: 81 23     
            rts                ; $a83d: 60        

;-------------------------------------------------------------------------------
            jsr __8081         ; $a83e: 20 81 80  
            sta ($80,x)        ; $a841: 81 80     
            sta ($80,x)        ; $a843: 81 80     
            sta ($80,x)        ; $a845: 81 80     
            sta ($80,x)        ; $a847: 81 80     
            sta ($80,x)        ; $a849: 81 80     
            sta ($80,x)        ; $a84b: 81 80     
            sta ($80,x)        ; $a84d: 81 80     
            sta ($80,x)        ; $a84f: 81 80     
            sta ($80,x)        ; $a851: 81 80     
            sta ($80,x)        ; $a853: 81 80     
            sta ($80,x)        ; $a855: 81 80     
            sta ($80,x)        ; $a857: 81 80     
            sta ($80,x)        ; $a859: 81 80     
            sta ($80,x)        ; $a85b: 81 80     
            sta ($80,x)        ; $a85d: 81 80     
            .hex 23 80         ; $a85f: 23 80     Invalid Opcode - RLA ($80,x)
            jsr __8180         ; $a861: 20 80 81  
            .hex 80 81         ; $a864: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a866: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a868: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a86a: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a86c: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a86e: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a870: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a872: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a874: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a876: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a878: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a87a: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a87c: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a87e: 80 81     Invalid Opcode - NOP #$81
__a880:     .hex 80 81         ; $a880: 80 81     Invalid Opcode - NOP #$81
            .hex 23 a0         ; $a882: 23 a0     Invalid Opcode - RLA ($a0,x)
            jsr __8081         ; $a884: 20 81 80  
            sta ($80,x)        ; $a887: 81 80     
            sta ($80,x)        ; $a889: 81 80     
            sta ($80,x)        ; $a88b: 81 80     
            sta ($80,x)        ; $a88d: 81 80     
            sta ($80,x)        ; $a88f: 81 80     
            sta ($80,x)        ; $a891: 81 80     
            sta ($80,x)        ; $a893: 81 80     
            sta ($80,x)        ; $a895: 81 80     
            sta ($80,x)        ; $a897: 81 80     
            .hex 81            ; $a899: 81        Suspected data
__a89a:     .hex 80 81         ; $a89a: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a89c: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a89e: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8a0: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8a2: 80 81     Invalid Opcode - NOP #$81
            .hex 80 27         ; $a8a4: 80 27     Invalid Opcode - NOP #$27
            rti                ; $a8a6: 40        

;-------------------------------------------------------------------------------
            jsr __8180         ; $a8a7: 20 80 81  
            .hex 80 81         ; $a8aa: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8ac: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8ae: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8b0: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8b2: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8b4: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8b6: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8b8: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8ba: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8bc: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8be: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8c0: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8c2: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8c4: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8c6: 80 81     Invalid Opcode - NOP #$81
            .hex 27 60         ; $a8c8: 27 60     Invalid Opcode - RLA $60
            jsr __8081         ; $a8ca: 20 81 80  
__a8cd:     sta ($80,x)        ; $a8cd: 81 80     
            sta ($80,x)        ; $a8cf: 81 80     
            sta ($80,x)        ; $a8d1: 81 80     
            sta ($80,x)        ; $a8d3: 81 80     
            sta ($80,x)        ; $a8d5: 81 80     
            sta ($80,x)        ; $a8d7: 81 80     
            sta ($80,x)        ; $a8d9: 81 80     
            sta ($80,x)        ; $a8db: 81 80     
            sta ($80,x)        ; $a8dd: 81 80     
            sta ($80,x)        ; $a8df: 81 80     
            sta ($80,x)        ; $a8e1: 81 80     
            sta ($80,x)        ; $a8e3: 81 80     
            sta ($80,x)        ; $a8e5: 81 80     
            sta ($80,x)        ; $a8e7: 81 80     
            .hex 81            ; $a8e9: 81        Suspected data
__a8ea:     .hex 80 27         ; $a8ea: 80 27     Invalid Opcode - NOP #$27
            .hex 80 20         ; $a8ec: 80 20     Invalid Opcode - NOP #$20
            .hex 80 81         ; $a8ee: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8f0: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8f2: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8f4: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8f6: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8f8: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8fa: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8fc: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a8fe: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a900: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a902: 80 81     Invalid Opcode - NOP #$81
__a904:     .hex 80 81         ; $a904: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a906: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a908: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a90a: 80 81     Invalid Opcode - NOP #$81
            .hex 80 81         ; $a90c: 80 81     Invalid Opcode - NOP #$81
            .hex 27 a0         ; $a90e: 27 a0     Invalid Opcode - RLA $a0
            jsr __8081         ; $a910: 20 81 80  
            sta ($80,x)        ; $a913: 81 80     
            sta ($80,x)        ; $a915: 81 80     
            sta ($80,x)        ; $a917: 81 80     
            sta ($80,x)        ; $a919: 81 80     
            sta ($80,x)        ; $a91b: 81 80     
            sta ($80,x)        ; $a91d: 81 80     
            sta ($80,x)        ; $a91f: 81 80     
            sta ($80,x)        ; $a921: 81 80     
            sta ($80,x)        ; $a923: 81 80     
            sta ($80,x)        ; $a925: 81 80     
            sta ($80,x)        ; $a927: 81 80     
            sta ($80,x)        ; $a929: 81 80     
            sta ($80,x)        ; $a92b: 81 80     
            sta ($80,x)        ; $a92d: 81 80     
            sta ($80,x)        ; $a92f: 81 80     
            .hex 23 c0         ; $a931: 23 c0     Invalid Opcode - RLA ($c0,x)
            pha                ; $a933: 48        
            tax                ; $a934: aa        
            .hex 23 c8         ; $a935: 23 c8     Invalid Opcode - RLA ($c8,x)
            php                ; $a937: 08        
            ora $05,x          ; $a938: 15 05     
            .hex ff ff ff      ; $a93a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff 15 45      ; $a93d: ff 15 45  Invalid Opcode - ISC $4515,x
            .hex 23 d0         ; $a940: 23 d0     Invalid Opcode - RLA ($d0,x)
            jsr $0031          ; $a942: 20 31 00  
            .hex ff ff ff      ; $a945: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff 00 44      ; $a948: ff 00 44  Invalid Opcode - ISC $4400,x
            .hex 33 00         ; $a94b: 33 00     Invalid Opcode - RLA ($00),y
            ldx $a5            ; $a94d: a6 a5     
            lda $a6            ; $a94f: a5 a6     
            brk                ; $a951: 00        
            .hex 44 f3         ; $a952: 44 f3     Invalid Opcode - NOP $f3
            beq __a9af         ; $a954: f0 59     
            tax                ; $a956: aa        
            tax                ; $a957: aa        
            stx $f0,y          ; $a958: 96 f0     
            .hex 74 dd         ; $a95a: 74 dd     Invalid Opcode - NOP $dd,x
            .hex ff 55 aa      ; $a95c: ff 55 aa  Invalid Opcode - ISC __aa55,x
            tax                ; $a95f: aa        
            sta $55,x          ; $a960: 95 55     
            eor $23,x          ; $a962: 55 23     
            beq __a9ae         ; $a964: f0 48     
            lda $23            ; $a966: a5 23     
            sed                ; $a968: f8        
            pha                ; $a969: 48        
            asl                ; $a96a: 0a        
            .hex 27 f0         ; $a96b: 27 f0     Invalid Opcode - RLA $f0
            pha                ; $a96d: 48        
            lda $27            ; $a96e: a5 27     
            sed                ; $a970: f8        
            pha                ; $a971: 48        
            asl                ; $a972: 0a        
            brk                ; $a973: 00        
            .hex 23 00         ; $a974: 23 00     Invalid Opcode - RLA ($00,x)
            jsr $7270          ; $a976: 20 70 72  
            bvs __a9ed         ; $a979: 70 72     
            bvs __a9ef         ; $a97b: 70 72     
            bvs __a9f1         ; $a97d: 70 72     
            bvs __a9f3         ; $a97f: 70 72     
            bvs __a9f5         ; $a981: 70 72     
            .hex 70            ; $a983: 70        Suspected data
__a984:     .hex 72            ; $a984: 72        Invalid Opcode - KIL 
            bvs __a9f9         ; $a985: 70 72     
            bvs __a9fb         ; $a987: 70 72     
            bvs __a9fd         ; $a989: 70 72     
            bvs __a9ff         ; $a98b: 70 72     
            bvs __aa01         ; $a98d: 70 72     
            bvs __aa03         ; $a98f: 70 72     
            bvs __aa05         ; $a991: 70 72     
            bvs __aa07         ; $a993: 70 72     
            bvs __aa09         ; $a995: 70 72     
            .hex 23 20         ; $a997: 23 20     Invalid Opcode - RLA ($20,x)
            jsr $7371          ; $a999: 20 71 73  
            adc ($73),y        ; $a99c: 71 73     
            adc ($73),y        ; $a99e: 71 73     
            adc ($73),y        ; $a9a0: 71 73     
            adc ($73),y        ; $a9a2: 71 73     
            adc ($73),y        ; $a9a4: 71 73     
            adc ($73),y        ; $a9a6: 71 73     
            adc ($73),y        ; $a9a8: 71 73     
            adc ($73),y        ; $a9aa: 71 73     
            adc ($73),y        ; $a9ac: 71 73     
__a9ae:     .hex 71            ; $a9ae: 71        Suspected data
__a9af:     .hex 73 71         ; $a9af: 73 71     Invalid Opcode - RRA ($71),y
            .hex 73 71         ; $a9b1: 73 71     Invalid Opcode - RRA ($71),y
            .hex 73 71         ; $a9b3: 73 71     Invalid Opcode - RRA ($71),y
            .hex 73 71         ; $a9b5: 73 71     Invalid Opcode - RRA ($71),y
            .hex 73 71         ; $a9b7: 73 71     Invalid Opcode - RRA ($71),y
            .hex 73 00         ; $a9b9: 73 00     Invalid Opcode - RRA ($00),y
            and ($ac,x)        ; $a9bb: 21 ac     
__a9bd:     .hex 07 ed         ; $a9bd: 07 ed     Invalid Opcode - SLO $ed
            sbc ($de,x)        ; $a9bf: e1 de     
            .hex fb de e7      ; $a9c1: fb de e7  Invalid Opcode - ISC __e7de,y
            cmp $3f00,x        ; $a9c4: dd 00 3f  
            brk                ; $a9c7: 00        
            jsr $3001          ; $a9c8: 20 01 30  
            and ($0f,x)        ; $a9cb: 21 0f     
            ora ($30,x)        ; $a9cd: 01 30     
            asl $0f,x          ; $a9cf: 16 0f     
            ora ($28,x)        ; $a9d1: 01 28     
            clc                ; $a9d3: 18        
            .hex 0f 01 30      ; $a9d4: 0f 01 30  Invalid Opcode - SLO $3001
            bmi __a9da         ; $a9d7: 30 01     
            .hex 01            ; $a9d9: 01        Suspected data
__a9da:     .hex 27 16         ; $a9da: 27 16     Invalid Opcode - RLA $16
            .hex 0f 01 37      ; $a9dc: 0f 01 37  Invalid Opcode - SLO $3701
            rol                ; $a9df: 2a        
            .hex 0f 01 27      ; $a9e0: 0f 01 27  Invalid Opcode - SLO $2701
            bmi __a9f4         ; $a9e3: 30 0f     
            ora ($36,x)        ; $a9e5: 01 36     
            .hex 32            ; $a9e7: 32        Invalid Opcode - KIL 
            .hex 0f 00 3f      ; $a9e8: 0f 00 3f  Invalid Opcode - SLO $3f00
            brk                ; $a9eb: 00        
            .hex 20            ; $a9ec: 20        Suspected data
__a9ed:     .hex 0f 10         ; $a9ed: 0f 10     Suspected data
__a9ef:     brk                ; $a9ef: 00        
            .hex 0f            ; $a9f0: 0f        Suspected data
__a9f1:     .hex 0f 10         ; $a9f1: 0f 10     Suspected data
__a9f3:     brk                ; $a9f3: 00        
__a9f4:     .hex 0f            ; $a9f4: 0f        Suspected data
__a9f5:     .hex 0f 10         ; $a9f5: 0f 10     Suspected data
__a9f7:     brk                ; $a9f7: 00        
            .hex 0f            ; $a9f8: 0f        Suspected data
__a9f9:     .hex 0f 10         ; $a9f9: 0f 10     Suspected data
__a9fb:     brk                ; $a9fb: 00        
__a9fc:     .hex 0f            ; $a9fc: 0f        Suspected data
__a9fd:     .hex 0f            ; $a9fd: 0f        Suspected data
__a9fe:     .hex 10            ; $a9fe: 10        Suspected data
__a9ff:     brk                ; $a9ff: 00        
            .hex 0f            ; $aa00: 0f        Suspected data
__aa01:     .hex 0f 10         ; $aa01: 0f 10     Suspected data
__aa03:     brk                ; $aa03: 00        
            .hex 0f            ; $aa04: 0f        Suspected data
__aa05:     .hex 0f 10         ; $aa05: 0f 10     Suspected data
__aa07:     brk                ; $aa07: 00        
            .hex 0f            ; $aa08: 0f        Suspected data
__aa09:     .hex 0f 10 00      ; $aa09: 0f 10 00  Bad Addr Mode - SLO $0010
            .hex 0f 00 3f      ; $aa0c: 0f 00 3f  Invalid Opcode - SLO $3f00
            brk                ; $aa0f: 00        
            jsr $000f          ; $aa10: 20 0f 00  
            .hex 0f 0f 0f      ; $aa13: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            brk                ; $aa16: 00        
            .hex 0f 0f 0f      ; $aa17: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            brk                ; $aa1a: 00        
            .hex 0f            ; $aa1b: 0f        Suspected data
__aa1c:     .hex 0f 0f 00      ; $aa1c: 0f 0f 00  Bad Addr Mode - SLO $000f
            .hex 0f 0f 0f      ; $aa1f: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            brk                ; $aa22: 00        
            .hex 0f 0f 0f      ; $aa23: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            brk                ; $aa26: 00        
            .hex 0f 0f 0f      ; $aa27: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            brk                ; $aa2a: 00        
            .hex 0f 0f 0f      ; $aa2b: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            brk                ; $aa2e: 00        
            .hex 0f 0f 00      ; $aa2f: 0f 0f 00  Bad Addr Mode - SLO $000f
__aa32:     .hex 04 05         ; $aa32: 04 05     Invalid Opcode - NOP $05
            asl $8c            ; $aa34: 06 8c     
            .hex fc 20 94      ; $aa36: fc 20 94  Invalid Opcode - NOP __9420,x
__aa39:     .hex 4f 61 20      ; $aa39: 4f 61 20  Invalid Opcode - SRE $2061
            bvc __aa8d         ; $aa3c: 50 4f     
__aa3e:     .hex 63 20         ; $aa3e: 63 20     Invalid Opcode - RRA ($20,x)
            cli                ; $aa40: 58        
            .hex 5f 65 20      ; $aa41: 5f 65 20  Invalid Opcode - SRE $2065,x
            bvc __aaa5         ; $aa44: 50 5f     
            .hex 67 20         ; $aa46: 67 20     Invalid Opcode - RRA $20
            cli                ; $aa48: 58        
            .hex 4f 69 21      ; $aa49: 4f 69 21  Invalid Opcode - SRE $2169
            pla                ; $aa4c: 68        
            .hex 4f 6b 21      ; $aa4d: 4f 6b 21  Invalid Opcode - SRE $216b
            bvs __aab1         ; $aa50: 70 5f     
            adc $6821          ; $aa52: 6d 21 68  
            .hex 5f 6f 21      ; $aa55: 5f 6f 21  Invalid Opcode - SRE $216f,x
            bvs __aaa9         ; $aa58: 70 4f     
            .hex 83 22         ; $aa5a: 83 22     Invalid Opcode - SAX ($22,x)
            dey                ; $aa5c: 88        
            .hex 4f 83 62      ; $aa5d: 4f 83 62  Invalid Opcode - SRE $6283
            bcc __aac1         ; $aa60: 90 5f     
            .hex 87 22         ; $aa62: 87 22     Invalid Opcode - SAX $22
            dey                ; $aa64: 88        
            .hex 5f 87 62      ; $aa65: 5f 87 62  Invalid Opcode - SRE $6287,x
            bcc __aab9         ; $aa68: 90 4f     
            .hex 8b 23         ; $aa6a: 8b 23     Invalid Opcode - XAA #$23
            ldy #$4f           ; $aa6c: a0 4f     
            sta __a823         ; $aa6e: 8d 23 a8  
            .hex 5f 8f 23      ; $aa71: 5f 8f 23  Invalid Opcode - SRE $238f,x
            ldy #$5f           ; $aa74: a0 5f     
            sta ($23),y        ; $aa76: 91 23     
            tay                ; $aa78: a8        
            jsr __a21a         ; $aa79: 20 1a a2  
            lda #$00           ; $aa7c: a9 00     
            jsr __ffa0         ; $aa7e: 20 a0 ff  
            jsr __ec8a         ; $aa81: 20 8a ec  
            lda #$40           ; $aa84: a9 40     
            sta $0100          ; $aa86: 8d 00 01  
            jsr __abbc         ; $aa89: 20 bc ab  
            .hex 20            ; $aa8c: 20        Suspected data
__aa8d:     .hex 22            ; $aa8d: 22        Invalid Opcode - KIL 
            ldx #$a9           ; $aa8e: a2 a9     
            .hex 02            ; $aa90: 02        Invalid Opcode - KIL 
            sta $11            ; $aa91: 85 11     
            jsr __a222         ; $aa93: 20 22 a2  
            lda #$03           ; $aa96: a9 03     
            sta $11            ; $aa98: 85 11     
            jsr __a222         ; $aa9a: 20 22 a2  
            jsr __ad40         ; $aa9d: 20 40 ad  
            jsr __a222         ; $aaa0: 20 22 a2  
            lda #$01           ; $aaa3: a9 01     
__aaa5:     jsr __ffa0         ; $aaa5: 20 a0 ff  
            .hex a0            ; $aaa8: a0        Suspected data
__aaa9:     .hex 03            ; $aaa9: 03        Suspected data
__aaaa:     .hex b9            ; $aaaa: b9        Suspected data
__aaab:     .hex 35            ; $aaab: 35        Suspected data
__aaac:     tax                ; $aaac: aa        
__aaad:     sta $0200,y        ; $aaad: 99 00 02  
            dey                ; $aab0: 88        
__aab1:     bpl __aaaa         ; $aab1: 10 f7     
            lda #$00           ; $aab3: a9 00     
            sta $f3            ; $aab5: 85 f3     
            sta $e6            ; $aab7: 85 e6     
__aab9:     ldy #$3f           ; $aab9: a0 3f     
__aabb:     lda __aa39,y       ; $aabb: b9 39 aa  
            sta $0210,y        ; $aabe: 99 10 02  
__aac1:     dey                ; $aac1: 88        
            bpl __aabb         ; $aac2: 10 f7     
            lda #$ff           ; $aac4: a9 ff     
            sta $14            ; $aac6: 85 14     
            lda #$a0           ; $aac8: a9 a0     
            sta $28            ; $aaca: 85 28     
            lda #$08           ; $aacc: a9 08     
            sta $3c            ; $aace: 85 3c     
            lda #$01           ; $aad0: a9 01     
            sta $ec            ; $aad2: 85 ec     
__aad4:     jsr __a21e         ; $aad4: 20 1e a2  
            inc $f3            ; $aad7: e6 f3     
            inc $10            ; $aad9: e6 10     
            jsr __adf1         ; $aadb: 20 f1 ad  
            jsr __abcc         ; $aade: 20 cc ab  
            lda $e6            ; $aae1: a5 e6     
            cmp #$03           ; $aae3: c9 03     
            bcs __ab20         ; $aae5: b0 39     
__aae7:     bit $2002          ; $aae7: 2c 02 20  
            bvs __aae7         ; $aaea: 70 fb     
__aaec:     bit $2002          ; $aaec: 2c 02 20  
            bvc __aaec         ; $aaef: 50 fb     
            ldx #$02           ; $aaf1: a2 02     
__aaf3:     ldy #$00           ; $aaf3: a0 00     
__aaf5:     lda $00            ; $aaf5: a5 00     
            lda $00            ; $aaf7: a5 00     
            dey                ; $aaf9: 88        
            bne __aaf5         ; $aafa: d0 f9     
            dex                ; $aafc: ca        
            bne __aaf3         ; $aafd: d0 f4     
            lda $2002          ; $aaff: ad 02 20  
            lda $f2            ; $ab02: a5 f2     
            sta $2005          ; $ab04: 8d 05 20  
            lda #$00           ; $ab07: a9 00     
            sta $2005          ; $ab09: 8d 05 20  
            lda $f3            ; $ab0c: a5 f3     
            cmp #$0a           ; $ab0e: c9 0a     
            bcc __ab1d         ; $ab10: 90 0b     
            lda #$00           ; $ab12: a9 00     
            sta $f3            ; $ab14: 85 f3     
            lda $f2            ; $ab16: a5 f2     
            sec                ; $ab18: 38        
            sbc #$30           ; $ab19: e9 30     
            sta $f2            ; $ab1b: 85 f2     
__ab1d:     jmp __aad4         ; $ab1d: 4c d4 aa  

;-------------------------------------------------------------------------------
__ab20:     lda #$00           ; $ab20: a9 00     
            jsr __ffa0         ; $ab22: 20 a0 ff  
            lda #$01           ; $ab25: a9 01     
            sta $f2            ; $ab27: 85 f2     
            lsr                ; $ab29: 4a        
            sta $f3            ; $ab2a: 85 f3     
            sta $07            ; $ab2c: 85 07     
            lda #$07           ; $ab2e: a9 07     
            sta $11            ; $ab30: 85 11     
__ab32:     jsr __a222         ; $ab32: 20 22 a2  
            jsr __abbc         ; $ab35: 20 bc ab  
            inc $f3            ; $ab38: e6 f3     
            jsr __adf1         ; $ab3a: 20 f1 ad  
            jsr __ad0c         ; $ab3d: 20 0c ad  
__ab40:     bit $2002          ; $ab40: 2c 02 20  
            bvs __ab40         ; $ab43: 70 fb     
__ab45:     bit $2002          ; $ab45: 2c 02 20  
            bvc __ab45         ; $ab48: 50 fb     
            ldx #$02           ; $ab4a: a2 02     
__ab4c:     ldy #$00           ; $ab4c: a0 00     
__ab4e:     lda $00            ; $ab4e: a5 00     
            lda $00            ; $ab50: a5 00     
            dey                ; $ab52: 88        
            bne __ab4e         ; $ab53: d0 f9     
            dex                ; $ab55: ca        
            bne __ab4c         ; $ab56: d0 f4     
            lda #$b0           ; $ab58: a9 b0     
            ora $f2            ; $ab5a: 05 f2     
            sta $ff            ; $ab5c: 85 ff     
            sta $2000          ; $ab5e: 8d 00 20  
            lda $2002          ; $ab61: ad 02 20  
            lda #$00           ; $ab64: a9 00     
            sta $2005          ; $ab66: 8d 05 20  
            lda #$00           ; $ab69: a9 00     
            sta $2005          ; $ab6b: 8d 05 20  
            lda $f3            ; $ab6e: a5 f3     
            cmp #$14           ; $ab70: c9 14     
            bcc __ab80         ; $ab72: 90 0c     
            lda #$00           ; $ab74: a9 00     
            sta $f3            ; $ab76: 85 f3     
            lda $f2            ; $ab78: a5 f2     
            eor #$01           ; $ab7a: 49 01     
            sta $f2            ; $ab7c: 85 f2     
            inc $07            ; $ab7e: e6 07     
__ab80:     lda $07            ; $ab80: a5 07     
            cmp #$29           ; $ab82: c9 29     
            bcc __ab32         ; $ab84: 90 ac     
            jsr __ab90         ; $ab86: 20 90 ab  
            lda $e6            ; $ab89: a5 e6     
            cmp #$04           ; $ab8b: c9 04     
            bcc __ab32         ; $ab8d: 90 a3     
            rts                ; $ab8f: 60        

;-------------------------------------------------------------------------------
__ab90:     lda $10            ; $ab90: a5 10     
            and #$03           ; $ab92: 29 03     
            bne __aba6         ; $ab94: d0 10     
            inc $e5            ; $ab96: e6 e5     
            ldy $e5            ; $ab98: a4 e5     
            cpy #$03           ; $ab9a: c0 03     
            bcs __aba4         ; $ab9c: b0 06     
            lda __aa32,y       ; $ab9e: b9 32 aa  
            sta $11            ; $aba1: 85 11     
            rts                ; $aba3: 60        

;-------------------------------------------------------------------------------
__aba4:     inc $e6            ; $aba4: e6 e6     
__aba6:     rts                ; $aba6: 60        

;-------------------------------------------------------------------------------
            lda $10            ; $aba7: a5 10     
            and #$03           ; $aba9: 29 03     
            bne __aba6         ; $abab: d0 f9     
            dec $e5            ; $abad: c6 e5     
            ldy $e5            ; $abaf: a4 e5     
            lda __aa32,y       ; $abb1: b9 32 aa  
            sta $11            ; $abb4: 85 11     
            tya                ; $abb6: 98        
            bne __aba6         ; $abb7: d0 ed     
            inc $e6            ; $abb9: e6 e6     
            rts                ; $abbb: 60        

;-------------------------------------------------------------------------------
__abbc:     lda #$b0           ; $abbc: a9 b0     
            sta $ff            ; $abbe: 85 ff     
            sta $2000          ; $abc0: 8d 00 20  
            rts                ; $abc3: 60        

;-------------------------------------------------------------------------------
            lda #$30           ; $abc4: a9 30     
            sta $2000          ; $abc6: 8d 00 20  
            sta $ff            ; $abc9: 85 ff     
            rts                ; $abcb: 60        

;-------------------------------------------------------------------------------
__abcc:     .hex 20 0c         ; $abcc: 20 0c     Suspected data
__abce:     lda __e6a5         ; $abce: ad a5 e6  
            jsr __e125         ; $abd1: 20 25 e1  
            .hex a7 ab         ; $abd4: a7 ab     Invalid Opcode - LAX $ab
            asl                ; $abd6: 0a        
__abd7:     ldy __ac87         ; $abd7: ac 87 ac  
__abda:     cpy #$c8           ; $abda: c0 c8     
            clv                ; $abdc: b8        
            clv                ; $abdd: b8        
            iny                ; $abde: c8        
            .hex c0            ; $abdf: c0        Suspected data
__abe0:     cpy #$08           ; $abe0: c0 08     
            cpx #$f0           ; $abe2: e0 f0     
            bne __abce         ; $abe4: d0 e8     
__abe6:     ora ($13),y        ; $abe6: 11 13     
            ora $211b,y        ; $abe8: 19 1b 21  
            .hex 23 15         ; $abeb: 23 15     Invalid Opcode - RLA ($15,x)
            .hex 17            ; $abed: 17        Suspected data
__abee:     ora $251f,x        ; $abee: 1d 1f 25  
            .hex 27            ; $abf1: 27        Suspected data
__abf2:     brk                ; $abf2: 00        
            php                ; $abf3: 08        
            bpl __ac0e         ; $abf4: 10 18     
            jsr $0028          ; $abf6: 20 28 00  
            php                ; $abf9: 08        
            bpl __ac14         ; $abfa: 10 18     
            .hex 20 28         ; $abfc: 20 28     Suspected data
__abfe:     brk                ; $abfe: 00        
            brk                ; $abff: 00        
            brk                ; $ac00: 00        
            brk                ; $ac01: 00        
            brk                ; $ac02: 00        
            brk                ; $ac03: 00        
            bpl __ac16         ; $ac04: 10 10     
            bpl __ac18         ; $ac06: 10 10     
            bpl __ac1a         ; $ac08: 10 10     
            jsr __8a50         ; $ac0a: 20 50 8a  
            .hex a5            ; $ac0d: a5        Suspected data
__ac0e:     .hex 14 c9         ; $ac0e: 14 c9     Invalid Opcode - NOP $c9,x
            ora ($d0,x)        ; $ac10: 01 d0     
            bit $a5            ; $ac12: 24 a5     
__ac14:     plp                ; $ac14: 28        
            .hex c9            ; $ac15: c9        Suspected data
__ac16:     .hex 20 90         ; $ac16: 20 90     Suspected data
__ac18:     .hex 1e ee         ; $ac18: 1e ee     Suspected data
__ac1a:     inc $00            ; $ac1a: e6 00     
            lda #$a0           ; $ac1c: a9 a0     
            sta $10            ; $ac1e: 85 10     
            ldx #$05           ; $ac20: a2 05     
__ac22:     lda #$20           ; $ac22: a9 20     
            .hex 95            ; $ac24: 95        Suspected data
__ac25:     .hex 29            ; $ac25: 29        Suspected data
__ac26:     lda #$a8           ; $ac26: a9 a8     
__ac28:     sta $33,x          ; $ac28: 95 33     
            lda __abda,x       ; $ac2a: bd da ab  
            sta $3d,x          ; $ac2d: 95 3d     
            lda __abe0,x       ; $ac2f: bd e0 ab  
            sta $47,x          ; $ac32: 95 47     
            dex                ; $ac34: ca        
            bpl __ac22         ; $ac35: 10 eb     
            ldy #$a0           ; $ac37: a0 a0     
            lda $10            ; $ac39: a5 10     
            and #$38           ; $ac3b: 29 38     
            bne __ac40         ; $ac3d: d0 01     
            dey                ; $ac3f: 88        
__ac40:     and #$08           ; $ac40: 29 08     
            bne __ac45         ; $ac42: d0 01     
            dey                ; $ac44: 88        
__ac45:     sty $32            ; $ac45: 84 32     
            ldx #$0b           ; $ac47: a2 0b     
            ldy #$70           ; $ac49: a0 70     
__ac4b:     lda $32            ; $ac4b: a5 32     
            clc                ; $ac4d: 18        
            adc __abfe,x       ; $ac4e: 7d fe ab  
            sta $0200,y        ; $ac51: 99 00 02  
            lda __abe6,x       ; $ac54: bd e6 ab  
            sta $0201,y        ; $ac57: 99 01 02  
            lda #$01           ; $ac5a: a9 01     
            sta $0202,y        ; $ac5c: 99 02 02  
            lda $28            ; $ac5f: a5 28     
            clc                ; $ac61: 18        
            adc __abf2,x       ; $ac62: 7d f2 ab  
            sta $0203,y        ; $ac65: 99 03 02  
            lda $14            ; $ac68: a5 14     
__ac6a:     adc #$00           ; $ac6a: 69 00     
            beq __ac73         ; $ac6c: f0 05     
            lda #$f0           ; $ac6e: a9 f0     
            sta $0200,y        ; $ac70: 99 00 02  
__ac73:     iny                ; $ac73: c8        
            iny                ; $ac74: c8        
            iny                ; $ac75: c8        
            iny                ; $ac76: c8        
__ac77:     dex                ; $ac77: ca        
            bpl __ac4b         ; $ac78: 10 d1     
            rts                ; $ac7a: 60        

;-------------------------------------------------------------------------------
__ac7b:     and $3735,y        ; $ac7b: 39 35 37  
            .hex 35            ; $ac7e: 35        Suspected data
__ac7f:     .hex 37 39         ; $ac7f: 37 39     Invalid Opcode - RLA $39,x
__ac81:     brk                ; $ac81: 00        
            .hex 06            ; $ac82: 06        Suspected data
__ac83:     .hex 03 09         ; $ac83: 03 09     Invalid Opcode - SLO ($09,x)
__ac85:     .hex 0f 0c         ; $ac85: 0f 0c     Suspected data
__ac87:     lda $10            ; $ac87: a5 10     
__ac89:     bne __aca4         ; $ac89: d0 19     
            sta $040e          ; $ac8b: 8d 0e 04  
            sta $0418          ; $ac8e: 8d 18 04  
            sta $2f            ; $ac91: 85 2f     
            sta $10            ; $ac93: 85 10     
            lda #$6f           ; $ac95: a9 6f     
            sta $39            ; $ac97: 85 39     
            lda #$e6           ; $ac99: a9 e6     
            sta $43            ; $ac9b: 85 43     
            lda #$da           ; $ac9d: a9 da     
            sta $4d            ; $ac9f: 85 4d     
            .hex ee e6 00      ; $aca1: ee e6 00  Bad Addr Mode - INC $00e6
__aca4:     ldx #$05           ; $aca4: a2 05     
__aca6:     stx $12            ; $aca6: 86 12     
            jsr __b90c         ; $aca8: 20 0c b9  
            .hex 20            ; $acab: 20        Suspected data
__acac:     .hex 07 b9         ; $acac: 07 b9     Invalid Opcode - SLO $b9
            ldy #$f0           ; $acae: a0 f0     
            lda $10            ; $acb0: a5 10     
            beq __acc1         ; $acb2: f0 0d     
            and #$0f           ; $acb4: 29 0f     
            cmp __ac81,x       ; $acb6: dd 81 ac  
            bne __acc3         ; $acb9: d0 08     
            lda #$20           ; $acbb: a9 20     
            sta $29,x          ; $acbd: 95 29     
            ldy #$a8           ; $acbf: a0 a8     
__acc1:     sty $33,x          ; $acc1: 94 33     
__acc3:     txa                ; $acc3: 8a        
            asl                ; $acc4: 0a        
            asl                ; $acc5: 0a        
            tay                ; $acc6: a8        
            lda $29,x          ; $acc7: b5 29     
            cmp #$80           ; $acc9: c9 80     
            bcs __acd1         ; $accb: b0 04     
            lda #$f0           ; $accd: a9 f0     
            bne __acd6         ; $accf: d0 05     
__acd1:     sta $0273,y        ; $acd1: 99 73 02  
            lda $33,x          ; $acd4: b5 33     
__acd6:     sta $0270,y        ; $acd6: 99 70 02  
            lda __ac7b,x       ; $acd9: bd 7b ac  
            sta $0271,y        ; $acdc: 99 71 02  
            lda #$00           ; $acdf: a9 00     
            sta $0272,y        ; $ace1: 99 72 02  
            dex                ; $ace4: ca        
            bpl __aca6         ; $ace5: 10 bf     
            rts                ; $ace7: 60        

;-------------------------------------------------------------------------------
__ace8:     adc ($61,x)        ; $ace8: 61 61     
            .hex 63 93         ; $acea: 63 93     Invalid Opcode - RRA ($93,x)
            adc $65            ; $acec: 65 65     
            .hex 67 67         ; $acee: 67 67     Invalid Opcode - RRA $67
            adc #$69           ; $acf0: 69 69     
            sta $6b,x          ; $acf2: 95 6b     
            adc __976d         ; $acf4: 6d 6d 97  
            .hex 6f 83 85      ; $acf7: 6f 83 85  Invalid Opcode - RRA __8583
            .hex 83 85         ; $acfa: 83 85     Invalid Opcode - SAX ($85,x)
            .hex 87 89         ; $acfc: 87 89     Invalid Opcode - SAX $89
            .hex 87 89         ; $acfe: 87 89     Invalid Opcode - SAX $89
__ad00:     .hex 8b 8b         ; $ad00: 8b 8b     Invalid Opcode - XAA #$8b
            sta __8f8d,y       ; $ad02: 99 8d 8f  
            .hex 8f 91 91      ; $ad05: 8f 91 91  Invalid Opcode - SAX __9191
__ad08:     asl $0e            ; $ad08: 06 0e     
            asl $1e,x          ; $ad0a: 16 1e     
__ad0c:     inc $9b            ; $ad0c: e6 9b     
            lda #$03           ; $ad0e: a9 03     
            sta $00            ; $ad10: 85 00     
            lda $9b            ; $ad12: a5 9b     
            sta $01            ; $ad14: 85 01     
            ldy #$3c           ; $ad16: a0 3c     
__ad18:     ldx $00            ; $ad18: a6 00     
            lda __ad08,x       ; $ad1a: bd 08 ad  
            tax                ; $ad1d: aa        
            inc $01            ; $ad1e: e6 01     
            lda $01            ; $ad20: a5 01     
            and #$10           ; $ad22: 29 10     
            beq __ad27         ; $ad24: f0 01     
            inx                ; $ad26: e8        
__ad27:     lda #$03           ; $ad27: a9 03     
            sta $02            ; $ad29: 85 02     
__ad2b:     lda __ace8,x       ; $ad2b: bd e8 ac  
            sta $0211,y        ; $ad2e: 99 11 02  
            dex                ; $ad31: ca        
            dex                ; $ad32: ca        
            dey                ; $ad33: 88        
            dey                ; $ad34: 88        
            dey                ; $ad35: 88        
            dey                ; $ad36: 88        
            dec $02            ; $ad37: c6 02     
            bpl __ad2b         ; $ad39: 10 f0     
            dec $00            ; $ad3b: c6 00     
            bpl __ad18         ; $ad3d: 10 d9     
            rts                ; $ad3f: 60        

;-------------------------------------------------------------------------------
__ad40:     lda #$00           ; $ad40: a9 00     
            .hex 8d 31         ; $ad42: 8d 31     Suspected data
__ad44:     asl $a0            ; $ad44: 06 a0     
            .hex 03            ; $ad46: 03        Suspected data
__ad47:     lda $062d,y        ; $ad47: b9 2d 06  
            cmp $0631          ; $ad4a: cd 31 06  
            bcc __ad55         ; $ad4d: 90 06     
            lda $062d,y        ; $ad4f: b9 2d 06  
            sta $0631          ; $ad52: 8d 31 06  
__ad55:     dey                ; $ad55: 88        
            bpl __ad47         ; $ad56: 10 ef     
            ldx #$00           ; $ad58: a2 00     
            ldy #$03           ; $ad5a: a0 03     
__ad5c:     lda $062d,y        ; $ad5c: b9 2d 06  
            cmp $0631          ; $ad5f: cd 31 06  
            bne __ad69         ; $ad62: d0 05     
            tya                ; $ad64: 98        
            sta $05be,x        ; $ad65: 9d be 05  
            inx                ; $ad68: e8        
__ad69:     dey                ; $ad69: 88        
            bpl __ad5c         ; $ad6a: 10 f0     
            dex                ; $ad6c: ca        
            stx $05c2          ; $ad6d: 8e c2 05  
            ldx #$00           ; $ad70: a2 00     
            lda #$21           ; $ad72: a9 21     
            sta $0301,x        ; $ad74: 9d 01 03  
            inx                ; $ad77: e8        
            lda #$2a           ; $ad78: a9 2a     
            sta $0301,x        ; $ad7a: 9d 01 03  
            inx                ; $ad7d: e8        
            lda #$0c           ; $ad7e: a9 0c     
            sta $0301,x        ; $ad80: 9d 01 03  
            inx                ; $ad83: e8        
            ldy #$00           ; $ad84: a0 00     
            lda $062d,y        ; $ad86: b9 2d 06  
            jsr __ae43         ; $ad89: 20 43 ae  
            tya                ; $ad8c: 98        
            sta $0301,x        ; $ad8d: 9d 01 03  
            inx                ; $ad90: e8        
            lda $01            ; $ad91: a5 01     
            sta $0301,x        ; $ad93: 9d 01 03  
            inx                ; $ad96: e8        
            lda #$fb           ; $ad97: a9 fb     
            sta $0301,x        ; $ad99: 9d 01 03  
            inx                ; $ad9c: e8        
            ldy #$03           ; $ad9d: a0 03     
            lda $062d,y        ; $ad9f: b9 2d 06  
            jsr __ae43         ; $ada2: 20 43 ae  
            tya                ; $ada5: 98        
            sta $0301,x        ; $ada6: 9d 01 03  
            inx                ; $ada9: e8        
            lda $01            ; $adaa: a5 01     
            sta $0301,x        ; $adac: 9d 01 03  
            inx                ; $adaf: e8        
            lda #$fb           ; $adb0: a9 fb     
            sta $0301,x        ; $adb2: 9d 01 03  
            inx                ; $adb5: e8        
            sta $0301,x        ; $adb6: 9d 01 03  
            inx                ; $adb9: e8        
            ldy #$02           ; $adba: a0 02     
            lda $062d,y        ; $adbc: b9 2d 06  
            jsr __ae43         ; $adbf: 20 43 ae  
            tya                ; $adc2: 98        
            sta $0301,x        ; $adc3: 9d 01 03  
            inx                ; $adc6: e8        
            lda $01            ; $adc7: a5 01     
            sta $0301,x        ; $adc9: 9d 01 03  
            inx                ; $adcc: e8        
            lda #$fb           ; $adcd: a9 fb     
            sta $0301,x        ; $adcf: 9d 01 03  
            inx                ; $add2: e8        
            ldy #$01           ; $add3: a0 01     
            lda $062d,y        ; $add5: b9 2d 06  
            jsr __ae43         ; $add8: 20 43 ae  
            tya                ; $addb: 98        
            sta $0301,x        ; $addc: 9d 01 03  
            inx                ; $addf: e8        
            lda $01            ; $ade0: a5 01     
            sta $0301,x        ; $ade2: 9d 01 03  
            inx                ; $ade5: e8        
            lda #$00           ; $ade6: a9 00     
            sta $0301,x        ; $ade8: 9d 01 03  
            lda #$3c           ; $adeb: a9 3c     
            sta $05c4          ; $aded: 8d c4 05  
            rts                ; $adf0: 60        

;-------------------------------------------------------------------------------
__adf1:     dec $05c4          ; $adf1: ce c4 05  
            bpl __ae12         ; $adf4: 10 1c     
            lda #$3c           ; $adf6: a9 3c     
            sta $05c4          ; $adf8: 8d c4 05  
            ldy $05c3          ; $adfb: ac c3 05  
            lda $05be,y        ; $adfe: b9 be 05  
            clc                ; $ae01: 18        
            adc #$09           ; $ae02: 69 09     
            .hex 8d 11 00      ; $ae04: 8d 11 00  Bad Addr Mode - STA $0011
            dec $05c3          ; $ae07: ce c3 05  
            bpl __ae12         ; $ae0a: 10 06     
            lda $05c2          ; $ae0c: ad c2 05  
            sta $05c3          ; $ae0f: 8d c3 05  
__ae12:     rts                ; $ae12: 60        

;-------------------------------------------------------------------------------
            jsr $08ed          ; $ae13: 20 ed 08  
            inc $da            ; $ae16: e6 da     
            .hex eb e2         ; $ae18: eb e2     Invalid Opcode - SBC #$e2
            inx                ; $ae1a: e8        
            .hex fb fb fb      ; $ae1b: fb fb fb  Invalid Opcode - ISC __fbfb,y
            brk                ; $ae1e: 00        
__ae1f:     jsr $08ed          ; $ae1f: 20 ed 08  
            sbc #$eb           ; $ae22: e9 eb     
            .hex e2 e7         ; $ae24: e2 e7     Invalid Opcode - NOP #$e7
            .hex dc de ec      ; $ae26: dc de ec  Invalid Opcode - NOP __ecde,x
            cpx $2000          ; $ae29: ec 00 20  
            sbc __ed08         ; $ae2c: ed 08 ed  
            inx                ; $ae2f: e8        
            .hex da            ; $ae30: da        Invalid Opcode - NOP 
            cmp __fbfb,x       ; $ae31: dd fb fb  
            .hex fb fb 00      ; $ae34: fb fb 00  Invalid Opcode - ISC $00fb,y
            jsr $08ed          ; $ae37: 20 ed 08  
            sbc $ee            ; $ae3a: e5 ee     
            .hex e2 e0         ; $ae3c: e2 e0     Invalid Opcode - NOP #$e0
            .hex e2 fb         ; $ae3e: e2 fb     Invalid Opcode - NOP #$fb
            .hex fb fb 00      ; $ae40: fb fb 00  Invalid Opcode - ISC $00fb,y
__ae43:     ldy #$d0           ; $ae43: a0 d0     
__ae45:     cmp #$0a           ; $ae45: c9 0a     
            bcc __ae4f         ; $ae47: 90 06     
            sbc #$0a           ; $ae49: e9 0a     
__ae4b:     iny                ; $ae4b: c8        
            jmp __ae45         ; $ae4c: 4c 45 ae  

;-------------------------------------------------------------------------------
__ae4f:     ora #$d0           ; $ae4f: 09 d0     
            cpy #$d0           ; $ae51: c0 d0     
            bne __ae57         ; $ae53: d0 02     
            ldy #$fb           ; $ae55: a0 fb     
__ae57:     sta $01            ; $ae57: 85 01     
            rts                ; $ae59: 60        

;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $ae5a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae5d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae60: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae63: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae66: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae69: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae6c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae6f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae72: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae75: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae78: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae7b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae7e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae81: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae84: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae87: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae8a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae8d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae90: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae93: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae96: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae99: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae9c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ae9f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aea2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aea5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aea8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aeab: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aeae: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aeb1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aeb4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aeb7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aeba: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aebd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aec0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aec3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aec6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aec9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aecc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aecf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aed2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aed5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aed8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aedb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aede: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aee1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aee4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aee7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $aeea: ff        Suspected data
__aeeb:     .hex ff ff ff      ; $aeeb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aeee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aef1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aef4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aef7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $aefa: ff        Suspected data
__aefb:     .hex ff ff ff      ; $aefb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aefe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af01: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af04: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af07: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af0a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af0d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af10: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af13: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af16: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af19: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af1c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af1f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af22: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af25: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af28: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af2b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af2e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af31: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af34: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af37: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af3a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af3d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af40: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af43: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af46: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af49: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af4c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af4f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af52: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af55: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af58: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af5b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af5e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af61: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af64: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af67: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af6a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af6d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af70: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $af73: ff        Suspected data
__af74:     .hex ff ff         ; $af74: ff ff     Suspected data
__af76:     .hex ff ff ff      ; $af76: ff ff ff  Invalid Opcode - ISC Array,x
__af79:     .hex ff ff ff      ; $af79: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af7c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af7f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af82: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af85: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af88: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af8b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af8e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af91: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af94: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af97: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af9a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $af9d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afa0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afa3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afa6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afa9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $afac: ff ff     Suspected data
__afae:     .hex ff ff ff      ; $afae: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afb1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afb4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afb7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afba: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afbd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afc0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afc3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afc6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afc9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afcc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afcf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afd2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afd5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afd8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afdb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afde: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afe1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afe4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $afe7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $afea: ff ff     Suspected data
__afec:     .hex ff ff         ; $afec: ff ff     Suspected data
__afee:     .hex ff ff         ; $afee: ff ff     Suspected data
__aff0:     .hex ff ff         ; $aff0: ff ff     Suspected data
__aff2:     .hex ff ff ff      ; $aff2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aff5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $aff8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $affb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $affe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b001: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b004: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b007: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b00a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b00d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b010: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b013: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b016: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b019: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b01c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b01f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b022: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b025: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b028: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b02b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b02e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b031: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b034: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b037: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b03a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b03d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b040: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b043: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b046: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b049: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b04c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b04f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b052: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b055: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b058: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b05b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b05e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b061: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b064: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b067: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b06a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b06d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b070: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b073: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b076: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b079: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b07c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b07f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b082: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b085: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b088: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b08b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b08e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b091: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b094: ff        Suspected data
__b095:     .hex ff ff ff      ; $b095: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b098: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b09b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b09e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0a1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0a4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0a7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0aa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0ad: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0b0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0b3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0b6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0b9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0bc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0bf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0c2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0c5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0c8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0cb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0ce: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0d1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0d4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0d7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0da: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0dd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0e0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b0e3: ff ff     Suspected data
__b0e5:     .hex ff ff ff      ; $b0e5: ff ff ff  Invalid Opcode - ISC Array,x
__b0e8:     .hex ff ff ff      ; $b0e8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0eb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0ee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0f1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0f4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0f7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0fa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b0fd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b100: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b103: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b106: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b109: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b10c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b10f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b112: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b115: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b118: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b11b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b11e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b121: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b124: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b127: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b12a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b12d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b130: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b133: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b136: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b139: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b13c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b13f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b142: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b145: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b148: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b14b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b14e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b151: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b154: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b157: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b15a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b15d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b160: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b163: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b166: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b169: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b16c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b16f: ff        Suspected data
__b170:     .hex ff ff ff      ; $b170: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b173: ff        Suspected data
__b174:     .hex ff ff ff      ; $b174: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b177: ff        Suspected data
__b178:     .hex ff ff ff      ; $b178: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b17b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b17e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b181: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b184: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b187: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b18a: ff ff     Suspected data
__b18c:     .hex ff ff ff      ; $b18c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b18f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b192: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b195: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b198: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b19b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b19e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1a1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1a4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1a7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1aa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b1ad: ff        Suspected data
__b1ae:     .hex ff ff ff      ; $b1ae: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1b1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b1b4: ff        Suspected data
__b1b5:     .hex ff ff ff      ; $b1b5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1b8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1bb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1be: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1c1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1c4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1c7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1ca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1cd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1d0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1d3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1d6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b1d9: ff ff     Suspected data
__b1db:     .hex ff ff ff      ; $b1db: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b1de: ff        Suspected data
__b1df:     .hex ff ff ff      ; $b1df: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1e2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1e5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1e8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1eb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1ee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1f1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1f4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1f7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1fa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b1fd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b200: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b203: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b206: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b209: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b20c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b20f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b212: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b215: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b218: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b21b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b21e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b221: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b224: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b227: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b22a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b22d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b230: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b233: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b236: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b239: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b23c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b23f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b242: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b245: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b248: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b24b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b24e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b251: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b254: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b257: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b25a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b25d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b260: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b263: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b266: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b269: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b26c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b26f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b272: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b275: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b278: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b27b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b27e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b281: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b284: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b287: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b28a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b28d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b290: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b293: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b296: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b299: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b29c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b29f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2a2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2a5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2a8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2ab: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b2ae: ff ff     Suspected data
__b2b0:     .hex ff ff ff      ; $b2b0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2b3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2b6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2b9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2bc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2bf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2c2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2c5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2c8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2cb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2ce: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2d1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2d4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2d7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2da: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2dd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2e0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2e3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2e6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2e9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2ec: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2ef: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2f2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2f5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2f8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2fb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b2fe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b301: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b304: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b307: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b30a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b30d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b310: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b313: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b316: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b319: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b31c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b31f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b322: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b325: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b328: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b32b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b32e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b331: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b334: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b337: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b33a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b33d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b340: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b343: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b346: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b349: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b34c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b34f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b352: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b355: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b358: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b35b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b35e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b361: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b364: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b367: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b36a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b36d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b370: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b373: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b376: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b379: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b37c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b37f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b382: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b385: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b388: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b38b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b38e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b391: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b394: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b397: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b39a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b39d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3a0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3a3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3a6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3a9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3ac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3af: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3b2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3b5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3b8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3bb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3be: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3c1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3c4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3c7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3ca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3cd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3d0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3d3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3d6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3d9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3dc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3df: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3e2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3e5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3e8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3eb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3ee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3f1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3f4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3f7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3fa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b3fd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b400: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b403: ff        Suspected data
__b404:     .hex ff ff ff      ; $b404: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b407: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b40a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b40d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b410: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b413: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b416: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b419: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b41c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b41f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b422: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b425: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b428: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b42b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b42e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b431: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b434: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b437: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b43a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b43d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b440: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b443: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b446: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b449: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b44c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b44f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b452: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b455: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b458: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b45b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b45e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b461: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b464: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b467: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b46a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b46d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b470: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b473: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b476: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b479: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b47c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b47f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b482: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b485: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b488: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b48b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b48e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b491: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b494: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b497: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b49a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b49d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4a0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4a3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4a6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4a9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4ac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4af: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4b2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4b5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4b8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4bb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4be: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4c1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4c4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4c7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4ca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4cd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4d0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4d3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4d6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4d9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4dc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b4df: ff        Suspected data
__b4e0:     .hex ff ff         ; $b4e0: ff ff     Suspected data
__b4e2:     .hex ff ff ff      ; $b4e2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4e5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4e8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4eb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4ee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4f1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b4f4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b4f7: ff ff     Suspected data
__b4f9:     .hex ff ff ff      ; $b4f9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b4fc: ff        Suspected data
__b4fd:     .hex ff ff ff      ; $b4fd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b500: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b503: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b506: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b509: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b50c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b50f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b512: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b515: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b518: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b51b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b51e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b521: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b524: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b527: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b52a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b52d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b530: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b533: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b536: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b539: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b53c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b53f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b542: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b545: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b548: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b54b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b54e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b551: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b554: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b557: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b55a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b55d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b560: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b563: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b566: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b569: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b56c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b56f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b572: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b575: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b578: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b57b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b57e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b581: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b584: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b587: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b58a: ff ff     Suspected data
__b58c:     .hex ff ff ff      ; $b58c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b58f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b592: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b595: ff ff ff  Invalid Opcode - ISC Array,x
__b598:     .hex ff ff ff      ; $b598: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b59b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b59e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5a1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5a4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5a7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b5aa: ff ff     Suspected data
__b5ac:     .hex ff ff ff      ; $b5ac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5af: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5b2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5b5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5b8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $b5bb: ff        Suspected data
__b5bc:     .hex ff ff ff      ; $b5bc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5bf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b5c2: ff ff     Suspected data
__b5c4:     .hex ff ff ff      ; $b5c4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5c7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b5ca: ff ff     Suspected data
__b5cc:     .hex ff ff ff      ; $b5cc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5cf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5d2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5d5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5d8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5db: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5de: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5e1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5e4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5e7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5ea: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5ed: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5f0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5f3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5f6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5f9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5fc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b5ff: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b602: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b605: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b608: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b60b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b60e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b611: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b614: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b617: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b61a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b61d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b620: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b623: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b626: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b629: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b62c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b62f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b632: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b635: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b638: ff ff ff  Invalid Opcode - ISC Array,x
__b63b:     .hex ff ff ff      ; $b63b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b63e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b641: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b644: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b647: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b64a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b64d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b650: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b653: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b656: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b659: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b65c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b65f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b662: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b665: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b668: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b66b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b66e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b671: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b674: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b677: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b67a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b67d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b680: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b683: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b686: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b689: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b68c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b68f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b692: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b695: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b698: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b69b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b69e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6a1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b6a4: ff ff     Suspected data
__b6a6:     .hex ff ff ff      ; $b6a6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6a9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6ac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6af: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6b2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6b5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6b8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6bb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6be: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6c1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6c4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6c7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6ca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6cd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6d0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6d3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6d6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6d9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6dc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6df: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6e2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6e5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6e8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6eb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b6ee: ff ff     Suspected data
__b6f0:     .hex ff ff ff      ; $b6f0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6f3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6f6: ff ff ff  Invalid Opcode - ISC Array,x
__b6f9:     .hex ff ff ff      ; $b6f9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6fc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b6ff: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b702: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b705: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b708: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b70b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b70e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b711: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b714: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b717: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b71a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b71d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b720: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b723: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b726: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b729: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b72c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b72f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b732: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b735: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b738: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b73b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b73e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b741: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b744: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b747: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b74a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b74d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b750: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b753: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b756: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b759: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b75c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b75f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b762: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b765: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b768: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b76b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b76e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b771: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b774: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b777: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b77a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b77d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b780: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b783: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b786: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b789: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b78c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b78f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b792: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b795: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b798: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b79b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b79e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7a1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7a4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7a7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7aa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7ad: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7b0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7b3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7b6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7b9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7bc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7bf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7c2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7c5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7c8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7cb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7ce: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7d1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7d4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7d7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7da: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7dd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7e0: ff ff ff  Invalid Opcode - ISC Array,x
__b7e3:     .hex ff ff ff      ; $b7e3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7e6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7e9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7ec: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7ef: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7f2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7f5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7f8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7fb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b7fe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b801: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b804: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b807: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b80a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b80d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b810: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b813: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b816: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b819: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b81c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b81f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b822: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b825: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b828: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b82b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b82e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b831: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b834: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b837: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b83a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b83d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b840: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b843: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b846: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b849: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b84c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b84f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b852: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b855: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b858: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b85b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b85e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b861: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b864: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b867: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b86a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b86d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b870: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b873: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b876: ff ff     Suspected data
__b878:     .hex ff ff ff      ; $b878: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b87b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b87e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b881: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b884: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b887: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b88a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b88d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b890: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b893: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b896: ff ff ff  Invalid Opcode - ISC Array,x
__b899:     .hex ff ff ff      ; $b899: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b89c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b89f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8a2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8a5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8a8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8ab: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8ae: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8b1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8b4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8b7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8ba: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8bd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8c0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8c3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8c6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8c9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8cc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $b8cf: ff ff     Suspected data
__b8d1:     .hex ff ff ff      ; $b8d1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8d4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8d7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8da: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8dd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8e0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8e3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8e6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8e9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8ec: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8ef: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8f2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8f5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8f8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $b8fb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff fb      ; $b8fe: ff ff fb  Invalid Opcode - ISC __fbff,x
            .hex ff 00         ; $b901: ff 00     Suspected data
__b903:     php                ; $b903: 08        
            .hex 0c 18 1a      ; $b904: 0c 18 1a  Invalid Opcode - NOP $1a18
__b907:     txa                ; $b907: 8a        
            clc                ; $b908: 18        
            adc #$0a           ; $b909: 69 0a     
            tax                ; $b90b: aa        
__b90c:     lda $3d,x          ; $b90c: b5 3d     
            clc                ; $b90e: 18        
            adc $04cc,x        ; $b90f: 7d cc 04  
            pha                ; $b912: 48        
            asl                ; $b913: 0a        
            asl                ; $b914: 0a        
            asl                ; $b915: 0a        
            asl                ; $b916: 0a        
            sta $01            ; $b917: 85 01     
            pla                ; $b919: 68        
            lsr                ; $b91a: 4a        
            lsr                ; $b91b: 4a        
            lsr                ; $b91c: 4a        
            lsr                ; $b91d: 4a        
            cmp #$08           ; $b91e: c9 08     
            bcc __b924         ; $b920: 90 02     
            ora #$f0           ; $b922: 09 f0     
__b924:     sta $00            ; $b924: 85 00     
            ldy #$00           ; $b926: a0 00     
            asl                ; $b928: 0a        
            bcc __b92c         ; $b929: 90 01     
            dey                ; $b92b: 88        
__b92c:     sty $02            ; $b92c: 84 02     
            lda $0408,x        ; $b92e: bd 08 04  
            clc                ; $b931: 18        
            adc $01            ; $b932: 65 01     
            sta $0408,x        ; $b934: 9d 08 04  
            lda $29,x          ; $b937: b5 29     
            adc $00            ; $b939: 65 00     
            sta $29,x          ; $b93b: 95 29     
            lsr $01            ; $b93d: 46 01     
            lda $15,x          ; $b93f: b5 15     
            adc $02            ; $b941: 65 02     
            sta $15,x          ; $b943: 95 15     
            ldx $12            ; $b945: a6 12     
            rts                ; $b947: 60        

;-------------------------------------------------------------------------------
__b948:     lda $044a,x        ; $b948: bd 4a 04  
            bne __b950         ; $b94b: d0 03     
            jsr __b90c         ; $b94d: 20 0c b9  
__b950:     jsr __b907         ; $b950: 20 07 b9  
            lda $47,x          ; $b953: b5 47     
            bmi __b95b         ; $b955: 30 04     
            cmp #$3e           ; $b957: c9 3e     
            bcs __b95f         ; $b959: b0 04     
__b95b:     inc $47,x          ; $b95b: f6 47     
            inc $47,x          ; $b95d: f6 47     
__b95f:     rts                ; $b95f: 60        

;-------------------------------------------------------------------------------
__b960:     lda #$01           ; $b960: a9 01     
            bne __b966         ; $b962: d0 02     
__b964:     lda #$00           ; $b964: a9 00     
__b966:     pha                ; $b966: 48        
            ldy #$08           ; $b967: a0 08     
__b969:     lda $0051,y        ; $b969: b9 51 00  
            beq __b97f         ; $b96c: f0 11     
            lda $0090,y        ; $b96e: b9 90 00  
            cmp #$3c           ; $b971: c9 3c     
            bne __b97f         ; $b973: d0 0a     
            lda #$05           ; $b975: a9 05     
            sta $0051,y        ; $b977: 99 51 00  
            lda #$20           ; $b97a: a9 20     
            sta $0086,y        ; $b97c: 99 86 00  
__b97f:     dey                ; $b97f: 88        
            bpl __b969         ; $b980: 10 e7     
__b982:     jsr __bb10         ; $b982: 20 10 bb  
            bmi __b9b6         ; $b985: 30 2f     
            lda #$00           ; $b987: a9 00     
            sta $04bd          ; $b989: 8d bd 04  
            sta $04b3          ; $b98c: 8d b3 04  
            ldx $00            ; $b98f: a6 00     
            pla                ; $b991: 68        
            sta $0477,x        ; $b992: 9d 77 04  
            lda #$3c           ; $b995: a9 3c     
            sta $90,x          ; $b997: 95 90     
            lda $28            ; $b999: a5 28     
            adc #$08           ; $b99b: 69 08     
            and #$f0           ; $b99d: 29 f0     
            sta $29,x          ; $b99f: 95 29     
            lda $14            ; $b9a1: a5 14     
            adc #$00           ; $b9a3: 69 00     
            sta $15,x          ; $b9a5: 95 15     
            lda $32            ; $b9a7: a5 32     
            sta $33,x          ; $b9a9: 95 33     
            lda $1e            ; $b9ab: a5 1e     
            sta $1f,x          ; $b9ad: 95 1f     
            lda #$41           ; $b9af: a9 41     
            sta $65,x          ; $b9b1: 95 65     
            ldx $12            ; $b9b3: a6 12     
__b9b5:     rts                ; $b9b5: 60        

;-------------------------------------------------------------------------------
__b9b6:     pla                ; $b9b6: 68        
            rts                ; $b9b7: 60        

;-------------------------------------------------------------------------------
__b9b8:     jsr __bb14         ; $b9b8: 20 14 bb  
            bmi __b9e2         ; $b9bb: 30 25     
            ldx $00            ; $b9bd: a6 00     
            lda #$45           ; $b9bf: a9 45     
            sta $90,x          ; $b9c1: 95 90     
            lda $04c0          ; $b9c3: ad c0 04  
            adc #$d0           ; $b9c6: 69 d0     
            sta $29,x          ; $b9c8: 95 29     
            lda $04be          ; $b9ca: ad be 04  
            adc #$00           ; $b9cd: 69 00     
            sta $15,x          ; $b9cf: 95 15     
            lda $cb            ; $b9d1: a5 cb     
            adc #$e0           ; $b9d3: 69 e0     
            sta $33,x          ; $b9d5: 95 33     
            lda $ca            ; $b9d7: a5 ca     
            adc #$00           ; $b9d9: 69 00     
            sta $1f,x          ; $b9db: 95 1f     
            jsr __ba17         ; $b9dd: 20 17 ba  
            ldx $12            ; $b9e0: a6 12     
__b9e2:     rts                ; $b9e2: 60        

;-------------------------------------------------------------------------------
__b9e3:     lda #$00           ; $b9e3: a9 00     
            sta $86,x          ; $b9e5: 95 86     
            lda #$00           ; $b9e7: a9 00     
            .hex 95            ; $b9e9: 95        Suspected data
__b9ea:     .hex 79            ; $b9ea: 79        Suspected data
__b9eb:     lda #$00           ; $b9eb: a9 00     
            sta $b1,x          ; $b9ed: 95 b1     
            sta $042f,x        ; $b9ef: 9d 2f 04  
            sta $a8,x          ; $b9f2: 95 a8     
            sta $9f,x          ; $b9f4: 95 9f     
            sta $044a,x        ; $b9f6: 9d 4a 04  
            .hex 95            ; $b9f9: 95        Suspected data
__b9fa:     .hex 5b 9d 38      ; $b9fa: 5b 9d 38  Invalid Opcode - SRE $389d,y
            .hex 04 9d         ; $b9fd: 04 9d     Invalid Opcode - NOP $9d
            .hex 53 04         ; $b9ff: 53 04     Invalid Opcode - SRE ($04),y
            sta $04cc,x        ; $ba01: 9d cc 04  
            sta $04d6,x        ; $ba04: 9d d6 04  
            sta $045c,x        ; $ba07: 9d 5c 04  
            sta $0477,x        ; $ba0a: 9d 77 04  
            sta $0480,x        ; $ba0d: 9d 80 04  
            sta $0465,x        ; $ba10: 9d 65 04  
            sta $47,x          ; $ba13: 95 47     
            sta $3d,x          ; $ba15: 95 3d     
__ba17:     ldy $90,x          ; $ba17: b4 90     
            lda __f4eb,y       ; $ba19: b9 eb f4  
            and #$7f           ; $ba1c: 29 7f     
            sta $65,x          ; $ba1e: 95 65     
            lda __f532,y       ; $ba20: b9 32 f5  
            sta $046e,x        ; $ba23: 9d 6e 04  
            lda __f5c0,y       ; $ba26: b9 c0 f5  
            sta $0489,x        ; $ba29: 9d 89 04  
            lda __f579,y       ; $ba2c: b9 79 f5  
            sta $0492,x        ; $ba2f: 9d 92 04  
            rts                ; $ba32: 60        

;-------------------------------------------------------------------------------
__ba33:     lda $65,x          ; $ba33: b5 65     
            and #$fc           ; $ba35: 29 fc     
            ora #$01           ; $ba37: 09 01     
            sta $65,x          ; $ba39: 95 65     
            lda #$05           ; $ba3b: a9 05     
            sta $51,x          ; $ba3d: 95 51     
            sta $9f,x          ; $ba3f: 95 9f     
            lda #$1f           ; $ba41: a9 1f     
            sta $86,x          ; $ba43: 95 86     
            ldx $12            ; $ba45: a6 12     
            rts                ; $ba47: 60        

;-------------------------------------------------------------------------------
__ba48:     lda #$ff           ; $ba48: a9 ff     
            sta $0441,x        ; $ba4a: 9d 41 04  
            rts                ; $ba4d: 60        

;-------------------------------------------------------------------------------
__ba4e:     ldx $e8            ; $ba4e: a6 e8     
            jsr __ba71         ; $ba50: 20 71 ba  
            lda $e6            ; $ba53: a5 e6     
            clc                ; $ba55: 18        
            adc $e5            ; $ba56: 65 e5     
            sta $e7            ; $ba58: 85 e7     
            rts                ; $ba5a: 60        

;-------------------------------------------------------------------------------
__ba5b:     brk                ; $ba5b: 00        
            .hex f0            ; $ba5c: f0        Suspected data
__ba5d:     cpx #$d0           ; $ba5d: e0 d0     
            cpy #$b0           ; $ba5f: c0 b0     
            ldy #$90           ; $ba61: a0 90     
            .hex 80 70         ; $ba63: 80 70     Invalid Opcode - NOP #$70
            brk                ; $ba65: 00        
__ba66:     rts                ; $ba66: 60        

;-------------------------------------------------------------------------------
            rts                ; $ba67: 60        

;-------------------------------------------------------------------------------
            adc ($62,x)        ; $ba68: 61 62     
            .hex 63 64         ; $ba6a: 63 64     Invalid Opcode - RRA ($64,x)
            adc $66            ; $ba6c: 65 66     
            .hex 67 68         ; $ba6e: 67 68     Invalid Opcode - RRA $68
            .hex 07            ; $ba70: 07        Suspected data
__ba71:     lda __ba5b,x       ; $ba71: bd 5b ba  
            sta $01            ; $ba74: 85 01     
            lda __ba66,x       ; $ba76: bd 66 ba  
            sta $02            ; $ba79: 85 02     
            rts                ; $ba7b: 60        

;-------------------------------------------------------------------------------
__ba7c:     .hex a9            ; $ba7c: a9        Suspected data
__ba7d:     ora ($a4,x)        ; $ba7d: 01 a4     
            brk                ; $ba7f: 00        
            cpy #$8a           ; $ba80: c0 8a     
            beq __ba8d         ; $ba82: f0 09     
            cpy #$8b           ; $ba84: c0 8b     
            beq __ba8b         ; $ba86: f0 03     
            lda #$00           ; $ba88: a9 00     
            rts                ; $ba8a: 60        

;-------------------------------------------------------------------------------
__ba8b:     lda #$08           ; $ba8b: a9 08     
__ba8d:     sta $46            ; $ba8d: 85 46     
            lda $04df          ; $ba8f: ad df 04  
            bne __ba9b         ; $ba92: d0 07     
            .hex a5            ; $ba94: a5        Suspected data
__ba95:     .hex 32            ; $ba95: 32        Invalid Opcode - KIL 
            and #$10           ; $ba96: 29 10     
            sta $04eb          ; $ba98: 8d eb 04  
__ba9b:     lda $32            ; $ba9b: a5 32     
            and #$0f           ; $ba9d: 29 0f     
            tay                ; $ba9f: a8        
            lda $04eb          ; $baa0: ad eb 04  
            eor $32            ; $baa3: 45 32     
            and #$10           ; $baa5: 29 10     
            beq __bab6         ; $baa7: f0 0d     
            cpy #$0c           ; $baa9: c0 0c     
            bcc __bab4         ; $baab: 90 07     
            lda #$00           ; $baad: a9 00     
            sta $82            ; $baaf: 85 82     
            jsr __f714         ; $bab1: 20 14 f7  
__bab4:     ldy #$04           ; $bab4: a0 04     
__bab6:     cpy #$04           ; $bab6: c0 04     
            bcs __babc         ; $bab8: b0 02     
            ldy #$01           ; $baba: a0 01     
__babc:     tya                ; $babc: 98        
            dex                ; $babd: ca        
            rts                ; $babe: 60        

;-------------------------------------------------------------------------------
__babf:     lda $85            ; $babf: a5 85     
            bne __baec         ; $bac1: d0 29     
            lda $04c2          ; $bac3: ad c2 04  
            sec                ; $bac6: 38        
            sbc #$10           ; $bac7: e9 10     
            bcc __baed         ; $bac9: 90 22     
            sta $04c2          ; $bacb: 8d c2 04  
            lda #$7f           ; $bace: a9 7f     
            sta $85            ; $bad0: 85 85     
            lda $0428          ; $bad2: ad 28 04  
            sec                ; $bad5: 38        
            sbc $0429          ; $bad6: ed 29 04  
            asl                ; $bad9: 0a        
            asl                ; $bada: 0a        
            sta $3c            ; $badb: 85 3c     
            lda #$c0           ; $badd: a9 c0     
            ldy $46            ; $badf: a4 46     
            bpl __bae5         ; $bae1: 10 02     
            lda #$00           ; $bae3: a9 00     
__bae5:     sta $46            ; $bae5: 85 46     
            lda #$04           ; $bae7: a9 04     
            sta $0601          ; $bae9: 8d 01 06  
__baec:     rts                ; $baec: 60        

;-------------------------------------------------------------------------------
__baed:     lda #$c0           ; $baed: a9 c0     
            sta $46            ; $baef: 85 46     
            lda #$20           ; $baf1: a9 20     
            sta $82            ; $baf3: 85 82     
            ldy $12            ; $baf5: a4 12     
            bmi __bafd         ; $baf7: 30 04     
            lsr                ; $baf9: 4a        
            sta $0438,y        ; $bafa: 99 38 04  
__bafd:     jmp __f714         ; $bafd: 4c 14 f7  

;-------------------------------------------------------------------------------
            ldy $0441,x        ; $bb00: bc 41 04  
            bmi __bb0b         ; $bb03: 30 06     
            lda ($cc),y        ; $bb05: b1 cc     
            and #$7f           ; $bb07: 29 7f     
            sta ($cc),y        ; $bb09: 91 cc     
__bb0b:     lda #$00           ; $bb0b: a9 00     
            sta $51,x          ; $bb0d: 95 51     
            rts                ; $bb0f: 60        

;-------------------------------------------------------------------------------
__bb10:     ldy #$08           ; $bb10: a0 08     
            bne __bb16         ; $bb12: d0 02     
__bb14:     ldy #$05           ; $bb14: a0 05     
__bb16:     lda $0051,y        ; $bb16: b9 51 00  
            beq __bb1f         ; $bb19: f0 04     
            dey                ; $bb1b: 88        
            bpl __bb16         ; $bb1c: 10 f8     
            rts                ; $bb1e: 60        

;-------------------------------------------------------------------------------
__bb1f:     lda #$01           ; $bb1f: a9 01     
            sta $0051,y        ; $bb21: 99 51 00  
            lsr                ; $bb24: 4a        
            sta $049b,y        ; $bb25: 99 9b 04  
            lda #$01           ; $bb28: a9 01     
            sta $0090,y        ; $bb2a: 99 90 00  
            lda $29,x          ; $bb2d: b5 29     
__bb2f:     adc #$05           ; $bb2f: 69 05     
__bb31:     sta $0029,y        ; $bb31: 99 29 00  
            lda $15,x          ; $bb34: b5 15     
            adc #$00           ; $bb36: 69 00     
            sta $0015,y        ; $bb38: 99 15 00  
            lda $33,x          ; $bb3b: b5 33     
            sta $0033,y        ; $bb3d: 99 33 00  
            lda $1f,x          ; $bb40: b5 1f     
            sta $001f,y        ; $bb42: 99 1f 00  
            sty $00            ; $bb45: 84 00     
            tya                ; $bb47: 98        
            tax                ; $bb48: aa        
            jsr __b9e3         ; $bb49: 20 e3 b9  
            jsr __ba48         ; $bb4c: 20 48 ba  
            .hex a6            ; $bb4f: a6        Suspected data
__bb50:     .hex 12            ; $bb50: 12        Invalid Opcode - KIL 
            rts                ; $bb51: 60        

;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $bb52: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb55: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $bb58: ff ff     Suspected data
__bb5a:     .hex ff ff ff      ; $bb5a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb5d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb60: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb63: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb66: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $bb69: ff ff     Suspected data
__bb6b:     .hex ff ff ff      ; $bb6b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb6e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb71: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb74: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb77: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb7a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb7d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb80: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb83: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $bb86: ff        Suspected data
__bb87:     .hex ff ff ff      ; $bb87: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb8a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb8d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb90: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb93: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb96: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb99: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb9c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bb9f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bba2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bba5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bba8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbab: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbae: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbb1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbb4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbb7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbba: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbbd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbc0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbc3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbc6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbc9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbcc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbcf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbd2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbd5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbd8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbdb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbde: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $bbe1: ff        Suspected data
__bbe2:     .hex ff ff ff      ; $bbe2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbe5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbe8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbeb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbee: ff ff ff  Invalid Opcode - ISC Array,x
__bbf1:     .hex ff ff ff      ; $bbf1: ff ff ff  Invalid Opcode - ISC Array,x
__bbf4:     .hex ff ff ff      ; $bbf4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbf7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbfa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bbfd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc00: ff ff ff  Invalid Opcode - ISC Array,x
__bc03:     .hex ff ff ff      ; $bc03: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc06: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc09: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc0c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc0f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc12: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc15: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc18: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc1b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $bc1e: ff        Suspected data
__bc1f:     .hex ff ff ff      ; $bc1f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc22: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc25: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc28: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc2b: ff ff ff  Invalid Opcode - ISC Array,x
__bc2e:     .hex ff ff ff      ; $bc2e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc31: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc34: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc37: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc3a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc3d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc40: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc43: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc46: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc49: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $bc4c: ff        Suspected data
__bc4d:     .hex ff            ; $bc4d: ff        Suspected data
__bc4e:     .hex ff ff         ; $bc4e: ff ff     Suspected data
__bc50:     .hex ff ff ff      ; $bc50: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc53: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc56: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc59: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc5c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc5f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc62: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc65: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc68: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc6b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc6e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc71: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc74: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc77: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc7a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc7d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc80: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc83: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc86: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc89: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc8c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc8f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc92: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc95: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc98: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc9b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bc9e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bca1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bca4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bca7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcaa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcad: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcb0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcb3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcb6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcb9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcbc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcbf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcc2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcc5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcc8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bccb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcce: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcd1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcd4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcd7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcda: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcdd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bce0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bce3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bce6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bce9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcec: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcef: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcf2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcf5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcf8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcfb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bcfe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd01: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd04: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd07: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $bd0a: ff        Suspected data
__bd0b:     .hex ff ff ff      ; $bd0b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $bd0e: ff        Suspected data
__bd0f:     .hex ff ff ff      ; $bd0f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd12: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd15: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd18: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd1b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd1e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd21: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd24: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $bd27: ff ff     Suspected data
__bd29:     .hex ff ff ff      ; $bd29: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd2c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd2f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd32: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd35: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd38: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd3b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd3e: ff ff ff  Invalid Opcode - ISC Array,x
__bd41:     .hex ff ff ff      ; $bd41: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd44: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd47: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $bd4a: ff ff     Suspected data
__bd4c:     .hex ff ff ff      ; $bd4c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd4f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd52: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $bd55: ff        Suspected data
__bd56:     .hex ff ff ff      ; $bd56: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd59: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd5c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd5f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd62: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd65: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd68: ff ff ff  Invalid Opcode - ISC Array,x
__bd6b:     .hex ff ff ff      ; $bd6b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd6e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd71: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd74: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd77: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd7a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd7d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $bd80: ff ff     Suspected data
__bd82:     .hex ff ff ff      ; $bd82: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd85: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd88: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd8b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd8e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd91: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $bd94: ff        Suspected data
__bd95:     .hex ff ff ff      ; $bd95: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd98: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd9b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bd9e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bda1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bda4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bda7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdaa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdad: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdb0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdb3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdb6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdb9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdbc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdbf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdc2: ff ff ff  Invalid Opcode - ISC Array,x
__bdc5:     .hex ff ff ff      ; $bdc5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdc8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdcb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdce: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdd1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdd4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdd7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdda: ff ff ff  Invalid Opcode - ISC Array,x
__bddd:     .hex ff ff ff      ; $bddd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bde0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bde3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bde6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bde9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdec: ff ff ff  Invalid Opcode - ISC Array,x
__bdef:     .hex ff ff ff      ; $bdef: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdf2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdf5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdf8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdfb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bdfe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $be01: ff ff     Suspected data
__be03:     .hex ff ff ff      ; $be03: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $be06: ff        Suspected data
__be07:     .hex ff ff ff      ; $be07: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be0a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be0d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be10: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be13: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be16: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be19: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be1c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be1f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be22: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be25: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be28: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be2b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be2e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be31: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be34: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be37: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be3a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be3d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be40: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be43: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be46: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be49: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be4c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be4f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be52: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be55: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be58: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be5b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be5e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be61: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be64: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be67: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be6a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be6d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be70: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be73: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be76: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be79: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be7c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be7f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be82: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be85: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be88: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be8b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be8e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be91: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be94: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be97: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be9a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $be9d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bea0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bea3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bea6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bea9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $beac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $beaf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $beb2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $beb5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $beb8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $bebb: ff        Suspected data
__bebc:     .hex ff ff ff      ; $bebc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bebf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bec2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bec5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bec8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $becb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bece: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bed1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bed4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bed7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $beda: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bedd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bee0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bee3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bee6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bee9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $beec: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $beef: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bef2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bef5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bef8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $befb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $befe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf01: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf04: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf07: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf0a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf0d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf10: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf13: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf16: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf19: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf1c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf1f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf22: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf25: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf28: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf2b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf2e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf31: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf34: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf37: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf3a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf3d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf40: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf43: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf46: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf49: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf4c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf4f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf52: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf55: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf58: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf5b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf5e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf61: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf64: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf67: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf6a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf6d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf70: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf73: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf76: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf79: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf7c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf7f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf82: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf85: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf88: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf8b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf8e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf91: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf94: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf97: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf9a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bf9d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfa0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfa3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfa6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfa9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfaf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfb2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfb5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfb8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfbb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfbe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfc1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfc4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfc7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfcd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfd0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfd3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfd6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfd9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfdc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfdf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfe2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfe5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfe8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfeb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bfee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bff1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bff4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bff7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bffa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $bffd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex fa            ; $c000: fa        Invalid Opcode - NOP 
            inc $fc,x          ; $c001: f6 fc     
            .hex f7 ff         ; $c003: f7 ff     Invalid Opcode - ISC $ff,x
            .hex ff ff ff      ; $c005: ff ff ff  Invalid Opcode - ISC Array,x
            .hex 02            ; $c008: 02        Invalid Opcode - KIL 
            inc __ff04,x       ; $c009: fe 04 ff  
            brk                ; $c00c: 00        
            .hex ff 00 ff      ; $c00d: ff 00 ff  Invalid Opcode - ISC __ff00,x
            lda $0627          ; $c010: ad 27 06  
            beq __c016         ; $c013: f0 01     
            rts                ; $c015: 60        

;-------------------------------------------------------------------------------
__c016:     lda $04ae          ; $c016: ad ae 04  
            beq __c01e         ; $c019: f0 03     
            jmp __816c         ; $c01b: 4c 6c 81  

;-------------------------------------------------------------------------------
__c01e:     inc $04ae          ; $c01e: ee ae 04  
            sta $05ba          ; $c021: 8d ba 05  
            sta $04c4          ; $c024: 8d c4 04  
            sta $04c6          ; $c027: 8d c6 04  
            sta $04b5          ; $c02a: 8d b5 04  
            sta $04b4          ; $c02d: 8d b4 04  
            sta $04b9          ; $c030: 8d b9 04  
            sta $04b6          ; $c033: 8d b6 04  
            sta $04fa          ; $c036: 8d fa 04  
            sta $0425          ; $c039: 8d 25 04  
            sta $3c            ; $c03c: 85 3c     
            sta $85            ; $c03e: 85 85     
            sta $9c            ; $c040: 85 9c     
            sta $82            ; $c042: 85 82     
            sta $04c5          ; $c044: 8d c5 04  
            sta $04fd          ; $c047: 8d fd 04  
            sta $04ca          ; $c04a: 8d ca 04  
            sta $04c9          ; $c04d: 8d c9 04  
            sta $04df          ; $c050: 8d df 04  
            sta $04b8          ; $c053: 8d b8 04  
            ldy #$1b           ; $c056: a0 1b     
__c058:     lda __bb6b,y       ; $c058: b9 6b bb  
            sta $7f00,y        ; $c05b: 99 00 7f  
            dey                ; $c05e: 88        
            bpl __c058         ; $c05f: 10 f7     
            ldy $8f            ; $c061: a4 8f     
            lda __8000,y       ; $c063: b9 00 80  
            sta $7f00          ; $c066: 8d 00 7f  
            lda __8008,y       ; $c069: b9 08 80  
            sta $7f07          ; $c06c: 8d 07 7f  
            lda __8004,y       ; $c06f: b9 04 80  
            sta $7f0e          ; $c072: 8d 0e 7f  
            lda __800c,y       ; $c075: b9 0c 80  
            sta $7f15          ; $c078: 8d 15 7f  
            lda #$b6           ; $c07b: a9 b6     
            sta $05ac          ; $c07d: 8d ac 05  
            lda $0534          ; $c080: ad 34 05  
            ora $0531          ; $c083: 0d 31 05  
            bne __c08d         ; $c086: d0 05     
            lda #$10           ; $c088: a9 10     
            sta $0604          ; $c08a: 8d 04 06  
__c08d:     lda $04af          ; $c08d: ad af 04  
            beq __c106         ; $c090: f0 74     
            ldx #$05           ; $c092: a2 05     
            stx $12            ; $c094: 86 12     
            cmp #$3f           ; $c096: c9 3f     
            beq __c106         ; $c098: f0 6c     
            sta $90,x          ; $c09a: 95 90     
            ldy #$01           ; $c09c: a0 01     
            sty $56            ; $c09e: 84 56     
            ldy #$ff           ; $c0a0: a0 ff     
            sty $0446          ; $c0a2: 8c 46 04  
            cmp #$38           ; $c0a5: c9 38     
            bne __c0c7         ; $c0a7: d0 1e     
            sta $b1,x          ; $c0a9: 95 b1     
            .hex 9d c7         ; $c0ab: 9d c7     Suspected data
__c0ad:     .hex 04 9d         ; $c0ad: 04 9d     Invalid Opcode - NOP $9d
            .hex 77 04         ; $c0af: 77 04     Invalid Opcode - RRA $04,x
            lda #$00           ; $c0b1: a9 00     
            sta $15,x          ; $c0b3: 95 15     
            sta $1f,x          ; $c0b5: 95 1f     
            jsr __8441         ; $c0b7: 20 41 84  
            lda #$f0           ; $c0ba: a9 f0     
            sta $47,x          ; $c0bc: 95 47     
            asl                ; $c0be: 0a        
            sta $33,x          ; $c0bf: 95 33     
            lda #$78           ; $c0c1: a9 78     
            sta $29,x          ; $c0c3: 95 29     
            bne __c106         ; $c0c5: d0 3f     
__c0c7:     pha                ; $c0c7: 48        
            stx $042d          ; $c0c8: 8e 2d 04  
            jsr __845d         ; $c0cb: 20 5d 84  
            lda #$01           ; $c0ce: a9 01     
            sta $a8,x          ; $c0d0: 95 a8     
            sta $9c            ; $c0d2: 85 9c     
            jsr __960f         ; $c0d4: 20 0f 96  
            pla                ; $c0d7: 68        
            cmp #$3d           ; $c0d8: c9 3d     
            bne __c106         ; $c0da: d0 2a     
            inc $79,x          ; $c0dc: f6 79     
            dex                ; $c0de: ca        
            stx $12            ; $c0df: 86 12     
            lda #$01           ; $c0e1: a9 01     
            sta $51,x          ; $c0e3: 95 51     
            lda #$17           ; $c0e5: a9 17     
            sta $90,x          ; $c0e7: 95 90     
            jsr __845d         ; $c0e9: 20 5d 84  
            lda #$00           ; $c0ec: a9 00     
            sta $05bc          ; $c0ee: 8d bc 05  
            lda $cb            ; $c0f1: a5 cb     
            sta $33,x          ; $c0f3: 95 33     
            lda $ca            ; $c0f5: a5 ca     
            sta $1f,x          ; $c0f7: 95 1f     
            lda $04c0          ; $c0f9: ad c0 04  
            sta $29,x          ; $c0fc: 95 29     
            lda $04be          ; $c0fe: ad be 04  
            sta $15,x          ; $c101: 95 15     
            jsr __8569         ; $c103: 20 69 85  
__c106:     lda #$00           ; $c106: a9 00     
            sta $cc            ; $c108: 85 cc     
            lda #$7b           ; $c10a: a9 7b     
            sta $cd            ; $c10c: 85 cd     
            lda $ec            ; $c10e: a5 ec     
            bne __c144         ; $c110: d0 32     
            lda #$14           ; $c112: a9 14     
            sta $09            ; $c114: 85 09     
            lda $cb            ; $c116: a5 cb     
            sbc #$30           ; $c118: e9 30     
            and #$f0           ; $c11a: 29 f0     
            sta $05            ; $c11c: 85 05     
            lda $ca            ; $c11e: a5 ca     
            sbc #$00           ; $c120: e9 00     
            sta $06            ; $c122: 85 06     
__c124:     lda $06            ; $c124: a5 06     
            cmp #$0b           ; $c126: c9 0b     
            bcs __c130         ; $c128: b0 06     
            jsr __8311         ; $c12a: 20 11 83  
            jsr __8311         ; $c12d: 20 11 83  
__c130:     jsr __8138         ; $c130: 20 38 81  
            dec $09            ; $c133: c6 09     
            bpl __c124         ; $c135: 10 ed     
            rts                ; $c137: 60        

;-------------------------------------------------------------------------------
            lda $05            ; $c138: a5 05     
            clc                ; $c13a: 18        
            adc #$10           ; $c13b: 69 10     
            sta $05            ; $c13d: 85 05     
            bcc __c143         ; $c13f: 90 02     
            inc $06            ; $c141: e6 06     
__c143:     rts                ; $c143: 60        

;-------------------------------------------------------------------------------
__c144:     lda $04c0          ; $c144: ad c0 04  
            sbc #$30           ; $c147: e9 30     
            and #$f0           ; $c149: 29 f0     
            sta $05            ; $c14b: 85 05     
            lda $04be          ; $c14d: ad be 04  
            sbc #$00           ; $c150: e9 00     
            sta $06            ; $c152: 85 06     
            lda #$17           ; $c154: a9 17     
            sta $09            ; $c156: 85 09     
__c158:     lda $06            ; $c158: a5 06     
            cmp #$0b           ; $c15a: c9 0b     
            bcs __c164         ; $c15c: b0 06     
            jsr __827d         ; $c15e: 20 7d 82  
            jsr __827d         ; $c161: 20 7d 82  
__c164:     jsr __8138         ; $c164: 20 38 81  
            dec $09            ; $c167: c6 09     
            bpl __c158         ; $c169: 10 ed     
            rts                ; $c16b: 60        

;-------------------------------------------------------------------------------
            jsr __8256         ; $c16c: 20 56 82  
            lda $04ff          ; $c16f: ad ff 04  
            beq __c185         ; $c172: f0 11     
            lda $10            ; $c174: a5 10     
            and #$1f           ; $c176: 29 1f     
            bne __c17f         ; $c178: d0 05     
            ldy #$40           ; $c17a: a0 40     
            sty $0602          ; $c17c: 8c 02 06  
__c17f:     lsr                ; $c17f: 4a        
            bcc __c185         ; $c180: 90 03     
            dec $04ff          ; $c182: ce ff 04  
__c185:     lda $04c0          ; $c185: ad c0 04  
            clc                ; $c188: 18        
            adc #$ff           ; $c189: 69 ff     
            sta $04c1          ; $c18b: 8d c1 04  
            lda $04be          ; $c18e: ad be 04  
            adc #$00           ; $c191: 69 00     
            sta $04bf          ; $c193: 8d bf 04  
            ldx #$08           ; $c196: a2 08     
__c198:     stx $12            ; $c198: 86 12     
            txa                ; $c19a: 8a        
            clc                ; $c19b: 18        
            adc $0400          ; $c19c: 6d 00 04  
            tay                ; $c19f: a8        
            lda __f4da,y       ; $c1a0: b9 da f4  
            ldy $a8,x          ; $c1a3: b4 a8     
            beq __c1b1         ; $c1a5: f0 0a     
            lda #$10           ; $c1a7: a9 10     
            ldy $90,x          ; $c1a9: b4 90     
            cmp #$38           ; $c1ab: c9 38     
            bne __c1b1         ; $c1ad: d0 02     
            lda #$00           ; $c1af: a9 00     
__c1b1:     sta $f4            ; $c1b1: 85 f4     
            lda $51,x          ; $c1b3: b5 51     
            cmp #$02           ; $c1b5: c9 02     
            bcs __c1c4         ; $c1b7: b0 0b     
            lda $90,x          ; $c1b9: b5 90     
            cmp #$32           ; $c1bb: c9 32     
            bcs __c1c4         ; $c1bd: b0 05     
            lda $04ff          ; $c1bf: ad ff 04  
            bne __c1d2         ; $c1c2: d0 0e     
__c1c4:     lda $86,x          ; $c1c4: b5 86     
            beq __c1ca         ; $c1c6: f0 02     
            dec $86,x          ; $c1c8: d6 86     
__c1ca:     lda $0453,x        ; $c1ca: bd 53 04  
            beq __c1d2         ; $c1cd: f0 03     
            dec $0453,x        ; $c1cf: de 53 04  
__c1d2:     lda $045c,x        ; $c1d2: bd 5c 04  
            beq __c1da         ; $c1d5: f0 03     
            dec $045c,x        ; $c1d7: de 5c 04  
__c1da:     lda $0438,x        ; $c1da: bd 38 04  
            beq __c1e7         ; $c1dd: f0 08     
            lda $10            ; $c1df: a5 10     
            lsr                ; $c1e1: 4a        
            bcc __c1e7         ; $c1e2: 90 03     
            dec $0438,x        ; $c1e4: de 38 04  
__c1e7:     jsr __820e         ; $c1e7: 20 0e 82  
            jsr __9ab5         ; $c1ea: 20 b5 9a  
            jsr __823d         ; $c1ed: 20 3d 82  
            ldx $12            ; $c1f0: a6 12     
            dex                ; $c1f2: ca        
            bpl __c198         ; $c1f3: 10 a3     
            lda $04b9          ; $c1f5: ad b9 04  
            beq __c20d         ; $c1f8: f0 13     
            sec                ; $c1fa: 38        
            sbc #$47           ; $c1fb: e9 47     
            jsr __e125         ; $c1fd: 20 25 e1  
            .hex 64            ; $c200: 64        Suspected data
__c201:     .hex 8b 90         ; $c201: 8b 90     Invalid Opcode - XAA #$90
            .hex 8b 08         ; $c203: 8b 08     Invalid Opcode - XAA #$08
            .hex 82 80         ; $c205: 82 80     Invalid Opcode - NOP #$80
            lda ($a9),y        ; $c207: b1 a9     
            brk                ; $c209: 00        
            sta $04b9          ; $c20a: 8d b9 04  
__c20d:     rts                ; $c20d: 60        

;-------------------------------------------------------------------------------
            ldy #$00           ; $c20e: a0 00     
            jsr __8214         ; $c210: 20 14 82  
            iny                ; $c213: c8        
            lda $05ac          ; $c214: ad ac 05  
            asl                ; $c217: 0a        
            asl                ; $c218: 0a        
            sec                ; $c219: 38        
            adc $05ac          ; $c21a: 6d ac 05  
            sta $05ac          ; $c21d: 8d ac 05  
            asl $05ad          ; $c220: 0e ad 05  
            lda #$20           ; $c223: a9 20     
            bit $05ad          ; $c225: 2c ad 05  
            bcc __c22e         ; $c228: 90 04     
            beq __c233         ; $c22a: f0 07     
            bne __c230         ; $c22c: d0 02     
__c22e:     bne __c233         ; $c22e: d0 03     
__c230:     inc $05ad          ; $c230: ee ad 05  
__c233:     lda $05ad          ; $c233: ad ad 05  
            eor $05ac          ; $c236: 4d ac 05  
            sta $05ae,y        ; $c239: 99 ae 05  
            rts                ; $c23c: 60        

;-------------------------------------------------------------------------------
            lda $51,x          ; $c23d: b5 51     
            jsr __e125         ; $c23f: 20 25 e1  
            ora __b982         ; $c242: 0d 82 b9  
            .hex 89 fa         ; $c245: 89 fa     Invalid Opcode - NOP #$fa
            sty $8f            ; $c247: 84 8f     
            sta $f7            ; $c249: 85 f7     
            sta $9c            ; $c24b: 85 9c     
            .hex 87 58         ; $c24d: 87 58     Invalid Opcode - SAX $58
            dey                ; $c24f: 88        
            .hex b2            ; $c250: b2        Invalid Opcode - KIL 
            sta $18            ; $c251: 85 18     
            cpx #$01           ; $c253: e0 01     
            .hex ff ad b8      ; $c255: ff ad b8  Invalid Opcode - ISC __b8ad,x
            .hex 04 d0         ; $c258: 04 d0     Invalid Opcode - NOP $d0
            bvc __c201         ; $c25a: 50 a5     
            cpx $2520          ; $c25c: ec 20 25  
            sbc ($ed,x)        ; $c25f: e1 ed     
            .hex 82 64         ; $c261: 82 64     Invalid Opcode - NOP #$64
            .hex 82 a4         ; $c263: 82 a4     Invalid Opcode - NOP #$a4
            ror __c0ad         ; $c265: 6e ad c0  
            .hex 04 18         ; $c268: 04 18     Invalid Opcode - NOP $18
            adc __8251,y       ; $c26a: 79 51 82  
            and #$f0           ; $c26d: 29 f0     
            sta $05            ; $c26f: 85 05     
            lda $04be          ; $c271: ad be 04  
            adc __8253,y       ; $c274: 79 53 82  
            sta $06            ; $c277: 85 06     
            cmp #$0a           ; $c279: c9 0a     
            bcs __c2ab         ; $c27b: b0 2e     
            lda $0628          ; $c27d: ad 28 06  
            cmp #$02           ; $c280: c9 02     
            beq __c2ab         ; $c282: f0 27     
            ldx #$00           ; $c284: a2 00     
            stx $00            ; $c286: 86 00     
            cpx $06            ; $c288: e4 06     
            beq __c298         ; $c28a: f0 0c     
            lda $00            ; $c28c: a5 00     
            tay                ; $c28e: a8        
            clc                ; $c28f: 18        
            adc ($cc),y        ; $c290: 71 cc     
            sta $00            ; $c292: 85 00     
            inx                ; $c294: e8        
            jmp __8288         ; $c295: 4c 88 82  

;-------------------------------------------------------------------------------
__c298:     ldy $00            ; $c298: a4 00     
            lda ($cc),y        ; $c29a: b1 cc     
            sta $01            ; $c29c: 85 01     
            ldx #$ff           ; $c29e: a2 ff     
            dey                ; $c2a0: 88        
__c2a1:     iny                ; $c2a1: c8        
            iny                ; $c2a2: c8        
            inx                ; $c2a3: e8        
            inx                ; $c2a4: e8        
            cpx $01            ; $c2a5: e4 01     
            bcc __c2ac         ; $c2a7: 90 03     
            ldx $12            ; $c2a9: a6 12     
__c2ab:     rts                ; $c2ab: 60        

;-------------------------------------------------------------------------------
__c2ac:     lda ($cc),y        ; $c2ac: b1 cc     
            bmi __c2a1         ; $c2ae: 30 f1     
            iny                ; $c2b0: c8        
            lda ($cc),y        ; $c2b1: b1 cc     
            dey                ; $c2b3: 88        
            and #$f0           ; $c2b4: 29 f0     
            cmp $05            ; $c2b6: c5 05     
            bne __c2a1         ; $c2b8: d0 e7     
            lda ($cc),y        ; $c2ba: b1 cc     
            cmp #$5c           ; $c2bc: c9 5c     
            bcs __c2c8         ; $c2be: b0 08     
            cmp #$47           ; $c2c0: c9 47     
            bcc __c2c8         ; $c2c2: 90 04     
            sta $04b9          ; $c2c4: 8d b9 04  
            rts                ; $c2c7: 60        

;-------------------------------------------------------------------------------
__c2c8:     ldx #$04           ; $c2c8: a2 04     
__c2ca:     lda $51,x          ; $c2ca: b5 51     
            beq __c2d2         ; $c2cc: f0 04     
            dex                ; $c2ce: ca        
            bpl __c2ca         ; $c2cf: 10 f9     
            rts                ; $c2d1: 60        

;-------------------------------------------------------------------------------
__c2d2:     stx $12            ; $c2d2: 86 12     
            lda $05            ; $c2d4: a5 05     
            sta $29,x          ; $c2d6: 95 29     
            lda $06            ; $c2d8: a5 06     
            sta $15,x          ; $c2da: 95 15     
            iny                ; $c2dc: c8        
            lda ($cc),y        ; $c2dd: b1 cc     
            dey                ; $c2df: 88        
            asl                ; $c2e0: 0a        
            asl                ; $c2e1: 0a        
            asl                ; $c2e2: 0a        
            asl                ; $c2e3: 0a        
            sta $33,x          ; $c2e4: 95 33     
            lda #$00           ; $c2e6: a9 00     
            sta $1f,x          ; $c2e8: 95 1f     
            jmp __8377         ; $c2ea: 4c 77 83  

;-------------------------------------------------------------------------------
            lda $10            ; $c2ed: a5 10     
            and #$01           ; $c2ef: 29 01     
            tay                ; $c2f1: a8        
            iny                ; $c2f2: c8        
            lda $d8            ; $c2f3: a5 d8     
            beq __c2fc         ; $c2f5: f0 05     
            and #$03           ; $c2f7: 29 03     
            eor #$03           ; $c2f9: 49 03     
            tay                ; $c2fb: a8        
__c2fc:     lda $cb            ; $c2fc: a5 cb     
            clc                ; $c2fe: 18        
            adc __8251,y       ; $c2ff: 79 51 82  
            and #$f0           ; $c302: 29 f0     
            sta $05            ; $c304: 85 05     
            lda $ca            ; $c306: a5 ca     
            adc __8253,y       ; $c308: 79 53 82  
            sta $06            ; $c30b: 85 06     
            cmp #$0a           ; $c30d: c9 0a     
            bcs __c2ab         ; $c30f: b0 9a     
            ldx #$00           ; $c311: a2 00     
            stx $00            ; $c313: 86 00     
            cpx $06            ; $c315: e4 06     
            beq __c325         ; $c317: f0 0c     
            lda $00            ; $c319: a5 00     
            tay                ; $c31b: a8        
            clc                ; $c31c: 18        
            adc ($cc),y        ; $c31d: 71 cc     
            sta $00            ; $c31f: 85 00     
            inx                ; $c321: e8        
            jmp __8315         ; $c322: 4c 15 83  

;-------------------------------------------------------------------------------
__c325:     ldy $00            ; $c325: a4 00     
            lda ($cc),y        ; $c327: b1 cc     
            sta $01            ; $c329: 85 01     
            ldx #$ff           ; $c32b: a2 ff     
            dey                ; $c32d: 88        
__c32e:     iny                ; $c32e: c8        
            iny                ; $c32f: c8        
            inx                ; $c330: e8        
            inx                ; $c331: e8        
            cpx $01            ; $c332: e4 01     
            bcc __c339         ; $c334: 90 03     
            ldx $12            ; $c336: a6 12     
__c338:     rts                ; $c338: 60        

;-------------------------------------------------------------------------------
__c339:     lda ($cc),y        ; $c339: b1 cc     
            bmi __c32e         ; $c33b: 30 f1     
            iny                ; $c33d: c8        
            lda ($cc),y        ; $c33e: b1 cc     
            dey                ; $c340: 88        
            asl                ; $c341: 0a        
            asl                ; $c342: 0a        
            asl                ; $c343: 0a        
            asl                ; $c344: 0a        
            cmp $05            ; $c345: c5 05     
            bne __c32e         ; $c347: d0 e5     
            lda ($cc),y        ; $c349: b1 cc     
            cmp #$5c           ; $c34b: c9 5c     
            bcs __c357         ; $c34d: b0 08     
            cmp #$47           ; $c34f: c9 47     
            bcc __c357         ; $c351: 90 04     
            sta $04b9          ; $c353: 8d b9 04  
            rts                ; $c356: 60        

;-------------------------------------------------------------------------------
__c357:     ldx #$04           ; $c357: a2 04     
__c359:     lda $51,x          ; $c359: b5 51     
            beq __c361         ; $c35b: f0 04     
            dex                ; $c35d: ca        
            bpl __c359         ; $c35e: 10 f9     
            rts                ; $c360: 60        

;-------------------------------------------------------------------------------
__c361:     stx $12            ; $c361: 86 12     
            lda $05            ; $c363: a5 05     
            sta $33,x          ; $c365: 95 33     
            lda $06            ; $c367: a5 06     
            sta $1f,x          ; $c369: 95 1f     
            iny                ; $c36b: c8        
            lda ($cc),y        ; $c36c: b1 cc     
            dey                ; $c36e: 88        
            and #$f0           ; $c36f: 29 f0     
            sta $29,x          ; $c371: 95 29     
            lda #$00           ; $c373: a9 00     
            sta $15,x          ; $c375: 95 15     
            sta $049b,x        ; $c377: 9d 9b 04  
            sty $0c            ; $c37a: 84 0c     
            lda ($cc),y        ; $c37c: b1 cc     
            and #$3f           ; $c37e: 29 3f     
            cmp #$32           ; $c380: c9 32     
            bcs __c393         ; $c382: b0 0f     
            lda $ec            ; $c384: a5 ec     
            beq __c393         ; $c386: f0 0b     
            jsr __9e3b         ; $c388: 20 3b 9e  
            lda $0f            ; $c38b: a5 0f     
            adc #$18           ; $c38d: 69 18     
            cmp #$30           ; $c38f: c9 30     
            bcc __c338         ; $c391: 90 a5     
__c393:     ldy $0c            ; $c393: a4 0c     
            lda ($cc),y        ; $c395: b1 cc     
            ora #$80           ; $c397: 09 80     
            sta ($cc),y        ; $c399: 91 cc     
            cmp #$dc           ; $c39b: c9 dc     
            and #$7f           ; $c39d: 29 7f     
            bcc __c3a6         ; $c39f: 90 05     
            and #$3f           ; $c3a1: 29 3f     
            sta $049b,x        ; $c3a3: 9d 9b 04  
__c3a6:     sta $90,x          ; $c3a6: 95 90     
            tya                ; $c3a8: 98        
            sta $0441,x        ; $c3a9: 9d 41 04  
            inc $51,x          ; $c3ac: f6 51     
            lda $90,x          ; $c3ae: b5 90     
            jsr __e125         ; $c3b0: 20 25 e1  
            eor $5d84,x        ; $c3b3: 5d 84 5d  
            .hex 84            ; $c3b6: 84        Suspected data
__c3b7:     eor $5d84,x        ; $c3b7: 5d 84 5d  
            sty $5d            ; $c3ba: 84 5d     
            sty $5d            ; $c3bc: 84 5d     
            sty $6c            ; $c3be: 84 6c     
            sta __845d         ; $c3c0: 8d 5d 84  
            eor __f284,x       ; $c3c3: 5d 84 f2  
            sty $5d            ; $c3c6: 84 5d     
            sty $1c            ; $c3c8: 84 1c     
            .hex 92            ; $c3ca: 92        Invalid Opcode - KIL 
            ora $92,x          ; $c3cb: 15 92     
            eor $6c84,x        ; $c3cd: 5d 84 6c  
            sta __84b9         ; $c3d0: 8d b9 84  
            eor $5d84,x        ; $c3d3: 5d 84 5d  
            sty $5d            ; $c3d6: 84 5d     
            sty $63            ; $c3d8: 84 63     
            stx __845d         ; $c3da: 8e 5d 84  
            inc $8a            ; $c3dd: e6 8a     
            inc $8a            ; $c3df: e6 8a     
            sbc $84            ; $c3e1: e5 84     
            .hex f2            ; $c3e3: f2        Invalid Opcode - KIL 
            tay                ; $c3e4: a8        
            .hex f2            ; $c3e5: f2        Invalid Opcode - KIL 
            tay                ; $c3e6: a8        
            .hex 14 aa         ; $c3e7: 14 aa     Invalid Opcode - NOP $aa,x
            eor $5284,x        ; $c3e9: 5d 84 52  
            .hex 8f 6b a5      ; $c3ec: 8f 6b a5  Invalid Opcode - SAX __a56b
            eor $2484,x        ; $c3ef: 5d 84 24  
            .hex a7 5d         ; $c3f2: a7 5d     Invalid Opcode - LAX $5d
            sty $0a            ; $c3f4: 84 0a     
            lda ($5d,x)        ; $c3f6: a1 5d     
            sty $6c            ; $c3f8: 84 6c     
            sta __845d         ; $c3fa: 8d 5d 84  
            jmp ($5d8d)        ; $c3fd: 6c 8d 5d  

;-------------------------------------------------------------------------------
            sty $5d            ; $c400: 84 5d     
            sty $aa            ; $c402: 84 aa     
            ldx __845d         ; $c404: ae 5d 84  
            ror                ; $c407: 6a        
            ldy __ac6a         ; $c408: ac 6a ac  
            cmp __e3b1         ; $c40b: cd b1 e3  
            .hex af f4 8a      ; $c40e: af f4 8a  Invalid Opcode - LAX __8af4
            .hex f4 8a         ; $c411: f4 8a     Invalid Opcode - NOP $8a,x
            .hex f4 8a         ; $c413: f4 8a     Invalid Opcode - NOP $8a,x
            .hex f4 8a         ; $c415: f4 8a     Invalid Opcode - NOP $8a,x
            eor $5d84,x        ; $c417: 5d 84 5d  
            sty $5d            ; $c41a: 84 5d     
            sty $5d            ; $c41c: 84 5d     
            sty $5d            ; $c41e: 84 5d     
            sty $5d            ; $c420: 84 5d     
            sty $5d            ; $c422: 84 5d     
            sty $5d            ; $c424: 84 5d     
            sty $5d            ; $c426: 84 5d     
            sty $e0            ; $c428: 84 e0     
            tya                ; $c42a: 98        
            eor __9184,x       ; $c42b: 5d 84 91  
            sty __845d         ; $c42e: 8c 5d 84  
            jmp ($6c8d)        ; $c431: 6c 8d 6c  

;-------------------------------------------------------------------------------
            sta __845d         ; $c434: 8d 5d 84  
            .hex 5f 8d 5f      ; $c437: 5f 8d 5f  Invalid Opcode - SRE $5f8d,x
            sta __8cb1         ; $c43a: 8d b1 8c  
            lda ($8c),y        ; $c43d: b1 8c     
            lda ($8c),y        ; $c43f: b1 8c     
            ldy $90,x          ; $c441: b4 90     
            lda __f4eb,y       ; $c443: b9 eb f4  
            and #$7f           ; $c446: 29 7f     
            sta $65,x          ; $c448: 95 65     
            lda __f532,y       ; $c44a: b9 32 f5  
            sta $046e,x        ; $c44d: 9d 6e 04  
            lda __f5c0,y       ; $c450: b9 c0 f5  
            sta $0489,x        ; $c453: 9d 89 04  
            lda __f579,y       ; $c456: b9 79 f5  
            sta $0492,x        ; $c459: 9d 92 04  
            rts                ; $c45c: 60        

;-------------------------------------------------------------------------------
            lda #$00           ; $c45d: a9 00     
            sta $86,x          ; $c45f: 95 86     
            lda #$00           ; $c461: a9 00     
            sta $79,x          ; $c463: 95 79     
            lda #$00           ; $c465: a9 00     
            sta $b1,x          ; $c467: 95 b1     
            sta $042f,x        ; $c469: 9d 2f 04  
            sta $a8,x          ; $c46c: 95 a8     
            sta $9f,x          ; $c46e: 95 9f     
            sta $044a,x        ; $c470: 9d 4a 04  
            sta $5b,x          ; $c473: 95 5b     
            sta $0438,x        ; $c475: 9d 38 04  
            sta $0453,x        ; $c478: 9d 53 04  
            sta $04cc,x        ; $c47b: 9d cc 04  
            sta $04d6,x        ; $c47e: 9d d6 04  
            sta $045c,x        ; $c481: 9d 5c 04  
            sta $0477,x        ; $c484: 9d 77 04  
            sta $0480,x        ; $c487: 9d 80 04  
            sta $0465,x        ; $c48a: 9d 65 04  
            sta $47,x          ; $c48d: 95 47     
            jsr __8441         ; $c48f: 20 41 84  
            jsr __9e3b         ; $c492: 20 3b 9e  
            iny                ; $c495: c8        
            sty $6f,x          ; $c496: 94 6f     
            lda __85f1,y       ; $c498: b9 f1 85  
            sta $3d,x          ; $c49b: 95 3d     
            lda $046e,x        ; $c49d: bd 6e 04  
            and #$40           ; $c4a0: 29 40     
            beq __c4a6         ; $c4a2: f0 02     
            asl $3d,x          ; $c4a4: 16 3d     
__c4a6:     rts                ; $c4a6: 60        

;-------------------------------------------------------------------------------
            inc $1200,x        ; $c4a7: fe 00 12  
            asl $1a,x          ; $c4aa: 16 1a     
            asl $2622,x        ; $c4ac: 1e 22 26  
            rol                ; $c4af: 2a        
            and $3230          ; $c4b0: 2d 30 32  
            .hex 34 37         ; $c4b3: 34 37     Invalid Opcode - NOP $37,x
            and $3d3b,y        ; $c4b5: 39 3b 3d  
            rol $5d20,x        ; $c4b8: 3e 20 5d  
            sty $a4            ; $c4bb: 84 a4     
            ror __c0ad         ; $c4bd: 6e ad c0  
__c4c0:     .hex 04 79         ; $c4c0: 04 79     Invalid Opcode - NOP $79
            ldx $84            ; $c4c2: a6 84     
            sta $29,x          ; $c4c4: 95 29     
            lda $04be          ; $c4c6: ad be 04  
            adc #$00           ; $c4c9: 69 00     
            sta $15,x          ; $c4cb: 95 15     
            lda $1e            ; $c4cd: a5 1e     
            bpl __c4d5         ; $c4cf: 10 04     
            ldy #$00           ; $c4d1: a0 00     
            beq __c4df         ; $c4d3: f0 0a     
__c4d5:     lda $32            ; $c4d5: a5 32     
            sec                ; $c4d7: 38        
            sbc $cb            ; $c4d8: e5 cb     
            lsr                ; $c4da: 4a        
            lsr                ; $c4db: 4a        
            lsr                ; $c4dc: 4a        
            lsr                ; $c4dd: 4a        
            tay                ; $c4de: a8        
__c4df:     lda __84a9,y       ; $c4df: b9 a9 84  
            sta $47,x          ; $c4e2: 95 47     
            rts                ; $c4e4: 60        

;-------------------------------------------------------------------------------
            jsr __845d         ; $c4e5: 20 5d 84  
            lda #$0c           ; $c4e8: a9 0c     
            sta $3d,x          ; $c4ea: 95 3d     
            lda #$a0           ; $c4ec: a9 a0     
            sta $05bc          ; $c4ee: 8d bc 05  
            rts                ; $c4f1: 60        

;-------------------------------------------------------------------------------
            jsr __845d         ; $c4f2: 20 5d 84  
            lda #$ff           ; $c4f5: a9 ff     
            sta $86,x          ; $c4f7: 95 86     
            rts                ; $c4f9: 60        

;-------------------------------------------------------------------------------
            jsr __b5cc         ; $c4fa: 20 cc b5  
            jsr __88e8         ; $c4fd: 20 e8 88  
            lda $51,x          ; $c500: b5 51     
            bne __c56f         ; $c502: d0 6b     
            lda $049b,x        ; $c504: bd 9b 04  
            beq __c539         ; $c507: f0 30     
            sta $04b8          ; $c509: 8d b8 04  
            jsr __9937         ; $c50c: 20 37 99  
            jsr __8208         ; $c50f: 20 08 82  
            lda #$02           ; $c512: a9 02     
            sta $0603          ; $c514: 8d 03 06  
            lda $04ef,x        ; $c517: bd ef 04  
            sta $15,x          ; $c51a: 95 15     
            lda #$80           ; $c51c: a9 80     
            sta $29,x          ; $c51e: 95 29     
            asl                ; $c520: 0a        
            sta $1f,x          ; $c521: 95 1f     
            lda #$b0           ; $c523: a9 b0     
            ldy $90,x          ; $c525: b4 90     
            cpy #$21           ; $c527: c0 21     
            bne __c52d         ; $c529: d0 02     
            lda #$70           ; $c52b: a9 70     
__c52d:     sta $33,x          ; $c52d: 95 33     
            lda #$41           ; $c52f: a9 41     
            sta $65,x          ; $c531: 95 65     
            sta $046e,x        ; $c533: 9d 6e 04  
            jmp __91b0         ; $c536: 4c b0 91  

;-------------------------------------------------------------------------------
__c539:     lda $90,x          ; $c539: b5 90     
            cmp #$1b           ; $c53b: c9 1b     
            beq __c56f         ; $c53d: f0 30     
            inc $04ad          ; $c53f: ee ad 04  
            ldy $04ad          ; $c542: ac ad 04  
            cpy #$08           ; $c545: c0 08     
            bcc __c56f         ; $c547: 90 26     
            lda #$00           ; $c549: a9 00     
            sta $04ad          ; $c54b: 8d ad 04  
            lda #$01           ; $c54e: a9 01     
            sta $51,x          ; $c550: 95 51     
            sta $65,x          ; $c552: 95 65     
            lda #$07           ; $c554: a9 07     
            sta $046e,x        ; $c556: 9d 6e 04  
            lda #$00           ; $c559: a9 00     
            sta $90,x          ; $c55b: 95 90     
            lda $33,x          ; $c55d: b5 33     
            sbc #$60           ; $c55f: e9 60     
            sta $33,x          ; $c561: 95 33     
            lda $1f,x          ; $c563: b5 1f     
            sbc #$00           ; $c565: e9 00     
            sta $1f,x          ; $c567: 95 1f     
            lda #$ff           ; $c569: a9 ff     
            sta $0441,x        ; $c56b: 9d 41 04  
            rts                ; $c56e: 60        

;-------------------------------------------------------------------------------
__c56f:     asl $65,x          ; $c56f: 16 65     
            sec                ; $c571: 38        
            ror $65,x          ; $c572: 76 65     
            jsr __9b1b         ; $c574: 20 1b 9b  
            lda $044a,x        ; $c577: bd 4a 04  
            bne __c57f         ; $c57a: d0 03     
            jsr __9e50         ; $c57c: 20 50 9e  
__c57f:     jsr __9e4b         ; $c57f: 20 4b 9e  
            lda $47,x          ; $c582: b5 47     
            bmi __c58a         ; $c584: 30 04     
            cmp #$3e           ; $c586: c9 3e     
            bcs __c58e         ; $c588: b0 04     
__c58a:     inc $47,x          ; $c58a: f6 47     
            inc $47,x          ; $c58c: f6 47     
__c58e:     rts                ; $c58e: 60        

;-------------------------------------------------------------------------------
            jsr __88e8         ; $c58f: 20 e8 88  
            lda $86,x          ; $c592: b5 86     
            beq __c5af         ; $c594: f0 19     
            tay                ; $c596: a8        
            lsr                ; $c597: 4a        
            lsr                ; $c598: 4a        
            and #$01           ; $c599: 29 01     
            sta $6f,x          ; $c59b: 95 6f     
            lda #$01           ; $c59d: a9 01     
            sta $65,x          ; $c59f: 95 65     
            sta $046e,x        ; $c5a1: 9d 6e 04  
            lda #$3c           ; $c5a4: a9 3c     
            cpy #$0c           ; $c5a6: c0 0c     
            bcc __c5ac         ; $c5a8: 90 02     
            lda #$3e           ; $c5aa: a9 3e     
__c5ac:     jmp __9bb3         ; $c5ac: 4c b3 9b  

;-------------------------------------------------------------------------------
__c5af:     jmp __89a9         ; $c5af: 4c a9 89  

;-------------------------------------------------------------------------------
            jsr __88e8         ; $c5b2: 20 e8 88  
            jsr __997a         ; $c5b5: 20 7a 99  
            lda $a8,x          ; $c5b8: b5 a8     
            beq __c5c1         ; $c5ba: f0 05     
            lda #$01           ; $c5bc: a9 01     
            sta $51,x          ; $c5be: 95 51     
            rts                ; $c5c0: 60        

;-------------------------------------------------------------------------------
__c5c1:     lda $86,x          ; $c5c1: b5 86     
            beq __c5af         ; $c5c3: f0 ea     
            lda $90,x          ; $c5c5: b5 90     
            cmp #$32           ; $c5c7: c9 32     
            bcs __c5e1         ; $c5c9: b0 16     
            jsr __8b5b         ; $c5cb: 20 5b 8b  
            lda $10            ; $c5ce: a5 10     
            and #$03           ; $c5d0: 29 03     
            sta $044a,x        ; $c5d2: 9d 4a 04  
            lda $10            ; $c5d5: a5 10     
            and #$10           ; $c5d7: 29 10     
            lsr                ; $c5d9: 4a        
            lsr                ; $c5da: 4a        
            lsr                ; $c5db: 4a        
            lsr                ; $c5dc: 4a        
            adc #$01           ; $c5dd: 69 01     
            sta $6f,x          ; $c5df: 95 6f     
__c5e1:     jsr __9486         ; $c5e1: 20 86 94  
            jmp __b5cc         ; $c5e4: 4c cc b5  

;-------------------------------------------------------------------------------
            sed                ; $c5e7: f8        
__c5e8:     brk                ; $c5e8: 00        
            sed                ; $c5e9: f8        
            brk                ; $c5ea: 00        
            php                ; $c5eb: 08        
            bpl __c5f6         ; $c5ec: 10 08     
            bpl __c5e8         ; $c5ee: 10 f8     
            sed                ; $c5f0: f8        
            php                ; $c5f1: 08        
            php                ; $c5f2: 08        
            sed                ; $c5f3: f8        
            sed                ; $c5f4: f8        
            php                ; $c5f5: 08        
__c5f6:     php                ; $c5f6: 08        
            jsr __88e8         ; $c5f7: 20 e8 88  
            lda $ee            ; $c5fa: a5 ee     
            ora $ef            ; $c5fc: 05 ef     
            bne __c5af         ; $c5fe: d0 af     
__c600:     lda $86,x          ; $c600: b5 86     
            beq __c5af         ; $c602: f0 ab     
            cmp #$1a           ; $c604: c9 1a     
            bcs __c610         ; $c606: b0 08     
            sbc #$11           ; $c608: e9 11     
            bmi __c610         ; $c60a: 30 04     
            tay                ; $c60c: a8        
            jsr __8670         ; $c60d: 20 70 86  
__c610:     lda #$60           ; $c610: a9 60     
            sta $00            ; $c612: 85 00     
            ldx #$00           ; $c614: a2 00     
            ldy #$40           ; $c616: a0 40     
__c618:     lda $042c          ; $c618: ad 2c 04  
            clc                ; $c61b: 18        
            adc __85ef,x       ; $c61c: 7d ef 85  
            sta $0200,y        ; $c61f: 99 00 02  
            lda $0429          ; $c622: ad 29 04  
            clc                ; $c625: 18        
            adc __85e7,x       ; $c626: 7d e7 85  
            sta $0203,y        ; $c629: 99 03 02  
            lda #$01           ; $c62c: a9 01     
            sta $0202,y        ; $c62e: 99 02 02  
            lda $00            ; $c631: a5 00     
            sta $0201,y        ; $c633: 99 01 02  
            clc                ; $c636: 18        
            adc #$02           ; $c637: 69 02     
            sta $00            ; $c639: 85 00     
            iny                ; $c63b: c8        
            iny                ; $c63c: c8        
            iny                ; $c63d: c8        
            iny                ; $c63e: c8        
            inx                ; $c63f: e8        
            cpx #$08           ; $c640: e0 08     
            bne __c618         ; $c642: d0 d4     
            ldx $12            ; $c644: a6 12     
            jmp __b5cc         ; $c646: 4c cc b5  

;-------------------------------------------------------------------------------
__c649:     rts                ; $c649: 60        

;-------------------------------------------------------------------------------
            .hex fb 08 15      ; $c64a: fb 08 15  Invalid Opcode - ISC $1508,y
            .hex fb 08 15      ; $c64d: fb 08 15  Invalid Opcode - ISC $1508,y
            .hex fb 08 15      ; $c650: fb 08 15  Invalid Opcode - ISC $1508,y
            .hex ff 00 00      ; $c653: ff 00 00  Bad Addr Mode - ISC $0000,x
            .hex ff 00 00      ; $c656: ff 00 00  Bad Addr Mode - ISC $0000,x
            .hex ff 00 00      ; $c659: ff 00 00  Bad Addr Mode - ISC $0000,x
            .hex fc fc fc      ; $c65c: fc fc fc  Invalid Opcode - NOP __fcfc,x
            php                ; $c65f: 08        
            php                ; $c660: 08        
            php                ; $c661: 08        
            .hex 14 14         ; $c662: 14 14     Invalid Opcode - NOP $14,x
            .hex 14 ff         ; $c664: 14 ff     Invalid Opcode - NOP $ff,x
            .hex ff ff 00      ; $c666: ff ff 00  Bad Addr Mode - ISC $00ff,x
            brk                ; $c669: 00        
            brk                ; $c66a: 00        
            brk                ; $c66b: 00        
            brk                ; $c66c: 00        
            brk                ; $c66d: 00        
            .hex 5f 06 b5      ; $c66e: 5f 06 b5  Invalid Opcode - SRE __b506,x
            and #$18           ; $c671: 29 18     
            adc __864a,y       ; $c673: 79 4a 86  
            sta $0c            ; $c676: 85 0c     
            lda $15,x          ; $c678: b5 15     
            adc __8653,y       ; $c67a: 79 53 86  
            sta $0d            ; $c67d: 85 0d     
            cmp #$0b           ; $c67f: c9 0b     
            bcs __c649         ; $c681: b0 c6     
            lda $33,x          ; $c683: b5 33     
            adc __865c,y       ; $c685: 79 5c 86  
            and #$f0           ; $c688: 29 f0     
            sta $0e            ; $c68a: 85 0e     
            sta $0b            ; $c68c: 85 0b     
            lda $1f,x          ; $c68e: b5 1f     
            adc __8665,y       ; $c690: 79 65 86  
            sta $0f            ; $c693: 85 0f     
            cmp #$0a           ; $c695: c9 0a     
            bcs __c649         ; $c697: b0 b0     
            ldy $ec            ; $c699: a4 ec     
            bne __c6bd         ; $c69b: d0 20     
            lsr                ; $c69d: 4a        
            ror $0e            ; $c69e: 66 0e     
            lsr                ; $c6a0: 4a        
            ror $0e            ; $c6a1: 66 0e     
            lsr                ; $c6a3: 4a        
            ror $0e            ; $c6a4: 66 0e     
            lsr                ; $c6a6: 4a        
            ror $0e            ; $c6a7: 66 0e     
            lda $0e            ; $c6a9: a5 0e     
            ldy #$ff           ; $c6ab: a0 ff     
__c6ad:     sec                ; $c6ad: 38        
            sbc #$0f           ; $c6ae: e9 0f     
            iny                ; $c6b0: c8        
            bcs __c6ad         ; $c6b1: b0 fa     
            sty $0d            ; $c6b3: 84 0d     
            adc #$0f           ; $c6b5: 69 0f     
            asl                ; $c6b7: 0a        
            asl                ; $c6b8: 0a        
            asl                ; $c6b9: 0a        
            asl                ; $c6ba: 0a        
            sta $0e            ; $c6bb: 85 0e     
__c6bd:     lda $0c            ; $c6bd: a5 0c     
            lsr                ; $c6bf: 4a        
            lsr                ; $c6c0: 4a        
            lsr                ; $c6c1: 4a        
            lsr                ; $c6c2: 4a        
            sta $04            ; $c6c3: 85 04     
            ora $0e            ; $c6c5: 05 0e     
            sta $05            ; $c6c7: 85 05     
            ldy #$00           ; $c6c9: a0 00     
            lda $04be          ; $c6cb: ad be 04  
            cmp #$0a           ; $c6ce: c9 0a     
            bne __c6d5         ; $c6d0: d0 03     
            sty $0d            ; $c6d2: 84 0d     
            iny                ; $c6d4: c8        
__c6d5:     lda #$10           ; $c6d5: a9 10     
            sta $07            ; $c6d7: 85 07     
            lda __866e,y       ; $c6d9: b9 6e 86  
            sta $08            ; $c6dc: 85 08     
            ldy $0d            ; $c6de: a4 0d     
__c6e0:     lda $07            ; $c6e0: a5 07     
            clc                ; $c6e2: 18        
            adc #$f0           ; $c6e3: 69 f0     
            sta $07            ; $c6e5: 85 07     
            lda $08            ; $c6e7: a5 08     
            adc #$00           ; $c6e9: 69 00     
            sta $08            ; $c6eb: 85 08     
            dey                ; $c6ed: 88        
            bpl __c6e0         ; $c6ee: 10 f0     
            ldy $05            ; $c6f0: a4 05     
            lda ($07),y        ; $c6f2: b1 07     
            cmp #$9d           ; $c6f4: c9 9d     
            beq __c701         ; $c6f6: f0 09     
            cmp #$93           ; $c6f8: c9 93     
            beq __c701         ; $c6fa: f0 05     
            cmp #$72           ; $c6fc: c9 72     
            beq __c701         ; $c6fe: f0 01     
            rts                ; $c700: 60        

;-------------------------------------------------------------------------------
__c701:     lda #$40           ; $c701: a9 40     
            sta ($07),y        ; $c703: 91 07     
            lda $0d            ; $c705: a5 0d     
            and #$01           ; $c707: 29 01     
            eor #$01           ; $c709: 49 01     
            asl                ; $c70b: 0a        
            asl                ; $c70c: 0a        
            ldy $ec            ; $c70d: a4 ec     
            bne __c712         ; $c70f: d0 01     
            asl                ; $c711: 0a        
__c712:     pha                ; $c712: 48        
            lda $0e            ; $c713: a5 0e     
            sta $02            ; $c715: 85 02     
            lda $0c            ; $c717: a5 0c     
            and #$f0           ; $c719: 29 f0     
            sta $03            ; $c71b: 85 03     
            lda #$08           ; $c71d: a9 08     
            sta $00            ; $c71f: 85 00     
            lda $02            ; $c721: a5 02     
            asl                ; $c723: 0a        
            rol $00            ; $c724: 26 00     
            asl                ; $c726: 0a        
            rol $00            ; $c727: 26 00     
            and #$e0           ; $c729: 29 e0     
            sta $01            ; $c72b: 85 01     
            lda $03            ; $c72d: a5 03     
            lsr                ; $c72f: 4a        
            lsr                ; $c730: 4a        
            lsr                ; $c731: 4a        
            ora $01            ; $c732: 05 01     
            ldx $0300          ; $c734: ae 00 03  
            sta $0302,x        ; $c737: 9d 02 03  
            clc                ; $c73a: 18        
            adc #$20           ; $c73b: 69 20     
            sta $0307,x        ; $c73d: 9d 07 03  
            pla                ; $c740: 68        
            ora $00            ; $c741: 05 00     
            sta $0301,x        ; $c743: 9d 01 03  
            adc #$00           ; $c746: 69 00     
            sta $0306,x        ; $c748: 9d 06 03  
            lda #$02           ; $c74b: a9 02     
            sta $0303,x        ; $c74d: 9d 03 03  
            sta $0308,x        ; $c750: 9d 08 03  
            lda #$fa           ; $c753: a9 fa     
            sta $0304,x        ; $c755: 9d 04 03  
            sta $0305,x        ; $c758: 9d 05 03  
            sta $0309,x        ; $c75b: 9d 09 03  
            sta $030a,x        ; $c75e: 9d 0a 03  
            lda #$00           ; $c761: a9 00     
            sta $030b,x        ; $c763: 9d 0b 03  
            txa                ; $c766: 8a        
            clc                ; $c767: 18        
            adc #$0a           ; $c768: 69 0a     
            sta $0300          ; $c76a: 8d 00 03  
            ldx #$08           ; $c76d: a2 08     
__c76f:     lda $51,x          ; $c76f: b5 51     
            beq __c778         ; $c771: f0 05     
            dex                ; $c773: ca        
            bpl __c76f         ; $c774: 10 f9     
            bmi __c795         ; $c776: 30 1d     
__c778:     lda $0c            ; $c778: a5 0c     
            and #$f0           ; $c77a: 29 f0     
            sta $29,x          ; $c77c: 95 29     
            lda $0d            ; $c77e: a5 0d     
            ldy $ec            ; $c780: a4 ec     
            bne __c785         ; $c782: d0 01     
            tya                ; $c784: 98        
__c785:     sta $15,x          ; $c785: 95 15     
            lda $0b            ; $c787: a5 0b     
            sta $33,x          ; $c789: 95 33     
            lda $0f            ; $c78b: a5 0f     
            sta $1f,x          ; $c78d: 95 1f     
            jsr __8461         ; $c78f: 20 61 84  
            jsr __98c4         ; $c792: 20 c4 98  
__c795:     ldx $12            ; $c795: a6 12     
__c797:     rts                ; $c797: 60        

;-------------------------------------------------------------------------------
            lsr $4a            ; $c798: 46 4a     
            lsr $2052          ; $c79a: 4e 52 20  
            inx                ; $c79d: e8        
            dey                ; $c79e: 88        
            lda $65,x          ; $c79f: b5 65     
            ora #$10           ; $c7a1: 09 10     
            sta $65,x          ; $c7a3: 95 65     
            lda $86,x          ; $c7a5: b5 86     
            bne __c7ac         ; $c7a7: d0 03     
            jmp __8842         ; $c7a9: 4c 42 88  

;-------------------------------------------------------------------------------
__c7ac:     lsr                ; $c7ac: 4a        
            lsr                ; $c7ad: 4a        
            lsr                ; $c7ae: 4a        
            tay                ; $c7af: a8        
            lda __8798,y       ; $c7b0: b9 98 87  
            jsr __9bb3         ; $c7b3: 20 b3 9b  
            lda $049b,x        ; $c7b6: bd 9b 04  
            beq __c797         ; $c7b9: f0 dc     
            lda $86,x          ; $c7bb: b5 86     
            cmp #$03           ; $c7bd: c9 03     
            bne __c797         ; $c7bf: d0 d6     
            ldy #$22           ; $c7c1: a0 22     
            lda $90,x          ; $c7c3: b5 90     
            cmp #$21           ; $c7c5: c9 21     
            bne __c7ca         ; $c7c7: d0 01     
            dey                ; $c7c9: 88        
__c7ca:     sty $721b          ; $c7ca: 8c 1b 72  
            sty $7222          ; $c7cd: 8c 22 72  
            iny                ; $c7d0: c8        
            sty $7229          ; $c7d1: 8c 29 72  
            sty $7232          ; $c7d4: 8c 32 72  
            ldy #$03           ; $c7d7: a0 03     
__c7d9:     lda $04ef,x        ; $c7d9: bd ef 04  
            and #$01           ; $c7dc: 29 01     
            asl                ; $c7de: 0a        
            asl                ; $c7df: 0a        
            eor #$04           ; $c7e0: 49 04     
            ldx $ec            ; $c7e2: a6 ec     
            bne __c7e7         ; $c7e4: d0 01     
            asl                ; $c7e6: 0a        
__c7e7:     ldx __fa9e,y       ; $c7e7: be 9e fa  
            ora $721b,x        ; $c7ea: 1d 1b 72  
            sta $721b,x        ; $c7ed: 9d 1b 72  
            ldx $12            ; $c7f0: a6 12     
            dey                ; $c7f2: 88        
            bpl __c7d9         ; $c7f3: 10 e4     
            lda #$14           ; $c7f5: a9 14     
            sta $11            ; $c7f7: 85 11     
            ldy $04ef,x        ; $c7f9: bc ef 04  
            lda #$5f           ; $c7fc: a9 5f     
            sta $01            ; $c7fe: 85 01     
            lda #$10           ; $c800: a9 10     
            sta $00            ; $c802: 85 00     
__c804:     lda $00            ; $c804: a5 00     
            clc                ; $c806: 18        
            adc #$f0           ; $c807: 69 f0     
            sta $00            ; $c809: 85 00     
            lda $01            ; $c80b: a5 01     
            adc #$00           ; $c80d: 69 00     
            sta $01            ; $c80f: 85 01     
            dey                ; $c811: 88        
            bpl __c804         ; $c812: 10 f0     
            lda $90,x          ; $c814: b5 90     
            cmp #$21           ; $c816: c9 21     
            bne __c827         ; $c818: d0 0d     
            lda $00            ; $c81a: a5 00     
            sec                ; $c81c: 38        
            sbc #$40           ; $c81d: e9 40     
            .hex 85            ; $c81f: 85        Suspected data
__c820:     brk                ; $c820: 00        
            lda $01            ; $c821: a5 01     
            sbc #$00           ; $c823: e9 00     
            sta $01            ; $c825: 85 01     
__c827:     ldy #$b8           ; $c827: a0 b8     
            lda #$56           ; $c829: a9 56     
            sta ($00),y        ; $c82b: 91 00     
            ldy #$c8           ; $c82d: a0 c8     
            sta ($00),y        ; $c82f: 91 00     
            lda #$53           ; $c831: a9 53     
            ldy #$b9           ; $c833: a0 b9     
            sta ($00),y        ; $c835: 91 00     
            ldy #$ca           ; $c837: a0 ca     
            sta ($00),y        ; $c839: 91 00     
            lda #$54           ; $c83b: a9 54     
            ldy #$c9           ; $c83d: a0 c9     
            sta ($00),y        ; $c83f: 91 00     
            rts                ; $c841: 60        

;-------------------------------------------------------------------------------
            lda $90,x          ; $c842: b5 90     
            cmp #$2b           ; $c844: c9 2b     
            bne __c855         ; $c846: d0 0d     
            dec $04f8          ; $c848: ce f8 04  
            bpl __c855         ; $c84b: 10 08     
            inc $049b,x        ; $c84d: fe 9b 04  
            inc $90,x          ; $c850: f6 90     
            jmp __8509         ; $c852: 4c 09 85  

;-------------------------------------------------------------------------------
__c855:     jmp __89a9         ; $c855: 4c a9 89  

;-------------------------------------------------------------------------------
            jsr __88e8         ; $c858: 20 e8 88  
            lda #$12           ; $c85b: a9 12     
            sta $65,x          ; $c85d: 95 65     
            lda $86,x          ; $c85f: b5 86     
            beq __c888         ; $c861: f0 25     
            lda #$f8           ; $c863: a9 f8     
            sta $47,x          ; $c865: 95 47     
            jsr __9e4b         ; $c867: 20 4b 9e  
            lda #$b2           ; $c86a: a9 b2     
            ldy $86,x          ; $c86c: b4 86     
            cpy #$10           ; $c86e: c0 10     
            bcs __c885         ; $c870: b0 13     
            lda #$80           ; $c872: a9 80     
            sta $046e,x        ; $c874: 9d 6e 04  
            lda #$01           ; $c877: a9 01     
            sta $65,x          ; $c879: 95 65     
            asl                ; $c87b: 0a        
            sta $6f,x          ; $c87c: 95 6f     
            inc $9f,x          ; $c87e: f6 9f     
            jsr __8b5b         ; $c880: 20 5b 8b  
            lda #$b4           ; $c883: a9 b4     
__c885:     jmp __9bb3         ; $c885: 4c b3 9b  

;-------------------------------------------------------------------------------
__c888:     cpx $042d          ; $c888: ec 2d 04  
            bne __c891         ; $c88b: d0 04     
            lda #$00           ; $c88d: a9 00     
            sta $9c            ; $c88f: 85 9c     
__c891:     jmp __89a9         ; $c891: 4c a9 89  

;-------------------------------------------------------------------------------
            lda #$00           ; $c894: a9 00     
            sta $ee            ; $c896: 85 ee     
            lda $65,x          ; $c898: b5 65     
            ldy #$01           ; $c89a: a0 01     
            and #$04           ; $c89c: 29 04     
            bne __c8b9         ; $c89e: d0 19     
            lda $90,x          ; $c8a0: b5 90     
            cmp #$1a           ; $c8a2: c9 1a     
            beq __c8b9         ; $c8a4: f0 13     
            cmp #$08           ; $c8a6: c9 08     
            beq __c8b9         ; $c8a8: f0 0f     
            cmp #$2d           ; $c8aa: c9 2d     
            beq __c8b9         ; $c8ac: f0 0b     
            cmp #$21           ; $c8ae: c9 21     
            beq __c8b9         ; $c8b0: f0 07     
            lda $046e,x        ; $c8b2: bd 6e 04  
            and #$20           ; $c8b5: 29 20     
            beq __c8bb         ; $c8b7: f0 02     
__c8b9:     ldy #$03           ; $c8b9: a0 03     
__c8bb:     lda $29,x          ; $c8bb: b5 29     
            clc                ; $c8bd: 18        
            adc __88e4,y       ; $c8be: 79 e4 88  
            sta $0e            ; $c8c1: 85 0e     
            lda $15,x          ; $c8c3: b5 15     
            adc #$00           ; $c8c5: 69 00     
            sta $0f            ; $c8c7: 85 0f     
            lda $0e            ; $c8c9: a5 0e     
            cmp $04c0          ; $c8cb: cd c0 04  
            lda $0f            ; $c8ce: a5 0f     
            sbc $04be          ; $c8d0: ed be 04  
            beq __c8dc         ; $c8d3: f0 07     
            lda $ee            ; $c8d5: a5 ee     
            ora __88e0,y       ; $c8d7: 19 e0 88  
            sta $ee            ; $c8da: 85 ee     
__c8dc:     dey                ; $c8dc: 88        
            bpl __c8bb         ; $c8dd: 10 dc     
__c8df:     rts                ; $c8df: 60        

;-------------------------------------------------------------------------------
            php                ; $c8e0: 08        
            .hex 04 02         ; $c8e1: 04 02     Invalid Opcode - NOP $02
            ora ($00,x)        ; $c8e3: 01 00     
            php                ; $c8e5: 08        
            bpl __c900         ; $c8e6: 10 18     
            jsr __8894         ; $c8e8: 20 94 88  
            lda #$22           ; $c8eb: a9 22     
            ldy $90,x          ; $c8ed: b4 90     
            cpy #$2c           ; $c8ef: c0 2c     
            beq __c8f9         ; $c8f1: f0 06     
            cpy #$1f           ; $c8f3: c0 1f     
            beq __c8f9         ; $c8f5: f0 02     
            lda #$10           ; $c8f7: a9 10     
__c8f9:     adc $33,x          ; $c8f9: 75 33     
            sta $00            ; $c8fb: 85 00     
            lda $1f,x          ; $c8fd: b5 1f     
            .hex 69            ; $c8ff: 69        Suspected data
__c900:     brk                ; $c900: 00        
            sta $01            ; $c901: 85 01     
            lda $00            ; $c903: a5 00     
            cmp $cb            ; $c905: c5 cb     
            lda $01            ; $c907: a5 01     
            sbc $ca            ; $c909: e5 ca     
            sta $ef            ; $c90b: 85 ef     
            cpy #$17           ; $c90d: c0 17     
            beq __c8df         ; $c90f: f0 ce     
            cpy #$41           ; $c911: c0 41     
            beq __c8df         ; $c913: f0 ca     
            cpy #$43           ; $c915: c0 43     
            beq __c8df         ; $c917: f0 c6     
            cpy #$2d           ; $c919: c0 2d     
            beq __c8df         ; $c91b: f0 c2     
            txa                ; $c91d: 8a        
            and #$01           ; $c91e: 29 01     
            sta $00            ; $c920: 85 00     
            lda $10            ; $c922: a5 10     
            and #$01           ; $c924: 29 01     
            eor $00            ; $c926: 45 00     
            bne __c8df         ; $c928: d0 b5     
            lda $cb            ; $c92a: a5 cb     
            sbc #$30           ; $c92c: e9 30     
            sta $01            ; $c92e: 85 01     
            lda $ca            ; $c930: a5 ca     
            sbc #$00           ; $c932: e9 00     
            sta $00            ; $c934: 85 00     
            inc $00            ; $c936: e6 00     
            lda $cb            ; $c938: a5 cb     
            adc #$ff           ; $c93a: 69 ff     
            php                ; $c93c: 08        
            adc #$30           ; $c93d: 69 30     
            sta $03            ; $c93f: 85 03     
            lda $ca            ; $c941: a5 ca     
            adc #$00           ; $c943: 69 00     
            plp                ; $c945: 28        
            adc #$00           ; $c946: 69 00     
            sta $02            ; $c948: 85 02     
            inc $02            ; $c94a: e6 02     
            lda $33,x          ; $c94c: b5 33     
            cmp $01            ; $c94e: c5 01     
            ldy $1f,x          ; $c950: b4 1f     
            iny                ; $c952: c8        
            tya                ; $c953: 98        
            sbc $00            ; $c954: e5 00     
            bmi __c9a5         ; $c956: 30 4d     
            lda $33,x          ; $c958: b5 33     
            cmp $03            ; $c95a: c5 03     
            ldy $1f,x          ; $c95c: b4 1f     
            iny                ; $c95e: c8        
            tya                ; $c95f: 98        
            sbc $02            ; $c960: e5 02     
            bpl __c9a5         ; $c962: 10 41     
            lda $04c0          ; $c964: ad c0 04  
            sbc #$30           ; $c967: e9 30     
            sta $01            ; $c969: 85 01     
            lda $04be          ; $c96b: ad be 04  
            sbc #$00           ; $c96e: e9 00     
            sta $00            ; $c970: 85 00     
            inc $00            ; $c972: e6 00     
            lda $04c1          ; $c974: ad c1 04  
            adc #$30           ; $c977: 69 30     
            sta $03            ; $c979: 85 03     
            lda $04bf          ; $c97b: ad bf 04  
            adc #$00           ; $c97e: 69 00     
            sta $02            ; $c980: 85 02     
            inc $02            ; $c982: e6 02     
            lda $29,x          ; $c984: b5 29     
            cmp $01            ; $c986: c5 01     
            ldy $15,x          ; $c988: b4 15     
            iny                ; $c98a: c8        
            tya                ; $c98b: 98        
            sbc $00            ; $c98c: e5 00     
            bmi __c99c         ; $c98e: 30 0c     
            lda $29,x          ; $c990: b5 29     
            cmp $03            ; $c992: c5 03     
            ldy $15,x          ; $c994: b4 15     
            iny                ; $c996: c8        
            tya                ; $c997: 98        
            sbc $02            ; $c998: e5 02     
            bmi __c9b8         ; $c99a: 30 1c     
__c99c:     ldy $90,x          ; $c99c: b4 90     
            lda __f532,y       ; $c99e: b9 32 f5  
            and #$08           ; $c9a1: 29 08     
            bne __c9b8         ; $c9a3: d0 13     
__c9a5:     lda $a8,x          ; $c9a5: b5 a8     
            bne __c9b8         ; $c9a7: d0 0f     
            ldy $0441,x        ; $c9a9: bc 41 04  
            bmi __c9b4         ; $c9ac: 30 06     
            lda ($cc),y        ; $c9ae: b1 cc     
            and #$7f           ; $c9b0: 29 7f     
            sta ($cc),y        ; $c9b2: 91 cc     
__c9b4:     lda #$00           ; $c9b4: a9 00     
            sta $51,x          ; $c9b6: 95 51     
__c9b8:     rts                ; $c9b8: 60        

;-------------------------------------------------------------------------------
            lda #$01           ; $c9b9: a9 01     
            sta $04a4,x        ; $c9bb: 9d a4 04  
            ldy $042f,x        ; $c9be: bc 2f 04  
            dey                ; $c9c1: 88        
            cpy #$1f           ; $c9c2: c0 1f     
            bcs __c9c9         ; $c9c4: b0 03     
            inc $042f,x        ; $c9c6: fe 2f 04  
__c9c9:     jsr __88e8         ; $c9c9: 20 e8 88  
            lda $50            ; $c9cc: a5 50     
            cmp #$08           ; $c9ce: c9 08     
            beq __c9e2         ; $c9d0: f0 10     
            lda $d8            ; $c9d2: a5 d8     
            and #$04           ; $c9d4: 29 04     
            bne __ca07         ; $c9d6: d0 2f     
            lda $04ff          ; $c9d8: ad ff 04  
            bne __c9e2         ; $c9db: d0 05     
            lda $0438,x        ; $c9dd: bd 38 04  
            beq __ca0a         ; $c9e0: f0 28     
__c9e2:     lda $90,x          ; $c9e2: b5 90     
            cmp #$00           ; $c9e4: c9 00     
            beq __ca0a         ; $c9e6: f0 22     
            cmp #$41           ; $c9e8: c9 41     
            beq __c9f0         ; $c9ea: f0 04     
            cmp #$32           ; $c9ec: c9 32     
            bcs __ca0a         ; $c9ee: b0 1a     
__c9f0:     jsr __997a         ; $c9f0: 20 7a 99  
            lda $042f,x        ; $c9f3: bd 2f 04  
            beq __c9fb         ; $c9f6: f0 03     
            jsr __8577         ; $c9f8: 20 77 85  
__c9fb:     lda $a8,x          ; $c9fb: b5 a8     
            beq __ca04         ; $c9fd: f0 05     
            dec $9f,x          ; $c9ff: d6 9f     
            jmp __960f         ; $ca01: 4c 0f 96  

;-------------------------------------------------------------------------------
__ca04:     jsr __b5cc         ; $ca04: 20 cc b5  
__ca07:     jmp __9b1b         ; $ca07: 4c 1b 9b  

;-------------------------------------------------------------------------------
__ca0a:     ldy #$01           ; $ca0a: a0 01     
            lda $3d,x          ; $ca0c: b5 3d     
            beq __ca15         ; $ca0e: f0 05     
            bpl __ca13         ; $ca10: 10 01     
            iny                ; $ca12: c8        
__ca13:     sty $6f,x          ; $ca13: 94 6f     
__ca15:     ldy $90,x          ; $ca15: b4 90     
            lda __f4eb,y       ; $ca17: b9 eb f4  
            and #$20           ; $ca1a: 29 20     
            bne __ca41         ; $ca1c: d0 23     
            lda $65,x          ; $ca1e: b5 65     
            and #$df           ; $ca20: 29 df     
            sta $65,x          ; $ca22: 95 65     
            lda $a8,x          ; $ca24: b5 a8     
            cmp #$02           ; $ca26: c9 02     
            bcc __ca41         ; $ca28: 90 17     
            lda $90,x          ; $ca2a: b5 90     
            cmp #$09           ; $ca2c: c9 09     
            bne __ca36         ; $ca2e: d0 06     
            lda $5b,x          ; $ca30: b5 5b     
            and #$04           ; $ca32: 29 04     
            bne __ca3b         ; $ca34: d0 05     
__ca36:     lda __f4eb,y       ; $ca36: b9 eb f4  
            bpl __ca41         ; $ca39: 10 06     
__ca3b:     lda $65,x          ; $ca3b: b5 65     
            ora #$20           ; $ca3d: 09 20     
            sta $65,x          ; $ca3f: 95 65     
__ca41:     jsr __8a53         ; $ca41: 20 53 8a  
            lda $1f,x          ; $ca44: b5 1f     
            bmi __ca50         ; $ca46: 30 08     
            lda $042c          ; $ca48: ad 2c 04  
            cmp #$e8           ; $ca4b: c9 e8     
            bcc __ca50         ; $ca4d: 90 01     
            rts                ; $ca4f: 60        

;-------------------------------------------------------------------------------
__ca50:     jmp __b5cc         ; $ca50: 4c cc b5  

;-------------------------------------------------------------------------------
            lda $90,x          ; $ca53: b5 90     
            jsr __e125         ; $ca55: 20 25 e1  
            ora $6d8f          ; $ca58: 0d 8f 6d  
            sty $6d,x          ; $ca5b: 94 6d     
            sty $6d,x          ; $ca5d: 94 6d     
            sty $6d,x          ; $ca5f: 94 6d     
            sty $6d,x          ; $ca61: 94 6d     
            sty $6d,x          ; $ca63: 94 6d     
            sty $6d,x          ; $ca65: 94 6d     
            sty $7d,x          ; $ca67: 94 7d     
            ldx $3e            ; $ca69: a6 3e     
            sty $3c,x          ; $ca6b: 94 3c     
            .hex 92            ; $ca6d: 92        Invalid Opcode - KIL 
            .hex 3c 92 3c      ; $ca6e: 3c 92 3c  Invalid Opcode - NOP $3c92,x
            .hex 92            ; $ca71: 92        Invalid Opcode - KIL 
            .hex df 93 bb      ; $ca72: df 93 bb  Invalid Opcode - DCP __bb93,x
            .hex 93 0f         ; $ca75: 93 0f     Invalid Opcode - AHX ($0f),y
            sty $0f,x          ; $ca77: 94 0f     
            sty $a2,x          ; $ca79: 94 a2     
            .hex b2            ; $ca7b: b2        Invalid Opcode - KIL 
            sta __87a4         ; $ca7c: 8d a4 87  
            stx __8ec2         ; $ca7f: 8e c2 8e  
            .hex 0c 8d 0c      ; $ca82: 0c 8d 0c  Invalid Opcode - NOP $0c8d
            sta __9310         ; $ca85: 8d 10 93  
            .hex 7c a9 fd      ; $ca88: 7c a9 fd  Invalid Opcode - NOP __fda9,x
            tay                ; $ca8b: a8        
            jsr __86aa         ; $ca8c: 20 aa 86  
            .hex 92            ; $ca8f: 92        Invalid Opcode - KIL 
            .hex 77 8f         ; $ca90: 77 8f     Invalid Opcode - RRA $8f,x
            .hex 7b a5 86      ; $ca92: 7b a5 86  Invalid Opcode - RRA __86a5,y
            .hex 92            ; $ca95: 92        Invalid Opcode - KIL 
            eor __e4a7,x       ; $ca96: 5d a7 e4  
            .hex 8b 30         ; $ca99: 8b 30     Invalid Opcode - XAA #$30
            lda ($ea,x)        ; $ca9b: a1 ea     
            ldx #$0d           ; $ca9d: a2 0d     
            sty __8c05         ; $ca9f: 8c 05 8c  
            ora __b18c         ; $caa2: 0d 8c b1  
            lda __9277         ; $caa5: ad 77 92  
            .hex b2            ; $caa8: b2        Invalid Opcode - KIL 
            ldx __af79         ; $caa9: ae 79 af  
            .hex 8b ac         ; $caac: 8b ac     Invalid Opcode - XAA #$ac
            pha                ; $caae: 48        
            lda __b1df         ; $caaf: ad df b1  
            .hex f4 af         ; $cab2: f4 af     Invalid Opcode - NOP $af,x
            php                ; $cab4: 08        
            .hex 8b 08         ; $cab5: 8b 08     Invalid Opcode - XAA #$08
            .hex 8b 08         ; $cab7: 8b 08     Invalid Opcode - XAA #$08
            .hex 8b 08         ; $cab9: 8b 08     Invalid Opcode - XAA #$08
            .hex 8b 31         ; $cabb: 8b 31     Invalid Opcode - XAA #$31
            sta ($31),y        ; $cabd: 91 31     
            sta ($31),y        ; $cabf: 91 31     
            sta ($9a),y        ; $cac1: 91 9a     
            tya                ; $cac3: 98        
            bit $90            ; $cac4: 24 90     
            .hex c3 90         ; $cac6: c3 90     Invalid Opcode - DCP ($90,x)
__cac8:     ora __8eab,y       ; $cac8: 19 ab 8e  
            stx $8e,y          ; $cacb: 96 8e     
            stx $eb,y          ; $cacd: 96 eb     
            tya                ; $cacf: 98        
__cad0:     .hex 19 97         ; $cad0: 19 97     Suspected data
__cad2:     cpy #$90           ; $cad2: c0 90     
            eor ($91,x)        ; $cad4: 41 91     
            .hex 5c 90 32      ; $cad6: 5c 90 32  Invalid Opcode - NOP $3290,x
            bcc __cb44         ; $cad9: 90 69     
            .hex a3 74         ; $cadb: a3 74     Invalid Opcode - LAX ($74,x)
            sta __8d74         ; $cadd: 8d 74 8d  
            lsr $90,x          ; $cae0: 56 90     
            sed                ; $cae2: f8        
            sty __905c         ; $cae3: 8c 5c 90  
            jsr __845d         ; $cae6: 20 5d 84  
            lda #$50           ; $cae9: a9 50     
            sta $9f,x          ; $caeb: 95 9f     
            rts                ; $caed: 60        

;-------------------------------------------------------------------------------
            beq __cad0         ; $caee: f0 e0     
            beq __cad2         ; $caf0: f0 e0     
            bpl __cb14         ; $caf2: 10 20     
            jsr __845d         ; $caf4: 20 5d 84  
            ldy $90,x          ; $caf7: b4 90     
            lda __8ac0,y       ; $caf9: b9 c0 8a  
            sta $3d,x          ; $cafc: 95 3d     
            lda __8ac2,y       ; $cafe: b9 c2 8a  
            sta $47,x          ; $cb01: 95 47     
            rts                ; $cb03: 60        

;-------------------------------------------------------------------------------
            .hex 0c 03 00      ; $cb04: 0c 03 00  Bad Addr Mode - NOP $0003
            asl                ; $cb07: 0a        
            jsr __997a         ; $cb08: 20 7a 99  
            jsr __8b5b         ; $cb0b: 20 5b 8b  
            jsr __9b1b         ; $cb0e: 20 1b 9b  
            lda $29,x          ; $cb11: b5 29     
            .hex 15            ; $cb13: 15        Suspected data
__cb14:     .hex 33 29         ; $cb14: 33 29     Invalid Opcode - RLA ($29),y
            .hex 0f d0 37      ; $cb16: 0f d0 37  Invalid Opcode - SLO $37d0
            jsr __b4f9         ; $cb19: 20 f9 b4  
            ldy $0477,x        ; $cb1c: bc 77 04  
            lda $5b,x          ; $cb1f: b5 5b     
            and __8b04,y       ; $cb21: 39 04 8b  
            beq __cb47         ; $cb24: f0 21     
            lda __8b04,y       ; $cb26: b9 04 8b  
            eor #$0f           ; $cb29: 49 0f     
            and $5b,x          ; $cb2b: 35 5b     
            beq __cb50         ; $cb2d: f0 21     
            tya                ; $cb2f: 98        
            eor #$01           ; $cb30: 49 01     
            sta $0477,x        ; $cb32: 9d 77 04  
            tay                ; $cb35: a8        
            txa                ; $cb36: 8a        
            clc                ; $cb37: 18        
            adc __8b06,y       ; $cb38: 79 06 8b  
            tay                ; $cb3b: a8        
            lda $003d,y        ; $cb3c: b9 3d 00  
            eor #$ff           ; $cb3f: 49 ff     
            adc #$01           ; $cb41: 69 01     
            .hex 99            ; $cb43: 99        Suspected data
__cb44:     and $6000,x        ; $cb44: 3d 00 60  
__cb47:     tya                ; $cb47: 98        
            eor #$01           ; $cb48: 49 01     
            sta $0477,x        ; $cb4a: 9d 77 04  
            jsr __8b36         ; $cb4d: 20 36 8b  
__cb50:     lda $0477,x        ; $cb50: bd 77 04  
            bne __cb58         ; $cb53: d0 03     
            jmp __9e50         ; $cb55: 4c 50 9e  

;-------------------------------------------------------------------------------
__cb58:     jmp __9e4b         ; $cb58: 4c 4b 9e  

;-------------------------------------------------------------------------------
            inc $9f,x          ; $cb5b: f6 9f     
            inc $9f,x          ; $cb5d: f6 9f     
            rts                ; $cb5f: 60        

;-------------------------------------------------------------------------------
            beq __cb62         ; $cb60: f0 00     
__cb62:     .hex ff 01 20      ; $cb62: ff 01 20  Invalid Opcode - ISC $2001,x
            lda $798b,x        ; $cb65: bd 8b 79  
            rts                ; $cb68: 60        

;-------------------------------------------------------------------------------
            .hex 8b 95         ; $cb69: 8b 95     Invalid Opcode - XAA #$95
            and #$ad           ; $cb6b: 29 ad     
            ldx $7904,y        ; $cb6d: be 04 79  
            .hex 62            ; $cb70: 62        Invalid Opcode - KIL 
            .hex 8b 95         ; $cb71: 8b 95     Invalid Opcode - XAA #$95
            ora $84,x          ; $cb73: 15 84     
            ora ($a9,x)        ; $cb75: 01 a9     
            asl                ; $cb77: 0a        
            sta $90,x          ; $cb78: 95 90     
            jsr __8441         ; $cb7a: 20 41 84  
            lda $05ae          ; $cb7d: ad ae 05  
            and #$1f           ; $cb80: 29 1f     
            adc #$20           ; $cb82: 69 20     
            sta $33,x          ; $cb84: 95 33     
            ldy $01            ; $cb86: a4 01     
            jsr __8495         ; $cb88: 20 95 84  
            asl $3d,x          ; $cb8b: 16 3d     
            rts                ; $cb8d: 60        

;-------------------------------------------------------------------------------
            brk                ; $cb8e: 00        
            .hex ff 20 bd      ; $cb8f: ff 20 bd  Invalid Opcode - ISC __bd20,x
            .hex 8b 79         ; $cb92: 8b 79     Invalid Opcode - XAA #$79
            stx __958b         ; $cb94: 8e 8b 95  
            and #$a5           ; $cb97: 29 a5     
            cpx $05f0          ; $cb99: ec f0 05  
            lda $04be          ; $cb9c: ad be 04  
            adc #$00           ; $cb9f: 69 00     
            sta $15,x          ; $cba1: 95 15     
            lda $cb            ; $cba3: a5 cb     
            sta $33,x          ; $cba5: 95 33     
            lda $ca            ; $cba7: a5 ca     
            sta $1f,x          ; $cba9: 95 1f     
            sty $01            ; $cbab: 84 01     
            lda #$0f           ; $cbad: a9 0f     
            sta $90,x          ; $cbaf: 95 90     
            jsr __8441         ; $cbb1: 20 41 84  
            ldy $01            ; $cbb4: a4 01     
            jsr __8495         ; $cbb6: 20 95 84  
            jsr __84cd         ; $cbb9: 20 cd 84  
            rts                ; $cbbc: 60        

;-------------------------------------------------------------------------------
            lda $04ff          ; $cbbd: ad ff 04  
            bne __cbe1         ; $cbc0: d0 1f     
            lda $0623          ; $cbc2: ad 23 06  
            clc                ; $cbc5: 18        
            adc #$03           ; $cbc6: 69 03     
            sta $0623          ; $cbc8: 8d 23 06  
            bcc __cbe1         ; $cbcb: 90 14     
            jsr __92c8         ; $cbcd: 20 c8 92  
            bmi __cbe1         ; $cbd0: 30 0f     
            ldy #$00           ; $cbd2: a0 00     
            lda $10            ; $cbd4: a5 10     
            and #$40           ; $cbd6: 29 40     
            bne __cbdb         ; $cbd8: d0 01     
            iny                ; $cbda: c8        
__cbdb:     ldx $00            ; $cbdb: a6 00     
            lda $04c0          ; $cbdd: ad c0 04  
            rts                ; $cbe0: 60        

;-------------------------------------------------------------------------------
__cbe1:     pla                ; $cbe1: 68        
            pla                ; $cbe2: 68        
            rts                ; $cbe3: 60        

;-------------------------------------------------------------------------------
            jsr __b4fd         ; $cbe4: 20 fd b4  
            jsr __927a         ; $cbe7: 20 7a 92  
            jsr __997a         ; $cbea: 20 7a 99  
            jsr __9b1b         ; $cbed: 20 1b 9b  
            lda $79,x          ; $cbf0: b5 79     
            bne __cbf7         ; $cbf2: d0 03     
            .hex 4c            ; $cbf4: 4c        Suspected data
__cbf5:     .hex 77 85         ; $cbf5: 77 85     Invalid Opcode - RRA $85,x
__cbf7:     lda $5b,x          ; $cbf7: b5 5b     
            and #$03           ; $cbf9: 29 03     
            beq __cc00         ; $cbfb: f0 03     
            jsr __91b0         ; $cbfd: 20 b0 91  
__cc00:     jmp __9430         ; $cc00: 4c 30 94  

;-------------------------------------------------------------------------------
            bpl __cbf5         ; $cc03: 10 f0     
            lda $9f,x          ; $cc05: b5 9f     
            asl                ; $cc07: 0a        
            bne __cc0d         ; $cc08: d0 03     
            jsr __8492         ; $cc0a: 20 92 84  
__cc0d:     jsr __b4fd         ; $cc0d: 20 fd b4  
            lda $5b,x          ; $cc10: b5 5b     
            pha                ; $cc12: 48        
            and #$04           ; $cc13: 29 04     
            beq __cc1a         ; $cc15: f0 03     
            jsr __95ce         ; $cc17: 20 ce 95  
__cc1a:     pla                ; $cc1a: 68        
            and #$03           ; $cc1b: 29 03     
            beq __cc22         ; $cc1d: f0 03     
            jsr __9ea9         ; $cc1f: 20 a9 9e  
__cc22:     jsr __8577         ; $cc22: 20 77 85  
            lda #$83           ; $cc25: a9 83     
            sta $046e,x        ; $cc27: 9d 6e 04  
            lda #$02           ; $cc2a: a9 02     
            sta $6f,x          ; $cc2c: 95 6f     
            jsr __997a         ; $cc2e: 20 7a 99  
            inc $9f,x          ; $cc31: f6 9f     
            lda $9f,x          ; $cc33: b5 9f     
            and #$2f           ; $cc35: 29 2f     
            bne __cc3d         ; $cc37: d0 04     
            lda #$10           ; $cc39: a9 10     
            sta $86,x          ; $cc3b: 95 86     
__cc3d:     ldy $86,x          ; $cc3d: b4 86     
            beq __cc8e         ; $cc3f: f0 4d     
            cpy #$06           ; $cc41: c0 06     
            bne __cc7c         ; $cc43: d0 37     
            jsr __92c8         ; $cc45: 20 c8 92  
            bmi __cc7c         ; $cc48: 30 32     
            lda $90,x          ; $cc4a: b5 90     
            pha                ; $cc4c: 48        
            ldx $00            ; $cc4d: a6 00     
            lda $05ae          ; $cc4f: ad ae 05  
            and #$0f           ; $cc52: 29 0f     
            ora #$bc           ; $cc54: 09 bc     
            sta $47,x          ; $cc56: 95 47     
            jsr __9e3b         ; $cc58: 20 3b 9e  
            pla                ; $cc5b: 68        
            cmp #$25           ; $cc5c: c9 25     
            lda __8c03,y       ; $cc5e: b9 03 8c  
            bcc __cc65         ; $cc61: 90 02     
            lda #$00           ; $cc63: a9 00     
__cc65:     sta $3d,x          ; $cc65: 95 3d     
            lda $29,x          ; $cc67: b5 29     
            sbc #$05           ; $cc69: e9 05     
            sta $29,x          ; $cc6b: 95 29     
            lda $15,x          ; $cc6d: b5 15     
            sbc #$00           ; $cc6f: e9 00     
            sta $15,x          ; $cc71: 95 15     
            lda #$20           ; $cc73: a9 20     
            sta $90,x          ; $cc75: 95 90     
            jsr __8441         ; $cc77: 20 41 84  
            ldx $12            ; $cc7a: a6 12     
__cc7c:     lda $65,x          ; $cc7c: b5 65     
            ora #$10           ; $cc7e: 09 10     
            sta $65,x          ; $cc80: 95 65     
            lda #$ae           ; $cc82: a9 ae     
            jsr __9bb3         ; $cc84: 20 b3 9b  
            lda $65,x          ; $cc87: b5 65     
            and #$ef           ; $cc89: 29 ef     
            sta $65,x          ; $cc8b: 95 65     
            rts                ; $cc8d: 60        

;-------------------------------------------------------------------------------
__cc8e:     jmp __9b1b         ; $cc8e: 4c 1b 9b  

;-------------------------------------------------------------------------------
            ldy #$05           ; $cc91: a0 05     
__cc93:     lda $0051,y        ; $cc93: b9 51 00  
            beq __cca3         ; $cc96: f0 0b     
            cpy $12            ; $cc98: c4 12     
            beq __cca3         ; $cc9a: f0 07     
            lda $0090,y        ; $cc9c: b9 90 00  
            cmp #$3d           ; $cc9f: c9 3d     
            beq __ccae         ; $cca1: f0 0b     
__cca3:     dey                ; $cca3: 88        
            bpl __cc93         ; $cca4: 10 ed     
            lda $04b0          ; $cca6: ad b0 04  
            bne __ccae         ; $cca9: d0 03     
__ccab:     jmp __8d6c         ; $ccab: 4c 6c 8d  

;-------------------------------------------------------------------------------
__ccae:     jmp __89a9         ; $ccae: 4c a9 89  

;-------------------------------------------------------------------------------
            ldy #$05           ; $ccb1: a0 05     
__ccb3:     lda $0051,y        ; $ccb3: b9 51 00  
            beq __ccc3         ; $ccb6: f0 0b     
            cpy $12            ; $ccb8: c4 12     
            beq __ccc3         ; $ccba: f0 07     
            lda $0090,y        ; $ccbc: b9 90 00  
            cmp #$44           ; $ccbf: c9 44     
            beq __ccae         ; $ccc1: f0 eb     
__ccc3:     dey                ; $ccc3: 88        
            bpl __ccb3         ; $ccc4: 10 ed     
            lda $04b5          ; $ccc6: ad b5 04  
            bne __ccae         ; $ccc9: d0 e3     
            beq __ccab         ; $cccb: f0 de     
            .hex 20            ; $cccd: 20        Suspected data
__ccce:     iny                ; $ccce: c8        
            .hex 92            ; $cccf: 92        Invalid Opcode - KIL 
            bmi __ccf7         ; $ccd0: 30 25     
            ldx $00            ; $ccd2: a6 00     
            lda #$45           ; $ccd4: a9 45     
            sta $90,x          ; $ccd6: 95 90     
            lda $04c0          ; $ccd8: ad c0 04  
            adc #$d0           ; $ccdb: 69 d0     
            sta $29,x          ; $ccdd: 95 29     
            lda $04be          ; $ccdf: ad be 04  
            adc #$00           ; $cce2: 69 00     
            sta $15,x          ; $cce4: 95 15     
            lda $cb            ; $cce6: a5 cb     
            adc #$e0           ; $cce8: 69 e0     
            sta $33,x          ; $ccea: 95 33     
            lda $ca            ; $ccec: a5 ca     
            adc #$00           ; $ccee: 69 00     
            sta $1f,x          ; $ccf0: 95 1f     
            jsr __8441         ; $ccf2: 20 41 84  
            ldx $12            ; $ccf5: a6 12     
__ccf7:     rts                ; $ccf7: 60        

;-------------------------------------------------------------------------------
            lda #$fc           ; $ccf8: a9 fc     
            sta $47,x          ; $ccfa: 95 47     
            ldy #$f8           ; $ccfc: a0 f8     
            lda $10            ; $ccfe: a5 10     
            sta $045c,x        ; $cd00: 9d 5c 04  
            bpl __cd07         ; $cd03: 10 02     
            ldy #$08           ; $cd05: a0 08     
__cd07:     sty $3d,x          ; $cd07: 94 3d     
            jmp __8574         ; $cd09: 4c 74 85  

;-------------------------------------------------------------------------------
            jsr __b4fd         ; $cd0c: 20 fd b4  
            and #$03           ; $cd0f: 29 03     
            bne __cd16         ; $cd11: d0 03     
            jmp __89a9         ; $cd13: 4c a9 89  

;-------------------------------------------------------------------------------
__cd16:     inc $9f,x          ; $cd16: f6 9f     
            lda $9f,x          ; $cd18: b5 9f     
            asl                ; $cd1a: 0a        
            bne __cd5e         ; $cd1b: d0 41     
            jsr __92c8         ; $cd1d: 20 c8 92  
            bmi __cd5e         ; $cd20: 30 3c     
            ldy $00            ; $cd22: a4 00     
            lda $0029,y        ; $cd24: b9 29 00  
            sec                ; $cd27: 38        
            sbc #$06           ; $cd28: e9 06     
            sta $0029,y        ; $cd2a: 99 29 00  
            lda $0033,y        ; $cd2d: b9 33 00  
            sbc #$04           ; $cd30: e9 04     
            sta $0033,y        ; $cd32: 99 33 00  
            lda $001f,y        ; $cd35: b9 1f 00  
            sbc #$00           ; $cd38: e9 00     
            sta $001f,y        ; $cd3a: 99 1f 00  
            lda #$1a           ; $cd3d: a9 1a     
            sta $0480,y        ; $cd3f: 99 80 04  
            lda #$f8           ; $cd42: a9 f8     
            sta $0047,y        ; $cd44: 99 47 00  
            lda $90,x          ; $cd47: b5 90     
            cmp #$16           ; $cd49: c9 16     
            bne __cd5e         ; $cd4b: d0 11     
            lda #$09           ; $cd4d: a9 09     
            sta $0090,y        ; $cd4f: 99 90 00  
            lda $003d,y        ; $cd52: b9 3d 00  
            asl                ; $cd55: 0a        
            sta $003d,y        ; $cd56: 99 3d 00  
            lda #$ff           ; $cd59: a9 ff     
            sta $0086,y        ; $cd5b: 99 86 00  
__cd5e:     rts                ; $cd5e: 60        

;-------------------------------------------------------------------------------
            dec $33,x          ; $cd5f: d6 33     
            dec $33,x          ; $cd61: d6 33     
            ldy #$01           ; $cd63: a0 01     
            sty $711f          ; $cd65: 8c 1f 71  
            iny                ; $cd68: c8        
            sty $710b          ; $cd69: 8c 0b 71  
            jsr __845d         ; $cd6c: 20 5d 84  
            lda #$00           ; $cd6f: a9 00     
            sta $3d,x          ; $cd71: 95 3d     
            rts                ; $cd73: 60        

;-------------------------------------------------------------------------------
            lda $ee            ; $cd74: a5 ee     
            beq __cd7b         ; $cd76: f0 03     
__cd78:     jmp __8e05         ; $cd78: 4c 05 8e  

;-------------------------------------------------------------------------------
__cd7b:     lda $04b6          ; $cd7b: ad b6 04  
            beq __cd8a         ; $cd7e: f0 0a     
            dec $04b6          ; $cd80: ce b6 04  
            bne __cd78         ; $cd83: d0 f3     
            lda #$80           ; $cd85: a9 80     
            sta $0602          ; $cd87: 8d 02 06  
__cd8a:     lda $04b4          ; $cd8a: ad b4 04  
            beq __cdba         ; $cd8d: f0 2b     
            dec $04b5          ; $cd8f: ce b5 04  
            bne __cd78         ; $cd92: d0 e4     
            lda #$00           ; $cd94: a9 00     
            sta $04b4          ; $cd96: 8d b4 04  
            lda #$01           ; $cd99: a9 01     
            sta $0534          ; $cd9b: 8d 34 05  
            jsr __f6da         ; $cd9e: 20 da f6  
            ldy $0629          ; $cda1: ac 29 06  
            lda $0635          ; $cda4: ad 35 06  
            cmp #$06           ; $cda7: c9 06     
            bne __cdac         ; $cda9: d0 01     
            iny                ; $cdab: c8        
__cdac:     cpy #$02           ; $cdac: c0 02     
            bcc __cdb4         ; $cdae: 90 04     
            inc $0627          ; $cdb0: ee 27 06  
            rts                ; $cdb3: 60        

;-------------------------------------------------------------------------------
__cdb4:     lda #$03           ; $cdb4: a9 03     
            sta $04ec          ; $cdb6: 8d ec 04  
            rts                ; $cdb9: 60        

;-------------------------------------------------------------------------------
__cdba:     lda $04b5          ; $cdba: ad b5 04  
            beq __ce05         ; $cdbd: f0 46     
            cmp #$30           ; $cdbf: c9 30     
            beq __cddb         ; $cdc1: f0 18     
            lda $ee            ; $cdc3: a5 ee     
            and #$04           ; $cdc5: 29 04     
            bne __ce05         ; $cdc7: d0 3c     
            inc $04b5          ; $cdc9: ee b5 04  
            lda $10            ; $cdcc: a5 10     
            and #$03           ; $cdce: 29 03     
            bne __cdd8         ; $cdd0: d0 06     
            dec $711f          ; $cdd2: ce 1f 71  
            inc $710b          ; $cdd5: ee 0b 71  
__cdd8:     jmp __8e05         ; $cdd8: 4c 05 8e  

;-------------------------------------------------------------------------------
__cddb:     lda $5b,x          ; $cddb: b5 5b     
            and #$40           ; $cddd: 29 40     
            beq __ce05         ; $cddf: f0 24     
            lda $33,x          ; $cde1: b5 33     
            cmp $32            ; $cde3: c5 32     
            bcs __ce05         ; $cde5: b0 1e     
            lda $5a            ; $cde7: a5 5a     
            and #$04           ; $cde9: 29 04     
            beq __ce05         ; $cdeb: f0 18     
            lda $9c            ; $cded: a5 9c     
            bne __ce05         ; $cdef: d0 14     
            lda #$06           ; $cdf1: a9 06     
            sta $50            ; $cdf3: 85 50     
            lda #$30           ; $cdf5: a9 30     
            sta $82            ; $cdf7: 85 82     
            lda #$fc           ; $cdf9: a9 fc     
            sta $46            ; $cdfb: 85 46     
            lda #$80           ; $cdfd: a9 80     
            sta $0602          ; $cdff: 8d 02 06  
            inc $04b4          ; $ce02: ee b4 04  
__ce05:     lda $ef            ; $ce05: a5 ef     
            bne __ce60         ; $ce07: d0 57     
            lda $90,x          ; $ce09: b5 90     
            sec                ; $ce0b: 38        
            sbc #$41           ; $ce0c: e9 41     
            sta $6f,x          ; $ce0e: 95 6f     
            lda $04b5          ; $ce10: ad b5 04  
            sta $07            ; $ce13: 85 07     
            lsr                ; $ce15: 4a        
            lsr                ; $ce16: 4a        
            eor #$ff           ; $ce17: 49 ff     
            sec                ; $ce19: 38        
            adc $042c          ; $ce1a: 6d 2c 04  
            sta $042c          ; $ce1d: 8d 2c 04  
            ldy $04bd          ; $ce20: ac bd 04  
            beq __ce27         ; $ce23: f0 02     
            ldy #$10           ; $ce25: a0 10     
__ce27:     sty $f4            ; $ce27: 84 f4     
            lda #$8e           ; $ce29: a9 8e     
            ldy $07            ; $ce2b: a4 07     
            beq __ce31         ; $ce2d: f0 02     
            lda #$92           ; $ce2f: a9 92     
__ce31:     jsr __9bb3         ; $ce31: 20 b3 9b  
            lda $07            ; $ce34: a5 07     
            tay                ; $ce36: a8        
            lsr                ; $ce37: 4a        
            clc                ; $ce38: 18        
            adc $042c          ; $ce39: 6d 2c 04  
            adc #$08           ; $ce3c: 69 08     
            cpy #$00           ; $ce3e: c0 00     
            bne __ce44         ; $ce40: d0 02     
            adc #$07           ; $ce42: 69 07     
__ce44:     sta $00            ; $ce44: 85 00     
            jsr __fafe         ; $ce46: 20 fe fa  
            ldx #$9a           ; $ce49: a2 9a     
            lda $07            ; $ce4b: a5 07     
            beq __ce58         ; $ce4d: f0 09     
            lda $04b4          ; $ce4f: ad b4 04  
            beq __ce56         ; $ce52: f0 02     
            ldy #$10           ; $ce54: a0 10     
__ce56:     ldx #$96           ; $ce56: a2 96     
__ce58:     sty $f4            ; $ce58: 84 f4     
            jsr __9cf2         ; $ce5a: 20 f2 9c  
            jsr __9cf2         ; $ce5d: 20 f2 9c  
__ce60:     ldx $12            ; $ce60: a6 12     
            rts                ; $ce62: 60        

;-------------------------------------------------------------------------------
            jsr __8d6c         ; $ce63: 20 6c 8d  
            lda $29,x          ; $ce66: b5 29     
            adc #$08           ; $ce68: 69 08     
            sta $29,x          ; $ce6a: 95 29     
            lda $33,x          ; $ce6c: b5 33     
            lsr                ; $ce6e: 4a        
            lsr                ; $ce6f: 4a        
            lsr                ; $ce70: 4a        
            lsr                ; $ce71: 4a        
            sta $b1,x          ; $ce72: 95 b1     
            lda #$80           ; $ce74: a9 80     
            sta $86,x          ; $ce76: 95 86     
__ce78:     rts                ; $ce78: 60        

;-------------------------------------------------------------------------------
            ldy __b1ae         ; $ce79: ac ae b1  
            lda $b8,x          ; $ce7c: b5 b8     
            ldy __c4c0,x       ; $ce7e: bc c0 c4  
            iny                ; $ce81: c8        
            cpy __d8d2         ; $ce82: cc d2 d8  
            .hex 92            ; $ce85: 92        Invalid Opcode - KIL 
            nop                ; $ce86: ea        
            jsr __997a         ; $ce87: 20 7a 99  
            inc $9f,x          ; $ce8a: f6 9f     
            jsr __98d6         ; $ce8c: 20 d6 98  
            jsr __98cd         ; $ce8f: 20 cd 98  
            lda #$09           ; $ce92: a9 09     
            ldy $47,x          ; $ce94: b4 47     
            bmi __ce9a         ; $ce96: 30 02     
            lda #$89           ; $ce98: a9 89     
__ce9a:     sta $65,x          ; $ce9a: 95 65     
            ldy $ec            ; $ce9c: a4 ec     
            lda $33,x          ; $ce9e: b5 33     
            cmp __8e85,y       ; $cea0: d9 85 8e  
            bcc __ceb6         ; $cea3: 90 11     
            ldy $86,x          ; $cea5: b4 86     
            bne __ce78         ; $cea7: d0 cf     
            sta $33,x          ; $cea9: 95 33     
            ldy $b1,x          ; $ceab: b4 b1     
            lda __8e79,y       ; $cead: b9 79 8e  
            sta $47,x          ; $ceb0: 95 47     
            lda #$c0           ; $ceb2: a9 c0     
            sta $86,x          ; $ceb4: 95 86     
__ceb6:     jsr __9430         ; $ceb6: 20 30 94  
            inc $47,x          ; $ceb9: f6 47     
            jmp __9b1b         ; $cebb: 4c 1b 9b  

;-------------------------------------------------------------------------------
            .hex fa            ; $cebe: fa        Invalid Opcode - NOP 
            .hex 0c 91 11      ; $cebf: 0c 91 11  Invalid Opcode - NOP $1191
            jsr __997a         ; $cec2: 20 7a 99  
            inc $9f,x          ; $cec5: f6 9f     
            jsr __98cd         ; $cec7: 20 cd 98  
            jsr __9b1b         ; $ceca: 20 1b 9b  
            jsr __98d6         ; $cecd: 20 d6 98  
            lda #$00           ; $ced0: a9 00     
            sta $3d,x          ; $ced2: 95 3d     
            jsr __b4e2         ; $ced4: 20 e2 b4  
            ldy $0477,x        ; $ced7: bc 77 04  
            bcc __ceec         ; $ceda: 90 10     
            lda $33,x          ; $cedc: b5 33     
            cmp $cb            ; $cede: c5 cb     
            lda $1f,x          ; $cee0: b5 1f     
            sbc $ca            ; $cee2: e5 ca     
            beq __cef3         ; $cee4: f0 0d     
            asl                ; $cee6: 0a        
            rol                ; $cee7: 2a        
            and #$01           ; $cee8: 29 01     
            bpl __ceef         ; $ceea: 10 03     
__ceec:     tya                ; $ceec: 98        
            eor #$01           ; $ceed: 49 01     
__ceef:     sta $0477,x        ; $ceef: 9d 77 04  
            tay                ; $cef2: a8        
__cef3:     lda __8ebe,y       ; $cef3: b9 be 8e  
            sta $47,x          ; $cef6: 95 47     
            lda __8ec0,y       ; $cef8: b9 c0 8e  
            sta $65,x          ; $cefb: 95 65     
            jsr __9e3b         ; $cefd: 20 3b 9e  
            lda $0f            ; $cf00: a5 0f     
            adc #$10           ; $cf02: 69 10     
            cmp #$20           ; $cf04: c9 20     
            bcs __cf0a         ; $cf06: b0 02     
            asl $47,x          ; $cf08: 16 47     
__cf0a:     jmp __9e4b         ; $cf0a: 4c 4b 9e  

;-------------------------------------------------------------------------------
            lda $ef            ; $cf0d: a5 ef     
            beq __cf14         ; $cf0f: f0 03     
            jmp __89a9         ; $cf11: 4c a9 89  

;-------------------------------------------------------------------------------
__cf14:     ldy #$fc           ; $cf14: a0 fc     
            lda $10            ; $cf16: a5 10     
            and #$20           ; $cf18: 29 20     
            beq __cf1e         ; $cf1a: f0 02     
            ldy #$04           ; $cf1c: a0 04     
__cf1e:     sty $3d,x          ; $cf1e: 94 3d     
            lda #$f8           ; $cf20: a9 f8     
            sta $47,x          ; $cf22: 95 47     
            jsr __9430         ; $cf24: 20 30 94  
            lda $ee            ; $cf27: a5 ee     
            and #$08           ; $cf29: 29 08     
            ora $ef            ; $cf2b: 05 ef     
            bne __cf4e         ; $cf2d: d0 1f     
            ldy $f4            ; $cf2f: a4 f4     
            lda $042c          ; $cf31: ad 2c 04  
            sta $0200,y        ; $cf34: 99 00 02  
            lda $0429          ; $cf37: ad 29 04  
            sta $0203,y        ; $cf3a: 99 03 02  
            lda #$d8           ; $cf3d: a9 d8     
            sta $0201,y        ; $cf3f: 99 01 02  
            lda $10            ; $cf42: a5 10     
            and #$20           ; $cf44: 29 20     
            eor #$20           ; $cf46: 49 20     
            asl                ; $cf48: 0a        
            ora #$01           ; $cf49: 09 01     
            sta $0202,y        ; $cf4b: 99 02 02  
__cf4e:     rts                ; $cf4e: 60        

;-------------------------------------------------------------------------------
            .hex 43 41         ; $cf4f: 43 41     Invalid Opcode - SRE ($41,x)
            .hex 42            ; $cf51: 42        Invalid Opcode - KIL 
            jsr __845d         ; $cf52: 20 5d 84  
            ldy #$00           ; $cf55: a0 00     
            lda $29,x          ; $cf57: b5 29     
            cmp #$a0           ; $cf59: c9 a0     
            beq __cf63         ; $cf5b: f0 06     
            iny                ; $cf5d: c8        
            cmp #$b0           ; $cf5e: c9 b0     
            beq __cf63         ; $cf60: f0 01     
            iny                ; $cf62: c8        
__cf63:     sty $79,x          ; $cf63: 94 79     
            lda __8f4f,y       ; $cf65: b9 4f 8f  
            sta $65,x          ; $cf68: 95 65     
            lda #$02           ; $cf6a: a9 02     
            sta $0465,x        ; $cf6c: 9d 65 04  
            lda $15,x          ; $cf6f: b5 15     
            sta $04ef,x        ; $cf71: 9d ef 04  
            rts                ; $cf74: 60        

;-------------------------------------------------------------------------------
            inc $20f8,x        ; $cf75: fe f8 20  
            .hex 7a            ; $cf78: 7a        Invalid Opcode - NOP 
            sta __fd20,y       ; $cf79: 99 20 fd  
            ldy $a9,x          ; $cf7c: b4 a9     
            brk                ; $cf7e: 00        
            sta $3d,x          ; $cf7f: 95 3d     
            jsr __9e3b         ; $cf81: 20 3b 9e  
            iny                ; $cf84: c8        
            sty $6f,x          ; $cf85: 94 6f     
            jsr __9b1b         ; $cf87: 20 1b 9b  
            lda $5b,x          ; $cf8a: b5 5b     
            and #$04           ; $cf8c: 29 04     
            beq __cfd2         ; $cf8e: f0 42     
            jsr __95ce         ; $cf90: 20 ce 95  
            lda $10            ; $cf93: a5 10     
            bne __cfa3         ; $cf95: d0 0c     
            lda #$e0           ; $cf97: a9 e0     
            sta $47,x          ; $cf99: 95 47     
            bne __cfd2         ; $cf9b: d0 35     
            .hex 7f 3f 3f      ; $cf9d: 7f 3f 3f  Invalid Opcode - RRA $3f3f,x
            php                ; $cfa0: 08        
            asl $04            ; $cfa1: 06 04     
__cfa3:     ldy $79,x          ; $cfa3: b4 79     
            lda __8f9d,y       ; $cfa5: b9 9d 8f  
            and $10            ; $cfa8: 25 10     
            bne __cfb6         ; $cfaa: d0 0a     
            lda $ee            ; $cfac: a5 ee     
            and #$0c           ; $cfae: 29 0c     
            bne __cfb6         ; $cfb0: d0 04     
            lda #$1c           ; $cfb2: a9 1c     
            sta $86,x          ; $cfb4: 95 86     
__cfb6:     ldy $86,x          ; $cfb6: b4 86     
            bne __cfd5         ; $cfb8: d0 1b     
            inc $b1,x          ; $cfba: f6 b1     
            lda $b1,x          ; $cfbc: b5 b1     
            and #$40           ; $cfbe: 29 40     
            beq __d01b         ; $cfc0: f0 59     
            jsr __8b5b         ; $cfc2: 20 5b 8b  
            lda #$0a           ; $cfc5: a9 0a     
            ldy $b1,x          ; $cfc7: b4 b1     
            bmi __cfcd         ; $cfc9: 30 02     
            lda #$f6           ; $cfcb: a9 f6     
__cfcd:     sta $3d,x          ; $cfcd: 95 3d     
            jmp __9e50         ; $cfcf: 4c 50 9e  

;-------------------------------------------------------------------------------
__cfd2:     jmp __857f         ; $cfd2: 4c 7f 85  

;-------------------------------------------------------------------------------
__cfd5:     cpy #$08           ; $cfd5: c0 08     
            bne __d01b         ; $cfd7: d0 42     
            lda #$01           ; $cfd9: a9 01     
            sta $0602          ; $cfdb: 8d 02 06  
            jsr __95e5         ; $cfde: 20 e5 95  
            bmi __d01b         ; $cfe1: 30 38     
            ldy $0465,x        ; $cfe3: bc 65 04  
            lda $79,x          ; $cfe6: b5 79     
            ldx $00            ; $cfe8: a6 00     
            cmp #$02           ; $cfea: c9 02     
            beq __cffc         ; $cfec: f0 0e     
            cmp #$01           ; $cfee: c9 01     
            bne __d002         ; $cff0: d0 10     
            lda $05ae          ; $cff2: ad ae 05  
            and #$1f           ; $cff5: 29 1f     
            cmp __8fa0,y       ; $cff7: d9 a0 8f  
            bcs __d002         ; $cffa: b0 06     
__cffc:     inc $79,x          ; $cffc: f6 79     
            lda #$20           ; $cffe: a9 20     
            bne __d004         ; $d000: d0 02     
__d002:     lda #$1e           ; $d002: a9 1e     
__d004:     sta $90,x          ; $d004: 95 90     
            lda $33,x          ; $d006: b5 33     
            clc                ; $d008: 18        
            adc #$03           ; $d009: 69 03     
            sta $33,x          ; $d00b: 95 33     
            ldy $6f,x          ; $d00d: b4 6f     
            lda $29,x          ; $d00f: b5 29     
            adc __8f74,y       ; $d011: 79 74 8f  
            sta $29,x          ; $d014: 95 29     
            jsr __8441         ; $d016: 20 41 84  
            ldx $12            ; $d019: a6 12     
__d01b:     jmp __9b1b         ; $d01b: 4c 1b 9b  

;-------------------------------------------------------------------------------
            clc                ; $d01e: 18        
            inx                ; $d01f: e8        
            inc __f0f8,x       ; $d020: fe f8 f0  
            inx                ; $d023: e8        
            jsr __8b5b         ; $d024: 20 5b 8b  
            lda $47,x          ; $d027: b5 47     
            cmp #$ea           ; $d029: c9 ea     
            bne __d032         ; $d02b: d0 05     
            lda #$04           ; $d02d: a9 04     
            sta $0604          ; $d02f: 8d 04 06  
__d032:     lda $47,x          ; $d032: b5 47     
            cmp #$10           ; $d034: c9 10     
            bmi __d05c         ; $d036: 30 24     
            jsr __91b0         ; $d038: 20 b0 91  
            lda $90,x          ; $d03b: b5 90     
            cmp #$40           ; $d03d: c9 40     
            beq __d045         ; $d03f: f0 04     
            inc $062b          ; $d041: ee 2b 06  
            rts                ; $d044: 60        

;-------------------------------------------------------------------------------
__d045:     inc $0620          ; $d045: ee 20 06  
            inc $04ed          ; $d048: ee ed 04  
            bne __d050         ; $d04b: d0 03     
            dec $04ed          ; $d04d: ce ed 04  
__d050:     lda #$10           ; $d050: a9 10     
            sta $0602          ; $d052: 8d 02 06  
            rts                ; $d055: 60        

;-------------------------------------------------------------------------------
            inc $042c          ; $d056: ee 2c 04  
            jsr __91c7         ; $d059: 20 c7 91  
__d05c:     lda $a8,x          ; $d05c: b5 a8     
            cmp #$01           ; $d05e: c9 01     
            bne __d066         ; $d060: d0 04     
            lda $9a            ; $d062: a5 9a     
            beq __d069         ; $d064: f0 03     
__d066:     jmp __90c3         ; $d066: 4c c3 90  

;-------------------------------------------------------------------------------
__d069:     jsr __960f         ; $d069: 20 0f 96  
            lda #$00           ; $d06c: a9 00     
            sta $9c            ; $d06e: 85 9c     
            sta $a8,x          ; $d070: 95 a8     
            jsr __91b0         ; $d072: 20 b0 91  
            lda $90,x          ; $d075: b5 90     
            cmp #$44           ; $d077: c9 44     
            bne __d08e         ; $d079: d0 13     
            lda $04b5          ; $d07b: ad b5 04  
            bne __d08d         ; $d07e: d0 0d     
            lda #$20           ; $d080: a9 20     
            sta $0603          ; $d082: 8d 03 06  
            lda #$60           ; $d085: a9 60     
            sta $04b6          ; $d087: 8d b6 04  
            inc $04b5          ; $d08a: ee b5 04  
__d08d:     rts                ; $d08d: 60        

;-------------------------------------------------------------------------------
__d08e:     cmp #$40           ; $d08e: c9 40     
            beq __d0ad         ; $d090: f0 1b     
            cmp #$46           ; $d092: c9 46     
            beq __d0ba         ; $d094: f0 24     
            cmp #$3f           ; $d096: c9 3f     
            bne __d0b1         ; $d098: d0 17     
            ldx $79            ; $d09a: a6 79     
            inc $04fb,x        ; $d09c: fe fb 04  
            ldx $12            ; $d09f: a6 12     
            inc $04c3          ; $d0a1: ee c3 04  
            jsr __f218         ; $d0a4: 20 18 f2  
            lda #$01           ; $d0a7: a9 01     
            sta $0603          ; $d0a9: 8d 03 06  
            rts                ; $d0ac: 60        

;-------------------------------------------------------------------------------
__d0ad:     lda #$09           ; $d0ad: a9 09     
            sta $65,x          ; $d0af: 95 65     
__d0b1:     lda #$e0           ; $d0b1: a9 e0     
            sta $47,x          ; $d0b3: 95 47     
            lda #$01           ; $d0b5: a9 01     
            sta $51,x          ; $d0b7: 95 51     
            rts                ; $d0b9: 60        

;-------------------------------------------------------------------------------
__d0ba:     lda #$ff           ; $d0ba: a9 ff     
            sta $04ff          ; $d0bc: 8d ff 04  
            rts                ; $d0bf: 60        

;-------------------------------------------------------------------------------
            jsr __91c7         ; $d0c0: 20 c7 91  
            jsr __b4fd         ; $d0c3: 20 fd b4  
            lda $5b,x          ; $d0c6: b5 5b     
            pha                ; $d0c8: 48        
            and $6f,x          ; $d0c9: 35 6f     
            beq __d0d9         ; $d0cb: f0 0c     
            jsr __9ea9         ; $d0cd: 20 a9 9e  
            jsr __95b0         ; $d0d0: 20 b0 95  
            jsr __95b0         ; $d0d3: 20 b0 95  
            jsr __95b0         ; $d0d6: 20 b0 95  
__d0d9:     pla                ; $d0d9: 68        
            and #$04           ; $d0da: 29 04     
            beq __d0fb         ; $d0dc: f0 1d     
            lda $47,x          ; $d0de: b5 47     
            cmp #$09           ; $d0e0: c9 09     
            bcc __d0f2         ; $d0e2: 90 0e     
            lsr                ; $d0e4: 4a        
            lsr                ; $d0e5: 4a        
            lsr                ; $d0e6: 4a        
            lsr                ; $d0e7: 4a        
            tay                ; $d0e8: a8        
            lda __9020,y       ; $d0e9: b9 20 90  
            jsr __95aa         ; $d0ec: 20 aa 95  
            jmp __90fb         ; $d0ef: 4c fb 90  

;-------------------------------------------------------------------------------
__d0f2:     jsr __95ce         ; $d0f2: 20 ce 95  
            lda $0b            ; $d0f5: a5 0b     
            bne __d0fb         ; $d0f7: d0 02     
            sta $3d,x          ; $d0f9: 95 3d     
__d0fb:     lda $90,x          ; $d0fb: b5 90     
            cmp #$37           ; $d0fd: c9 37     
            bne __d131         ; $d0ff: d0 30     
            lda $86,x          ; $d101: b5 86     
            bne __d122         ; $d103: d0 1d     
            ldy $a8,x          ; $d105: b4 a8     
            beq __d10d         ; $d107: f0 04     
            sta $9c            ; $d109: 85 9c     
            sta $a8,x          ; $d10b: 95 a8     
__d10d:     lda #$04           ; $d10d: a9 04     
            sta $51,x          ; $d10f: 95 51     
            lda #$20           ; $d111: a9 20     
            sta $86,x          ; $d113: 95 86     
            sta $04c6          ; $d115: 8d c6 04  
            lda #$01           ; $d118: a9 01     
            sta $0601          ; $d11a: 8d 01 06  
            lsr                ; $d11d: 4a        
            sta $042f,x        ; $d11e: 9d 2f 04  
            rts                ; $d121: 60        

;-------------------------------------------------------------------------------
__d122:     .hex c9            ; $d122: c9        Suspected data
__d123:     rti                ; $d123: 40        

;-------------------------------------------------------------------------------
            bcs __d131         ; $d124: b0 0b     
            lsr                ; $d126: 4a        
            bcc __d131         ; $d127: 90 08     
            inc $65,x          ; $d129: f6 65     
            lda $65,x          ; $d12b: b5 65     
            and #$fb           ; $d12d: 29 fb     
            sta $65,x          ; $d12f: 95 65     
__d131:     jsr __98cd         ; $d131: 20 cd 98  
            jsr __8577         ; $d134: 20 77 85  
            lda $b1,x          ; $d137: b5 b1     
            bne __d13e         ; $d139: d0 03     
            jmp __9ba7         ; $d13b: 4c a7 9b  

;-------------------------------------------------------------------------------
__d13e:     jmp __9bb3         ; $d13e: 4c b3 9b  

;-------------------------------------------------------------------------------
            jsr __98cd         ; $d141: 20 cd 98  
            jsr __b4fd         ; $d144: 20 fd b4  
            lda $5b,x          ; $d147: b5 5b     
            pha                ; $d149: 48        
            and #$03           ; $d14a: 29 03     
            beq __d157         ; $d14c: f0 09     
            jsr __9ea9         ; $d14e: 20 a9 9e  
            jsr __95b0         ; $d151: 20 b0 95  
            jsr __95b0         ; $d154: 20 b0 95  
__d157:     pla                ; $d157: 68        
            and #$04           ; $d158: 29 04     
            beq __d131         ; $d15a: f0 d5     
            jsr __95ce         ; $d15c: 20 ce 95  
            lda $33,x          ; $d15f: b5 33     
            sec                ; $d161: 38        
            sbc #$10           ; $d162: e9 10     
            sta $33,x          ; $d164: 95 33     
            lda $29,x          ; $d166: b5 29     
            adc #$07           ; $d168: 69 07     
            and #$f0           ; $d16a: 29 f0     
            sta $29,x          ; $d16c: 95 29     
            lda $15,x          ; $d16e: b5 15     
            adc #$00           ; $d170: 69 00     
            sta $15,x          ; $d172: 95 15     
            lda #$10           ; $d174: a9 10     
            sta $0453,x        ; $d176: 9d 53 04  
            lda #$02           ; $d179: a9 02     
            sta $0602          ; $d17b: 8d 02 06  
            inc $b1,x          ; $d17e: f6 b1     
            lda #$3c           ; $d180: a9 3c     
            sta $90,x          ; $d182: 95 90     
            jsr __8441         ; $d184: 20 41 84  
            lda #$10           ; $d187: a9 10     
            sta $05bb          ; $d189: 8d bb 05  
            lda $ec            ; $d18c: a5 ec     
            bne __d198         ; $d18e: d0 08     
            lda #$40           ; $d190: a9 40     
            sta $0601          ; $d192: 8d 01 06  
            jsr __89a9         ; $d195: 20 a9 89  
__d198:     jsr __92c8         ; $d198: 20 c8 92  
            bmi __d1c4         ; $d19b: 30 27     
            ldy $00            ; $d19d: a4 00     
            lda $29,x          ; $d19f: b5 29     
            sta $0029,y        ; $d1a1: 99 29 00  
            lda $15,x          ; $d1a4: b5 15     
            sta $0015,y        ; $d1a6: 99 15 00  
            lda #$41           ; $d1a9: a9 41     
            sta $0065,y        ; $d1ab: 99 65 00  
            tya                ; $d1ae: 98        
            tax                ; $d1af: aa        
            lda $65,x          ; $d1b0: b5 65     
            and #$fc           ; $d1b2: 29 fc     
            ora #$01           ; $d1b4: 09 01     
            sta $65,x          ; $d1b6: 95 65     
            lda #$05           ; $d1b8: a9 05     
            sta $51,x          ; $d1ba: 95 51     
            sta $9f,x          ; $d1bc: 95 9f     
            lda #$1f           ; $d1be: a9 1f     
            sta $86,x          ; $d1c0: 95 86     
            ldx $12            ; $d1c2: a6 12     
__d1c4:     rts                ; $d1c4: 60        

;-------------------------------------------------------------------------------
            sed                ; $d1c5: f8        
            php                ; $d1c6: 08        
            lda $79,x          ; $d1c7: b5 79     
            bne __d1de         ; $d1c9: d0 13     
            ldy #$05           ; $d1cb: a0 05     
__d1cd:     lda $0051,y        ; $d1cd: b9 51 00  
            cmp #$01           ; $d1d0: c9 01     
            bne __d1db         ; $d1d2: d0 07     
            lda $0090,y        ; $d1d4: b9 90 00  
            cmp #$1c           ; $d1d7: c9 1c     
            beq __d1e5         ; $d1d9: f0 0a     
__d1db:     dey                ; $d1db: 88        
            bpl __d1cd         ; $d1dc: 10 ef     
__d1de:     lda #$01           ; $d1de: a9 01     
            sta $79,x          ; $d1e0: 95 79     
            jmp __8441         ; $d1e2: 4c 41 84  

;-------------------------------------------------------------------------------
__d1e5:     lda $0015,y        ; $d1e5: b9 15 00  
            cmp $15,x          ; $d1e8: d5 15     
            .hex d0            ; $d1ea: d0        Suspected data
__d1eb:     .hex f2            ; $d1eb: f2        Invalid Opcode - KIL 
            lda $0029,y        ; $d1ec: b9 29 00  
            sta $29,x          ; $d1ef: 95 29     
            lda $0033,y        ; $d1f1: b9 33 00  
            adc #$0e           ; $d1f4: 69 0e     
            sta $33,x          ; $d1f6: 95 33     
            jsr __9e3b         ; $d1f8: 20 3b 9e  
            lda __91c5,y       ; $d1fb: b9 c5 91  
            sta $3d,x          ; $d1fe: 95 3d     
            lda #$e0           ; $d200: a9 e0     
            sta $47,x          ; $d202: 95 47     
            pla                ; $d204: 68        
            pla                ; $d205: 68        
            lda #$07           ; $d206: a9 07     
            sta $046e,x        ; $d208: 9d 6e 04  
            lda #$30           ; $d20b: a9 30     
            sta $f4            ; $d20d: 85 f4     
            jmp __9b1b         ; $d20f: 4c 1b 9b  

;-------------------------------------------------------------------------------
            .hex f0            ; $d212: f0        Suspected data
__d213:     .hex ff 00 20      ; $d213: ff 00 20  Invalid Opcode - ISC $2000,x
            eor __a984,x       ; $d216: 5d 84 a9  
            beq __d1eb         ; $d219: f0 d0     
            ora $20            ; $d21b: 05 20     
            eor __a984,x       ; $d21d: 5d 84 a9  
            .hex 10            ; $d220: 10        Suspected data
__d221:     sta $3d,x          ; $d221: 95 3d     
            inc $b1,x          ; $d223: f6 b1     
            lda $90,x          ; $d225: b5 90     
            sec                ; $d227: 38        
            sbc #$0b           ; $d228: e9 0b     
            tay                ; $d22a: a8        
            lda $04c0          ; $d22b: ad c0 04  
            adc __9212,y       ; $d22e: 79 12 92  
            sta $29,x          ; $d231: 95 29     
            lda $04be          ; $d233: ad be 04  
            adc __9213,y       ; $d236: 79 13 92  
            sta $15,x          ; $d239: 95 15     
            rts                ; $d23b: 60        

;-------------------------------------------------------------------------------
            jsr __9af2         ; $d23c: 20 f2 9a  
            inc $9f,x          ; $d23f: f6 9f     
            lda $b1,x          ; $d241: b5 b1     
            bne __d271         ; $d243: d0 2c     
            lda $5b,x          ; $d245: b5 5b     
            and #$10           ; $d247: 29 10     
            bne __d256         ; $d249: d0 0b     
            jsr __9e3b         ; $d24b: 20 3b 9e  
            lda $0f            ; $d24e: a5 0f     
            adc #$30           ; $d250: 69 30     
            cmp #$60           ; $d252: c9 60     
            bcs __d26e         ; $d254: b0 18     
__d256:     jsr __92c8         ; $d256: 20 c8 92  
            bmi __d26e         ; $d259: 30 13     
            ldx $00            ; $d25b: a6 00     
            lda #$09           ; $d25d: a9 09     
            sta $90,x          ; $d25f: 95 90     
            lda $33,x          ; $d261: b5 33     
            adc #$10           ; $d263: 69 10     
            sta $33,x          ; $d265: 95 33     
            jsr __84f2         ; $d267: 20 f2 84  
            ldx $12            ; $d26a: a6 12     
            inc $b1,x          ; $d26c: f6 b1     
__d26e:     jmp __9274         ; $d26e: 4c 74 92  

;-------------------------------------------------------------------------------
__d271:     jsr __997a         ; $d271: 20 7a 99  
            jmp __9e50         ; $d274: 4c 50 9e  

;-------------------------------------------------------------------------------
            jsr __9289         ; $d277: 20 89 92  
            asl $65,x          ; $d27a: 16 65     
            lda $10            ; $d27c: a5 10     
            lsr                ; $d27e: 4a        
            lsr                ; $d27f: 4a        
            lsr                ; $d280: 4a        
            ror $65,x          ; $d281: 76 65     
            rts                ; $d283: 60        

;-------------------------------------------------------------------------------
            bne __d289         ; $d284: d0 03     
            jsr __b4fd         ; $d286: 20 fd b4  
__d289:     jsr __997a         ; $d289: 20 7a 99  
            jsr __98cd         ; $d28c: 20 cd 98  
            lda $b1,x          ; $d28f: b5 b1     
            ora $042f,x        ; $d291: 1d 2f 04  
            beq __d299         ; $d294: f0 03     
            jmp __8574         ; $d296: 4c 74 85  

;-------------------------------------------------------------------------------
__d299:     lda $47,x          ; $d299: b5 47     
            bpl __d29f         ; $d29b: 10 02     
            sta $b1,x          ; $d29d: 95 b1     
__d29f:     lda $5b,x          ; $d29f: b5 5b     
            and #$03           ; $d2a1: 29 03     
            beq __d2be         ; $d2a3: f0 19     
            sta $b1,x          ; $d2a5: 95 b1     
            lda $90,x          ; $d2a7: b5 90     
            cmp #$1b           ; $d2a9: c9 1b     
            bne __d2b5         ; $d2ab: d0 08     
            lda #$02           ; $d2ad: a9 02     
            sta $51,x          ; $d2af: 95 51     
            inc $33,x          ; $d2b1: f6 33     
            inc $33,x          ; $d2b3: f6 33     
__d2b5:     jsr __9ea9         ; $d2b5: 20 a9 9e  
            jsr __95b0         ; $d2b8: 20 b0 95  
            jsr __95b0         ; $d2bb: 20 b0 95  
__d2be:     jsr __9e50         ; $d2be: 20 50 9e  
            jmp __9b1b         ; $d2c1: 4c 1b 9b  

;-------------------------------------------------------------------------------
            ldy #$08           ; $d2c4: a0 08     
            bne __d2ca         ; $d2c6: d0 02     
            ldy #$05           ; $d2c8: a0 05     
__d2ca:     lda $0051,y        ; $d2ca: b9 51 00  
            beq __d2d3         ; $d2cd: f0 04     
            dey                ; $d2cf: 88        
            bpl __d2ca         ; $d2d0: 10 f8     
            rts                ; $d2d2: 60        

;-------------------------------------------------------------------------------
__d2d3:     lda #$01           ; $d2d3: a9 01     
            sta $0051,y        ; $d2d5: 99 51 00  
            lsr                ; $d2d8: 4a        
            .hex 99            ; $d2d9: 99        Suspected data
__d2da:     .hex 9b            ; $d2da: 9b        Invalid Opcode - TAS 
            .hex 04 a9         ; $d2db: 04 a9     Invalid Opcode - NOP $a9
            ora ($99,x)        ; $d2dd: 01 99     
            bcc __d2e1         ; $d2df: 90 00     
__d2e1:     lda $29,x          ; $d2e1: b5 29     
            adc #$05           ; $d2e3: 69 05     
            sta $0029,y        ; $d2e5: 99 29 00  
            lda $15,x          ; $d2e8: b5 15     
            adc #$00           ; $d2ea: 69 00     
            sta $0015,y        ; $d2ec: 99 15 00  
            lda $33,x          ; $d2ef: b5 33     
            sta $0033,y        ; $d2f1: 99 33 00  
            lda $1f,x          ; $d2f4: b5 1f     
            sta $001f,y        ; $d2f6: 99 1f 00  
            sty $00            ; $d2f9: 84 00     
            tya                ; $d2fb: 98        
            tax                ; $d2fc: aa        
            jsr __845d         ; $d2fd: 20 5d 84  
            jsr __8569         ; $d300: 20 69 85  
            ldx $12            ; $d303: a6 12     
            rts                ; $d305: 60        

;-------------------------------------------------------------------------------
            ora ($ff,x)        ; $d306: 01 ff     
            bmi __d2da         ; $d308: 30 d0     
            ora ($ff,x)        ; $d30a: 01 ff     
            ora ($18,x)        ; $d30c: 01 18     
            inx                ; $d30e: e8        
            clc                ; $d30f: 18        
            lda $044a,x        ; $d310: bd 4a 04  
            beq __d318         ; $d313: f0 03     
            dec $044a,x        ; $d315: de 4a 04  
__d318:     jsr __9b1b         ; $d318: 20 1b 9b  
            ldy #$01           ; $d31b: a0 01     
            lda $9c            ; $d31d: a5 9c     
            beq __d33b         ; $d31f: f0 1a     
            ldx $042d          ; $d321: ae 2d 04  
            lda $90,x          ; $d324: b5 90     
            ldx $12            ; $d326: a6 12     
            cmp #$3d           ; $d328: c9 3d     
            bcc __d33b         ; $d32a: 90 0f     
            cmp #$3e           ; $d32c: c9 3e     
            bcs __d33b         ; $d32e: b0 0b     
            lda $05bc          ; $d330: ad bc 05  
            cmp #$a0           ; $d333: c9 a0     
            bne __d33a         ; $d335: d0 03     
            dec $05bc          ; $d337: ce bc 05  
__d33a:     dey                ; $d33a: 88        
__d33b:     lda $1f,x          ; $d33b: b5 1f     
            clc                ; $d33d: 18        
            adc #$01           ; $d33e: 69 01     
            sta $05            ; $d340: 85 05     
            lda $32            ; $d342: a5 32     
            cmp $33,x          ; $d344: d5 33     
            ldx $1e            ; $d346: a6 1e     
            inx                ; $d348: e8        
            txa                ; $d349: 8a        
            ldx $12            ; $d34a: a6 12     
            sbc $05            ; $d34c: e5 05     
            bpl __d351         ; $d34e: 10 01     
            iny                ; $d350: c8        
__d351:     lda $47,x          ; $d351: b5 47     
            cmp __930d,y       ; $d353: d9 0d 93  
            beq __d35e         ; $d356: f0 06     
            clc                ; $d358: 18        
            adc __930a,y       ; $d359: 79 0a 93  
            sta $47,x          ; $d35c: 95 47     
__d35e:     lda $0480,x        ; $d35e: bd 80 04  
            clc                ; $d361: 18        
            adc #$a0           ; $d362: 69 a0     
            sta $0480,x        ; $d364: 9d 80 04  
            bcc __d37f         ; $d367: 90 16     
            lda $0477,x        ; $d369: bd 77 04  
            and #$01           ; $d36c: 29 01     
            tay                ; $d36e: a8        
            lda $3d,x          ; $d36f: b5 3d     
__d371:     clc                ; $d371: 18        
            adc __9306,y       ; $d372: 79 06 93  
            sta $3d,x          ; $d375: 95 3d     
            cmp __9308,y       ; $d377: d9 08 93  
            bne __d37f         ; $d37a: d0 03     
            inc $0477,x        ; $d37c: fe 77 04  
__d37f:     lda $ec            ; $d37f: a5 ec     
            beq __d388         ; $d381: f0 05     
            lda $3c            ; $d383: a5 3c     
            sta $04cc,x        ; $d385: 9d cc 04  
__d388:     ldy $05bc          ; $d388: ac bc 05  
            beq __d3b4         ; $d38b: f0 27     
            cpy #$a0           ; $d38d: c0 a0     
            beq __d3ab         ; $d38f: f0 1a     
            .hex c0            ; $d391: c0        Suspected data
__d392:     .hex 80 d0         ; $d392: 80 d0     Invalid Opcode - NOP #$d0
            ora $a9            ; $d394: 05 a9     
            rti                ; $d396: 40        

;-------------------------------------------------------------------------------
            sta $045c,x        ; $d397: 9d 5c 04  
            cpy #$40           ; $d39a: c0 40     
            bne __d3a8         ; $d39c: d0 0a     
            lda #$40           ; $d39e: a9 40     
            sta $044a,x        ; $d3a0: 9d 4a 04  
            lda #$04           ; $d3a3: a9 04     
            sta $0605          ; $d3a5: 8d 05 06  
__d3a8:     dec $05bc          ; $d3a8: ce bc 05  
__d3ab:     lda #$00           ; $d3ab: a9 00     
            sta $04cc,x        ; $d3ad: 9d cc 04  
            sta $3d,x          ; $d3b0: 95 3d     
            sta $47,x          ; $d3b2: 95 47     
__d3b4:     jmp __9430         ; $d3b4: 4c 30 94  

;-------------------------------------------------------------------------------
            inx                ; $d3b7: e8        
            bne __d392         ; $d3b8: d0 d8     
            bne __d371         ; $d3ba: d0 b5     
            .hex 5b 29 04      ; $d3bc: 5b 29 04  Invalid Opcode - SRE $0429,y
            beq __d40c         ; $d3bf: f0 4b     
            lda $042f,x        ; $d3c1: bd 2f 04  
            bne __d3c8         ; $d3c4: d0 02     
            sta $3d,x          ; $d3c6: 95 3d     
__d3c8:     txa                ; $d3c8: 8a        
            asl                ; $d3c9: 0a        
            asl                ; $d3ca: 0a        
            asl                ; $d3cb: 0a        
            adc $10            ; $d3cc: 65 10     
            and #$3f           ; $d3ce: 29 3f     
            bne __d40c         ; $d3d0: d0 3a     
            lda $9f,x          ; $d3d2: b5 9f     
            and #$c0           ; $d3d4: 29 c0     
            asl                ; $d3d6: 0a        
            rol                ; $d3d7: 2a        
            rol                ; $d3d8: 2a        
            tay                ; $d3d9: a8        
            lda __93b7,y       ; $d3da: b9 b7 93  
            bne __d401         ; $d3dd: d0 22     
            lda $5b,x          ; $d3df: b5 5b     
            and #$04           ; $d3e1: 29 04     
            beq __d40c         ; $d3e3: f0 27     
            lda $32            ; $d3e5: a5 32     
            clc                ; $d3e7: 18        
            adc #$10           ; $d3e8: 69 10     
            cmp $33,x          ; $d3ea: d5 33     
            bne __d40c         ; $d3ec: d0 1e     
            jsr __9e3b         ; $d3ee: 20 3b 9e  
            iny                ; $d3f1: c8        
            tya                ; $d3f2: 98        
            cmp $6f,x          ; $d3f3: d5 6f     
            bne __d40c         ; $d3f5: d0 15     
            lda $0f            ; $d3f7: a5 0f     
            adc #$28           ; $d3f9: 69 28     
            cmp #$50           ; $d3fb: c9 50     
            bcs __d40c         ; $d3fd: b0 0d     
            lda #$d8           ; $d3ff: a9 d8     
__d401:     sta $47,x          ; $d401: 95 47     
            lda $9f,x          ; $d403: b5 9f     
            and #$f0           ; $d405: 29 f0     
            sta $9f,x          ; $d407: 95 9f     
            jsr __9e4b         ; $d409: 20 4b 9e  
__d40c:     jmp __946d         ; $d40c: 4c 6d 94  

;-------------------------------------------------------------------------------
            jsr __997a         ; $d40f: 20 7a 99  
            jsr __9b1b         ; $d412: 20 1b 9b  
            inc $9f,x          ; $d415: f6 9f     
            jsr __98d6         ; $d417: 20 d6 98  
            jsr __8b5b         ; $d41a: 20 5b 8b  
            jsr __98cd         ; $d41d: 20 cd 98  
            lda $47,x          ; $d420: b5 47     
            beq __d436         ; $d422: f0 12     
            bpl __d429         ; $d424: 10 03     
            sta $042f,x        ; $d426: 9d 2f 04  
__d429:     lda $10            ; $d429: a5 10     
            lsr                ; $d42b: 4a        
            bcc __d430         ; $d42c: 90 02     
            dec $47,x          ; $d42e: d6 47     
__d430:     jsr __9e50         ; $d430: 20 50 9e  
            jmp __9e4b         ; $d433: 4c 4b 9e  

;-------------------------------------------------------------------------------
__d436:     jsr __9e50         ; $d436: 20 50 9e  
            jmp __9430         ; $d439: 4c 30 94  

;-------------------------------------------------------------------------------
            jsr __b4e0         ; $d43c: 20 e0 b4  
            stx $c0            ; $d43f: 86 c0     
            .hex 3a            ; $d441: 3a        Invalid Opcode - NOP 
            bcs __d46d         ; $d442: b0 29     
            lda $5b,x          ; $d444: b5 5b     
            and #$04           ; $d446: 29 04     
            beq __d44e         ; $d448: f0 04     
            lda #$00           ; $d44a: a9 00     
            sta $3d,x          ; $d44c: 95 3d     
__d44e:     dec $9f,x          ; $d44e: d6 9f     
            tya                ; $d450: 98        
            bne __d45e         ; $d451: d0 0b     
            lda $a8,x          ; $d453: b5 a8     
            beq __d45b         ; $d455: f0 04     
            sty $9c            ; $d457: 84 9c     
            sty $a8,x          ; $d459: 94 a8     
__d45b:     jmp __910d         ; $d45b: 4c 0d 91  

;-------------------------------------------------------------------------------
__d45e:     cmp #$30           ; $d45e: c9 30     
            bcs __d46d         ; $d460: b0 0b     
            lsr                ; $d462: 4a        
            bcc __d46d         ; $d463: 90 08     
            inc $65,x          ; $d465: f6 65     
            lda $65,x          ; $d467: b5 65     
            and #$fb           ; $d469: 29 fb     
            sta $65,x          ; $d46b: 95 65     
__d46d:     jsr __b4fd         ; $d46d: 20 fd b4  
            jsr __997a         ; $d470: 20 7a 99  
            lda $0480,x        ; $d473: bd 80 04  
            beq __d492         ; $d476: f0 1a     
            lda $5b,x          ; $d478: b5 5b     
            and #$08           ; $d47a: 29 08     
            beq __d481         ; $d47c: f0 03     
            jmp __89a9         ; $d47e: 4c a9 89  

;-------------------------------------------------------------------------------
__d481:     dec $0480,x        ; $d481: de 80 04  
            inc $86,x          ; $d484: f6 86     
            lda $65,x          ; $d486: b5 65     
            ora #$20           ; $d488: 09 20     
            sta $65,x          ; $d48a: 95 65     
            jsr __9e4b         ; $d48c: 20 4b 9e  
            jmp __9b1b         ; $d48f: 4c 1b 9b  

;-------------------------------------------------------------------------------
__d492:     lda $5b,x          ; $d492: b5 5b     
            and $6f,x          ; $d494: 35 6f     
            beq __d4a6         ; $d496: f0 0e     
            jsr __9ea9         ; $d498: 20 a9 9e  
            lda $042f,x        ; $d49b: bd 2f 04  
            beq __d4a6         ; $d49e: f0 06     
            jsr __95b0         ; $d4a0: 20 b0 95  
            jsr __95b0         ; $d4a3: 20 b0 95  
__d4a6:     inc $9f,x          ; $d4a6: f6 9f     
            jsr __98cd         ; $d4a8: 20 cd 98  
            jsr __9b1b         ; $d4ab: 20 1b 9b  
            lda $90,x          ; $d4ae: b5 90     
            cmp #$06           ; $d4b0: c9 06     
            bne __d4bb         ; $d4b2: d0 07     
            lda $042f,x        ; $d4b4: bd 2f 04  
            bne __d4bb         ; $d4b7: d0 02     
            sta $3d,x          ; $d4b9: 95 3d     
__d4bb:     jsr __8577         ; $d4bb: 20 77 85  
            lda $5b,x          ; $d4be: b5 5b     
            ldy $47,x          ; $d4c0: b4 47     
            bpl __d503         ; $d4c2: 10 3f     
            and #$08           ; $d4c4: 29 08     
            beq __d4cd         ; $d4c6: f0 05     
            lda #$00           ; $d4c8: a9 00     
            sta $47,x          ; $d4ca: 95 47     
            rts                ; $d4cc: 60        

;-------------------------------------------------------------------------------
__d4cd:     lda $042f,x        ; $d4cd: bd 2f 04  
            bne __d4e6         ; $d4d0: d0 14     
            lda $90,x          ; $d4d2: b5 90     
            cmp #$06           ; $d4d4: c9 06     
            bne __d4e6         ; $d4d6: d0 0e     
            lda $47,x          ; $d4d8: b5 47     
            cmp #$fe           ; $d4da: c9 fe     
            bne __d4e6         ; $d4dc: d0 08     
            lda $05ae          ; $d4de: ad ae 05  
            bpl __d4e6         ; $d4e1: 10 03     
            jsr __95eb         ; $d4e3: 20 eb 95  
__d4e6:     dec $9f,x          ; $d4e6: d6 9f     
            lda $90,x          ; $d4e8: b5 90     
            cmp #$07           ; $d4ea: c9 07     
            beq __d4f2         ; $d4ec: f0 04     
            cmp #$03           ; $d4ee: c9 03     
            bne __d502         ; $d4f0: d0 10     
__d4f2:     lda $042f,x        ; $d4f2: bd 2f 04  
            bne __d502         ; $d4f5: d0 0b     
            lda $0477,x        ; $d4f7: bd 77 04  
            bne __d502         ; $d4fa: d0 06     
            inc $0477,x        ; $d4fc: fe 77 04  
            jmp __9ea9         ; $d4ff: 4c a9 9e  

;-------------------------------------------------------------------------------
__d502:     rts                ; $d502: 60        

;-------------------------------------------------------------------------------
__d503:     and #$04           ; $d503: 29 04     
            beq __d4cd         ; $d505: f0 c6     
            lda #$00           ; $d507: a9 00     
            sta $0477,x        ; $d509: 9d 77 04  
            ldy $90,x          ; $d50c: b4 90     
            cpy #$02           ; $d50e: c0 02     
            bne __d528         ; $d510: d0 16     
            lda #$3f           ; $d512: a9 3f     
            jsr __9599         ; $d514: 20 99 95  
            inc $79,x          ; $d517: f6 79     
            ldy #$f0           ; $d519: a0 f0     
            lda $79,x          ; $d51b: b5 79     
            and #$03           ; $d51d: 29 03     
            bne __d523         ; $d51f: d0 02     
            ldy #$e0           ; $d521: a0 e0     
__d523:     sty $47,x          ; $d523: 94 47     
            jmp __9e4b         ; $d525: 4c 4b 9e  

;-------------------------------------------------------------------------------
__d528:     lda #$1f           ; $d528: a9 1f     
            cpy #$09           ; $d52a: c0 09     
            beq __d599         ; $d52c: f0 6b     
            cpy #$29           ; $d52e: c0 29     
            beq __d599         ; $d530: f0 67     
            lda #$3f           ; $d532: a9 3f     
            cpy #$0d           ; $d534: c0 0d     
            beq __d599         ; $d536: f0 61     
            lda #$7f           ; $d538: a9 7f     
            cpy #$05           ; $d53a: c0 05     
            beq __d562         ; $d53c: f0 24     
            cpy #$05           ; $d53e: c0 05     
            beq __d562         ; $d540: f0 20     
            cpy #$07           ; $d542: c0 07     
            beq __d562         ; $d544: f0 1c     
            cpy #$06           ; $d546: c0 06     
            bne __d59d         ; $d548: d0 53     
            lda $042f,x        ; $d54a: bd 2f 04  
            bne __d59d         ; $d54d: d0 4e     
            jsr __9e3b         ; $d54f: 20 3b 9e  
            iny                ; $d552: c8        
            sty $6f,x          ; $d553: 94 6f     
            lda $9f,x          ; $d555: b5 9f     
            and #$3f           ; $d557: 29 3f     
            bne __d562         ; $d559: d0 07     
            lda #$e8           ; $d55b: a9 e8     
            sta $47,x          ; $d55d: 95 47     
            jmp __9e4b         ; $d55f: 4c 4b 9e  

;-------------------------------------------------------------------------------
__d562:     lda $044a,x        ; $d562: bd 4a 04  
            beq __d574         ; $d565: f0 0d     
            dec $9f,x          ; $d567: d6 9f     
            dec $044a,x        ; $d569: de 4a 04  
            bne __d574         ; $d56c: d0 06     
            jsr __95eb         ; $d56e: 20 eb 95  
            jmp __95bb         ; $d571: 4c bb 95  

;-------------------------------------------------------------------------------
__d574:     txa                ; $d574: 8a        
            asl                ; $d575: 0a        
            asl                ; $d576: 0a        
            asl                ; $d577: 0a        
            adc $10            ; $d578: 65 10     
            asl                ; $d57a: 0a        
            bne __d597         ; $d57b: d0 1a     
            lda $90,x          ; $d57d: b5 90     
            cmp #$06           ; $d57f: c9 06     
            bne __d589         ; $d581: d0 06     
            jsr __95eb         ; $d583: 20 eb 95  
            jmp __95ca         ; $d586: 4c ca 95  

;-------------------------------------------------------------------------------
__d589:     lda $33,x          ; $d589: b5 33     
            sec                ; $d58b: 38        
            sbc #$10           ; $d58c: e9 10     
            cmp $32            ; $d58e: c5 32     
            bne __d597         ; $d590: d0 05     
            lda #$30           ; $d592: a9 30     
            sta $044a,x        ; $d594: 9d 4a 04  
__d597:     lda #$7f           ; $d597: a9 7f     
__d599:     and $9f,x          ; $d599: 35 9f     
            beq __d5b8         ; $d59b: f0 1b     
__d59d:     lda $042f,x        ; $d59d: bd 2f 04  
            beq __d5bb         ; $d5a0: f0 19     
            lda $47,x          ; $d5a2: b5 47     
            cmp #$1a           ; $d5a4: c9 1a     
            bcc __d5b8         ; $d5a6: 90 10     
            lda #$f0           ; $d5a8: a9 f0     
            jsr __95d0         ; $d5aa: 20 d0 95  
            jsr __9e4b         ; $d5ad: 20 4b 9e  
            lda $3d,x          ; $d5b0: b5 3d     
            sta $00            ; $d5b2: 85 00     
            asl                ; $d5b4: 0a        
            ror $3d,x          ; $d5b5: 76 3d     
            rts                ; $d5b7: 60        

;-------------------------------------------------------------------------------
__d5b8:     jsr __8461         ; $d5b8: 20 61 84  
__d5bb:     lda $90,x          ; $d5bb: b5 90     
            cmp #$01           ; $d5bd: c9 01     
            bne __d5ca         ; $d5bf: d0 09     
            lda $47,x          ; $d5c1: b5 47     
            cmp #$04           ; $d5c3: c9 04     
            bcc __d5ca         ; $d5c5: 90 03     
            jsr __8461         ; $d5c7: 20 61 84  
__d5ca:     asl $65,x          ; $d5ca: 16 65     
            lsr $65,x          ; $d5cc: 56 65     
            lda #$00           ; $d5ce: a9 00     
            sta $47,x          ; $d5d0: 95 47     
            lda $90,x          ; $d5d2: b5 90     
            cmp #$32           ; $d5d4: c9 32     
            lda $33,x          ; $d5d6: b5 33     
            bcs __d5e0         ; $d5d8: b0 06     
            adc #$08           ; $d5da: 69 08     
            bcc __d5e0         ; $d5dc: 90 02     
            inc $1f,x          ; $d5de: f6 1f     
__d5e0:     and #$f0           ; $d5e0: 29 f0     
            sta $33,x          ; $d5e2: 95 33     
            rts                ; $d5e4: 60        

;-------------------------------------------------------------------------------
            jsr __92c4         ; $d5e5: 20 c4 92  
            jmp __95ee         ; $d5e8: 4c ee 95  

;-------------------------------------------------------------------------------
            jsr __92c8         ; $d5eb: 20 c8 92  
            bmi __d606         ; $d5ee: 30 16     
            ldy $6f,x          ; $d5f0: b4 6f     
            ldx $00            ; $d5f2: a6 00     
            lda __943b,y       ; $d5f4: b9 3b 94  
            sta $3d,x          ; $d5f7: 95 3d     
            lda #$00           ; $d5f9: a9 00     
            sta $47,x          ; $d5fb: 95 47     
            lda #$1b           ; $d5fd: a9 1b     
            sta $90,x          ; $d5ff: 95 90     
            jsr __8441         ; $d601: 20 41 84  
            ldx $12            ; $d604: a6 12     
__d606:     rts                ; $d606: 60        

;-------------------------------------------------------------------------------
            asl                ; $d607: 0a        
            asl $0d0a          ; $d608: 0e 0a 0d  
            .hex 04 07         ; $d60b: 04 07     Invalid Opcode - NOP $07
            .hex 04 06         ; $d60d: 04 06     Invalid Opcode - NOP $06
            lda $9d            ; $d60f: a5 9d     
            eor #$01           ; $d611: 49 01     
            tay                ; $d613: a8        
            iny                ; $d614: c8        
            sty $6f,x          ; $d615: 94 6f     
            lda $28            ; $d617: a5 28     
            sta $29,x          ; $d619: 95 29     
            lda $14            ; $d61b: a5 14     
            sta $15,x          ; $d61d: 95 15     
            lda $1e            ; $d61f: a5 1e     
            sta $07            ; $d621: 85 07     
            lda $32            ; $d623: a5 32     
            ldy $0489,x        ; $d625: bc 89 04  
            cpy #$03           ; $d628: c0 03     
            beq __d636         ; $d62a: f0 0a     
            cpy #$02           ; $d62c: c0 02     
            beq __d636         ; $d62e: f0 06     
            sbc #$0e           ; $d630: e9 0e     
            bcs __d636         ; $d632: b0 02     
            dec $07            ; $d634: c6 07     
__d636:     ldy $c7            ; $d636: a4 c7     
            cpy #$04           ; $d638: c0 04     
            clc                ; $d63a: 18        
            bne __d64d         ; $d63b: d0 10     
            ldy $06f6          ; $d63d: ac f6 06  
            cpy #$01           ; $d640: c0 01     
            ldy $8f            ; $d642: a4 8f     
            bcc __d64a         ; $d644: 90 04     
            iny                ; $d646: c8        
            iny                ; $d647: c8        
            iny                ; $d648: c8        
            iny                ; $d649: c8        
__d64a:     adc __9607,y       ; $d64a: 79 07 96  
__d64d:     php                ; $d64d: 08        
            ldy $a8,x          ; $d64e: b4 a8     
            clc                ; $d650: 18        
            ldx $06f6          ; $d651: ae f6 06  
            beq __d65d         ; $d654: f0 07     
            iny                ; $d656: c8        
            iny                ; $d657: c8        
            iny                ; $d658: c8        
            iny                ; $d659: c8        
            iny                ; $d65a: c8        
            iny                ; $d65b: c8        
            iny                ; $d65c: c8        
__d65d:     adc $7eff,y        ; $d65d: 79 ff 7e  
            ldx $12            ; $d660: a6 12     
            sta $33,x          ; $d662: 95 33     
            lda $07            ; $d664: a5 07     
            adc $7f0d,y        ; $d666: 79 0d 7f  
            plp                ; $d669: 28        
            adc #$00           ; $d66a: 69 00     
            sta $1f,x          ; $d66c: 95 1f     
            ldy $a8,x          ; $d66e: b4 a8     
            cpy #$05           ; $d670: c0 05     
            bcs __d686         ; $d672: b0 12     
            lda $90,x          ; $d674: b5 90     
            cmp #$32           ; $d676: c9 32     
            bcs __d686         ; $d678: b0 0c     
            lda $0438,x        ; $d67a: bd 38 04  
            .hex d0            ; $d67d: d0        Suspected data
__d67e:     .hex 02            ; $d67e: 02        Invalid Opcode - KIL 
            inc $9f,x          ; $d67f: f6 9f     
            asl $65,x          ; $d681: 16 65     
            sec                ; $d683: 38        
            ror $65,x          ; $d684: 76 65     
__d686:     jsr __9ab5         ; $d686: 20 b5 9a  
            jmp __9b1b         ; $d689: 4c 1b 9b  

;-------------------------------------------------------------------------------
            bpl __d67e         ; $d68c: 10 f0     
            jsr __9692         ; $d68e: 20 92 96  
__d691:     rts                ; $d691: 60        

;-------------------------------------------------------------------------------
            lda $a8,x          ; $d692: b5 a8     
            beq __d69b         ; $d694: f0 05     
            pla                ; $d696: 68        
            pla                ; $d697: 68        
            jmp __960f         ; $d698: 4c 0f 96  

;-------------------------------------------------------------------------------
__d69b:     jsr __9b1b         ; $d69b: 20 1b 9b  
            lda $90,x          ; $d69e: b5 90     
            cmp #$3a           ; $d6a0: c9 3a     
            bcs __d6aa         ; $d6a2: b0 06     
            jsr __b4f9         ; $d6a4: 20 f9 b4  
            jmp __96ad         ; $d6a7: 4c ad 96  

;-------------------------------------------------------------------------------
__d6aa:     jsr __b4fd         ; $d6aa: 20 fd b4  
            lda $042f,x        ; $d6ad: bd 2f 04  
            beq __d691         ; $d6b0: f0 df     
            jsr __8577         ; $d6b2: 20 77 85  
            pla                ; $d6b5: 68        
            pla                ; $d6b6: 68        
            lda $5b,x          ; $d6b7: b5 5b     
            pha                ; $d6b9: 48        
            and #$03           ; $d6ba: 29 03     
            beq __d6d4         ; $d6bc: f0 16     
            lda #$00           ; $d6be: a9 00     
            sta $3d,x          ; $d6c0: 95 3d     
            lda $29,x          ; $d6c2: b5 29     
            adc #$08           ; $d6c4: 69 08     
            and #$f0           ; $d6c6: 29 f0     
            sta $29,x          ; $d6c8: 95 29     
            lda $ec            ; $d6ca: a5 ec     
            beq __d6d4         ; $d6cc: f0 06     
            lda $15,x          ; $d6ce: b5 15     
            adc #$00           ; $d6d0: 69 00     
            sta $15,x          ; $d6d2: 95 15     
__d6d4:     pla                ; $d6d4: 68        
            ldy $47,x          ; $d6d5: b4 47     
            bmi __d718         ; $d6d7: 30 3f     
            and #$04           ; $d6d9: 29 04     
            beq __d718         ; $d6db: f0 3b     
            lda $0e            ; $d6dd: a5 0e     
            cmp #$16           ; $d6df: c9 16     
            bne __d6ec         ; $d6e1: d0 09     
            lda $3d,x          ; $d6e3: b5 3d     
            beq __d6ec         ; $d6e5: f0 05     
            lda #$14           ; $d6e7: a9 14     
            jmp __95d0         ; $d6e9: 4c d0 95  

;-------------------------------------------------------------------------------
__d6ec:     lda $90,x          ; $d6ec: b5 90     
            cmp #$3a           ; $d6ee: c9 3a     
            bne __d6ff         ; $d6f0: d0 0d     
            lda #$20           ; $d6f2: a9 20     
            sta $04c4          ; $d6f4: 8d c4 04  
            lda #$04           ; $d6f7: a9 04     
            sta $0605          ; $d6f9: 8d 05 06  
            jmp __98c4         ; $d6fc: 4c c4 98  

;-------------------------------------------------------------------------------
__d6ff:     lda $47,x          ; $d6ff: b5 47     
            cmp #$16           ; $d701: c9 16     
            bcc __d70d         ; $d703: 90 08     
            jsr __95ce         ; $d705: 20 ce 95  
            lda #$f5           ; $d708: a9 f5     
            jmp __95aa         ; $d70a: 4c aa 95  

;-------------------------------------------------------------------------------
__d70d:     jsr __95ce         ; $d70d: 20 ce 95  
            lda $79,x          ; $d710: b5 79     
            jsr __bc50         ; $d712: 20 50 bc  
            jmp __89a9         ; $d715: 4c a9 89  

;-------------------------------------------------------------------------------
__d718:     rts                ; $d718: 60        

;-------------------------------------------------------------------------------
            lda #$04           ; $d719: a9 04     
            sta $0489,x        ; $d71b: 9d 89 04  
            lda #$02           ; $d71e: a9 02     
            sta $6f,x          ; $d720: 95 6f     
            ldy $04b7          ; $d722: ac b7 04  
            beq __d741         ; $d725: f0 1a     
            lda $10            ; $d727: a5 10     
            and #$03           ; $d729: 29 03     
            bne __d741         ; $d72b: d0 14     
            ldy $50            ; $d72d: a4 50     
            cpy #$07           ; $d72f: c0 07     
            beq __d741         ; $d731: f0 0e     
            dec $04b7          ; $d733: ce b7 04  
            bne __d741         ; $d736: d0 09     
            sta $0628          ; $d738: 8d 28 06  
            jsr __f6da         ; $d73b: 20 da f6  
            jmp __97ff         ; $d73e: 4c ff 97  

;-------------------------------------------------------------------------------
__d741:     lda $0453,x        ; $d741: bd 53 04  
            bne __d718         ; $d744: d0 d2     
            lda $04b3          ; $d746: ad b3 04  
            beq __d753         ; $d749: f0 08     
            dec $04b3          ; $d74b: ce b3 04  
            bne __d753         ; $d74e: d0 03     
            jmp __91b0         ; $d750: 4c b0 91  

;-------------------------------------------------------------------------------
__d753:     lda $65,x          ; $d753: b5 65     
            ora #$40           ; $d755: 09 40     
            sta $65,x          ; $d757: 95 65     
            ldy $04bd          ; $d759: ac bd 04  
            lda __9808,y       ; $d75c: b9 08 98  
            ldy #$00           ; $d75f: a0 00     
            asl                ; $d761: 0a        
            bcc __d767         ; $d762: 90 03     
            iny                ; $d764: c8        
            sty $6f,x          ; $d765: 94 6f     
__d767:     lda $04bd          ; $d767: ad bd 04  
            beq __d79a         ; $d76a: f0 2e     
            lda $f4            ; $d76c: a5 f4     
            pha                ; $d76e: 48        
            jsr __fafe         ; $d76f: 20 fe fa  
            cpy $f4            ; $d772: c4 f4     
            php                ; $d774: 08        
            lda $6f,x          ; $d775: b5 6f     
            cmp #$01           ; $d777: c9 01     
            bne __d77f         ; $d779: d0 04     
            pla                ; $d77b: 68        
            eor #$01           ; $d77c: 49 01     
            pha                ; $d77e: 48        
__d77f:     plp                ; $d77f: 28        
            bcc __d784         ; $d780: 90 02     
            sty $f4            ; $d782: 84 f4     
__d784:     lda #$7a           ; $d784: a9 7a     
            jsr __9bb3         ; $d786: 20 b3 9b  
            ldy $f4            ; $d789: a4 f4     
            lda $0207,y        ; $d78b: b9 07 02  
            sec                ; $d78e: 38        
            sbc #$04           ; $d78f: e9 04     
            sta $0207,y        ; $d791: 99 07 02  
            sta $020f,y        ; $d794: 99 0f 02  
            pla                ; $d797: 68        
            sta $f4            ; $d798: 85 f4     
__d79a:     jsr __fafe         ; $d79a: 20 fe fa  
            cpy $f4            ; $d79d: c4 f4     
            php                ; $d79f: 08        
            lda $6f,x          ; $d7a0: b5 6f     
            cmp #$01           ; $d7a2: c9 01     
            bne __d7aa         ; $d7a4: d0 04     
            pla                ; $d7a6: 68        
            eor #$01           ; $d7a7: 49 01     
            pha                ; $d7a9: 48        
__d7aa:     plp                ; $d7aa: 28        
            bcs __d7af         ; $d7ab: b0 02     
            sty $f4            ; $d7ad: 84 f4     
__d7af:     lda $04bd          ; $d7af: ad bd 04  
            cmp #$19           ; $d7b2: c9 19     
            bcc __d7ba         ; $d7b4: 90 04     
            ldy #$00           ; $d7b6: a0 00     
            sty $f4            ; $d7b8: 84 f4     
__d7ba:     lda #$76           ; $d7ba: a9 76     
            ldy $0477,x        ; $d7bc: bc 77 04  
            beq __d7c3         ; $d7bf: f0 02     
            lda #$7e           ; $d7c1: a9 7e     
__d7c3:     jsr __9bb3         ; $d7c3: 20 b3 9b  
            ldx $04bd          ; $d7c6: ae bd 04  
            beq __d805         ; $d7c9: f0 3a     
            inc $04bd          ; $d7cb: ee bd 04  
            ldy $f4            ; $d7ce: a4 f4     
            lda __9808,x       ; $d7d0: bd 08 98  
            bmi __d805         ; $d7d3: 30 30     
            clc                ; $d7d5: 18        
            adc $0203,y        ; $d7d6: 79 03 02  
            sta $0203,y        ; $d7d9: 99 03 02  
            sta $020b,y        ; $d7dc: 99 0b 02  
            cpx #$30           ; $d7df: e0 30     
            bne __d805         ; $d7e1: d0 22     
            lda #$00           ; $d7e3: a9 00     
            sta $04bd          ; $d7e5: 8d bd 04  
            jsr __f6da         ; $d7e8: 20 da f6  
            lda $0534          ; $d7eb: ad 34 05  
            cmp #$01           ; $d7ee: c9 01     
            bne __d7f7         ; $d7f0: d0 05     
            inc $0627          ; $d7f2: ee 27 06  
            bne __d7ff         ; $d7f5: d0 08     
__d7f7:     lda $0628          ; $d7f7: ad 28 06  
            eor #$02           ; $d7fa: 49 02     
            sta $0628          ; $d7fc: 8d 28 06  
__d7ff:     pla                ; $d7ff: 68        
            pla                ; $d800: 68        
            pla                ; $d801: 68        
            pla                ; $d802: 68        
            pla                ; $d803: 68        
            pla                ; $d804: 68        
__d805:     ldx $12            ; $d805: a6 12     
            rts                ; $d807: 60        

;-------------------------------------------------------------------------------
            brk                ; $d808: 00        
            ora ($01,x)        ; $d809: 01 01     
            .hex 02            ; $d80b: 02        Invalid Opcode - KIL 
            .hex 02            ; $d80c: 02        Invalid Opcode - KIL 
            .hex 03 04         ; $d80d: 03 04     Invalid Opcode - SLO ($04,x)
            asl $08            ; $d80f: 06 08     
            .hex ff ff ff      ; $d811: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $d814: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $d817: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $d81a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $d81d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff 08 06      ; $d820: ff 08 06  Invalid Opcode - ISC $0608,x
            .hex 04 03         ; $d823: 04 03     Invalid Opcode - NOP $03
            .hex 02            ; $d825: 02        Invalid Opcode - KIL 
            .hex 02            ; $d826: 02        Invalid Opcode - KIL 
            .hex 02            ; $d827: 02        Invalid Opcode - KIL 
            .hex 02            ; $d828: 02        Invalid Opcode - KIL 
            ora ($01,x)        ; $d829: 01 01     
            ora ($01,x)        ; $d82b: 01 01     
            ora ($00,x)        ; $d82d: 01 00     
            brk                ; $d82f: 00        
            brk                ; $d830: 00        
            brk                ; $d831: 00        
            brk                ; $d832: 00        
            brk                ; $d833: 00        
            brk                ; $d834: 00        
            brk                ; $d835: 00        
            brk                ; $d836: 00        
            brk                ; $d837: 00        
            brk                ; $d838: 00        
            lda #$02           ; $d839: a9 02     
            bne __d843         ; $d83b: d0 06     
            lda #$01           ; $d83d: a9 01     
            bne __d843         ; $d83f: d0 02     
            lda #$00           ; $d841: a9 00     
__d843:     pha                ; $d843: 48        
            ldy #$08           ; $d844: a0 08     
__d846:     lda $0051,y        ; $d846: b9 51 00  
            beq __d85c         ; $d849: f0 11     
            lda $0090,y        ; $d84b: b9 90 00  
            cmp #$3c           ; $d84e: c9 3c     
            bne __d85c         ; $d850: d0 0a     
            lda #$05           ; $d852: a9 05     
            sta $0051,y        ; $d854: 99 51 00  
            lda #$20           ; $d857: a9 20     
            sta $0086,y        ; $d859: 99 86 00  
__d85c:     dey                ; $d85c: 88        
            bpl __d846         ; $d85d: 10 e7     
            jsr __92c4         ; $d85f: 20 c4 92  
            bmi __d896         ; $d862: 30 32     
            lda #$00           ; $d864: a9 00     
            sta $04bd          ; $d866: 8d bd 04  
            sta $04b3          ; $d869: 8d b3 04  
            ldx $00            ; $d86c: a6 00     
            pla                ; $d86e: 68        
            sta $0477,x        ; $d86f: 9d 77 04  
            lda #$3c           ; $d872: a9 3c     
            sta $90,x          ; $d874: 95 90     
            jsr __8441         ; $d876: 20 41 84  
            lda $28            ; $d879: a5 28     
            adc #$08           ; $d87b: 69 08     
            and #$f0           ; $d87d: 29 f0     
            sta $29,x          ; $d87f: 95 29     
            lda $14            ; $d881: a5 14     
            adc #$00           ; $d883: 69 00     
            sta $15,x          ; $d885: 95 15     
            lda $32            ; $d887: a5 32     
            sta $33,x          ; $d889: 95 33     
            lda $1e            ; $d88b: a5 1e     
            sta $1f,x          ; $d88d: 95 1f     
            lda #$41           ; $d88f: a9 41     
            sta $65,x          ; $d891: 95 65     
            ldx $12            ; $d893: a6 12     
            rts                ; $d895: 60        

;-------------------------------------------------------------------------------
__d896:     pla                ; $d896: 68        
            rts                ; $d897: 60        

;-------------------------------------------------------------------------------
            .hex 1c e4 20      ; $d898: 1c e4 20  Invalid Opcode - NOP $20e4,x
            sbc $20b4,x        ; $d89b: fd b4 20  
            cmp __b598         ; $d89e: cd 98 b5  
            .hex 5b 29 03      ; $d8a1: 5b 29 03  Invalid Opcode - SRE $0329,y
            beq __d8ae         ; $d8a4: f0 08     
            lda #$20           ; $d8a6: a9 20     
            sta $0602          ; $d8a8: 8d 02 06  
            jmp __91b0         ; $d8ab: 4c b0 91  

;-------------------------------------------------------------------------------
__d8ae:     lda $5b,x          ; $d8ae: b5 5b     
            and #$04           ; $d8b0: 29 04     
            beq __d8b7         ; $d8b2: f0 03     
            jsr __95ce         ; $d8b4: 20 ce 95  
__d8b7:     jsr __9b1b         ; $d8b7: 20 1b 9b  
            ldy $6f,x          ; $d8ba: b4 6f     
            lda __9897,y       ; $d8bc: b9 97 98  
            sta $3d,x          ; $d8bf: 95 3d     
            jmp __8577         ; $d8c1: 4c 77 85  

;-------------------------------------------------------------------------------
            lda #$03           ; $d8c4: a9 03     
            sta $51,x          ; $d8c6: 95 51     
            lda #$18           ; $d8c8: a9 18     
            sta $86,x          ; $d8ca: 95 86     
__d8cc:     rts                ; $d8cc: 60        

;-------------------------------------------------------------------------------
            lda $a8,x          ; $d8cd: b5 a8     
            beq __d8cc         ; $d8cf: f0 fb     
            pla                ; $d8d1: 68        
__d8d2:     pla                ; $d8d2: 68        
            jmp __960f         ; $d8d3: 4c 0f 96  

;-------------------------------------------------------------------------------
            lda $042f,x        ; $d8d6: bd 2f 04  
            beq __d8ea         ; $d8d9: f0 0f     
            pla                ; $d8db: 68        
            pla                ; $d8dc: 68        
            jmp __8574         ; $d8dd: 4c 74 85  

;-------------------------------------------------------------------------------
            jsr __8d6c         ; $d8e0: 20 6c 8d  
            sta $0438,x        ; $d8e3: 9d 38 04  
            lda $33,x          ; $d8e6: b5 33     
            sta $79,x          ; $d8e8: 95 79     
__d8ea:     rts                ; $d8ea: 60        

;-------------------------------------------------------------------------------
            asl $65,x          ; $d8eb: 16 65     
            lda $10            ; $d8ed: a5 10     
            asl                ; $d8ef: 0a        
            asl                ; $d8f0: 0a        
            asl                ; $d8f1: 0a        
            asl                ; $d8f2: 0a        
            ror $65,x          ; $d8f3: 76 65     
            ldy $b1,x          ; $d8f5: b4 b1     
            bne __d919         ; $d8f7: d0 20     
            lda $65,x          ; $d8f9: b5 65     
            ora #$20           ; $d8fb: 09 20     
            sta $65,x          ; $d8fd: 95 65     
            lda $79,x          ; $d8ff: b5 79     
            sec                ; $d901: 38        
            sbc #$0c           ; $d902: e9 0c     
            cmp $33,x          ; $d904: d5 33     
            lda #$fe           ; $d906: a9 fe     
            bcc __d914         ; $d908: 90 0a     
            lda $65,x          ; $d90a: b5 65     
            and #$df           ; $d90c: 29 df     
            sta $65,x          ; $d90e: 95 65     
            inc $b1,x          ; $d910: f6 b1     
            lda #$04           ; $d912: a9 04     
__d914:     sta $47,x          ; $d914: 95 47     
            jmp __9921         ; $d916: 4c 21 99  

;-------------------------------------------------------------------------------
__d919:     lda $10            ; $d919: a5 10     
            and #$07           ; $d91b: 29 07     
            bne __d921         ; $d91d: d0 02     
            inc $47,x          ; $d91f: f6 47     
__d921:     jsr __9e4b         ; $d921: 20 4b 9e  
            lda $33,x          ; $d924: b5 33     
            cmp #$f0           ; $d926: c9 f0     
            bcc __d932         ; $d928: 90 08     
            lda #$00           ; $d92a: a9 00     
            sta $b1,x          ; $d92c: 95 b1     
            lda $79,x          ; $d92e: b5 79     
            sta $33,x          ; $d930: 95 33     
__d932:     jmp __9b1b         ; $d932: 4c 1b 9b  

;-------------------------------------------------------------------------------
            lda #$00           ; $d935: a9 00     
            sta $00            ; $d937: 85 00     
            ldx #$08           ; $d939: a2 08     
__d93b:     lda $51,x          ; $d93b: b5 51     
            cmp #$01           ; $d93d: c9 01     
            bne __d974         ; $d93f: d0 33     
            lda $00            ; $d941: a5 00     
            beq __d966         ; $d943: f0 21     
            lda $90,x          ; $d945: b5 90     
            cmp #$37           ; $d947: c9 37     
            beq __d94f         ; $d949: f0 04     
            cmp #$32           ; $d94b: c9 32     
            bcs __d974         ; $d94d: b0 25     
__d94f:     lda $9c            ; $d94f: a5 9c     
            beq __d95c         ; $d951: f0 09     
            cpx $042d          ; $d953: ec 2d 04  
            bne __d95c         ; $d956: d0 04     
            lda #$00           ; $d958: a9 00     
            sta $9c            ; $d95a: 85 9c     
__d95c:     stx $0e            ; $d95c: 86 0e     
            jsr __91b0         ; $d95e: 20 b0 91  
            ldx $0e            ; $d961: a6 0e     
            jmp __9974         ; $d963: 4c 74 99  

;-------------------------------------------------------------------------------
__d966:     lda $5b,x          ; $d966: b5 5b     
            beq __d974         ; $d968: f0 0a     
            lda #$d8           ; $d96a: a9 d8     
            sta $47,x          ; $d96c: 95 47     
            lda $5b,x          ; $d96e: b5 5b     
            ora #$10           ; $d970: 09 10     
            sta $5b,x          ; $d972: 95 5b     
__d974:     dex                ; $d974: ca        
            bpl __d93b         ; $d975: 10 c4     
            ldx $12            ; $d977: a6 12     
            rts                ; $d979: 60        

;-------------------------------------------------------------------------------
            lda $5b,x          ; $d97a: b5 5b     
            and #$10           ; $d97c: 29 10     
            beq __d9b3         ; $d97e: f0 33     
            lda $a8,x          ; $d980: b5 a8     
            beq __d988         ; $d982: f0 04     
            lda #$00           ; $d984: a9 00     
            sta $9c            ; $d986: 85 9c     
__d988:     ldy $90,x          ; $d988: b4 90     
            lda __f532,y       ; $d98a: b9 32 f5  
            and #$08           ; $d98d: 29 08     
            asl                ; $d98f: 0a        
            bne __d99e         ; $d990: d0 0c     
            lda $0601          ; $d992: ad 01 06  
            bne __d9a1         ; $d995: d0 0a     
            lda #$20           ; $d997: a9 20     
            sta $0602          ; $d999: 8d 02 06  
            bne __d9a1         ; $d99c: d0 03     
__d99e:     sta $0601          ; $d99e: 8d 01 06  
__d9a1:     cpy #$12           ; $d9a1: c0 12     
            bne __d9ad         ; $d9a3: d0 08     
            lda $042f,x        ; $d9a5: bd 2f 04  
            bne __d9ad         ; $d9a8: d0 03     
            jsr __a440         ; $d9aa: 20 40 a4  
__d9ad:     lda #$02           ; $d9ad: a9 02     
            sta $51,x          ; $d9af: 95 51     
            pla                ; $d9b1: 68        
            pla                ; $d9b2: 68        
__d9b3:     rts                ; $d9b3: 60        

;-------------------------------------------------------------------------------
            bne __d988         ; $d9b4: d0 d2     
            .hex d4 d6         ; $d9b6: d4 d6     Invalid Opcode - NOP $d6,x
            sed                ; $d9b8: f8        
            sed                ; $d9b9: f8        
            .hex fa            ; $d9ba: fa        Invalid Opcode - NOP 
            .hex fa            ; $d9bb: fa        Invalid Opcode - NOP 
            cpy __ccce         ; $d9bc: cc ce cc  
            dec __cac8         ; $d9bf: ce c8 ca  
            iny                ; $d9c2: c8        
            dex                ; $d9c3: ca        
            bvs __da38         ; $d9c4: 70 72     
            .hex 74 76         ; $d9c6: 74 76     Invalid Opcode - NOP $76,x
            cpy #$c2           ; $d9c8: c0 c2     
            cpy $c6            ; $d9ca: c4 c6     
            sbc ($e3,x)        ; $d9cc: e1 e3     
            sbc $e7            ; $d9ce: e5 e7     
            sbc ($e3,x)        ; $d9d0: e1 e3     
            sbc $e7            ; $d9d2: e5 e7     
            sei                ; $d9d4: 78        
            .hex 7a            ; $d9d5: 7a        Invalid Opcode - NOP 
            .hex 7c 7e dc      ; $d9d6: 7c 7e dc  Invalid Opcode - NOP __dc7e,x
            .hex da            ; $d9d9: da        Invalid Opcode - NOP 
            .hex dc de fe      ; $d9da: dc de fe  Invalid Opcode - NOP __fede,x
            inc __fcfc,x       ; $d9dd: fe fc fc  
            sty $94,x          ; $d9e0: 94 94     
            stx $96,y          ; $d9e2: 96 96     
            tya                ; $d9e4: 98        
            tya                ; $d9e5: 98        
            txs                ; $d9e6: 9a        
            txs                ; $d9e7: 9a        
            .hex db dd         ; $d9e8: db dd     Suspected data
__d9ea:     .hex db dd 7d      ; $d9ea: db dd 7d  Invalid Opcode - DCP $7ddd,y
            .hex 7f c1 c3      ; $d9ed: 7f c1 c3  Invalid Opcode - RRA __c3c1,x
            sty __8e8c         ; $d9f0: 8c 8c 8e  
            stx __e2e0         ; $d9f3: 8e e0 e2  
            .hex 6b 6d         ; $d9f6: 6b 6d     Invalid Opcode - ARR #$6d
            adc $3a6f          ; $d9f8: 6d 6f 3a  
            .hex 3a            ; $d9fb: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $d9fc: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $d9fd: 3a        Invalid Opcode - NOP 
            sec                ; $d9fe: 38        
            sec                ; $d9ff: 38        
            sec                ; $da00: 38        
            sec                ; $da01: 38        
            rol $36,x          ; $da02: 36 36     
            rol $36,x          ; $da04: 36 36     
            .hex 34 34         ; $da06: 34 34     Invalid Opcode - NOP $34,x
            .hex 34 34         ; $da08: 34 34     Invalid Opcode - NOP $34,x
__da0a:     ldx __aefb         ; $da0a: ae fb ae  
            .hex fb 80 82      ; $da0d: fb 80 82  Invalid Opcode - ISC __8280,y
            sty $86            ; $da10: 84 86     
            .hex 80 82         ; $da12: 80 82     Invalid Opcode - NOP #$82
            tax                ; $da14: aa        
            ldy __8a88         ; $da15: ac 88 8a  
            sty $86            ; $da18: 84 86     
            dey                ; $da1a: 88        
            txa                ; $da1b: 8a        
            tax                ; $da1c: aa        
            ldy __bebc         ; $da1d: ac bc be  
            tax                ; $da20: aa        
            ldy __bebc         ; $da21: ac bc be  
            tax                ; $da24: aa        
            ldy __b9b5         ; $da25: ac b5 b9  
            lda $b9,x          ; $da28: b5 b9     
            sta ($83,x)        ; $da2a: 81 83     
            sta $87            ; $da2c: 85 87     
            .hex ff ff ff      ; $da2e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff 81 83      ; $da31: ff 81 83  Invalid Opcode - ISC __8381,x
            sbc $87,x          ; $da34: f5 87     
            cmp $c7            ; $da36: c5 c7     
__da38:     cmp #$cb           ; $da38: c9 cb     
            .hex 92            ; $da3a: 92        Invalid Opcode - KIL 
            sty $29,x          ; $da3b: 94 29     
            and #$2b           ; $da3d: 29 2b     
            .hex 2b 3d         ; $da3f: 2b 3d     Invalid Opcode - ANC #$3d
            .hex 3f 4c 4e      ; $da41: 3f 4c 4e  Invalid Opcode - RLA $4e4c,x
            bvc __da98         ; $da44: 50 52     
            jmp $564e          ; $da46: 4c 4e 56  

;-------------------------------------------------------------------------------
            cli                ; $da49: 58        
            .hex fb 5c fb      ; $da4a: fb 5c fb  Invalid Opcode - ISC __fb5c,y
            .hex 5a            ; $da4d: 5a        Invalid Opcode - NOP 
            .hex fb fb fb      ; $da4e: fb fb fb  Invalid Opcode - ISC __fbfb,y
            .hex 54 cf         ; $da51: 54 cf     Invalid Opcode - NOP $cf,x
            .hex cf a5 a5      ; $da53: cf a5 a5  Invalid Opcode - DCP __a5a5
            bcs __da0a         ; $da56: b0 b2     
            bcc __d9ea         ; $da58: 90 90     
            cmp __a8cd         ; $da5a: cd cd a8  
            tay                ; $da5d: a8        
            tay                ; $da5e: a8        
            tay                ; $da5f: a8        
            ldy #$a2           ; $da60: a0 a2     
            ldy $a4            ; $da62: a4 a4     
            ldy $a4            ; $da64: a4 a4     
            eor __8c4d         ; $da66: 4d 4d 8c  
            sty __a6a6         ; $da69: 8c a6 a6  
            .hex ab ab         ; $da6c: ab ab     Invalid Opcode - LAX #$ab
            brk                ; $da6e: 00        
            brk                ; $da6f: 00        
            php                ; $da70: 08        
            brk                ; $da71: 00        
            .hex 0c 10 10      ; $da72: 0c 10 10  Invalid Opcode - NOP $1010
            bpl __dab7         ; $da75: 10 40     
            .hex 14 18         ; $da77: 14 18     Invalid Opcode - NOP $18,x
            clc                ; $da79: 18        
            clc                ; $da7a: 18        
            jsr $2420          ; $da7b: 20 20 24  
            bit $be            ; $da7e: 24 be     
            brk                ; $da80: 00        
            stx $88            ; $da81: 86 88     
            .hex ff ff 8c      ; $da83: ff ff 8c  Invalid Opcode - ISC __8cff,x
            .hex 5c 5c 6c      ; $da86: 5c 5c 6c  Invalid Opcode - NOP $6c5c,x
            lsr $5a,x          ; $da89: 56 5a     
            .hex 14 72         ; $da8b: 14 72     Invalid Opcode - NOP $72,x
            brk                ; $da8d: 00        
            tay                ; $da8e: a8        
            brk                ; $da8f: 00        
            dec $ac,x          ; $da90: d6 ac     
            ldy $74ac          ; $da92: ac ac 74  
            .hex 7a            ; $da95: 7a        Invalid Opcode - NOP 
            .hex 92            ; $da96: 92        Invalid Opcode - KIL 
            txs                ; $da97: 9a        
__da98:     .hex 80 90         ; $da98: 80 90     Invalid Opcode - NOP #$90
            brk                ; $da9a: 00        
            brk                ; $da9b: 00        
            ldx $b6,y          ; $da9c: b6 b6     
            ldx $b6,y          ; $da9e: b6 b6     
            plp                ; $daa0: 28        
            rol                ; $daa1: 2a        
            bit $302e          ; $daa2: 2c 2e 30  
            .hex 34 00         ; $daa5: 34 00     Invalid Opcode - NOP $00,x
            sec                ; $daa7: 38        
            .hex 3a            ; $daa8: 3a        Invalid Opcode - NOP 
            .hex 42            ; $daa9: 42        Invalid Opcode - KIL 
            .hex 82 82         ; $daaa: 82 82     Invalid Opcode - NOP #$82
            sty $a0            ; $daac: 84 a0     
            ldx #$04           ; $daae: a2 04     
            stx __9e8e         ; $dab0: 8e 8e 9e  
            ldx $a4            ; $dab3: a6 a4     
            lda $33,x          ; $dab5: b5 33     
__dab7:     clc                ; $dab7: 18        
            sbc $cb            ; $dab8: e5 cb     
            ldy $a8,x          ; $daba: b4 a8     
            beq __daca         ; $dabc: f0 0c     
            ldy $c7            ; $dabe: a4 c7     
            bne __daca         ; $dac0: d0 08     
            ldy $8f            ; $dac2: a4 8f     
            dey                ; $dac4: 88        
            beq __daca         ; $dac5: f0 03     
            sec                ; $dac7: 38        
            sbc #$01           ; $dac8: e9 01     
__daca:     sta $042c          ; $daca: 8d 2c 04  
            lda $29,x          ; $dacd: b5 29     
            sec                ; $dacf: 38        
            sbc $04c0          ; $dad0: ed c0 04  
            sta $0429          ; $dad3: 8d 29 04  
            rts                ; $dad6: 60        

;-------------------------------------------------------------------------------
            lda $51,x          ; $dad7: b5 51     
            cmp #$01           ; $dad9: c9 01     
            bne __dae2         ; $dadb: d0 05     
            lda $045c,x        ; $dadd: bd 5c 04  
            beq __dae6         ; $dae0: f0 04     
__dae2:     lda #$6a           ; $dae2: a9 6a     
            bne __daec         ; $dae4: d0 06     
__dae6:     lda $86,x          ; $dae6: b5 86     
            beq __daef         ; $dae8: f0 05     
            lda #$62           ; $daea: a9 62     
__daec:     jmp __9bb3         ; $daec: 4c b3 9b  

;-------------------------------------------------------------------------------
__daef:     jmp __9ba7         ; $daef: 4c a7 9b  

;-------------------------------------------------------------------------------
            lda $ee            ; $daf2: a5 ee     
            pha                ; $daf4: 48        
            jsr __9ba7         ; $daf5: 20 a7 9b  
            pla                ; $daf8: 68        
            asl                ; $daf9: 0a        
            .hex 85            ; $dafa: 85        Suspected data
__dafb:     inc __b1b5         ; $dafb: ee b5 b1  
            ora $ef            ; $dafe: 05 ef     
            bne __db40         ; $db00: d0 3e     
            lda $0429          ; $db02: ad 29 04  
            adc #$08           ; $db05: 69 08     
            sta $01            ; $db07: 85 01     
            lda $6f,x          ; $db09: b5 6f     
            sta $02            ; $db0b: 85 02     
            lda #$01           ; $db0d: a9 01     
            sta $03            ; $db0f: 85 03     
            sta $05            ; $db11: 85 05     
            jsr __fafe         ; $db13: 20 fe fa  
            ldx #$14           ; $db16: a2 14     
            jmp __9c7a         ; $db18: 4c 7a 9c  

;-------------------------------------------------------------------------------
            ldy $90,x          ; $db1b: b4 90     
            lda __9a6e,y       ; $db1d: b9 6e 9a  
            cmp #$ff           ; $db20: c9 ff     
            beq __db40         ; $db22: f0 1c     
            cpy #$1d           ; $db24: c0 1d     
            bne __db2b         ; $db26: d0 03     
            jmp __a5f8         ; $db28: 4c f8 a5  

;-------------------------------------------------------------------------------
__db2b:     cpy #$21           ; $db2b: c0 21     
            bne __db32         ; $db2d: d0 03     
            jmp __a1e4         ; $db2f: 4c e4 a1  

;-------------------------------------------------------------------------------
__db32:     cpy #$22           ; $db32: c0 22     
            bne __db39         ; $db34: d0 03     
            jmp __a323         ; $db36: 4c 23 a3  

;-------------------------------------------------------------------------------
__db39:     cpy #$2d           ; $db39: c0 2d     
            bne __db41         ; $db3b: d0 04     
            jmp __b0e8         ; $db3d: 4c e8 b0  

;-------------------------------------------------------------------------------
__db40:     rts                ; $db40: 60        

;-------------------------------------------------------------------------------
__db41:     cpy #$12           ; $db41: c0 12     
            bne __db48         ; $db43: d0 03     
            jmp __a508         ; $db45: 4c 08 a5  

;-------------------------------------------------------------------------------
__db48:     cpy #$04           ; $db48: c0 04     
            bne __db4f         ; $db4a: d0 03     
            jmp __9e06         ; $db4c: 4c 06 9e  

;-------------------------------------------------------------------------------
__db4f:     cpy #$33           ; $db4f: c0 33     
            bne __db56         ; $db51: d0 03     
            jmp __9137         ; $db53: 4c 37 91  

;-------------------------------------------------------------------------------
__db56:     cpy #$26           ; $db56: c0 26     
            bne __db5d         ; $db58: d0 03     
            jmp __ae4b         ; $db5a: 4c 4b ae  

;-------------------------------------------------------------------------------
__db5d:     cpy #$2a           ; $db5d: c0 2a     
            bne __db64         ; $db5f: d0 03     
            jmp __ac28         ; $db61: 4c 28 ac  

;-------------------------------------------------------------------------------
__db64:     cpy #$43           ; $db64: c0 43     
            bne __db6b         ; $db66: d0 03     
            jmp __8e05         ; $db68: 4c 05 8e  

;-------------------------------------------------------------------------------
__db6b:     cpy #$2c           ; $db6b: c0 2c     
            bne __db72         ; $db6d: d0 03     
            jmp __b2b0         ; $db6f: 4c b0 b2  

;-------------------------------------------------------------------------------
__db72:     cpy #$28           ; $db72: c0 28     
            bne __db79         ; $db74: d0 03     
            jmp __aeeb         ; $db76: 4c eb ae  

;-------------------------------------------------------------------------------
__db79:     cpy #$1a           ; $db79: c0 1a     
            bne __db80         ; $db7b: d0 03     
            jmp __aab1         ; $db7d: 4c b1 aa  

;-------------------------------------------------------------------------------
__db80:     cpy #$00           ; $db80: c0 00     
            bne __db87         ; $db82: d0 03     
            jmp __8f27         ; $db84: 4c 27 8f  

;-------------------------------------------------------------------------------
__db87:     cpy #$08           ; $db87: c0 08     
            bne __db8e         ; $db89: d0 03     
            jmp __a654         ; $db8b: 4c 54 a6  

;-------------------------------------------------------------------------------
__db8e:     cpy #$1f           ; $db8e: c0 1f     
            bne __db95         ; $db90: d0 03     
            jmp __a783         ; $db92: 4c 83 a7  

;-------------------------------------------------------------------------------
__db95:     cpy #$1c           ; $db95: c0 1c     
            bne __db9c         ; $db97: d0 03     
            jmp __9ad7         ; $db99: 4c d7 9a  

;-------------------------------------------------------------------------------
__db9c:     cpy #$0a           ; $db9c: c0 0a     
            bcc __dba7         ; $db9e: 90 07     
            cpy #$0d           ; $dba0: c0 0d     
            bcs __dba7         ; $dba2: b0 03     
            jmp __9af2         ; $dba4: 4c f2 9a  

;-------------------------------------------------------------------------------
__dba7:     ldy $90,x          ; $dba7: b4 90     
            cpy #$38           ; $dba9: c0 38     
            bne __dbb0         ; $dbab: d0 03     
            jmp __abee         ; $dbad: 4c ee ab  

;-------------------------------------------------------------------------------
__dbb0:     lda __9a6e,y       ; $dbb0: b9 6e 9a  
            sta $0f            ; $dbb3: 85 0f     
            lda $ef            ; $dbb5: a5 ef     
            bne __db40         ; $dbb7: d0 87     
            lda $046e,x        ; $dbb9: bd 6e 04  
            and #$10           ; $dbbc: 29 10     
            sta $0b            ; $dbbe: 85 0b     
            ldy $6f,x          ; $dbc0: b4 6f     
            lda $65,x          ; $dbc2: b5 65     
            and #$18           ; $dbc4: 29 18     
            beq __dbd2         ; $dbc6: f0 0a     
            ldy #$02           ; $dbc8: a0 02     
            lda $0628          ; $dbca: ad 28 06  
            cmp #$02           ; $dbcd: c9 02     
            bne __dbd2         ; $dbcf: d0 01     
            dey                ; $dbd1: 88        
__dbd2:     sty $02            ; $dbd2: 84 02     
            lda $65,x          ; $dbd4: b5 65     
            and #$44           ; $dbd6: 29 44     
            sta $05            ; $dbd8: 85 05     
            lda $042c          ; $dbda: ad 2c 04  
            sta $00            ; $dbdd: 85 00     
            lda #$00           ; $dbdf: a9 00     
            sta $0d            ; $dbe1: 85 0d     
            lda $044a,x        ; $dbe3: bd 4a 04  
            and #$02           ; $dbe6: 29 02     
            lsr                ; $dbe8: 4a        
            ldy $ee            ; $dbe9: a4 ee     
            beq __dbef         ; $dbeb: f0 02     
            lda #$00           ; $dbed: a9 00     
__dbef:     adc $0429          ; $dbef: 6d 29 04  
            sta $01            ; $dbf2: 85 01     
            lda $65,x          ; $dbf4: b5 65     
            and #$a3           ; $dbf6: 29 a3     
            ldy $045c,x        ; $dbf8: bc 5c 04  
            beq __dc07         ; $dbfb: f0 0a     
            and #$a0           ; $dbfd: 29 a0     
            sta $08            ; $dbff: 85 08     
            tya                ; $dc01: 98        
            lsr                ; $dc02: 4a        
            and #$03           ; $dc03: 29 03     
            ora $08            ; $dc05: 05 08     
__dc07:     sta $03            ; $dc07: 85 03     
            lda $046e,x        ; $dc09: bd 6e 04  
            sta $0c            ; $dc0c: 85 0c     
            asl                ; $dc0e: 0a        
            lda $9f,x          ; $dc0f: b5 9f     
            ldx $0f            ; $dc11: a6 0f     
            and #$08           ; $dc13: 29 08     
            beq __dc31         ; $dc15: f0 1a     
            bcc __dc1f         ; $dc17: 90 06     
            lda #$01           ; $dc19: a9 01     
            sta $02            ; $dc1b: 85 02     
            bne __dc31         ; $dc1d: d0 12     
__dc1f:     inx                ; $dc1f: e8        
            inx                ; $dc20: e8        
            lda $05            ; $dc21: a5 05     
            and #$40           ; $dc23: 29 40     
            beq __dc31         ; $dc25: f0 0a     
            inx                ; $dc27: e8        
            inx                ; $dc28: e8        
            lda $0c            ; $dc29: a5 0c     
            and #$20           ; $dc2b: 29 20     
            beq __dc31         ; $dc2d: f0 02     
            inx                ; $dc2f: e8        
            inx                ; $dc30: e8        
__dc31:     ldy $f4            ; $dc31: a4 f4     
            lda $05            ; $dc33: a5 05     
            and #$40           ; $dc35: 29 40     
            beq __dc7a         ; $dc37: f0 41     
            lda $05            ; $dc39: a5 05     
            and #$04           ; $dc3b: 29 04     
            beq __dc53         ; $dc3d: f0 14     
            lda $ee            ; $dc3f: a5 ee     
            sta $08            ; $dc41: 85 08     
            lda $02            ; $dc43: a5 02     
            cmp #$01           ; $dc45: c9 01     
            bne __dc53         ; $dc47: d0 0a     
            lda $01            ; $dc49: a5 01     
            adc #$0f           ; $dc4b: 69 0f     
            sta $01            ; $dc4d: 85 01     
            asl $ee            ; $dc4f: 06 ee     
            asl $ee            ; $dc51: 06 ee     
__dc53:     jsr __9cf2         ; $dc53: 20 f2 9c  
            lda $05            ; $dc56: a5 05     
            and #$04           ; $dc58: 29 04     
            beq __dc7a         ; $dc5a: f0 1e     
            lda $042c          ; $dc5c: ad 2c 04  
            sta $00            ; $dc5f: 85 00     
            lda $0429          ; $dc61: ad 29 04  
            sta $01            ; $dc64: 85 01     
            lda $08            ; $dc66: a5 08     
            sta $ee            ; $dc68: 85 ee     
            lda $02            ; $dc6a: a5 02     
            cmp #$01           ; $dc6c: c9 01     
            beq __dc7a         ; $dc6e: f0 0a     
            lda $01            ; $dc70: a5 01     
            adc #$0f           ; $dc72: 69 0f     
            sta $01            ; $dc74: 85 01     
            asl $ee            ; $dc76: 06 ee     
            asl $ee            ; $dc78: 06 ee     
__dc7a:     jsr __9cf2         ; $dc7a: 20 f2 9c  
            ldy $f4            ; $dc7d: a4 f4     
            lda $05            ; $dc7f: a5 05     
            cmp #$40           ; $dc81: c9 40     
            bne __dcd9         ; $dc83: d0 54     
            lda $03            ; $dc85: a5 03     
            bpl __dcd9         ; $dc87: 10 50     
            lda $0c            ; $dc89: a5 0c     
            and #$20           ; $dc8b: 29 20     
            beq __dcbd         ; $dc8d: f0 2e     
            ldx $0d            ; $dc8f: a6 0d     
            lda $0200,x        ; $dc91: bd 00 02  
            pha                ; $dc94: 48        
            lda $0200,y        ; $dc95: b9 00 02  
            sta $0200,x        ; $dc98: 9d 00 02  
            pla                ; $dc9b: 68        
            sta $0200,y        ; $dc9c: 99 00 02  
            lda $0204,x        ; $dc9f: bd 04 02  
            pha                ; $dca2: 48        
            lda $0204,y        ; $dca3: b9 04 02  
            sta $0204,x        ; $dca6: 9d 04 02  
            pla                ; $dca9: 68        
            sta $0204,y        ; $dcaa: 99 04 02  
            lda $0208,x        ; $dcad: bd 08 02  
            pha                ; $dcb0: 48        
            lda $0208,y        ; $dcb1: b9 08 02  
            sta $0208,x        ; $dcb4: 9d 08 02  
            pla                ; $dcb7: 68        
            sta $0208,y        ; $dcb8: 99 08 02  
            bcs __dcd9         ; $dcbb: b0 1c     
__dcbd:     lda $0200,y        ; $dcbd: b9 00 02  
            pha                ; $dcc0: 48        
            lda $0208,y        ; $dcc1: b9 08 02  
            sta $0200,y        ; $dcc4: 99 00 02  
            pla                ; $dcc7: 68        
            sta $0208,y        ; $dcc8: 99 08 02  
            lda $0204,y        ; $dccb: b9 04 02  
            pha                ; $dcce: 48        
            lda $020c,y        ; $dccf: b9 0c 02  
            sta $0204,y        ; $dcd2: 99 04 02  
            pla                ; $dcd5: 68        
            sta $020c,y        ; $dcd6: 99 0c 02  
__dcd9:     ldx $12            ; $dcd9: a6 12     
            lda $65,x          ; $dcdb: b5 65     
            and #$10           ; $dcdd: 29 10     
            beq __dcf1         ; $dcdf: f0 10     
            lda $03            ; $dce1: a5 03     
            sta $0202,y        ; $dce3: 99 02 02  
            sta $020a,y        ; $dce6: 99 0a 02  
            ora #$40           ; $dce9: 09 40     
            sta $0206,y        ; $dceb: 99 06 02  
            sta $020e,y        ; $dcee: 99 0e 02  
__dcf1:     rts                ; $dcf1: 60        

;-------------------------------------------------------------------------------
            lda $0c            ; $dcf2: a5 0c     
            and #$20           ; $dcf4: 29 20     
            bne __dd6d         ; $dcf6: d0 75     
            lda $0b            ; $dcf8: a5 0b     
            bne __dd0a         ; $dcfa: d0 0e     
            lda __99b4,x       ; $dcfc: bd b4 99  
            sta $0201,y        ; $dcff: 99 01 02  
            lda __99b5,x       ; $dd02: bd b5 99  
            sta $0205,y        ; $dd05: 99 05 02  
            bne __dd16         ; $dd08: d0 0c     
__dd0a:     lda __a030,x       ; $dd0a: bd 30 a0  
            sta $0201,y        ; $dd0d: 99 01 02  
            lda __a031,x       ; $dd10: bd 31 a0  
            sta $0205,y        ; $dd13: 99 05 02  
__dd16:     lda $02            ; $dd16: a5 02     
            lsr                ; $dd18: 4a        
            lda #$00           ; $dd19: a9 00     
            bcc __dd2d         ; $dd1b: 90 10     
            lda $0201,y        ; $dd1d: b9 01 02  
            pha                ; $dd20: 48        
            lda $0205,y        ; $dd21: b9 05 02  
            sta $0201,y        ; $dd24: 99 01 02  
            pla                ; $dd27: 68        
            sta $0205,y        ; $dd28: 99 05 02  
            lda #$40           ; $dd2b: a9 40     
__dd2d:     ora $03            ; $dd2d: 05 03     
            sta $0202,y        ; $dd2f: 99 02 02  
            sta $0206,y        ; $dd32: 99 06 02  
            lda #$f8           ; $dd35: a9 f8     
            sta $0200,y        ; $dd37: 99 00 02  
            sta $0204,y        ; $dd3a: 99 04 02  
            lda $ee            ; $dd3d: a5 ee     
            and #$08           ; $dd3f: 29 08     
            bne __dd48         ; $dd41: d0 05     
            lda $00            ; $dd43: a5 00     
            sta $0200,y        ; $dd45: 99 00 02  
__dd48:     lda $ee            ; $dd48: a5 ee     
            and #$04           ; $dd4a: 29 04     
            bne __dd53         ; $dd4c: d0 05     
            lda $00            ; $dd4e: a5 00     
            sta $0204,y        ; $dd50: 99 04 02  
__dd53:     lda $00            ; $dd53: a5 00     
            clc                ; $dd55: 18        
            adc #$10           ; $dd56: 69 10     
            sta $00            ; $dd58: 85 00     
            lda $01            ; $dd5a: a5 01     
            sta $0203,y        ; $dd5c: 99 03 02  
            clc                ; $dd5f: 18        
            adc #$08           ; $dd60: 69 08     
            sta $0207,y        ; $dd62: 99 07 02  
            tya                ; $dd65: 98        
            clc                ; $dd66: 18        
            adc #$08           ; $dd67: 69 08     
            tay                ; $dd69: a8        
            inx                ; $dd6a: e8        
            inx                ; $dd6b: e8        
            rts                ; $dd6c: 60        

;-------------------------------------------------------------------------------
__dd6d:     lda __a030,x       ; $dd6d: bd 30 a0  
            sta $0201,y        ; $dd70: 99 01 02  
            lda __a031,x       ; $dd73: bd 31 a0  
            sta $0205,y        ; $dd76: 99 05 02  
            lda __a032,x       ; $dd79: bd 32 a0  
            sta $0209,y        ; $dd7c: 99 09 02  
            lda $02            ; $dd7f: a5 02     
            lsr                ; $dd81: 4a        
            lda #$00           ; $dd82: a9 00     
            bcc __dd96         ; $dd84: 90 10     
            lda $0201,y        ; $dd86: b9 01 02  
            pha                ; $dd89: 48        
            lda $0209,y        ; $dd8a: b9 09 02  
            sta $0201,y        ; $dd8d: 99 01 02  
            pla                ; $dd90: 68        
            sta $0209,y        ; $dd91: 99 09 02  
            lda #$40           ; $dd94: a9 40     
__dd96:     ora $03            ; $dd96: 05 03     
            sta $0202,y        ; $dd98: 99 02 02  
            sta $0206,y        ; $dd9b: 99 06 02  
            sta $020a,y        ; $dd9e: 99 0a 02  
            lda #$f8           ; $dda1: a9 f8     
            sta $0200,y        ; $dda3: 99 00 02  
            sta $0204,y        ; $dda6: 99 04 02  
            sta $0208,y        ; $dda9: 99 08 02  
            lda $ee            ; $ddac: a5 ee     
            and #$08           ; $ddae: 29 08     
            bne __ddb7         ; $ddb0: d0 05     
            lda $00            ; $ddb2: a5 00     
            sta $0200,y        ; $ddb4: 99 00 02  
__ddb7:     lda $ee            ; $ddb7: a5 ee     
            and #$04           ; $ddb9: 29 04     
            bne __ddc2         ; $ddbb: d0 05     
            lda $00            ; $ddbd: a5 00     
            sta $0204,y        ; $ddbf: 99 04 02  
__ddc2:     lda $ee            ; $ddc2: a5 ee     
            and #$02           ; $ddc4: 29 02     
            bne __ddcd         ; $ddc6: d0 05     
            lda $00            ; $ddc8: a5 00     
            sta $0208,y        ; $ddca: 99 08 02  
__ddcd:     lda $00            ; $ddcd: a5 00     
            clc                ; $ddcf: 18        
            adc #$10           ; $ddd0: 69 10     
            sta $00            ; $ddd2: 85 00     
            lda $01            ; $ddd4: a5 01     
            sta $0203,y        ; $ddd6: 99 03 02  
            adc #$08           ; $ddd9: 69 08     
            sta $0207,y        ; $dddb: 99 07 02  
            adc #$08           ; $ddde: 69 08     
            sta $020b,y        ; $dde0: 99 0b 02  
            txa                ; $dde3: 8a        
            pha                ; $dde4: 48        
            jsr __fafe         ; $dde5: 20 fe fa  
            pla                ; $dde8: 68        
            tax                ; $dde9: aa        
            lda $0d            ; $ddea: a5 0d     
            bne __ddf0         ; $ddec: d0 02     
            sty $0d            ; $ddee: 84 0d     
__ddf0:     inx                ; $ddf0: e8        
            inx                ; $ddf1: e8        
            inx                ; $ddf2: e8        
            rts                ; $ddf3: 60        

;-------------------------------------------------------------------------------
            .hex 04 00         ; $ddf4: 04 00     Invalid Opcode - NOP $00
            .hex ff ff 00      ; $ddf6: ff ff 00  Bad Addr Mode - ISC $00ff,x
            brk                ; $ddf9: 00        
            .hex 01            ; $ddfa: 01        Suspected data
__ddfb:     ora ($00,x)        ; $ddfb: 01 00     
            brk                ; $ddfd: 00        
            ora ($00,x)        ; $ddfe: 01 00     
__de00:     brk                ; $de00: 00        
            ora ($01,x)        ; $de01: 01 01     
            brk                ; $de03: 00        
            brk                ; $de04: 00        
            ora ($20,x)        ; $de05: 01 20     
            .hex a7 9b         ; $de07: a7 9b     Invalid Opcode - LAX $9b
            lda $ee            ; $de09: a5 ee     
            and #$0c           ; $de0b: 29 0c     
            bne __de3a         ; $de0d: d0 2b     
            lda $9f,x          ; $de0f: b5 9f     
            and #$0c           ; $de11: 29 0c     
            lsr                ; $de13: 4a        
            lsr                ; $de14: 4a        
            sta $00            ; $de15: 85 00     
            lda $6f,x          ; $de17: b5 6f     
            tax                ; $de19: aa        
            lda __9df3,x       ; $de1a: bd f3 9d  
            .hex 65            ; $de1d: 65        Suspected data
__de1e:     .hex f4 a8         ; $de1e: f4 a8     Invalid Opcode - NOP $a8,x
            txa                ; $de20: 8a        
            asl                ; $de21: 0a        
            asl                ; $de22: 0a        
            adc $00            ; $de23: 65 00     
            tax                ; $de25: aa        
            lda $0200,y        ; $de26: b9 00 02  
            adc __9dfa,x       ; $de29: 7d fa 9d  
            sta $0200,y        ; $de2c: 99 00 02  
            lda $0203,y        ; $de2f: b9 03 02  
            adc __9df2,x       ; $de32: 7d f2 9d  
            sta $0203,y        ; $de35: 99 03 02  
            ldx $12            ; $de38: a6 12     
__de3a:     rts                ; $de3a: 60        

;-------------------------------------------------------------------------------
            lda $28            ; $de3b: a5 28     
            sbc $29,x          ; $de3d: f5 29     
            sta $0f            ; $de3f: 85 0f     
            lda $14            ; $de41: a5 14     
            ldy #$00           ; $de43: a0 00     
            sbc $15,x          ; $de45: f5 15     
            bcs __de4a         ; $de47: b0 01     
            iny                ; $de49: c8        
__de4a:     rts                ; $de4a: 60        

;-------------------------------------------------------------------------------
            txa                ; $de4b: 8a        
            clc                ; $de4c: 18        
            adc #$0a           ; $de4d: 69 0a     
            tax                ; $de4f: aa        
            lda $3d,x          ; $de50: b5 3d     
            clc                ; $de52: 18        
            adc $04cc,x        ; $de53: 7d cc 04  
            pha                ; $de56: 48        
            asl                ; $de57: 0a        
            asl                ; $de58: 0a        
            asl                ; $de59: 0a        
            asl                ; $de5a: 0a        
            sta $01            ; $de5b: 85 01     
            pla                ; $de5d: 68        
            lsr                ; $de5e: 4a        
            lsr                ; $de5f: 4a        
            lsr                ; $de60: 4a        
            lsr                ; $de61: 4a        
            cmp #$08           ; $de62: c9 08     
            bcc __de68         ; $de64: 90 02     
            ora #$f0           ; $de66: 09 f0     
__de68:     sta $00            ; $de68: 85 00     
            ldy #$00           ; $de6a: a0 00     
            asl                ; $de6c: 0a        
            bcc __de70         ; $de6d: 90 01     
            dey                ; $de6f: 88        
__de70:     sty $02            ; $de70: 84 02     
            lda $0408,x        ; $de72: bd 08 04  
            clc                ; $de75: 18        
            adc $01            ; $de76: 65 01     
            sta $0408,x        ; $de78: 9d 08 04  
            lda $29,x          ; $de7b: b5 29     
            adc $00            ; $de7d: 65 00     
            sta $29,x          ; $de7f: 95 29     
            rol $01            ; $de81: 26 01     
            cpx #$0a           ; $de83: e0 0a     
            bcs __de9e         ; $de85: b0 17     
            lda #$00           ; $de87: a9 00     
            sta $04a4,x        ; $de89: 9d a4 04  
            lda $90,x          ; $de8c: b5 90     
            cmp #$1b           ; $de8e: c9 1b     
            beq __de9e         ; $de90: f0 0c     
            cmp #$0f           ; $de92: c9 0f     
            beq __de9e         ; $de94: f0 08     
            cmp #$10           ; $de96: c9 10     
            beq __de9e         ; $de98: f0 04     
            ldy $ec            ; $de9a: a4 ec     
            beq __dea6         ; $de9c: f0 08     
__de9e:     lsr $01            ; $de9e: 46 01     
            lda $15,x          ; $dea0: b5 15     
            adc $02            ; $dea2: 65 02     
            sta $15,x          ; $dea4: 95 15     
__dea6:     ldx $12            ; $dea6: a6 12     
            rts                ; $dea8: 60        

;-------------------------------------------------------------------------------
            lda $3d,x          ; $dea9: b5 3d     
            eor #$ff           ; $deab: 49 ff     
            clc                ; $dead: 18        
            adc #$01           ; $deae: 69 01     
            sta $3d,x          ; $deb0: 95 3d     
            beq __deba         ; $deb2: f0 06     
            lda $6f,x          ; $deb4: b5 6f     
            eor #$03           ; $deb6: 49 03     
            sta $6f,x          ; $deb8: 95 6f     
__deba:     jmp __9e50         ; $deba: 4c 50 9e  

;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $debd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dec0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dec3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dec6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dec9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $decc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $decf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ded2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ded5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ded8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dedb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dede: ff ff ff  Invalid Opcode - ISC Array,x
__dee1:     .hex ff ff ff      ; $dee1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dee4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dee7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $deea: ff        Suspected data
__deeb:     .hex ff ff ff      ; $deeb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $deee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $def1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $def4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $def7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $defa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $defd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df00: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df03: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df06: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df09: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df0c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df0f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df12: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df15: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df18: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df1b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df1e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df21: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df24: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df27: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df2a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df2d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df30: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df33: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df36: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df39: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df3c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df3f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df42: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df45: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df48: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df4b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df4e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df51: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df54: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df57: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df5a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df5d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df60: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df63: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df66: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df69: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df6c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df6f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df72: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df75: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df78: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df7b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df7e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df81: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df84: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df87: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df8a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df8d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df90: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df93: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df96: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df99: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df9c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $df9f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfa2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfa5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfa8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfab: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfae: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfb1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfb4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfb7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfba: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfbd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfc0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfc3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfc6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfc9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfcc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfcf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfd2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfd5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfd8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfdb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfde: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfe1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfe4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfe7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfea: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dfed: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dff0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dff3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dff6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff         ; $dff9: ff ff     Suspected data
__dffb:     .hex ff ff ff      ; $dffb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $dffe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e001: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e004: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e007: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e00a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e00d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e010: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e013: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e016: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e019: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e01c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e01f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e022: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e025: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e028: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $e02b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff 2d      ; $e02e: ff ff 2d  Invalid Opcode - ISC $2dff,x
            .hex 2f 2d 2f      ; $e031: 2f 2d 2f  Invalid Opcode - RLA $2f2d
            cpx #$e2           ; $e034: e0 e2     
            cpx $e6            ; $e036: e4 e6     
            cpx #$e2           ; $e038: e0 e2     
            cpx $e6            ; $e03a: e4 e6     
            inx                ; $e03c: e8        
            nop                ; $e03d: ea        
            cpx __e8ee         ; $e03e: ec ee e8  
            nop                ; $e041: ea        
            cpx $01ee          ; $e042: ec ee 01  
            .hex 03 09         ; $e045: 03 09     Invalid Opcode - SLO ($09,x)
            ora $07            ; $e047: 05 07     
            .hex 0b 0d         ; $e049: 0b 0d     Invalid Opcode - ANC #$0d
            .hex 0f 15 11      ; $e04b: 0f 15 11  Invalid Opcode - SLO $1115
            .hex 13 17         ; $e04e: 13 17     Invalid Opcode - SLO ($17),y
            ora ($03,x)        ; $e050: 01 03     
            ora #$05           ; $e052: 09 05     
            ora $011b,y        ; $e054: 19 1b 01  
            .hex 03 09         ; $e057: 03 09     Invalid Opcode - SLO ($09,x)
            ora $19            ; $e059: 05 19     
            .hex 1b 1d 1f      ; $e05b: 1b 1d 1f  Invalid Opcode - SLO $1f1d,y
            and $21            ; $e05e: 25 21     
            .hex 23 27         ; $e060: 23 27     Invalid Opcode - RLA ($27,x)
            .hex 1d 1f         ; $e062: 1d 1f     Suspected data
__e064:     and $21            ; $e064: 25 21     
            .hex 23 27         ; $e066: 23 27     Invalid Opcode - RLA ($27,x)
__e068:     .hex 9c 9e 9c      ; $e068: 9c 9e 9c  Invalid Opcode - SHY __9c9e,x
            .hex 9e d0 d2      ; $e06b: 9e d0 d2  Invalid Opcode - SHX __d2d0,y
            .hex d4 d6         ; $e06e: d4 d6     Invalid Opcode - NOP $d6,x
            beq __e064         ; $e070: f0 f2     
            .hex f4 f6         ; $e072: f4 f6     Invalid Opcode - NOP $f6,x
            beq __e068         ; $e074: f0 f2     
            sed                ; $e076: f8        
            .hex fa            ; $e077: fa        Invalid Opcode - NOP 
            .hex 0f 11 13      ; $e078: 0f 11 13  Invalid Opcode - SLO $1311
            ora $1f,x          ; $e07b: 15 1f     
            ora ($13),y        ; $e07d: 11 13     
            .hex 15            ; $e07f: 15        Suspected data
__e080:     .hex 17 19         ; $e080: 17 19     Invalid Opcode - SLO $19,x
            .hex 1b 17         ; $e082: 1b 17     Suspected data
__e084:     ora $091d,y        ; $e084: 19 1d 09  
            .hex 0b 01         ; $e087: 0b 01     Invalid Opcode - ANC #$01
            .hex 03 05         ; $e089: 03 05     Invalid Opcode - SLO ($05,x)
            .hex 07 55         ; $e08b: 07 55     Invalid Opcode - SLO $55
            eor $5d5b,y        ; $e08d: 59 5b 5d  
            beq __e084         ; $e090: f0 f2     
            .hex f4 f6         ; $e092: f4 f6     Invalid Opcode - NOP $f6,x
            eor $59            ; $e094: 45 59     
            .hex 5b 5d         ; $e096: 5b 5d     Suspected data
__e098:     eor $59            ; $e098: 45 59     
__e09a:     .hex 5b 5d e8      ; $e09a: 5b 5d e8  Invalid Opcode - SRE __e85d,y
            nop                ; $e09d: ea        
            cpx __ecee         ; $e09e: ec ee ec  
            inc __eeec         ; $e0a1: ee ec ee  
            beq __e098         ; $e0a4: f0 f2     
            beq __e09a         ; $e0a6: f0 f2     
            .hex f4 f6         ; $e0a8: f4 f6     Invalid Opcode - NOP $f6,x
            sed                ; $e0aa: f8        
            .hex fa            ; $e0ab: fa        Invalid Opcode - NOP 
            bne __e080         ; $e0ac: d0 d2     
            .hex d4 d6         ; $e0ae: d4 d6     Invalid Opcode - NOP $d6,x
            ora ($03,x)        ; $e0b0: 01 03     
            ora $07            ; $e0b2: 05 07     
            ora #$0b           ; $e0b4: 09 0b     
            ora $010f          ; $e0b6: 0d 0f 01  
            ora ($05),y        ; $e0b9: 11 05     
            ora $13,x          ; $e0bb: 15 13     
            .hex 0b 17         ; $e0bd: 0b 17     Invalid Opcode - ANC #$17
            .hex 0f 19 1b      ; $e0bf: 0f 19 1b  Invalid Opcode - SLO $1b19
            and $3a2f          ; $e0c2: 2d 2f 3a  
            .hex 3a            ; $e0c5: 3a        Invalid Opcode - NOP 
            cpx #$e2           ; $e0c6: e0 e2     
            cpx $e6            ; $e0c8: e4 e6     
            inx                ; $e0ca: e8        
            nop                ; $e0cb: ea        
            cpx $01ee          ; $e0cc: ec ee 01  
            .hex 03 05         ; $e0cf: 03 05     Invalid Opcode - SLO ($05,x)
            .hex 07 4f         ; $e0d1: 07 4f     Invalid Opcode - SLO $4f
            eor $0705,x        ; $e0d3: 5d 05 07  
            ora #$0b           ; $e0d6: 09 0b     
            ora $270f          ; $e0d8: 0d 0f 27  
            adc $2d7b,y        ; $e0db: 79 7b 2d  
            .hex 4f 2f 45      ; $e0de: 4f 2f 45  Invalid Opcode - SRE $452f
            eor $11,x          ; $e0e1: 55 11     
            .hex 13 15         ; $e0e3: 13 15     Invalid Opcode - SLO ($15),y
            .hex 17 1f         ; $e0e5: 17 1f     Invalid Opcode - SLO $1f,x
            and ($23,x)        ; $e0e7: 21 23     
            and $11            ; $e0e9: 25 11     
            .hex 13 23         ; $e0eb: 13 23     Invalid Opcode - SLO ($23),y
            and $59            ; $e0ed: 25 59     
            eor $5b5b,y        ; $e0ef: 59 5b 5b  
            ora ($03,x)        ; $e0f2: 01 03     
            ora $07            ; $e0f4: 05 07     
            ora #$0b           ; $e0f6: 09 0b     
            ora __fb0f         ; $e0f8: 0d 0f fb  
            ora ($15),y        ; $e0fb: 11 15     
            .hex 17 13         ; $e0fd: 17 13     Invalid Opcode - SLO $13,x
            .hex fb 19 1b      ; $e0ff: fb 19 1b  Invalid Opcode - ISC $1b19,y
            .hex 1d            ; $e102: 1d        Suspected data
__e103:     .hex 1f 21 23      ; $e103: 1f 21 23  Invalid Opcode - SLO $2321,x
            and $27            ; $e106: 25 27     
            and $27            ; $e108: 25 27     
            jsr __8f52         ; $e10a: 20 52 8f  
            lda #$04           ; $e10d: a9 04     
            sta $0465,x        ; $e10f: 9d 65 04  
            lda #$00           ; $e112: a9 00     
            sta $3d,x          ; $e114: 95 3d     
            lda $29,x          ; $e116: b5 29     
            clc                ; $e118: 18        
            adc #$04           ; $e119: 69 04     
            sta $29,x          ; $e11b: 95 29     
            jmp __8441         ; $e11d: 4c 41 84  

;-------------------------------------------------------------------------------
            iny                ; $e120: c8        
            bne __e103         ; $e121: d0 e0     
            beq __e125         ; $e123: f0 00     
__e125:     bpl __e147         ; $e125: 10 20     
            iny                ; $e127: c8        
            .hex dc e2 e8      ; $e128: dc e2 e8  Invalid Opcode - NOP __e8e2,x
            beq __e125         ; $e12b: f0 f8     
            inx                ; $e12d: e8        
            .hex dc dc bd      ; $e12e: dc dc bd  Invalid Opcode - NOP __bddc,x
            .hex 5c 04 1d      ; $e131: 5c 04 1d  Invalid Opcode - NOP $1d04,x
            sec                ; $e134: 38        
            .hex 04 f0         ; $e135: 04 f0     Invalid Opcode - NOP $f0
            .hex 03 4c         ; $e137: 03 4c     Invalid Opcode - SLO ($4c,x)
            .hex 1b 9b 20      ; $e139: 1b 9b 20  Invalid Opcode - SLO $209b,y
            .hex 7a            ; $e13c: 7a        Invalid Opcode - NOP 
            sta $33b5,y        ; $e13d: 99 b5 33  
            cmp #$70           ; $e140: c9 70     
            bcc __e147         ; $e142: 90 03     
            jsr __95ce         ; $e144: 20 ce 95  
__e147:     lda $86,x          ; $e147: b5 86     
            bne __e179         ; $e149: d0 2e     
            lda $79,x          ; $e14b: b5 79     
            and #$3f           ; $e14d: 29 3f     
            bne __e168         ; $e14f: d0 17     
            lda $05ae          ; $e151: ad ae 05  
            and #$03           ; $e154: 29 03     
            beq __e168         ; $e156: f0 10     
            ldy $04c0          ; $e158: ac c0 04  
            dey                ; $e15b: 88        
            cpy #$80           ; $e15c: c0 80     
            bcc __e168         ; $e15e: 90 08     
            lda #$7f           ; $e160: a9 7f     
            sta $86,x          ; $e162: 95 86     
            ldy #$00           ; $e164: a0 00     
            beq __e174         ; $e166: f0 0c     
__e168:     inc $79,x          ; $e168: f6 79     
            ldy #$f0           ; $e16a: a0 f0     
            lda $79,x          ; $e16c: b5 79     
            and #$20           ; $e16e: 29 20     
            beq __e174         ; $e170: f0 02     
            ldy #$10           ; $e172: a0 10     
__e174:     sty $3d,x          ; $e174: 94 3d     
            jmp __a1cd         ; $e176: 4c cd a1  

;-------------------------------------------------------------------------------
__e179:     cmp #$50           ; $e179: c9 50     
            bne __e17d         ; $e17b: d0 00     
__e17d:     cmp #$20           ; $e17d: c9 20     
            bne __e1cd         ; $e17f: d0 4c     
            lda $05ae          ; $e181: ad ae 05  
            and #$07           ; $e184: 29 07     
            tay                ; $e186: a8        
            lda __a128,y       ; $e187: b9 28 a1  
            sta $47,x          ; $e18a: 95 47     
            dec $33,x          ; $e18c: d6 33     
            jsr __92c8         ; $e18e: 20 c8 92  
            bmi __e1cd         ; $e191: 30 3a     
            ldy $00            ; $e193: a4 00     
            lda $33,x          ; $e195: b5 33     
            sec                ; $e197: 38        
            sbc #$00           ; $e198: e9 00     
            sta $0033,y        ; $e19a: 99 33 00  
            lda $1f,x          ; $e19d: b5 1f     
            sbc #$00           ; $e19f: e9 00     
            sta $001f,y        ; $e1a1: 99 1f 00  
            lda $29,x          ; $e1a4: b5 29     
            clc                ; $e1a6: 18        
            adc #$08           ; $e1a7: 69 08     
            sta $0029,y        ; $e1a9: 99 29 00  
            lda $15,x          ; $e1ac: b5 15     
            adc #$00           ; $e1ae: 69 00     
            sta $0015,y        ; $e1b0: 99 15 00  
            ldx $00            ; $e1b3: a6 00     
            lda #$22           ; $e1b5: a9 22     
            sta $90,x          ; $e1b7: 95 90     
            lda $05ae          ; $e1b9: ad ae 05  
            and #$07           ; $e1bc: 29 07     
            tay                ; $e1be: a8        
            lda __a120,y       ; $e1bf: b9 20 a1  
            sta $47,x          ; $e1c2: 95 47     
            lda #$d0           ; $e1c4: a9 d0     
            sta $3d,x          ; $e1c6: 95 3d     
            jsr __8441         ; $e1c8: 20 41 84  
            ldx $12            ; $e1cb: a6 12     
__e1cd:     jsr __9e50         ; $e1cd: 20 50 9e  
            .hex 20            ; $e1d0: 20        Suspected data
__e1d1:     .hex 7f 85 4c      ; $e1d1: 7f 85 4c  Invalid Opcode - RRA $4c85,x
            .hex 1b 9b 08      ; $e1d4: 1b 9b 08  Invalid Opcode - SLO $089b,y
            php                ; $e1d7: 08        
            .hex 1c f4 11      ; $e1d8: 1c f4 11  Invalid Opcode - NOP $11f4,x
            .hex 0f 04 06      ; $e1db: 0f 04 06  Invalid Opcode - SLO $0604
            php                ; $e1de: 08        
            php                ; $e1df: 08        
            php                ; $e1e0: 08        
            php                ; $e1e1: 08        
            asl $04            ; $e1e2: 06 04     
            .hex ad f4 00      ; $e1e4: ad f4 00  Bad Addr Mode - LDA $00f4
            .hex 95            ; $e1e7: 95        Suspected data
__e1e8:     lda ($b4),y        ; $e1e8: b1 b4     
            eor ($88),y        ; $e1ea: 51 88     
            tya                ; $e1ec: 98        
            ora $045c,x        ; $e1ed: 1d 5c 04  
            beq __e1fa         ; $e1f0: f0 08     
            ldy #$d2           ; $e1f2: a0 d2     
            lda #$00           ; $e1f4: a9 00     
            sta $86,x          ; $e1f6: 95 86     
            beq __e21c         ; $e1f8: f0 22     
__e1fa:     .hex a0            ; $e1fa: a0        Suspected data
__e1fb:     .hex c2 a5         ; $e1fb: c2 a5     Invalid Opcode - NOP #$a5
            bpl __e228         ; $e1fd: 10 29     
            bpl __e1d1         ; $e1ff: 10 d0     
            .hex 02            ; $e201: 02        Invalid Opcode - KIL 
            ldy #$c6           ; $e202: a0 c6     
            lda $86,x          ; $e204: b5 86     
            beq __e21c         ; $e206: f0 14     
            ldy #$ca           ; $e208: a0 ca     
            cmp #$60           ; $e20a: c9 60     
            bcs __e21c         ; $e20c: b0 0e     
            ldy #$c2           ; $e20e: a0 c2     
            cmp #$40           ; $e210: c9 40     
            bcs __e21c         ; $e212: b0 08     
            ldy #$c6           ; $e214: a0 c6     
            cmp #$20           ; $e216: c9 20     
            bcs __e21c         ; $e218: b0 02     
            ldy #$c2           ; $e21a: a0 c2     
__e21c:     lda #$02           ; $e21c: a9 02     
            sta $6f,x          ; $e21e: 95 6f     
            tya                ; $e220: 98        
            jsr __9bb3         ; $e221: 20 b3 9b  
            ldy #$c6           ; $e224: a0 c6     
            lda $10            ; $e226: a5 10     
__e228:     and #$10           ; $e228: 29 10     
            bne __e22e         ; $e22a: d0 02     
            ldy #$c2           ; $e22c: a0 c2     
__e22e:     lda $86,x          ; $e22e: b5 86     
            beq __e246         ; $e230: f0 14     
            ldy #$ce           ; $e232: a0 ce     
            cmp #$60           ; $e234: c9 60     
            bcs __e246         ; $e236: b0 0e     
            ldy #$c2           ; $e238: a0 c2     
            cmp #$40           ; $e23a: c9 40     
            bcs __e246         ; $e23c: b0 08     
            ldy #$c6           ; $e23e: a0 c6     
            cmp #$20           ; $e240: c9 20     
            bcs __e246         ; $e242: b0 02     
            ldy #$c2           ; $e244: a0 c2     
__e246:     lda $045c,x        ; $e246: bd 5c 04  
            beq __e24d         ; $e249: f0 02     
            ldy #$d2           ; $e24b: a0 d2     
__e24d:     lda $0429          ; $e24d: ad 29 04  
            clc                ; $e250: 18        
            adc #$10           ; $e251: 69 10     
            sta $0429          ; $e253: 8d 29 04  
            asl $ee            ; $e256: 06 ee     
            asl $ee            ; $e258: 06 ee     
            lda $86,x          ; $e25a: b5 86     
            cmp #$60           ; $e25c: c9 60     
            bcs __e262         ; $e25e: b0 02     
            lsr $6f,x          ; $e260: 56 6f     
__e262:     tya                ; $e262: 98        
            pha                ; $e263: 48        
            jsr __fafe         ; $e264: 20 fe fa  
            sty $f4            ; $e267: 84 f4     
            pla                ; $e269: 68        
            jsr __9bb3         ; $e26a: 20 b3 9b  
            lda $86,x          ; $e26d: b5 86     
            beq __e2d2         ; $e26f: f0 61     
            lsr                ; $e271: 4a        
            lsr                ; $e272: 4a        
            lsr                ; $e273: 4a        
            lsr                ; $e274: 4a        
            lsr                ; $e275: 4a        
            beq __e2d1         ; $e276: f0 59     
            tay                ; $e278: a8        
            lda $29,x          ; $e279: b5 29     
            pha                ; $e27b: 48        
            clc                ; $e27c: 18        
            adc __a1d5,y       ; $e27d: 79 d5 a1  
            sta $29,x          ; $e280: 95 29     
            sec                ; $e282: 38        
            sbc $04c0          ; $e283: ed c0 04  
            sta $0429          ; $e286: 8d 29 04  
            lda $33,x          ; $e289: b5 33     
            clc                ; $e28b: 18        
            adc __a1d8,y       ; $e28c: 79 d8 a1  
            sta $042c          ; $e28f: 8d 2c 04  
            lda $86,x          ; $e292: b5 86     
            cmp #$30           ; $e294: c9 30     
            bcc __e2aa         ; $e296: 90 12     
            cmp #$40           ; $e298: c9 40     
            bcs __e2aa         ; $e29a: b0 0e     
            lsr                ; $e29c: 4a        
            and #$07           ; $e29d: 29 07     
            tay                ; $e29f: a8        
            lda $042c          ; $e2a0: ad 2c 04  
            sec                ; $e2a3: 38        
            sbc __a1dc,y       ; $e2a4: f9 dc a1  
            sta $042c          ; $e2a7: 8d 2c 04  
__e2aa:     jsr __8894         ; $e2aa: 20 94 88  
            ldy #$00           ; $e2ad: a0 00     
            .hex 8c f4 00      ; $e2af: 8c f4 00  Bad Addr Mode - STY $00f4
            lda $65,x          ; $e2b2: b5 65     
            pha                ; $e2b4: 48        
            lda #$02           ; $e2b5: a9 02     
            sta $65,x          ; $e2b7: 95 65     
            lda $046e,x        ; $e2b9: bd 6e 04  
            pha                ; $e2bc: 48        
            lda #$10           ; $e2bd: a9 10     
            sta $046e,x        ; $e2bf: 9d 6e 04  
            lda #$d6           ; $e2c2: a9 d6     
            jsr __9bb3         ; $e2c4: 20 b3 9b  
            pla                ; $e2c7: 68        
            sta $046e,x        ; $e2c8: 9d 6e 04  
            pla                ; $e2cb: 68        
            sta $65,x          ; $e2cc: 95 65     
            pla                ; $e2ce: 68        
            sta $29,x          ; $e2cf: 95 29     
__e2d1:     rts                ; $e2d1: 60        

;-------------------------------------------------------------------------------
__e2d2:     lda $10            ; $e2d2: a5 10     
            and #$04           ; $e2d4: 29 04     
            beq __e2e1         ; $e2d6: f0 09     
            .hex ae f4 00      ; $e2d8: ae f4 00  Bad Addr Mode - LDX $00f4
            dec $020c,x        ; $e2db: de 0c 02  
            ldx $12            ; $e2de: a6 12     
__e2e0:     rts                ; $e2e0: 60        

;-------------------------------------------------------------------------------
__e2e1:     lda $b1,x          ; $e2e1: b5 b1     
            tax                ; $e2e3: aa        
            dec $0208,x        ; $e2e4: de 08 02  
__e2e7:     ldx $12            ; $e2e7: a6 12     
            rts                ; $e2e9: 60        

;-------------------------------------------------------------------------------
            lda #$00           ; $e2ea: a9 00     
            sta $045c,x        ; $e2ec: 9d 5c 04  
            jsr __997a         ; $e2ef: 20 7a 99  
            jsr __98cd         ; $e2f2: 20 cd 98  
            jsr __9e50         ; $e2f5: 20 50 9e  
            jsr __857f         ; $e2f8: 20 7f 85  
            jsr __b4fd         ; $e2fb: 20 fd b4  
            lda $5b,x          ; $e2fe: b5 5b     
            and #$03           ; $e300: 29 03     
            beq __e30a         ; $e302: f0 06     
            jsr __9ea9         ; $e304: 20 a9 9e  
            jsr __95b0         ; $e307: 20 b0 95  
__e30a:     lda $5b,x          ; $e30a: b5 5b     
            and #$04           ; $e30c: 29 04     
            beq __e320         ; $e30e: f0 10     
            lda $33,x          ; $e310: b5 33     
            and #$f0           ; $e312: 29 f0     
            sta $33,x          ; $e314: 95 33     
            lda $47,x          ; $e316: b5 47     
            lsr                ; $e318: 4a        
            eor #$ff           ; $e319: 49 ff     
            clc                ; $e31b: 18        
            adc #$01           ; $e31c: 69 01     
            sta $47,x          ; $e31e: 95 47     
__e320:     jmp __9b1b         ; $e320: 4c 1b 9b  

;-------------------------------------------------------------------------------
            .hex bd a8 00      ; $e323: bd a8 00  Bad Addr Mode - LDA $00a8,x
            ora $0438,x        ; $e326: 1d 38 04  
            bne __e362         ; $e329: d0 37     
            lda $10            ; $e32b: a5 10     
            sta $00            ; $e32d: 85 00     
            lda $3d,x          ; $e32f: b5 3d     
            bpl __e338         ; $e331: 10 05     
            eor #$ff           ; $e333: 49 ff     
            clc                ; $e335: 18        
            adc #$01           ; $e336: 69 01     
__e338:     cmp #$20           ; $e338: c9 20     
            bcs __e344         ; $e33a: b0 08     
            lsr $00            ; $e33c: 46 00     
            cmp #$08           ; $e33e: c9 08     
            bcs __e344         ; $e340: b0 02     
            lsr $00            ; $e342: 46 00     
__e344:     lda $00            ; $e344: a5 00     
            clc                ; $e346: 18        
            adc #$04           ; $e347: 69 04     
            and #$08           ; $e349: 29 08     
            lsr                ; $e34b: 4a        
            lsr                ; $e34c: 4a        
            lsr                ; $e34d: 4a        
            ldy $3d,x          ; $e34e: b4 3d     
            bpl __e354         ; $e350: 10 02     
            eor #$01           ; $e352: 49 01     
__e354:     sta $6f,x          ; $e354: 95 6f     
            lda $00            ; $e356: a5 00     
            and #$08           ; $e358: 29 08     
            asl                ; $e35a: 0a        
            asl                ; $e35b: 0a        
            asl                ; $e35c: 0a        
            asl                ; $e35d: 0a        
            ora #$02           ; $e35e: 09 02     
            sta $65,x          ; $e360: 95 65     
__e362:     jmp __9ba7         ; $e362: 4c a7 9b  

;-------------------------------------------------------------------------------
            brk                ; $e365: 00        
            ora $eb,x          ; $e366: 15 eb     
            brk                ; $e368: 00        
            jsr __b4fd         ; $e369: 20 fd b4  
            lda $10            ; $e36c: a5 10     
            and #$03           ; $e36e: 29 03     
            bne __e37c         ; $e370: d0 0a     
            dec $b1,x          ; $e372: d6 b1     
            bne __e37c         ; $e374: d0 06     
            sta $04b2          ; $e376: 8d b2 04  
            jmp __89a9         ; $e379: 4c a9 89  

;-------------------------------------------------------------------------------
__e37c:     lda $04b2          ; $e37c: ad b2 04  
            beq __e38f         ; $e37f: f0 0e     
            lda $46            ; $e381: a5 46     
            bpl __e38f         ; $e383: 10 0a     
            lda #$00           ; $e385: a9 00     
            sta $47,x          ; $e387: 95 47     
            sta $04b2          ; $e389: 8d b2 04  
            jmp __a552         ; $e38c: 4c 52 a5  

;-------------------------------------------------------------------------------
__e38f:     lda $5b,x          ; $e38f: b5 5b     
            and #$20           ; $e391: 29 20     
            sta $04b2          ; $e393: 8d b2 04  
            bne __e39b         ; $e396: d0 03     
            jmp __a42a         ; $e398: 4c 2a a4  

;-------------------------------------------------------------------------------
__e39b:     lda $3d,x          ; $e39b: b5 3d     
            beq __e3a5         ; $e39d: f0 06     
            lda $6f,x          ; $e39f: b5 6f     
            and #$01           ; $e3a1: 29 01     
            sta $9d            ; $e3a3: 85 9d     
__e3a5:     lda $33,x          ; $e3a5: b5 33     
            sec                ; $e3a7: 38        
            sbc #$1a           ; $e3a8: e9 1a     
            sta $32            ; $e3aa: 85 32     
            lda $1f,x          ; $e3ac: b5 1f     
            sbc #$00           ; $e3ae: e9 00     
            .hex 85            ; $e3b0: 85        Suspected data
__e3b1:     asl $28a5,x        ; $e3b1: 1e a5 28  
            sec                ; $e3b4: 38        
            sbc #$08           ; $e3b5: e9 08     
            sta $29,x          ; $e3b7: 95 29     
            lda $14            ; $e3b9: a5 14     
            sbc #$00           ; $e3bb: e9 00     
            sta $15,x          ; $e3bd: 95 15     
            ldy #$01           ; $e3bf: a0 01     
            lda $3d,x          ; $e3c1: b5 3d     
            bmi __e3c7         ; $e3c3: 30 02     
            ldy #$ff           ; $e3c5: a0 ff     
__e3c7:     sty $71cc          ; $e3c7: 8c cc 71  
            lda $f7            ; $e3ca: a5 f7     
            and #$03           ; $e3cc: 29 03     
            tay                ; $e3ce: a8        
            .hex 2d 5a 00      ; $e3cf: 2d 5a 00  Bad Addr Mode - AND $005a
            bne __e3e6         ; $e3d2: d0 12     
            lda __a365,y       ; $e3d4: b9 65 a3  
            cmp $3d,x          ; $e3d7: d5 3d     
            beq __e3e3         ; $e3d9: f0 08     
            lda $3d,x          ; $e3db: b5 3d     
            clc                ; $e3dd: 18        
            adc $71cc,y        ; $e3de: 79 cc 71  
            sta $3d,x          ; $e3e1: 95 3d     
__e3e3:     jmp __a3ea         ; $e3e3: 4c ea a3  

;-------------------------------------------------------------------------------
__e3e6:     lda #$00           ; $e3e6: a9 00     
            sta $3d,x          ; $e3e8: 95 3d     
            ldy #$01           ; $e3ea: a0 01     
            lda $47,x          ; $e3ec: b5 47     
            bmi __e3f2         ; $e3ee: 30 02     
            ldy #$ff           ; $e3f0: a0 ff     
__e3f2:     sty $71cc          ; $e3f2: 8c cc 71  
            lda #$20           ; $e3f5: a9 20     
            cmp $042c          ; $e3f7: cd 2c 04  
            lda #$00           ; $e3fa: a9 00     
            rol                ; $e3fc: 2a        
            asl                ; $e3fd: 0a        
            asl                ; $e3fe: 0a        
            asl                ; $e3ff: 0a        
            and $f7            ; $e400: 25 f7     
            bne __e417         ; $e402: d0 13     
            lda $5b,x          ; $e404: b5 5b     
            lsr                ; $e406: 4a        
            lsr                ; $e407: 4a        
            and #$03           ; $e408: 29 03     
            sta $00            ; $e40a: 85 00     
            lda $f7            ; $e40c: a5 f7     
            lsr                ; $e40e: 4a        
            lsr                ; $e40f: 4a        
            and #$03           ; $e410: 29 03     
            tay                ; $e412: a8        
            and $00            ; $e413: 25 00     
            beq __e41b         ; $e415: f0 04     
__e417:     lda #$00           ; $e417: a9 00     
            beq __e428         ; $e419: f0 0d     
__e41b:     lda __a365,y       ; $e41b: b9 65 a3  
            cmp $47,x          ; $e41e: d5 47     
            beq __e42a         ; $e420: f0 08     
            lda $47,x          ; $e422: b5 47     
            clc                ; $e424: 18        
            adc $71cc,y        ; $e425: 79 cc 71  
__e428:     sta $47,x          ; $e428: 95 47     
__e42a:     jsr __9e50         ; $e42a: 20 50 9e  
            jsr __9e4b         ; $e42d: 20 4b 9e  
            lda $b1,x          ; $e430: b5 b1     
            cmp #$20           ; $e432: c9 20     
            bcs __e43d         ; $e434: b0 07     
            lda $10            ; $e436: a5 10     
            and #$02           ; $e438: 29 02     
            bne __e43d         ; $e43a: d0 01     
            rts                ; $e43c: 60        

;-------------------------------------------------------------------------------
__e43d:     jmp __a552         ; $e43d: 4c 52 a5  

;-------------------------------------------------------------------------------
            jsr __92c4         ; $e440: 20 c4 92  
            bmi __e478         ; $e443: 30 33     
            ldx $00            ; $e445: a6 00     
            ldy $12            ; $e447: a4 12     
            lda #$00           ; $e449: a9 00     
            sta $3d,x          ; $e44b: 95 3d     
            sta $47,x          ; $e44d: 95 47     
            lda #$41           ; $e44f: a9 41     
            sta $90,x          ; $e451: 95 90     
            lda $0029,y        ; $e453: b9 29 00  
            sec                ; $e456: 38        
            sbc #$08           ; $e457: e9 08     
            sta $29,x          ; $e459: 95 29     
            lda $0015,y        ; $e45b: b9 15 00  
            sbc #$00           ; $e45e: e9 00     
            sta $15,x          ; $e460: 95 15     
            .hex b9            ; $e462: b9        Suspected data
__e463:     .hex 33            ; $e463: 33        Suspected data
__e464:     brk                ; $e464: 00        
            clc                ; $e465: 18        
            adc #$0e           ; $e466: 69 0e     
            sta $33,x          ; $e468: 95 33     
            lda $001f,y        ; $e46a: b9 1f 00  
            adc #$00           ; $e46d: 69 00     
            sta $1f,x          ; $e46f: 95 1f     
            jsr __8441         ; $e471: 20 41 84  
            lda #$a0           ; $e474: a9 a0     
            sta $b1,x          ; $e476: 95 b1     
__e478:     ldx $12            ; $e478: a6 12     
            rts                ; $e47a: 60        

;-------------------------------------------------------------------------------
            .hex 02            ; $e47b: 02        Invalid Opcode - KIL 
            .hex 02            ; $e47c: 02        Invalid Opcode - KIL 
            ora ($01,x)        ; $e47d: 01 01     
            .hex 04 0c         ; $e47f: 04 0c     Invalid Opcode - NOP $0c
            .hex 0c 04 01      ; $e481: 0c 04 01  Invalid Opcode - NOP $0104
            .hex ff 08 f8      ; $e484: ff 08 f8  Invalid Opcode - ISC __f808,x
            ora ($ff,x)        ; $e487: 01 ff     
            jsr $14e0          ; $e489: 20 e0 14  
            cpx $7a20          ; $e48c: ec 20 7a  
            sta __9ff6,y       ; $e48f: 99 f6 9f  
            lda $042f,x        ; $e492: bd 2f 04  
            beq __e4a3         ; $e495: f0 0c     
            lda $65,x          ; $e497: b5 65     
            ora #$80           ; $e499: 09 80     
            sta $65,x          ; $e49b: 95 65     
            jsr __a508         ; $e49d: 20 08 a5  
            jmp __8577         ; $e4a0: 4c 77 85  

;-------------------------------------------------------------------------------
__e4a3:     jsr __98cd         ; $e4a3: 20 cd 98  
            .hex b5            ; $e4a6: b5        Suspected data
__e4a7:     lda ($f0),y        ; $e4a7: b1 f0     
            .hex 17 d6         ; $e4a9: 17 d6     Invalid Opcode - SLO $d6,x
            .hex 47 10         ; $e4ab: 47 10     Invalid Opcode - SRE $10
            bpl __e464         ; $e4ad: 10 b5     
            .hex 33 c9         ; $e4af: 33 c9     Invalid Opcode - RLA ($c9),y
            bmi __e463         ; $e4b1: 30 b0     
            asl                ; $e4b3: 0a        
            lda #$00           ; $e4b4: a9 00     
            sta $b1,x          ; $e4b6: 95 b1     
            sta $3d,x          ; $e4b8: 95 3d     
            sta $47,x          ; $e4ba: 95 47     
            dec $86,x          ; $e4bc: d6 86     
            jmp __a502         ; $e4be: 4c 02 a5  

;-------------------------------------------------------------------------------
            lda $86,x          ; $e4c1: b5 86     
            bne __e4d6         ; $e4c3: d0 11     
            lda #$30           ; $e4c5: a9 30     
            sta $47,x          ; $e4c7: 95 47     
            jsr __9e3b         ; $e4c9: 20 3b 9e  
            lda __a48b,y       ; $e4cc: b9 8b a4  
            sta $3d,x          ; $e4cf: 95 3d     
            inc $b1,x          ; $e4d1: f6 b1     
            jmp __a508         ; $e4d3: 4c 08 a5  

;-------------------------------------------------------------------------------
__e4d6:     lda $0480,x        ; $e4d6: bd 80 04  
            and #$01           ; $e4d9: 29 01     
            tay                ; $e4db: a8        
            lda $47,x          ; $e4dc: b5 47     
            clc                ; $e4de: 18        
            adc __a483,y       ; $e4df: 79 83 a4  
            sta $47,x          ; $e4e2: 95 47     
            cmp __a485,y       ; $e4e4: d9 85 a4  
            bne __e4ec         ; $e4e7: d0 03     
            inc $0480,x        ; $e4e9: fe 80 04  
__e4ec:     lda $0477,x        ; $e4ec: bd 77 04  
            and #$01           ; $e4ef: 29 01     
            tay                ; $e4f1: a8        
            lda $3d,x          ; $e4f2: b5 3d     
            clc                ; $e4f4: 18        
            adc __a487,y       ; $e4f5: 79 87 a4  
            sta $3d,x          ; $e4f8: 95 3d     
            cmp __a489,y       ; $e4fa: d9 89 a4  
            bne __e502         ; $e4fd: d0 03     
            inc $0477,x        ; $e4ff: fe 77 04  
__e502:     jsr __9e4b         ; $e502: 20 4b 9e  
            jsr __9e50         ; $e505: 20 50 9e  
            jsr __9ba7         ; $e508: 20 a7 9b  
            lda $51,x          ; $e50b: b5 51     
            sec                ; $e50d: 38        
            sbc #$01           ; $e50e: e9 01     
            ora $042f,x        ; $e510: 1d 2f 04  
            ora $a8,x          ; $e513: 15 a8     
            bne __e551         ; $e515: d0 3a     
            jsr __fafe         ; $e517: 20 fe fa  
            .hex 8c f4 00      ; $e51a: 8c f4 00  Bad Addr Mode - STY $00f4
            lda #$45           ; $e51d: a9 45     
            sta $65,x          ; $e51f: 95 65     
            lda $29,x          ; $e521: b5 29     
            pha                ; $e523: 48        
            sec                ; $e524: 38        
            sbc #$08           ; $e525: e9 08     
            sta $29,x          ; $e527: 95 29     
            lda $15,x          ; $e529: b5 15     
            pha                ; $e52b: 48        
            sbc #$00           ; $e52c: e9 00     
            sta $15,x          ; $e52e: 95 15     
            jsr __8894         ; $e530: 20 94 88  
            pla                ; $e533: 68        
            sta $15,x          ; $e534: 95 15     
            pla                ; $e536: 68        
            sta $29,x          ; $e537: 95 29     
            lda $042c          ; $e539: ad 2c 04  
            clc                ; $e53c: 18        
            adc #$0c           ; $e53d: 69 0c     
            sta $042c          ; $e53f: 8d 2c 04  
            lda $0429          ; $e542: ad 29 04  
            sbc #$07           ; $e545: e9 07     
            sta $0429          ; $e547: 8d 29 04  
            jsr __a552         ; $e54a: 20 52 a5  
            lda #$0d           ; $e54d: a9 0d     
            sta $65,x          ; $e54f: 95 65     
__e551:     rts                ; $e551: 60        

;-------------------------------------------------------------------------------
            lda $10            ; $e552: a5 10     
            lsr                ; $e554: 4a        
            lsr                ; $e555: 4a        
            lsr                ; $e556: 4a        
            and #$03           ; $e557: 29 03     
            ldy $3d,x          ; $e559: b4 3d     
            bmi __e55f         ; $e55b: 30 02     
            eor #$03           ; $e55d: 49 03     
__e55f:     tay                ; $e55f: a8        
            lda __a47b,y       ; $e560: b9 7b a4  
            sta $6f,x          ; $e563: 95 6f     
            lda __a47f,y       ; $e565: b9 7f a4  
            jmp __9bb3         ; $e568: 4c b3 9b  

;-------------------------------------------------------------------------------
            jsr __8f52         ; $e56b: 20 52 8f  
            lda #$02           ; $e56e: a9 02     
            ldy $0635          ; $e570: ac 35 06  
            beq __e577         ; $e573: f0 02     
            lda #$04           ; $e575: a9 04     
__e577:     sta $0465,x        ; $e577: 9d 65 04  
            rts                ; $e57a: 60        

;-------------------------------------------------------------------------------
            jsr __997a         ; $e57b: 20 7a 99  
            lda $045c,x        ; $e57e: bd 5c 04  
            beq __e586         ; $e581: f0 03     
            jmp __9b1b         ; $e583: 4c 1b 9b  

;-------------------------------------------------------------------------------
__e586:     jsr __b4fd         ; $e586: 20 fd b4  
            lda #$02           ; $e589: a9 02     
            sta $6f,x          ; $e58b: 95 6f     
            jsr __9b1b         ; $e58d: 20 1b 9b  
            lda $5b,x          ; $e590: b5 5b     
            and #$04           ; $e592: 29 04     
            beq __e5f5         ; $e594: f0 5f     
            jsr __95ce         ; $e596: 20 ce 95  
            lda $10            ; $e599: a5 10     
            and #$ff           ; $e59b: 29 ff     
            bne __e5a5         ; $e59d: d0 06     
            lda #$d8           ; $e59f: a9 d8     
            sta $47,x          ; $e5a1: 95 47     
            bne __e5f5         ; $e5a3: d0 50     
__e5a5:     lda $10            ; $e5a5: a5 10     
            and #$3f           ; $e5a7: 29 3f     
            bne __e5af         ; $e5a9: d0 04     
            lda #$20           ; $e5ab: a9 20     
            sta $86,x          ; $e5ad: 95 86     
__e5af:     ldy $86,x          ; $e5af: b4 86     
            bne __e5ce         ; $e5b1: d0 1b     
            inc $b1,x          ; $e5b3: f6 b1     
            lda $b1,x          ; $e5b5: b5 b1     
            and #$20           ; $e5b7: 29 20     
            beq __e5f4         ; $e5b9: f0 39     
            inc $9f,x          ; $e5bb: f6 9f     
            inc $9f,x          ; $e5bd: f6 9f     
            ldy #$18           ; $e5bf: a0 18     
            lda $b1,x          ; $e5c1: b5 b1     
            and #$40           ; $e5c3: 29 40     
            bne __e5c9         ; $e5c5: d0 02     
            ldy #$e8           ; $e5c7: a0 e8     
__e5c9:     sty $3d,x          ; $e5c9: 94 3d     
            jmp __9e50         ; $e5cb: 4c 50 9e  

;-------------------------------------------------------------------------------
__e5ce:     cpy #$10           ; $e5ce: c0 10     
            bne __e5f4         ; $e5d0: d0 22     
            jsr __92c4         ; $e5d2: 20 c4 92  
            bmi __e5f4         ; $e5d5: 30 1d     
            ldx $00            ; $e5d7: a6 00     
            lda #$37           ; $e5d9: a9 37     
            sta $90,x          ; $e5db: 95 90     
            lda $33,x          ; $e5dd: b5 33     
            adc #$03           ; $e5df: 69 03     
            sta $33,x          ; $e5e1: 95 33     
            lda #$e0           ; $e5e3: a9 e0     
__e5e5:     sta $47,x          ; $e5e5: 95 47     
            jsr __8441         ; $e5e7: 20 41 84  
            lda #$ff           ; $e5ea: a9 ff     
            sta $86,x          ; $e5ec: 95 86     
            lda #$e0           ; $e5ee: a9 e0     
            sta $3d,x          ; $e5f0: 95 3d     
__e5f2:     ldx $12            ; $e5f2: a6 12     
__e5f4:     rts                ; $e5f4: 60        

;-------------------------------------------------------------------------------
__e5f5:     jmp __857f         ; $e5f5: 4c 7f 85  

;-------------------------------------------------------------------------------
            lda $51,x          ; $e5f8: b5 51     
            cmp #$01           ; $e5fa: c9 01     
            bne __e609         ; $e5fc: d0 0b     
            lda $045c,x        ; $e5fe: bd 5c 04  
            beq __e612         ; $e601: f0 0f     
            inc $9f,x          ; $e603: f6 9f     
            lda #$4a           ; $e605: a9 4a     
            sta $65,x          ; $e607: 95 65     
__e609:     lda #$b3           ; $e609: a9 b3     
            sta $046e,x        ; $e60b: 9d 6e 04  
            lda #$2c           ; $e60e: a9 2c     
            bne __e61b         ; $e610: d0 09     
__e612:     ldy $86,x          ; $e612: b4 86     
            dey                ; $e614: 88        
            cpy #$10           ; $e615: c0 10     
            bcs __e621         ; $e617: b0 08     
            lda #$20           ; $e619: a9 20     
__e61b:     jsr __9bb3         ; $e61b: 20 b3 9b  
            jmp __a648         ; $e61e: 4c 48 a6  

;-------------------------------------------------------------------------------
__e621:     jsr __9ba7         ; $e621: 20 a7 9b  
            lda $86,x          ; $e624: b5 86     
            cmp #$10           ; $e626: c9 10     
            bcc __e648         ; $e628: 90 1e     
            lda #$01           ; $e62a: a9 01     
            sta $65,x          ; $e62c: 95 65     
            lda #$10           ; $e62e: a9 10     
            sta $046e,x        ; $e630: 9d 6e 04  
            lda $0429          ; $e633: ad 29 04  
            clc                ; $e636: 18        
            adc #$0b           ; $e637: 69 0b     
            sta $0429          ; $e639: 8d 29 04  
            asl $ee            ; $e63c: 06 ee     
            ldy #$00           ; $e63e: a0 00     
            .hex 8c f4 00      ; $e640: 8c f4 00  Bad Addr Mode - STY $00f4
            lda #$38           ; $e643: a9 38     
            jsr __9bb3         ; $e645: 20 b3 9b  
__e648:     lda #$43           ; $e648: a9 43     
            sta $65,x          ; $e64a: 95 65     
            lda #$33           ; $e64c: a9 33     
            sta $046e,x        ; $e64e: 9d 6e 04  
            rts                ; $e651: 60        

;-------------------------------------------------------------------------------
            .hex fb 05 20      ; $e652: fb 05 20  Invalid Opcode - ISC $2005,y
            bcs __e5f2         ; $e655: b0 9b     
            lda $ee            ; $e657: a5 ee     
            and #$0e           ; $e659: 29 0e     
            ora $ef            ; $e65b: 05 ef     
            ora $b1,x          ; $e65d: 15 b1     
            bne __e67c         ; $e65f: d0 1b     
            lda $33,x          ; $e661: b5 33     
            sec                ; $e663: 38        
            sbc #$02           ; $e664: e9 02     
            sta $00            ; $e666: 85 00     
            ldy $6f,x          ; $e668: b4 6f     
            lda $01            ; $e66a: a5 01     
            clc                ; $e66c: 18        
            adc __a651,y       ; $e66d: 79 51 a6  
            sta $01            ; $e670: 85 01     
            jsr __fafe         ; $e672: 20 fe fa  
            ldx #$3c           ; $e675: a2 3c     
            jsr __9cf2         ; $e677: 20 f2 9c  
            ldx $12            ; $e67a: a6 12     
__e67c:     rts                ; $e67c: 60        

;-------------------------------------------------------------------------------
            lda $b1,x          ; $e67d: b5 b1     
            bne __e6db         ; $e67f: d0 5a     
            lda $a8,x          ; $e681: b5 a8     
            beq __e6bd         ; $e683: f0 38     
            lda #$01           ; $e685: a9 01     
            sta $90,x          ; $e687: 95 90     
            jsr __8441         ; $e689: 20 41 84  
            jsr __92c8         ; $e68c: 20 c8 92  
            bmi __e6bc         ; $e68f: 30 2b     
            ldy $00            ; $e691: a4 00     
            lda #$08           ; $e693: a9 08     
            sta $0090,y        ; $e695: 99 90 00  
            sta $00b1,y        ; $e698: 99 b1 00  
            lda $29,x          ; $e69b: b5 29     
            sta $0029,y        ; $e69d: 99 29 00  
            lda $15,x          ; $e6a0: b5 15     
            sta $0015,y        ; $e6a2: 99 15 00  
__e6a5:     lda $0441,x        ; $e6a5: bd 41 04  
            sta $0441,y        ; $e6a8: 99 41 04  
            lda #$ff           ; $e6ab: a9 ff     
            sta $0441,x        ; $e6ad: 9d 41 04  
            lda $3d,x          ; $e6b0: b5 3d     
            sta $003d,y        ; $e6b2: 99 3d 00  
            tya                ; $e6b5: 98        
            tax                ; $e6b6: aa        
            jsr __8441         ; $e6b7: 20 41 84  
            ldx $12            ; $e6ba: a6 12     
__e6bc:     rts                ; $e6bc: 60        

;-------------------------------------------------------------------------------
__e6bd:     lda $5b,x          ; $e6bd: b5 5b     
            and #$10           ; $e6bf: 29 10     
            beq __e6db         ; $e6c1: f0 18     
            inc $b1,x          ; $e6c3: f6 b1     
            sta $9f,x          ; $e6c5: 95 9f     
            jsr __92c8         ; $e6c7: 20 c8 92  
            bmi __e6db         ; $e6ca: 30 0f     
            ldy $00            ; $e6cc: a4 00     
            lda $3d,x          ; $e6ce: b5 3d     
            sta $003d,y        ; $e6d0: 99 3d 00  
            lda #$20           ; $e6d3: a9 20     
            sta $0453,y        ; $e6d5: 99 53 04  
            jmp __a6e1         ; $e6d8: 4c e1 a6  

;-------------------------------------------------------------------------------
__e6db:     jsr __98cd         ; $e6db: 20 cd 98  
            jsr __997a         ; $e6de: 20 7a 99  
            jsr __b4fd         ; $e6e1: 20 fd b4  
            lda $5b,x          ; $e6e4: b5 5b     
            and $6f,x          ; $e6e6: 35 6f     
            beq __e6ed         ; $e6e8: f0 03     
            jsr __9ea9         ; $e6ea: 20 a9 9e  
__e6ed:     lda $5b,x          ; $e6ed: b5 5b     
            and #$04           ; $e6ef: 29 04     
            beq __e70d         ; $e6f1: f0 1a     
            lda $042f,x        ; $e6f3: bd 2f 04  
            beq __e700         ; $e6f6: f0 08     
            lda #$00           ; $e6f8: a9 00     
            sta $042f,x        ; $e6fa: 9d 2f 04  
            jsr __848f         ; $e6fd: 20 8f 84  
__e700:     lda $9f,x          ; $e700: b5 9f     
            eor #$08           ; $e702: 49 08     
            sta $9f,x          ; $e704: 95 9f     
            jsr __95ce         ; $e706: 20 ce 95  
            lda #$f0           ; $e709: a9 f0     
            sta $47,x          ; $e70b: 95 47     
__e70d:     inc $0477,x        ; $e70d: fe 77 04  
            lda $b1,x          ; $e710: b5 b1     
            bne __e71e         ; $e712: d0 0a     
            lda $0477,x        ; $e714: bd 77 04  
            and #$3f           ; $e717: 29 3f     
            bne __e71e         ; $e719: d0 03     
            jsr __8492         ; $e71b: 20 92 84  
__e71e:     jsr __8577         ; $e71e: 20 77 85  
            jmp __9b1b         ; $e721: 4c 1b 9b  

;-------------------------------------------------------------------------------
            jsr __845d         ; $e724: 20 5d 84  
            lda #$40           ; $e727: a9 40     
            sta $0477,x        ; $e729: 9d 77 04  
            lda #$02           ; $e72c: a9 02     
            sta $0465,x        ; $e72e: 9d 65 04  
            jmp __8f6f         ; $e731: 4c 6f 8f  

;-------------------------------------------------------------------------------
            brk                ; $e734: 00        
            .hex ff fe fd      ; $e735: ff fe fd  Invalid Opcode - ISC __fdfe,x
            .hex fc fb fa      ; $e738: fc fb fa  Invalid Opcode - NOP __fafb,x
            sbc __f9f8,y       ; $e73b: f9 f8 f9  
            .hex fa            ; $e73e: fa        Invalid Opcode - NOP 
            .hex fb fc fd      ; $e73f: fb fc fd  Invalid Opcode - ISC __fdfc,y
            inc $0bff,x        ; $e742: fe ff 0b  
            .hex 0c 0d 0f      ; $e745: 0c 0d 0f  Invalid Opcode - NOP $0f0d
            bpl __e75c         ; $e748: 10 12     
            .hex 14 17         ; $e74a: 14 17     Invalid Opcode - NOP $17,x
            .hex 1a            ; $e74c: 1a        Invalid Opcode - NOP 
            ora $201f,x        ; $e74d: 1d 1f 20  
            .hex e2 e2         ; $e750: e2 e2     Invalid Opcode - NOP #$e2
            .hex e2 e3         ; $e752: e2 e3     Invalid Opcode - NOP #$e3
            cpx $e5            ; $e754: e4 e5     
            .hex e7 e9         ; $e756: e7 e9     Invalid Opcode - ISC $e9
            sbc __f8f1         ; $e758: ed f1 f8  
            brk                ; $e75b: 00        
__e75c:     rts                ; $e75c: 60        

;-------------------------------------------------------------------------------
            jsr __997a         ; $e75d: 20 7a 99  
            ldy #$00           ; $e760: a0 00     
            lda $0477,x        ; $e762: bd 77 04  
            asl                ; $e765: 0a        
            bcc __e76f         ; $e766: 90 07     
            ldy #$02           ; $e768: a0 02     
            asl                ; $e76a: 0a        
            bcc __e76f         ; $e76b: 90 02     
            ldy #$fe           ; $e76d: a0 fe     
__e76f:     sty $3d,x          ; $e76f: 94 3d     
            jsr __9e50         ; $e771: 20 50 9e  
            inc $0477,x        ; $e774: fe 77 04  
            lda $b1,x          ; $e777: b5 b1     
            clc                ; $e779: 18        
            adc #$d0           ; $e77a: 69 d0     
            sta $b1,x          ; $e77c: 95 b1     
            bcc __e783         ; $e77e: 90 03     
            inc $0480,x        ; $e780: fe 80 04  
__e783:     lda $ef            ; $e783: a5 ef     
            bne __e75c         ; $e785: d0 d5     
            lda #$49           ; $e787: a9 49     
            sta $65,x          ; $e789: 95 65     
            ldy #$48           ; $e78b: a0 48     
            lda $51,x          ; $e78d: b5 51     
            sec                ; $e78f: 38        
            sbc #$01           ; $e790: e9 01     
            ora $045c,x        ; $e792: 1d 5c 04  
            sta $07            ; $e795: 85 07     
            beq __e79b         ; $e797: f0 02     
            ldy #$4c           ; $e799: a0 4c     
__e79b:     tya                ; $e79b: 98        
            ldy #$30           ; $e79c: a0 30     
            .hex 8c f4 00      ; $e79e: 8c f4 00  Bad Addr Mode - STY $00f4
            jsr __9bb3         ; $e7a1: 20 b3 9b  
            lda #$09           ; $e7a4: a9 09     
            sta $65,x          ; $e7a6: 95 65     
            lda #$33           ; $e7a8: a9 33     
            sta $046e,x        ; $e7aa: 9d 6e 04  
            lda $29,x          ; $e7ad: b5 29     
            pha                ; $e7af: 48        
            sec                ; $e7b0: 38        
            sbc #$08           ; $e7b1: e9 08     
            sta $29,x          ; $e7b3: 95 29     
            jsr __8894         ; $e7b5: 20 94 88  
            ldx #$50           ; $e7b8: a2 50     
            lda $10            ; $e7ba: a5 10     
            and #$20           ; $e7bc: 29 20     
            bne __e7c8         ; $e7be: d0 08     
            lda #$04           ; $e7c0: a9 04     
            and $10            ; $e7c2: 25 10     
            beq __e7c8         ; $e7c4: f0 02     
            ldx #$53           ; $e7c6: a2 53     
__e7c8:     lda $01            ; $e7c8: a5 01     
            sec                ; $e7ca: 38        
            sbc #$08           ; $e7cb: e9 08     
            sta $01            ; $e7cd: 85 01     
            lda #$20           ; $e7cf: a9 20     
            sta $0c            ; $e7d1: 85 0c     
            ldy #$e0           ; $e7d3: a0 e0     
            jsr __9cf2         ; $e7d5: 20 f2 9c  
            ldx $12            ; $e7d8: a6 12     
            lda $29,x          ; $e7da: b5 29     
            sec                ; $e7dc: 38        
            sbc #$08           ; $e7dd: e9 08     
            sta $29,x          ; $e7df: 95 29     
            jsr __8894         ; $e7e1: 20 94 88  
            pla                ; $e7e4: 68        
            sta $29,x          ; $e7e5: 95 29     
            lda #$13           ; $e7e7: a9 13     
            sta $046e,x        ; $e7e9: 9d 6e 04  
            lda $33,x          ; $e7ec: b5 33     
            sta $00            ; $e7ee: 85 00     
            lda $0477,x        ; $e7f0: bd 77 04  
            and #$78           ; $e7f3: 29 78     
            lsr                ; $e7f5: 4a        
            lsr                ; $e7f6: 4a        
            lsr                ; $e7f7: 4a        
            tay                ; $e7f8: a8        
            lda __a734,y       ; $e7f9: b9 34 a7  
            adc $0429          ; $e7fc: 6d 29 04  
            adc #$f0           ; $e7ff: 69 f0     
            sta $01            ; $e801: 85 01     
            ldx #$56           ; $e803: a2 56     
            lda $07            ; $e805: a5 07     
            bne __e815         ; $e807: d0 0c     
            ldx #$58           ; $e809: a2 58     
            dey                ; $e80b: 88        
            dey                ; $e80c: 88        
            dey                ; $e80d: 88        
            dey                ; $e80e: 88        
            cpy #$07           ; $e80f: c0 07     
            bcs __e815         ; $e811: b0 02     
            ldx #$5a           ; $e813: a2 5a     
__e815:     ldy #$00           ; $e815: a0 00     
            jsr __9cf2         ; $e817: 20 f2 9c  
            ldx $12            ; $e81a: a6 12     
            lda $33,x          ; $e81c: b5 33     
            clc                ; $e81e: 18        
            adc #$10           ; $e81f: 69 10     
            sta $00            ; $e821: 85 00     
            lda $0480,x        ; $e823: bd 80 04  
            and #$78           ; $e826: 29 78     
            lsr                ; $e828: 4a        
            lsr                ; $e829: 4a        
            lsr                ; $e82a: 4a        
            tay                ; $e82b: a8        
            lda __a734,y       ; $e82c: b9 34 a7  
            adc $0429          ; $e82f: 6d 29 04  
            adc #$f0           ; $e832: 69 f0     
            sta $01            ; $e834: 85 01     
            lda #$00           ; $e836: a9 00     
            sta $0c            ; $e838: 85 0c     
            ldx #$56           ; $e83a: a2 56     
            lda $07            ; $e83c: a5 07     
            bne __e84c         ; $e83e: d0 0c     
            ldx #$58           ; $e840: a2 58     
            dey                ; $e842: 88        
            dey                ; $e843: 88        
            dey                ; $e844: 88        
            dey                ; $e845: 88        
            cpy #$07           ; $e846: c0 07     
            bcs __e84c         ; $e848: b0 02     
            ldx #$5a           ; $e84a: a2 5a     
__e84c:     ldy #$08           ; $e84c: a0 08     
            jsr __9cf2         ; $e84e: 20 f2 9c  
            ldx $12            ; $e851: a6 12     
            lda #$13           ; $e853: a9 13     
            sta $046e,x        ; $e855: 9d 6e 04  
            lda $ee            ; $e858: a5 ee     
            bne __e88b         ; $e85a: d0 2f     
            lda $33,x          ; $e85c: b5 33     
            clc                ; $e85e: 18        
            adc #$10           ; $e85f: 69 10     
            sta $0258          ; $e861: 8d 58 02  
            lda #$0d           ; $e864: a9 0d     
            sta $0259          ; $e866: 8d 59 02  
            sta $025d          ; $e869: 8d 5d 02  
            lda $0232          ; $e86c: ad 32 02  
            sta $025a          ; $e86f: 8d 5a 02  
            sta $025e          ; $e872: 8d 5e 02  
            lda $01            ; $e875: a5 01     
            clc                ; $e877: 18        
            adc #$10           ; $e878: 69 10     
            sta $025b          ; $e87a: 8d 5b 02  
            lda $33,x          ; $e87d: b5 33     
            sta $025c          ; $e87f: 8d 5c 02  
            lda $0429          ; $e882: ad 29 04  
            sec                ; $e885: 38        
            sbc #$08           ; $e886: e9 08     
            sta $025f          ; $e888: 8d 5f 02  
__e88b:     lda #$00           ; $e88b: a9 00     
            sta $05            ; $e88d: 85 05     
            lda $0477,x        ; $e88f: bd 77 04  
            jsr __a89a         ; $e892: 20 9a a8  
            inc $05            ; $e895: e6 05     
            lda $0480,x        ; $e897: bd 80 04  
            and #$67           ; $e89a: 29 67     
            cmp #$40           ; $e89c: c9 40     
            bne __e8f1         ; $e89e: d0 51     
            lda $045c,x        ; $e8a0: bd 5c 04  
            bne __e8f1         ; $e8a3: d0 4c     
            jsr __92c8         ; $e8a5: 20 c8 92  
            bmi __e8f1         ; $e8a8: 30 47     
            lda #$01           ; $e8aa: a9 01     
            sta $0602          ; $e8ac: 8d 02 06  
            ldy $00            ; $e8af: a4 00     
            lda #$20           ; $e8b1: a9 20     
            sta $0090,y        ; $e8b3: 99 90 00  
            sta $0079,y        ; $e8b6: 99 79 00  
            sta $00b1,y        ; $e8b9: 99 b1 00  
            lda $29,x          ; $e8bc: b5 29     
            sbc #$18           ; $e8be: e9 18     
            sta $0029,y        ; $e8c0: 99 29 00  
            lda $05            ; $e8c3: a5 05     
            beq __e8cf         ; $e8c5: f0 08     
            lda $33,x          ; $e8c7: b5 33     
            clc                ; $e8c9: 18        
            adc #$10           ; $e8ca: 69 10     
            sta $0033,y        ; $e8cc: 99 33 00  
__e8cf:     lda $28            ; $e8cf: a5 28     
            lsr                ; $e8d1: 4a        
            lsr                ; $e8d2: 4a        
            lsr                ; $e8d3: 4a        
            lsr                ; $e8d4: 4a        
            and #$0f           ; $e8d5: 29 0f     
            cmp #$0b           ; $e8d7: c9 0b     
            bcc __e8dd         ; $e8d9: 90 02     
            lda #$0b           ; $e8db: a9 0b     
__e8dd:     tax                ; $e8dd: aa        
            lda __a744,x       ; $e8de: bd 44 a7  
            sta $0047,y        ; $e8e1: 99 47 00  
            lda __a750,x       ; $e8e4: bd 50 a7  
            .hex 99            ; $e8e7: 99        Suspected data
__e8e8:     and __9800,x       ; $e8e8: 3d 00 98  
            tax                ; $e8eb: aa        
            .hex 20            ; $e8ec: 20        Suspected data
__e8ed:     .hex 41            ; $e8ed: 41        Suspected data
__e8ee:     sty $a6            ; $e8ee: 84 a6     
            .hex 12            ; $e8f0: 12        Invalid Opcode - KIL 
__e8f1:     rts                ; $e8f1: 60        

;-------------------------------------------------------------------------------
            jsr __845d         ; $e8f2: 20 5d 84  
            lda $33,x          ; $e8f5: b5 33     
            sec                ; $e8f7: 38        
            sbc #$08           ; $e8f8: e9 08     
            sta $79,x          ; $e8fa: 95 79     
            rts                ; $e8fc: 60        

;-------------------------------------------------------------------------------
            jsr __997a         ; $e8fd: 20 7a 99  
            jsr __98d6         ; $e900: 20 d6 98  
            jsr __98cd         ; $e903: 20 cd 98  
            jsr __b4fd         ; $e906: 20 fd b4  
            lda $0480,x        ; $e909: bd 80 04  
            bne __e93e         ; $e90c: d0 30     
            sta $3d,x          ; $e90e: 95 3d     
            jsr __9e3b         ; $e910: 20 3b 9e  
            lda $0f            ; $e913: a5 0f     
            adc #$40           ; $e915: 69 40     
            cmp #$80           ; $e917: c9 80     
            bcs __e924         ; $e919: b0 09     
            inc $0480,x        ; $e91b: fe 80 04  
            lda #$c0           ; $e91e: a9 c0     
            sta $47,x          ; $e920: 95 47     
            bne __e93e         ; $e922: d0 1a     
__e924:     inc $0477,x        ; $e924: fe 77 04  
            ldy #$fc           ; $e927: a0 fc     
            lda $0477,x        ; $e929: bd 77 04  
            and #$20           ; $e92c: 29 20     
            beq __e932         ; $e92e: f0 02     
            ldy #$04           ; $e930: a0 04     
__e932:     sty $47,x          ; $e932: 94 47     
            jsr __9e4b         ; $e934: 20 4b 9e  
            lda #$61           ; $e937: a9 61     
            sta $65,x          ; $e939: 95 65     
            jmp __9b1b         ; $e93b: 4c 1b 9b  

;-------------------------------------------------------------------------------
__e93e:     lda $47,x          ; $e93e: b5 47     
            bmi __e951         ; $e940: 30 0f     
            lda $79,x          ; $e942: b5 79     
            sec                ; $e944: 38        
            sbc #$18           ; $e945: e9 18     
            cmp $33,x          ; $e947: d5 33     
            bcs __e951         ; $e949: b0 06     
            sta $33,x          ; $e94b: 95 33     
            lda #$00           ; $e94d: a9 00     
            sta $47,x          ; $e94f: 95 47     
__e951:     jsr __8577         ; $e951: 20 77 85  
            inc $9f,x          ; $e954: f6 9f     
            lda $9f,x          ; $e956: b5 9f     
            pha                ; $e958: 48        
            and #$3f           ; $e959: 29 3f     
            bne __e960         ; $e95b: d0 03     
            jsr __8492         ; $e95d: 20 92 84  
__e960:     pla                ; $e960: 68        
            bne __e968         ; $e961: d0 05     
            lda #$18           ; $e963: a9 18     
            sta $0453,x        ; $e965: 9d 53 04  
__e968:     lda $5b,x          ; $e968: b5 5b     
            and #$03           ; $e96a: 29 03     
            beq __e971         ; $e96c: f0 03     
            jsr __9ea9         ; $e96e: 20 a9 9e  
__e971:     lda #$41           ; $e971: a9 41     
            ldy $47,x          ; $e973: b4 47     
            bpl __e979         ; $e975: 10 02     
            lda #$61           ; $e977: a9 61     
__e979:     jmp __a9fe         ; $e979: 4c fe a9  

;-------------------------------------------------------------------------------
            jsr __997a         ; $e97c: 20 7a 99  
            jsr __98d6         ; $e97f: 20 d6 98  
            jsr __98cd         ; $e982: 20 cd 98  
            jsr __b4fd         ; $e985: 20 fd b4  
            lda $5b,x          ; $e988: b5 5b     
            and #$08           ; $e98a: 29 08     
            beq __e993         ; $e98c: f0 05     
            lda $79,x          ; $e98e: b5 79     
            sta $33,x          ; $e990: 95 33     
            rts                ; $e992: 60        

;-------------------------------------------------------------------------------
__e993:     jsr __9e3b         ; $e993: 20 3b 9e  
            iny                ; $e996: c8        
            sty $6f,x          ; $e997: 94 6f     
            lda $b1,x          ; $e999: b5 b1     
            bne __e9bc         ; $e99b: d0 1f     
            lda $86,x          ; $e99d: b5 86     
            bne __e9aa         ; $e99f: d0 09     
            lda #$d0           ; $e9a1: a9 d0     
            sta $47,x          ; $e9a3: 95 47     
            inc $b1,x          ; $e9a5: f6 b1     
            jmp __a9f9         ; $e9a7: 4c f9 a9  

;-------------------------------------------------------------------------------
__e9aa:     ldy #$fc           ; $e9aa: a0 fc     
            lda $10            ; $e9ac: a5 10     
            and #$20           ; $e9ae: 29 20     
            beq __e9b4         ; $e9b0: f0 02     
            ldy #$04           ; $e9b2: a0 04     
__e9b4:     sty $47,x          ; $e9b4: 94 47     
            jsr __9e4b         ; $e9b6: 20 4b 9e  
            jmp __a9fc         ; $e9b9: 4c fc a9  

;-------------------------------------------------------------------------------
__e9bc:     inc $9f,x          ; $e9bc: f6 9f     
            lda $47,x          ; $e9be: b5 47     
            bmi __e9f9         ; $e9c0: 30 37     
            bne __e9c9         ; $e9c2: d0 05     
            lda #$10           ; $e9c4: a9 10     
            sta $0453,x        ; $e9c6: 9d 53 04  
__e9c9:     lda $47,x          ; $e9c9: b5 47     
            bmi __e9e9         ; $e9cb: 30 1c     
            lda $5b,x          ; $e9cd: b5 5b     
            and #$04           ; $e9cf: 29 04     
            beq __e9e9         ; $e9d1: f0 16     
            lda $0e            ; $e9d3: a5 0e     
            sec                ; $e9d5: 38        
            sbc #$6f           ; $e9d6: e9 6f     
            cmp #$06           ; $e9d8: c9 06     
            bcc __e9e9         ; $e9da: 90 0d     
            lda #$02           ; $e9dc: a9 02     
            sta $51,x          ; $e9de: 95 51     
            lda #$e0           ; $e9e0: a9 e0     
            sta $47,x          ; $e9e2: 95 47     
            lda #$40           ; $e9e4: a9 40     
            sta $0601          ; $e9e6: 8d 01 06  
__e9e9:     lda $79,x          ; $e9e9: b5 79     
__e9eb:     .hex d5            ; $e9eb: d5        Suspected data
__e9ec:     .hex 33 b0         ; $e9ec: 33 b0     Invalid Opcode - RLA ($b0),y
            asl                ; $e9ee: 0a        
            sta $33,x          ; $e9ef: 95 33     
            lda #$00           ; $e9f1: a9 00     
            sta $b1,x          ; $e9f3: 95 b1     
            lda #$a0           ; $e9f5: a9 a0     
            sta $86,x          ; $e9f7: 95 86     
__e9f9:     jsr __857f         ; $e9f9: 20 7f 85  
            lda #$61           ; $e9fc: a9 61     
            sta $65,x          ; $e9fe: 95 65     
            lda $0453,x        ; $ea00: bd 53 04  
            beq __ea11         ; $ea03: f0 0c     
            cmp #$05           ; $ea05: c9 05     
            bne __ea0c         ; $ea07: d0 03     
            jsr __95eb         ; $ea09: 20 eb 95  
__ea0c:     lda #$64           ; $ea0c: a9 64     
            jmp __9bb3         ; $ea0e: 4c b3 9b  

;-------------------------------------------------------------------------------
__ea11:     jmp __9b1b         ; $ea11: 4c 1b 9b  

;-------------------------------------------------------------------------------
            jsr __845d         ; $ea14: 20 5d 84  
            lda #$03           ; $ea17: a9 03     
            sta $79,x          ; $ea19: 95 79     
            rts                ; $ea1b: 60        

;-------------------------------------------------------------------------------
            .hex 02            ; $ea1c: 02        Invalid Opcode - KIL 
            .hex 04 0d         ; $ea1d: 04 0d     Invalid Opcode - NOP $0d
            asl $79b5          ; $ea1f: 0e b5 79  
            bne __ea2d         ; $ea22: d0 09     
            jsr __997a         ; $ea24: 20 7a 99  
            jsr __98cd         ; $ea27: 20 cd 98  
            jsr __98d6         ; $ea2a: 20 d6 98  
__ea2d:     lda $5b,x          ; $ea2d: b5 5b     
            and #$10           ; $ea2f: 29 10     
            beq __ea3a         ; $ea31: f0 07     
            jsr __aa3e         ; $ea33: 20 3e aa  
            inc $042f,x        ; $ea36: fe 2f 04  
            rts                ; $ea39: 60        

;-------------------------------------------------------------------------------
__ea3a:     lda $a8,x          ; $ea3a: b5 a8     
            beq __ea99         ; $ea3c: f0 5b     
            lda $79,x          ; $ea3e: b5 79     
            beq __ea99         ; $ea40: f0 57     
            sta $0477,x        ; $ea42: 9d 77 04  
            lda #$00           ; $ea45: a9 00     
            sta $79,x          ; $ea47: 95 79     
            lda #$02           ; $ea49: a9 02     
            sta $0489,x        ; $ea4b: 9d 89 04  
            lda $0441,x        ; $ea4e: bd 41 04  
            sta $06            ; $ea51: 85 06     
            lda #$ff           ; $ea53: a9 ff     
            sta $0441,x        ; $ea55: 9d 41 04  
            jsr __92c8         ; $ea58: 20 c8 92  
            bmi __ea99         ; $ea5b: 30 3c     
            ldy $00            ; $ea5d: a4 00     
            lda #$1a           ; $ea5f: a9 1a     
            sta $0090,y        ; $ea61: 99 90 00  
            jsr __a8ea         ; $ea64: 20 ea a8  
            ldy $00            ; $ea67: a4 00     
            lda $06            ; $ea69: a5 06     
            sta $0441,y        ; $ea6b: 99 41 04  
            lda $0477,x        ; $ea6e: bd 77 04  
            sec                ; $ea71: 38        
            sbc #$01           ; $ea72: e9 01     
            sta $0079,y        ; $ea74: 99 79 00  
            tay                ; $ea77: a8        
            lda __aa1c,y       ; $ea78: b9 1c aa  
            ldy $00            ; $ea7b: a4 00     
            sta $0489,y        ; $ea7d: 99 89 04  
            lda $29,x          ; $ea80: b5 29     
            sta $0029,y        ; $ea82: 99 29 00  
            lda $15,x          ; $ea85: b5 15     
            sta $0015,y        ; $ea87: 99 15 00  
            lda $33,x          ; $ea8a: b5 33     
            clc                ; $ea8c: 18        
            adc #$10           ; $ea8d: 69 10     
            sta $0033,y        ; $ea8f: 99 33 00  
            lda $1f,x          ; $ea92: b5 1f     
            adc #$00           ; $ea94: 69 00     
            sta $001f,y        ; $ea96: 99 1f 00  
__ea99:     inc $9f,x          ; $ea99: f6 9f     
            lda $9f,x          ; $ea9b: b5 9f     
            and #$3f           ; $ea9d: 29 3f     
            bne __eaa4         ; $ea9f: d0 03     
            jsr __8492         ; $eaa1: 20 92 84  
__eaa4:     jsr __9e50         ; $eaa4: 20 50 9e  
            jmp __9b1b         ; $eaa7: 4c 1b 9b  

;-------------------------------------------------------------------------------
            brk                ; $eaaa: 00        
            ora ($00,x)        ; $eaab: 01 00     
            .hex ff 00 01      ; $eaad: ff 00 01  Invalid Opcode - ISC $0100,x
            brk                ; $eab0: 00        
            ldy #$00           ; $eab1: a0 00     
            lda $ee            ; $eab3: a5 ee     
            bne __eabf         ; $eab5: d0 08     
            lda $10            ; $eab7: a5 10     
            and #$18           ; $eab9: 29 18     
            lsr                ; $eabb: 4a        
            lsr                ; $eabc: 4a        
            lsr                ; $eabd: 4a        
            tay                ; $eabe: a8        
__eabf:     sty $07            ; $eabf: 84 07     
            lda $0429          ; $eac1: ad 29 04  
            sta $04fd          ; $eac4: 8d fd 04  
            clc                ; $eac7: 18        
            adc __aaaa,y       ; $eac8: 79 aa aa  
            sta $0429          ; $eacb: 8d 29 04  
            jsr __9ba7         ; $eace: 20 a7 9b  
            lda $79,x          ; $ead1: b5 79     
            sta $09            ; $ead3: 85 09     
            beq __eb16         ; $ead5: f0 3f     
            tya                ; $ead7: 98        
            clc                ; $ead8: 18        
            adc #$10           ; $ead9: 69 10     
            tay                ; $eadb: a8        
            ldx $07            ; $eadc: a6 07     
            lda $04fd          ; $eade: ad fd 04  
            adc __aaab,x       ; $eae1: 7d ab aa  
            sta $01            ; $eae4: 85 01     
            ldx #$70           ; $eae6: a2 70     
            jsr __9cf2         ; $eae8: 20 f2 9c  
            dec $09            ; $eaeb: c6 09     
            beq __eb16         ; $eaed: f0 27     
            jsr __fafe         ; $eaef: 20 fe fa  
            ldx $07            ; $eaf2: a6 07     
            lda $04fd          ; $eaf4: ad fd 04  
            clc                ; $eaf7: 18        
            adc __aaac,x       ; $eaf8: 7d ac aa  
            sta $01            ; $eafb: 85 01     
            ldx #$70           ; $eafd: a2 70     
            jsr __9cf2         ; $eaff: 20 f2 9c  
            dec $09            ; $eb02: c6 09     
            beq __eb16         ; $eb04: f0 10     
            ldx $07            ; $eb06: a6 07     
            lda $04fd          ; $eb08: ad fd 04  
            clc                ; $eb0b: 18        
            adc __aaad,x       ; $eb0c: 7d ad aa  
            sta $01            ; $eb0f: 85 01     
            ldx #$70           ; $eb11: a2 70     
            jsr __9cf2         ; $eb13: 20 f2 9c  
__eb16:     ldx $12            ; $eb16: a6 12     
            rts                ; $eb18: 60        

;-------------------------------------------------------------------------------
            lda $b1,x          ; $eb19: b5 b1     
            bne __eb20         ; $eb1b: d0 03     
            jmp __abd7         ; $eb1d: 4c d7 ab  

;-------------------------------------------------------------------------------
__eb20:     ldy #$03           ; $eb20: a0 03     
            lda $47,x          ; $eb22: b5 47     
            beq __eb2a         ; $eb24: f0 04     
            cmp #$fd           ; $eb26: c9 fd     
            bcc __eb3b         ; $eb28: 90 11     
__eb2a:     ldy #$3f           ; $eb2a: a0 3f     
            inc $0429          ; $eb2c: ee 29 04  
            lda $10            ; $eb2f: a5 10     
            and #$02           ; $eb31: 29 02     
            bne __eb3b         ; $eb33: d0 06     
            dec $0429          ; $eb35: ce 29 04  
            dec $0429          ; $eb38: ce 29 04  
__eb3b:     tya                ; $eb3b: 98        
            and $10            ; $eb3c: 25 10     
            bne __eb42         ; $eb3e: d0 02     
            dec $47,x          ; $eb40: d6 47     
__eb42:     jsr __9e4b         ; $eb42: 20 4b 9e  
            lda $0477,x        ; $eb45: bd 77 04  
            bne __eb64         ; $eb48: d0 1a     
            ldy $1f,x          ; $eb4a: b4 1f     
            bpl __eb88         ; $eb4c: 10 3a     
            jsr __f6da         ; $eb4e: 20 da f6  
            lda #$38           ; $eb51: a9 38     
            sta $04af          ; $eb53: 8d af 04  
            inc $0627          ; $eb56: ee 27 06  
            lda #$05           ; $eb59: a9 05     
            sta $0534          ; $eb5b: 8d 34 05  
            lda #$00           ; $eb5e: a9 00     
            .hex 8d 50 00      ; $eb60: 8d 50 00  Bad Addr Mode - STA $0050
            rts                ; $eb63: 60        

;-------------------------------------------------------------------------------
__eb64:     lda $33,x          ; $eb64: b5 33     
            cmp #$30           ; $eb66: c9 30     
            bcs __eb88         ; $eb68: b0 1e     
            ldy $04c7          ; $eb6a: ac c7 04  
            bne __eb76         ; $eb6d: d0 07     
            cmp #$18           ; $eb6f: c9 18     
            bcs __eb88         ; $eb71: b0 15     
            jmp __910d         ; $eb73: 4c 0d 91  

;-------------------------------------------------------------------------------
__eb76:     lda #$00           ; $eb76: a9 00     
            sta $04c7          ; $eb78: 8d c7 04  
            sta $9c            ; $eb7b: 85 9c     
            sta $3c            ; $eb7d: 85 3c     
            lda $33,x          ; $eb7f: b5 33     
            adc #$20           ; $eb81: 69 20     
            sta $32            ; $eb83: 85 32     
            sta $042b          ; $eb85: 8d 2b 04  
__eb88:     jsr __abee         ; $eb88: 20 ee ab  
            lda $0429          ; $eb8b: ad 29 04  
            sec                ; $eb8e: 38        
            sbc #$04           ; $eb8f: e9 04     
            sta $0293          ; $eb91: 8d 93 02  
            adc #$07           ; $eb94: 69 07     
            sta $0297          ; $eb96: 8d 97 02  
            adc #$08           ; $eb99: 69 08     
            sta $029b          ; $eb9b: 8d 9b 02  
            lda #$20           ; $eb9e: a9 20     
            ldy $47,x          ; $eba0: b4 47     
            cpy #$fd           ; $eba2: c0 fd     
            bmi __eba8         ; $eba4: 30 02     
            lda #$15           ; $eba6: a9 15     
__eba8:     adc $042c          ; $eba8: 6d 2c 04  
            sta $0290          ; $ebab: 8d 90 02  
            sta $0294          ; $ebae: 8d 94 02  
            sta $0298          ; $ebb1: 8d 98 02  
            lda #$8c           ; $ebb4: a9 8c     
            sta $0291          ; $ebb6: 8d 91 02  
            sta $0295          ; $ebb9: 8d 95 02  
            sta $0299          ; $ebbc: 8d 99 02  
            lda $10            ; $ebbf: a5 10     
            lsr                ; $ebc1: 4a        
            and #$03           ; $ebc2: 29 03     
            sta $00            ; $ebc4: 85 00     
            lsr                ; $ebc6: 4a        
            ror                ; $ebc7: 6a        
            ror                ; $ebc8: 6a        
            and #$c0           ; $ebc9: 29 c0     
            ora $00            ; $ebcb: 05 00     
            sta $0292          ; $ebcd: 8d 92 02  
            .hex 8d 96         ; $ebd0: 8d 96     Suspected data
__ebd2:     .hex 02            ; $ebd2: 02        Invalid Opcode - KIL 
            sta $029a          ; $ebd3: 8d 9a 02  
            rts                ; $ebd6: 60        

;-------------------------------------------------------------------------------
            lda $a8,x          ; $ebd7: b5 a8     
            cmp #$01           ; $ebd9: c9 01     
            bne __ebeb         ; $ebdb: d0 0e     
            sta $b1,x          ; $ebdd: 95 b1     
            sta $04c7          ; $ebdf: 8d c7 04  
            lda #$02           ; $ebe2: a9 02     
            sta $0605          ; $ebe4: 8d 05 06  
            lda #$fe           ; $ebe7: a9 fe     
            sta $47,x          ; $ebe9: 95 47     
__ebeb:     jsr __960f         ; $ebeb: 20 0f 96  
            lda $042c          ; $ebee: ad 2c 04  
            sta $00            ; $ebf1: 85 00     
            lda $0429          ; $ebf3: ad 29 04  
            sec                ; $ebf6: 38        
            sbc #$08           ; $ebf7: e9 08     
            sta $01            ; $ebf9: 85 01     
            lda #$02           ; $ebfb: a9 02     
            sta $02            ; $ebfd: 85 02     
            sta $05            ; $ebff: 85 05     
            sta $0c            ; $ec01: 85 0c     
            lda $65,x          ; $ec03: b5 65     
            and #$23           ; $ec05: 29 23     
            sta $03            ; $ec07: 85 03     
            ldy #$00           ; $ec09: a0 00     
            ldx #$96           ; $ec0b: a2 96     
            jsr __9c53         ; $ec0d: 20 53 9c  
            lda $01            ; $ec10: a5 01     
            clc                ; $ec12: 18        
            adc #$10           ; $ec13: 69 10     
            sta $01            ; $ec15: 85 01     
            dec $02            ; $ec17: c6 02     
            lda $042c          ; $ec19: ad 2c 04  
            sta $00            ; $ec1c: 85 00     
            ldy #$10           ; $ec1e: a0 10     
            ldx #$96           ; $ec20: a2 96     
            jmp __9c53         ; $ec22: 4c 53 9c  

;-------------------------------------------------------------------------------
            beq __ec27         ; $ec25: f0 00     
__ec27:     beq __ebd2         ; $ec27: f0 a9     
            brk                ; $ec29: 00        
            sta $ee            ; $ec2a: 85 ee     
            lda $9f,x          ; $ec2c: b5 9f     
            and #$08           ; $ec2e: 29 08     
            lsr                ; $ec30: 4a        
            lsr                ; $ec31: 4a        
            lsr                ; $ec32: 4a        
            sta $07            ; $ec33: 85 07     
            ldy $07            ; $ec35: a4 07     
            lda $0429          ; $ec37: ad 29 04  
            pha                ; $ec3a: 48        
            clc                ; $ec3b: 18        
            adc __ac25,y       ; $ec3c: 79 25 ac  
            sta $0429          ; $ec3f: 8d 29 04  
            lda #$80           ; $ec42: a9 80     
            ldy $045c,x        ; $ec44: bc 5c 04  
            beq __ec4b         ; $ec47: f0 02     
            lda #$88           ; $ec49: a9 88     
__ec4b:     jsr __9bb3         ; $ec4b: 20 b3 9b  
            jsr __fafe         ; $ec4e: 20 fe fa  
            .hex 8c f4 00      ; $ec51: 8c f4 00  Bad Addr Mode - STY $00f4
            pla                ; $ec54: 68        
            clc                ; $ec55: 18        
            ldy $07            ; $ec56: a4 07     
            adc __ac26,y       ; $ec58: 79 26 ac  
            sta $0429          ; $ec5b: 8d 29 04  
            lda #$84           ; $ec5e: a9 84     
            ldy $045c,x        ; $ec60: bc 5c 04  
            beq __ec67         ; $ec63: f0 02     
            lda #$8c           ; $ec65: a9 8c     
__ec67:     jmp __9bb3         ; $ec67: 4c b3 9b  

;-------------------------------------------------------------------------------
            jsr __845d         ; $ec6a: 20 5d 84  
            lda #$04           ; $ec6d: a9 04     
            sta $0465,x        ; $ec6f: 9d 65 04  
            lda #$00           ; $ec72: a9 00     
            sta $79,x          ; $ec74: 95 79     
            rts                ; $ec76: 60        

;-------------------------------------------------------------------------------
            cpx #$20           ; $ec77: e0 20     
            beq __ec8b         ; $ec79: f0 10     
            .hex 04 0c         ; $ec7b: 04 0c     Invalid Opcode - NOP $0c
            .hex 04 0c         ; $ec7d: 04 0c     Invalid Opcode - NOP $0c
            .hex 04 04         ; $ec7f: 04 04     Invalid Opcode - NOP $04
            .hex 0c 0c 01      ; $ec81: 0c 0c 01  Invalid Opcode - NOP $010c
            .hex ff 2a d6      ; $ec84: ff 2a d6  Invalid Opcode - ISC __d62a,x
            ora ($ff,x)        ; $ec87: 01 ff     
            clc                ; $ec89: 18        
__ec8a:     inx                ; $ec8a: e8        
__ec8b:     lda #$02           ; $ec8b: a9 02     
            sta $6f,x          ; $ec8d: 95 6f     
            inc $9f,x          ; $ec8f: f6 9f     
            ldy $0465,x        ; $ec91: bc 65 04  
            dey                ; $ec94: 88        
            bne __ece7         ; $ec95: d0 50     
            lda #$03           ; $ec97: a9 03     
            sta $09            ; $ec99: 85 09     
            sta $04f8          ; $ec9b: 8d f8 04  
            .hex 20 a9         ; $ec9e: 20 a9     Suspected data
__eca0:     .hex 89            ; $eca0: 89        Suspected data
__eca1:     jsr __92c8         ; $eca1: 20 c8 92  
            bmi __ece3         ; $eca4: 30 3d     
            ldy $00            ; $eca6: a4 00     
            lda $1f,x          ; $eca8: b5 1f     
            sta $04ef,y        ; $ecaa: 99 ef 04  
            lda #$f0           ; $ecad: a9 f0     
            sta $0047,y        ; $ecaf: 99 47 00  
            lda #$2b           ; $ecb2: a9 2b     
            sta $0090,y        ; $ecb4: 99 90 00  
            lda #$30           ; $ecb7: a9 30     
            sta $0453,y        ; $ecb9: 99 53 04  
            lda $33,x          ; $ecbc: b5 33     
            pha                ; $ecbe: 48        
            ldx $09            ; $ecbf: a6 09     
            lda __ac77,x       ; $ecc1: bd 77 ac  
            sta $003d,y        ; $ecc4: 99 3d 00  
            lda $0429          ; $ecc7: ad 29 04  
            adc __ac7b,x       ; $ecca: 7d 7b ac  
            sta $0029,y        ; $eccd: 99 29 00  
            pla                ; $ecd0: 68        
            adc __ac7f,x       ; $ecd1: 7d 7f ac  
            sta $0033,y        ; $ecd4: 99 33 00  
            lda #$00           ; $ecd7: a9 00     
            sta $0015,y        ; $ecd9: 99 15 00  
            tya                ; $ecdc: 98        
            tax                ; $ecdd: aa        
            jsr __8441         ; $ecde: 20 41 84  
            ldx $12            ; $ece1: a6 12     
__ece3:     dec $09            ; $ece3: c6 09     
            bpl __eca1         ; $ece5: 10 ba     
__ece7:     lda $10            ; $ece7: a5 10     
            and #$1f           ; $ece9: 29 1f     
            bne __ed07         ; $eceb: d0 1a     
            .hex 20            ; $eced: 20        Suspected data
__ecee:     iny                ; $ecee: c8        
            .hex 92            ; $ecef: 92        Invalid Opcode - KIL 
            ldx $00            ; $ecf0: a6 00     
            lda #$20           ; $ecf2: a9 20     
            sta $90,x          ; $ecf4: 95 90     
            lda $29,x          ; $ecf6: b5 29     
            sbc #$08           ; $ecf8: e9 08     
            .hex 95            ; $ecfa: 95        Suspected data
__ecfb:     and #$b5           ; $ecfb: 29 b5     
            .hex 33 69         ; $ecfd: 33 69     Invalid Opcode - RLA ($69),y
            clc                ; $ecff: 18        
            sta $33,x          ; $ed00: 95 33     
            jsr __848f         ; $ed02: 20 8f 84  
            ldx $12            ; $ed05: a6 12     
__ed07:     .hex a5            ; $ed07: a5        Suspected data
__ed08:     bpl __ed33         ; $ed08: 10 29     
            ora ($d0,x)        ; $ed0a: 01 d0     
            rol                ; $ed0c: 2a        
            lda $79,x          ; $ed0d: b5 79     
            and #$01           ; $ed0f: 29 01     
            tay                ; $ed11: a8        
            lda $47,x          ; $ed12: b5 47     
            clc                ; $ed14: 18        
            adc __ac87,y       ; $ed15: 79 87 ac  
            sta $47,x          ; $ed18: 95 47     
            cmp __ac89,y       ; $ed1a: d9 89 ac  
            bne __ed21         ; $ed1d: d0 02     
            inc $79,x          ; $ed1f: f6 79     
__ed21:     lda $0477,x        ; $ed21: bd 77 04  
            and #$01           ; $ed24: 29 01     
            tay                ; $ed26: a8        
            lda $3d,x          ; $ed27: b5 3d     
            clc                ; $ed29: 18        
            adc __ac83,y       ; $ed2a: 79 83 ac  
            sta $3d,x          ; $ed2d: 95 3d     
            cmp __ac85,y       ; $ed2f: d9 85 ac  
            .hex d0            ; $ed32: d0        Suspected data
__ed33:     .hex 03 fe         ; $ed33: 03 fe     Invalid Opcode - SLO ($fe,x)
            .hex 77 04         ; $ed35: 77 04     Invalid Opcode - RRA $04,x
__ed37:     jsr __ac28         ; $ed37: 20 28 ac  
            jsr __9e4b         ; $ed3a: 20 4b 9e  
            jmp __9e50         ; $ed3d: 4c 50 9e  

;-------------------------------------------------------------------------------
            .hex 3f 3f 3f      ; $ed40: 3f 3f 3f  Invalid Opcode - RLA $3f3f,x
            .hex 7f d4 d8      ; $ed43: 7f d4 d8  Invalid Opcode - RRA __d8d4,x
            .hex da            ; $ed46: da        Invalid Opcode - NOP 
            dec $5bb5,x        ; $ed47: de b5 5b  
            and #$10           ; $ed4a: 29 10     
            beq __ed59         ; $ed4c: f0 0b     
            jsr __ba7d         ; $ed4e: 20 7d ba  
            lda #$00           ; $ed51: a9 00     
            sta $046e,x        ; $ed53: 9d 6e 04  
            jmp __91b0         ; $ed56: 4c b0 91  

;-------------------------------------------------------------------------------
__ed59:     lda #$02           ; $ed59: a9 02     
            sta $6f,x          ; $ed5b: 95 6f     
            lda $10            ; $ed5d: a5 10     
            sta $044a,x        ; $ed5f: 9d 4a 04  
            inc $9f,x          ; $ed62: f6 9f     
            inc $9f,x          ; $ed64: f6 9f     
            jsr __b4fd         ; $ed66: 20 fd b4  
            jsr __9b1b         ; $ed69: 20 1b 9b  
            lda $5b,x          ; $ed6c: b5 5b     
            pha                ; $ed6e: 48        
            and #$04           ; $ed6f: 29 04     
            beq __ed7a         ; $ed71: f0 07     
            jsr __95ce         ; $ed73: 20 ce 95  
            lda #$00           ; $ed76: a9 00     
            sta $3d,x          ; $ed78: 95 3d     
__ed7a:     pla                ; $ed7a: 68        
            and #$03           ; $ed7b: 29 03     
            beq __ed85         ; $ed7d: f0 06     
            jsr __9ea9         ; $ed7f: 20 a9 9e  
            jsr __95b0         ; $ed82: 20 b0 95  
__ed85:     txa                ; $ed85: 8a        
            asl                ; $ed86: 0a        
            asl                ; $ed87: 0a        
            asl                ; $ed88: 0a        
            adc $10            ; $ed89: 65 10     
            ldy $04f8          ; $ed8b: ac f8 04  
            and __ad40,y       ; $ed8e: 39 40 ad  
            ora $47,x          ; $ed91: 15 47     
            bne __edab         ; $ed93: d0 16     
            lda $05ae          ; $ed95: ad ae 05  
            and #$1f           ; $ed98: 29 1f     
            ora __ad44,y       ; $ed9a: 19 44 ad  
            sta $47,x          ; $ed9d: 95 47     
            jsr __8492         ; $ed9f: 20 92 84  
            lda $04f8          ; $eda2: ad f8 04  
            cmp #$02           ; $eda5: c9 02     
            bcs __edab         ; $eda7: b0 02     
            asl $3d,x          ; $eda9: 16 3d     
__edab:     jsr __9e50         ; $edab: 20 50 9e  
            jmp __857f         ; $edae: 4c 7f 85  

;-------------------------------------------------------------------------------
            lda $b1,x          ; $edb1: b5 b1     
            bne __edf9         ; $edb3: d0 44     
            lda $5b,x          ; $edb5: b5 5b     
            and #$10           ; $edb7: 29 10     
            ora $a8,x          ; $edb9: 15 a8     
            beq __edf9         ; $edbb: f0 3c     
            lda #$01           ; $edbd: a9 01     
            sta $90,x          ; $edbf: 95 90     
            jsr __8441         ; $edc1: 20 41 84  
            lda $0441,x        ; $edc4: bd 41 04  
            sta $06            ; $edc7: 85 06     
            lda #$ff           ; $edc9: a9 ff     
            sta $0441,x        ; $edcb: 9d 41 04  
            jsr __92c8         ; $edce: 20 c8 92  
            bmi __edf9         ; $edd1: 30 26     
            ldy $00            ; $edd3: a4 00     
            lda $06            ; $edd5: a5 06     
            sta $0441,y        ; $edd7: 99 41 04  
            lda $29,x          ; $edda: b5 29     
            sta $0029,y        ; $eddc: 99 29 00  
            lda $15,x          ; $eddf: b5 15     
            sta $0015,y        ; $ede1: 99 15 00  
            ldx $00            ; $ede4: a6 00     
            .hex a9            ; $ede6: a9        Suspected data
__ede7:     rol $95            ; $ede7: 26 95     
            bcc __ee0b         ; $ede9: 90 20     
            .hex 8f 84 f6      ; $edeb: 8f 84 f6  Invalid Opcode - SAX __f684
            lda ($20),y        ; $edee: b1 20     
            eor ($84,x)        ; $edf0: 41 84     
            lda #$04           ; $edf2: a9 04     
            sta $0489,x        ; $edf4: 9d 89 04  
            ldx $12            ; $edf7: a6 12     
__edf9:     jsr __997a         ; $edf9: 20 7a 99  
            jsr __b4fd         ; $edfc: 20 fd b4  
            lda $5b,x          ; $edff: b5 5b     
            pha                ; $ee01: 48        
            and #$04           ; $ee02: 29 04     
__ee04:     beq __ee09         ; $ee04: f0 03     
            jsr __95ce         ; $ee06: 20 ce 95  
__ee09:     pla                ; $ee09: 68        
            .hex 29            ; $ee0a: 29        Suspected data
__ee0b:     .hex 03 f0         ; $ee0b: 03 f0     Invalid Opcode - SLO ($f0,x)
            asl $20            ; $ee0d: 06 20     
            lda #$9e           ; $ee0f: a9 9e     
            jsr __9e50         ; $ee11: 20 50 9e  
__ee14:     inc $9f,x          ; $ee14: f6 9f     
            lda $b1,x          ; $ee16: b5 b1     
            bne __ee45         ; $ee18: d0 2b     
            txa                ; $ee1a: 8a        
            asl                ; $ee1b: 0a        
            asl                ; $ee1c: 0a        
            asl                ; $ee1d: 0a        
            asl                ; $ee1e: 0a        
            adc $10            ; $ee1f: 65 10     
            and #$7f           ; $ee21: 29 7f     
            bne __ee28         ; $ee23: d0 03     
            jsr __8492         ; $ee25: 20 92 84  
__ee28:     lda $9f,x          ; $ee28: b5 9f     
            and #$7f           ; $ee2a: 29 7f     
            bne __ee45         ; $ee2c: d0 17     
            jsr __8492         ; $ee2e: 20 92 84  
            jsr __95eb         ; $ee31: 20 eb 95  
            bmi __ee45         ; $ee34: 30 0f     
            ldx $00            ; $ee36: a6 00     
            lda #$27           ; $ee38: a9 27     
            jsr __9004         ; $ee3a: 20 04 90  
            ldx $00            ; $ee3d: a6 00     
            dec $33,x          ; $ee3f: d6 33     
            dec $33,x          ; $ee41: d6 33     
            ldx $12            ; $ee43: a6 12     
__ee45:     jsr __8577         ; $ee45: 20 77 85  
            jmp __9b1b         ; $ee48: 4c 1b 9b  

;-------------------------------------------------------------------------------
            lda $51,x          ; $ee4b: b5 51     
            cmp #$01           ; $ee4d: c9 01     
            beq __ee5c         ; $ee4f: f0 0b     
            lda #$c1           ; $ee51: a9 c1     
            sta $65,x          ; $ee53: 95 65     
            sta $9f,x          ; $ee55: 95 9f     
            lda #$76           ; $ee57: a9 76     
            jmp __9bb3         ; $ee59: 4c b3 9b  

;-------------------------------------------------------------------------------
__ee5c:     lda $b1,x          ; $ee5c: b5 b1     
            bne __ee7c         ; $ee5e: d0 1c     
            .hex ad f4 00      ; $ee60: ad f4 00  Bad Addr Mode - LDA $00f4
            pha                ; $ee63: 48        
            lda $042c          ; $ee64: ad 2c 04  
            clc                ; $ee67: 18        
            adc #$f5           ; $ee68: 69 f5     
            sta $042c          ; $ee6a: 8d 2c 04  
            jsr __fafe         ; $ee6d: 20 fe fa  
            .hex 8c f4 00      ; $ee70: 8c f4 00  Bad Addr Mode - STY $00f4
            lda #$7c           ; $ee73: a9 7c     
            jsr __9bb3         ; $ee75: 20 b3 9b  
            pla                ; $ee78: 68        
            .hex 8d f4 00      ; $ee79: 8d f4 00  Bad Addr Mode - STA $00f4
__ee7c:     lda $33,x          ; $ee7c: b5 33     
            sta $042c          ; $ee7e: 8d 2c 04  
            jsr __9ba7         ; $ee81: 20 a7 9b  
            lda #$02           ; $ee84: a9 02     
            sta $6f,x          ; $ee86: 95 6f     
            tya                ; $ee88: 98        
            clc                ; $ee89: 18        
            adc #$08           ; $ee8a: 69 08     
            .hex 8d f4 00      ; $ee8c: 8d f4 00  Bad Addr Mode - STA $00f4
            lda $00            ; $ee8f: a5 00     
            sta $042c          ; $ee91: 8d 2c 04  
            lda #$d0           ; $ee94: a9 d0     
            sta $046e,x        ; $ee96: 9d 6e 04  
            lda #$78           ; $ee99: a9 78     
            jsr __9bb3         ; $ee9b: 20 b3 9b  
            lda #$50           ; $ee9e: a9 50     
            ldy $b1,x          ; $eea0: b4 b1     
            beq __eea6         ; $eea2: f0 02     
            lda #$52           ; $eea4: a9 52     
__eea6:     sta $046e,x        ; $eea6: 9d 6e 04  
            rts                ; $eea9: 60        

;-------------------------------------------------------------------------------
            jsr __845d         ; $eeaa: 20 5d 84  
            lda $33,x          ; $eead: b5 33     
            sta $b1,x          ; $eeaf: 95 b1     
            rts                ; $eeb1: 60        

;-------------------------------------------------------------------------------
            inc $9f,x          ; $eeb2: f6 9f     
            inc $9f,x          ; $eeb4: f6 9f     
            inc $79,x          ; $eeb6: f6 79     
            lda $79,x          ; $eeb8: b5 79     
            cmp #$40           ; $eeba: c9 40     
            bcs __eec3         ; $eebc: b0 05     
            lda #$e0           ; $eebe: a9 e0     
            sta $33,x          ; $eec0: 95 33     
__eec2:     rts                ; $eec2: 60        

;-------------------------------------------------------------------------------
__eec3:     bne __eecd         ; $eec3: d0 08     
            lda #$d0           ; $eec5: a9 d0     
            sta $47,x          ; $eec7: 95 47     
            lda $b1,x          ; $eec9: b5 b1     
            sta $33,x          ; $eecb: 95 33     
__eecd:     lda #$01           ; $eecd: a9 01     
            sta $0605          ; $eecf: 8d 05 06  
            lda $79,x          ; $eed2: b5 79     
            cmp #$80           ; $eed4: c9 80     
            bcc __eee6         ; $eed6: 90 0e     
            cmp #$dc           ; $eed8: c9 dc     
            bcs __eee6         ; $eeda: b0 0a     
            ldy #$03           ; $eedc: a0 03     
            and #$10           ; $eede: 29 10     
            beq __eee4         ; $eee0: f0 02     
            ldy #$fb           ; $eee2: a0 fb     
__eee4:     sty $47,x          ; $eee4: 94 47     
__eee6:     inc $47,x          ; $eee6: f6 47     
            jsr __9e4b         ; $eee8: 20 4b 9e  
            .hex a5            ; $eeeb: a5        Suspected data
__eeec:     inc $0c29          ; $eeec: ee 29 0c  
            bne __eec2         ; $eeef: d0 d1     
            lda $79,x          ; $eef1: b5 79     
            sta $07            ; $eef3: 85 07     
            lda #$29           ; $eef5: a9 29     
            sta $65,x          ; $eef7: 95 65     
            lda #$92           ; $eef9: a9 92     
            ldy $79,x          ; $eefb: b4 79     
            cpy #$dc           ; $eefd: c0 dc     
            bcc __ef03         ; $eeff: 90 02     
            lda #$94           ; $ef01: a9 94     
__ef03:     jsr __9bb3         ; $ef03: 20 b3 9b  
            jsr __fafe         ; $ef06: 20 fe fa  
            lda #$55           ; $ef09: a9 55     
            ldx $07            ; $ef0b: a6 07     
            cpx #$e0           ; $ef0d: e0 e0     
            bcc __ef13         ; $ef0f: 90 02     
            lda #$3a           ; $ef11: a9 3a     
__ef13:     sta $0201,y        ; $ef13: 99 01 02  
            lda #$55           ; $ef16: a9 55     
            cpx #$e8           ; $ef18: e0 e8     
            bcc __ef1e         ; $ef1a: 90 02     
            lda #$3a           ; $ef1c: a9 3a     
__ef1e:     sta $0205,y        ; $ef1e: 99 05 02  
            lda #$55           ; $ef21: a9 55     
            cpx #$f0           ; $ef23: e0 f0     
            bcc __ef29         ; $ef25: 90 02     
            lda #$3a           ; $ef27: a9 3a     
__ef29:     sta $0209,y        ; $ef29: 99 09 02  
            lda #$55           ; $ef2c: a9 55     
            cpx #$f8           ; $ef2e: e0 f8     
            bcc __ef34         ; $ef30: 90 02     
            lda #$3a           ; $ef32: a9 3a     
__ef34:     sta $020d,y        ; $ef34: 99 0d 02  
            .hex ae f4 00      ; $ef37: ae f4 00  Bad Addr Mode - LDX $00f4
            lda $0202,x        ; $ef3a: bd 02 02  
            sta $0202,y        ; $ef3d: 99 02 02  
            sta $0206,y        ; $ef40: 99 06 02  
            sta $020a,y        ; $ef43: 99 0a 02  
            sta $020e,y        ; $ef46: 99 0e 02  
            lda $0429          ; $ef49: ad 29 04  
            clc                ; $ef4c: 18        
            adc #$04           ; $ef4d: 69 04     
            sta $0203,y        ; $ef4f: 99 03 02  
            sta $0207,y        ; $ef52: 99 07 02  
            sta $020b,y        ; $ef55: 99 0b 02  
            sta $020f,y        ; $ef58: 99 0f 02  
            ldx $12            ; $ef5b: a6 12     
            lda $33,x          ; $ef5d: b5 33     
            clc                ; $ef5f: 18        
            adc #$0f           ; $ef60: 69 0f     
            sta $0200,y        ; $ef62: 99 00 02  
            adc #$10           ; $ef65: 69 10     
            sta $0204,y        ; $ef67: 99 04 02  
            adc #$10           ; $ef6a: 69 10     
            sta $0208,y        ; $ef6c: 99 08 02  
            adc #$10           ; $ef6f: 69 10     
            sta $020c,y        ; $ef71: 99 0c 02  
            rts                ; $ef74: 60        

;-------------------------------------------------------------------------------
            .hex 1c e4 01      ; $ef75: 1c e4 01  Invalid Opcode - NOP $01e4,x
            .hex ff f6 9f      ; $ef78: ff f6 9f  Invalid Opcode - ISC __9ff6,x
            jsr __997a         ; $ef7b: 20 7a 99  
            jsr __98cd         ; $ef7e: 20 cd 98  
            jsr __b4fd         ; $ef81: 20 fd b4  
            lda $5b,x          ; $ef84: b5 5b     
            and #$03           ; $ef86: 29 03     
            beq __ef8d         ; $ef88: f0 03     
            jsr __9ea9         ; $ef8a: 20 a9 9e  
__ef8d:     lda $5b,x          ; $ef8d: b5 5b     
            and #$04           ; $ef8f: 29 04     
            beq __efb4         ; $ef91: f0 21     
            lda $47,x          ; $ef93: b5 47     
            pha                ; $ef95: 48        
            jsr __95ce         ; $ef96: 20 ce 95  
            pla                ; $ef99: 68        
            ldy $042f,x        ; $ef9a: bc 2f 04  
            beq __efb4         ; $ef9d: f0 15     
            cmp #$18           ; $ef9f: c9 18     
            bmi __efac         ; $efa1: 30 09     
            jsr __95b0         ; $efa3: 20 b0 95  
            lda #$f0           ; $efa6: a9 f0     
            sta $47,x          ; $efa8: 95 47     
            bne __efda         ; $efaa: d0 2e     
__efac:     lda #$00           ; $efac: a9 00     
            sta $042f,x        ; $efae: 9d 2f 04  
            jsr __8441         ; $efb1: 20 41 84  
__efb4:     lda $0e            ; $efb4: a5 0e     
            cmp #$16           ; $efb6: c9 16     
            beq __efbf         ; $efb8: f0 05     
            dec $9f,x          ; $efba: d6 9f     
            jmp __9470         ; $efbc: 4c 70 94  

;-------------------------------------------------------------------------------
__efbf:     jsr __9e3b         ; $efbf: 20 3b 9e  
            iny                ; $efc2: c8        
            sty $6f,x          ; $efc3: 94 6f     
            lda $10            ; $efc5: a5 10     
            and #$01           ; $efc7: 29 01     
            bne __efda         ; $efc9: d0 0f     
            lda $3d,x          ; $efcb: b5 3d     
            cmp __af74,y       ; $efcd: d9 74 af  
            beq __efda         ; $efd0: f0 08     
            clc                ; $efd2: 18        
            adc __af76,y       ; $efd3: 79 76 af  
            sta $3d,x          ; $efd6: 95 3d     
            inc $9f,x          ; $efd8: f6 9f     
__efda:     jsr __8577         ; $efda: 20 77 85  
            inc $04a4,x        ; $efdd: fe a4 04  
            jmp __9b1b         ; $efe0: 4c 1b 9b  

;-------------------------------------------------------------------------------
            .hex 20            ; $efe3: 20        Suspected data
__efe4:     .hex 5f 8d a9      ; $efe4: 5f 8d a9  Invalid Opcode - SRE __a98d,x
            .hex 03 9d         ; $efe7: 03 9d     Invalid Opcode - SLO ($9d,x)
            adc $04            ; $efe9: 65 04     
            rts                ; $efeb: 60        

;-------------------------------------------------------------------------------
            ora ($ff,x)        ; $efec: 01 ff     
            plp                ; $efee: 28        
            cld                ; $efef: d8        
            ora ($ff,x)        ; $eff0: 01 ff     
            bpl __efe4         ; $eff2: 10 f0     
            jsr __b0e8         ; $eff4: 20 e8 b0  
            lda #$06           ; $eff7: a9 06     
            sta $046e,x        ; $eff9: 9d 6e 04  
            lda #$02           ; $effc: a9 02     
            .hex 8d fe         ; $effe: 8d fe     Suspected data
__f000:     adc ($ad),y        ; $f000: 71 ad     
            lda $04,x          ; $f002: b5 04     
            beq __f05f         ; $f004: f0 59     
__f006:     cmp #$01           ; $f006: c9 01     
            bne __f01c         ; $f008: d0 12     
__f00a:     .hex 9d            ; $f00a: 9d        Suspected data
__f00b:     .hex 80 04         ; $f00b: 80 04     Invalid Opcode - NOP #$04
            lda #$90           ; $f00d: a9 90     
            sta $86,x          ; $f00f: 95 86     
__f011:     lda #$40           ; $f011: a9 40     
            sta $0438,x        ; $f013: 9d 38 04  
            sta $045c,x        ; $f016: 9d 5c 04  
            sta $04b5          ; $f019: 8d b5 04  
__f01c:     lda $0480,x        ; $f01c: bd 80 04  
            cmp #$02           ; $f01f: c9 02     
            bcc __f09b         ; $f021: 90 78     
            lda $b1,x          ; $f023: b5 b1     
            bne __f03b         ; $f025: d0 14     
            .hex fe 80         ; $f027: fe 80     Suspected data
__f029:     .hex 04 bd         ; $f029: 04 bd     Invalid Opcode - NOP $bd
            .hex 80 04         ; $f02b: 80 04     Invalid Opcode - NOP #$04
            cmp #$31           ; $f02d: c9 31     
            bne __f060         ; $f02f: d0 2f     
            lda $0453,x        ; $f031: bd 53 04  
            bne __f03b         ; $f034: d0 05     
            inc $b1,x          ; $f036: f6 b1     
            jsr __b095         ; $f038: 20 95 b0  
__f03b:     dec $0480,x        ; $f03b: de 80 04  
            ldy $0480,x        ; $f03e: bc 80 04  
            dey                ; $f041: 88        
            bne __f060         ; $f042: d0 1c     
            dec $b1,x          ; $f044: d6 b1     
            lda $50            ; $f046: a5 50     
            cmp #$06           ; $f048: c9 06     
            bne __f060         ; $f04a: d0 14     
            lda #$01           ; $f04c: a9 01     
            sta $0534          ; $f04e: 8d 34 05  
            jsr __f6da         ; $f051: 20 da f6  
            .hex a9            ; $f054: a9        Suspected data
__f055:     ora #$85           ; $f055: 09 85     
            .hex 14 ee         ; $f057: 14 ee     Invalid Opcode - NOP $ee,x
            .hex 27 06         ; $f059: 27 06     Invalid Opcode - RLA $06
            pla                ; $f05b: 68        
            pla                ; $f05c: 68        
            pla                ; $f05d: 68        
            pla                ; $f05e: 68        
__f05f:     rts                ; $f05f: 60        

;-------------------------------------------------------------------------------
__f060:     lda $0480,x        ; $f060: bd 80 04  
            cmp #$30           ; $f063: c9 30     
            bne __f09a         ; $f065: d0 33     
            lda $5b,x          ; $f067: b5 5b     
            and #$40           ; $f069: 29 40     
            beq __f09a         ; $f06b: f0 2d     
            lda $9c            ; $f06d: a5 9c     
            bne __f09a         ; $f06f: d0 29     
            sta $5a            ; $f071: 85 5a     
            inc $b1,x          ; $f073: f6 b1     
            inc $04b4          ; $f075: ee b4 04  
            dec $0480,x        ; $f078: de 80 04  
            lda $29,x          ; $f07b: b5 29     
            sta $28            ; $f07d: 85 28     
            lda $15,x          ; $f07f: b5 15     
            sta $14            ; $f081: 85 14     
            lda $33,x          ; $f083: b5 33     
            adc #$10           ; $f085: 69 10     
            sta $32            ; $f087: 85 32     
            lda #$06           ; $f089: a9 06     
            sta $50            ; $f08b: 85 50     
            lda #$60           ; $f08d: a9 60     
            sta $82            ; $f08f: 85 82     
            lda #$fc           ; $f091: a9 fc     
            sta $46            ; $f093: 85 46     
            lda #$80           ; $f095: a9 80     
            sta $0602          ; $f097: 8d 02 06  
__f09a:     rts                ; $f09a: 60        

;-------------------------------------------------------------------------------
__f09b:     lda #$03           ; $f09b: a9 03     
            sta $046e,x        ; $f09d: 9d 6e 04  
            lda #$00           ; $f0a0: a9 00     
            sta $71fe          ; $f0a2: 8d fe 71  
            .hex bd            ; $f0a5: bd        Suspected data
__f0a6:     adc $04            ; $f0a6: 65 04     
            bne __f0ba         ; $f0a8: d0 10     
            lda #$03           ; $f0aa: a9 03     
            sta $0465,x        ; $f0ac: 9d 65 04  
            jsr __b095         ; $f0af: 20 95 b0  
            inc $0480,x        ; $f0b2: fe 80 04  
            lda #$ff           ; $f0b5: a9 ff     
            sta $0453,x        ; $f0b7: 9d 53 04  
__f0ba:     lda $10            ; $f0ba: a5 10     
            lsr                ; $f0bc: 4a        
            bcc __f0e3         ; $f0bd: 90 24     
            lda $79,x          ; $f0bf: b5 79     
            and #$01           ; $f0c1: 29 01     
            tay                ; $f0c3: a8        
            lda $47,x          ; $f0c4: b5 47     
            clc                ; $f0c6: 18        
            adc __aff0,y       ; $f0c7: 79 f0 af  
            sta $47,x          ; $f0ca: 95 47     
            cmp __aff2,y       ; $f0cc: d9 f2 af  
            bne __f0d3         ; $f0cf: d0 02     
            inc $79,x          ; $f0d1: f6 79     
__f0d3:     jsr __9e3b         ; $f0d3: 20 3b 9e  
            lda $3d,x          ; $f0d6: b5 3d     
            cmp __afee,y       ; $f0d8: d9 ee af  
            beq __f0e3         ; $f0db: f0 06     
            clc                ; $f0dd: 18        
            adc __afec,y       ; $f0de: 79 ec af  
            sta $3d,x          ; $f0e1: 95 3d     
__f0e3:     jmp __9430         ; $f0e3: 4c 30 94  

;-------------------------------------------------------------------------------
            sed                ; $f0e6: f8        
            bpl __f0a6         ; $f0e7: 10 bd     
            .hex 80 04         ; $f0e9: 80 04     Invalid Opcode - NOP #$04
            jsr __8e13         ; $f0eb: 20 13 8e  
            lda $04b5          ; $f0ee: ad b5 04  
            beq __f16d         ; $f0f1: f0 7a     
            lda $ee            ; $f0f3: a5 ee     
            and #$0c           ; $f0f5: 29 0c     
            .hex d0            ; $f0f7: d0        Suspected data
__f0f8:     .hex 74 b5         ; $f0f8: 74 b5     Invalid Opcode - NOP $b5,x
            stx $85            ; $f0fa: 86 85     
            .hex 07 20         ; $f0fc: 07 20     Invalid Opcode - SLO $20
            inc __a6fa,x       ; $f0fe: fe fa a6  
            .hex 02            ; $f101: 02        Invalid Opcode - KIL 
            lda $0429          ; $f102: ad 29 04  
            clc                ; $f105: 18        
            adc __b0e5,x       ; $f106: 7d e5 b0  
            pha                ; $f109: 48        
            php                ; $f10a: 08        
            dex                ; $f10b: ca        
            beq __f112         ; $f10c: f0 04     
            pla                ; $f10e: 68        
            eor #$01           ; $f10f: 49 01     
            pha                ; $f111: 48        
__f112:     plp                ; $f112: 28        
            pla                ; $f113: 68        
            bcc __f16d         ; $f114: 90 57     
            sta $0203,y        ; $f116: 99 03 02  
            sta $0207,y        ; $f119: 99 07 02  
            sta $020b,y        ; $f11c: 99 0b 02  
            sta $020f,y        ; $f11f: 99 0f 02  
            ldx $04bd          ; $f122: ae bd 04  
            beq __f129         ; $f125: f0 02     
            ldx #$10           ; $f127: a2 10     
__f129:     lda $0200,x        ; $f129: bd 00 02  
            sta $0200,y        ; $f12c: 99 00 02  
            clc                ; $f12f: 18        
            adc #$10           ; $f130: 69 10     
            sta $0204,y        ; $f132: 99 04 02  
            lda $07            ; $f135: a5 07     
            beq __f13b         ; $f137: f0 02     
            lda #$20           ; $f139: a9 20     
__f13b:     ora $0202,x        ; $f13b: 1d 02 02  
            sta $0202,y        ; $f13e: 99 02 02  
            sta $0206,y        ; $f141: 99 06 02  
            sta $020a,y        ; $f144: 99 0a 02  
            sta $020e,y        ; $f147: 99 0e 02  
            .hex ae f4 00      ; $f14a: ae f4 00  Bad Addr Mode - LDX $00f4
            lda $0200,x        ; $f14d: bd 00 02  
            sta $0208,y        ; $f150: 99 08 02  
            clc                ; $f153: 18        
            adc #$10           ; $f154: 69 10     
            sta $020c,y        ; $f156: 99 0c 02  
            lda #$f0           ; $f159: a9 f0     
            sta $0201,y        ; $f15b: 99 01 02  
            lda #$f2           ; $f15e: a9 f2     
            sta $0205,y        ; $f160: 99 05 02  
            lda #$f4           ; $f163: a9 f4     
            sta $0209,y        ; $f165: 99 09 02  
            lda #$f6           ; $f168: a9 f6     
            sta $020d,y        ; $f16a: 99 0d 02  
__f16d:     ldx $12            ; $f16d: a6 12     
            rts                ; $f16f: 60        

;-------------------------------------------------------------------------------
            php                ; $f170: 08        
            plp                ; $f171: 28        
            pha                ; $f172: 48        
            plp                ; $f173: 28        
            sty $84,x          ; $f174: 94 84     
            sty $84,x          ; $f176: 94 84     
            sed                ; $f178: f8        
            php                ; $f179: 08        
            sed                ; $f17a: f8        
            php                ; $f17b: 08        
            php                ; $f17c: 08        
            sed                ; $f17d: f8        
            php                ; $f17e: 08        
            sed                ; $f17f: f8        
            lda $9c            ; $f180: a5 9c     
            bne __f1cc         ; $f182: d0 48     
            lda $10            ; $f184: a5 10     
            and #$ff           ; $f186: 29 ff     
            bne __f1cc         ; $f188: d0 42     
            inc $04f9          ; $f18a: ee f9 04  
            jsr __92c4         ; $f18d: 20 c4 92  
            bmi __f1cc         ; $f190: 30 3a     
            ldx $00            ; $f192: a6 00     
            lda $04f9          ; $f194: ad f9 04  
            and #$07           ; $f197: 29 07     
            tay                ; $f199: a8        
            lda __b178,y       ; $f19a: b9 78 b1  
            sta $3d,x          ; $f19d: 95 3d     
            tya                ; $f19f: 98        
            and #$03           ; $f1a0: 29 03     
            tay                ; $f1a2: a8        
            lda #$02           ; $f1a3: a9 02     
            sta $15,x          ; $f1a5: 95 15     
            lda __b170,y       ; $f1a7: b9 70 b1  
            sta $29,x          ; $f1aa: 95 29     
            lda __b174,y       ; $f1ac: b9 74 b1  
            sta $33,x          ; $f1af: 95 33     
            lda #$00           ; $f1b1: a9 00     
            sta $1f,x          ; $f1b3: 95 1f     
            lda $05ae          ; $f1b5: ad ae 05  
            and #$03           ; $f1b8: 29 03     
            cmp #$02           ; $f1ba: c9 02     
            bcc __f1c1         ; $f1bc: 90 03     
            asl                ; $f1be: 0a        
            sta $b1,x          ; $f1bf: 95 b1     
__f1c1:     ldy #$33           ; $f1c1: a0 33     
            sty $90,x          ; $f1c3: 94 90     
            jsr __8441         ; $f1c5: 20 41 84  
            lda #$d0           ; $f1c8: a9 d0     
            sta $47,x          ; $f1ca: 95 47     
__f1cc:     rts                ; $f1cc: 60        

;-------------------------------------------------------------------------------
            jsr __845d         ; $f1cd: 20 5d 84  
            lda #$06           ; $f1d0: a9 06     
            sta $0465,x        ; $f1d2: 9d 65 04  
            lda $15,x          ; $f1d5: b5 15     
            sta $04ef,x        ; $f1d7: 9d ef 04  
            rts                ; $f1da: 60        

;-------------------------------------------------------------------------------
            cpx #$f0           ; $f1db: e0 f0     
            inx                ; $f1dd: e8        
            cpx $b5            ; $f1de: e4 b5     
            lda ($d0),y        ; $f1e0: b1 d0     
            .hex 73 bd         ; $f1e2: 73 bd     Invalid Opcode - RRA ($bd),y
            adc $04            ; $f1e4: 65 04     
            bne __f1f0         ; $f1e6: d0 08     
            lda #$80           ; $f1e8: a9 80     
            sta $86,x          ; $f1ea: 95 86     
            sta $b1,x          ; $f1ec: 95 b1     
            bne __f253         ; $f1ee: d0 63     
__f1f0:     inc $79,x          ; $f1f0: f6 79     
            lda $10            ; $f1f2: a5 10     
            and #$ff           ; $f1f4: 29 ff     
            bne __f1ff         ; $f1f6: d0 07     
            lda #$5f           ; $f1f8: a9 5f     
            sta $86,x          ; $f1fa: 95 86     
            inc $0480,x        ; $f1fc: fe 80 04  
__f1ff:     lda #$00           ; $f1ff: a9 00     
            sta $3d,x          ; $f201: 95 3d     
            lda $79,x          ; $f203: b5 79     
            and #$40           ; $f205: 29 40     
            beq __f216         ; $f207: f0 0d     
            inc $0477,x        ; $f209: fe 77 04  
            lda #$f8           ; $f20c: a9 f8     
            ldy $79,x          ; $f20e: b4 79     
            bpl __f214         ; $f210: 10 02     
            lda #$08           ; $f212: a9 08     
__f214:     sta $3d,x          ; $f214: 95 3d     
__f216:     .hex 20 50         ; $f216: 20 50     Suspected data
__f218:     .hex 9e bd 5c      ; $f218: 9e bd 5c  Invalid Opcode - SHX $5cbd,y
            .hex 04 d0         ; $f21b: 04 d0     Invalid Opcode - NOP $d0
            and $b5,x          ; $f21d: 35 b5     
            stx $f0            ; $f21f: 86 f0     
            .hex 31            ; $f221: 31        Suspected data
__f222:     and #$0f           ; $f222: 29 0f     
            .hex d0            ; $f224: d0        Suspected data
__f225:     and __c820         ; $f225: 2d 20 c8  
            .hex 92            ; $f228: 92        Invalid Opcode - KIL 
            bmi __f253         ; $f229: 30 28     
            lda #$80           ; $f22b: a9 80     
            sta $0602          ; $f22d: 8d 02 06  
            lda $0480,x        ; $f230: bd 80 04  
            and #$03           ; $f233: 29 03     
            tay                ; $f235: a8        
            lda $86,x          ; $f236: b5 86     
            ldx $00            ; $f238: a6 00     
            lsr                ; $f23a: 4a        
            eor #$ff           ; $f23b: 49 ff     
            sta $3d,x          ; $f23d: 95 3d     
            lda __b1db,y       ; $f23f: b9 db b1  
            sta $47,x          ; $f242: 95 47     
            lda #$11           ; $f244: a9 11     
            sta $90,x          ; $f246: 95 90     
            lda $33,x          ; $f248: b5 33     
            adc #$08           ; $f24a: 69 08     
            sta $33,x          ; $f24c: 95 33     
            jsr __8441         ; $f24e: 20 41 84  
            ldx $12            ; $f251: a6 12     
__f253:     jmp __9b1b         ; $f253: 4c 1b 9b  

;-------------------------------------------------------------------------------
            lda $86,x          ; $f256: b5 86     
            beq __f269         ; $f258: f0 0f     
            sta $045c,x        ; $f25a: 9d 5c 04  
            inc $0477,x        ; $f25d: fe 77 04  
            inc $0477,x        ; $f260: fe 77 04  
            lda #$f0           ; $f263: a9 f0     
            sta $47,x          ; $f265: 95 47     
            bne __f29f         ; $f267: d0 36     
__f269:     lda #$04           ; $f269: a9 04     
            sta $3d,x          ; $f26b: 95 3d     
            jsr __9e50         ; $f26d: 20 50 9e  
            jsr __9e4b         ; $f270: 20 4b 9e  
            lda $10            ; $f273: a5 10     
            lsr                ; $f275: 4a        
            bcs __f295         ; $f276: b0 1d     
            inc $47,x          ; $f278: f6 47     
            bmi __f295         ; $f27a: 30 19     
            lda $10            ; $f27c: a5 10     
            and #$1f           ; $f27e: 29 1f     
            bne __f295         ; $f280: d0 13     
            lda #$10           ; $f282: a9 10     
__f284:     sta $0601          ; $f284: 8d 01 06  
            jsr __92c8         ; $f287: 20 c8 92  
            ldx $00            ; $f28a: a6 00     
            lda $33,x          ; $f28c: b5 33     
            adc #$08           ; $f28e: 69 08     
            sta $33,x          ; $f290: 95 33     
            jsr __91b0         ; $f292: 20 b0 91  
__f295:     lda $33,x          ; $f295: b5 33     
            cmp #$d0           ; $f297: c9 d0     
            bcc __f29f         ; $f299: 90 04     
            lda #$02           ; $f29b: a9 02     
            sta $51,x          ; $f29d: 95 51     
__f29f:     jmp __9b1b         ; $f29f: 4c 1b 9b  

;-------------------------------------------------------------------------------
            inc $9f,x          ; $f2a2: f6 9f     
            jsr __9e50         ; $f2a4: 20 50 9e  
            jsr __9e4b         ; $f2a7: 20 4b 9e  
            inc $47,x          ; $f2aa: f6 47     
            jmp __9b1b         ; $f2ac: 4c 1b 9b  

;-------------------------------------------------------------------------------
__f2af:     rts                ; $f2af: 60        

;-------------------------------------------------------------------------------
            .hex ad f4 00      ; $f2b0: ad f4 00  Bad Addr Mode - LDA $00f4
            sta $7267          ; $f2b3: 8d 67 72  
            sta $726b          ; $f2b6: 8d 6b 72  
            lda $10            ; $f2b9: a5 10     
            and #$03           ; $f2bb: 29 03     
            sta $07            ; $f2bd: 85 07     
            tay                ; $f2bf: a8        
            lda $7265,y        ; $f2c0: b9 65 72  
            .hex 8d f4 00      ; $f2c3: 8d f4 00  Bad Addr Mode - STA $00f4
            lda $ef            ; $f2c6: a5 ef     
            bne __f2af         ; $f2c8: d0 e5     
            ldy $0465,x        ; $f2ca: bc 65 04  
            bne __f2d3         ; $f2cd: d0 04     
            lda #$4e           ; $f2cf: a9 4e     
            sta $65,x          ; $f2d1: 95 65     
__f2d3:     lda $ee            ; $f2d3: a5 ee     
            pha                ; $f2d5: 48        
            pha                ; $f2d6: 48        
            ldy #$ae           ; $f2d7: a0 ae     
            lda $b1,x          ; $f2d9: b5 b1     
            bne __f2ec         ; $f2db: d0 0f     
            lda $045c,x        ; $f2dd: bd 5c 04  
            beq __f2ef         ; $f2e0: f0 0d     
            cmp #$30           ; $f2e2: c9 30     
            bcs __f2ec         ; $f2e4: b0 06     
            and #$08           ; $f2e6: 29 08     
            bne __f2ec         ; $f2e8: d0 02     
            ldy #$9e           ; $f2ea: a0 9e     
__f2ec:     tya                ; $f2ec: 98        
            bne __f2f7         ; $f2ed: d0 08     
__f2ef:     lda #$9e           ; $f2ef: a9 9e     
            ldy $86,x          ; $f2f1: b4 86     
            beq __f2f7         ; $f2f3: f0 02     
            lda #$a2           ; $f2f5: a9 a2     
__f2f7:     jsr __9bb3         ; $f2f7: 20 b3 9b  
            lda $00            ; $f2fa: a5 00     
            sta $042c          ; $f2fc: 8d 2c 04  
            ldy $07            ; $f2ff: a4 07     
            lda $7266,y        ; $f301: b9 66 72  
            .hex 8d f4 00      ; $f304: 8d f4 00  Bad Addr Mode - STA $00f4
            ldy #$a6           ; $f307: a0 a6     
            lda $b1,x          ; $f309: b5 b1     
            bne __f320         ; $f30b: d0 13     
            lda $045c,x        ; $f30d: bd 5c 04  
            beq __f31c         ; $f310: f0 0a     
            cmp #$30           ; $f312: c9 30     
            bcs __f320         ; $f314: b0 0a     
            and #$08           ; $f316: 29 08     
            bne __f320         ; $f318: d0 06     
__f31a:     beq __f322         ; $f31a: f0 06     
__f31c:     lda $86,x          ; $f31c: b5 86     
            beq __f322         ; $f31e: f0 02     
__f320:     ldy #$aa           ; $f320: a0 aa     
__f322:     pla                ; $f322: 68        
            sta $ee            ; $f323: 85 ee     
            tya                ; $f325: 98        
            jsr __9bb3         ; $f326: 20 b3 9b  
            lda $00            ; $f329: a5 00     
            sta $042c          ; $f32b: 8d 2c 04  
            ldy $07            ; $f32e: a4 07     
            lda $7267,y        ; $f330: b9 67 72  
            .hex 8d f4 00      ; $f333: 8d f4 00  Bad Addr Mode - STA $00f4
            ldy #$ba           ; $f336: a0 ba     
            lda $3d,x          ; $f338: b5 3d     
            beq __f347         ; $f33a: f0 0b     
            ldy #$b2           ; $f33c: a0 b2     
            lda $0477,x        ; $f33e: bd 77 04  
            and #$10           ; $f341: 29 10     
            beq __f347         ; $f343: f0 02     
            ldy #$b6           ; $f345: a0 b6     
__f347:     pla                ; $f347: 68        
            sta $ee            ; $f348: 85 ee     
            tya                ; $f34a: 98        
            jsr __9bb3         ; $f34b: 20 b3 9b  
            lda $ee            ; $f34e: a5 ee     
            bne __f398         ; $f350: d0 46     
            ldy $07            ; $f352: a4 07     
            ldx $7267,y        ; $f354: be 67 72  
            lda $7268,y        ; $f357: b9 68 72  
            tay                ; $f35a: a8        
            lda $0429          ; $f35b: ad 29 04  
            clc                ; $f35e: 18        
            adc #$20           ; $f35f: 69 20     
            bcs __f398         ; $f361: b0 35     
            sta $0203,y        ; $f363: 99 03 02  
            sta $0207,y        ; $f366: 99 07 02  
            sta $020b,y        ; $f369: 99 0b 02  
            lda $00            ; $f36c: a5 00     
            sbc #$2f           ; $f36e: e9 2f     
            sta $0200,y        ; $f370: 99 00 02  
            adc #$0f           ; $f373: 69 0f     
            sta $0204,y        ; $f375: 99 04 02  
            adc #$10           ; $f378: 69 10     
            sta $0208,y        ; $f37a: 99 08 02  
            lda $0202,x        ; $f37d: bd 02 02  
            sta $0202,y        ; $f380: 99 02 02  
            sta $0206,y        ; $f383: 99 06 02  
            sta $020a,y        ; $f386: 99 0a 02  
            lda #$19           ; $f389: a9 19     
            sta $0201,y        ; $f38b: 99 01 02  
            lda #$1b           ; $f38e: a9 1b     
            sta $0205,y        ; $f390: 99 05 02  
            lda #$1d           ; $f393: a9 1d     
            sta $0209,y        ; $f395: 99 09 02  
__f398:     ldx $12            ; $f398: a6 12     
            rts                ; $f39a: 60        

;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $f39b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f39e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3a1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3a4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3a7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3aa: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3ad: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3b0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3b3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3b6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3b9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3bc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3bf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3c2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3c5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3c8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3cb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3ce: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3d1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3d4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3d7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3da: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3dd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3e0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3e3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3e6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3e9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3ec: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3ef: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3f2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3f5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3f8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3fb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f3fe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f401: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f404: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f407: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f40a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f40d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f410: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f413: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f416: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f419: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f41c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f41f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f422: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f425: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f428: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f42b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f42e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f431: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f434: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f437: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f43a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f43d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f440: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f443: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f446: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f449: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f44c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f44f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f452: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f455: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f458: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f45b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f45e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f461: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f464: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f467: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f46a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f46d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f470: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f473: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f476: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f479: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f47c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f47f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f482: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f485: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f488: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f48b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f48e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f491: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f494: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f497: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f49a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f49d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4a0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4a3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4a6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4a9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4ac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4af: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4b2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4b5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4b8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4bb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4be: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4c1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4c4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4c7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4ca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4cd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4d0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4d3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4d6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff            ; $f4d9: ff        Suspected data
__f4da:     .hex ff ff ff      ; $f4da: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $f4dd: ff ff ff  Invalid Opcode - ISC Array,x
            beq __f4f2         ; $f4e0: f0 10     
            jsr __b5ac         ; $f4e2: 20 ac b5  
            tay                ; $f4e5: a8        
__f4e6:     lda $46,x          ; $f4e6: b5 46     
            bmi __f4eb         ; $f4e8: 30 01     
            iny                ; $f4ea: c8        
__f4eb:     jsr __bb5a         ; $f4eb: 20 5a bb  
            bcs __f4f7         ; $f4ee: b0 07     
            lda $00            ; $f4f0: a5 00     
__f4f2:     cmp #$82           ; $f4f2: c9 82     
            beq __f4f7         ; $f4f4: f0 01     
            clc                ; $f4f6: 18        
__f4f7:     dex                ; $f4f7: ca        
            rts                ; $f4f8: 60        

;-------------------------------------------------------------------------------
            lda #$04           ; $f4f9: a9 04     
            bne __f4ff         ; $f4fb: d0 02     
            lda #$00           ; $f4fd: a9 00     
__f4ff:     sta $07            ; $f4ff: 85 07     
            lda #$00           ; $f501: a9 00     
            sta $0b            ; $f503: 85 0b     
            sta $0e            ; $f505: 85 0e     
            jsr __b5ac         ; $f507: 20 ac b5  
            sta $08            ; $f50a: 85 08     
            lda $46,x          ; $f50c: b5 46     
            bpl __f519         ; $f50e: 10 09     
            jsr __b58c         ; $f510: 20 8c b5  
            inc $07            ; $f513: e6 07     
            inc $08            ; $f515: e6 08     
            bne __f57b         ; $f517: d0 62     
__f519:     inc $07            ; $f519: e6 07     
            inc $08            ; $f51b: e6 08     
            jsr __b58c         ; $f51d: 20 8c b5  
            lda $8f,x          ; $f520: b5 8f     
            cmp #$18           ; $f522: c9 18     
            beq __f540         ; $f524: f0 1a     
            cmp #$19           ; $f526: c9 19     
            beq __f540         ; $f528: f0 16     
            lda $00            ; $f52a: a5 00     
            sec                ; $f52c: 38        
            sbc #$8a           ; $f52d: e9 8a     
            cmp #$02           ; $f52f: c9 02     
            .hex b0            ; $f531: b0        Suspected data
__f532:     ora $690a          ; $f532: 0d 0a 69  
            ora ($95,x)        ; $f535: 01 95     
            lsr $a9            ; $f537: 46 a9     
            .hex 07 95         ; $f539: 07 95     Invalid Opcode - SLO $95
            bvc __f4e6         ; $f53b: 50 a9     
            .hex ff 95 85      ; $f53d: ff 95 85  Invalid Opcode - ISC __8595,x
__f540:     lda $00            ; $f540: a5 00     
            sta $0e            ; $f542: 85 0e     
            sec                ; $f544: 38        
            sbc #$67           ; $f545: e9 67     
            cmp #$02           ; $f547: c9 02     
            bcs __f57b         ; $f549: b0 30     
            ldy $0437,x        ; $f54b: bc 37 04  
            bne __f57b         ; $f54e: d0 2b     
            ldy $8f,x          ; $f550: b4 8f     
            cpy #$32           ; $f552: c0 32     
            bcc __f56c         ; $f554: 90 16     
            tay                ; $f556: a8        
            lda $46,x          ; $f557: b5 46     
            cmp #$03           ; $f559: c9 03     
            bcs __f57b         ; $f55b: b0 1e     
            lda $0d            ; $f55d: a5 0d     
            and #$03           ; $f55f: 29 03     
            bne __f57b         ; $f561: d0 18     
            lda __b4e0,y       ; $f563: b9 e0 b4  
            sta $3c,x          ; $f566: 95 3c     
            sta $0b            ; $f568: 85 0b     
            bne __f57b         ; $f56a: d0 0f     
__f56c:     ldy $3c,x          ; $f56c: b4 3c     
            beq __f579         ; $f56e: f0 09     
            eor $6e,x          ; $f570: 55 6e     
            lsr                ; $f572: 4a        
            bcs __f579         ; $f573: b0 04     
            dec $9e,x          ; $f575: d6 9e     
            dec $9e,x          ; $f577: d6 9e     
__f579:     inc $9e,x          ; $f579: f6 9e     
__f57b:     lda $3c,x          ; $f57b: b5 3c     
            clc                ; $f57d: 18        
            adc $04cb,x        ; $f57e: 7d cb 04  
            bmi __f587         ; $f581: 30 04     
            inc $07            ; $f583: e6 07     
            inc $08            ; $f585: e6 08     
__f587:     jsr __b58c         ; $f587: 20 8c b5  
            dex                ; $f58a: ca        
            rts                ; $f58b: 60        

;-------------------------------------------------------------------------------
            ldy $08            ; $f58c: a4 08     
            jsr __bb87         ; $f58e: 20 87 bb  
            ldy $07            ; $f591: a4 07     
            lda __b5bc,y       ; $f593: b9 bc b5  
            tay                ; $f596: a8        
            lda $00            ; $f597: a5 00     
            jsr __bbe2         ; $f599: 20 e2 bb  
            bcc __f5a7         ; $f59c: 90 09     
            ldy $07            ; $f59e: a4 07     
            lda __b5c4,y       ; $f5a0: b9 c4 b5  
            ora $5a,x          ; $f5a3: 15 5a     
            sta $5a,x          ; $f5a5: 95 5a     
__f5a7:     inc $07            ; $f5a7: e6 07     
            inc $08            ; $f5a9: e6 08     
            rts                ; $f5ab: 60        

;-------------------------------------------------------------------------------
            inx                ; $f5ac: e8        
            lda $5a,x          ; $f5ad: b5 5a     
            sta $0d            ; $f5af: 85 0d     
            and #$f0           ; $f5b1: 29 f0     
            sta $5a,x          ; $f5b3: 95 5a     
            ldy $0491,x        ; $f5b5: bc 91 04  
            lda __f000,y       ; $f5b8: b9 00 f0  
__f5bb:     rts                ; $f5bb: 60        

;-------------------------------------------------------------------------------
            .hex 02            ; $f5bc: 02        Invalid Opcode - KIL 
            ora ($02,x)        ; $f5bd: 01 02     
            .hex 02            ; $f5bf: 02        Invalid Opcode - KIL 
__f5c0:     brk                ; $f5c0: 00        
            brk                ; $f5c1: 00        
            brk                ; $f5c2: 00        
            brk                ; $f5c3: 00        
            php                ; $f5c4: 08        
            .hex 04 02         ; $f5c5: 04 02     Invalid Opcode - NOP $02
            ora ($08,x)        ; $f5c7: 01 08     
            .hex 04 02         ; $f5c9: 04 02     Invalid Opcode - NOP $02
            ora ($a9,x)        ; $f5cb: 01 a9     
            brk                ; $f5cd: 00        
            sta $04cc,x        ; $f5ce: 9d cc 04  
            lda $5b,x          ; $f5d1: b5 5b     
            and #$0f           ; $f5d3: 29 0f     
            sta $5b,x          ; $f5d5: 95 5b     
            lda $51,x          ; $f5d7: b5 51     
            cmp #$04           ; $f5d9: c9 04     
            bne __f5e1         ; $f5db: d0 04     
            ldy #$06           ; $f5dd: a0 06     
            bne __f5ff         ; $f5df: d0 1e     
__f5e1:     cmp #$07           ; $f5e1: c9 07     
            beq __f5f8         ; $f5e3: f0 13     
            ldy $90,x          ; $f5e5: b4 90     
            cpy #$1e           ; $f5e7: c0 1e     
            beq __f5f4         ; $f5e9: f0 09     
            cpy #$1a           ; $f5eb: c0 1a     
            beq __f5f4         ; $f5ed: f0 05     
            ldy $042f,x        ; $f5ef: bc 2f 04  
            bne __f5f8         ; $f5f2: d0 04     
__f5f4:     cmp #$01           ; $f5f4: c9 01     
            bne __f5bb         ; $f5f6: d0 c3     
__f5f8:     lda $a8,x          ; $f5f8: b5 a8     
            bne __f5bb         ; $f5fa: d0 bf     
            ldy $0489,x        ; $f5fc: bc 89 04  
__f5ff:     lda $7128,y        ; $f5ff: b9 28 71  
            sta $09            ; $f602: 85 09     
            lda #$00           ; $f604: a9 00     
            sta $00            ; $f606: 85 00     
            lda $7100,y        ; $f608: b9 00 71  
            bpl __f60f         ; $f60b: 10 02     
            dec $00            ; $f60d: c6 00     
__f60f:     clc                ; $f60f: 18        
            adc $29,x          ; $f610: 75 29     
            sta $05            ; $f612: 85 05     
            lda $15,x          ; $f614: b5 15     
            adc $00            ; $f616: 65 00     
            sta $01            ; $f618: 85 01     
            lda $ec            ; $f61a: a5 ec     
            bne __f620         ; $f61c: d0 02     
            sta $01            ; $f61e: 85 01     
__f620:     lda $713c,y        ; $f620: b9 3c 71  
            sta $0b            ; $f623: 85 0b     
            lda #$00           ; $f625: a9 00     
            sta $00            ; $f627: 85 00     
            lda $7114,y        ; $f629: b9 14 71  
            bpl __f630         ; $f62c: 10 02     
            dec $00            ; $f62e: c6 00     
__f630:     clc                ; $f630: 18        
            adc $33,x          ; $f631: 75 33     
            sta $07            ; $f633: 85 07     
            lda $1f,x          ; $f635: b5 1f     
            adc $00            ; $f637: 65 00     
            sta $03            ; $f639: 85 03     
            stx $ed            ; $f63b: 86 ed     
            txa                ; $f63d: 8a        
            bne __f661         ; $f63e: d0 21     
            lda $04c7          ; $f640: ad c7 04  
            ora $041b          ; $f643: 0d 1b 04  
            bne __f64e         ; $f646: d0 06     
            lda $50,x          ; $f648: b5 50     
            cmp #$02           ; $f64a: c9 02     
            bcc __f651         ; $f64c: 90 03     
__f64e:     jmp __b6f0         ; $f64e: 4c f0 b6  

;-------------------------------------------------------------------------------
__f651:     ldy $12            ; $f651: a4 12     
            lda $042f,y        ; $f653: b9 2f 04  
            beq __f65c         ; $f656: f0 04     
            cmp #$20           ; $f658: c9 20     
            bcc __f64e         ; $f65a: 90 f2     
__f65c:     ldy $9a            ; $f65c: a4 9a     
            jmp __b6a6         ; $f65e: 4c a6 b6  

;-------------------------------------------------------------------------------
__f661:     ldy $12            ; $f661: a4 12     
            lda $0051,y        ; $f663: b9 51 00  
            cmp #$04           ; $f666: c9 04     
            beq __f671         ; $f668: f0 07     
            lda $046e,y        ; $f66a: b9 6e 04  
            and #$04           ; $f66d: 29 04     
            bne __f690         ; $f66f: d0 1f     
__f671:     lda $50,x          ; $f671: b5 50     
            cmp #$04           ; $f673: c9 04     
            bne __f67b         ; $f675: d0 04     
            ldy #$06           ; $f677: a0 06     
            bne __f6a6         ; $f679: d0 2b     
__f67b:     cmp #$07           ; $f67b: c9 07     
            beq __f692         ; $f67d: f0 13     
            ldy $8f,x          ; $f67f: b4 8f     
            cpy #$1e           ; $f681: c0 1e     
            beq __f68e         ; $f683: f0 09     
            cpy #$1a           ; $f685: c0 1a     
            beq __f68e         ; $f687: f0 05     
            ldy $042e,x        ; $f689: bc 2e 04  
            bne __f692         ; $f68c: d0 04     
__f68e:     cmp #$01           ; $f68e: c9 01     
__f690:     bne __f6f0         ; $f690: d0 5e     
__f692:     lda $a7,x          ; $f692: b5 a7     
            bne __f6f0         ; $f694: d0 5a     
            lda $5a,x          ; $f696: b5 5a     
            and #$10           ; $f698: 29 10     
            bne __f6f0         ; $f69a: d0 54     
            lda $046d,x        ; $f69c: bd 6d 04  
            and #$04           ; $f69f: 29 04     
            bne __f6f0         ; $f6a1: d0 4d     
            ldy $0488,x        ; $f6a3: bc 88 04  
__f6a6:     lda $7128,y        ; $f6a6: b9 28 71  
            sta $0a            ; $f6a9: 85 0a     
            lda #$00           ; $f6ab: a9 00     
            sta $00            ; $f6ad: 85 00     
            lda $7100,y        ; $f6af: b9 00 71  
            bpl __f6b6         ; $f6b2: 10 02     
            dec $00            ; $f6b4: c6 00     
__f6b6:     clc                ; $f6b6: 18        
            adc $28,x          ; $f6b7: 75 28     
            sta $06            ; $f6b9: 85 06     
            lda $14,x          ; $f6bb: b5 14     
            adc $00            ; $f6bd: 65 00     
            sta $02            ; $f6bf: 85 02     
            lda $ec            ; $f6c1: a5 ec     
            bne __f6c7         ; $f6c3: d0 02     
            sta $02            ; $f6c5: 85 02     
__f6c7:     lda $713c,y        ; $f6c7: b9 3c 71  
            sta $0c            ; $f6ca: 85 0c     
            lda #$00           ; $f6cc: a9 00     
            sta $00            ; $f6ce: 85 00     
            lda $7114,y        ; $f6d0: b9 14 71  
            bpl __f6d7         ; $f6d3: 10 02     
            dec $00            ; $f6d5: c6 00     
__f6d7:     clc                ; $f6d7: 18        
            adc $32,x          ; $f6d8: 75 32     
__f6da:     sta $08            ; $f6da: 85 08     
            lda $1e,x          ; $f6dc: b5 1e     
            adc $00            ; $f6de: 65 00     
            sta $04            ; $f6e0: 85 04     
            jsr __bdc5         ; $f6e2: 20 c5 bd  
__f6e5:     bcs __f6f0         ; $f6e5: b0 09     
            lda $0b            ; $f6e7: a5 0b     
            pha                ; $f6e9: 48        
            jsr __b6f9         ; $f6ea: 20 f9 b6  
            pla                ; $f6ed: 68        
            sta $0b            ; $f6ee: 85 0b     
__f6f0:     dex                ; $f6f0: ca        
            bmi __f6f6         ; $f6f1: 30 03     
            jmp __b63b         ; $f6f3: 4c 3b b6  

;-------------------------------------------------------------------------------
__f6f6:     ldx $12            ; $f6f6: a6 12     
__f6f8:     rts                ; $f6f8: 60        

;-------------------------------------------------------------------------------
            txa                ; $f6f9: 8a        
            bne __f707         ; $f6fa: d0 0b     
            lda $9c            ; $f6fc: a5 9c     
            beq __f707         ; $f6fe: f0 07     
            lda $042d          ; $f700: ad 2d 04  
            cmp $12            ; $f703: c5 12     
            beq __f6f8         ; $f705: f0 f1     
__f707:     ldy $12            ; $f707: a4 12     
            lda $0090,y        ; $f709: b9 90 00  
            tay                ; $f70c: a8        
            lda $71d1,y        ; $f70d: b9 d1 71  
            jsr __e125         ; $f710: 20 25 e1  
            .hex 61            ; $f713: 61        Suspected data
__f714:     .hex b7 5c         ; $f714: b7 5c     Invalid Opcode - LAX $5c,y
            lda __b8d1,y       ; $f716: b9 d1 b8  
            lsr $b9,x          ; $f719: 56 b9     
            ora __8ab7,x       ; $f71b: 1d b7 8a  
            bne __f760         ; $f71e: d0 40     
            lda $f5            ; $f720: a5 f5     
            and #$08           ; $f722: 29 08     
            beq __f760         ; $f724: f0 3a     
            lda $5a            ; $f726: a5 5a     
            and #$04           ; $f728: 29 04     
            beq __f760         ; $f72a: f0 34     
            lda $0426          ; $f72c: ad 26 04  
            cmp #$fa           ; $f72f: c9 fa     
            bcs __f760         ; $f731: b0 2d     
            lda $04bd          ; $f733: ad bd 04  
            ora $04b3          ; $f736: 0d b3 04  
            bne __f760         ; $f739: d0 25     
            lda $9c            ; $f73b: a5 9c     
            beq __f749         ; $f73d: f0 0a     
            ldy $042d          ; $f73f: ac 2d 04  
            lda $0090,y        ; $f742: b9 90 00  
            cmp #$3d           ; $f745: c9 3d     
            bne __f760         ; $f747: d0 17     
__f749:     ldy $12            ; $f749: a4 12     
            lda $0029,y        ; $f74b: b9 29 00  
            sta $28            ; $f74e: 85 28     
            lda $0015,y        ; $f750: b9 15 00  
            sta $14            ; $f753: 85 14     
            jsr __bd0f         ; $f755: 20 0f bd  
            lda #$04           ; $f758: a9 04     
            sta $0534          ; $f75a: 8d 34 05  
            jmp __bbf4         ; $f75d: 4c f4 bb  

;-------------------------------------------------------------------------------
__f760:     rts                ; $f760: 60        

;-------------------------------------------------------------------------------
            ldy $12            ; $f761: a4 12     
            txa                ; $f763: 8a        
            beq __f6e5         ; $f764: f0 7f     
            lda $045c,y        ; $f766: b9 5c 04  
            ora $045b,x        ; $f769: 1d 5b 04  
            bne __f760         ; $f76c: d0 f2     
            lda $042f,y        ; $f76e: b9 2f 04  
            bne __f792         ; $f771: d0 1f     
            lda $0051,y        ; $f773: b9 51 00  
            cmp #$04           ; $f776: c9 04     
            beq __f792         ; $f778: f0 18     
            txa                ; $f77a: 8a        
            tay                ; $f77b: a8        
            dey                ; $f77c: 88        
            ldx $12            ; $f77d: a6 12     
            inx                ; $f77f: e8        
            lda $0051,y        ; $f780: b9 51 00  
            cmp #$04           ; $f783: c9 04     
            beq __f792         ; $f785: f0 0b     
            lda $042f,y        ; $f787: b9 2f 04  
            beq __f7e0         ; $f78a: f0 54     
            lda $5a,x          ; $f78c: b5 5a     
            and #$10           ; $f78e: 29 10     
            bne __f7e0         ; $f790: d0 4e     
__f792:     lda $0453,y        ; $f792: b9 53 04  
            ora $045c,y        ; $f795: 19 5c 04  
            bne __f7d7         ; $f798: d0 3d     
            lda $046e,y        ; $f79a: b9 6e 04  
            and #$08           ; $f79d: 29 08     
            beq __f7a4         ; $f79f: f0 03     
            jsr __ba7d         ; $f7a1: 20 7d ba  
__f7a4:     lda $0465,y        ; $f7a4: b9 65 04  
            sec                ; $f7a7: 38        
            sbc #$01           ; $f7a8: e9 01     
            sta $0465,y        ; $f7aa: 99 65 04  
            bmi __f7bd         ; $f7ad: 30 0e     
            jsr __ba7d         ; $f7af: 20 7d ba  
            lda #$21           ; $f7b2: a9 21     
            sta $045c,y        ; $f7b4: 99 5c 04  
            lsr                ; $f7b7: 4a        
            sta $0438,y        ; $f7b8: 99 38 04  
            bne __f7d7         ; $f7bb: d0 1a     
__f7bd:     lda $005b,y        ; $f7bd: b9 5b 00  
            ora #$10           ; $f7c0: 09 10     
            sta $005b,y        ; $f7c2: 99 5b 00  
            lda #$e0           ; $f7c5: a9 e0     
            sta $0047,y        ; $f7c7: 99 47 00  
            lda $003d,y        ; $f7ca: b9 3d 00  
            sta $00            ; $f7cd: 85 00     
            asl                ; $f7cf: 0a        
            ror $00            ; $f7d0: 66 00     
            lda $00            ; $f7d2: a5 00     
            sta $003d,y        ; $f7d4: 99 3d 00  
__f7d7:     lda $8f,x          ; $f7d7: b5 8f     
            cmp #$32           ; $f7d9: c9 32     
            bcs __f7e0         ; $f7db: b0 03     
            jsr __ba5d         ; $f7dd: 20 5d ba  
__f7e0:     ldx $ed            ; $f7e0: a6 ed     
            rts                ; $f7e2: 60        

;-------------------------------------------------------------------------------
            sed                ; $f7e3: f8        
            php                ; $f7e4: 08        
            lda $ee            ; $f7e5: a5 ee     
            and #$08           ; $f7e7: 29 08     
__f7e9:     bne __f828         ; $f7e9: d0 3d     
            .hex b9 90         ; $f7eb: b9 90     Suspected data
__f7ed:     brk                ; $f7ed: 00        
            bne __f80c         ; $f7ee: d0 1c     
            sta $0051,y        ; $f7f0: 99 51 00  
            lda #$04           ; $f7f3: a9 04     
            sta $0602          ; $f7f5: 8d 02 06  
            ldy $04c3          ; $f7f8: ac c3 04  
            lda $04c2          ; $f7fb: ad c2 04  
            clc                ; $f7fe: 18        
            adc #$10           ; $f7ff: 69 10     
            sta $04c2          ; $f801: 8d c2 04  
            cmp __f222,y       ; $f804: d9 22 f2  
            bcc __f828         ; $f807: 90 1f     
            jmp __f218         ; $f809: 4c 18 f2  

;-------------------------------------------------------------------------------
__f80c:     cmp #$17           ; $f80c: c9 17     
            bne __f815         ; $f80e: d0 05     
            ldy $05bc          ; $f810: ac bc 05  
            .hex d0            ; $f813: d0        Suspected data
__f814:     .hex 13            ; $f814: 13        Suspected data
__f815:     cmp #$45           ; $f815: c9 45     
            bne __f829         ; $f817: d0 10     
            lda #$3f           ; $f819: a9 3f     
            sta $04e0          ; $f81b: 8d e0 04  
            lda #$10           ; $f81e: a9 10     
            sta $0600          ; $f820: 8d 00 06  
            lda #$00           ; $f823: a9 00     
            sta $0051,y        ; $f825: 99 51 00  
__f828:     rts                ; $f828: 60        

;-------------------------------------------------------------------------------
__f829:     cmp #$28           ; $f829: c9 28     
            bne __f844         ; $f82b: d0 17     
            lda $0079,y        ; $f82d: b9 79 00  
            cmp #$dc           ; $f830: c9 dc     
            bcs __f843         ; $f832: b0 0f     
            lda $04e0          ; $f834: ad e0 04  
            beq __f87d         ; $f837: f0 44     
            lda #$dc           ; $f839: a9 dc     
            sta $0079,y        ; $f83b: 99 79 00  
            lda #$00           ; $f83e: a9 00     
            sta $0047,y        ; $f840: 99 47 00  
__f843:     rts                ; $f843: 60        

;-------------------------------------------------------------------------------
__f844:     cmp #$2c           ; $f844: c9 2c     
            bne __f84c         ; $f846: d0 04     
            lda $b1,x          ; $f848: b5 b1     
            bne __f843         ; $f84a: d0 f7     
__f84c:     ldy $04e0          ; $f84c: ac e0 04  
            beq __f87d         ; $f84f: f0 2c     
            ldx $12            ; $f851: a6 12     
            cmp #$27           ; $f853: c9 27     
            beq __f85b         ; $f855: f0 04     
            cmp #$20           ; $f857: c9 20     
            bne __f866         ; $f859: d0 0b     
__f85b:     lda #$00           ; $f85b: a9 00     
            sta $046e,x        ; $f85d: 9d 6e 04  
            jsr __98a6         ; $f860: 20 a6 98  
            jmp __b878         ; $f863: 4c 78 b8  

;-------------------------------------------------------------------------------
__f866:     jsr __9e3b         ; $f866: 20 3b 9e  
            lda __b7e3,y       ; $f869: b9 e3 b7  
            sta $3d,x          ; $f86c: 95 3d     
            lda #$e0           ; $f86e: a9 e0     
            sta $47,x          ; $f870: 95 47     
            lda $5b,x          ; $f872: b5 5b     
            ora #$10           ; $f874: 09 10     
            sta $5b,x          ; $f876: 95 5b     
            ldx $ed            ; $f878: a6 ed     
            ldy $12            ; $f87a: a4 12     
            rts                ; $f87c: 60        

;-------------------------------------------------------------------------------
__f87d:     ldy $12            ; $f87d: a4 12     
            lda $0051,y        ; $f87f: b9 51 00  
            cmp #$04           ; $f882: c9 04     
            beq __f896         ; $f884: f0 10     
            lda $046e,y        ; $f886: b9 6e 04  
            and #$01           ; $f889: 29 01     
            bne __f896         ; $f88b: d0 09     
            jsr __ba95         ; $f88d: 20 95 ba  
            lda $0f            ; $f890: a5 0f     
            and #$0b           ; $f892: 29 0b     
            beq __f899         ; $f894: f0 03     
__f896:     jmp __b9fa         ; $f896: 4c fa b9  

;-------------------------------------------------------------------------------
__f899:     lda #$00           ; $f899: a9 00     
            sta $99            ; $f89b: 85 99     
            ldx $12            ; $f89d: a6 12     
            lda $5b,x          ; $f89f: b5 5b     
            ora #$20           ; $f8a1: 09 20     
            sta $5b,x          ; $f8a3: 95 5b     
            lda $046e,x        ; $f8a5: bd 6e 04  
            and #$02           ; $f8a8: 29 02     
            bne __f8ce         ; $f8aa: d0 22     
            bit $f5            ; $f8ac: 24 f5     
            bvc __f8ce         ; $f8ae: 50 1e     
            lda $9c            ; $f8b0: a5 9c     
            ora $9a            ; $f8b2: 05 9a     
            bne __f8ce         ; $f8b4: d0 18     
            sta $5b,x          ; $f8b6: 95 5b     
            stx $042d          ; $f8b8: 8e 2d 04  
            sta $044a,x        ; $f8bb: 9d 4a 04  
            lda #$07           ; $f8be: a9 07     
            sta $a8,x          ; $f8c0: 95 a8     
            jsr __bc1f         ; $f8c2: 20 1f bc  
            lda $90,x          ; $f8c5: b5 90     
            cmp #$12           ; $f8c7: c9 12     
            bne __f8ce         ; $f8c9: d0 03     
            jsr __a440         ; $f8cb: 20 40 a4  
__f8ce:     ldx $ed            ; $f8ce: a6 ed     
            rts                ; $f8d0: 60        

;-------------------------------------------------------------------------------
            ldy $12            ; $f8d1: a4 12     
            txa                ; $f8d3: 8a        
            beq __f905         ; $f8d4: f0 2f     
            lda $0090,y        ; $f8d6: b9 90 00  
            cmp #$3d           ; $f8d9: c9 3d     
            bne __f8e4         ; $f8db: d0 07     
            lda $005b,y        ; $f8dd: b9 5b 00  
            and #$04           ; $f8e0: 29 04     
            bne __f902         ; $f8e2: d0 1e     
__f8e4:     lda $042f,y        ; $f8e4: b9 2f 04  
            bne __f8ff         ; $f8e7: d0 16     
            jsr __ba95         ; $f8e9: 20 95 ba  
            lda $0f            ; $f8ec: a5 0f     
            and $6e,x          ; $f8ee: 35 6e     
            .hex f0            ; $f8f0: f0        Suspected data
__f8f1:     asl $ca            ; $f8f1: 06 ca     
            jsr __9ea9         ; $f8f3: 20 a9 9e  
            ldx $ed            ; $f8f6: a6 ed     
            jsr __bb31         ; $f8f8: 20 31 bb  
            cpy #$00           ; $f8fb: c0 00     
            beq __f902         ; $f8fd: f0 03     
__f8ff:     jmp __b9ea         ; $f8ff: 4c ea b9  

;-------------------------------------------------------------------------------
__f902:     rts                ; $f902: 60        

;-------------------------------------------------------------------------------
            php                ; $f903: 08        
            .hex 04            ; $f904: 04        Suspected data
__f905:     lda $005b,y        ; $f905: b9 5b 00  
            ora #$40           ; $f908: 09 40     
            sta $005b,y        ; $f90a: 99 5b 00  
            jsr __ba95         ; $f90d: 20 95 ba  
            lda $0f            ; $f910: a5 0f     
            and $6e            ; $f912: 25 6e     
            beq __f919         ; $f914: f0 03     
            jsr __bc03         ; $f916: 20 03 bc  
__f919:     lda $0f            ; $f919: a5 0f     
            and #$04           ; $f91b: 29 04     
            beq __f922         ; $f91d: f0 03     
            jsr __b899         ; $f91f: 20 99 b8  
__f922:     jsr __bb31         ; $f922: 20 31 bb  
            cpy #$01           ; $f925: c0 01     
            bne __f955         ; $f927: d0 2c     
            ldy $12            ; $f929: a4 12     
            lda $0047,y        ; $f92b: b9 47 00  
            beq __f955         ; $f92e: f0 25     
            and #$80           ; $f930: 29 80     
            asl                ; $f932: 0a        
            rol                ; $f933: 2a        
            tay                ; $f934: a8        
            lda $0f            ; $f935: a5 0f     
            and __b903,y       ; $f937: 39 03 b9  
            beq __f955         ; $f93a: f0 19     
            ldy $12            ; $f93c: a4 12     
            lda $0047,y        ; $f93e: b9 47 00  
            eor #$ff           ; $f941: 49 ff     
            clc                ; $f943: 18        
            adc #$01           ; $f944: 69 01     
            sta $0047,y        ; $f946: 99 47 00  
            lda #$01           ; $f949: a9 01     
            sta $9a            ; $f94b: 85 9a     
            lda #$04           ; $f94d: a9 04     
            sta $c7            ; $f94f: 85 c7     
            lda #$10           ; $f951: a9 10     
            sta $82            ; $f953: 85 82     
__f955:     rts                ; $f955: 60        

;-------------------------------------------------------------------------------
            txa                ; $f956: 8a        
            beq __f955         ; $f957: f0 fc     
            jmp __b9ea         ; $f959: 4c ea b9  

;-------------------------------------------------------------------------------
            ldy $12            ; $f95c: a4 12     
            txa                ; $f95e: 8a        
            bne __f993         ; $f95f: d0 32     
            lda $0051,y        ; $f961: b9 51 00  
            cmp #$04           ; $f964: c9 04     
            bne __f96e         ; $f966: d0 06     
            lda $04e0          ; $f968: ad e0 04  
            beq __f990         ; $f96b: f0 23     
__f96d:     rts                ; $f96d: 60        

;-------------------------------------------------------------------------------
__f96e:     jsr __ba95         ; $f96e: 20 95 ba  
            lda $0f            ; $f971: a5 0f     
            and #$08           ; $f973: 29 08     
            beq __f987         ; $f975: f0 10     
            lda $9c            ; $f977: a5 9c     
            bne __f96d         ; $f979: d0 f2     
            ldy $12            ; $f97b: a4 12     
            sty $042d          ; $f97d: 8c 2d 04  
            lda #$01           ; $f980: a9 01     
            sta $00a8,y        ; $f982: 99 a8 00  
            inc $9c            ; $f985: e6 9c     
__f987:     lda $0f            ; $f987: a5 0f     
            and #$04           ; $f989: 29 04     
            beq __f96d         ; $f98b: f0 e0     
            jmp __b899         ; $f98d: 4c 99 b8  

;-------------------------------------------------------------------------------
__f990:     jmp __b9fa         ; $f990: 4c fa b9  

;-------------------------------------------------------------------------------
__f993:     lda $8f,x          ; $f993: b5 8f     
            cmp #$2c           ; $f995: c9 2c     
            bne __f9b7         ; $f997: d0 1e     
            lda $85,x          ; $f999: b5 85     
            beq __f9f9         ; $f99b: f0 5c     
            lda #$00           ; $f99d: a9 00     
            sta $0051,y        ; $f99f: 99 51 00  
            jsr __ba5d         ; $f9a2: 20 5d ba  
            lda #$60           ; $f9a5: a9 60     
            sta $045b,x        ; $f9a7: 9d 5b 04  
            lsr                ; $f9aa: 4a        
            sta $0437,x        ; $f9ab: 9d 37 04  
            lda $0464,x        ; $f9ae: bd 64 04  
            bne __f9b6         ; $f9b1: d0 03     
            inc $04fa          ; $f9b3: ee fa 04  
__f9b6:     rts                ; $f9b6: 60        

;-------------------------------------------------------------------------------
__f9b7:     cmp #$32           ; $f9b7: c9 32     
            bcs __f9b6         ; $f9b9: b0 fb     
            cmp #$11           ; $f9bb: c9 11     
            bne __f9ca         ; $f9bd: d0 0b     
            lda #$05           ; $f9bf: a9 05     
            sta $0051,y        ; $f9c1: 99 51 00  
            lda #$1e           ; $f9c4: a9 1e     
            sta $0086,y        ; $f9c6: 99 86 00  
            rts                ; $f9c9: 60        

;-------------------------------------------------------------------------------
__f9ca:     lda $0051,y        ; $f9ca: b9 51 00  
            cmp #$04           ; $f9cd: c9 04     
            beq __f9ec         ; $f9cf: f0 1b     
            lda $0090,y        ; $f9d1: b9 90 00  
            cmp #$35           ; $f9d4: c9 35     
            beq __f9ea         ; $f9d6: f0 12     
            lda #$e8           ; $f9d8: a9 e8     
            sta $0047,y        ; $f9da: 99 47 00  
            stx $00            ; $f9dd: 86 00     
            ldx $3d,y          ; $f9df: b6 3d     
            bmi __f9e5         ; $f9e1: 30 02     
            lda #$18           ; $f9e3: a9 18     
__f9e5:     sta $003d,y        ; $f9e5: 99 3d 00  
            ldx $00            ; $f9e8: a6 00     
__f9ea:     ldy $12            ; $f9ea: a4 12     
__f9ec:     jsr __ba5d         ; $f9ec: 20 5d ba  
            bne __f9f9         ; $f9ef: d0 08     
            lda $3c,x          ; $f9f1: b5 3c     
            asl                ; $f9f3: 0a        
            ror $3c,x          ; $f9f4: 76 3c     
            asl                ; $f9f6: 0a        
            .hex 76            ; $f9f7: 76        Suspected data
__f9f8:     .hex 3c            ; $f9f8: 3c        Suspected data
__f9f9:     rts                ; $f9f9: 60        

;-------------------------------------------------------------------------------
            lda $85            ; $f9fa: a5 85     
            bne __fa31         ; $f9fc: d0 33     
            lda $04c2          ; $f9fe: ad c2 04  
            sec                ; $fa01: 38        
            sbc #$10           ; $fa02: e9 10     
            bcc __fa32         ; $fa04: 90 2c     
            sta $04c2          ; $fa06: 8d c2 04  
            ldy #$7f           ; $fa09: a0 7f     
            sty $85            ; $fa0b: 84 85     
            ldy #$00           ; $fa0d: a0 00     
            sty $46            ; $fa0f: 84 46     
            sty $3c            ; $fa11: 84 3c     
            cmp #$10           ; $fa13: c9 10     
            bcc __fa2c         ; $fa15: 90 15     
            lda $0428          ; $fa17: ad 28 04  
            sec                ; $fa1a: 38        
            sbc $0429          ; $fa1b: ed 29 04  
            asl                ; $fa1e: 0a        
            asl                ; $fa1f: 0a        
__fa20:     sta $3c            ; $fa20: 85 3c     
            lda #$c0           ; $fa22: a9 c0     
            ldy $46            ; $fa24: a4 46     
            bpl __fa2a         ; $fa26: 10 02     
            lda #$00           ; $fa28: a9 00     
__fa2a:     sta $46            ; $fa2a: 85 46     
__fa2c:     lda #$04           ; $fa2c: a9 04     
            sta $0601          ; $fa2e: 8d 01 06  
__fa31:     rts                ; $fa31: 60        

;-------------------------------------------------------------------------------
__fa32:     txa                ; $fa32: 8a        
            pha                ; $fa33: 48        
            ldx $12            ; $fa34: a6 12     
            lda $90,x          ; $fa36: b5 90     
            cmp #$0f           ; $fa38: c9 0f     
            bcs __fa48         ; $fa3a: b0 0c     
            jsr __9e3b         ; $fa3c: 20 3b 9e  
            iny                ; $fa3f: c8        
            tya                ; $fa40: 98        
            cmp $6f,x          ; $fa41: d5 6f     
            beq __fa48         ; $fa43: f0 03     
            jsr __9ea9         ; $fa45: 20 a9 9e  
__fa48:     pla                ; $fa48: 68        
            tax                ; $fa49: aa        
            lda #$c0           ; $fa4a: a9 c0     
            sta $46            ; $fa4c: 85 46     
            lda #$20           ; $fa4e: a9 20     
            sta $82            ; $fa50: 85 82     
            ldy $12            ; $fa52: a4 12     
            bmi __fa5a         ; $fa54: 30 04     
            lsr                ; $fa56: 4a        
            sta $0438,y        ; $fa57: 99 38 04  
__fa5a:     jmp __f714         ; $fa5a: 4c 14 f7  

;-------------------------------------------------------------------------------
            lda $0452,x        ; $fa5d: bd 52 04  
            ora $045b,x        ; $fa60: 1d 5b 04  
            bne __fa94         ; $fa63: d0 2f     
            lda $046d,x        ; $fa65: bd 6d 04  
            and #$08           ; $fa68: 29 08     
            beq __fa6f         ; $fa6a: f0 03     
            jsr __ba7d         ; $fa6c: 20 7d ba  
__fa6f:     dec $0464,x        ; $fa6f: de 64 04  
            bmi __fa83         ; $fa72: 30 0f     
            lda #$21           ; $fa74: a9 21     
            sta $045b,x        ; $fa76: 9d 5b 04  
            lsr                ; $fa79: 4a        
            sta $0437,x        ; $fa7a: 9d 37 04  
            lda #$40           ; $fa7d: a9 40     
            sta $0601          ; $fa7f: 8d 01 06  
            rts                ; $fa82: 60        

;-------------------------------------------------------------------------------
__fa83:     lda $5a,x          ; $fa83: b5 5a     
            ora #$10           ; $fa85: 09 10     
            sta $5a,x          ; $fa87: 95 5a     
            lda #$e0           ; $fa89: a9 e0     
            sta $46,x          ; $fa8b: 95 46     
            lda $003d,y        ; $fa8d: b9 3d 00  
            sta $3c,x          ; $fa90: 95 3c     
            lda #$00           ; $fa92: a9 00     
__fa94:     rts                ; $fa94: 60        

;-------------------------------------------------------------------------------
            lda #$00           ; $fa95: a9 00     
            sta $0f            ; $fa97: 85 0f     
            ldy $12            ; $fa99: a4 12     
            lda $0427          ; $fa9b: ad 27 04  
__fa9e:     cmp #$f6           ; $fa9e: c9 f6     
            bcs __fac2         ; $faa0: b0 20     
            lda $0029,y        ; $faa2: b9 29 00  
            ldy #$02           ; $faa5: a0 02     
            cmp $28,x          ; $faa7: d5 28     
            bmi __faad         ; $faa9: 30 02     
            ldy #$01           ; $faab: a0 01     
__faad:     sty $0f            ; $faad: 84 0f     
            tya                ; $faaf: 98        
            and $6e,x          ; $fab0: 35 6e     
            beq __fac1         ; $fab2: f0 0d     
            ldy $12            ; $fab4: a4 12     
            lda $04a4,y        ; $fab6: b9 a4 04  
            bne __fac1         ; $fab9: d0 06     
            lda $003d,y        ; $fabb: b9 3d 00  
            sta $04cb,x        ; $fabe: 9d cb 04  
__fac1:     rts                ; $fac1: 60        

;-------------------------------------------------------------------------------
__fac2:     lda $0033,y        ; $fac2: b9 33 00  
            cpx #$01           ; $fac5: e0 01     
            bcs __fad1         ; $fac7: b0 08     
            pha                ; $fac9: 48        
            ldy $9a            ; $faca: a4 9a     
            pla                ; $facc: 68        
            sec                ; $facd: 38        
            sbc __bb2f,y       ; $face: f9 2f bb  
__fad1:     cmp $32,x          ; $fad1: d5 32     
            bmi __fb02         ; $fad3: 30 2d     
            lda $46,x          ; $fad5: b5 46     
            bmi __fb2e         ; $fad7: 30 55     
            ldy $12            ; $fad9: a4 12     
            lda $04a4,y        ; $fadb: b9 a4 04  
            bne __fae6         ; $fade: d0 06     
            lda $003d,y        ; $fae0: b9 3d 00  
            sta $04cb,x        ; $fae3: 9d cb 04  
__fae6:     ldy #$00           ; $fae6: a0 00     
            inc $0427          ; $fae8: ee 27 04  
            inc $0427          ; $faeb: ee 27 04  
            bpl __faf1         ; $faee: 10 01     
            dey                ; $faf0: 88        
__faf1:     lda $0427          ; $faf1: ad 27 04  
            clc                ; $faf4: 18        
            adc $32,x          ; $faf5: 75 32     
            sta $32,x          ; $faf7: 95 32     
            tya                ; $faf9: 98        
            adc $1e,x          ; $fafa: 75 1e     
            sta $1e,x          ; $fafc: 95 1e     
__fafe:     ldy #$04           ; $fafe: a0 04     
            bne __fb13         ; $fb00: d0 11     
__fb02:     lda $46,x          ; $fb02: b5 46     
            beq __fb11         ; $fb04: f0 0b     
            bpl __fb2e         ; $fb06: 10 26     
            ldy $12            ; $fb08: a4 12     
            lda $0090,y        ; $fb0a: b9 90 00  
            cmp #$36           ; $fb0d: c9 36     
__fb0f:     beq __fb2e         ; $fb0f: f0 1d     
__fb11:     ldy #$08           ; $fb11: a0 08     
__fb13:     sty $0f            ; $fb13: 84 0f     
            ldy $12            ; $fb15: a4 12     
            lda $04a4,y        ; $fb17: b9 a4 04  
            bne __fb22         ; $fb1a: d0 06     
            lda $0047,y        ; $fb1c: b9 47 00  
            sta $04d5,x        ; $fb1f: 9d d5 04  
__fb22:     lda #$00           ; $fb22: a9 00     
            sta $46,x          ; $fb24: 95 46     
            lda $0412,y        ; $fb26: b9 12 04  
            sta $0411,x        ; $fb29: 9d 11 04  
            inc $9e,x          ; $fb2c: f6 9e     
__fb2e:     rts                ; $fb2e: 60        

;-------------------------------------------------------------------------------
            .hex 0b 10         ; $fb2f: 0b 10     Invalid Opcode - ANC #$10
            ldy #$00           ; $fb31: a0 00     
            lda $5a,x          ; $fb33: b5 5a     
            ora $0f            ; $fb35: 05 0f     
            and #$0c           ; $fb37: 29 0c     
            cmp #$0c           ; $fb39: c9 0c     
            beq __fb48         ; $fb3b: f0 0b     
            lda $5a,x          ; $fb3d: b5 5a     
            ora $0f            ; $fb3f: 05 0f     
            and #$03           ; $fb41: 29 03     
            cmp #$03           ; $fb43: c9 03     
            bne __fb49         ; $fb45: d0 02     
            iny                ; $fb47: c8        
__fb48:     iny                ; $fb48: c8        
__fb49:     rts                ; $fb49: 60        

;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $fb4a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fb4d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex c2 d4         ; $fb50: c2 d4     Invalid Opcode - NOP #$d4
            .hex c3 c4         ; $fb52: c3 c4     Invalid Opcode - DCP ($c4,x)
            .hex 07 80         ; $fb54: 07 80     Invalid Opcode - SLO $80
            sta ($94,x)        ; $fb56: 81 94     
            sta $17,x          ; $fb58: 95 17     
            jsr __bb87         ; $fb5a: 20 87 bb  
            lda $00            ; $fb5d: a5 00     
            ldy #$09           ; $fb5f: a0 09     
__fb61:     cmp __bb50,y       ; $fb61: d9 50 bb  
            beq __fb6a         ; $fb64: f0 04     
            dey                ; $fb66: 88        
            bpl __fb61         ; $fb67: 10 f8     
            clc                ; $fb69: 18        
__fb6a:     rts                ; $fb6a: 60        

;-------------------------------------------------------------------------------
            sbc $00ff,y        ; $fb6b: f9 ff 00  
            php                ; $fb6e: 08        
            .hex 0c 18 1a      ; $fb6f: 0c 18 1a  Invalid Opcode - NOP $1a18
            ora ($06,x)        ; $fb72: 01 06     
            asl                ; $fb74: 0a        
            .hex 0c 18 1a      ; $fb75: 0c 18 1a  Invalid Opcode - NOP $1a18
            .hex 1c ff ff      ; $fb78: 1c ff ff  Invalid Opcode - NOP Array,x
            brk                ; $fb7b: 00        
            brk                ; $fb7c: 00        
            brk                ; $fb7d: 00        
            brk                ; $fb7e: 00        
            brk                ; $fb7f: 00        
            brk                ; $fb80: 00        
            brk                ; $fb81: 00        
            brk                ; $fb82: 00        
            brk                ; $fb83: 00        
            brk                ; $fb84: 00        
            brk                ; $fb85: 00        
            brk                ; $fb86: 00        
            txa                ; $fb87: 8a        
            pha                ; $fb88: 48        
            lda #$00           ; $fb89: a9 00     
            sta $00            ; $fb8b: 85 00     
            sta $01            ; $fb8d: 85 01     
            lda __f011,y       ; $fb8f: b9 11 f0  
            bpl __fb96         ; $fb92: 10 02     
            dec $00            ; $fb94: c6 00     
__fb96:     clc                ; $fb96: 18        
            adc $28,x          ; $fb97: 75 28     
            and #$f0           ; $fb99: 29 f0     
            sta $05            ; $fb9b: 85 05     
            php                ; $fb9d: 08        
            lsr                ; $fb9e: 4a        
            lsr                ; $fb9f: 4a        
            lsr                ; $fba0: 4a        
            lsr                ; $fba1: 4a        
            sta $e5            ; $fba2: 85 e5     
            plp                ; $fba4: 28        
            lda $14,x          ; $fba5: b5 14     
            adc $00            ; $fba7: 65 00     
            sta $02            ; $fba9: 85 02     
            sta $03            ; $fbab: 85 03     
            lda $ec            ; $fbad: a5 ec     
            bne __fbb5         ; $fbaf: d0 04     
            sta $02            ; $fbb1: 85 02     
            sta $03            ; $fbb3: 85 03     
__fbb5:     lda __f055,y       ; $fbb5: b9 55 f0  
            bpl __fbbc         ; $fbb8: 10 02     
            dec $01            ; $fbba: c6 01     
__fbbc:     clc                ; $fbbc: 18        
            adc $32,x          ; $fbbd: 75 32     
            and #$f0           ; $fbbf: 29 f0     
            sta $06            ; $fbc1: 85 06     
            sta $e6            ; $fbc3: 85 e6     
            lda $1e,x          ; $fbc5: b5 1e     
            adc $01            ; $fbc7: 65 01     
            sta $01            ; $fbc9: 85 01     
            sta $04            ; $fbcb: 85 04     
            jsr __bc2e         ; $fbcd: 20 2e bc  
            bcc __fbd6         ; $fbd0: 90 04     
            lda #$00           ; $fbd2: a9 00     
            beq __fbdd         ; $fbd4: f0 07     
__fbd6:     jsr __bd29         ; $fbd6: 20 29 bd  
            ldy $e7            ; $fbd9: a4 e7     
            lda ($01),y        ; $fbdb: b1 01     
__fbdd:     .hex 85            ; $fbdd: 85        Suspected data
__fbde:     brk                ; $fbde: 00        
            pla                ; $fbdf: 68        
            tax                ; $fbe0: aa        
            rts                ; $fbe1: 60        

;-------------------------------------------------------------------------------
            pha                ; $fbe2: 48        
            and #$c0           ; $fbe3: 29 c0     
            asl                ; $fbe5: 0a        
            rol                ; $fbe6: 2a        
            rol                ; $fbe7: 2a        
            adc __bbf1,y       ; $fbe8: 79 f1 bb  
            tay                ; $fbeb: a8        
            pla                ; $fbec: 68        
            cmp __f64e,y       ; $fbed: d9 4e f6  
            rts                ; $fbf0: 60        

;-------------------------------------------------------------------------------
            brk                ; $fbf1: 00        
            .hex 04 08         ; $fbf2: 04 08     Invalid Opcode - NOP $08
            .hex ee            ; $fbf4: ee        Suspected data
__fbf5:     lda __ee04,x       ; $fbf5: bd 04 ee  
            .hex 1b 04 20      ; $fbf8: 1b 04 20  Invalid Opcode - SLO $2004,y
__fbfb:     eor __a9bd,y       ; $fbfb: 59 bd a9  
            ora ($8d,x)        ; $fbfe: 01 8d     
            ora ($06,x)        ; $fc00: 01 06     
            rts                ; $fc02: 60        

;-------------------------------------------------------------------------------
            .hex a2            ; $fc03: a2        Suspected data
__fc04:     brk                ; $fc04: 00        
            ldy $6e            ; $fc05: a4 6e     
__fc07:     lda $3c            ; $fc07: a5 3c     
            eor __bd56,y       ; $fc09: 59 56 bd  
            bpl __fc10         ; $fc0c: 10 02     
            stx $3c            ; $fc0e: 86 3c     
__fc10:     lda $04cb          ; $fc10: ad cb 04  
            eor __bd56,y       ; $fc13: 59 56 bd  
            bpl __fc1b         ; $fc16: 10 03     
            stx $04cb          ; $fc18: 8e cb 04  
__fc1b:     stx $0407          ; $fc1b: 8e 07 04  
__fc1e:     rts                ; $fc1e: 60        

;-------------------------------------------------------------------------------
            lda #$02           ; $fc1f: a9 02     
            sta $50            ; $fc21: 85 50     
            lda #$06           ; $fc23: a9 06     
            sta $82            ; $fc25: 85 82     
            lda #$08           ; $fc27: a9 08     
            sta $c7            ; $fc29: 85 c7     
            inc $9c            ; $fc2b: e6 9c     
            rts                ; $fc2d: 60        

;-------------------------------------------------------------------------------
            ldy $01            ; $fc2e: a4 01     
            lda $e6            ; $fc30: a5 e6     
            jsr __bd6b         ; $fc32: 20 6b bd  
            sty $01            ; $fc35: 84 01     
            sta $e6            ; $fc37: 85 e6     
            ldy $ec            ; $fc39: a4 ec     
            lda $0001,y        ; $fc3b: b9 01 00  
            sta $e8            ; $fc3e: 85 e8     
            lda $02            ; $fc40: a5 02     
            cmp __bc4e,y       ; $fc42: d9 4e bc  
            bcs __fc4c         ; $fc45: b0 05     
            lda $01            ; $fc47: a5 01     
            cmp __bc4d,y       ; $fc49: d9 4d bc  
__fc4c:     rts                ; $fc4c: 60        

;-------------------------------------------------------------------------------
            asl                ; $fc4d: 0a        
            ora ($0b,x)        ; $fc4e: 01 0b     
            pha                ; $fc50: 48        
            lda $29,x          ; $fc51: b5 29     
            clc                ; $fc53: 18        
            adc #$08           ; $fc54: 69 08     
            php                ; $fc56: 08        
            lsr                ; $fc57: 4a        
            lsr                ; $fc58: 4a        
            lsr                ; $fc59: 4a        
            lsr                ; $fc5a: 4a        
            sta $e5            ; $fc5b: 85 e5     
            plp                ; $fc5d: 28        
            lda $15,x          ; $fc5e: b5 15     
            ldy $ec            ; $fc60: a4 ec     
            beq __fc66         ; $fc62: f0 02     
            adc #$00           ; $fc64: 69 00     
__fc66:     sta $02            ; $fc66: 85 02     
            lda $33,x          ; $fc68: b5 33     
            clc                ; $fc6a: 18        
            adc #$08           ; $fc6b: 69 08     
            and #$f0           ; $fc6d: 29 f0     
            sta $e6            ; $fc6f: 85 e6     
            lda $1f,x          ; $fc71: b5 1f     
            adc #$00           ; $fc73: 69 00     
            sta $01            ; $fc75: 85 01     
            jsr __bc2e         ; $fc77: 20 2e bc  
            pla                ; $fc7a: 68        
            bcs __fc1e         ; $fc7b: b0 a1     
            stx $03            ; $fc7d: 86 03     
            pha                ; $fc7f: 48        
            jsr __bd29         ; $fc80: 20 29 bd  
            pla                ; $fc83: 68        
            ldy $e7            ; $fc84: a4 e7     
            sta ($01),y        ; $fc86: 91 01     
            pha                ; $fc88: 48        
            ldx $0300          ; $fc89: ae 00 03  
            lda #$00           ; $fc8c: a9 00     
            sta $0301,x        ; $fc8e: 9d 01 03  
            tya                ; $fc91: 98        
            and #$f0           ; $fc92: 29 f0     
            asl                ; $fc94: 0a        
            rol $0301,x        ; $fc95: 3e 01 03  
            asl                ; $fc98: 0a        
            rol $0301,x        ; $fc99: 3e 01 03  
            sta $0302,x        ; $fc9c: 9d 02 03  
            tya                ; $fc9f: 98        
            and #$0f           ; $fca0: 29 0f     
            asl                ; $fca2: 0a        
            adc $0302,x        ; $fca3: 7d 02 03  
            sta $0302,x        ; $fca6: 9d 02 03  
            clc                ; $fca9: 18        
            adc #$20           ; $fcaa: 69 20     
            sta $0307,x        ; $fcac: 9d 07 03  
            lda $ec            ; $fcaf: a5 ec     
            asl                ; $fcb1: 0a        
            tay                ; $fcb2: a8        
            lda $01            ; $fcb3: a5 01     
            and #$10           ; $fcb5: 29 10     
            bne __fcba         ; $fcb7: d0 01     
            iny                ; $fcb9: c8        
__fcba:     lda __bd0b,y       ; $fcba: b9 0b bd  
            clc                ; $fcbd: 18        
            .hex 7d            ; $fcbe: 7d        Suspected data
__fcbf:     ora ($03,x)        ; $fcbf: 01 03     
            sta $0301,x        ; $fcc1: 9d 01 03  
            sta $0306,x        ; $fcc4: 9d 06 03  
            lda #$02           ; $fcc7: a9 02     
            sta $0303,x        ; $fcc9: 9d 03 03  
            sta $0308,x        ; $fccc: 9d 08 03  
            pla                ; $fccf: 68        
            pha                ; $fcd0: 48        
            and #$c0           ; $fcd1: 29 c0     
            asl                ; $fcd3: 0a        
            rol                ; $fcd4: 2a        
            rol                ; $fcd5: 2a        
            tay                ; $fcd6: a8        
            lda __f7e9,y       ; $fcd7: b9 e9 f7  
            sta $00            ; $fcda: 85 00     
            .hex b9            ; $fcdc: b9        Suspected data
__fcdd:     sbc __85f7         ; $fcdd: ed f7 85  
            ora ($68,x)        ; $fce0: 01 68     
            asl                ; $fce2: 0a        
            asl                ; $fce3: 0a        
            tay                ; $fce4: a8        
            lda ($00),y        ; $fce5: b1 00     
            sta $0304,x        ; $fce7: 9d 04 03  
            iny                ; $fcea: c8        
            lda ($00),y        ; $fceb: b1 00     
            sta $0305,x        ; $fced: 9d 05 03  
            iny                ; $fcf0: c8        
            lda ($00),y        ; $fcf1: b1 00     
            sta $0309,x        ; $fcf3: 9d 09 03  
            iny                ; $fcf6: c8        
            lda ($00),y        ; $fcf7: b1 00     
            .hex 9d 0a         ; $fcf9: 9d 0a     Suspected data
__fcfb:     .hex 03            ; $fcfb: 03        Suspected data
__fcfc:     lda #$00           ; $fcfc: a9 00     
            sta $030b,x        ; $fcfe: 9d 0b 03  
            txa                ; $fd01: 8a        
            clc                ; $fd02: 18        
            adc #$0a           ; $fd03: 69 0a     
            sta $0300          ; $fd05: 8d 00 03  
            ldx $03            ; $fd08: a6 03     
            rts                ; $fd0a: 60        

;-------------------------------------------------------------------------------
            jsr $2028          ; $fd0b: 20 28 20  
            bit $ad            ; $fd0e: 24 ad     
            plp                ; $fd10: 28        
            asl $d0            ; $fd11: 06 d0     
            .hex 14 a5         ; $fd13: 14 a5     Invalid Opcode - NOP $a5,x
            .hex 14 8d         ; $fd15: 14 8d     Invalid Opcode - NOP $8d,x
            .hex 0f 05         ; $fd17: 0f 05     Suspected data
__fd19:     lda $28            ; $fd19: a5 28     
            sta $0511          ; $fd1b: 8d 11 05  
            lda $1e            ; $fd1e: a5 1e     
__fd20:     sta $0510          ; $fd20: 8d 10 05  
            lda $32            ; $fd23: a5 32     
            sta $0512          ; $fd25: 8d 12 05  
            rts                ; $fd28: 60        

;-------------------------------------------------------------------------------
            ldx $e8            ; $fd29: a6 e8     
            jsr __bd4c         ; $fd2b: 20 4c bd  
            lda $e6            ; $fd2e: a5 e6     
            clc                ; $fd30: 18        
            adc $e5            ; $fd31: 65 e5     
            sta $e7            ; $fd33: 85 e7     
            rts                ; $fd35: 60        

;-------------------------------------------------------------------------------
            brk                ; $fd36: 00        
            beq __fd19         ; $fd37: f0 e0     
            bne __fcfb         ; $fd39: d0 c0     
            bcs __fcdd         ; $fd3b: b0 a0     
            bcc __fcbf         ; $fd3d: 90 80     
            bvs __fd41         ; $fd3f: 70 00     
__fd41:     rts                ; $fd41: 60        

;-------------------------------------------------------------------------------
            rts                ; $fd42: 60        

;-------------------------------------------------------------------------------
            adc ($62,x)        ; $fd43: 61 62     
            .hex 63 64         ; $fd45: 63 64     Invalid Opcode - RRA ($64,x)
            adc $66            ; $fd47: 65 66     
            .hex 67 68         ; $fd49: 67 68     Invalid Opcode - RRA $68
            .hex 07 bd         ; $fd4b: 07 bd     Invalid Opcode - SLO $bd
            rol $bd,x          ; $fd4d: 36 bd     
            sta $01            ; $fd4f: 85 01     
            lda __bd41,x       ; $fd51: bd 41 bd  
            sta $02            ; $fd54: 85 02     
            rts                ; $fd56: 60        

;-------------------------------------------------------------------------------
            .hex 80 00         ; $fd57: 80 00     Invalid Opcode - NOP #$00
            lda $28            ; $fd59: a5 28     
            clc                ; $fd5b: 18        
            adc #$08           ; $fd5c: 69 08     
            and #$f0           ; $fd5e: 29 f0     
            sta $28            ; $fd60: 85 28     
            bcc __fd6a         ; $fd62: 90 06     
            lda $ec            ; $fd64: a5 ec     
            beq __fd6a         ; $fd66: f0 02     
            inc $14            ; $fd68: e6 14     
__fd6a:     rts                ; $fd6a: 60        

;-------------------------------------------------------------------------------
            sta $0f            ; $fd6b: 85 0f     
            tya                ; $fd6d: 98        
            bmi __fd81         ; $fd6e: 30 11     
            asl                ; $fd70: 0a        
            asl                ; $fd71: 0a        
            asl                ; $fd72: 0a        
            asl                ; $fd73: 0a        
            clc                ; $fd74: 18        
            adc $0f            ; $fd75: 65 0f     
            bcs __fd7d         ; $fd77: b0 04     
            cmp #$f0           ; $fd79: c9 f0     
            bcc __fd81         ; $fd7b: 90 04     
__fd7d:     clc                ; $fd7d: 18        
            adc #$10           ; $fd7e: 69 10     
            iny                ; $fd80: c8        
__fd81:     rts                ; $fd81: 60        

;-------------------------------------------------------------------------------
            lda $0005,y        ; $fd82: b9 05 00  
            sec                ; $fd85: 38        
            sbc $0006,y        ; $fd86: f9 06 00  
            bpl __fd91         ; $fd89: 10 06     
            eor #$ff           ; $fd8b: 49 ff     
            clc                ; $fd8d: 18        
            adc #$01           ; $fd8e: 69 01     
            dex                ; $fd90: ca        
__fd91:     sec                ; $fd91: 38        
            sbc $09,x          ; $fd92: f5 09     
            rts                ; $fd94: 60        

;-------------------------------------------------------------------------------
            lda $0005,y        ; $fd95: b9 05 00  
            sec                ; $fd98: 38        
            sbc $0006,y        ; $fd99: f9 06 00  
            sta $0006,y        ; $fd9c: 99 06 00  
            lda $0001,y        ; $fd9f: b9 01 00  
            sbc $0002,y        ; $fda2: f9 02 00  
            bpl __fdb9         ; $fda5: 10 12     
            eor #$ff           ; $fda7: 49 ff     
            pha                ; $fda9: 48        
            lda $0006,y        ; $fdaa: b9 06 00  
            eor #$ff           ; $fdad: 49 ff     
            clc                ; $fdaf: 18        
            adc #$01           ; $fdb0: 69 01     
            sta $0006,y        ; $fdb2: 99 06 00  
            pla                ; $fdb5: 68        
            adc #$00           ; $fdb6: 69 00     
            dex                ; $fdb8: ca        
__fdb9:     cmp #$00           ; $fdb9: c9 00     
            beq __fdbf         ; $fdbb: f0 02     
            sec                ; $fdbd: 38        
            rts                ; $fdbe: 60        

;-------------------------------------------------------------------------------
__fdbf:     lda $0006,y        ; $fdbf: b9 06 00  
            sbc $09,x          ; $fdc2: f5 09     
            rts                ; $fdc4: 60        

;-------------------------------------------------------------------------------
            txa                ; $fdc5: 8a        
            pha                ; $fdc6: 48        
            ldy #$02           ; $fdc7: a0 02     
__fdc9:     tya                ; $fdc9: 98        
            tax                ; $fdca: aa        
            inx                ; $fdcb: e8        
            cpy #$00           ; $fdcc: c0 00     
            bne __fdda         ; $fdce: d0 0a     
            lda $ec            ; $fdd0: a5 ec     
            bne __fdda         ; $fdd2: d0 06     
            jsr __bd82         ; $fdd4: 20 82 bd  
            jmp __bddd         ; $fdd7: 4c dd bd  

;-------------------------------------------------------------------------------
__fdda:     jsr __bd95         ; $fdda: 20 95 bd  
            .hex b0            ; $fddd: b0        Suspected data
__fdde:     ora __9848         ; $fdde: 0d 48 98  
            lsr                ; $fde1: 4a        
            tax                ; $fde2: aa        
            pla                ; $fde3: 68        
            sta $0426,x        ; $fde4: 9d 26 04  
            dey                ; $fde7: 88        
            dey                ; $fde8: 88        
            bpl __fdc9         ; $fde9: 10 de     
            clc                ; $fdeb: 18        
            pla                ; $fdec: 68        
            tax                ; $fded: aa        
            rts                ; $fdee: 60        

;-------------------------------------------------------------------------------
            tsx                ; $fdef: ba        
            tsx                ; $fdf0: ba        
            tsx                ; $fdf1: ba        
            tsx                ; $fdf2: ba        
            clv                ; $fdf3: b8        
            tsx                ; $fdf4: ba        
            tsx                ; $fdf5: ba        
            tsx                ; $fdf6: ba        
            clv                ; $fdf7: b8        
            clv                ; $fdf8: b8        
            tsx                ; $fdf9: ba        
            tsx                ; $fdfa: ba        
            clv                ; $fdfb: b8        
            clv                ; $fdfc: b8        
            clv                ; $fdfd: b8        
            tsx                ; $fdfe: ba        
            clv                ; $fdff: b8        
            clv                ; $fe00: b8        
            clv                ; $fe01: b8        
            clv                ; $fe02: b8        
            brk                ; $fe03: 00        
            .hex 03 00         ; $fe04: 03 00     Invalid Opcode - SLO ($00,x)
            sbc $2a26,x        ; $fe06: fd 26 2a  
            .hex 22            ; $fe09: 22        Invalid Opcode - KIL 
            rol $ad            ; $fe0a: 26 ad     
            dec $04            ; $fe0c: c6 04     
            beq __fe55         ; $fe0e: f0 45     
            dec $04c6          ; $fe10: ce c6 04  
            ldx $0300          ; $fe13: ae 00 03  
            lda #$3f           ; $fe16: a9 3f     
            sta $0301,x        ; $fe18: 9d 01 03  
            lda #$10           ; $fe1b: a9 10     
            sta $0302,x        ; $fe1d: 9d 02 03  
            lda #$04           ; $fe20: a9 04     
            sta $0303,x        ; $fe22: 9d 03 03  
            lda $04bc          ; $fe25: ad bc 04  
            ldy $04c6          ; $fe28: ac c6 04  
            beq __fe34         ; $fe2b: f0 07     
            tya                ; $fe2d: 98        
            and #$03           ; $fe2e: 29 03     
            tay                ; $fe30: a8        
            lda __be07,y       ; $fe31: b9 07 be  
__fe34:     sta $0304,x        ; $fe34: 9d 04 03  
            lda $0638          ; $fe37: ad 38 06  
            sta $0305,x        ; $fe3a: 9d 05 03  
            lda $0639          ; $fe3d: ad 39 06  
            .hex 9d            ; $fe40: 9d        Suspected data
__fe41:     asl $03            ; $fe41: 06 03     
            lda $063a          ; $fe43: ad 3a 06  
            sta $0307,x        ; $fe46: 9d 07 03  
            lda #$00           ; $fe49: a9 00     
            sta $0308,x        ; $fe4b: 9d 08 03  
            txa                ; $fe4e: 8a        
            clc                ; $fe4f: 18        
            adc #$07           ; $fe50: 69 07     
            sta $0300          ; $fe52: 8d 00 03  
__fe55:     lda #$30           ; $fe55: a9 30     
            sta $00            ; $fe57: 85 00     
            jsr __fafe         ; $fe59: 20 fe fa  
            lda $04c2          ; $fe5c: ad c2 04  
            beq __fe67         ; $fe5f: f0 06     
            and #$f0           ; $fe61: 29 f0     
            lsr                ; $fe63: 4a        
            lsr                ; $fe64: 4a        
            adc #$04           ; $fe65: 69 04     
__fe67:     tax                ; $fe67: aa        
            lda #$fe           ; $fe68: a9 fe     
            sta $03            ; $fe6a: 85 03     
__fe6c:     lda __bdef,x       ; $fe6c: bd ef bd  
            sta $0201,y        ; $fe6f: 99 01 02  
            lda #$10           ; $fe72: a9 10     
            sta $0203,y        ; $fe74: 99 03 02  
            lda #$01           ; $fe77: a9 01     
            sta $0202,y        ; $fe79: 99 02 02  
            lda $00            ; $fe7c: a5 00     
            sta $0200,y        ; $fe7e: 99 00 02  
            clc                ; $fe81: 18        
            adc #$10           ; $fe82: 69 10     
            sta $00            ; $fe84: 85 00     
            inx                ; $fe86: e8        
            iny                ; $fe87: c8        
            iny                ; $fe88: c8        
            iny                ; $fe89: c8        
            iny                ; $fe8a: c8        
            inc $03            ; $fe8b: e6 03     
            lda $03            ; $fe8d: a5 03     
            cmp $04c3          ; $fe8f: cd c3 04  
            bne __fe6c         ; $fe92: d0 d8     
            lda $04c4          ; $fe94: ad c4 04  
            beq __feaf         ; $fe97: f0 16     
            dec $04c4          ; $fe99: ce c4 04  
            lsr                ; $fe9c: 4a        
            and #$01           ; $fe9d: 29 01     
            tay                ; $fe9f: a8        
            lda $fc            ; $fea0: a5 fc     
            bpl __fea6         ; $fea2: 10 02     
            iny                ; $fea4: c8        
            iny                ; $fea5: c8        
__fea6:     lda __be03,y       ; $fea6: b9 03 be  
            sta $04c5          ; $fea9: 8d c5 04  
            jmp __9935         ; $feac: 4c 35 99  

;-------------------------------------------------------------------------------
__feaf:     rts                ; $feaf: 60        

;-------------------------------------------------------------------------------
            .hex ff ff ff      ; $feb0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $feb3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $feb6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $feb9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $febc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $febf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fec2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fec5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fec8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fecb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fece: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fed1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fed4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fed7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $feda: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fedd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fee0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fee3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fee6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fee9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $feec: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $feef: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fef2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fef5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fef8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fefb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fefe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff01: ff ff ff  Invalid Opcode - ISC Array,x
__ff04:     .hex ff ff ff      ; $ff04: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff07: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff0a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff0d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff10: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff13: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff16: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff19: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff1c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff1f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff22: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff25: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff28: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff2b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff2e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff31: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff34: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff37: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff3a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff3d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff40: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff43: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff46: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff49: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff4c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff4f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff52: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff55: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff58: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff5b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff5e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff61: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff64: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff67: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff6a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff6d: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff70: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff73: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff76: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff79: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff7c: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff7f: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff82: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff85: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff88: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff8b: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff8e: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff91: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff94: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff97: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff9a: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ff9d: ff ff ff  Invalid Opcode - ISC Array,x
__ffa0:     .hex ff ff ff      ; $ffa0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffa3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffa6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffa9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffac: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffaf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffb2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffb5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffb8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffbb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffbe: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffc1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffc4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffc7: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffca: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffcd: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffd0: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffd3: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffd6: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffd9: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffdc: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffdf: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffe2: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffe5: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffe8: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffeb: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $ffee: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fff1: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fff4: ff ff ff  Invalid Opcode - ISC Array,x
            .hex ff ff ff      ; $fff7: ff ff ff  Invalid Opcode - ISC Array,x

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: ff ff     Vector table
            .dw reset                      ; $fffc: ff ff     Vector table
            .dw irq                        ; $fffe: ff ff     Vector table
