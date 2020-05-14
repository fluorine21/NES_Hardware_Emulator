;-------------------------------------------------------------------------------
; d_k_classic.nes disasembled by DISASM6 v1.5
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 2              ; 2 x 16k PRG banks
            .db 4              ; 4 x 8k CHR banks
            .db %00110001      ; Mirroring: Vertical
                               ; SRAM: Not used
                               ; 512k Trainer: Not used
                               ; 4 Screen VRAM: Not used
                               ; Mapper: 3
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
__8000:     jsr $0670          ; $8000: 20 70 06  
            brk                ; $8003: 00        
            jsr $0664          ; $8004: 20 64 06  
            brk                ; $8007: 00        
            jsr $0678          ; $8008: 20 78 06  
            brk                ; $800b: 00        
            jsr $04b7          ; $800c: 20 b7 04  
            brk                ; $800f: 00        
            .hex 20 bc         ; $8010: 20 bc     Suspected data
__8012:     ora ($00,x)        ; $8012: 01 00     
__8014:     ora ($08,x)        ; $8014: 01 08     
            .hex 02            ; $8016: 02        Invalid Opcode - KIL 
            php                ; $8017: 08        
            .hex 02            ; $8018: 02        Invalid Opcode - KIL 
            brk                ; $8019: 00        
            ora $01            ; $801a: 05 01     
            brk                ; $801c: 00        
            .hex 02            ; $801d: 02        Invalid Opcode - KIL 
            ora ($01,x)        ; $801e: 01 01     
            ora ($05,x)        ; $8020: 01 05     
            ora ($05,x)        ; $8022: 01 05     
__8024:     ora ($02,x)        ; $8024: 01 02     
            ora ($02,x)        ; $8026: 01 02     
__8028:     .hex db 60 e2      ; $8028: db 60 e2  Invalid Opcode - DCP __e260,y
            eor $14,x          ; $802b: 55 14     
            jsr __f901         ; $802d: 20 01 f9  
            ldy #$e0           ; $8030: a0 e0     
            bmi __8044         ; $8032: 30 10     
            bpl __8037         ; $8034: 10 01     
            .hex 50            ; $8036: 50        Suspected data
__8037:     ora ($30,x)        ; $8037: 01 30     
            .hex d0            ; $8039: d0        Suspected data
__803a:     .hex ff ff         ; $803a: ff ff     Suspected data
__803c:     .hex 3e            ; $803c: 3e        Suspected data
__803d:     stx $57            ; $803d: 86 57     
            stx $e1            ; $803f: 86 e1     
            stx $60            ; $8041: 86 60     
            .hex 87            ; $8043: 87        Suspected data
__8044:     .hex 7d            ; $8044: 7d        Suspected data
__8045:     .hex 87 e4         ; $8045: 87 e4     Invalid Opcode - SAX $e4
            stx $f1            ; $8047: 86 f1     
            stx $53            ; $8049: 86 53     
            .hex 87 08         ; $804b: 87 08     Invalid Opcode - SAX $08
            .hex 87 19         ; $804d: 87 19     Invalid Opcode - SAX $19
            .hex 87 1c         ; $804f: 87 1c     Invalid Opcode - SAX $1c
            .hex 87 35         ; $8051: 87 35     Invalid Opcode - SAX $35
            .hex 87 4e         ; $8053: 87 4e     Invalid Opcode - SAX $4e
            .hex 87 8c         ; $8055: 87 8c     Invalid Opcode - SAX $8c
            .hex 80 cf         ; $8057: 80 cf     Invalid Opcode - NOP #$cf
            .hex 80 61         ; $8059: 80 61     Invalid Opcode - NOP #$61
            sta ($60,x)        ; $805b: 81 60     
            .hex 04 c3         ; $805d: 04 c3     Invalid Opcode - NOP $c3
            .hex 80 df         ; $805f: 80 df     Invalid Opcode - NOP #$df
            .hex 80 6e         ; $8061: 80 6e     Invalid Opcode - NOP #$6e
            sta ($c4,x)        ; $8063: 81 c4     
            .hex 82 c8         ; $8065: 82 c8     Invalid Opcode - NOP #$c8
            .hex 82 86         ; $8067: 82 86     Invalid Opcode - NOP #$86
            sta ($b0,x)        ; $8069: 81 b0     
            sta ($92,x)        ; $806b: 81 92     
            sta ($cf,x)        ; $806d: 81 cf     
            sta ($d5,x)        ; $806f: 81 d5     
            .hex 81            ; $8071: 81        Suspected data
__8072:     .hex db 81 e1      ; $8072: db 81 e1  Invalid Opcode - DCP __e181,y
            sta ($9e,x)        ; $8075: 81 9e     
            sta ($e7,x)        ; $8077: 81 e7     
            sta ($0c,x)        ; $8079: 81 0c     
            stx $70            ; $807b: 86 70     
            stx $89            ; $807d: 86 89     
            stx $25            ; $807f: 86 25     
            stx $a2            ; $8081: 86 a2     
            stx $cc            ; $8083: 86 cc     
            brk                ; $8085: 00        
            stx __9681         ; $8086: 8e 81 96  
            sta ($a6,x)        ; $8089: 81 a6     
            .hex 86            ; $808b: 86        Suspected data
__808c:     brk                ; $808c: 00        
            cld                ; $808d: d8        
            brk                ; $808e: 00        
            brk                ; $808f: 00        
            ora ($00,x)        ; $8090: 01 00     
            .hex 80 d7         ; $8092: 80 d7     Invalid Opcode - NOP #$d7
            .hex 04 18         ; $8094: 04 18     Invalid Opcode - NOP $18
            asl $fe            ; $8096: 06 fe     
__8098:     iny                ; $8098: c8        
            ldy __e804,x       ; $8099: bc 04 e8  
            ora #$fe           ; $809c: 09 fe     
__809e:     jsr $049e          ; $809e: 20 9e 04  
            clc                ; $80a1: 18        
            ora #$fe           ; $80a2: 09 fe     
            iny                ; $80a4: c8        
            .hex 80 04         ; $80a5: 80 04     Invalid Opcode - NOP #$04
            inx                ; $80a7: e8        
            ora #$fe           ; $80a8: 09 fe     
            jsr $0462          ; $80aa: 20 62 04  
            clc                ; $80ad: 18        
            ora #$fe           ; $80ae: 09 fe     
            iny                ; $80b0: c8        
            .hex 44 04         ; $80b1: 44 04     Invalid Opcode - NOP $04
            inx                ; $80b3: e8        
            asl $fe            ; $80b4: 06 fe     
            .hex 80 28         ; $80b6: 80 28     Invalid Opcode - NOP #$28
            .hex 04 00         ; $80b8: 04 00     Invalid Opcode - NOP $00
            ora ($fe,x)        ; $80ba: 01 fe     
            ldy __809e,x       ; $80bc: bc 9e 80  
            .hex 62            ; $80bf: 62        Invalid Opcode - KIL 
            .hex 44 28         ; $80c0: 44 28     Invalid Opcode - NOP $28
            .hex ff 00 00      ; $80c2: ff 00 00  Bad Addr Mode - ISC $0000,x
            .hex 80 00         ; $80c5: 80 00     Invalid Opcode - NOP #$00
__80c7:     brk                ; $80c7: 00        
            brk                ; $80c8: 00        
            clc                ; $80c9: 18        
            brk                ; $80ca: 00        
            brk                ; $80cb: 00        
            brk                ; $80cc: 00        
__80cd:     bpl __80cf         ; $80cd: 10 00     
__80cf:     cpx #$bc           ; $80cf: e0 bc     
            brk                ; $80d1: 00        
            bpl __8072         ; $80d2: 10 9e     
            brk                ; $80d4: 00        
            cpx #$80           ; $80d5: e0 80     
            brk                ; $80d7: 00        
            bpl __813c         ; $80d8: 10 62     
            brk                ; $80da: 00        
            cpx #$44           ; $80db: e0 44     
            brk                ; $80dd: 00        
            .hex fe 00 00      ; $80de: fe 00 00  Bad Addr Mode - INC $0000,x
            bpl __80e6         ; $80e1: 10 03     
            iny                ; $80e3: c8        
            .hex bc 08         ; $80e4: bc 08     Suspected data
__80e6:     iny                ; $80e6: c8        
            .hex 80 04         ; $80e7: 80 04     Invalid Opcode - NOP #$04
            clv                ; $80e9: b8        
            .hex 74 10         ; $80ea: 74 10     Invalid Opcode - NOP $10,x
            pla                ; $80ec: 68        
            cli                ; $80ed: 58        
            .hex 14 c8         ; $80ee: 14 c8     Invalid Opcode - NOP $c8,x
            .hex 44 04         ; $80f0: 44 04     Invalid Opcode - NOP $04
            rts                ; $80f2: 60        

;-------------------------------------------------------------------------------
            .hex cf 0c 70      ; $80f3: cf 0c 70  Invalid Opcode - DCP $700c
            .hex 9b            ; $80f6: 9b        Invalid Opcode - TAS 
            brk                ; $80f7: 00        
            bmi __8098         ; $80f8: 30 9e     
            .hex 04 50         ; $80fa: 04 50     Invalid Opcode - NOP $50
            sta $08            ; $80fc: 85 08     
            .hex 80 7d         ; $80fe: 80 7d     Invalid Opcode - NOP #$7d
            brk                ; $8100: 00        
            bmi __8165         ; $8101: 30 62     
            .hex 04 58         ; $8103: 04 58     Invalid Opcode - NOP $58
            rts                ; $8105: 60        

;-------------------------------------------------------------------------------
            brk                ; $8106: 00        
            bcc __8131         ; $8107: 90 28     
            clc                ; $8109: 18        
            .hex fe 00 00      ; $810a: fe 00 00  Bad Addr Mode - INC $0000,x
            php                ; $810d: 08        
            .hex 1d 00 00      ; $810e: 1d 00 00  Bad Addr Mode - ORA $0000,x
            php                ; $8111: 08        
            .hex 17 00         ; $8112: 17 00     Invalid Opcode - SLO $00,x
            brk                ; $8114: 00        
            php                ; $8115: 08        
            clc                ; $8116: 18        
            brk                ; $8117: 00        
            brk                ; $8118: 00        
            php                ; $8119: 08        
            ora #$00           ; $811a: 09 00     
            brk                ; $811c: 00        
            php                ; $811d: 08        
            .hex 0b 00         ; $811e: 0b 00     Invalid Opcode - ANC #$00
            brk                ; $8120: 00        
            php                ; $8121: 08        
            .hex 07 00         ; $8122: 07 00     Invalid Opcode - SLO $00
            brk                ; $8124: 00        
            php                ; $8125: 08        
            ora __bcc8,y       ; $8126: 19 c8 bc  
            brk                ; $8129: 00        
            bvs __80c7         ; $812a: 70 9b     
            brk                ; $812c: 00        
            bmi __80cd         ; $812d: 30 9e     
            brk                ; $812f: 00        
            iny                ; $8130: c8        
__8131:     .hex 80 00         ; $8131: 80 00     Invalid Opcode - NOP #$00
            .hex 80 7d         ; $8133: 80 7d     Invalid Opcode - NOP #$7d
            brk                ; $8135: 00        
            bmi __819a         ; $8136: 30 62     
            brk                ; $8138: 00        
            cli                ; $8139: 58        
            rts                ; $813a: 60        

;-------------------------------------------------------------------------------
            brk                ; $813b: 00        
__813c:     iny                ; $813c: c8        
            .hex 44 00         ; $813d: 44 00     Invalid Opcode - NOP $00
            bcc __8169         ; $813f: 90 28     
            brk                ; $8141: 00        
            .hex fe 00 00      ; $8142: fe 00 00  Bad Addr Mode - INC $0000,x
            php                ; $8145: 08        
            .hex 0d            ; $8146: 0d        Suspected data
__8147:     bit $24            ; $8147: 24 24     
            .hex 54            ; $8149: 54        Suspected data
__814a:     .hex 54 60         ; $814a: 54 60     Invalid Opcode - NOP $60,x
            rts                ; $814c: 60        

;-------------------------------------------------------------------------------
            .hex 64 64         ; $814d: 64 64     Invalid Opcode - NOP $64
            rts                ; $814f: 60        

;-------------------------------------------------------------------------------
            rts                ; $8150: 60        

;-------------------------------------------------------------------------------
            bit $24            ; $8151: 24 24     
            pla                ; $8153: 68        
            pla                ; $8154: 68        
            pla                ; $8155: 68        
            pla                ; $8156: 68        
            pla                ; $8157: 68        
            pla                ; $8158: 68        
__8159:     bit $24            ; $8159: 24 24     
            bit $54            ; $815b: 24 54     
            .hex 54 54         ; $815d: 54 54     Invalid Opcode - NOP $54,x
            brk                ; $815f: 00        
            brk                ; $8160: 00        
            rts                ; $8161: 60        

;-------------------------------------------------------------------------------
            .hex b7 00         ; $8162: b7 00     Invalid Opcode - LAX $00,y
            .hex 50            ; $8164: 50        Suspected data
__8165:     .hex 7b 00 b8      ; $8165: 7b 00 b8  Invalid Opcode - RRA __b800,y
            .hex 5c            ; $8168: 5c        Suspected data
__8169:     brk                ; $8169: 00        
            pla                ; $816a: 68        
            rti                ; $816b: 40        

;-------------------------------------------------------------------------------
            brk                ; $816c: 00        
            .hex fe 00 00      ; $816d: fe 00 00  Bad Addr Mode - INC $0000,x
            php                ; $8170: 08        
            clc                ; $8171: 18        
__8172:     dex                ; $8172: ca        
__8173:     .hex a7 8e         ; $8173: a7 8e     Invalid Opcode - LAX $8e
            .hex 6b 51         ; $8175: 6b 51     Invalid Opcode - ARR #$51
__8177:     .hex 5c 2c 4c      ; $8177: 5c 2c 4c  Invalid Opcode - NOP $4c2c,x
            .hex 2c 64         ; $817a: 2c 64     Suspected data
__817c:     dec $aa            ; $817c: c6 aa     
            sty $4d6d          ; $817e: 8c 6d 4d  
__8181:     cpy $6c            ; $8181: c4 6c     
            .hex 7c 54 c4      ; $8183: 7c 54 c4  Invalid Opcode - NOP __c454,x
            php                ; $8186: 08        
            ora ($0a),y        ; $8187: 11 0a     
            ora ($08),y        ; $8189: 11 08     
__818b:     bpl __8197         ; $818b: 10 0a     
            ora ($08),y        ; $818d: 11 08     
            .hex 0f 0a 11      ; $818f: 0f 0a 11  Invalid Opcode - SLO $110a
            ora $01            ; $8192: 05 01     
            .hex 0c 09         ; $8194: 0c 09     Suspected data
__8196:     .hex 05            ; $8196: 05        Suspected data
__8197:     .hex 05            ; $8197: 05        Suspected data
__8198:     asl                ; $8198: 0a        
            asl                ; $8199: 0a        
__819a:     php                ; $819a: 08        
            bpl __81a5         ; $819b: 10 08     
            bpl __81a3         ; $819d: 10 04     
            .hex 04 0c         ; $819f: 04 0c     Invalid Opcode - NOP $0c
            .hex 0d            ; $81a1: 0d        Suspected data
__81a2:     .hex 0c            ; $81a2: 0c        Suspected data
__81a3:     .hex 14 1c         ; $81a3: 14 1c     Invalid Opcode - NOP $1c,x
__81a5:     bpl __81bf         ; $81a5: 10 18     
            .hex 20            ; $81a7: 20        Suspected data
__81a8:     .hex 03 05         ; $81a8: 03 05     Invalid Opcode - SLO ($05,x)
            .hex 02            ; $81aa: 02        Invalid Opcode - KIL 
            .hex 03 00         ; $81ab: 03 00     Invalid Opcode - SLO ($00,x)
            brk                ; $81ad: 00        
            .hex 03 04         ; $81ae: 03 04     Invalid Opcode - SLO ($04,x)
            brk                ; $81b0: 00        
            brk                ; $81b1: 00        
            php                ; $81b2: 08        
            php                ; $81b3: 08        
__81b4:     bpl __8196         ; $81b4: 10 e0     
            bpl __8198         ; $81b6: 10 e0     
            .hex 0c e0 08      ; $81b8: 0c e0 08  Invalid Opcode - NOP $08e0
            inx                ; $81bb: e8        
__81bc:     ora ($02,x)        ; $81bc: 01 02     
            .hex 04            ; $81be: 04        Suspected data
__81bf:     php                ; $81bf: 08        
            bpl __81e2         ; $81c0: 10 20     
            rti                ; $81c2: 40        

;-------------------------------------------------------------------------------
            .hex 80            ; $81c3: 80        Suspected data
__81c4:     .hex 13 30         ; $81c4: 13 30     Invalid Opcode - SLO ($30),y
            pha                ; $81c6: 48        
            rts                ; $81c7: 60        

;-------------------------------------------------------------------------------
            sei                ; $81c8: 78        
            bcc __8173         ; $81c9: 90 a8     
            cpy #$e0           ; $81cb: c0 e0     
__81cd:     .hex 13 db         ; $81cd: 13 db     Invalid Opcode - SLO ($db),y
__81cf:     jmp __886a         ; $81cf: 4c 6a 88  

;-------------------------------------------------------------------------------
            ldx $c5            ; $81d2: a6 c5     
            inc $6b53,x        ; $81d4: fe 53 6b  
            .hex 8f a7 ca      ; $81d7: 8f a7 ca  Invalid Opcode - SAX __caa7
            inc $6e52,x        ; $81da: fe 52 6e  
            sty __c5ac         ; $81dd: 8c ac c5  
            .hex fe 52         ; $81e0: fe 52     Suspected data
__81e2:     jmp (__a88e)       ; $81e2: 6c 8e a8  

;-------------------------------------------------------------------------------
            dex                ; $81e5: ca        
            inc $0600,x        ; $81e6: fe 00 06  
            php                ; $81e9: 08        
            php                ; $81ea: 08        
__81eb:     .hex 19            ; $81eb: 19        Suspected data
__81ec:     bmi __8222         ; $81ec: 30 34     
            bmi __8224         ; $81ee: 30 34     
            bmi __8226         ; $81f0: 30 34     
            sec                ; $81f2: 38        
            .hex 3c 3c 3c      ; $81f3: 3c 3c 3c  Invalid Opcode - NOP $3c3c,x
__81f6:     .hex 02            ; $81f6: 02        Invalid Opcode - KIL 
            .hex 04 02         ; $81f7: 04 02     Invalid Opcode - NOP $02
            .hex 04            ; $81f9: 04        Suspected data
__81fa:     .hex 07 05         ; $81fa: 07 05     Invalid Opcode - SLO $05
            .hex 07            ; $81fc: 07        Suspected data
__81fd:     ora #$03           ; $81fd: 09 03     
__81ff:     brk                ; $81ff: 00        
            brk                ; $8200: 00        
            .hex 04 08         ; $8201: 04 08     Invalid Opcode - NOP $08
            ora ($02,x)        ; $8203: 01 02     
            .hex 03 04         ; $8205: 03 04     Invalid Opcode - SLO ($04,x)
__8207:     bvc __8269         ; $8207: 50 60     
            bvs __818b         ; $8209: 70 80     
            bcc __821b         ; $820b: 90 0e     
            cld                ; $820d: d8        
            clc                ; $820e: 18        
            asl $04c8          ; $820f: 0e c8 04  
            stx $c8            ; $8212: 86 c8     
            .hex 04 a6         ; $8214: 04 a6     Invalid Opcode - NOP $a6
            cpy #$00           ; $8216: c0 00     
            ldx $00b8,y        ; $8218: be b8 00  
__821b:     dec $b0,x          ; $821b: d6 b0     
            .hex 04 4e         ; $821d: 04 4e     Invalid Opcode - NOP $4e
            bcs __8225         ; $821f: b0 04     
            .hex 0e            ; $8221: 0e        Suspected data
__8222:     ldy #$04           ; $8222: a0 04     
__8224:     .hex de            ; $8224: de        Suspected data
__8225:     .hex a0            ; $8225: a0        Suspected data
__8226:     brk                ; $8226: 00        
            dec $98            ; $8227: c6 98     
            brk                ; $8229: 00        
            .hex ae 90 00      ; $822a: ae 90 00  Bad Addr Mode - LDX $0090
            stx $88,y          ; $822d: 96 88     
            .hex 14 c6         ; $822f: 14 c6     Invalid Opcode - NOP $c6,x
            sei                ; $8231: 78        
            .hex 0c 0e 70      ; $8232: 0c 0e 70  Invalid Opcode - NOP $700e
            .hex 04 46         ; $8235: 04 46     Invalid Opcode - NOP $46
            bvs __8241         ; $8237: 70 08     
            stx $0468          ; $8239: 8e 68 04  
            .hex ae 60 00      ; $823c: ae 60 00  Bad Addr Mode - LDX $0060
            dec $58            ; $823f: c6 58     
__8241:     brk                ; $8241: 00        
            .hex de 50 00      ; $8242: de 50 00  Bad Addr Mode - DEC $0050,x
            ror $40            ; $8245: 66 40     
            bpl __81cf         ; $8247: 10 86     
            plp                ; $8249: 28        
            brk                ; $824a: 00        
            inc $78b0,x        ; $824b: fe b0 78  
            rts                ; $824e: 60        

;-------------------------------------------------------------------------------
            rti                ; $824f: 40        

;-------------------------------------------------------------------------------
            plp                ; $8250: 28        
            .hex ff 00 00      ; $8251: ff 00 00  Bad Addr Mode - ISC $0000,x
            .hex 14 00         ; $8254: 14 00     Invalid Opcode - NOP $00,x
            brk                ; $8256: 00        
            brk                ; $8257: 00        
            .hex 1c 00 00      ; $8258: 1c 00 00  Bad Addr Mode - NOP $0000,x
            brk                ; $825b: 00        
            bit $00            ; $825c: 24 00     
            brk                ; $825e: 00        
            brk                ; $825f: 00        
            .hex 2c 00 00      ; $8260: 2c 00 00  Bad Addr Mode - BIT $0000
            brk                ; $8263: 00        
            .hex 54 00         ; $8264: 54 00     Invalid Opcode - NOP $00,x
            brk                ; $8266: 00        
            brk                ; $8267: 00        
            .hex 12            ; $8268: 12        Invalid Opcode - KIL 
__8269:     brk                ; $8269: 00        
            brk                ; $826a: 00        
            brk                ; $826b: 00        
            cpx $00            ; $826c: e4 00     
            clc                ; $826e: 18        
            ldy #$0c           ; $826f: a0 0c     
            jsr $1070          ; $8271: 20 70 10  
            bvc __82e6         ; $8274: 50 70     
            .hex 14 60         ; $8276: 14 60     Invalid Opcode - NOP $60,x
            bvs __828e         ; $8278: 70 14     
            tya                ; $827a: 98        
            pla                ; $827b: 68        
            php                ; $827c: 08        
            iny                ; $827d: c8        
            sei                ; $827e: 78        
            php                ; $827f: 08        
            cpx #$a0           ; $8280: e0 a0     
            brk                ; $8282: 00        
            cpx #$50           ; $8283: e0 50     
            .hex 0c b0 40      ; $8285: 0c b0 40  Invalid Opcode - NOP $40b0
            php                ; $8288: 08        
            bcc __82b3         ; $8289: 90 28     
            .hex 04 fe         ; $828b: 04 fe     Invalid Opcode - NOP $fe
__828d:     brk                ; $828d: 00        
__828e:     brk                ; $828e: 00        
            php                ; $828f: 08        
            bpl __8292         ; $8290: 10 00     
__8292:     brk                ; $8292: 00        
            php                ; $8293: 08        
            clc                ; $8294: 18        
            brk                ; $8295: 00        
            brk                ; $8296: 00        
            php                ; $8297: 08        
            jsr $0000          ; $8298: 20 00 00  
__829b:     php                ; $829b: 08        
            plp                ; $829c: 28        
            brk                ; $829d: 00        
            brk                ; $829e: 00        
            php                ; $829f: 08        
            bmi __82a2         ; $82a0: 30 00     
__82a2:     brk                ; $82a2: 00        
            php                ; $82a3: 08        
            rti                ; $82a4: 40        

;-------------------------------------------------------------------------------
            clc                ; $82a5: 18        
            ldy #$00           ; $82a6: a0 00     
            jsr $0070          ; $82a8: 20 70 00  
            bvc __831d         ; $82ab: 50 70     
            brk                ; $82ad: 00        
            rts                ; $82ae: 60        

;-------------------------------------------------------------------------------
            bvs __82b1         ; $82af: 70 00     
__82b1:     tya                ; $82b1: 98        
            pla                ; $82b2: 68        
__82b3:     brk                ; $82b3: 00        
            iny                ; $82b4: c8        
            sei                ; $82b5: 78        
            brk                ; $82b6: 00        
            cpx #$a0           ; $82b7: e0 a0     
            brk                ; $82b9: 00        
            cpx #$50           ; $82ba: e0 50     
            brk                ; $82bc: 00        
            bcs __82ff         ; $82bd: b0 40     
            brk                ; $82bf: 00        
            bcc __82ea         ; $82c0: 90 28     
            brk                ; $82c2: 00        
            inc $0104,x        ; $82c3: fe 04 01  
            .hex 1b 0e 00      ; $82c6: 1b 0e 00  Invalid Opcode - SLO $000e,y
            ora ($12,x)        ; $82c9: 01 12     
            .hex 01            ; $82cb: 01        Suspected data
__82cc:     bmi __8306         ; $82cc: 30 38     
            rti                ; $82ce: 40        

;-------------------------------------------------------------------------------
            pha                ; $82cf: 48        
__82d0:     bvc __832a         ; $82d0: 50 58     
            brk                ; $82d2: 00        
            brk                ; $82d3: 00        
            ora #$15           ; $82d4: 09 15     
            clc                ; $82d6: 18        
            brk                ; $82d7: 00        
            jmp $035f          ; $82d8: 4c 5f 03  

;-------------------------------------------------------------------------------
            .hex 5c 5f 03      ; $82db: 5c 5f 03  Invalid Opcode - NOP $035f,x
            cpy $67            ; $82de: c4 67     
            .hex 03 4c         ; $82e0: 03 4c     Invalid Opcode - SLO ($4c,x)
            .hex 9f 13 5c      ; $82e2: 9f 13 5c  Invalid Opcode - AHX $5c13,y
            .hex 9f            ; $82e5: 9f        Suspected data
__82e6:     .hex 13 c4         ; $82e6: 13 c4     Invalid Opcode - SLO ($c4),y
            .hex 87 13         ; $82e8: 87 13     Invalid Opcode - SAX $13
__82ea:     .hex dc 3f 03      ; $82ea: dc 3f 03  Invalid Opcode - NOP $033f,x
            .hex dc 67 13      ; $82ed: dc 67 13  Invalid Opcode - NOP $1367,x
            asl $d8            ; $82f0: 06 d8     
            brk                ; $82f2: 00        
            asl $b8            ; $82f3: 06 b8     
            brk                ; $82f5: 00        
            asl $90,x          ; $82f6: 16 90     
            .hex 04 1e         ; $82f8: 04 1e     Invalid Opcode - NOP $1e
            pla                ; $82fa: 68        
            php                ; $82fb: 08        
            rol $40            ; $82fc: 26 40     
            .hex 0c            ; $82fe: 0c        Suspected data
__82ff:     inc __90b8,x       ; $82ff: fe b8 90  
            pla                ; $8302: 68        
__8303:     rti                ; $8303: 40        

;-------------------------------------------------------------------------------
            plp                ; $8304: 28        
            .hex ff            ; $8305: ff        Suspected data
__8306:     brk                ; $8306: 00        
            brk                ; $8307: 00        
            sbc $00,x          ; $8308: f5 00     
            brk                ; $830a: 00        
            brk                ; $830b: 00        
            cmp $00,x          ; $830c: d5 00     
            brk                ; $830e: 00        
            brk                ; $830f: 00        
            cmp $00            ; $8310: c5 00     
            brk                ; $8312: 00        
            brk                ; $8313: 00        
            lda $00,x          ; $8314: b5 00     
            bpl __82d0         ; $8316: 10 b8     
            brk                ; $8318: 00        
            sei                ; $8319: 78        
            clv                ; $831a: b8        
            brk                ; $831b: 00        
            inx                ; $831c: e8        
__831d:     clv                ; $831d: b8        
            brk                ; $831e: 00        
            clc                ; $831f: 18        
            bcc __8326         ; $8320: 90 04     
            rts                ; $8322: 60        

;-------------------------------------------------------------------------------
            bcc __8329         ; $8323: 90 04     
            tya                ; $8325: 98        
__8326:     bcc __832c         ; $8326: 90 04     
            .hex e0            ; $8328: e0        Suspected data
__8329:     .hex 90            ; $8329: 90        Suspected data
__832a:     .hex 04 20         ; $832a: 04 20     Invalid Opcode - NOP $20
__832c:     pla                ; $832c: 68        
            .hex 04 80         ; $832d: 04 80     Invalid Opcode - NOP $80
            pla                ; $832f: 68        
__8330:     .hex 04 d8         ; $8330: 04 d8     Invalid Opcode - NOP $d8
            pla                ; $8332: 68        
            .hex 04 28         ; $8333: 04 28     Invalid Opcode - NOP $28
            rti                ; $8335: 40        

;-------------------------------------------------------------------------------
            .hex 04 48         ; $8336: 04 48     Invalid Opcode - NOP $48
            rti                ; $8338: 40        

;-------------------------------------------------------------------------------
            .hex 04 b0         ; $8339: 04 b0     Invalid Opcode - NOP $b0
            rti                ; $833b: 40        

;-------------------------------------------------------------------------------
            .hex 04 d0         ; $833c: 04 d0     Invalid Opcode - NOP $d0
            rti                ; $833e: 40        

;-------------------------------------------------------------------------------
            .hex 04 fe         ; $833f: 04 fe     Invalid Opcode - NOP $fe
            brk                ; $8341: 00        
            brk                ; $8342: 00        
            php                ; $8343: 08        
            jsr $0000          ; $8344: 20 00 00  
            php                ; $8347: 08        
            plp                ; $8348: 28        
            bpl __8303         ; $8349: 10 b8     
            brk                ; $834b: 00        
            sei                ; $834c: 78        
            clv                ; $834d: b8        
            brk                ; $834e: 00        
            inx                ; $834f: e8        
            clv                ; $8350: b8        
            brk                ; $8351: 00        
            clc                ; $8352: 18        
            bcc __8355         ; $8353: 90 00     
__8355:     rts                ; $8355: 60        

;-------------------------------------------------------------------------------
            bcc __8358         ; $8356: 90 00     
__8358:     tya                ; $8358: 98        
            bcc __835b         ; $8359: 90 00     
__835b:     cpx #$90           ; $835b: e0 90     
            brk                ; $835d: 00        
            jsr $0068          ; $835e: 20 68 00  
            .hex 80 68         ; $8361: 80 68     Invalid Opcode - NOP #$68
            brk                ; $8363: 00        
            cld                ; $8364: d8        
            pla                ; $8365: 68        
            brk                ; $8366: 00        
            plp                ; $8367: 28        
            rti                ; $8368: 40        

;-------------------------------------------------------------------------------
            brk                ; $8369: 00        
            pha                ; $836a: 48        
            rti                ; $836b: 40        

;-------------------------------------------------------------------------------
            brk                ; $836c: 00        
            bcs __83af         ; $836d: b0 40     
            brk                ; $836f: 00        
            bne __83b2         ; $8370: d0 40     
            brk                ; $8372: 00        
            inc $0900,x        ; $8373: fe 00 09  
            asl $4833,x        ; $8376: 1e 33 48  
            .hex 54 0c         ; $8379: 54 0c     Invalid Opcode - NOP $0c,x
            .hex a7 03         ; $837b: a7 03     Invalid Opcode - LAX $03
            .hex 74 a7         ; $837d: 74 a7     Invalid Opcode - NOP $a7,x
            .hex 03 e4         ; $837f: 03 e4     Invalid Opcode - SLO ($e4,x)
            .hex a7 03         ; $8381: a7 03     Invalid Opcode - LAX $03
__8383:     .hex 0c c7 13      ; $8383: 0c c7 13  Invalid Opcode - NOP $13c7
            .hex 74 c7         ; $8386: 74 c7     Invalid Opcode - NOP $c7,x
            .hex 13 e4         ; $8388: 13 e4     Invalid Opcode - SLO ($e4),y
            .hex c7 13         ; $838a: c7 13     Invalid Opcode - DCP $13
            .hex 14 7f         ; $838c: 14 7f     Invalid Opcode - NOP $7f,x
            .hex 03 5c         ; $838e: 03 5c     Invalid Opcode - SLO ($5c,x)
            .hex 7f 03 94      ; $8390: 7f 03 94  Invalid Opcode - RRA __9403,x
            .hex 7f 03 dc      ; $8393: 7f 03 dc  Invalid Opcode - RRA __dc03,x
            .hex 7f 03 1c      ; $8396: 7f 03 1c  Invalid Opcode - RRA $1c03,x
            .hex 57 03         ; $8399: 57 03     Invalid Opcode - SRE $03,x
            .hex 7c 57 03      ; $839b: 7c 57 03  Invalid Opcode - NOP $0357,x
            .hex d4 57         ; $839e: d4 57     Invalid Opcode - NOP $57,x
            .hex 03 14         ; $83a0: 03 14     Invalid Opcode - SLO ($14,x)
            .hex a7 13         ; $83a2: a7 13     Invalid Opcode - LAX $13
            .hex 5c a7 13      ; $83a4: 5c a7 13  Invalid Opcode - NOP $13a7,x
            sty $a7,x          ; $83a7: 94 a7     
            .hex 13 dc         ; $83a9: 13 dc     Invalid Opcode - SLO ($dc),y
            .hex a7 13         ; $83ab: a7 13     Invalid Opcode - LAX $13
            bit $2f            ; $83ad: 24 2f     
__83af:     .hex 03 44         ; $83af: 03 44     Invalid Opcode - SLO ($44,x)
            .hex 2f            ; $83b1: 2f        Suspected data
__83b2:     .hex 03 ac         ; $83b2: 03 ac     Invalid Opcode - SLO ($ac,x)
            .hex 2f 03 cc      ; $83b4: 2f 03 cc  Invalid Opcode - RLA __cc03
            .hex 2f 03 1c      ; $83b7: 2f 03 1c  Invalid Opcode - RLA $1c03
            .hex 7f 13 7c      ; $83ba: 7f 13 7c  Invalid Opcode - RRA $7c13,x
            .hex 7f 13 d4      ; $83bd: 7f 13 d4  Invalid Opcode - RRA __d413,x
            .hex 7f 13 24      ; $83c0: 7f 13 24  Invalid Opcode - RRA $2413,x
            .hex 57 13         ; $83c3: 57 13     Invalid Opcode - SRE $13,x
            .hex 44 57         ; $83c5: 44 57     Invalid Opcode - NOP $57
            .hex 13 ac         ; $83c7: 13 ac     Invalid Opcode - SLO ($ac),y
            .hex 57 13         ; $83c9: 57 13     Invalid Opcode - SRE $13,x
            cpy $1357          ; $83cb: cc 57 13  
__83ce:     php                ; $83ce: 08        
__83cf:     .hex c7 10         ; $83cf: c7 10     Invalid Opcode - DCP $10
            .hex a7 18         ; $83d1: a7 18     Invalid Opcode - LAX $18
            .hex 7f 20 57      ; $83d3: 7f 20 57  Invalid Opcode - RRA $5720,x
__83d6:     inx                ; $83d6: e8        
            .hex c7 e0         ; $83d7: c7 e0     Invalid Opcode - DCP $e0
            .hex a7 d8         ; $83d9: a7 d8     Invalid Opcode - LAX $d8
            .hex 7f d0 57      ; $83db: 7f d0 57  Invalid Opcode - RRA $57d0,x
__83de:     .hex 34            ; $83de: 34        Suspected data
__83df:     ldy __bc44         ; $83df: ac 44 bc  
__83e2:     ora $03            ; $83e2: 05 03     
__83e4:     .hex 0d            ; $83e4: 0d        Suspected data
__83e5:     .hex 0b            ; $83e5: 0b        Suspected data
__83e6:     .hex d4 0c         ; $83e6: d4 0c     Invalid Opcode - NOP $0c,x
__83e8:     cpx $0c            ; $83e8: e4 0c     
__83ea:     .hex 5d 4b         ; $83ea: 5d 4b     Suspected data
__83ec:     .hex cd c3         ; $83ec: cd c3     Suspected data
__83ee:     .hex 5d 43         ; $83ee: 5d 43     Suspected data
__83f0:     sbc $c3            ; $83f0: e5 c3     
__83f2:     .hex ed 03         ; $83f2: ed 03     Suspected data
__83f4:     .hex 24            ; $83f4: 24        Suspected data
__83f5:     eor #$77           ; $83f5: 49 77     
            .hex 77            ; $83f7: 77        Suspected data
__83f8:     .hex 77            ; $83f8: 77        Suspected data
__83f9:     .hex 77 ff         ; $83f9: 77 ff     Invalid Opcode - RRA $ff,x
            .hex ff            ; $83fb: ff        Suspected data
__83fc:     .hex 0b 0c         ; $83fc: 0b 0c     Invalid Opcode - ANC #$0c
            ora $1615          ; $83fe: 0d 15 16  
            .hex 17 18         ; $8401: 17 18     Invalid Opcode - SLO $18,x
            ora $1e1a,y        ; $8403: 19 1a 1e  
            .hex 1f            ; $8406: 1f        Suspected data
__8407:     .hex ff ff ff      ; $8407: ff ff ff  Invalid Opcode - ISC $ffff,x
            ora ($01,x)        ; $840a: 01 01     
            ora ($01,x)        ; $840c: 01 01     
            .hex ff ff 01      ; $840e: ff ff 01  Invalid Opcode - ISC $01ff,x
            .hex 01            ; $8411: 01        Suspected data
__8412:     cpx $e3            ; $8412: e4 e3     
            .hex e2 d8         ; $8414: e2 d8     Invalid Opcode - NOP #$d8
            .hex d7 d6         ; $8416: d7 d6     Invalid Opcode - DCP $d6,x
            cmp $d4,x          ; $8418: d5 d4     
            .hex d3 d0         ; $841a: d3 d0     Invalid Opcode - DCP ($d0),y
            .hex cf            ; $841c: cf        Suspected data
__841d:     pha                ; $841d: 48        
            sty $c0            ; $841e: 84 c0     
__8420:     bvc __83af         ; $8420: 50 8d     
            .hex c7            ; $8422: c7        Suspected data
__8423:     .hex 20            ; $8423: 20        Suspected data
__8424:     cpy #$78           ; $8424: c0 78     
            rts                ; $8426: 60        

;-------------------------------------------------------------------------------
            plp                ; $8427: 28        
            .hex 44 6b         ; $8428: 44 6b     Invalid Opcode - NOP $6b
            .hex 20            ; $842a: 20        Suspected data
__842b:     .hex 33            ; $842b: 33        Suspected data
__842c:     sty $37            ; $842c: 84 37     
__842e:     sty $3b            ; $842e: 84 3b     
            sty $3f            ; $8430: 84 3f     
            sty $00            ; $8432: 84 00     
            brk                ; $8434: 00        
            bpl __843f         ; $8435: 10 08     
            brk                ; $8437: 00        
            brk                ; $8438: 00        
            bpl __8443         ; $8439: 10 08     
            brk                ; $843b: 00        
            brk                ; $843c: 00        
            rts                ; $843d: 60        

;-------------------------------------------------------------------------------
            .hex 10            ; $843e: 10        Suspected data
__843f:     brk                ; $843f: 00        
            brk                ; $8440: 00        
            rol                ; $8441: 2a        
            .hex 20            ; $8442: 20        Suspected data
__8443:     bcs __83e5         ; $8443: b0 a0     
            sei                ; $8445: 78        
            pla                ; $8446: 68        
            pla                ; $8447: 68        
__8448:     dey                ; $8448: 88        
            dey                ; $8449: 88        
            dey                ; $844a: 88        
            dey                ; $844b: 88        
            dey                ; $844c: 88        
__844d:     pha                ; $844d: 48        
            sec                ; $844e: 38        
            plp                ; $844f: 28        
            clc                ; $8450: 18        
            clc                ; $8451: 18        
            .hex bb bb 5e      ; $8452: bb bb 5e  Invalid Opcode - LAS $5ebb,y
            .hex 2f 13         ; $8455: 2f 13     Suspected data
__8457:     dey                ; $8457: 88        
            sei                ; $8458: 78        
            .hex 64 56         ; $8459: 64 56     Invalid Opcode - NOP $56
            .hex 49            ; $845b: 49        Suspected data
__845c:     dey                ; $845c: 88        
            dey                ; $845d: 88        
            bit $55            ; $845e: 24 55     
            .hex 55            ; $8460: 55        Suspected data
__8461:     dey                ; $8461: 88        
            dey                ; $8462: 88        
            eor #$55           ; $8463: 49 55     
            .hex 55            ; $8465: 55        Suspected data
__8466:     rti                ; $8466: 40        

;-------------------------------------------------------------------------------
            jsr $0810          ; $8467: 20 10 08  
            .hex 01            ; $846a: 01        Suspected data
__846b:     .hex 8c            ; $846b: 8c        Suspected data
__846c:     .hex 80 0c         ; $846c: 80 0c     Invalid Opcode - NOP #$0c
            .hex 82 0c         ; $846e: 82 0c     Invalid Opcode - NOP #$0c
            .hex 82 f0         ; $8470: 82 f0     Invalid Opcode - NOP #$f0
            .hex 82            ; $8472: 82        Suspected data
__8473:     .hex c3            ; $8473: c3        Suspected data
__8474:     .hex 80 0c         ; $8474: 80 0c     Invalid Opcode - NOP #$0c
            .hex 82 52         ; $8476: 82 52     Invalid Opcode - NOP #$52
            .hex 82 06         ; $8478: 82 06     Invalid Opcode - NOP #$06
            .hex 83            ; $847a: 83        Suspected data
__847b:     .hex e3            ; $847b: e3        Suspected data
__847c:     .hex 80 0c         ; $847c: 80 0c     Invalid Opcode - NOP #$0c
            .hex 82 6e         ; $847e: 82 6e     Invalid Opcode - NOP #$6e
            .hex 82 16         ; $8480: 82 16     Invalid Opcode - NOP #$16
            .hex 83            ; $8482: 83        Suspected data
__8483:     .hex 0b            ; $8483: 0b        Suspected data
__8484:     sta ($0c,x)        ; $8484: 81 0c     
            .hex 82 8d         ; $8486: 82 8d     Invalid Opcode - NOP #$8d
            .hex 82 41         ; $8488: 82 41     Invalid Opcode - NOP #$41
            .hex 83            ; $848a: 83        Suspected data
__848b:     .hex 27            ; $848b: 27        Suspected data
__848c:     sta ($0c,x)        ; $848c: 81 0c     
            .hex 82 a5         ; $848e: 82 a5     Invalid Opcode - NOP #$a5
            .hex 82 49         ; $8490: 82 49     Invalid Opcode - NOP #$49
            .hex 83            ; $8492: 83        Suspected data
__8493:     .hex bc            ; $8493: bc        Suspected data
__8494:     .hex 80 0c         ; $8494: 80 0c     Invalid Opcode - NOP #$0c
            .hex 82 4c         ; $8496: 82 4c     Invalid Opcode - NOP #$4c
            .hex 82 00         ; $8498: 82 00     Invalid Opcode - NOP #$00
            .hex 83            ; $849a: 83        Suspected data
__849b:     .hex 0c            ; $849b: 0c        Suspected data
__849c:     .hex 82 d2         ; $849c: 82 d2     Invalid Opcode - NOP #$d2
            .hex 82 74         ; $849e: 82 74     Invalid Opcode - NOP #$74
            .hex 83            ; $84a0: 83        Suspected data
__84a1:     .hex 0c            ; $84a1: 0c        Suspected data
__84a2:     .hex 82 d8         ; $84a2: 82 d8     Invalid Opcode - NOP #$d8
            .hex 82 7a         ; $84a4: 82 7a     Invalid Opcode - NOP #$7a
            .hex 83            ; $84a6: 83        Suspected data
__84a7:     .hex 57            ; $84a7: 57        Suspected data
__84a8:     .hex b3 d5         ; $84a8: b3 d5     Invalid Opcode - LAX ($d5),y
            ldx $c9,y          ; $84aa: b6 c9     
            lda $18,x          ; $84ac: b5 18     
            lda $d5,x          ; $84ae: b5 d5     
            ldx $d5,y          ; $84b0: b6 d5     
            ldx $00,y          ; $84b2: b6 00     
            brk                ; $84b4: 00        
            ora ($06,x)        ; $84b5: 01 06     
            inx                ; $84b7: e8        
            .hex 04 50         ; $84b8: 04 50     Invalid Opcode - NOP $50
__84ba:     clc                ; $84ba: 18        
            cmp $12,x          ; $84bb: d5 12     
            inx                ; $84bd: e8        
__84be:     brk                ; $84be: 00        
            bvc __84e1         ; $84bf: 50 20     
            .hex db 22 f0      ; $84c1: db 22 f0  Invalid Opcode - DCP __f022,y
            brk                ; $84c4: 00        
            brk                ; $84c5: 00        
            brk                ; $84c6: 00        
            .hex 03            ; $84c7: 03        Suspected data
__84c8:     bit $0430          ; $84c8: 2c 30 04  
            jsr __f67f         ; $84cb: 20 7f f6  
            and ($d0,x)        ; $84ce: 21 d0     
            brk                ; $84d0: 00        
__84d1:     jsr __f646         ; $84d1: 20 46 f6  
            and ($d8,x)        ; $84d4: 21 d8     
            brk                ; $84d6: 00        
            brk                ; $84d7: 00        
            brk                ; $84d8: 00        
            ora ($04,x)        ; $84d9: 01 04     
            cpy #$04           ; $84db: c0 04     
            brk                ; $84dd: 00        
            brk                ; $84de: 00        
            brk                ; $84df: 00        
            .hex 04            ; $84e0: 04        Suspected data
__84e1:     brk                ; $84e1: 00        
            .hex 04 30         ; $84e2: 04 30     Invalid Opcode - NOP $30
            .hex c7 04         ; $84e4: c7 04     Invalid Opcode - DCP $04
            .hex 22            ; $84e6: 22        Invalid Opcode - KIL 
            brk                ; $84e7: 00        
            brk                ; $84e8: 00        
            brk                ; $84e9: 00        
            brk                ; $84ea: 00        
            .hex 02            ; $84eb: 02        Invalid Opcode - KIL 
            php                ; $84ec: 08        
            bpl __84f3         ; $84ed: 10 04     
            brk                ; $84ef: 00        
            brk                ; $84f0: 00        
            .hex 02            ; $84f1: 02        Invalid Opcode - KIL 
            .hex 02            ; $84f2: 02        Invalid Opcode - KIL 
__84f3:     cpx #$04           ; $84f3: e0 04     
            .hex fe 00 00      ; $84f5: fe 00 00  Bad Addr Mode - INC $0000,x
            ora ($06,x)        ; $84f8: 01 06     
            inx                ; $84fa: e8        
            .hex 04 50         ; $84fb: 04 50     Invalid Opcode - NOP $50
            clc                ; $84fd: 18        
            cmp $12,x          ; $84fe: d5 12     
            inx                ; $8500: e8        
            brk                ; $8501: 00        
            bvc __8524         ; $8502: 50 20     
            .hex db            ; $8504: db        Suspected data
__8505:     .hex 22            ; $8505: 22        Invalid Opcode - KIL 
            beq __8508         ; $8506: f0 00     
__8508:     brk                ; $8508: 00        
            brk                ; $8509: 00        
            .hex 03 0c         ; $850a: 03 0c     Invalid Opcode - SLO ($0c,x)
            bmi __8512         ; $850c: 30 04     
            bmi __8588         ; $850e: 30 78     
            ldy #$12           ; $8510: a0 12     
__8512:     bmi __8514         ; $8512: 30 00     
__8514:     bmi __84be         ; $8514: 30 a8     
            ldy #$12           ; $8516: a0 12     
            sec                ; $8518: 38        
            brk                ; $8519: 00        
            bmi __8565         ; $851a: 30 49     
            ldy #$12           ; $851c: a0 12     
            rti                ; $851e: 40        

;-------------------------------------------------------------------------------
            brk                ; $851f: 00        
            bvs __8592         ; $8520: 70 70     
            ldy #$12           ; $8522: a0 12     
__8524:     pha                ; $8524: 48        
            brk                ; $8525: 00        
            bvs __84c8         ; $8526: 70 a0     
            ldy #$12           ; $8528: a0 12     
            bvc __852c         ; $852a: 50 00     
__852c:     bvs __8505         ; $852c: 70 d7     
            ldy #$12           ; $852e: a0 12     
            cli                ; $8530: 58        
            brk                ; $8531: 00        
            brk                ; $8532: 00        
            brk                ; $8533: 00        
            .hex 23 02         ; $8534: 23 02     Invalid Opcode - RLA ($02,x)
            rti                ; $8536: 40        

;-------------------------------------------------------------------------------
            .hex 04 00         ; $8537: 04 00     Invalid Opcode - NOP $00
            brk                ; $8539: 00        
            .hex 23 02         ; $853a: 23 02     Invalid Opcode - RLA ($02,x)
            cli                ; $853c: 58        
            .hex 04 00         ; $853d: 04 00     Invalid Opcode - NOP $00
            brk                ; $853f: 00        
            brk                ; $8540: 00        
            .hex 04 00         ; $8541: 04 00     Invalid Opcode - NOP $00
            .hex 04 10         ; $8543: 04 10     Invalid Opcode - NOP $10
            .hex b7 04         ; $8545: b7 04     Invalid Opcode - LAX $04,y
            .hex 22            ; $8547: 22        Invalid Opcode - KIL 
            brk                ; $8548: 00        
            brk                ; $8549: 00        
            brk                ; $854a: 00        
            brk                ; $854b: 00        
            .hex 02            ; $854c: 02        Invalid Opcode - KIL 
            php                ; $854d: 08        
            bpl __8554         ; $854e: 10 04     
            jmp __989f         ; $8550: 4c 9f 98  

;-------------------------------------------------------------------------------
            .hex 22            ; $8553: 22        Invalid Opcode - KIL 
__8554:     bpl __8556         ; $8554: 10 00     
__8556:     cpy __9867         ; $8556: cc 67 98  
            .hex 22            ; $8559: 22        Invalid Opcode - KIL 
            jsr $0000          ; $855a: 20 00 00  
            brk                ; $855d: 00        
            .hex 03 0c         ; $855e: 03 0c     Invalid Opcode - SLO ($0c,x)
            rts                ; $8560: 60        

;-------------------------------------------------------------------------------
            .hex 04 00         ; $8561: 04 00     Invalid Opcode - NOP $00
            brk                ; $8563: 00        
            .hex 01            ; $8564: 01        Suspected data
__8565:     asl $90,x          ; $8565: 16 90     
            .hex 04 fe         ; $8567: 04 fe     Invalid Opcode - NOP $fe
            brk                ; $8569: 00        
            brk                ; $856a: 00        
            ora ($06,x)        ; $856b: 01 06     
            inx                ; $856d: e8        
            .hex 04 50         ; $856e: 04 50     Invalid Opcode - NOP $50
            clc                ; $8570: 18        
            cmp $12,x          ; $8571: d5 12     
            inx                ; $8573: e8        
            brk                ; $8574: 00        
            bvc __8597         ; $8575: 50 20     
            .hex db 22 f0      ; $8577: db 22 f0  Invalid Opcode - DCP __f022,y
            brk                ; $857a: 00        
            brk                ; $857b: 00        
            brk                ; $857c: 00        
            .hex 03 04         ; $857d: 03 04     Invalid Opcode - SLO ($04,x)
            bne __8585         ; $857f: d0 04     
            .hex 14 6e         ; $8581: 14 6e     Invalid Opcode - NOP $6e,x
            inc $21,x          ; $8583: f6 21     
__8585:     bne __8587         ; $8585: d0 00     
__8587:     .hex 7c            ; $8587: 7c        Suspected data
__8588:     lsr $f6            ; $8588: 46 f6     
            and ($d8,x)        ; $858a: 21 d8     
            brk                ; $858c: 00        
            brk                ; $858d: 00        
            brk                ; $858e: 00        
            ora ($20,x)        ; $858f: 01 20     
            .hex 50            ; $8591: 50        Suspected data
__8592:     .hex 04 00         ; $8592: 04 00     Invalid Opcode - NOP $00
            brk                ; $8594: 00        
            brk                ; $8595: 00        
            .hex 04            ; $8596: 04        Suspected data
__8597:     brk                ; $8597: 00        
            .hex 04 38         ; $8598: 04 38     Invalid Opcode - NOP $38
            .hex c7 04         ; $859a: c7 04     Invalid Opcode - DCP $04
            .hex 22            ; $859c: 22        Invalid Opcode - KIL 
            brk                ; $859d: 00        
            brk                ; $859e: 00        
            brk                ; $859f: 00        
            brk                ; $85a0: 00        
            .hex 02            ; $85a1: 02        Invalid Opcode - KIL 
            bpl __85b4         ; $85a2: 10 10     
            .hex 04 fe         ; $85a4: 04 fe     Invalid Opcode - NOP $fe
__85a6:     .hex b3            ; $85a6: b3        Suspected data
__85a7:     .hex 84            ; $85a7: 84        Suspected data
__85a8:     inc $84,x          ; $85a8: f6 84     
            inc $84,x          ; $85aa: f6 84     
            adc #$85           ; $85ac: 69 85     
__85ae:     .hex 7f 7f 7f      ; $85ae: 7f 7f 7f  Invalid Opcode - RRA $7f7f,x
            brk                ; $85b1: 00        
            .hex 5f 3f         ; $85b2: 5f 3f     Suspected data
__85b4:     brk                ; $85b4: 00        
            .hex 2f 7f 7f      ; $85b5: 2f 7f 7f  Invalid Opcode - RLA $7f7f
            brk                ; $85b8: 00        
            lda #$a9           ; $85b9: a9 a9     
            sta ($81,x)        ; $85bb: 81 81     
__85bd:     eor $3159,y        ; $85bd: 59 59 31  
            and ($00),y        ; $85c0: 31 00     
__85c2:     bmi __8610         ; $85c2: 30 4c     
            cmp $00,x          ; $85c4: d5 00     
            bpl __85a8         ; $85c6: 10 e0     
            brk                ; $85c8: 00        
            bit $50            ; $85c9: 24 50     
            cpy #$00           ; $85cb: c0 00     
            .hex 3b b3 3b      ; $85cd: 3b b3 3b  Invalid Opcode - RLA $3bb3,y
            .hex b3 3b         ; $85d0: b3 3b     Invalid Opcode - LAX ($3b),y
            .hex b3 38         ; $85d2: b3 38     Invalid Opcode - LAX ($38),y
            .hex b3 00         ; $85d4: b3 00     Invalid Opcode - LAX ($00),y
__85d6:     .hex 22            ; $85d6: 22        Invalid Opcode - KIL 
__85d7:     .hex 22            ; $85d7: 22        Invalid Opcode - KIL 
            .hex 22            ; $85d8: 22        Invalid Opcode - KIL 
            brk                ; $85d9: 00        
            and ($21,x)        ; $85da: 21 21     
            brk                ; $85dc: 00        
            .hex 20            ; $85dd: 20        Suspected data
__85de:     .hex 22            ; $85de: 22        Invalid Opcode - KIL 
            .hex 22            ; $85df: 22        Invalid Opcode - KIL 
            brk                ; $85e0: 00        
            .hex 22            ; $85e1: 22        Invalid Opcode - KIL 
            .hex 22            ; $85e2: 22        Invalid Opcode - KIL 
            .hex 22            ; $85e3: 22        Invalid Opcode - KIL 
            .hex 22            ; $85e4: 22        Invalid Opcode - KIL 
            and ($21,x)        ; $85e5: 21 21     
            and ($21,x)        ; $85e7: 21 21     
__85e9:     asl $0a            ; $85e9: 06 0a     
            .hex 1b 00 82      ; $85eb: 1b 00 82  Invalid Opcode - SLO __8200,y
            .hex 1c 00 c5      ; $85ee: 1c 00 c5  Invalid Opcode - NOP __c500,x
            asl                ; $85f1: 0a        
            clc                ; $85f2: 18        
            brk                ; $85f3: 00        
            inx                ; $85f4: e8        
            .hex f7 48         ; $85f5: f7 48     Invalid Opcode - ISC $48,x
            .hex 57 a8         ; $85f7: 57 a8     Invalid Opcode - SRE $a8,x
            .hex b7            ; $85f9: b7        Suspected data
__85fa:     php                ; $85fa: 08        
            .hex 17 00         ; $85fb: 17 00     Invalid Opcode - SLO $00,x
            .hex 04 07         ; $85fd: 04 07     Invalid Opcode - NOP $07
__85ff:     .hex 0b            ; $85ff: 0b        Suspected data
__8600:     ora ($03,x)        ; $8600: 01 03     
            ora $08            ; $8602: 05 08     
__8604:     bne __85d7         ; $8604: d0 d1     
            .hex d2            ; $8606: d2        Invalid Opcode - KIL 
            .hex d3            ; $8607: d3        Suspected data
__8608:     sty $8d            ; $8608: 84 8d     
            sty $8d            ; $860a: 84 8d     
            lsr $76            ; $860c: 46 76     
            .hex 77 78         ; $860e: 77 78     Invalid Opcode - RRA $78,x
__8610:     adc $7b7a,y        ; $8610: 79 7a 7b  
            .hex 7c 7d 7e      ; $8613: 7c 7d 7e  Invalid Opcode - NOP $7e7d,x
            .hex 7f 80 81      ; $8616: 7f 80 81  Invalid Opcode - RRA __8180,x
            .hex 82 83         ; $8619: 82 83     Invalid Opcode - NOP #$83
            sty $85            ; $861b: 84 85     
            bit $24            ; $861d: 24 24     
            stx $87            ; $861f: 86 87     
            bit $24            ; $8621: 24 24     
            bit $88            ; $8623: 24 88     
            lsr $24            ; $8625: 46 24     
            .hex 9c 9d 9e      ; $8627: 9c 9d 9e  Invalid Opcode - SHY __9e9d,x
            .hex 9f a0 a1      ; $862a: 9f a0 a1  Invalid Opcode - AHX __a1a0,y
            ldx #$a3           ; $862d: a2 a3     
            ldy $a5            ; $862f: a4 a5     
            ldx $a7            ; $8631: a6 a7     
            tay                ; $8633: a8        
            lda #$aa           ; $8634: a9 aa     
            .hex ab ac         ; $8636: ab ac     Invalid Opcode - LAX #$ac
            lda $24ae          ; $8638: ad ae 24  
            .hex af b0 b1      ; $863b: af b0 b1  Invalid Opcode - LAX __b1b0
            lsr $24            ; $863e: 46 24     
            bit $24            ; $8640: 24 24     
            .hex 89 24         ; $8642: 89 24     Invalid Opcode - NOP #$24
            bit $8a            ; $8644: 24 8a     
            .hex 8b 8c         ; $8646: 8b 8c     Invalid Opcode - XAA #$8c
            sta __8f8e         ; $8648: 8d 8e 8f  
            bcc __85de         ; $864b: 90 91     
            .hex 92            ; $864d: 92        Invalid Opcode - KIL 
            .hex 93 94         ; $864e: 93 94     Invalid Opcode - AHX ($94),y
            sta $96,x          ; $8650: 95 96     
            .hex 97 98         ; $8652: 97 98     Invalid Opcode - SAX $98,y
            sta __9b9a,y       ; $8654: 99 9a 9b  
            lsr $24            ; $8657: 46 24     
            .hex b2            ; $8659: b2        Invalid Opcode - KIL 
            pla                ; $865a: 68        
            .hex 9e b5 b6      ; $865b: 9e b5 b6  Invalid Opcode - SHX __b6b5,y
            jmp (__a3c7)       ; $865e: 6c c7 a3  

;-------------------------------------------------------------------------------
            ldy $69            ; $8661: a4 69     
            ldx $a7            ; $8663: a6 a7     
            tay                ; $8665: a8        
            .hex 6b aa         ; $8666: 6b aa     Invalid Opcode - ARR #$aa
            cmp #$ca           ; $8668: c9 ca     
            adc $24bf          ; $866a: 6d bf 24  
            cmp __b16a         ; $866d: cd 6a b1  
            lsr $c2            ; $8670: 46 c2     
            .hex c3 24         ; $8672: c3 24     Invalid Opcode - DCP ($24,x)
            .hex 9e c4 c5      ; $8674: 9e c4 c5  Invalid Opcode - SHX __c5c4,y
            dec $c7            ; $8677: c6 c7     
            .hex a3 b9         ; $8679: a3 b9     Invalid Opcode - LAX ($b9,x)
            lda $a6            ; $867b: a5 a6     
            .hex a7 bb         ; $867d: a7 bb     Invalid Opcode - LAX $bb
            .hex 6b c8         ; $867f: 6b c8     Invalid Opcode - ARR #$c8
            cmp #$ca           ; $8681: c9 ca     
            .hex cb cc         ; $8683: cb cc     Invalid Opcode - AXS #$cc
            bit $cd            ; $8685: 24 cd     
            dec $46cf          ; $8687: ce cf 46  
            bit $b2            ; $868a: 24 b2     
            .hex b3 b4         ; $868c: b3 b4     Invalid Opcode - LAX ($b4),y
            lda $b6,x          ; $868e: b5 b6     
            .hex b7 b8         ; $8690: b7 b8     Invalid Opcode - LAX $b8,y
            .hex a3 b9         ; $8692: a3 b9     Invalid Opcode - LAX ($b9,x)
            adc #$ba           ; $8694: 69 ba     
            .hex a7 bb         ; $8696: a7 bb     Invalid Opcode - LAX $bb
            lda #$aa           ; $8698: a9 aa     
            ldy __bebd,x       ; $869a: bc bd be  
            .hex bf c0 c1      ; $869d: bf c0 c1  Invalid Opcode - LAX __c1c0,y
            bit $b1            ; $86a0: 24 b1     
            .hex 13 2c         ; $86a2: 13 2c     Invalid Opcode - SLO ($2c),y
            asl $13,x          ; $86a4: 16 13     
            .hex 13 16         ; $86a6: 13 16     Invalid Opcode - SLO ($16),y
            bmi __86e1         ; $86a8: 30 37     
__86aa:     .hex 23 db         ; $86aa: 23 db     Invalid Opcode - RLA ($db,x)
            .hex 42            ; $86ac: 42        Invalid Opcode - KIL 
            ldy #$21           ; $86ad: a0 21     
            dex                ; $86af: ca        
            jmp $2124          ; $86b0: 4c 24 21  

;-------------------------------------------------------------------------------
            nop                ; $86b3: ea        
            .hex 0c 24 24      ; $86b4: 0c 24 24  Invalid Opcode - NOP $2424
            ora $0a15,y        ; $86b7: 19 15 0a  
            .hex 22            ; $86ba: 22        Invalid Opcode - KIL 
            asl $241b          ; $86bb: 0e 1b 24  
            ror $24            ; $86be: 66 24     
            bit $00            ; $86c0: 24 00     
__86c2:     .hex 23 e2         ; $86c2: 23 e2     Invalid Opcode - RLA ($e2,x)
            .hex 04 08         ; $86c4: 04 08     Invalid Opcode - NOP $08
            asl                ; $86c6: 0a        
            asl                ; $86c7: 0a        
            .hex 02            ; $86c8: 02        Invalid Opcode - KIL 
            .hex 22            ; $86c9: 22        Invalid Opcode - KIL 
            asl                ; $86ca: 0a        
            jmp $2224          ; $86cb: 4c 24 22  

;-------------------------------------------------------------------------------
            rol                ; $86ce: 2a        
            .hex 0c 24 10      ; $86cf: 0c 24 10  Invalid Opcode - NOP $1024
            asl                ; $86d2: 0a        
            asl $0e,x          ; $86d3: 16 0e     
            bit $24            ; $86d5: 24 24     
            clc                ; $86d7: 18        
            .hex 1f 0e 1b      ; $86d8: 1f 0e 1b  Invalid Opcode - SLO $1b0e,x
            bit $22            ; $86db: 24 22     
            lsr                ; $86dd: 4a        
            jmp $0024          ; $86de: 4c 24 00  

;-------------------------------------------------------------------------------
__86e1:     .hex 12            ; $86e1: 12        Invalid Opcode - KIL 
            bit $24            ; $86e2: 24 24     
            jsr $5b63          ; $86e4: 20 63 5b  
            bit $20            ; $86e7: 24 20     
            sty $4a,x          ; $86e9: 94 4a     
            bit $20            ; $86eb: 24 20     
            ldy $4a,x          ; $86ed: b4 4a     
            bit $00            ; $86ef: 24 00     
            and ($09,x)        ; $86f1: 21 09     
            lsr $2124          ; $86f3: 4e 24 21  
            lda #$4e           ; $86f6: a9 4e     
            bit $22            ; $86f8: 24 22     
            eor #$4e           ; $86fa: 49 4e     
            bit $22            ; $86fc: 24 22     
            sbc #$4e           ; $86fe: e9 4e     
            bit $3f            ; $8700: 24 3f     
            ora $3003,x        ; $8702: 1d 03 30  
            rol $06,x          ; $8705: 36 06     
            brk                ; $8707: 00        
            jsr $468d          ; $8708: 20 8d 46  
            bit $20            ; $870b: 24 20     
            lda $2446          ; $870d: ad 46 24  
            jsr $46cd          ; $8710: 20 cd 46  
            bit $20            ; $8713: 24 20     
            sbc $2446          ; $8715: ed 46 24  
            brk                ; $8718: 00        
            .hex 12            ; $8719: 12        Invalid Opcode - KIL 
            tax                ; $871a: aa        
            tax                ; $871b: aa        
            lsr $24            ; $871c: 46 24     
            bit $dc            ; $871e: 24 dc     
            cmp __d5d4,x       ; $8720: dd d4 d5  
            dec __d6df,x       ; $8723: de df d6  
            .hex d7 e0         ; $8726: d7 e0     Invalid Opcode - DCP $e0,x
            sbc ($d8,x)        ; $8728: e1 d8     
            cmp __e3e2,y       ; $872a: d9 e2 e3  
            .hex da            ; $872d: da        Invalid Opcode - NOP 
            .hex db e4 e5      ; $872e: db e4 e5  Invalid Opcode - DCP __e5e4,y
            bit $24            ; $8731: 24 24     
            inc $e7            ; $8733: e6 e7     
            lsr $e8            ; $8735: 46 e8     
            sbc #$ea           ; $8737: e9 ea     
            .hex eb ec         ; $8739: eb ec     Invalid Opcode - SBC #$ec
            sbc __efee         ; $873b: ed ee ef  
            bit $f0            ; $873e: 24 f0     
            sbc ($f2),y        ; $8740: f1 f2     
            bit $f3            ; $8742: 24 f3     
            .hex f4 f5         ; $8744: f4 f5     Invalid Opcode - NOP $f5,x
            inc $f7,x          ; $8746: f6 f7     
            sed                ; $8748: f8        
            sbc __fbfa,y       ; $8749: f9 fa fb  
            .hex fc fd 21      ; $874c: fc fd 21  Invalid Opcode - NOP $21fd,x
            php                ; $874f: 08        
__8750:     bvc __87b4         ; $8750: 50 62     
            brk                ; $8752: 00        
            .hex 23 09         ; $8753: 23 09     Invalid Opcode - RLA ($09,x)
            lsr $2362          ; $8755: 4e 62 23  
            and #$4e           ; $8758: 29 4e     
            .hex 62            ; $875a: 62        Invalid Opcode - KIL 
            .hex 23 49         ; $875b: 23 49     Invalid Opcode - RLA ($49,x)
            .hex 4e 62 00      ; $875d: 4e 62 00  Bad Addr Mode - LSR $0062
            jsr $42c5          ; $8760: 20 c5 42  
            bit $20            ; $8763: 24 20     
            dex                ; $8765: ca        
            .hex 42            ; $8766: 42        Invalid Opcode - KIL 
            bit $20            ; $8767: 24 20     
            nop                ; $8769: ea        
            .hex 42            ; $876a: 42        Invalid Opcode - KIL 
            bit $20            ; $876b: 24 20     
            sbc $42            ; $876d: e5 42     
            bit $22            ; $876f: 24 22     
            asl                ; $8771: 0a        
            .hex 42            ; $8772: 42        Invalid Opcode - KIL 
            bit $22            ; $8773: 24 22     
            rol                ; $8775: 2a        
            .hex 42            ; $8776: 42        Invalid Opcode - KIL 
            bit $22            ; $8777: 24 22     
            clc                ; $8779: 18        
            .hex 42            ; $877a: 42        Invalid Opcode - KIL 
            bit $00            ; $877b: 24 00     
            .hex 22            ; $877d: 22        Invalid Opcode - KIL 
            sec                ; $877e: 38        
            .hex 42            ; $877f: 42        Invalid Opcode - KIL 
            bit $21            ; $8780: 24 21     
__8782:     and #$c4           ; $8782: 29 c4     
            bit $21            ; $8784: 24 21     
            rol $c4,x          ; $8786: 36 c4     
            bit $21            ; $8788: 24 21     
            bne __8750         ; $878a: d0 c4     
            bit $22            ; $878c: 24 22     
            jmp ($24c4)        ; $878e: 6c c4 24  

;-------------------------------------------------------------------------------
            .hex 22            ; $8791: 22        Invalid Opcode - KIL 
            .hex 73 c4         ; $8792: 73 c4     Invalid Opcode - RRA ($c4),y
            bit $23            ; $8794: 24 23     
            .hex 0f c3 24      ; $8796: 0f c3 24  Invalid Opcode - SLO $24c3
            brk                ; $8799: 00        
__879a:     .hex ff 01         ; $879a: ff 01     Suspected data
__879c:     ora ($ff,x)        ; $879c: 01 ff     
__879e:     tax                ; $879e: aa        
            lda __84a7,x       ; $879f: bd a7 84  
            sta $00            ; $87a2: 85 00     
            lda __84a8,x       ; $87a4: bd a8 84  
            sta $01            ; $87a7: 85 01     
            jmp __e50f         ; $87a9: 4c 0f e5  

;-------------------------------------------------------------------------------
__87ac:     tax                ; $87ac: aa        
            lda __803c,x       ; $87ad: bd 3c 80  
            sta $02            ; $87b0: 85 02     
            .hex bd 3d         ; $87b2: bd 3d     Suspected data
__87b4:     .hex 80 85         ; $87b4: 80 85     Invalid Opcode - NOP #$85
            .hex 03 4c         ; $87b6: 03 4c     Invalid Opcode - SLO ($4c,x)
            lda ($e5,x)        ; $87b8: a1 e5     
__87ba:     tax                ; $87ba: aa        
            lda __803c,x       ; $87bb: bd 3c 80  
            sta $00            ; $87be: 85 00     
            lda __803d,x       ; $87c0: bd 3d 80  
            sta $01            ; $87c3: 85 01     
            jmp __8c94         ; $87c5: 4c 94 8c  

;-------------------------------------------------------------------------------
__87c8:     tax                ; $87c8: aa        
            lda __803c,x       ; $87c9: bd 3c 80  
            sta $04            ; $87cc: 85 04     
            lda __803d,x       ; $87ce: bd 3d 80  
            sta $05            ; $87d1: 85 05     
            lda __8044,x       ; $87d3: bd 44 80  
            sta $06            ; $87d6: 85 06     
            lda __8045,x       ; $87d8: bd 45 80  
            sta $07            ; $87db: 85 07     
            rts                ; $87dd: 60        

;-------------------------------------------------------------------------------
__87de:     tax                ; $87de: aa        
            lda __803c,x       ; $87df: bd 3c 80  
            sta $02            ; $87e2: 85 02     
            lda __803d,x       ; $87e4: bd 3d 80  
            sta $03            ; $87e7: 85 03     
            rts                ; $87e9: 60        

;-------------------------------------------------------------------------------
__87ea:     tax                ; $87ea: aa        
            lda __803c,x       ; $87eb: bd 3c 80  
            sta $08            ; $87ee: 85 08     
            lda __803d,x       ; $87f0: bd 3d 80  
            sta $09            ; $87f3: 85 09     
            rts                ; $87f5: 60        

;-------------------------------------------------------------------------------
__87f6:     pha                ; $87f6: 48        
            lda $10            ; $87f7: a5 10     
            and #$7f           ; $87f9: 29 7f     
            sta $2000          ; $87fb: 8d 00 20  
            sta $10            ; $87fe: 85 10     
            jsr __e483         ; $8800: 20 83 e4  
            jsr __e46f         ; $8803: 20 6f e4  
            jsr __e7eb         ; $8806: 20 eb e7  
            lda $11            ; $8809: a5 11     
            eor #$18           ; $880b: 49 18     
            sta $2001          ; $880d: 8d 01 20  
            jsr __fff7         ; $8810: 20 f7 ff  
            lda $4e            ; $8813: a5 4e     
            bne __8841         ; $8815: d0 2a     
            lda $4f            ; $8817: a5 4f     
            beq __8854         ; $8819: f0 39     
            lda $9a            ; $881b: a5 9a     
            bne __8825         ; $881d: d0 06     
            jsr __8d9a         ; $881f: 20 9a 8d  
            jmp __8857         ; $8822: 4c 57 88  

;-------------------------------------------------------------------------------
__8825:     lda $044f          ; $8825: ad 4f 04  
            cmp #$08           ; $8828: c9 08     
            bne __8854         ; $882a: d0 28     
            jsr __8c12         ; $882c: 20 12 8c  
            lda $43            ; $882f: a5 43     
            bne __8857         ; $8831: d0 24     
            lda #$00           ; $8833: a9 00     
            sta $044f          ; $8835: 8d 4f 04  
            sta $4f            ; $8838: 85 4f     
            lda #$79           ; $883a: a9 79     
            sta $43            ; $883c: 85 43     
            jmp __8857         ; $883e: 4c 57 88  

;-------------------------------------------------------------------------------
__8841:     lda $55            ; $8841: a5 55     
            bne __884b         ; $8843: d0 06     
            jsr __891c         ; $8845: 20 1c 89  
            jmp __8857         ; $8848: 4c 57 88  

;-------------------------------------------------------------------------------
__884b:     jsr __8873         ; $884b: 20 73 88  
            jsr __b316         ; $884e: 20 16 b3  
            jmp __8857         ; $8851: 4c 57 88  

;-------------------------------------------------------------------------------
__8854:     jsr __89c9         ; $8854: 20 c9 89  
__8857:     lda $0505          ; $8857: ad 05 05  
            cmp #$01           ; $885a: c9 01     
            bne __8868         ; $885c: d0 0a     
            lda $51            ; $885e: a5 51     
            sta $00            ; $8860: 85 00     
            jsr __b0fd         ; $8862: 20 fd b0  
            dec $0505          ; $8865: ce 05 05  
__8868:     lda $10            ; $8868: a5 10     
__886a:     eor #$80           ; $886a: 49 80     
            sta $2000          ; $886c: 8d 00 20  
            sta $10            ; $886f: 85 10     
            pla                ; $8871: 68        
            rti                ; $8872: 40        

;-------------------------------------------------------------------------------
__8873:     lda $58            ; $8873: a5 58     
            bne __8899         ; $8875: d0 22     
            lda #$10           ; $8877: a9 10     
            sta $0514          ; $8879: 8d 14 05  
            ldx #$0a           ; $887c: a2 0a     
            lda #$00           ; $887e: a9 00     
__8880:     sta $24,x          ; $8880: 95 24     
            dex                ; $8882: ca        
            bne __8880         ; $8883: d0 fb     
            lda $0106          ; $8885: ad 06 01  
            sta $50            ; $8888: 85 50     
            cmp #$02           ; $888a: c9 02     
            bmi __8895         ; $888c: 30 07     
            lda #$1c           ; $888e: a9 1c     
            sta $51            ; $8890: 85 51     
            jmp __8899         ; $8892: 4c 99 88  

;-------------------------------------------------------------------------------
__8895:     lda #$18           ; $8895: a9 18     
            sta $51            ; $8897: 85 51     
__8899:     lda $50            ; $8899: a5 50     
            and #$01           ; $889b: 29 01     
            asl                ; $889d: 0a        
            tax                ; $889e: aa        
            lda $010a,x        ; $889f: bd 0a 01  
            sta $21            ; $88a2: 85 21     
            lda $010b,x        ; $88a4: bd 0b 01  
            sta $22            ; $88a7: 85 22     
            lda #$0f           ; $88a9: a9 0f     
            sta $18            ; $88ab: 85 18     
            lda #$13           ; $88ad: a9 13     
            sta $19            ; $88af: 85 19     
            lda #$00           ; $88b1: a9 00     
            sta $4e            ; $88b3: 85 4e     
            sta $0406          ; $88b5: 8d 06 04  
            sta $0407          ; $88b8: 8d 07 04  
            sta $4f            ; $88bb: 85 4f     
            sta $0510          ; $88bd: 8d 10 05  
            sta $050b          ; $88c0: 8d 0b 05  
            sta $0512          ; $88c3: 8d 12 05  
            lda #$01           ; $88c6: a9 01     
            sta $53            ; $88c8: 85 53     
            sta $0400          ; $88ca: 8d 00 04  
            sta $0401          ; $88cd: 8d 01 04  
            lda #$00           ; $88d0: a9 00     
            sta $54            ; $88d2: 85 54     
            sta $0402          ; $88d4: 8d 02 04  
            sta $0403          ; $88d7: 8d 03 04  
            lda #$00           ; $88da: a9 00     
            sta $52            ; $88dc: 85 52     
            sta $0408          ; $88de: 8d 08 04  
            sta $0409          ; $88e1: 8d 09 04  
            sta $fc            ; $88e4: 85 fc     
            lda #$03           ; $88e6: a9 03     
            ldx $58            ; $88e8: a6 58     
            beq __88ee         ; $88ea: f0 02     
            lda #$01           ; $88ec: a9 01     
__88ee:     sta $55            ; $88ee: 85 55     
            sta $0404          ; $88f0: 8d 04 04  
            sta $0405          ; $88f3: 8d 05 04  
            sta $040b          ; $88f6: 8d 0b 04  
            lda $58            ; $88f9: a5 58     
            bne __890e         ; $88fb: d0 11     
            lda #$97           ; $88fd: a9 97     
            sta $43            ; $88ff: 85 43     
            lda #$01           ; $8901: a9 01     
            sta $fd            ; $8903: 85 fd     
            lda #$0f           ; $8905: a9 0f     
            sta $4015          ; $8907: 8d 15 40  
            sta $0100          ; $890a: 8d 00 01  
            rts                ; $890d: 60        

;-------------------------------------------------------------------------------
__890e:     dec $0518          ; $890e: ce 18 05  
            lda #$75           ; $8911: a9 75     
            sta $43            ; $8913: 85 43     
            lda #$0a           ; $8915: a9 0a     
            sta $34            ; $8917: 85 34     
            jmp __8ac0         ; $8919: 4c c0 8a  

;-------------------------------------------------------------------------------
__891c:     jsr __b316         ; $891c: 20 16 b3  
            lda $58            ; $891f: a5 58     
            bne __8936         ; $8921: d0 13     
            lda $43            ; $8923: a5 43     
            cmp #$75           ; $8925: c9 75     
            beq __894f         ; $8927: f0 26     
            cmp #$74           ; $8929: c9 74     
            beq __8954         ; $892b: f0 27     
            cmp #$73           ; $892d: c9 73     
            beq __8959         ; $892f: f0 28     
            cmp #$5f           ; $8931: c9 5f     
            beq __896e         ; $8933: f0 39     
            rts                ; $8935: 60        

;-------------------------------------------------------------------------------
__8936:     sta $55            ; $8936: 85 55     
            lda #$00           ; $8938: a9 00     
            sta $58            ; $893a: 85 58     
            sta $0510          ; $893c: 8d 10 05  
            lda #$40           ; $893f: a9 40     
            sta $0103          ; $8941: 8d 03 01  
            lda #$00           ; $8944: a9 00     
            sta $0104          ; $8946: 8d 04 01  
__8949:     jsr __8ac9         ; $8949: 20 c9 8a  
            jmp __8ac0         ; $894c: 4c c0 8a  

;-------------------------------------------------------------------------------
__894f:     dec $43            ; $894f: c6 43     
            jmp __8ac0         ; $8951: 4c c0 8a  

;-------------------------------------------------------------------------------
__8954:     dec $43            ; $8954: c6 43     
            jmp __8ae8         ; $8956: 4c e8 8a  

;-------------------------------------------------------------------------------
__8959:     dec $43            ; $8959: c6 43     
            lda $50            ; $895b: a5 50     
            and #$01           ; $895d: 29 01     
            asl                ; $895f: 0a        
            tax                ; $8960: aa        
            lda $21            ; $8961: a5 21     
            sta $010a,x        ; $8963: 9d 0a 01  
            lda $22            ; $8966: a5 22     
            sta $010b,x        ; $8968: 9d 0b 01  
            jmp __8b13         ; $896b: 4c 13 8b  

;-------------------------------------------------------------------------------
__896e:     ldx $52            ; $896e: a6 52     
            lda #$01           ; $8970: a9 01     
            sta $0406,x        ; $8972: 9d 06 04  
            sta $4e            ; $8975: 85 4e     
            lda $51            ; $8977: a5 51     
            cmp #$1c           ; $8979: c9 1c     
            bne __8989         ; $897b: d0 0c     
            lda $52            ; $897d: a5 52     
            eor #$01           ; $897f: 49 01     
            tax                ; $8981: aa        
            lda $0406,x        ; $8982: bd 06 04  
            sta $4e            ; $8985: 85 4e     
            beq __8999         ; $8987: f0 10     
__8989:     sta $55            ; $8989: 85 55     
            jsr __8949         ; $898b: 20 49 89  
            lda #$40           ; $898e: a9 40     
            sta $0103          ; $8990: 8d 03 01  
            lda #$00           ; $8993: a9 00     
            sta $0104          ; $8995: 8d 04 01  
            rts                ; $8998: 60        

;-------------------------------------------------------------------------------
__8999:     lda #$85           ; $8999: a9 85     
            sta $43            ; $899b: 85 43     
            sta $040b          ; $899d: 8d 0b 04  
            ldy #$00           ; $89a0: a0 00     
            sty $4f            ; $89a2: 84 4f     
            stx $52            ; $89a4: 86 52     
            jmp __89a9         ; $89a6: 4c a9 89  

;-------------------------------------------------------------------------------
__89a9:     ldy #$00           ; $89a9: a0 00     
__89ab:     lda $0400,x        ; $89ab: bd 00 04  
            sta $0053,y        ; $89ae: 99 53 00  
            inx                ; $89b1: e8        
            inx                ; $89b2: e8        
            iny                ; $89b3: c8        
            cpy #$03           ; $89b4: c0 03     
            bne __89ab         ; $89b6: d0 f3     
            rts                ; $89b8: 60        

;-------------------------------------------------------------------------------
__89b9:     ldy #$00           ; $89b9: a0 00     
__89bb:     lda $0053,y        ; $89bb: b9 53 00  
            sta $0400,x        ; $89be: 9d 00 04  
            inx                ; $89c1: e8        
            inx                ; $89c2: e8        
            iny                ; $89c3: c8        
            cpy #$03           ; $89c4: c0 03     
            bne __89bb         ; $89c6: d0 f3     
            rts                ; $89c8: 60        

;-------------------------------------------------------------------------------
__89c9:     jsr __b316         ; $89c9: 20 16 b3  
            lda $53            ; $89cc: a5 53     
            cmp #$01           ; $89ce: c9 01     
            beq __89d8         ; $89d0: f0 06     
            lda $43            ; $89d2: a5 43     
            cmp #$84           ; $89d4: c9 84     
            beq __8a00         ; $89d6: f0 28     
__89d8:     lda $43            ; $89d8: a5 43     
            cmp #$72           ; $89da: c9 72     
            bcs __8a16         ; $89dc: b0 38     
            cmp #$6d           ; $89de: c9 6d     
            beq __89e7         ; $89e0: f0 05     
            cmp #$62           ; $89e2: c9 62     
            beq __89f9         ; $89e4: f0 13     
            rts                ; $89e6: 60        

;-------------------------------------------------------------------------------
__89e7:     lda $040b          ; $89e7: ad 0b 04  
            beq __89f6         ; $89ea: f0 0a     
            lda #$00           ; $89ec: a9 00     
            sta $040b          ; $89ee: 8d 0b 04  
            dec $55            ; $89f1: c6 55     
            jsr __8adb         ; $89f3: 20 db 8a  
__89f6:     jmp __8b52         ; $89f6: 4c 52 8b  

;-------------------------------------------------------------------------------
__89f9:     lda #$01           ; $89f9: a9 01     
            sta $4f            ; $89fb: 85 4f     
            jmp __8b65         ; $89fd: 4c 65 8b  

;-------------------------------------------------------------------------------
__8a00:     ldx $52            ; $8a00: a6 52     
            lda $53            ; $8a02: a5 53     
            cmp $0400,x        ; $8a04: dd 00 04  
            beq __8a13         ; $8a07: f0 0a     
            cmp #$01           ; $8a09: c9 01     
            beq __8a13         ; $8a0b: f0 06     
            jsr __8b42         ; $8a0d: 20 42 8b  
            jsr __8b22         ; $8a10: 20 22 8b  
__8a13:     dec $43            ; $8a13: c6 43     
            rts                ; $8a15: 60        

;-------------------------------------------------------------------------------
__8a16:     cmp #$7a           ; $8a16: c9 7a     
            beq __8a2b         ; $8a18: f0 11     
            cmp #$75           ; $8a1a: c9 75     
            beq __8a3f         ; $8a1c: f0 21     
            cmp #$74           ; $8a1e: c9 74     
            beq __8a3c         ; $8a20: f0 1a     
            cmp #$73           ; $8a22: c9 73     
            beq __8a5e         ; $8a24: f0 38     
            cmp #$72           ; $8a26: c9 72     
            beq __8a4d         ; $8a28: f0 23     
            rts                ; $8a2a: 60        

;-------------------------------------------------------------------------------
__8a2b:     lda #$35           ; $8a2b: a9 35     
            sta $00            ; $8a2d: 85 00     
            lda #$f2           ; $8a2f: a9 f2     
            sta $01            ; $8a31: 85 01     
            jsr __e50f         ; $8a33: 20 0f e5  
            jsr __8949         ; $8a36: 20 49 89  
            jsr __8ae8         ; $8a39: 20 e8 8a  
__8a3c:     dec $43            ; $8a3c: c6 43     
            rts                ; $8a3e: 60        

;-------------------------------------------------------------------------------
__8a3f:     jsr __8ac9         ; $8a3f: 20 c9 8a  
            dec $43            ; $8a42: c6 43     
            lda $58            ; $8a44: a5 58     
            bne __8a4c         ; $8a46: d0 04     
            lda #$08           ; $8a48: a9 08     
            sta $fd            ; $8a4a: 85 fd     
__8a4c:     rts                ; $8a4c: 60        

;-------------------------------------------------------------------------------
__8a4d:     dec $43            ; $8a4d: c6 43     
            ldx $53            ; $8a4f: a6 53     
            dex                ; $8a51: ca        
            lda __8608,x       ; $8a52: bd 08 86  
            sta $00            ; $8a55: 85 00     
            lda #$20           ; $8a57: a9 20     
            sta $01            ; $8a59: 85 01     
            jmp __aab7         ; $8a5b: 4c b7 aa  

;-------------------------------------------------------------------------------
__8a5e:     jsr __c093         ; $8a5e: 20 93 c0  
            lda #$10           ; $8a61: a9 10     
            sta $2000          ; $8a63: 8d 00 20  
            sta $10            ; $8a66: 85 10     
            lda #$00           ; $8a68: a9 00     
            jsr __effe         ; $8a6a: 20 fe ef  
            ldx $53            ; $8a6d: a6 53     
            dex                ; $8a6f: ca        
            txa                ; $8a70: 8a        
            asl                ; $8a71: 0a        
            jsr __879e         ; $8a72: 20 9e 87  
            lda #$0a           ; $8a75: a9 0a     
            jsr __879e         ; $8a77: 20 9e 87  
            lda $51            ; $8a7a: a5 51     
            cmp #$1c           ; $8a7c: c9 1c     
            beq __8a8d         ; $8a7e: f0 0d     
            lda #$76           ; $8a80: a9 76     
            sta $00            ; $8a82: 85 00     
            lda #$20           ; $8a84: a9 20     
            sta $01            ; $8a86: 85 01     
            lda #$04           ; $8a88: a9 04     
            jsr __87ac         ; $8a8a: 20 ac 87  
__8a8d:     lda #$01           ; $8a8d: a9 01     
            sta $0505          ; $8a8f: 8d 05 05  
            jsr __8f51         ; $8a92: 20 51 8f  
            jsr __8adb         ; $8a95: 20 db 8a  
            lda #$bc           ; $8a98: a9 bc     
            sta $00            ; $8a9a: 85 00     
            ldy $54            ; $8a9c: a4 54     
            iny                ; $8a9e: c8        
            jsr __b32c         ; $8a9f: 20 2c b3  
            lda #$00           ; $8aa2: a9 00     
            sta $2c            ; $8aa4: 85 2c     
            lda #$80           ; $8aa6: a9 80     
            dey                ; $8aa8: 88        
            cpy #$04           ; $8aa9: c0 04     
            bpl __8ab0         ; $8aab: 10 03     
            lda __8207,y       ; $8aad: b9 07 82  
__8ab0:     sta $2e            ; $8ab0: 85 2e     
            lda #$0d           ; $8ab2: a9 0d     
            sta $45            ; $8ab4: 85 45     
            lda #$02           ; $8ab6: a9 02     
            sta $00            ; $8ab8: 85 00     
            jsr __b0fd         ; $8aba: 20 fd b0  
            dec $43            ; $8abd: c6 43     
            rts                ; $8abf: 60        

;-------------------------------------------------------------------------------
__8ac0:     lda #$00           ; $8ac0: a9 00     
            sta $04            ; $8ac2: 85 04     
            lda #$ff           ; $8ac4: a9 ff     
            jmp __afa3         ; $8ac6: 4c a3 af  

;-------------------------------------------------------------------------------
__8ac9:     jsr __c093         ; $8ac9: 20 93 c0  
            lda #$10           ; $8acc: a9 10     
            sta $2000          ; $8ace: 8d 00 20  
            sta $10            ; $8ad1: 85 10     
            lda #$00           ; $8ad3: a9 00     
            jsr __effe         ; $8ad5: 20 fe ef  
            jmp __b0c5         ; $8ad8: 4c c5 b0  

;-------------------------------------------------------------------------------
__8adb:     lda #$b5           ; $8adb: a9 b5     
            sta $00            ; $8add: 85 00     
            lda #$20           ; $8adf: a9 20     
            sta $01            ; $8ae1: 85 01     
            ldy $55            ; $8ae3: a4 55     
            jmp __b32c         ; $8ae5: 4c 2c b3  

;-------------------------------------------------------------------------------
__8ae8:     lda $58            ; $8ae8: a5 58     
            bne __8b12         ; $8aea: d0 26     
            lda $51            ; $8aec: a5 51     
            cmp #$1c           ; $8aee: c9 1c     
            bne __8b12         ; $8af0: d0 20     
            ldx $52            ; $8af2: a6 52     
            lda $53            ; $8af4: a5 53     
            cmp $0400,x        ; $8af6: dd 00 04  
            bne __8b12         ; $8af9: d0 17     
            ldy #$00           ; $8afb: a0 00     
__8afd:     lda __86aa,y       ; $8afd: b9 aa 86  
            sta $0331,y        ; $8b00: 99 31 03  
            beq __8b09         ; $8b03: f0 04     
            iny                ; $8b05: c8        
            jmp __8afd         ; $8b06: 4c fd 8a  

;-------------------------------------------------------------------------------
__8b09:     lda $52            ; $8b09: a5 52     
            beq __8b12         ; $8b0b: f0 05     
            lda #$67           ; $8b0d: a9 67     
            sta $0345          ; $8b0f: 8d 45 03  
__8b12:     rts                ; $8b12: 60        

;-------------------------------------------------------------------------------
__8b13:     ldy #$00           ; $8b13: a0 00     
__8b15:     lda __86c2,y       ; $8b15: b9 c2 86  
            sta $0331,y        ; $8b18: 99 31 03  
            beq __8b21         ; $8b1b: f0 04     
            iny                ; $8b1d: c8        
            jmp __8b15         ; $8b1e: 4c 15 8b  

;-------------------------------------------------------------------------------
__8b21:     rts                ; $8b21: 60        

;-------------------------------------------------------------------------------
__8b22:     lda $58            ; $8b22: a5 58     
            bne __8b41         ; $8b24: d0 1b     
            ldx $52            ; $8b26: a6 52     
            lda $0408,x        ; $8b28: bd 08 04  
            bne __8b41         ; $8b2b: d0 14     
            txa                ; $8b2d: 8a        
            tay                ; $8b2e: a8        
            clc                ; $8b2f: 18        
            asl                ; $8b30: 0a        
            asl                ; $8b31: 0a        
            tax                ; $8b32: aa        
            lda $25,x          ; $8b33: b5 25     
            cmp #$02           ; $8b35: c9 02     
            bcc __8b41         ; $8b37: 90 08     
            sta $0408,y        ; $8b39: 99 08 04  
            inc $55            ; $8b3c: e6 55     
            jsr __8adb         ; $8b3e: 20 db 8a  
__8b41:     rts                ; $8b41: 60        

;-------------------------------------------------------------------------------
__8b42:     lda $2e            ; $8b42: a5 2e     
            sta $00            ; $8b44: 85 00     
            lda $52            ; $8b46: a5 52     
            ora #$08           ; $8b48: 09 08     
            sta $01            ; $8b4a: 85 01     
            jsr __b1ac         ; $8b4c: 20 ac b1  
            jmp __8f51         ; $8b4f: 4c 51 8f  

;-------------------------------------------------------------------------------
__8b52:     lda #$01           ; $8b52: a9 01     
            sta $0505          ; $8b54: 8d 05 05  
            jsr __8f51         ; $8b57: 20 51 8f  
            lda #$00           ; $8b5a: a9 00     
            sta $050b          ; $8b5c: 8d 0b 05  
            jsr __8bdf         ; $8b5f: 20 df 8b  
            jmp __9707         ; $8b62: 4c 07 97  

;-------------------------------------------------------------------------------
__8b65:     lda #$00           ; $8b65: a9 00     
            tax                ; $8b67: aa        
__8b68:     sta $59,x          ; $8b68: 95 59     
            sta $040d,x        ; $8b6a: 9d 0d 04  
            inx                ; $8b6d: e8        
            cpx #$89           ; $8b6e: e0 89     
            bne __8b68         ; $8b70: d0 f6     
            lda #$01           ; $8b72: a9 01     
            sta $59            ; $8b74: 85 59     
            sta $96            ; $8b76: 85 96     
            sta $043e          ; $8b78: 8d 3e 04  
            sta $0451          ; $8b7b: 8d 51 04  
            sta $0452          ; $8b7e: 8d 52 04  
            sta $9f            ; $8b81: 85 9f     
            sta $0503          ; $8b83: 8d 03 05  
            lda #$04           ; $8b86: a9 04     
            sta $97            ; $8b88: 85 97     
            lda #$58           ; $8b8a: a9 58     
__8b8c:     sta $043d          ; $8b8c: 8d 3d 04  
            lda #$20           ; $8b8f: a9 20     
            sta $a2            ; $8b91: 85 a2     
            lda #$80           ; $8b93: a9 80     
            sta $18            ; $8b95: 85 18     
            lda #$0a           ; $8b97: a9 0a     
            sta $34            ; $8b99: 85 34     
            ldx $52            ; $8b9b: a6 52     
            jsr __89b9         ; $8b9d: 20 b9 89  
            lda #$bb           ; $8ba0: a9 bb     
            sta $39            ; $8ba2: 85 39     
            lda #$27           ; $8ba4: a9 27     
            sta $44            ; $8ba6: 85 44     
            lda $53            ; $8ba8: a5 53     
            cmp #$01           ; $8baa: c9 01     
            beq __8bb7         ; $8bac: f0 09     
            cmp #$03           ; $8bae: c9 03     
            beq __8bc4         ; $8bb0: f0 12     
            lda #$10           ; $8bb2: a9 10     
            sta $fc            ; $8bb4: 85 fc     
            rts                ; $8bb6: 60        

;-------------------------------------------------------------------------------
__8bb7:     lda #$38           ; $8bb7: a9 38     
            sta $36            ; $8bb9: 85 36     
            lda #$40           ; $8bbb: a9 40     
            sta $43            ; $8bbd: 85 43     
            lda #$02           ; $8bbf: a9 02     
            sta $fc            ; $8bc1: 85 fc     
            rts                ; $8bc3: 60        

;-------------------------------------------------------------------------------
__8bc4:     lda #$20           ; $8bc4: a9 20     
            sta $36            ; $8bc6: 85 36     
            lda #$50           ; $8bc8: a9 50     
            sta $043f          ; $8bca: 8d 3f 04  
            sta $0441          ; $8bcd: 8d 41 04  
            sta $0443          ; $8bd0: 8d 43 04  
            lda #$03           ; $8bd3: a9 03     
            sta $0440          ; $8bd5: 8d 40 04  
            sta $0442          ; $8bd8: 8d 42 04  
            sta $0444          ; $8bdb: 8d 44 04  
            rts                ; $8bde: 60        

;-------------------------------------------------------------------------------
__8bdf:     lda $53            ; $8bdf: a5 53     
            sec                ; $8be1: 38        
            sbc #$01           ; $8be2: e9 01     
            asl                ; $8be4: 0a        
            tax                ; $8be5: aa        
            lda __85a6,x       ; $8be6: bd a6 85  
            sta $09            ; $8be9: 85 09     
            lda __85a7,x       ; $8beb: bd a7 85  
            sta $0a            ; $8bee: 85 0a     
            ldx #$00           ; $8bf0: a2 00     
            ldy #$00           ; $8bf2: a0 00     
__8bf4:     lda ($09),y        ; $8bf4: b1 09     
            cmp #$fe           ; $8bf6: c9 fe     
            beq __8c11         ; $8bf8: f0 17     
            sta $00,x          ; $8bfa: 95 00     
            iny                ; $8bfc: c8        
            inx                ; $8bfd: e8        
            cpx #$05           ; $8bfe: e0 05     
            bne __8bf4         ; $8c00: d0 f2     
            sty $86            ; $8c02: 84 86     
            lda ($09),y        ; $8c04: b1 09     
            jsr __afa7         ; $8c06: 20 a7 af  
            ldy $86            ; $8c09: a4 86     
            iny                ; $8c0b: c8        
            ldx #$00           ; $8c0c: a2 00     
            jmp __8bf4         ; $8c0e: 4c f4 8b  

;-------------------------------------------------------------------------------
__8c11:     rts                ; $8c11: 60        

;-------------------------------------------------------------------------------
__8c12:     lda $0450          ; $8c12: ad 50 04  
            bne __8c25         ; $8c15: d0 0e     
            lda #$01           ; $8c17: a9 01     
            sta $0450          ; $8c19: 8d 50 04  
            lda #$0a           ; $8c1c: a9 0a     
            sta $34            ; $8c1e: 85 34     
            lda #$10           ; $8c20: a9 10     
            sta $fd            ; $8c22: 85 fd     
            rts                ; $8c24: 60        

;-------------------------------------------------------------------------------
__8c25:     lda $43            ; $8c25: a5 43     
            cmp #$58           ; $8c27: c9 58     
            bcc __8c31         ; $8c29: 90 06     
            jsr __b316         ; $8c2b: 20 16 b3  
            jmp __8c40         ; $8c2e: 4c 40 8c  

;-------------------------------------------------------------------------------
__8c31:     jsr __8b42         ; $8c31: 20 42 8b  
            jsr __8b22         ; $8c34: 20 22 8b  
            lda #$00           ; $8c37: a9 00     
            sta $43            ; $8c39: 85 43     
            sta $9a            ; $8c3b: 85 9a     
            jmp __8949         ; $8c3d: 4c 49 89  

;-------------------------------------------------------------------------------
__8c40:     lda $43            ; $8c40: a5 43     
            cmp #$9f           ; $8c42: c9 9f     
            beq __8c63         ; $8c44: f0 1d     
            .hex c9            ; $8c46: c9        Suspected data
__8c47:     .hex 9e f0 1e      ; $8c47: 9e f0 1e  Invalid Opcode - SHX $1ef0,y
            cmp #$9d           ; $8c4a: c9 9d     
            beq __8c6d         ; $8c4c: f0 1f     
            cmp #$9c           ; $8c4e: c9 9c     
            beq __8c76         ; $8c50: f0 24     
            cmp #$9b           ; $8c52: c9 9b     
            beq __8c7f         ; $8c54: f0 29     
            cmp #$90           ; $8c56: c9 90     
            bcs __8c84         ; $8c58: b0 2a     
            cmp #$86           ; $8c5a: c9 86     
            bcs __8c87         ; $8c5c: b0 29     
            cmp #$70           ; $8c5e: c9 70     
            bcs __8c8a         ; $8c60: b0 28     
            rts                ; $8c62: 60        

;-------------------------------------------------------------------------------
__8c63:     dec $43            ; $8c63: c6 43     
            jmp __8c8d         ; $8c65: 4c 8d 8c  

;-------------------------------------------------------------------------------
            dec $43            ; $8c68: c6 43     
            jmp __8c9d         ; $8c6a: 4c 9d 8c  

;-------------------------------------------------------------------------------
__8c6d:     ldy #$1c           ; $8c6d: a0 1c     
            dec $43            ; $8c6f: c6 43     
            lda #$06           ; $8c71: a9 06     
            jmp __87ba         ; $8c73: 4c ba 87  

;-------------------------------------------------------------------------------
__8c76:     ldy #$1c           ; $8c76: a0 1c     
            dec $43            ; $8c78: c6 43     
            lda #$08           ; $8c7a: a9 08     
            jmp __87ba         ; $8c7c: 4c ba 87  

;-------------------------------------------------------------------------------
__8c7f:     dec $43            ; $8c7f: c6 43     
            jmp __8ca7         ; $8c81: 4c a7 8c  

;-------------------------------------------------------------------------------
__8c84:     jmp __8cbb         ; $8c84: 4c bb 8c  

;-------------------------------------------------------------------------------
__8c87:     jmp __8ccf         ; $8c87: 4c cf 8c  

;-------------------------------------------------------------------------------
__8c8a:     jmp __8d42         ; $8c8a: 4c 42 8d  

;-------------------------------------------------------------------------------
__8c8d:     ldy #$0c           ; $8c8d: a0 0c     
            lda #$0a           ; $8c8f: a9 0a     
            jmp __87ba         ; $8c91: 4c ba 87  

;-------------------------------------------------------------------------------
__8c94:     lda ($00),y        ; $8c94: b1 00     
            sta $0331,y        ; $8c96: 99 31 03  
            dey                ; $8c99: 88        
            bpl __8c94         ; $8c9a: 10 f8     
            rts                ; $8c9c: 60        

;-------------------------------------------------------------------------------
__8c9d:     jsr __8ac0         ; $8c9d: 20 c0 8a  
            ldy #$16           ; $8ca0: a0 16     
            lda #$0c           ; $8ca2: a9 0c     
            jmp __87ba         ; $8ca4: 4c ba 87  

;-------------------------------------------------------------------------------
__8ca7:     ldy #$0c           ; $8ca7: a0 0c     
            lda #$0e           ; $8ca9: a9 0e     
            .hex 20 ba         ; $8cab: 20 ba     Suspected data
__8cad:     .hex 87 a9         ; $8cad: 87 a9     Invalid Opcode - SAX $a9
            .hex 03 85         ; $8caf: 03 85     Invalid Opcode - SLO ($85,x)
            .hex 02            ; $8cb1: 02        Invalid Opcode - KIL 
            lda #$18           ; $8cb2: a9 18     
            sta $03            ; $8cb4: 85 03     
            lda #$50           ; $8cb6: a9 50     
            jmp __af9d         ; $8cb8: 4c 9d af  

;-------------------------------------------------------------------------------
__8cbb:     lda #$8d           ; $8cbb: a9 8d     
            sta $00            ; $8cbd: 85 00     
            lda #$20           ; $8cbf: a9 20     
            sta $01            ; $8cc1: 85 01     
            lda $43            ; $8cc3: a5 43     
            and #$01           ; $8cc5: 29 01     
            beq __8ccc         ; $8cc7: f0 03     
            jmp __aa9a         ; $8cc9: 4c 9a aa  

;-------------------------------------------------------------------------------
__8ccc:     jmp __aaa3         ; $8ccc: 4c a3 aa  

;-------------------------------------------------------------------------------
__8ccf:     cmp #$8f           ; $8ccf: c9 8f     
            bne __8cf5         ; $8cd1: d0 22     
            dec $43            ; $8cd3: c6 43     
            ldy #$10           ; $8cd5: a0 10     
            lda #$10           ; $8cd7: a9 10     
            jsr __87ba         ; $8cd9: 20 ba 87  
            lda #$01           ; $8cdc: a9 01     
            sta $fe            ; $8cde: 85 fe     
            lda #$68           ; $8ce0: a9 68     
            sta $00            ; $8ce2: 85 00     
            lda #$3e           ; $8ce4: a9 3e     
            sta $01            ; $8ce6: 85 01     
__8ce8:     lda #$40           ; $8ce8: a9 40     
            sta $02            ; $8cea: 85 02     
            lda #$46           ; $8cec: a9 46     
            sta $03            ; $8cee: 85 03     
            lda #$50           ; $8cf0: a9 50     
            jmp __af91         ; $8cf2: 4c 91 af  

;-------------------------------------------------------------------------------
__8cf5:     lda $0250          ; $8cf5: ad 50 02  
            cmp #$a0           ; $8cf8: c9 a0     
            beq __8d0d         ; $8cfa: f0 11     
            cmp #$ff           ; $8cfc: c9 ff     
            beq __8d11         ; $8cfe: f0 11     
            clc                ; $8d00: 18        
            adc #$02           ; $8d01: 69 02     
            sta $01            ; $8d03: 85 01     
            lda $0253          ; $8d05: ad 53 02  
            sta $00            ; $8d08: 85 00     
            jmp __8ce8         ; $8d0a: 4c e8 8c  

;-------------------------------------------------------------------------------
__8d0d:     lda #$80           ; $8d0d: a9 80     
            sta $fe            ; $8d0f: 85 fe     
__8d11:     lda #$18           ; $8d11: a9 18     
            sta $03            ; $8d13: 85 03     
            lda #$50           ; $8d15: a9 50     
            jsr __af9d         ; $8d17: 20 9d af  
            lda #$eb           ; $8d1a: a9 eb     
            sta $00            ; $8d1c: 85 00     
            lda #$23           ; $8d1e: a9 23     
            sta $01            ; $8d20: 85 01     
            lda #$12           ; $8d22: a9 12     
            jsr __87ac         ; $8d24: 20 ac 87  
            lda #$01           ; $8d27: a9 01     
            jmp __8d2c         ; $8d29: 4c 2c 8d  

;-------------------------------------------------------------------------------
__8d2c:     php                ; $8d2c: 08        
            lda #$8d           ; $8d2d: a9 8d     
            sta $00            ; $8d2f: 85 00     
            lda #$22           ; $8d31: a9 22     
            sta $01            ; $8d33: 85 01     
            plp                ; $8d35: 28        
            bne __8d3d         ; $8d36: d0 05     
            lda #$16           ; $8d38: a9 16     
            jmp __87ac         ; $8d3a: 4c ac 87  

;-------------------------------------------------------------------------------
__8d3d:     lda #$14           ; $8d3d: a9 14     
            jmp __87ac         ; $8d3f: 4c ac 87  

;-------------------------------------------------------------------------------
__8d42:     cmp #$85           ; $8d42: c9 85     
            beq __8d4d         ; $8d44: f0 07     
            lda $43            ; $8d46: a5 43     
            and #$01           ; $8d48: 29 01     
            jmp __8d2c         ; $8d4a: 4c 2c 8d  

;-------------------------------------------------------------------------------
__8d4d:     lda #$04           ; $8d4d: a9 04     
            sta $fd            ; $8d4f: 85 fd     
            ldy #$04           ; $8d51: a0 04     
            lda #$18           ; $8d53: a9 18     
            jsr __87ba         ; $8d55: 20 ba 87  
            lda #$78           ; $8d58: a9 78     
            sta $00            ; $8d5a: 85 00     
            lda #$20           ; $8d5c: a9 20     
            sta $01            ; $8d5e: 85 01     
            lda #$c8           ; $8d60: a9 c8     
            sta $02            ; $8d62: 85 02     
            lda #$22           ; $8d64: a9 22     
            sta $03            ; $8d66: 85 03     
            lda #$b0           ; $8d68: a9 b0     
            jsr __af91         ; $8d6a: 20 91 af  
            dec $43            ; $8d6d: c6 43     
            lda #$a0           ; $8d6f: a9 a0     
            sta $00            ; $8d71: 85 00     
            lda #$30           ; $8d73: a9 30     
            sta $01            ; $8d75: 85 01     
            lda #$04           ; $8d77: a9 04     
            jsr __a9e5         ; $8d79: 20 e5 a9  
            lda #$00           ; $8d7c: a9 00     
            jsr __af97         ; $8d7e: 20 97 af  
            lda #$28           ; $8d81: a9 28     
            sta $02e8          ; $8d83: 8d e8 02  
            sta $02ec          ; $8d86: 8d ec 02  
            lda #$30           ; $8d89: a9 30     
            .hex 8d f0         ; $8d8b: 8d f0     Suspected data
__8d8d:     .hex 02            ; $8d8d: 02        Invalid Opcode - KIL 
            sta $02f8          ; $8d8e: 8d f8 02  
            lda #$38           ; $8d91: a9 38     
            sta $02f4          ; $8d93: 8d f4 02  
            sta $02fc          ; $8d96: 8d fc 02  
            rts                ; $8d99: 60        

;-------------------------------------------------------------------------------
__8d9a:     lda $58            ; $8d9a: a5 58     
            beq __8db2         ; $8d9c: f0 14     
            lda $0102          ; $8d9e: ad 02 01  
            bne __8da9         ; $8da1: d0 06     
            sta $4015          ; $8da3: 8d 15 40  
            sta $0100          ; $8da6: 8d 00 01  
__8da9:     lda $15            ; $8da9: a5 15     
            and #$20           ; $8dab: 29 20     
            beq __8db2         ; $8dad: f0 03     
            jmp __8e49         ; $8daf: 4c 49 8e  

;-------------------------------------------------------------------------------
__8db2:     lda $0516          ; $8db2: ad 16 05  
            bne __8dcc         ; $8db5: d0 15     
            lda $0517          ; $8db7: ad 17 05  
            beq __8dc0         ; $8dba: f0 04     
            dec $0517          ; $8dbc: ce 17 05  
            rts                ; $8dbf: 60        

;-------------------------------------------------------------------------------
__8dc0:     jsr __8b22         ; $8dc0: 20 22 8b  
            jsr __8ec7         ; $8dc3: 20 c7 8e  
            lda $9a            ; $8dc6: a5 9a     
            cmp #$01           ; $8dc8: c9 01     
            bne __8dcf         ; $8dca: d0 03     
__8dcc:     jmp __8e3a         ; $8dcc: 4c 3a 8e  

;-------------------------------------------------------------------------------
__8dcf:     lda $bf            ; $8dcf: a5 bf     
            beq __8dd6         ; $8dd1: f0 03     
            jmp __8e31         ; $8dd3: 4c 31 8e  

;-------------------------------------------------------------------------------
__8dd6:     lda $96            ; $8dd6: a5 96     
            cmp #$ff           ; $8dd8: c9 ff     
            bne __8ddf         ; $8dda: d0 03     
            jmp __8e37         ; $8ddc: 4c 37 8e  

;-------------------------------------------------------------------------------
__8ddf:     cmp #$08           ; $8ddf: c9 08     
            beq __8df4         ; $8de1: f0 11     
            cmp #$04           ; $8de3: c9 04     
            beq __8df4         ; $8de5: f0 0d     
            lda $58            ; $8de7: a5 58     
            beq __8df1         ; $8de9: f0 06     
            jsr __aaeb         ; $8deb: 20 eb aa  
            jmp __8df4         ; $8dee: 4c f4 8d  

;-------------------------------------------------------------------------------
__8df1:     jsr __9094         ; $8df1: 20 94 90  
__8df4:     jsr __aa17         ; $8df4: 20 17 aa  
            jsr __aac7         ; $8df7: 20 c7 aa  
            jsr __8f60         ; $8dfa: 20 60 8f  
            jsr __90b9         ; $8dfd: 20 b9 90  
            jsr __a970         ; $8e00: 20 70 a9  
            jsr __a0f6         ; $8e03: 20 f6 a0  
            jsr __ad8a         ; $8e06: 20 8a ad  
            lda $53            ; $8e09: a5 53     
            cmp #$03           ; $8e0b: c9 03     
            beq __8e1f         ; $8e0d: f0 10     
            cmp #$04           ; $8e0f: c9 04     
            beq __8e2b         ; $8e11: f0 18     
            jsr __992a         ; $8e13: 20 2a 99  
            jsr __a0ab         ; $8e16: 20 ab a0  
            jsr __ab3a         ; $8e19: 20 3a ab  
            jmp __8e3a         ; $8e1c: 4c 3a 8e  

;-------------------------------------------------------------------------------
__8e1f:     jsr __a745         ; $8e1f: 20 45 a7  
            jsr __a892         ; $8e22: 20 92 a8  
            jsr __ab3a         ; $8e25: 20 3a ab  
            jmp __8e3a         ; $8e28: 4c 3a 8e  

;-------------------------------------------------------------------------------
__8e2b:     jsr __ab3a         ; $8e2b: 20 3a ab  
            jmp __8e3a         ; $8e2e: 4c 3a 8e  

;-------------------------------------------------------------------------------
__8e31:     jsr __ad1d         ; $8e31: 20 1d ad  
            jmp __8e3a         ; $8e34: 4c 3a 8e  

;-------------------------------------------------------------------------------
__8e37:     jsr __8fdf         ; $8e37: 20 df 8f  
__8e3a:     jsr __8e6a         ; $8e3a: 20 6a 8e  
            lda $0516          ; $8e3d: ad 16 05  
            bne __8e48         ; $8e40: d0 06     
            jsr __8f6b         ; $8e42: 20 6b 8f  
            jsr __b316         ; $8e45: 20 16 b3  
__8e48:     rts                ; $8e48: 60        

;-------------------------------------------------------------------------------
__8e49:     lda #$01           ; $8e49: a9 01     
            sta $4e            ; $8e4b: 85 4e     
            sta $0512          ; $8e4d: 8d 12 05  
            sta $55            ; $8e50: 85 55     
            lda #$20           ; $8e52: a9 20     
            sta $44            ; $8e54: 85 44     
            lda #$00           ; $8e56: a9 00     
            sta $58            ; $8e58: 85 58     
            sta $0510          ; $8e5a: 8d 10 05  
            lda #$40           ; $8e5d: a9 40     
            sta $0103          ; $8e5f: 8d 03 01  
            lda #$00           ; $8e62: a9 00     
            sta $0104          ; $8e64: 8d 04 01  
            jmp __8949         ; $8e67: 4c 49 89  

;-------------------------------------------------------------------------------
__8e6a:     lda $15            ; $8e6a: a5 15     
            and #$10           ; $8e6c: 29 10     
            beq __8eae         ; $8e6e: f0 3e     
            lda $58            ; $8e70: a5 58     
            bne __8e49         ; $8e72: d0 d5     
            lda $15            ; $8e74: a5 15     
            cmp $0514          ; $8e76: cd 14 05  
            beq __8eb1         ; $8e79: f0 36     
            sta $0514          ; $8e7b: 8d 14 05  
            lda $0516          ; $8e7e: ad 16 05  
            beq __8e99         ; $8e81: f0 16     
            lda $0517          ; $8e83: ad 17 05  
            bne __8e98         ; $8e86: d0 10     
            .hex 8d 16         ; $8e88: 8d 16     Suspected data
__8e8a:     ora $a5            ; $8e8a: 05 a5     
            .hex 0f 85         ; $8e8c: 0f 85     Suspected data
__8e8e:     .hex fc a5 11      ; $8e8e: fc a5 11  Invalid Opcode - NOP $11a5,x
            and #$ef           ; $8e91: 29 ef     
            sta $11            ; $8e93: 85 11     
            jmp __8ea6         ; $8e95: 4c a6 8e  

;-------------------------------------------------------------------------------
__8e98:     rts                ; $8e98: 60        

;-------------------------------------------------------------------------------
__8e99:     lda #$01           ; $8e99: a9 01     
            sta $0516          ; $8e9b: 8d 16 05  
            lda $fc            ; $8e9e: a5 fc     
            sta $0f            ; $8ea0: 85 0f     
            lda #$00           ; $8ea2: a9 00     
            sta $fc            ; $8ea4: 85 fc     
__8ea6:     lda #$40           ; $8ea6: a9 40     
            sta $0517          ; $8ea8: 8d 17 05  
            sta $fd            ; $8eab: 85 fd     
            rts                ; $8ead: 60        

;-------------------------------------------------------------------------------
__8eae:     sta $0514          ; $8eae: 8d 14 05  
__8eb1:     lda $0517          ; $8eb1: ad 17 05  
            beq __8eba         ; $8eb4: f0 04     
            dec $0517          ; $8eb6: ce 17 05  
            rts                ; $8eb9: 60        

;-------------------------------------------------------------------------------
__8eba:     lda $0516          ; $8eba: ad 16 05  
            bne __8ec0         ; $8ebd: d0 01     
            rts                ; $8ebf: 60        

;-------------------------------------------------------------------------------
__8ec0:     lda $11            ; $8ec0: a5 11     
            ora #$10           ; $8ec2: 09 10     
            sta $11            ; $8ec4: 85 11     
            rts                ; $8ec6: 60        

;-------------------------------------------------------------------------------
__8ec7:     ldx #$00           ; $8ec7: a2 00     
            ldy #$00           ; $8ec9: a0 00     
__8ecb:     lda $41,x          ; $8ecb: b5 41     
            bne __8ed7         ; $8ecd: d0 08     
            lda #$ff           ; $8ecf: a9 ff     
            sta $02c0,y        ; $8ed1: 99 c0 02  
            sta $02c4,y        ; $8ed4: 99 c4 02  
__8ed7:     inx                ; $8ed7: e8        
            iny                ; $8ed8: c8        
            iny                ; $8ed9: c8        
            iny                ; $8eda: c8        
            iny                ; $8edb: c8        
            iny                ; $8edc: c8        
            iny                ; $8edd: c8        
            iny                ; $8ede: c8        
            iny                ; $8edf: c8        
            cpx #$02           ; $8ee0: e0 02     
            bmi __8ecb         ; $8ee2: 30 e7     
            rts                ; $8ee4: 60        

;-------------------------------------------------------------------------------
__8ee5:     ldy #$00           ; $8ee5: a0 00     
            sty $0f            ; $8ee7: 84 0f     
            jsr __8f27         ; $8ee9: 20 27 8f  
__8eec:     lda $02c0,y        ; $8eec: b9 c0 02  
            cmp #$ff           ; $8eef: c9 ff     
            bne __8f18         ; $8ef1: d0 25     
            lda $05            ; $8ef3: a5 05     
            sta $02c3,y        ; $8ef5: 99 c3 02  
            clc                ; $8ef8: 18        
            adc #$08           ; $8ef9: 69 08     
            sta $02c7,y        ; $8efb: 99 c7 02  
            lda $06            ; $8efe: a5 06     
            sta $02c0,y        ; $8f00: 99 c0 02  
            sta $02c4,y        ; $8f03: 99 c4 02  
            lda __8604,x       ; $8f06: bd 04 86  
            sta $02c1,y        ; $8f09: 99 c1 02  
            lda #$d4           ; $8f0c: a9 d4     
            sta $02c5,y        ; $8f0e: 99 c5 02  
            ldx $0f            ; $8f11: a6 0f     
            lda #$03           ; $8f13: a9 03     
            sta $41,x          ; $8f15: 95 41     
            rts                ; $8f17: 60        

;-------------------------------------------------------------------------------
__8f18:     iny                ; $8f18: c8        
            iny                ; $8f19: c8        
            iny                ; $8f1a: c8        
            iny                ; $8f1b: c8        
            iny                ; $8f1c: c8        
            iny                ; $8f1d: c8        
            iny                ; $8f1e: c8        
            iny                ; $8f1f: c8        
__8f20:     inc $0f            ; $8f20: e6 0f     
            cpy #$10           ; $8f22: c0 10     
            bmi __8eec         ; $8f24: 30 c6     
            rts                ; $8f26: 60        

;-------------------------------------------------------------------------------
__8f27:     txa                ; $8f27: 8a        
            pha                ; $8f28: 48        
            tya                ; $8f29: 98        
            pha                ; $8f2a: 48        
            lda $58            ; $8f2b: a5 58     
            bne __8f49         ; $8f2d: d0 1a     
            lda $52            ; $8f2f: a5 52     
            ora #$18           ; $8f31: 09 18     
            sta $01            ; $8f33: 85 01     
            lda __8600,x       ; $8f35: bd 00 86  
            sta $00            ; $8f38: 85 00     
            lda $05            ; $8f3a: a5 05     
            pha                ; $8f3c: 48        
            lda $06            ; $8f3d: a5 06     
            pha                ; $8f3f: 48        
            jsr __b1ac         ; $8f40: 20 ac b1  
            pla                ; $8f43: 68        
            sta $06            ; $8f44: 85 06     
            pla                ; $8f46: 68        
            sta $05            ; $8f47: 85 05     
__8f49:     jsr __8f51         ; $8f49: 20 51 8f  
            pla                ; $8f4c: 68        
            tay                ; $8f4d: a8        
            pla                ; $8f4e: 68        
            tax                ; $8f4f: aa        
            rts                ; $8f50: 60        

;-------------------------------------------------------------------------------
__8f51:     lda $0505          ; $8f51: ad 05 05  
            ora #$01           ; $8f54: 09 01     
            sta $0505          ; $8f56: 8d 05 05  
            lda #$f9           ; $8f59: a9 f9     
            sta $00            ; $8f5b: 85 00     
            jmp __b29f         ; $8f5d: 4c 9f b2  

;-------------------------------------------------------------------------------
__8f60:     lda $2e            ; $8f60: a5 2e     
            cmp #$10           ; $8f62: c9 10     
            bpl __8f6a         ; $8f64: 10 04     
            lda #$20           ; $8f66: a9 20     
            sta $fc            ; $8f68: 85 fc     
__8f6a:     rts                ; $8f6a: 60        

;-------------------------------------------------------------------------------
__8f6b:     lda $9a            ; $8f6b: a5 9a     
            bne __8fb1         ; $8f6d: d0 42     
            ldx $53            ; $8f6f: a6 53     
            cpx #$04           ; $8f71: e0 04     
            beq __8f82         ; $8f73: f0 0d     
            lda $5a            ; $8f75: a5 5a     
            beq __8fde         ; $8f77: f0 65     
            dex                ; $8f79: ca        
            lda __81fa,x       ; $8f7a: bd fa 81  
            cmp $59            ; $8f7d: c5 59     
            beq __8f93         ; $8f7f: f0 12     
            rts                ; $8f81: 60        

;-------------------------------------------------------------------------------
__8f82:     ldx #$00           ; $8f82: a2 00     
__8f84:     lda $c1,x          ; $8f84: b5 c1     
            beq __8fde         ; $8f86: f0 56     
            inx                ; $8f88: e8        
            stx $044f          ; $8f89: 8e 4f 04  
            cpx #$08           ; $8f8c: e0 08     
__8f8e:     bne __8f84         ; $8f8e: d0 f4     
            jmp __8fa5         ; $8f90: 4c a5 8f  

;-------------------------------------------------------------------------------
__8f93:     jsr __a9f2         ; $8f93: 20 f2 a9  
            lda #$04           ; $8f96: a9 04     
            jsr __a9e5         ; $8f98: 20 e5 a9  
            jsr __a9de         ; $8f9b: 20 de a9  
            jsr __af99         ; $8f9e: 20 99 af  
            lda #$02           ; $8fa1: a9 02     
            sta $fd            ; $8fa3: 85 fd     
__8fa5:     lda #$00           ; $8fa5: a9 00     
            sta $fc            ; $8fa7: 85 fc     
            lda #$01           ; $8fa9: a9 01     
            sta $9a            ; $8fab: 85 9a     
            lda #$00           ; $8fad: a9 00     
            sta $3a            ; $8faf: 85 3a     
__8fb1:     lda $3a            ; $8fb1: a5 3a     
            bne __8fde         ; $8fb3: d0 29     
            inc $53            ; $8fb5: e6 53     
            lda $53            ; $8fb7: a5 53     
            cmp #$02           ; $8fb9: c9 02     
            beq __8fc4         ; $8fbb: f0 07     
            cmp #$05           ; $8fbd: c9 05     
            bcs __8fc9         ; $8fbf: b0 08     
            jmp __8fd4         ; $8fc1: 4c d4 8f  

;-------------------------------------------------------------------------------
__8fc4:     inc $53            ; $8fc4: e6 53     
            jmp __8fd4         ; $8fc6: 4c d4 8f  

;-------------------------------------------------------------------------------
__8fc9:     lda #$01           ; $8fc9: a9 01     
            sta $53            ; $8fcb: 85 53     
            inc $54            ; $8fcd: e6 54     
            lda #$a0           ; $8fcf: a9 a0     
            sta $43            ; $8fd1: 85 43     
            rts                ; $8fd3: 60        

;-------------------------------------------------------------------------------
__8fd4:     lda #$8d           ; $8fd4: a9 8d     
            sta $43            ; $8fd6: 85 43     
            lda #$00           ; $8fd8: a9 00     
            sta $4f            ; $8fda: 85 4f     
            sta $9a            ; $8fdc: 85 9a     
__8fde:     rts                ; $8fde: 60        

;-------------------------------------------------------------------------------
__8fdf:     lda #$00           ; $8fdf: a9 00     
            sta $fc            ; $8fe1: 85 fc     
            lda #$10           ; $8fe3: a9 10     
            jsr __98fa         ; $8fe5: 20 fa 98  
            beq __9057         ; $8fe8: f0 6d     
            lda $98            ; $8fea: a5 98     
            cmp #$ff           ; $8fec: c9 ff     
            beq __904f         ; $8fee: f0 5f     
            lda $98            ; $8ff0: a5 98     
            bne __9003         ; $8ff2: d0 0f     
            lda $58            ; $8ff4: a5 58     
            bne __8ffc         ; $8ff6: d0 04     
            lda #$80           ; $8ff8: a9 80     
            sta $fe            ; $8ffa: 85 fe     
__8ffc:     lda #$40           ; $8ffc: a9 40     
            sta $3a            ; $8ffe: 85 3a     
            inc $98            ; $9000: e6 98     
            rts                ; $9002: 60        

;-------------------------------------------------------------------------------
__9003:     lda $3a            ; $9003: a5 3a     
            beq __9017         ; $9005: f0 10     
            cmp #$0e           ; $9007: c9 0e     
            bcc __9057         ; $9009: 90 4c     
            lda $58            ; $900b: a5 58     
            bne __9013         ; $900d: d0 04     
            lda #$01           ; $900f: a9 01     
            sta $ff            ; $9011: 85 ff     
__9013:     lda #$00           ; $9013: a9 00     
            sta $3a            ; $9015: 85 3a     
__9017:     lda $0201          ; $9017: ad 01 02  
            cmp #$6c           ; $901a: c9 6c     
            bcs __9020         ; $901c: b0 02     
            lda #$6c           ; $901e: a9 6c     
__9020:     clc                ; $9020: 18        
            adc #$04           ; $9021: 69 04     
            cmp #$7c           ; $9023: c9 7c     
            bcc __903e         ; $9025: 90 17     
            inc $98            ; $9027: e6 98     
            lda $98            ; $9029: a5 98     
            cmp #$05           ; $902b: c9 05     
            beq __9034         ; $902d: f0 05     
            lda #$6c           ; $902f: a9 6c     
            jmp __903e         ; $9031: 4c 3e 90  

;-------------------------------------------------------------------------------
__9034:     lda $58            ; $9034: a5 58     
            beq __903c         ; $9036: f0 04     
            lda #$7d           ; $9038: a9 7d     
            sta $3a            ; $903a: 85 3a     
__903c:     lda #$7c           ; $903c: a9 7c     
__903e:     sta $02            ; $903e: 85 02     
            jsr __a9f2         ; $9040: 20 f2 a9  
            jsr __a9de         ; $9043: 20 de a9  
            jsr __af93         ; $9046: 20 93 af  
            lda $98            ; $9049: a5 98     
            cmp #$05           ; $904b: c9 05     
            bne __9057         ; $904d: d0 08     
__904f:     lda #$ff           ; $904f: a9 ff     
            sta $98            ; $9051: 85 98     
            lda $3a            ; $9053: a5 3a     
            beq __9058         ; $9055: f0 01     
__9057:     rts                ; $9057: 60        

;-------------------------------------------------------------------------------
__9058:     ldx $52            ; $9058: a6 52     
            jsr __89b9         ; $905a: 20 b9 89  
            lda $55            ; $905d: a5 55     
            bne __906a         ; $905f: d0 09     
            lda #$01           ; $9061: a9 01     
            sta $4e            ; $9063: 85 4e     
            lda #$87           ; $9065: a9 87     
            sta $43            ; $9067: 85 43     
            rts                ; $9069: 60        

;-------------------------------------------------------------------------------
__906a:     lda $51            ; $906a: a5 51     
            cmp #$1c           ; $906c: c9 1c     
            bne __9088         ; $906e: d0 18     
            lda $52            ; $9070: a5 52     
            eor #$01           ; $9072: 49 01     
            tax                ; $9074: aa        
            stx $52            ; $9075: 86 52     
            lda $0406,x        ; $9077: bd 06 04  
            beq __9085         ; $907a: f0 09     
            txa                ; $907c: 8a        
            eor #$01           ; $907d: 49 01     
            tax                ; $907f: aa        
            stx $52            ; $9080: 86 52     
            jmp __9088         ; $9082: 4c 88 90  

;-------------------------------------------------------------------------------
__9085:     jsr __89a9         ; $9085: 20 a9 89  
__9088:     lda #$87           ; $9088: a9 87     
            sta $43            ; $908a: 85 43     
            sta $040b          ; $908c: 8d 0b 04  
            lda #$00           ; $908f: a9 00     
            sta $4f            ; $9091: 85 4f     
            rts                ; $9093: 60        

;-------------------------------------------------------------------------------
__9094:     lda $52            ; $9094: a5 52     
            asl                ; $9096: 0a        
            tax                ; $9097: aa        
            lda $15,x          ; $9098: b5 15     
            and #$0f           ; $909a: 29 0f     
            sta $56            ; $909c: 85 56     
            beq __90a8         ; $909e: f0 08     
            lsr                ; $90a0: 4a        
            lsr                ; $90a1: 4a        
            bne __90a8         ; $90a2: d0 04     
            lda $56            ; $90a4: a5 56     
            sta $57            ; $90a6: 85 57     
__90a8:     lda $96            ; $90a8: a5 96     
            cmp #$01           ; $90aa: c9 01     
            bne __90b8         ; $90ac: d0 0a     
            lda $15,x          ; $90ae: b5 15     
            and #$80           ; $90b0: 29 80     
            beq __90b8         ; $90b2: f0 04     
            lda #$04           ; $90b4: a9 04     
            sta $96            ; $90b6: 85 96     
__90b8:     rts                ; $90b8: 60        

;-------------------------------------------------------------------------------
__90b9:     lda $96            ; $90b9: a5 96     
            cmp #$01           ; $90bb: c9 01     
            beq __90d0         ; $90bd: f0 11     
__90bf:     cmp #$02           ; $90bf: c9 02     
            beq __90d8         ; $90c1: f0 15     
            cmp #$04           ; $90c3: c9 04     
            beq __90db         ; $90c5: f0 14     
            cmp #$08           ; $90c7: c9 08     
            beq __90de         ; $90c9: f0 13     
            cmp #$0a           ; $90cb: c9 0a     
            beq __90e1         ; $90cd: f0 12     
            rts                ; $90cf: 60        

;-------------------------------------------------------------------------------
__90d0:     jsr __90e4         ; $90d0: 20 e4 90  
            lda $96            ; $90d3: a5 96     
            jmp __90bf         ; $90d5: 4c bf 90  

;-------------------------------------------------------------------------------
__90d8:     jmp __9293         ; $90d8: 4c 93 92  

;-------------------------------------------------------------------------------
__90db:     jmp __945c         ; $90db: 4c 5c 94  

;-------------------------------------------------------------------------------
__90de:     jmp __95ac         ; $90de: 4c ac 95  

;-------------------------------------------------------------------------------
__90e1:     jmp __95db         ; $90e1: 4c db 95  

;-------------------------------------------------------------------------------
__90e4:     lda $56            ; $90e4: a5 56     
            cmp #$01           ; $90e6: c9 01     
            beq __90fa         ; $90e8: f0 10     
            cmp #$02           ; $90ea: c9 02     
__90ec:     beq __90fa         ; $90ec: f0 0c     
            cmp #$04           ; $90ee: c9 04     
            beq __90f7         ; $90f0: f0 05     
            cmp #$08           ; $90f2: c9 08     
            beq __90f7         ; $90f4: f0 01     
            rts                ; $90f6: 60        

;-------------------------------------------------------------------------------
__90f7:     jmp __91a0         ; $90f7: 4c a0 91  

;-------------------------------------------------------------------------------
__90fa:     lda #$db           ; $90fa: a9 db     
            sta $0a            ; $90fc: 85 0a     
            lda #$36           ; $90fe: a9 36     
            jsr __98fc         ; $9100: 20 fc 98  
            bne __9108         ; $9103: d0 03     
            jmp __918a         ; $9105: 4c 8a 91  

;-------------------------------------------------------------------------------
__9108:     jsr __98a4         ; $9108: 20 a4 98  
            beq __910e         ; $910b: f0 01     
            rts                ; $910d: 60        

;-------------------------------------------------------------------------------
__910e:     lda $56            ; $910e: a5 56     
            cmp #$02           ; $9110: c9 02     
            beq __911a         ; $9112: f0 06     
            inc $0203          ; $9114: ee 03 02  
            jmp __911d         ; $9117: 4c 1d 91  

;-------------------------------------------------------------------------------
__911a:     dec $0203          ; $911a: ce 03 02  
__911d:     jsr __91e0         ; $911d: 20 e0 91  
            sta $5a            ; $9120: 85 5a     
            lda $0200          ; $9122: ad 00 02  
            jsr __9f27         ; $9125: 20 27 9f  
            sta $59            ; $9128: 85 59     
            jsr __97ff         ; $912a: 20 ff 97  
            beq __9148         ; $912d: f0 19     
            ldx $53            ; $912f: a6 53     
            cpx #$01           ; $9131: e0 01     
            bne __913c         ; $9133: d0 07     
            clc                ; $9135: 18        
            adc $0200          ; $9136: 6d 00 02  
            sta $0200          ; $9139: 8d 00 02  
__913c:     jsr __927f         ; $913c: 20 7f 92  
            cmp #$00           ; $913f: c9 00     
            beq __9148         ; $9141: f0 05     
            lda #$08           ; $9143: a9 08     
            sta $96            ; $9145: 85 96     
            rts                ; $9147: 60        

;-------------------------------------------------------------------------------
__9148:     lda $9b            ; $9148: a5 9b     
            bne __9153         ; $914a: d0 07     
            lda #$01           ; $914c: a9 01     
            sta $9b            ; $914e: 85 9b     
            jmp __918a         ; $9150: 4c 8a 91  

;-------------------------------------------------------------------------------
__9153:     lda #$08           ; $9153: a9 08     
            sta $ff            ; $9155: 85 ff     
            lda #$00           ; $9157: a9 00     
            sta $9b            ; $9159: 85 9b     
            lda $97            ; $915b: a5 97     
            beq __9177         ; $915d: f0 18     
            cmp #$08           ; $915f: c9 08     
            beq __9182         ; $9161: f0 1f     
            lda #$04           ; $9163: a9 04     
            sta $97            ; $9165: 85 97     
            lda $85            ; $9167: a5 85     
            beq __9170         ; $9169: f0 05     
            lda #$00           ; $916b: a9 00     
            jmp __9172         ; $916d: 4c 72 91  

;-------------------------------------------------------------------------------
__9170:     lda #$08           ; $9170: a9 08     
__9172:     sta $97            ; $9172: 85 97     
            jmp __918a         ; $9174: 4c 8a 91  

;-------------------------------------------------------------------------------
__9177:     lda #$04           ; $9177: a9 04     
            sta $97            ; $9179: 85 97     
            lda #$00           ; $917b: a9 00     
            sta $85            ; $917d: 85 85     
            jmp __918a         ; $917f: 4c 8a 91  

;-------------------------------------------------------------------------------
__9182:     lda #$04           ; $9182: a9 04     
            sta $97            ; $9184: 85 97     
            lda #$01           ; $9186: a9 01     
            sta $85            ; $9188: 85 85     
__918a:     jsr __a9f2         ; $918a: 20 f2 a9  
            lda $97            ; $918d: a5 97     
            sta $02            ; $918f: 85 02     
            jsr __a9de         ; $9191: 20 de a9  
            lda $56            ; $9194: a5 56     
            cmp #$02           ; $9196: c9 02     
            beq __919d         ; $9198: f0 03     
            jmp __af93         ; $919a: 4c 93 af  

;-------------------------------------------------------------------------------
__919d:     jmp __af99         ; $919d: 4c 99 af  

;-------------------------------------------------------------------------------
__91a0:     jsr __a9f2         ; $91a0: 20 f2 a9  
            lda #$86           ; $91a3: a9 86     
            sta $02            ; $91a5: 85 02     
            lda #$81           ; $91a7: a9 81     
            sta $03            ; $91a9: 85 03     
            jsr __aefc         ; $91ab: 20 fc ae  
            lda $53            ; $91ae: a5 53     
            sec                ; $91b0: 38        
            sbc #$01           ; $91b1: e9 01     
            asl                ; $91b3: 0a        
            tax                ; $91b4: aa        
            lda __847b,x       ; $91b5: bd 7b 84  
            sta $04            ; $91b8: 85 04     
            lda __847c,x       ; $91ba: bd 7c 84  
            sta $05            ; $91bd: 85 05     
            lda __8483,x       ; $91bf: bd 83 84  
            sta $06            ; $91c2: 85 06     
            lda __8484,x       ; $91c4: bd 84 84  
            sta $07            ; $91c7: 85 07     
            jsr __97c1         ; $91c9: 20 c1 97  
            beq __91df         ; $91cc: f0 11     
            lda $00            ; $91ce: a5 00     
            sec                ; $91d0: 38        
            sbc #$04           ; $91d1: e9 04     
            sta $a1            ; $91d3: 85 a1     
            lda #$02           ; $91d5: a9 02     
            sta $96            ; $91d7: 85 96     
            lda #$00           ; $91d9: a9 00     
            sta $5b            ; $91db: 85 5b     
            sta $5c            ; $91dd: 85 5c     
__91df:     rts                ; $91df: 60        

;-------------------------------------------------------------------------------
__91e0:     jsr __a9f2         ; $91e0: 20 f2 a9  
            lda $96            ; $91e3: a5 96     
            cmp #$04           ; $91e5: c9 04     
            beq __91f2         ; $91e7: f0 09     
            cmp #$08           ; $91e9: c9 08     
            beq __91f2         ; $91eb: f0 05     
            lda #$2c           ; $91ed: a9 2c     
            jmp __91f4         ; $91ef: 4c f4 91  

;-------------------------------------------------------------------------------
__91f2:     lda #$4a           ; $91f2: a9 4a     
__91f4:     jsr __aef9         ; $91f4: 20 f9 ae  
            lda $53            ; $91f7: a5 53     
            cmp #$01           ; $91f9: c9 01     
            beq __9205         ; $91fb: f0 08     
            sec                ; $91fd: 38        
            sbc #$01           ; $91fe: e9 01     
            asl                ; $9200: 0a        
            tax                ; $9201: aa        
            jmp __9212         ; $9202: 4c 12 92  

;-------------------------------------------------------------------------------
__9205:     lda #$1a           ; $9205: a9 1a     
            jsr __87c8         ; $9207: 20 c8 87  
            jsr __982e         ; $920a: 20 2e 98  
            sta $0c            ; $920d: 85 0c     
            jmp __9238         ; $920f: 4c 38 92  

;-------------------------------------------------------------------------------
__9212:     lda __846b,x       ; $9212: bd 6b 84  
            sta $04            ; $9215: 85 04     
            lda __846c,x       ; $9217: bd 6c 84  
            sta $05            ; $921a: 85 05     
            lda __8473,x       ; $921c: bd 73 84  
            sta $06            ; $921f: 85 06     
            lda __8474,x       ; $9221: bd 74 84  
            sta $07            ; $9224: 85 07     
            jsr __97c1         ; $9226: 20 c1 97  
            sta $0c            ; $9229: 85 0c     
            bne __9238         ; $922b: d0 0b     
            lda $53            ; $922d: a5 53     
            cmp #$03           ; $922f: c9 03     
            bne __9238         ; $9231: d0 05     
            jsr __923b         ; $9233: 20 3b 92  
            sta $0c            ; $9236: 85 0c     
__9238:     lda $0c            ; $9238: a5 0c     
            rts                ; $923a: 60        

;-------------------------------------------------------------------------------
__923b:     lda #$2a           ; $923b: a9 2a     
            jsr __87de         ; $923d: 20 de 87  
            lda #$00           ; $9240: a9 00     
            sta $d2            ; $9242: 85 d2     
__9244:     lda $d2            ; $9244: a5 d2     
            cmp #$06           ; $9246: c9 06     
            beq __927a         ; $9248: f0 30     
            tax                ; $924a: aa        
            ldy __82cc,x       ; $924b: bc cc 82  
            lda $0200,y        ; $924e: b9 00 02  
            cmp #$ff           ; $9251: c9 ff     
            beq __9263         ; $9253: f0 0e     
            sta $01            ; $9255: 85 01     
            lda $0203,y        ; $9257: b9 03 02  
            sta $00            ; $925a: 85 00     
            jsr __af00         ; $925c: 20 00 af  
            cmp #$01           ; $925f: c9 01     
            beq __9268         ; $9261: f0 05     
__9263:     inc $d2            ; $9263: e6 d2     
            jmp __9244         ; $9265: 4c 44 92  

;-------------------------------------------------------------------------------
__9268:     lda $d2            ; $9268: a5 d2     
            cmp #$03           ; $926a: c9 03     
            bcs __9273         ; $926c: b0 05     
            lda #$01           ; $926e: a9 01     
            jmp __9275         ; $9270: 4c 75 92  

;-------------------------------------------------------------------------------
__9273:     lda #$02           ; $9273: a9 02     
__9275:     sta $da            ; $9275: 85 da     
            lda #$01           ; $9277: a9 01     
            rts                ; $9279: 60        

;-------------------------------------------------------------------------------
__927a:     lda #$00           ; $927a: a9 00     
            sta $da            ; $927c: 85 da     
            rts                ; $927e: 60        

;-------------------------------------------------------------------------------
__927f:     lda $53            ; $927f: a5 53     
            cmp #$01           ; $9281: c9 01     
            beq __9288         ; $9283: f0 03     
            jmp __9290         ; $9285: 4c 90 92  

;-------------------------------------------------------------------------------
__9288:     lda #$1c           ; $9288: a9 1c     
            jsr __87c8         ; $928a: 20 c8 87  
            jmp __97c1         ; $928d: 4c c1 97  

;-------------------------------------------------------------------------------
__9290:     lda #$01           ; $9290: a9 01     
            rts                ; $9292: 60        

;-------------------------------------------------------------------------------
__9293:     lda $56            ; $9293: a5 56     
            cmp #$08           ; $9295: c9 08     
            beq __92a3         ; $9297: f0 0a     
            cmp #$04           ; $9299: c9 04     
            beq __92a0         ; $929b: f0 03     
            jmp __93e4         ; $929d: 4c e4 93  

;-------------------------------------------------------------------------------
__92a0:     jmp __9347         ; $92a0: 4c 47 93  

;-------------------------------------------------------------------------------
__92a3:     lda $5a            ; $92a3: a5 5a     
            beq __92b1         ; $92a5: f0 0a     
            jsr __a9f2         ; $92a7: 20 f2 a9  
            dec $01            ; $92aa: c6 01     
            jsr __941f         ; $92ac: 20 1f 94  
            bne __92e2         ; $92af: d0 31     
__92b1:     lda #$24           ; $92b1: a9 24     
            sta $0a            ; $92b3: 85 0a     
            lda #$49           ; $92b5: a9 49     
            jsr __98fc         ; $92b7: 20 fc 98  
            bne __92c4         ; $92ba: d0 08     
            lda $0200          ; $92bc: ad 00 02  
            sta $01            ; $92bf: 85 01     
            jmp __93e4         ; $92c1: 4c e4 93  

;-------------------------------------------------------------------------------
__92c4:     jsr __941f         ; $92c4: 20 1f 94  
            beq __92fc         ; $92c7: f0 33     
            cmp #$02           ; $92c9: c9 02     
            bne __92d0         ; $92cb: d0 03     
            jmp __93e4         ; $92cd: 4c e4 93  

;-------------------------------------------------------------------------------
__92d0:     lda $5b            ; $92d0: a5 5b     
            beq __92e5         ; $92d2: f0 11     
            clc                ; $92d4: 18        
            adc #$01           ; $92d5: 69 01     
            cmp #$10           ; $92d7: c9 10     
            beq __92e7         ; $92d9: f0 0c     
            bcc __92e7         ; $92db: 90 0a     
            lda #$10           ; $92dd: a9 10     
            jmp __92e7         ; $92df: 4c e7 92  

;-------------------------------------------------------------------------------
__92e2:     jmp __93e4         ; $92e2: 4c e4 93  

;-------------------------------------------------------------------------------
__92e5:     lda #$01           ; $92e5: a9 01     
__92e7:     sta $5b            ; $92e7: 85 5b     
            tax                ; $92e9: aa        
            dex                ; $92ea: ca        
            lda __8147,x       ; $92eb: bd 47 81  
            sta $02            ; $92ee: 85 02     
            lda #$00           ; $92f0: a9 00     
            sta $5a            ; $92f2: 85 5a     
            sta $5c            ; $92f4: 85 5c     
            jsr __9403         ; $92f6: 20 03 94  
            jmp __9322         ; $92f9: 4c 22 93  

;-------------------------------------------------------------------------------
__92fc:     lda $5c            ; $92fc: a5 5c     
            beq __930e         ; $92fe: f0 0e     
            clc                ; $9300: 18        
            adc #$01           ; $9301: 69 01     
            cmp #$06           ; $9303: c9 06     
            beq __9310         ; $9305: f0 09     
            bcc __9310         ; $9307: 90 07     
            lda #$01           ; $9309: a9 01     
            jmp __9310         ; $930b: 4c 10 93  

;-------------------------------------------------------------------------------
__930e:     lda #$02           ; $930e: a9 02     
__9310:     sta $5c            ; $9310: 85 5c     
            tax                ; $9312: aa        
            dex                ; $9313: ca        
            lda __8159,x       ; $9314: bd 59 81  
            sta $02            ; $9317: 85 02     
            lda #$00           ; $9319: a9 00     
            sta $5a            ; $931b: 85 5a     
            sta $5b            ; $931d: 85 5b     
            jsr __9403         ; $931f: 20 03 94  
__9322:     lda $a1            ; $9322: a5 a1     
            sta $00            ; $9324: 85 00     
            sta $0203          ; $9326: 8d 03 02  
            jsr __a9e2         ; $9329: 20 e2 a9  
            lda #$00           ; $932c: a9 00     
            sta $04            ; $932e: 85 04     
            lda $02            ; $9330: a5 02     
            cmp #$54           ; $9332: c9 54     
            beq __933b         ; $9334: f0 05     
            lda #$00           ; $9336: a9 00     
            jmp __9341         ; $9338: 4c 41 93  

;-------------------------------------------------------------------------------
__933b:     lda #$24           ; $933b: a9 24     
            sta $02            ; $933d: 85 02     
            lda #$01           ; $933f: a9 01     
__9341:     jsr __afa7         ; $9341: 20 a7 af  
            jmp __93e4         ; $9344: 4c e4 93  

;-------------------------------------------------------------------------------
__9347:     lda $5a            ; $9347: a5 5a     
            beq __935a         ; $9349: f0 0f     
            jsr __a9f2         ; $934b: 20 f2 a9  
            inc $01            ; $934e: e6 01     
            jsr __941f         ; $9350: 20 1f 94  
            cmp #$01           ; $9353: c9 01     
            beq __935a         ; $9355: f0 03     
            jmp __93e4         ; $9357: 4c e4 93  

;-------------------------------------------------------------------------------
__935a:     lda #$24           ; $935a: a9 24     
            sta $0a            ; $935c: 85 0a     
            lda #$49           ; $935e: a9 49     
            sta $0b            ; $9360: 85 0b     
            jsr __98fa         ; $9362: 20 fa 98  
            bne __936f         ; $9365: d0 08     
            lda $0200          ; $9367: ad 00 02  
            sta $01            ; $936a: 85 01     
            jmp __93e4         ; $936c: 4c e4 93  

;-------------------------------------------------------------------------------
__936f:     jsr __941f         ; $936f: 20 1f 94  
            beq __93a0         ; $9372: f0 2c     
            cmp #$02           ; $9374: c9 02     
            beq __93a0         ; $9376: f0 28     
            lda $5b            ; $9378: a5 5b     
            beq __9386         ; $937a: f0 0a     
            sec                ; $937c: 38        
            sbc #$01           ; $937d: e9 01     
            cmp #$01           ; $937f: c9 01     
            bcc __938b         ; $9381: 90 08     
            jmp __938d         ; $9383: 4c 8d 93  

;-------------------------------------------------------------------------------
__9386:     lda #$0d           ; $9386: a9 0d     
            jmp __938d         ; $9388: 4c 8d 93  

;-------------------------------------------------------------------------------
__938b:     lda #$01           ; $938b: a9 01     
__938d:     sta $5b            ; $938d: 85 5b     
            tax                ; $938f: aa        
            dex                ; $9390: ca        
            lda __8147,x       ; $9391: bd 47 81  
            sta $02            ; $9394: 85 02     
            lda #$03           ; $9396: a9 03     
            sta $5c            ; $9398: 85 5c     
            jsr __940e         ; $939a: 20 0e 94  
            jmp __93c6         ; $939d: 4c c6 93  

;-------------------------------------------------------------------------------
__93a0:     lda $5c            ; $93a0: a5 5c     
            beq __93b2         ; $93a2: f0 0e     
            clc                ; $93a4: 18        
            adc #$01           ; $93a5: 69 01     
            cmp #$06           ; $93a7: c9 06     
            beq __93b4         ; $93a9: f0 09     
            bcc __93b4         ; $93ab: 90 07     
            lda #$01           ; $93ad: a9 01     
            jmp __93b4         ; $93af: 4c b4 93  

;-------------------------------------------------------------------------------
__93b2:     lda #$01           ; $93b2: a9 01     
__93b4:     sta $5c            ; $93b4: 85 5c     
            sec                ; $93b6: 38        
            sbc #$01           ; $93b7: e9 01     
            tax                ; $93b9: aa        
            lda __8159,x       ; $93ba: bd 59 81  
            sta $02            ; $93bd: 85 02     
            lda #$00           ; $93bf: a9 00     
            sta $5b            ; $93c1: 85 5b     
            jsr __940e         ; $93c3: 20 0e 94  
__93c6:     lda $a1            ; $93c6: a5 a1     
            sta $0203          ; $93c8: 8d 03 02  
            sta $00            ; $93cb: 85 00     
            jsr __a9de         ; $93cd: 20 de a9  
            lda $02            ; $93d0: a5 02     
            cmp #$54           ; $93d2: c9 54     
            beq __93db         ; $93d4: f0 05     
            lda #$00           ; $93d6: a9 00     
            jmp __93e1         ; $93d8: 4c e1 93  

;-------------------------------------------------------------------------------
__93db:     lda #$24           ; $93db: a9 24     
            sta $02            ; $93dd: 85 02     
            lda #$01           ; $93df: a9 01     
__93e1:     jsr __afa7         ; $93e1: 20 a7 af  
__93e4:     jsr __91e0         ; $93e4: 20 e0 91  
            sta $5a            ; $93e7: 85 5a     
            beq __9402         ; $93e9: f0 17     
            lda $0200          ; $93eb: ad 00 02  
            clc                ; $93ee: 18        
            adc #$08           ; $93ef: 69 08     
            jsr __9f27         ; $93f1: 20 27 9f  
            sta $59            ; $93f4: 85 59     
            lda #$01           ; $93f6: a9 01     
            sta $96            ; $93f8: 85 96     
            lda #$00           ; $93fa: a9 00     
            sta $5c            ; $93fc: 85 5c     
            sta $5b            ; $93fe: 85 5b     
            sta $85            ; $9400: 85 85     
__9402:     rts                ; $9402: 60        

;-------------------------------------------------------------------------------
__9403:     lda $0200          ; $9403: ad 00 02  
            sec                ; $9406: 38        
            sbc #$01           ; $9407: e9 01     
            sta $01            ; $9409: 85 01     
            jmp __9416         ; $940b: 4c 16 94  

;-------------------------------------------------------------------------------
__940e:     lda $0200          ; $940e: ad 00 02  
            clc                ; $9411: 18        
            adc #$01           ; $9412: 69 01     
            sta $01            ; $9414: 85 01     
__9416:     and #$06           ; $9416: 29 06     
            bne __941e         ; $9418: d0 04     
            lda #$08           ; $941a: a9 08     
            sta $ff            ; $941c: 85 ff     
__941e:     rts                ; $941e: 60        

;-------------------------------------------------------------------------------
__941f:     .hex 20 f2         ; $941f: 20 f2     Suspected data
__9421:     lda #$a9           ; $9421: a9 a9     
            bit __f920         ; $9423: 2c 20 f9  
            ldx $53a5          ; $9426: ae a5 53  
            sec                ; $9429: 38        
            sbc #$01           ; $942a: e9 01     
            asl                ; $942c: 0a        
            tax                ; $942d: aa        
            lda __848b,x       ; $942e: bd 8b 84  
            sta $04            ; $9431: 85 04     
            lda __848c,x       ; $9433: bd 8c 84  
            sta $05            ; $9436: 85 05     
            lda #$43           ; $9438: a9 43     
            sta $06            ; $943a: 85 06     
            lda #$81           ; $943c: a9 81     
            sta $07            ; $943e: 85 07     
            jsr __97c1         ; $9440: 20 c1 97  
            sta $08            ; $9443: 85 08     
            lda $53            ; $9445: a5 53     
            cmp #$01           ; $9447: c9 01     
            bne __9459         ; $9449: d0 0e     
            lda #$1e           ; $944b: a9 1e     
            jsr __87c8         ; $944d: 20 c8 87  
            jsr __97c1         ; $9450: 20 c1 97  
            beq __9459         ; $9453: f0 04     
            lda #$02           ; $9455: a9 02     
            sta $08            ; $9457: 85 08     
__9459:     lda $08            ; $9459: a5 08     
            rts                ; $945b: 60        

;-------------------------------------------------------------------------------
__945c:     lda #$ff           ; $945c: a9 ff     
            jsr __98fa         ; $945e: 20 fa 98  
            cmp #$00           ; $9461: c9 00     
            bne __9466         ; $9463: d0 01     
            rts                ; $9465: 60        

;-------------------------------------------------------------------------------
__9466:     lda $94            ; $9466: a5 94     
            cmp #$f0           ; $9468: c9 f0     
            bcc __946f         ; $946a: 90 03     
            jmp __9522         ; $946c: 4c 22 95  

;-------------------------------------------------------------------------------
__946f:     jsr __98a4         ; $946f: 20 a4 98  
            beq __9485         ; $9472: f0 11     
            lda $56            ; $9474: a5 56     
            cmp #$01           ; $9476: c9 01     
            bne __947f         ; $9478: d0 05     
            lda #$02           ; $947a: a9 02     
            jmp __9481         ; $947c: 4c 81 94  

;-------------------------------------------------------------------------------
__947f:     lda #$01           ; $947f: a9 01     
__9481:     sta $56            ; $9481: 85 56     
            sta $57            ; $9483: 85 57     
__9485:     lda $0200          ; $9485: ad 00 02  
            sta $01            ; $9488: 85 01     
            lda #$00           ; $948a: a9 00     
            jsr __ae83         ; $948c: 20 83 ae  
            lda $01            ; $948f: a5 01     
            sta $0200          ; $9491: 8d 00 02  
            lda $56            ; $9494: a5 56     
            cmp #$01           ; $9496: c9 01     
            beq __94a1         ; $9498: f0 07     
            cmp #$02           ; $949a: c9 02     
            beq __94b6         ; $949c: f0 18     
            jmp __94c8         ; $949e: 4c c8 94  

;-------------------------------------------------------------------------------
__94a1:     lda $9e            ; $94a1: a5 9e     
            beq __94af         ; $94a3: f0 0a     
            inc $0203          ; $94a5: ee 03 02  
            lda #$00           ; $94a8: a9 00     
            sta $9e            ; $94aa: 85 9e     
            jmp __94c8         ; $94ac: 4c c8 94  

;-------------------------------------------------------------------------------
__94af:     lda #$01           ; $94af: a9 01     
            sta $9e            ; $94b1: 85 9e     
            jmp __94c8         ; $94b3: 4c c8 94  

;-------------------------------------------------------------------------------
__94b6:     lda $9e            ; $94b6: a5 9e     
            beq __94c4         ; $94b8: f0 0a     
            dec $0203          ; $94ba: ce 03 02  
            lda #$00           ; $94bd: a9 00     
            sta $9e            ; $94bf: 85 9e     
            jmp __94c8         ; $94c1: 4c c8 94  

;-------------------------------------------------------------------------------
__94c4:     lda #$01           ; $94c4: a9 01     
            sta $9e            ; $94c6: 85 9e     
__94c8:     lda $0203          ; $94c8: ad 03 02  
            sta $00            ; $94cb: 85 00     
            jsr __9714         ; $94cd: 20 14 97  
            lda $94            ; $94d0: a5 94     
            beq __94f7         ; $94d2: f0 23     
            lda $01            ; $94d4: a5 01     
            sec                ; $94d6: 38        
            sbc #$10           ; $94d7: e9 10     
            cmp $95            ; $94d9: c5 95     
            bcc __94e1         ; $94db: 90 04     
            lda #$ff           ; $94dd: a9 ff     
            sta $95            ; $94df: 85 95     
__94e1:     jsr __91e0         ; $94e1: 20 e0 91  
            sta $5a            ; $94e4: 85 5a     
            beq __9506         ; $94e6: f0 1e     
            lda $4b            ; $94e8: a5 4b     
            sec                ; $94ea: 38        
            sbc #$11           ; $94eb: e9 11     
            sta $0200          ; $94ed: 8d 00 02  
            lda #$01           ; $94f0: a9 01     
            sta $5a            ; $94f2: 85 5a     
            jmp __950b         ; $94f4: 4c 0b 95  

;-------------------------------------------------------------------------------
__94f7:     lda #$04           ; $94f7: a9 04     
            sta $ff            ; $94f9: 85 ff     
            lda #$01           ; $94fb: a9 01     
            sta $94            ; $94fd: 85 94     
            lda $01            ; $94ff: a5 01     
            sta $95            ; $9501: 85 95     
            jmp __9506         ; $9503: 4c 06 95  

;-------------------------------------------------------------------------------
__9506:     lda #$28           ; $9506: a9 28     
            jmp __af81         ; $9508: 4c 81 af  

;-------------------------------------------------------------------------------
__950b:     jsr __a9f2         ; $950b: 20 f2 a9  
            lda #$2c           ; $950e: a9 2c     
            sta $02            ; $9510: 85 02     
            jsr __a9de         ; $9512: 20 de a9  
            lda $57            ; $9515: a5 57     
            and #$03           ; $9517: 29 03     
            lsr                ; $9519: 4a        
            jsr __afa7         ; $951a: 20 a7 af  
            lda #$f0           ; $951d: a9 f0     
            sta $94            ; $951f: 85 94     
            rts                ; $9521: 60        

;-------------------------------------------------------------------------------
__9522:     inc $94            ; $9522: e6 94     
            lda $94            ; $9524: a5 94     
            cmp #$f4           ; $9526: c9 f4     
            bne __9564         ; $9528: d0 3a     
            lda $95            ; $952a: a5 95     
            cmp #$ff           ; $952c: c9 ff     
            beq __9557         ; $952e: f0 27     
            lda #$04           ; $9530: a9 04     
            jsr __af81         ; $9532: 20 81 af  
            lda #$00           ; $9535: a9 00     
            sta $042c          ; $9537: 8d 2c 04  
            sta $94            ; $953a: 85 94     
            sta $95            ; $953c: 85 95     
            lda #$01           ; $953e: a9 01     
            sta $96            ; $9540: 85 96     
            lda $a0            ; $9542: a5 a0     
            beq __9564         ; $9544: f0 1e     
            lda #$01           ; $9546: a9 01     
            sta $9f            ; $9548: 85 9f     
            lda #$4b           ; $954a: a9 4b     
            sta $3f            ; $954c: 85 3f     
            lda #$0a           ; $954e: a9 0a     
            sta $96            ; $9550: 85 96     
            lda #$40           ; $9552: a9 40     
            sta $fc            ; $9554: 85 fc     
            rts                ; $9556: 60        

;-------------------------------------------------------------------------------
__9557:     lda #$00           ; $9557: a9 00     
            sta $042c          ; $9559: 8d 2c 04  
            sta $94            ; $955c: 85 94     
            sta $95            ; $955e: 85 95     
            lda #$ff           ; $9560: a9 ff     
            sta $96            ; $9562: 85 96     
__9564:     rts                ; $9564: 60        

;-------------------------------------------------------------------------------
            lda #$fe           ; $9565: a9 fe     
            sta $0472          ; $9567: 8d 72 04  
            sta $0473          ; $956a: 8d 73 04  
            ldx #$00           ; $956d: a2 00     
            ldy #$60           ; $956f: a0 60     
__9571:     lda $0200,y        ; $9571: b9 00 02  
            cmp #$ff           ; $9574: c9 ff     
            beq __9587         ; $9576: f0 0f     
            sta $0461,x        ; $9578: 9d 61 04  
            lda $0203,y        ; $957b: b9 03 02  
            sec                ; $957e: 38        
            sbc #$08           ; $957f: e9 08     
            sta $0460,x        ; $9581: 9d 60 04  
            jmp __958f         ; $9584: 4c 8f 95  

;-------------------------------------------------------------------------------
__9587:     lda #$00           ; $9587: a9 00     
            sta $0461,x        ; $9589: 9d 61 04  
            sta $0460,x        ; $958c: 9d 60 04  
__958f:     tya                ; $958f: 98        
            clc                ; $9590: 18        
            adc #$08           ; $9591: 69 08     
            tay                ; $9593: a8        
            inx                ; $9594: e8        
            inx                ; $9595: e8        
            inx                ; $9596: e8        
            cpy #$90           ; $9597: c0 90     
            bne __9571         ; $9599: d0 d6     
            lda #$20           ; $959b: a9 20     
            jsr __87c8         ; $959d: 20 c8 87  
            jsr __97c1         ; $95a0: 20 c1 97  
            beq __95ab         ; $95a3: f0 06     
            lda #$08           ; $95a5: a9 08     
            sta $96            ; $95a7: 85 96     
            lda #$01           ; $95a9: a9 01     
__95ab:     rts                ; $95ab: 60        

;-------------------------------------------------------------------------------
__95ac:     lda #$ff           ; $95ac: a9 ff     
            jsr __98fa         ; $95ae: 20 fa 98  
            beq __95da         ; $95b1: f0 27     
            jsr __a9f2         ; $95b3: 20 f2 a9  
            inc $01            ; $95b6: e6 01     
            inc $01            ; $95b8: e6 01     
            lda $57            ; $95ba: a5 57     
            cmp #$02           ; $95bc: c9 02     
            beq __95c6         ; $95be: f0 06     
            lda $0201          ; $95c0: ad 01 02  
            jmp __95cc         ; $95c3: 4c cc 95  

;-------------------------------------------------------------------------------
__95c6:     lda $0201          ; $95c6: ad 01 02  
            sec                ; $95c9: 38        
            sbc #$02           ; $95ca: e9 02     
__95cc:     sta $02            ; $95cc: 85 02     
            jsr __af86         ; $95ce: 20 86 af  
            jsr __91e0         ; $95d1: 20 e0 91  
            beq __95da         ; $95d4: f0 04     
            lda #$ff           ; $95d6: a9 ff     
            sta $96            ; $95d8: 85 96     
__95da:     rts                ; $95da: 60        

;-------------------------------------------------------------------------------
__95db:     lda $3f            ; $95db: a5 3f     
            bne __95e2         ; $95dd: d0 03     
            jmp __96d4         ; $95df: 4c d4 96  

;-------------------------------------------------------------------------------
__95e2:     lda #$db           ; $95e2: a9 db     
            sta $0a            ; $95e4: 85 0a     
            lda #$36           ; $95e6: a9 36     
            jsr __98fc         ; $95e8: 20 fc 98  
            bne __95ee         ; $95eb: d0 01     
            rts                ; $95ed: 60        

;-------------------------------------------------------------------------------
__95ee:     jsr __98a4         ; $95ee: 20 a4 98  
            bne __95fd         ; $95f1: d0 0a     
            lda $56            ; $95f3: a5 56     
            cmp #$01           ; $95f5: c9 01     
            beq __961f         ; $95f7: f0 26     
            cmp #$02           ; $95f9: c9 02     
            beq __9625         ; $95fb: f0 28     
__95fd:     lda $a2            ; $95fd: a5 a2     
            asl                ; $95ff: 0a        
            sta $a2            ; $9600: 85 a2     
__9602:     .hex f0            ; $9602: f0        Suspected data
__9603:     .hex 03 4c         ; $9603: 03 4c     Invalid Opcode - SLO ($4c,x)
            pla                ; $9605: 68        
            stx $a9,y          ; $9606: 96 a9     
            jsr __a285         ; $9608: 20 85 a2  
            lda $9f            ; $960b: a5 9f     
            beq __9613         ; $960d: f0 04     
            cmp #$04           ; $960f: c9 04     
            bcc __9618         ; $9611: 90 05     
__9613:     lda #$02           ; $9613: a9 02     
            jmp __961a         ; $9615: 4c 1a 96  

;-------------------------------------------------------------------------------
__9618:     lda #$05           ; $9618: a9 05     
__961a:     sta $9f            ; $961a: 85 9f     
            jmp __9668         ; $961c: 4c 68 96  

;-------------------------------------------------------------------------------
__961f:     inc $0203          ; $961f: ee 03 02  
            jmp __9628         ; $9622: 4c 28 96  

;-------------------------------------------------------------------------------
__9625:     dec $0203          ; $9625: ce 03 02  
__9628:     jsr __91e0         ; $9628: 20 e0 91  
            sta $5a            ; $962b: 85 5a     
            lda $0200          ; $962d: ad 00 02  
            jsr __9f27         ; $9630: 20 27 9f  
            sta $59            ; $9633: 85 59     
            jsr __97ff         ; $9635: 20 ff 97  
            beq __9653         ; $9638: f0 19     
            ldx $53            ; $963a: a6 53     
            cpx #$01           ; $963c: e0 01     
            bne __9647         ; $963e: d0 07     
            clc                ; $9640: 18        
            adc $0200          ; $9641: 6d 00 02  
            sta $0200          ; $9644: 8d 00 02  
__9647:     jsr __927f         ; $9647: 20 7f 92  
            beq __9653         ; $964a: f0 07     
            lda #$08           ; $964c: a9 08     
            sta $96            ; $964e: 85 96     
            jmp __96d4         ; $9650: 4c d4 96  

;-------------------------------------------------------------------------------
__9653:     lda #$08           ; $9653: a9 08     
            sta $ff            ; $9655: 85 ff     
            lda $9f            ; $9657: a5 9f     
            beq __9664         ; $9659: f0 09     
            cmp #$06           ; $965b: c9 06     
            bcs __9664         ; $965d: b0 05     
            inc $9f            ; $965f: e6 9f     
            jmp __9668         ; $9661: 4c 68 96  

;-------------------------------------------------------------------------------
__9664:     lda #$01           ; $9664: a9 01     
            sta $9f            ; $9666: 85 9f     
__9668:     ldx $9f            ; $9668: a6 9f     
            dex                ; $966a: ca        
            lda __81a2,x       ; $966b: bd a2 81  
            jsr __af81         ; $966e: 20 81 af  
            lda $9f            ; $9671: a5 9f     
            lsr                ; $9673: 4a        
            lsr                ; $9674: 4a        
            beq __967c         ; $9675: f0 05     
            lda #$00           ; $9677: a9 00     
            jmp __967e         ; $9679: 4c 7e 96  

;-------------------------------------------------------------------------------
__967c:     lda #$01           ; $967c: a9 01     
__967e:     beq __969b         ; $967e: f0 1b     
            .hex a9            ; $9680: a9        Suspected data
__9681:     .hex 04            ; $9681: 04        Suspected data
__9682:     clc                ; $9682: 18        
            adc $0203          ; $9683: 6d 03 02  
            sta $00            ; $9686: 85 00     
            lda $0200          ; $9688: ad 00 02  
            sec                ; $968b: 38        
            sbc #$0e           ; $968c: e9 0e     
            sta $01            ; $968e: 85 01     
            lda #$21           ; $9690: a9 21     
            sta $03            ; $9692: 85 03     
            lda #$f6           ; $9694: a9 f6     
            sta $02            ; $9696: 85 02     
            jmp __96c2         ; $9698: 4c c2 96  

;-------------------------------------------------------------------------------
__969b:     lda $57            ; $969b: a5 57     
            .hex c9            ; $969d: c9        Suspected data
__969e:     ora ($d0,x)        ; $969e: 01 d0     
            ora #$a9           ; $96a0: 09 a9     
            asl $6d18          ; $96a2: 0e 18 6d  
            .hex 03 02         ; $96a5: 03 02     Invalid Opcode - SLO ($02,x)
            jmp __96b0         ; $96a7: 4c b0 96  

;-------------------------------------------------------------------------------
            lda $0203          ; $96aa: ad 03 02  
            sec                ; $96ad: 38        
            sbc #$0e           ; $96ae: e9 0e     
__96b0:     sta $00            ; $96b0: 85 00     
            lda #$06           ; $96b2: a9 06     
            clc                ; $96b4: 18        
            adc $0200          ; $96b5: 6d 00 02  
__96b8:     sta $01            ; $96b8: 85 01     
            lda #$12           ; $96ba: a9 12     
            sta $03            ; $96bc: 85 03     
            lda #$fa           ; $96be: a9 fa     
            sta $02            ; $96c0: 85 02     
__96c2:     lda $a0            ; $96c2: a5 a0     
            cmp #$01           ; $96c4: c9 01     
            beq __96cd         ; $96c6: f0 05     
            lda #$d8           ; $96c8: a9 d8     
            jmp __96cf         ; $96ca: 4c cf 96  

;-------------------------------------------------------------------------------
__96cd:     lda #$d0           ; $96cd: a9 d0     
__96cf:     sta $04            ; $96cf: 85 04     
            jmp __af89         ; $96d1: 4c 89 af  

;-------------------------------------------------------------------------------
__96d4:     lda #$12           ; $96d4: a9 12     
            sta $03            ; $96d6: 85 03     
            lda $a0            ; $96d8: a5 a0     
            cmp #$01           ; $96da: c9 01     
            beq __96e8         ; $96dc: f0 0a     
            lda #$00           ; $96de: a9 00     
            sta $0452          ; $96e0: 8d 52 04  
            lda #$d8           ; $96e3: a9 d8     
            jmp __96ef         ; $96e5: 4c ef 96  

;-------------------------------------------------------------------------------
__96e8:     lda #$00           ; $96e8: a9 00     
            sta $0451          ; $96ea: 8d 51 04  
            lda #$d0           ; $96ed: a9 d0     
__96ef:     sta $04            ; $96ef: 85 04     
            jsr __afa5         ; $96f1: 20 a5 af  
            jsr __9707         ; $96f4: 20 07 97  
            lda #$01           ; $96f7: a9 01     
            sta $96            ; $96f9: 85 96     
            lda #$00           ; $96fb: a9 00     
            sta $a0            ; $96fd: 85 a0     
            sta $9f            ; $96ff: 85 9f     
            lda $0519          ; $9701: ad 19 05  
            sta $fc            ; $9704: 85 fc     
            rts                ; $9706: 60        

;-------------------------------------------------------------------------------
__9707:     lda #$19           ; $9707: a9 19     
            sta $00            ; $9709: 85 00     
            lda #$3f           ; $970b: a9 3f     
            sta $01            ; $970d: 85 01     
            lda #$4e           ; $970f: a9 4e     
            jmp __87ac         ; $9711: 4c ac 87  

;-------------------------------------------------------------------------------
__9714:     lda $a0            ; $9714: a5 a0     
            beq __9719         ; $9716: f0 01     
            rts                ; $9718: 60        

;-------------------------------------------------------------------------------
__9719:     ldy $53            ; $9719: a4 53     
            cpy #$03           ; $971b: c0 03     
            bne __9722         ; $971d: d0 03     
            jmp __97bc         ; $971f: 4c bc 97  

;-------------------------------------------------------------------------------
__9722:     lda $0203          ; $9722: ad 03 02  
            cpy #$01           ; $9725: c0 01     
            beq __9732         ; $9727: f0 09     
            cmp #$88           ; $9729: c9 88     
            beq __973b         ; $972b: f0 0e     
            bcc __973b         ; $972d: 90 0c     
            jmp __97bc         ; $972f: 4c bc 97  

;-------------------------------------------------------------------------------
__9732:     cmp #$28           ; $9732: c9 28     
            beq __973b         ; $9734: f0 05     
            bcc __973b         ; $9736: 90 03     
            jmp __97bc         ; $9738: 4c bc 97  

;-------------------------------------------------------------------------------
__973b:     lda $0200          ; $973b: ad 00 02  
            clc                ; $973e: 18        
            adc #$08           ; $973f: 69 08     
            jsr __9f27         ; $9741: 20 27 9f  
            sta $59            ; $9744: 85 59     
            lda $53            ; $9746: a5 53     
            sec                ; $9748: 38        
            sbc #$01           ; $9749: e9 01     
            asl                ; $974b: 0a        
            tax                ; $974c: aa        
            lda $59            ; $974d: a5 59     
            cmp __81a8,x       ; $974f: dd a8 81  
            beq __975d         ; $9752: f0 09     
            inx                ; $9754: e8        
            cmp __81a8,x       ; $9755: dd a8 81  
            beq __975d         ; $9758: f0 03     
            jmp __97bc         ; $975a: 4c bc 97  

;-------------------------------------------------------------------------------
__975d:     txa                ; $975d: 8a        
            and #$01           ; $975e: 29 01     
            beq __977b         ; $9760: f0 19     
            lda $0452          ; $9762: ad 52 04  
            bne __976a         ; $9765: d0 03     
            jmp __97bc         ; $9767: 4c bc 97  

;-------------------------------------------------------------------------------
__976a:     lda #$02           ; $976a: a9 02     
            sta $a0            ; $976c: 85 a0     
            lda $02d8          ; $976e: ad d8 02  
            sta $01            ; $9771: 85 01     
            lda $02db          ; $9773: ad db 02  
            sta $00            ; $9776: 85 00     
            jmp __9791         ; $9778: 4c 91 97  

;-------------------------------------------------------------------------------
__977b:     lda $0451          ; $977b: ad 51 04  
            bne __9783         ; $977e: d0 03     
            jmp __97bc         ; $9780: 4c bc 97  

;-------------------------------------------------------------------------------
__9783:     lda #$01           ; $9783: a9 01     
            sta $a0            ; $9785: 85 a0     
            lda $02d0          ; $9787: ad d0 02  
            sta $01            ; $978a: 85 01     
            lda $02d3          ; $978c: ad d3 02  
            sta $00            ; $978f: 85 00     
__9791:     lda #$2e           ; $9791: a9 2e     
            jsr __aef9         ; $9793: 20 f9 ae  
            jsr __a9f2         ; $9796: 20 f2 a9  
            lda #$30           ; $9799: a9 30     
            jsr __87de         ; $979b: 20 de 87  
            jsr __af00         ; $979e: 20 00 af  
            beq __97bc         ; $97a1: f0 19     
            lda $fc            ; $97a3: a5 fc     
            sta $0519          ; $97a5: 8d 19 05  
            lda $53            ; $97a8: a5 53     
            cmp #$04           ; $97aa: c9 04     
            bne __97bb         ; $97ac: d0 0d     
            lda #$19           ; $97ae: a9 19     
            sta $00            ; $97b0: 85 00     
            lda #$3f           ; $97b2: a9 3f     
            sta $01            ; $97b4: 85 01     
            lda #$46           ; $97b6: a9 46     
            jsr __87ac         ; $97b8: 20 ac 87  
__97bb:     rts                ; $97bb: 60        

;-------------------------------------------------------------------------------
__97bc:     lda #$00           ; $97bc: a9 00     
            sta $a0            ; $97be: 85 a0     
            rts                ; $97c0: 60        

;-------------------------------------------------------------------------------
__97c1:     lda #$f3           ; $97c1: a9 f3     
            sta $0b            ; $97c3: 85 0b     
            lda #$00           ; $97c5: a9 00     
            sta $86            ; $97c7: 85 86     
            ldy #$00           ; $97c9: a0 00     
            lda ($04),y        ; $97cb: b1 04     
__97cd:     sta $00            ; $97cd: 85 00     
            iny                ; $97cf: c8        
            lda ($04),y        ; $97d0: b1 04     
            sta $01            ; $97d2: 85 01     
            iny                ; $97d4: c8        
            lda ($04),y        ; $97d5: b1 04     
            clc                ; $97d7: 18        
            adc $06            ; $97d8: 65 06     
            sta $02            ; $97da: 85 02     
            lda $07            ; $97dc: a5 07     
            adc #$00           ; $97de: 69 00     
            sta $03            ; $97e0: 85 03     
            sty $86            ; $97e2: 84 86     
            jsr __af04         ; $97e4: 20 04 af  
            bne __97f5         ; $97e7: d0 0c     
            ldy $86            ; $97e9: a4 86     
            iny                ; $97eb: c8        
            lda ($04),y        ; $97ec: b1 04     
            cmp #$fe           ; $97ee: c9 fe     
            beq __97fa         ; $97f0: f0 08     
            jmp __97cd         ; $97f2: 4c cd 97  

;-------------------------------------------------------------------------------
__97f5:     lda #$01           ; $97f5: a9 01     
            jmp __97fc         ; $97f7: 4c fc 97  

;-------------------------------------------------------------------------------
__97fa:     lda #$00           ; $97fa: a9 00     
__97fc:     sta $0c            ; $97fc: 85 0c     
            rts                ; $97fe: 60        

;-------------------------------------------------------------------------------
__97ff:     lda $5a            ; $97ff: a5 5a     
            bne __982b         ; $9801: d0 28     
            lda $59            ; $9803: a5 59     
            beq __982b         ; $9805: f0 24     
            and #$01           ; $9807: 29 01     
            bne __9818         ; $9809: d0 0d     
            lda $56            ; $980b: a5 56     
            cmp #$01           ; $980d: c9 01     
            beq __9828         ; $980f: f0 17     
            cmp #$02           ; $9811: c9 02     
            beq __9825         ; $9813: f0 10     
            jmp __982b         ; $9815: 4c 2b 98  

;-------------------------------------------------------------------------------
__9818:     lda $56            ; $9818: a5 56     
            cmp #$01           ; $981a: c9 01     
            beq __9825         ; $981c: f0 07     
            cmp #$02           ; $981e: c9 02     
            beq __9828         ; $9820: f0 06     
            jmp __982b         ; $9822: 4c 2b 98  

;-------------------------------------------------------------------------------
__9825:     lda #$ff           ; $9825: a9 ff     
            rts                ; $9827: 60        

;-------------------------------------------------------------------------------
__9828:     lda #$01           ; $9828: a9 01     
            rts                ; $982a: 60        

;-------------------------------------------------------------------------------
__982b:     lda #$00           ; $982b: a9 00     
            rts                ; $982d: 60        

;-------------------------------------------------------------------------------
__982e:     lda $0200          ; $982e: ad 00 02  
            clc                ; $9831: 18        
            adc #$08           ; $9832: 69 08     
            jsr __9f27         ; $9834: 20 27 9f  
            sta $59            ; $9837: 85 59     
            cmp #$01           ; $9839: c9 01     
            beq __984c         ; $983b: f0 0f     
            ldx #$02           ; $983d: a2 02     
            lda #$0c           ; $983f: a9 0c     
__9841:     cpx $59            ; $9841: e4 59     
            beq __984f         ; $9843: f0 0a     
            clc                ; $9845: 18        
            adc #$06           ; $9846: 69 06     
            inx                ; $9848: e8        
            jmp __9841         ; $9849: 4c 41 98  

;-------------------------------------------------------------------------------
__984c:     sec                ; $984c: 38        
            sbc #$01           ; $984d: e9 01     
__984f:     tax                ; $984f: aa        
__9850:     lda #$00           ; $9850: a9 00     
            sta $86            ; $9852: 85 86     
            lda __808c,x       ; $9854: bd 8c 80  
            sta $00            ; $9857: 85 00     
            inx                ; $9859: e8        
            lda __808c,x       ; $985a: bd 8c 80  
            sta $01            ; $985d: 85 01     
            inx                ; $985f: e8        
            lda __808c,x       ; $9860: bd 8c 80  
            clc                ; $9863: 18        
            adc $06            ; $9864: 65 06     
            .hex 85            ; $9866: 85        Suspected data
__9867:     .hex 02            ; $9867: 02        Invalid Opcode - KIL 
            lda $07            ; $9868: a5 07     
            sta $03            ; $986a: 85 03     
            inx                ; $986c: e8        
            lda __808c,x       ; $986d: bd 8c 80  
            sta $08            ; $9870: 85 08     
            inx                ; $9872: e8        
            lda __808c,x       ; $9873: bd 8c 80  
            sta $09            ; $9876: 85 09     
__9878:     jsr __af00         ; $9878: 20 00 af  
            bne __989f         ; $987b: d0 22     
            lda $00            ; $987d: a5 00     
            clc                ; $987f: 18        
            adc $08            ; $9880: 65 08     
            sta $00            ; $9882: 85 00     
            dec $01            ; $9884: c6 01     
            inc $86            ; $9886: e6 86     
            lda $09            ; $9888: a5 09     
            cmp $86            ; $988a: c5 86     
            bne __9878         ; $988c: d0 ea     
            inx                ; $988e: e8        
            lda __808c,x       ; $988f: bd 8c 80  
            cmp #$fe           ; $9892: c9 fe     
            beq __989a         ; $9894: f0 04     
            inx                ; $9896: e8        
            jmp __9850         ; $9897: 4c 50 98  

;-------------------------------------------------------------------------------
__989a:     lda #$00           ; $989a: a9 00     
            jmp __98a1         ; $989c: 4c a1 98  

;-------------------------------------------------------------------------------
__989f:     lda #$01           ; $989f: a9 01     
__98a1:     sta $5a            ; $98a1: 85 5a     
            rts                ; $98a3: 60        

;-------------------------------------------------------------------------------
__98a4:     lda $56            ; $98a4: a5 56     
            cmp #$01           ; $98a6: c9 01     
            beq __98b1         ; $98a8: f0 07     
            cmp #$02           ; $98aa: c9 02     
            beq __98c3         ; $98ac: f0 15     
            jmp __98f7         ; $98ae: 4c f7 98  

;-------------------------------------------------------------------------------
__98b1:     lda $53            ; $98b1: a5 53     
            asl                ; $98b3: 0a        
            tax                ; $98b4: aa        
            dex                ; $98b5: ca        
            lda __81b4,x       ; $98b6: bd b4 81  
            cmp $0203          ; $98b9: cd 03 02  
            beq __98f4         ; $98bc: f0 36     
            bcc __98f4         ; $98be: 90 34     
            jmp __98f7         ; $98c0: 4c f7 98  

;-------------------------------------------------------------------------------
__98c3:     lda $53            ; $98c3: a5 53     
            asl                ; $98c5: 0a        
            tax                ; $98c6: aa        
            dex                ; $98c7: ca        
            dex                ; $98c8: ca        
            lda __81b4,x       ; $98c9: bd b4 81  
            cmp $0203          ; $98cc: cd 03 02  
            bcs __98f4         ; $98cf: b0 23     
            lda $53            ; $98d1: a5 53     
            cmp #$04           ; $98d3: c9 04     
            beq __98f7         ; $98d5: f0 20     
            ldx $59            ; $98d7: a6 59     
            cmp #$03           ; $98d9: c9 03     
            beq __98e4         ; $98db: f0 07     
            cpx #$06           ; $98dd: e0 06     
            bne __98f7         ; $98df: d0 16     
            jmp __98e8         ; $98e1: 4c e8 98  

;-------------------------------------------------------------------------------
__98e4:     cpx #$05           ; $98e4: e0 05     
            bne __98f7         ; $98e6: d0 0f     
__98e8:     lda $0203          ; $98e8: ad 03 02  
            cmp #$68           ; $98eb: c9 68     
            beq __98f4         ; $98ed: f0 05     
            bcc __98f4         ; $98ef: 90 03     
            jmp __98f7         ; $98f1: 4c f7 98  

;-------------------------------------------------------------------------------
__98f4:     lda #$01           ; $98f4: a9 01     
            rts                ; $98f6: 60        

;-------------------------------------------------------------------------------
__98f7:     lda #$00           ; $98f7: a9 00     
            rts                ; $98f9: 60        

;-------------------------------------------------------------------------------
__98fa:     sta $0a            ; $98fa: 85 0a     
__98fc:     sta $0b            ; $98fc: 85 0b     
            inc $88            ; $98fe: e6 88     
            lda $88            ; $9900: a5 88     
            cmp #$0f           ; $9902: c9 0f     
            bcs __9909         ; $9904: b0 03     
            jmp __990d         ; $9906: 4c 0d 99  

;-------------------------------------------------------------------------------
__9909:     lda #$00           ; $9909: a9 00     
            sta $88            ; $990b: 85 88     
__990d:     cmp #$08           ; $990d: c9 08     
            bcs __991a         ; $990f: b0 09     
            tax                ; $9911: aa        
            lda __81bc,x       ; $9912: bd bc 81  
            and $0a            ; $9915: 25 0a     
            jmp __9923         ; $9917: 4c 23 99  

;-------------------------------------------------------------------------------
__991a:     sec                ; $991a: 38        
            sbc #$08           ; $991b: e9 08     
            tax                ; $991d: aa        
            lda __81bc,x       ; $991e: bd bc 81  
            and $0b            ; $9921: 25 0b     
__9923:     beq __9927         ; $9923: f0 02     
            lda #$01           ; $9925: a9 01     
__9927:     sta $be            ; $9927: 85 be     
            rts                ; $9929: 60        

;-------------------------------------------------------------------------------
__992a:     jsr __a077         ; $992a: 20 77 a0  
            lda #$00           ; $992d: a9 00     
            sta $5d            ; $992f: 85 5d     
__9931:     jsr __aee6         ; $9931: 20 e6 ae  
            lda $0200,x        ; $9934: bd 00 02  
            cmp #$ff           ; $9937: c9 ff     
            bne __9951         ; $9939: d0 16     
            lda $36            ; $993b: a5 36     
            bne __9954         ; $993d: d0 15     
            lda #$80           ; $993f: a9 80     
            ldx $5d            ; $9941: a6 5d     
            sta $5e,x          ; $9943: 95 5e     
            lda #$10           ; $9945: a9 10     
            sta $37            ; $9947: 85 37     
            jsr __aa08         ; $9949: 20 08 aa  
            lda __8443,x       ; $994c: bd 43 84  
            sta $36            ; $994f: 85 36     
__9951:     jsr __9960         ; $9951: 20 60 99  
__9954:     lda $5d            ; $9954: a5 5d     
            clc                ; $9956: 18        
            adc #$01           ; $9957: 69 01     
            sta $5d            ; $9959: 85 5d     
            cmp #$09           ; $995b: c9 09     
            bne __9931         ; $995d: d0 d2     
            rts                ; $995f: 60        

;-------------------------------------------------------------------------------
__9960:     ldx $5d            ; $9960: a6 5d     
            lda $5e,x          ; $9962: b5 5e     
            cmp #$80           ; $9964: c9 80     
            beq __9991         ; $9966: f0 29     
            cmp #$81           ; $9968: c9 81     
            beq __9994         ; $996a: f0 28     
            cmp #$01           ; $996c: c9 01     
            beq __9997         ; $996e: f0 27     
            cmp #$02           ; $9970: c9 02     
            beq __999a         ; $9972: f0 26     
            cmp #$c0           ; $9974: c9 c0     
            beq __999d         ; $9976: f0 25     
            cmp #$c1           ; $9978: c9 c1     
            beq __999d         ; $997a: f0 21     
            cmp #$c2           ; $997c: c9 c2     
            beq __999d         ; $997e: f0 1d     
            cmp #$08           ; $9980: c9 08     
            beq __99a3         ; $9982: f0 1f     
            cmp #$10           ; $9984: c9 10     
            beq __99a6         ; $9986: f0 1e     
            cmp #$20           ; $9988: c9 20     
            beq __99a9         ; $998a: f0 1d     
            cmp #$40           ; $998c: c9 40     
            beq __99ac         ; $998e: f0 1c     
            rts                ; $9990: 60        

;-------------------------------------------------------------------------------
__9991:     jmp __99af         ; $9991: 4c af 99  

;-------------------------------------------------------------------------------
__9994:     jmp __9a13         ; $9994: 4c 13 9a  

;-------------------------------------------------------------------------------
__9997:     jmp __9a3f         ; $9997: 4c 3f 9a  

;-------------------------------------------------------------------------------
__999a:     jmp __9b43         ; $999a: 4c 43 9b  

;-------------------------------------------------------------------------------
__999d:     lda $0421,x        ; $999d: bd 21 04  
            jmp __9c9d         ; $99a0: 4c 9d 9c  

;-------------------------------------------------------------------------------
__99a3:     jmp __9b7c         ; $99a3: 4c 7c 9b  

;-------------------------------------------------------------------------------
__99a6:     jmp __9be3         ; $99a6: 4c e3 9b  

;-------------------------------------------------------------------------------
__99a9:     jmp __9c44         ; $99a9: 4c 44 9c  

;-------------------------------------------------------------------------------
__99ac:     jmp __9e18         ; $99ac: 4c 18 9e  

;-------------------------------------------------------------------------------
__99af:     jsr __aee6         ; $99af: 20 e6 ae  
            lda #$30           ; $99b2: a9 30     
            sta $00            ; $99b4: 85 00     
            sta $01            ; $99b6: 85 01     
            lda #$90           ; $99b8: a9 90     
            sta $02            ; $99ba: 85 02     
            stx $04            ; $99bc: 86 04     
            jsr __a9ec         ; $99be: 20 ec a9  
            lda $37            ; $99c1: a5 37     
            bne __9a12         ; $99c3: d0 4d     
            lda #$81           ; $99c5: a9 81     
            ldx $5d            ; $99c7: a6 5d     
            sta $5e,x          ; $99c9: 95 5e     
            lda #$00           ; $99cb: a9 00     
            sta $8a,x          ; $99cd: 95 8a     
            lda $ad            ; $99cf: a5 ad     
            beq __99d6         ; $99d1: f0 03     
            jmp __99e8         ; $99d3: 4c e8 99  

;-------------------------------------------------------------------------------
__99d6:     lda $5d            ; $99d6: a5 5d     
            bne __9a12         ; $99d8: d0 38     
            lda #$c0           ; $99da: a9 c0     
            ldx $5d            ; $99dc: a6 5d     
            sta $5e,x          ; $99de: 95 5e     
            lda #$01           ; $99e0: a9 01     
            sta $0421,x        ; $99e2: 9d 21 04  
            jmp __9a0a         ; $99e5: 4c 0a 9a  

;-------------------------------------------------------------------------------
__99e8:     lda $43            ; $99e8: a5 43     
            bne __9a12         ; $99ea: d0 26     
            lda $5d            ; $99ec: a5 5d     
            bne __9a12         ; $99ee: d0 22     
            lda #$c0           ; $99f0: a9 c0     
            ldx $5d            ; $99f2: a6 5d     
            sta $5e,x          ; $99f4: 95 5e     
            lda $0421,x        ; $99f6: bd 21 04  
            cmp #$01           ; $99f9: c9 01     
            bne __9a05         ; $99fb: d0 08     
            lda #$03           ; $99fd: a9 03     
            sta $0421,x        ; $99ff: 9d 21 04  
            jmp __9a0a         ; $9a02: 4c 0a 9a  

;-------------------------------------------------------------------------------
__9a05:     lda #$01           ; $9a05: a9 01     
            sta $0421,x        ; $9a07: 9d 21 04  
__9a0a:     jsr __aa08         ; $9a0a: 20 08 aa  
            lda __844d,x       ; $9a0d: bd 4d 84  
            sta $43            ; $9a10: 85 43     
__9a12:     rts                ; $9a12: 60        

;-------------------------------------------------------------------------------
__9a13:     lda #$55           ; $9a13: a9 55     
            jsr __9ef5         ; $9a15: 20 f5 9e  
            bne __9a34         ; $9a18: d0 1a     
            jsr __aee6         ; $9a1a: 20 e6 ae  
            lda #$4d           ; $9a1d: a9 4d     
            sta $00            ; $9a1f: 85 00     
            lda #$32           ; $9a21: a9 32     
            sta $01            ; $9a23: 85 01     
            lda #$84           ; $9a25: a9 84     
            sta $02            ; $9a27: 85 02     
            stx $04            ; $9a29: 86 04     
            jsr __a9ec         ; $9a2b: 20 ec a9  
            inc $0515          ; $9a2e: ee 15 05  
            jmp __9a3e         ; $9a31: 4c 3e 9a  

;-------------------------------------------------------------------------------
__9a34:     ldx $5d            ; $9a34: a6 5d     
            lda #$01           ; $9a36: a9 01     
            sta $5e,x          ; $9a38: 95 5e     
            lda #$84           ; $9a3a: a9 84     
            sta $72,x          ; $9a3c: 95 72     
__9a3e:     rts                ; $9a3e: 60        

;-------------------------------------------------------------------------------
__9a3f:     lda #$ff           ; $9a3f: a9 ff     
            jsr __9ef5         ; $9a41: 20 f5 9e  
            bne __9a47         ; $9a44: d0 01     
            rts                ; $9a46: 60        

;-------------------------------------------------------------------------------
__9a47:     jsr __aee6         ; $9a47: 20 e6 ae  
            pha                ; $9a4a: 48        
            jsr __a9fd         ; $9a4b: 20 fd a9  
            lda $01            ; $9a4e: a5 01     
            jsr __9f27         ; $9a50: 20 27 9f  
            ldy $5d            ; $9a53: a4 5d     
            sta $0068,y        ; $9a55: 99 68 00  
            and #$01           ; $9a58: 29 01     
            bne __9a61         ; $9a5a: d0 05     
            inc $00            ; $9a5c: e6 00     
            jmp __9a63         ; $9a5e: 4c 63 9a  

;-------------------------------------------------------------------------------
__9a61:     dec $00            ; $9a61: c6 00     
__9a63:     lda $00            ; $9a63: a5 00     
            jsr __9f6b         ; $9a65: 20 6b 9f  
            sta $7d            ; $9a68: 85 7d     
            jsr __9f59         ; $9a6a: 20 59 9f  
            clc                ; $9a6d: 18        
            adc $01            ; $9a6e: 65 01     
            sta $01            ; $9a70: 85 01     
            jsr __9b01         ; $9a72: 20 01 9b  
            ldx $5d            ; $9a75: a6 5d     
            lda $72,x          ; $9a77: b5 72     
            jsr __a9e5         ; $9a79: 20 e5 a9  
            pla                ; $9a7c: 68        
            tax                ; $9a7d: aa        
            jsr __af91         ; $9a7e: 20 91 af  
            lda $00            ; $9a81: a5 00     
            jsr __9fbf         ; $9a83: 20 bf 9f  
            beq __9abf         ; $9a86: f0 37     
            jsr __aa08         ; $9a88: 20 08 aa  
            lda __8448,x       ; $9a8b: bd 48 84  
            and $19            ; $9a8e: 25 19     
            bne __9abf         ; $9a90: d0 2d     
            ldx $5d            ; $9a92: a6 5d     
            lda $68,x          ; $9a94: b5 68     
            tax                ; $9a96: aa        
            dex                ; $9a97: ca        
            lda $7e,x          ; $9a98: b5 7e     
            cmp #$04           ; $9a9a: c9 04     
            bcs __9abf         ; $9a9c: b0 21     
            lda $96            ; $9a9e: a5 96     
            cmp #$02           ; $9aa0: c9 02     
            bne __9ab6         ; $9aa2: d0 12     
            ldx $04            ; $9aa4: a6 04     
            lda $0200,x        ; $9aa6: bd 00 02  
            cmp $0200          ; $9aa9: cd 00 02  
            bcs __9ab6         ; $9aac: b0 08     
            clc                ; $9aae: 18        
            adc #$0f           ; $9aaf: 69 0f     
            cmp $0200          ; $9ab1: cd 00 02  
            bcs __9abf         ; $9ab4: b0 09     
__9ab6:     lda #$02           ; $9ab6: a9 02     
            ldx $5d            ; $9ab8: a6 5d     
            sta $5e,x          ; $9aba: 95 5e     
            dec $68,x          ; $9abc: d6 68     
            rts                ; $9abe: 60        

;-------------------------------------------------------------------------------
__9abf:     lda $00            ; $9abf: a5 00     
            jsr __9fa1         ; $9ac1: 20 a1 9f  
            beq __9ac9         ; $9ac4: f0 03     
            jmp __9afa         ; $9ac6: 4c fa 9a  

;-------------------------------------------------------------------------------
__9ac9:     jsr __9e51         ; $9ac9: 20 51 9e  
            ldx $5d            ; $9acc: a6 5d     
            lda $68,x          ; $9ace: b5 68     
            cmp #$01           ; $9ad0: c9 01     
            bne __9b00         ; $9ad2: d0 2c     
            jsr __9ed4         ; $9ad4: 20 d4 9e  
            lda $00            ; $9ad7: a5 00     
            cmp #$20           ; $9ad9: c9 20     
            beq __9ae0         ; $9adb: f0 03     
            bcc __9ae0         ; $9add: 90 01     
            rts                ; $9adf: 60        

;-------------------------------------------------------------------------------
__9ae0:     lda #$03           ; $9ae0: a9 03     
            sta $02            ; $9ae2: 85 02     
            lda #$04           ; $9ae4: a9 04     
            sta $03            ; $9ae6: 85 03     
            jsr __af9f         ; $9ae8: 20 9f af  
            lda #$01           ; $9aeb: a9 01     
            sta $ad            ; $9aed: 85 ad     
            lda #$00           ; $9aef: a9 00     
            ldx $5d            ; $9af1: a6 5d     
            sta $68,x          ; $9af3: 95 68     
            lda #$80           ; $9af5: a9 80     
            sta $fe            ; $9af7: 85 fe     
            rts                ; $9af9: 60        

;-------------------------------------------------------------------------------
__9afa:     ldx $5d            ; $9afa: a6 5d     
            lda #$08           ; $9afc: a9 08     
            sta $5e,x          ; $9afe: 95 5e     
__9b00:     rts                ; $9b00: 60        

;-------------------------------------------------------------------------------
__9b01:     ldx $5d            ; $9b01: a6 5d     
            inc $040d,x        ; $9b03: fe 0d 04  
            lda $040d,x        ; $9b06: bd 0d 04  
            cmp #$06           ; $9b09: c9 06     
            bcs __9b0e         ; $9b0b: b0 01     
            rts                ; $9b0d: 60        

;-------------------------------------------------------------------------------
__9b0e:     lda #$00           ; $9b0e: a9 00     
            sta $040d,x        ; $9b10: 9d 0d 04  
            lda $68,x          ; $9b13: b5 68     
            and #$01           ; $9b15: 29 01     
            beq __9b2e         ; $9b17: f0 15     
            lda $72,x          ; $9b19: b5 72     
            clc                ; $9b1b: 18        
            adc #$04           ; $9b1c: 69 04     
            cmp #$80           ; $9b1e: c9 80     
            bcc __9b29         ; $9b20: 90 07     
            cmp #$90           ; $9b22: c9 90     
            bcs __9b29         ; $9b24: b0 03     
            jmp __9b40         ; $9b26: 4c 40 9b  

;-------------------------------------------------------------------------------
__9b29:     lda #$80           ; $9b29: a9 80     
            jmp __9b40         ; $9b2b: 4c 40 9b  

;-------------------------------------------------------------------------------
__9b2e:     lda $72,x          ; $9b2e: b5 72     
            sec                ; $9b30: 38        
            sbc #$04           ; $9b31: e9 04     
            cmp #$80           ; $9b33: c9 80     
            bcc __9b3e         ; $9b35: 90 07     
            cmp #$90           ; $9b37: c9 90     
            bcs __9b3e         ; $9b39: b0 03     
            jmp __9b40         ; $9b3b: 4c 40 9b  

;-------------------------------------------------------------------------------
__9b3e:     lda #$8c           ; $9b3e: a9 8c     
__9b40:     sta $72,x          ; $9b40: 95 72     
            rts                ; $9b42: 60        

;-------------------------------------------------------------------------------
__9b43:     lda #$55           ; $9b43: a9 55     
            jsr __9ef5         ; $9b45: 20 f5 9e  
            beq __9b7b         ; $9b48: f0 31     
            jsr __aee6         ; $9b4a: 20 e6 ae  
            stx $04            ; $9b4d: 86 04     
            jsr __a9fd         ; $9b4f: 20 fd a9  
            inc $01            ; $9b52: e6 01     
            ldy $5d            ; $9b54: a4 5d     
            lda $0072,y        ; $9b56: b9 72 00  
            cmp #$90           ; $9b59: c9 90     
            bne __9b62         ; $9b5b: d0 05     
            lda #$94           ; $9b5d: a9 94     
            jmp __9b64         ; $9b5f: 4c 64 9b  

;-------------------------------------------------------------------------------
__9b62:     lda #$90           ; $9b62: a9 90     
__9b64:     sta $02            ; $9b64: 85 02     
            ldx $5d            ; $9b66: a6 5d     
            sta $72,x          ; $9b68: 95 72     
            jsr __a9ec         ; $9b6a: 20 ec a9  
            lda $01            ; $9b6d: a5 01     
            ldx $5d            ; $9b6f: a6 5d     
            cmp $a3,x          ; $9b71: d5 a3     
            bne __9b7b         ; $9b73: d0 06     
            ldx $5d            ; $9b75: a6 5d     
            lda #$01           ; $9b77: a9 01     
            sta $5e,x          ; $9b79: 95 5e     
__9b7b:     rts                ; $9b7b: 60        

;-------------------------------------------------------------------------------
__9b7c:     lda #$ff           ; $9b7c: a9 ff     
            jsr __9ef5         ; $9b7e: 20 f5 9e  
            bne __9b84         ; $9b81: d0 01     
            rts                ; $9b83: 60        

;-------------------------------------------------------------------------------
__9b84:     jsr __aee6         ; $9b84: 20 e6 ae  
            stx $04            ; $9b87: 86 04     
            jsr __a9fd         ; $9b89: 20 fd a9  
            inc $01            ; $9b8c: e6 01     
            lda $01            ; $9b8e: a5 01     
            and #$01           ; $9b90: 29 01     
            beq __9ba3         ; $9b92: f0 0f     
            ldx $5d            ; $9b94: a6 5d     
            lda $68,x          ; $9b96: b5 68     
            and #$01           ; $9b98: 29 01     
__9b9a:     beq __9ba1         ; $9b9a: f0 05     
            dec $00            ; $9b9c: c6 00     
            jmp __9ba3         ; $9b9e: 4c a3 9b  

;-------------------------------------------------------------------------------
__9ba1:     inc $00            ; $9ba1: e6 00     
__9ba3:     jsr __9b01         ; $9ba3: 20 01 9b  
            ldx $5d            ; $9ba6: a6 5d     
            lda $72,x          ; $9ba8: b5 72     
            sta $02            ; $9baa: 85 02     
            jsr __a9ec         ; $9bac: 20 ec a9  
            lda #$32           ; $9baf: a9 32     
            jsr __87ea         ; $9bb1: 20 ea 87  
            lda $01            ; $9bb4: a5 01     
            jsr __a023         ; $9bb6: 20 23 a0  
            beq __9be2         ; $9bb9: f0 27     
            ldx $5d            ; $9bbb: a6 5d     
            lda #$10           ; $9bbd: a9 10     
            sta $5e,x          ; $9bbf: 95 5e     
            jsr __a041         ; $9bc1: 20 41 a0  
            beq __9bcf         ; $9bc4: f0 09     
            lda $19            ; $9bc6: a5 19     
            and #$01           ; $9bc8: 29 01     
            beq __9bcf         ; $9bca: f0 03     
            jmp __9bdc         ; $9bcc: 4c dc 9b  

;-------------------------------------------------------------------------------
__9bcf:     ldx $5d            ; $9bcf: a6 5d     
            lda $68,x          ; $9bd1: b5 68     
            tax                ; $9bd3: aa        
            dex                ; $9bd4: ca        
            lda $7e,x          ; $9bd5: b5 7e     
            cmp #$04           ; $9bd7: c9 04     
            bcs __9bdc         ; $9bd9: b0 01     
            rts                ; $9bdb: 60        

;-------------------------------------------------------------------------------
__9bdc:     ldx $5d            ; $9bdc: a6 5d     
            lda #$20           ; $9bde: a9 20     
            sta $5e,x          ; $9be0: 95 5e     
__9be2:     rts                ; $9be2: 60        

;-------------------------------------------------------------------------------
__9be3:     lda #$77           ; $9be3: a9 77     
            jsr __9ef5         ; $9be5: 20 f5 9e  
            bne __9beb         ; $9be8: d0 01     
            rts                ; $9bea: 60        

;-------------------------------------------------------------------------------
__9beb:     jsr __aee6         ; $9beb: 20 e6 ae  
            stx $04            ; $9bee: 86 04     
            jsr __a9fd         ; $9bf0: 20 fd a9  
            lda $01            ; $9bf3: a5 01     
            jsr __9f27         ; $9bf5: 20 27 9f  
            ldx $5d            ; $9bf8: a6 5d     
            sta $68,x          ; $9bfa: 95 68     
            and #$01           ; $9bfc: 29 01     
            bne __9c13         ; $9bfe: d0 13     
            inc $00            ; $9c00: e6 00     
            lda $00            ; $9c02: a5 00     
            ldx #$00           ; $9c04: a2 00     
__9c06:     cmp __83fc,x       ; $9c06: dd fc 83  
            beq __9c26         ; $9c09: f0 1b     
            inx                ; $9c0b: e8        
            cpx #$0b           ; $9c0c: e0 0b     
            beq __9c38         ; $9c0e: f0 28     
            jmp __9c06         ; $9c10: 4c 06 9c  

;-------------------------------------------------------------------------------
__9c13:     dec $00            ; $9c13: c6 00     
            lda $00            ; $9c15: a5 00     
            ldx #$00           ; $9c17: a2 00     
__9c19:     cmp __8412,x       ; $9c19: dd 12 84  
            beq __9c26         ; $9c1c: f0 08     
            inx                ; $9c1e: e8        
            cpx #$0b           ; $9c1f: e0 0b     
            beq __9c38         ; $9c21: f0 15     
            jmp __9c19         ; $9c23: 4c 19 9c  

;-------------------------------------------------------------------------------
__9c26:     lda $01            ; $9c26: a5 01     
            clc                ; $9c28: 18        
            adc __8407,x       ; $9c29: 7d 07 84  
            sta $01            ; $9c2c: 85 01     
            cpx #$0a           ; $9c2e: e0 0a     
            bne __9c38         ; $9c30: d0 06     
            ldx $5d            ; $9c32: a6 5d     
            lda #$01           ; $9c34: a9 01     
            sta $5e,x          ; $9c36: 95 5e     
__9c38:     jsr __9b01         ; $9c38: 20 01 9b  
            ldx $5d            ; $9c3b: a6 5d     
            lda $72,x          ; $9c3d: b5 72     
            sta $02            ; $9c3f: 85 02     
            jmp __a9ec         ; $9c41: 4c ec a9  

;-------------------------------------------------------------------------------
__9c44:     lda #$55           ; $9c44: a9 55     
            jsr __9ef5         ; $9c46: 20 f5 9e  
            bne __9c4c         ; $9c49: d0 01     
            rts                ; $9c4b: 60        

;-------------------------------------------------------------------------------
__9c4c:     jsr __aee6         ; $9c4c: 20 e6 ae  
            stx $04            ; $9c4f: 86 04     
            jsr __a9fd         ; $9c51: 20 fd a9  
            lda $01            ; $9c54: a5 01     
            jsr __9f27         ; $9c56: 20 27 9f  
            ldx $5d            ; $9c59: a6 5d     
            sta $68,x          ; $9c5b: 95 68     
            and #$01           ; $9c5d: 29 01     
            bne __9c72         ; $9c5f: d0 11     
            dec $00            ; $9c61: c6 00     
            lda $01            ; $9c63: a5 01     
            cmp #$14           ; $9c65: c9 14     
            bne __9c6b         ; $9c67: d0 02     
            dec $01            ; $9c69: c6 01     
__9c6b:     lda $00            ; $9c6b: a5 00     
            bne __9c85         ; $9c6d: d0 16     
            jmp __9c91         ; $9c6f: 4c 91 9c  

;-------------------------------------------------------------------------------
__9c72:     inc $00            ; $9c72: e6 00     
            lda $01            ; $9c74: a5 01     
            cmp #$ec           ; $9c76: c9 ec     
            bne __9c7c         ; $9c78: d0 02     
            dec $01            ; $9c7a: c6 01     
__9c7c:     lda $00            ; $9c7c: a5 00     
            cmp #$f4           ; $9c7e: c9 f4     
            bne __9c85         ; $9c80: d0 03     
            jmp __9c91         ; $9c82: 4c 91 9c  

;-------------------------------------------------------------------------------
__9c85:     jsr __9b01         ; $9c85: 20 01 9b  
            ldx $5d            ; $9c88: a6 5d     
            lda $72,x          ; $9c8a: b5 72     
            sta $02            ; $9c8c: 85 02     
            jmp __a9ec         ; $9c8e: 4c ec a9  

;-------------------------------------------------------------------------------
__9c91:     lda #$22           ; $9c91: a9 22     
            jsr __afa3         ; $9c93: 20 a3 af  
            lda #$00           ; $9c96: a9 00     
            ldx $5d            ; $9c98: a6 5d     
            sta $68,x          ; $9c9a: 95 68     
            rts                ; $9c9c: 60        

;-------------------------------------------------------------------------------
__9c9d:     sta $07            ; $9c9d: 85 07     
            ldx $5d            ; $9c9f: a6 5d     
            lda $5e,x          ; $9ca1: b5 5e     
            cmp #$c2           ; $9ca3: c9 c2     
            bne __9caa         ; $9ca5: d0 03     
            jmp __9d94         ; $9ca7: 4c 94 9d  

;-------------------------------------------------------------------------------
__9caa:     cmp #$c1           ; $9caa: c9 c1     
            beq __9ce9         ; $9cac: f0 3b     
            lda $07            ; $9cae: a5 07     
            cmp #$02           ; $9cb0: c9 02     
            beq __9cbd         ; $9cb2: f0 09     
            cmp #$03           ; $9cb4: c9 03     
            beq __9cc2         ; $9cb6: f0 0a     
            lda #$34           ; $9cb8: a9 34     
            jmp __9cc4         ; $9cba: 4c c4 9c  

;-------------------------------------------------------------------------------
__9cbd:     lda #$36           ; $9cbd: a9 36     
            jmp __9cc4         ; $9cbf: 4c c4 9c  

;-------------------------------------------------------------------------------
__9cc2:     lda #$38           ; $9cc2: a9 38     
__9cc4:     jsr __87ea         ; $9cc4: 20 ea 87  
            jsr __aee6         ; $9cc7: 20 e6 ae  
            stx $04            ; $9cca: 86 04     
            lda $0200,x        ; $9ccc: bd 00 02  
            jsr __a023         ; $9ccf: 20 23 a0  
            ldy $0a            ; $9cd2: a4 0a     
            cpy #$04           ; $9cd4: c0 04     
            bne __9cdb         ; $9cd6: d0 03     
            jmp __9d85         ; $9cd8: 4c 85 9d  

;-------------------------------------------------------------------------------
__9cdb:     cmp #$00           ; $9cdb: c9 00     
            beq __9ce9         ; $9cdd: f0 0a     
            ldx $5d            ; $9cdf: a6 5d     
            lda #$01           ; $9ce1: a9 01     
            sta $8a,x          ; $9ce3: 95 8a     
            lda #$c1           ; $9ce5: a9 c1     
            sta $5e,x          ; $9ce7: 95 5e     
__9ce9:     jsr __aee6         ; $9ce9: 20 e6 ae  
            stx $04            ; $9cec: 86 04     
            ldx $5d            ; $9cee: a6 5d     
            lda $5e,x          ; $9cf0: b5 5e     
            cmp #$c1           ; $9cf2: c9 c1     
            bne __9d25         ; $9cf4: d0 2f     
            lda #$20           ; $9cf6: a9 20     
            jsr __9ef5         ; $9cf8: 20 f5 9e  
            bne __9d07         ; $9cfb: d0 0a     
            ldx $04            ; $9cfd: a6 04     
            lda $0200,x        ; $9cff: bd 00 02  
            sta $01            ; $9d02: 85 01     
            jmp __9d39         ; $9d04: 4c 39 9d  

;-------------------------------------------------------------------------------
__9d07:     ldx $5d            ; $9d07: a6 5d     
            lda #$c0           ; $9d09: a9 c0     
            sta $5e,x          ; $9d0b: 95 5e     
            lda $07            ; $9d0d: a5 07     
            cmp #$03           ; $9d0f: c9 03     
            bne __9d22         ; $9d11: d0 0f     
            lda $0417,x        ; $9d13: bd 17 04  
            beq __9d1d         ; $9d16: f0 05     
            lda #$00           ; $9d18: a9 00     
            jmp __9d1f         ; $9d1a: 4c 1f 9d  

;-------------------------------------------------------------------------------
__9d1d:     lda #$01           ; $9d1d: a9 01     
__9d1f:     sta $0417,x        ; $9d1f: 9d 17 04  
__9d22:     jmp __9d2c         ; $9d22: 4c 2c 9d  

;-------------------------------------------------------------------------------
__9d25:     lda #$ff           ; $9d25: a9 ff     
            jsr __9ef5         ; $9d27: 20 f5 9e  
            beq __9d97         ; $9d2a: f0 6b     
__9d2c:     ldx $04            ; $9d2c: a6 04     
            lda #$01           ; $9d2e: a9 01     
            clc                ; $9d30: 18        
            adc $0200,x        ; $9d31: 7d 00 02  
            sta $01            ; $9d34: 85 01     
            jsr __9d98         ; $9d36: 20 98 9d  
__9d39:     inx                ; $9d39: e8        
            inx                ; $9d3a: e8        
            inx                ; $9d3b: e8        
            lda $07            ; $9d3c: a5 07     
            cmp #$02           ; $9d3e: c9 02     
            bne __9d48         ; $9d40: d0 06     
            inc $0200,x        ; $9d42: fe 00 02  
            jmp __9d68         ; $9d45: 4c 68 9d  

;-------------------------------------------------------------------------------
__9d48:     cmp #$03           ; $9d48: c9 03     
            bne __9d68         ; $9d4a: d0 1c     
            lda $01            ; $9d4c: a5 01     
            and #$01           ; $9d4e: 29 01     
            beq __9d68         ; $9d50: f0 16     
            ldy $5d            ; $9d52: a4 5d     
            lda $0417,y        ; $9d54: b9 17 04  
            bne __9d62         ; $9d57: d0 09     
            inc $0200,x        ; $9d59: fe 00 02  
            inc $0200,x        ; $9d5c: fe 00 02  
            jmp __9d68         ; $9d5f: 4c 68 9d  

;-------------------------------------------------------------------------------
__9d62:     dec $0200,x        ; $9d62: de 00 02  
            dec $0200,x        ; $9d65: de 00 02  
__9d68:     lda $0200,x        ; $9d68: bd 00 02  
            sta $00            ; $9d6b: 85 00     
            ldx $5d            ; $9d6d: a6 5d     
            lda $72,x          ; $9d6f: b5 72     
            cmp #$90           ; $9d71: c9 90     
            bne __9d7a         ; $9d73: d0 05     
            lda #$94           ; $9d75: a9 94     
            jmp __9d7c         ; $9d77: 4c 7c 9d  

;-------------------------------------------------------------------------------
__9d7a:     lda #$90           ; $9d7a: a9 90     
__9d7c:     sta $02            ; $9d7c: 85 02     
            ldx $5d            ; $9d7e: a6 5d     
            sta $72,x          ; $9d80: 95 72     
            jmp __a9ec         ; $9d82: 4c ec a9  

;-------------------------------------------------------------------------------
__9d85:     lda #$c2           ; $9d85: a9 c2     
            ldx $5d            ; $9d87: a6 5d     
            sta $5e,x          ; $9d89: 95 5e     
            ldx $04            ; $9d8b: a6 04     
            lda $0203,x        ; $9d8d: bd 03 02  
            sta $042b          ; $9d90: 8d 2b 04  
            rts                ; $9d93: 60        

;-------------------------------------------------------------------------------
__9d94:     jsr __9db7         ; $9d94: 20 b7 9d  
__9d97:     rts                ; $9d97: 60        

;-------------------------------------------------------------------------------
__9d98:     lda $07            ; $9d98: a5 07     
            cmp #$01           ; $9d9a: c9 01     
            bne __9db6         ; $9d9c: d0 18     
            ldy #$00           ; $9d9e: a0 00     
            lda $01            ; $9da0: a5 01     
__9da2:     cmp __841d,y       ; $9da2: d9 1d 84  
            bcc __9db1         ; $9da5: 90 0a     
            cmp __8420,y       ; $9da7: d9 20 84  
            bcs __9db1         ; $9daa: b0 05     
            inc $01            ; $9dac: e6 01     
            jmp __9db6         ; $9dae: 4c b6 9d  

;-------------------------------------------------------------------------------
__9db1:     iny                ; $9db1: c8        
            cpy #$03           ; $9db2: c0 03     
            bne __9da2         ; $9db4: d0 ec     
__9db6:     rts                ; $9db6: 60        

;-------------------------------------------------------------------------------
__9db7:     jsr __aee6         ; $9db7: 20 e6 ae  
            stx $04            ; $9dba: 86 04     
            jsr __a9fd         ; $9dbc: 20 fd a9  
            dec $00            ; $9dbf: c6 00     
            lda $042b          ; $9dc1: ad 2b 04  
            sec                ; $9dc4: 38        
            sbc #$01           ; $9dc5: e9 01     
            cmp $00            ; $9dc7: c5 00     
            beq __9dfa         ; $9dc9: f0 2f     
            sec                ; $9dcb: 38        
            sbc #$01           ; $9dcc: e9 01     
            cmp $00            ; $9dce: c5 00     
            beq __9dfa         ; $9dd0: f0 28     
            sec                ; $9dd2: 38        
            sbc #$01           ; $9dd3: e9 01     
            cmp $00            ; $9dd5: c5 00     
            beq __9e04         ; $9dd7: f0 2b     
            sec                ; $9dd9: 38        
            sbc #$08           ; $9dda: e9 08     
            cmp $00            ; $9ddc: c5 00     
            beq __9dff         ; $9dde: f0 1f     
            sec                ; $9de0: 38        
            sbc #$01           ; $9de1: e9 01     
            cmp $00            ; $9de3: c5 00     
            beq __9dff         ; $9de5: f0 18     
            sec                ; $9de7: 38        
            sbc #$01           ; $9de8: e9 01     
            cmp $00            ; $9dea: c5 00     
            bne __9e0d         ; $9dec: d0 1f     
__9dee:     lda #$01           ; $9dee: a9 01     
            ldx $5d            ; $9df0: a6 5d     
            sta $5e,x          ; $9df2: 95 5e     
            lda #$00           ; $9df4: a9 00     
            sta $0417,x        ; $9df6: 9d 17 04  
            rts                ; $9df9: 60        

;-------------------------------------------------------------------------------
__9dfa:     dec $01            ; $9dfa: c6 01     
            jmp __9e0d         ; $9dfc: 4c 0d 9e  

;-------------------------------------------------------------------------------
__9dff:     inc $01            ; $9dff: e6 01     
            jmp __9e0d         ; $9e01: 4c 0d 9e  

;-------------------------------------------------------------------------------
__9e04:     ldx $5d            ; $9e04: a6 5d     
            lda $0421,x        ; $9e06: bd 21 04  
            cmp #$01           ; $9e09: c9 01     
            beq __9dee         ; $9e0b: f0 e1     
__9e0d:     lda #$84           ; $9e0d: a9 84     
            ldx $5d            ; $9e0f: a6 5d     
            sta $72,x          ; $9e11: 95 72     
            sta $02            ; $9e13: 85 02     
            jmp __a9ec         ; $9e15: 4c ec a9  

;-------------------------------------------------------------------------------
__9e18:     lda #$55           ; $9e18: a9 55     
            jsr __9ef5         ; $9e1a: 20 f5 9e  
            bne __9e20         ; $9e1d: d0 01     
            rts                ; $9e1f: 60        

;-------------------------------------------------------------------------------
__9e20:     jsr __aee6         ; $9e20: 20 e6 ae  
            stx $04            ; $9e23: 86 04     
            jsr __a9fd         ; $9e25: 20 fd a9  
            inc $01            ; $9e28: e6 01     
            lda $0201,x        ; $9e2a: bd 01 02  
            cmp #$90           ; $9e2d: c9 90     
            beq __9e36         ; $9e2f: f0 05     
            lda #$90           ; $9e31: a9 90     
            jmp __9e38         ; $9e33: 4c 38 9e  

;-------------------------------------------------------------------------------
__9e36:     lda #$94           ; $9e36: a9 94     
__9e38:     sta $02            ; $9e38: 85 02     
            jsr __a9ec         ; $9e3a: 20 ec a9  
            lda $c0            ; $9e3d: a5 c0     
            cmp $01            ; $9e3f: c5 01     
            beq __9e46         ; $9e41: f0 03     
            bcc __9e46         ; $9e43: 90 01     
            rts                ; $9e45: 60        

;-------------------------------------------------------------------------------
__9e46:     ldx $5d            ; $9e46: a6 5d     
            lda #$01           ; $9e48: a9 01     
            sta $5e,x          ; $9e4a: 95 5e     
            lda #$00           ; $9e4c: a9 00     
            sta $c0            ; $9e4e: 85 c0     
            rts                ; $9e50: 60        

;-------------------------------------------------------------------------------
__9e51:     lda $c0            ; $9e51: a5 c0     
            beq __9e56         ; $9e53: f0 01     
            rts                ; $9e55: 60        

;-------------------------------------------------------------------------------
__9e56:     lda $96            ; $9e56: a5 96     
            cmp #$0a           ; $9e58: c9 0a     
            beq __9e5d         ; $9e5a: f0 01     
            rts                ; $9e5c: 60        

;-------------------------------------------------------------------------------
__9e5d:     lda $59            ; $9e5d: a5 59     
            cmp #$03           ; $9e5f: c9 03     
            beq __9e66         ; $9e61: f0 03     
            jmp __9e83         ; $9e63: 4c 83 9e  

;-------------------------------------------------------------------------------
__9e66:     ldx #$03           ; $9e66: a2 03     
            lda $7e,x          ; $9e68: b5 7e     
            cmp #$05           ; $9e6a: c9 05     
            bcs __9e6f         ; $9e6c: b0 01     
            rts                ; $9e6e: 60        

;-------------------------------------------------------------------------------
__9e6f:     ldx #$00           ; $9e6f: a2 00     
__9e71:     lda $5e,x          ; $9e71: b5 5e     
            cmp #$01           ; $9e73: c9 01     
            bne __9e7d         ; $9e75: d0 06     
            lda $68,x          ; $9e77: b5 68     
            cmp #$03           ; $9e79: c9 03     
            beq __9ea0         ; $9e7b: f0 23     
__9e7d:     inx                ; $9e7d: e8        
            cpx #$0a           ; $9e7e: e0 0a     
            bne __9e71         ; $9e80: d0 ef     
            rts                ; $9e82: 60        

;-------------------------------------------------------------------------------
__9e83:     ldx #$05           ; $9e83: a2 05     
            lda $7e,x          ; $9e85: b5 7e     
            cmp #$05           ; $9e87: c9 05     
            bcs __9e8c         ; $9e89: b0 01     
            rts                ; $9e8b: 60        

;-------------------------------------------------------------------------------
__9e8c:     ldx #$00           ; $9e8c: a2 00     
__9e8e:     lda $5e,x          ; $9e8e: b5 5e     
            cmp #$01           ; $9e90: c9 01     
            bne __9e9a         ; $9e92: d0 06     
            lda $68,x          ; $9e94: b5 68     
            cmp #$05           ; $9e96: c9 05     
            beq __9ea0         ; $9e98: f0 06     
__9e9a:     inx                ; $9e9a: e8        
            cmp #$0a           ; $9e9b: c9 0a     
            bne __9e8e         ; $9e9d: d0 ef     
            rts                ; $9e9f: 60        

;-------------------------------------------------------------------------------
__9ea0:     lda #$40           ; $9ea0: a9 40     
            sta $5e,x          ; $9ea2: 95 5e     
            dec $68,x          ; $9ea4: d6 68     
            txa                ; $9ea6: 8a        
            clc                ; $9ea7: 18        
            adc #$03           ; $9ea8: 69 03     
            asl                ; $9eaa: 0a        
            asl                ; $9eab: 0a        
            asl                ; $9eac: 0a        
            asl                ; $9ead: 0a        
            tay                ; $9eae: a8        
            lda $0200,y        ; $9eaf: b9 00 02  
            sta $01            ; $9eb2: 85 01     
            lda $0203,y        ; $9eb4: b9 03 02  
            sta $00            ; $9eb7: 85 00     
            lda __81eb         ; $9eb9: ad eb 81  
            ldy #$00           ; $9ebc: a0 00     
__9ebe:     cmp $00            ; $9ebe: c5 00     
            bcs __9ec9         ; $9ec0: b0 07     
            clc                ; $9ec2: 18        
            adc #$18           ; $9ec3: 69 18     
            iny                ; $9ec5: c8        
            jmp __9ebe         ; $9ec6: 4c be 9e  

;-------------------------------------------------------------------------------
__9ec9:     tya                ; $9ec9: 98        
            asl                ; $9eca: 0a        
            clc                ; $9ecb: 18        
            adc #$15           ; $9ecc: 69 15     
            clc                ; $9ece: 18        
            adc $01            ; $9ecf: 65 01     
            sta $c0            ; $9ed1: 85 c0     
            rts                ; $9ed3: 60        

;-------------------------------------------------------------------------------
__9ed4:     ldx $5d            ; $9ed4: a6 5d     
            lda $68,x          ; $9ed6: b5 68     
            cmp #$01           ; $9ed8: c9 01     
            bne __9ef4         ; $9eda: d0 18     
            jsr __aee6         ; $9edc: 20 e6 ae  
            lda $0203,x        ; $9edf: bd 03 02  
            cmp #$30           ; $9ee2: c9 30     
            bcs __9ef4         ; $9ee4: b0 0e     
            lda #$23           ; $9ee6: a9 23     
            sta $0202,x        ; $9ee8: 9d 02 02  
            sta $0206,x        ; $9eeb: 9d 06 02  
            sta $020a,x        ; $9eee: 9d 0a 02  
            sta $020e,x        ; $9ef1: 9d 0e 02  
__9ef4:     rts                ; $9ef4: 60        

;-------------------------------------------------------------------------------
__9ef5:     sta $0a            ; $9ef5: 85 0a     
            sta $0b            ; $9ef7: 85 0b     
__9ef9:     ldx $5d            ; $9ef9: a6 5d     
            inc $8a,x          ; $9efb: f6 8a     
            lda $8a,x          ; $9efd: b5 8a     
            bmi __9f08         ; $9eff: 30 07     
            cmp #$10           ; $9f01: c9 10     
            bcs __9f08         ; $9f03: b0 03     
            jmp __9f0c         ; $9f05: 4c 0c 9f  

;-------------------------------------------------------------------------------
__9f08:     lda #$00           ; $9f08: a9 00     
            sta $8a,x          ; $9f0a: 95 8a     
__9f0c:     cmp #$08           ; $9f0c: c9 08     
            bcs __9f19         ; $9f0e: b0 09     
            tax                ; $9f10: aa        
            lda __81bc,x       ; $9f11: bd bc 81  
            and $0a            ; $9f14: 25 0a     
            jmp __9f22         ; $9f16: 4c 22 9f  

;-------------------------------------------------------------------------------
__9f19:     sec                ; $9f19: 38        
            sbc #$08           ; $9f1a: e9 08     
            tax                ; $9f1c: aa        
            lda __81bc,x       ; $9f1d: bd bc 81  
            and $0b            ; $9f20: 25 0b     
__9f22:     beq __9f26         ; $9f22: f0 02     
            lda #$01           ; $9f24: a9 01     
__9f26:     rts                ; $9f26: 60        

;-------------------------------------------------------------------------------
__9f27:     sta $0a            ; $9f27: 85 0a     
            lda $53            ; $9f29: a5 53     
            sec                ; $9f2b: 38        
            sbc #$01           ; $9f2c: e9 01     
            asl                ; $9f2e: 0a        
            tax                ; $9f2f: aa        
            lda __8493,x       ; $9f30: bd 93 84  
            sta $08            ; $9f33: 85 08     
            lda __8494,x       ; $9f35: bd 94 84  
            sta $09            ; $9f38: 85 09     
            ldy #$00           ; $9f3a: a0 00     
            lda #$01           ; $9f3c: a9 01     
            sta $0b            ; $9f3e: 85 0b     
__9f40:     lda ($08),y        ; $9f40: b1 08     
            cmp #$ff           ; $9f42: c9 ff     
            beq __9f52         ; $9f44: f0 0c     
            cmp $0a            ; $9f46: c5 0a     
            beq __9f56         ; $9f48: f0 0c     
            bcc __9f56         ; $9f4a: 90 0a     
            inc $0b            ; $9f4c: e6 0b     
            iny                ; $9f4e: c8        
            jmp __9f40         ; $9f4f: 4c 40 9f  

;-------------------------------------------------------------------------------
__9f52:     lda #$07           ; $9f52: a9 07     
            sta $0b            ; $9f54: 85 0b     
__9f56:     lda $0b            ; $9f56: a5 0b     
            rts                ; $9f58: 60        

;-------------------------------------------------------------------------------
__9f59:     ldx $5d            ; $9f59: a6 5d     
            lda $5e,x          ; $9f5b: b5 5e     
            cmp #$01           ; $9f5d: c9 01     
            bne __9f68         ; $9f5f: d0 07     
            lda $7d            ; $9f61: a5 7d     
            bne __9f68         ; $9f63: d0 03     
            lda #$01           ; $9f65: a9 01     
            rts                ; $9f67: 60        

;-------------------------------------------------------------------------------
__9f68:     lda #$00           ; $9f68: a9 00     
            rts                ; $9f6a: 60        

;-------------------------------------------------------------------------------
__9f6b:     sta $0c            ; $9f6b: 85 0c     
            ldx $5d            ; $9f6d: a6 5d     
            lda $68,x          ; $9f6f: b5 68     
            cmp #$01           ; $9f71: c9 01     
            beq __9f8a         ; $9f73: f0 15     
            cmp #$06           ; $9f75: c9 06     
            beq __9f8a         ; $9f77: f0 11     
            ldx #$00           ; $9f79: a2 00     
__9f7b:     lda __81c4,x       ; $9f7b: bd c4 81  
            cmp $0c            ; $9f7e: c5 0c     
            beq __9f9b         ; $9f80: f0 19     
            inx                ; $9f82: e8        
            cpx #$09           ; $9f83: e0 09     
            beq __9f9e         ; $9f85: f0 17     
            jmp __9f7b         ; $9f87: 4c 7b 9f  

;-------------------------------------------------------------------------------
__9f8a:     ldx #$04           ; $9f8a: a2 04     
__9f8c:     lda __81c4,x       ; $9f8c: bd c4 81  
            cmp $0c            ; $9f8f: c5 0c     
            beq __9f9b         ; $9f91: f0 08     
            inx                ; $9f93: e8        
            cpx #$09           ; $9f94: e0 09     
            beq __9f9e         ; $9f96: f0 06     
            jmp __9f8c         ; $9f98: 4c 8c 9f  

;-------------------------------------------------------------------------------
__9f9b:     lda #$00           ; $9f9b: a9 00     
            rts                ; $9f9d: 60        

;-------------------------------------------------------------------------------
__9f9e:     .hex a9            ; $9f9e: a9        Suspected data
__9f9f:     ora ($60,x)        ; $9f9f: 01 60     
__9fa1:     sta $0c            ; $9fa1: 85 0c     
            ldx $5d            ; $9fa3: a6 5d     
            lda $68,x          ; $9fa5: b5 68     
            and #$01           ; $9fa7: 29 01     
            beq __9fb0         ; $9fa9: f0 05     
            ldx #$00           ; $9fab: a2 00     
            jmp __9fb2         ; $9fad: 4c b2 9f  

;-------------------------------------------------------------------------------
__9fb0:     ldx #$01           ; $9fb0: a2 01     
__9fb2:     lda __81cd,x       ; $9fb2: bd cd 81  
            cmp $0c            ; $9fb5: c5 0c     
            beq __9fbc         ; $9fb7: f0 03     
            lda #$00           ; $9fb9: a9 00     
            rts                ; $9fbb: 60        

;-------------------------------------------------------------------------------
__9fbc:     lda #$01           ; $9fbc: a9 01     
            rts                ; $9fbe: 60        

;-------------------------------------------------------------------------------
__9fbf:     sta $0c            ; $9fbf: 85 0c     
            ldx $5d            ; $9fc1: a6 5d     
            lda $68,x          ; $9fc3: b5 68     
            cmp #$02           ; $9fc5: c9 02     
            beq __9fdc         ; $9fc7: f0 13     
            cmp #$03           ; $9fc9: c9 03     
            beq __9fdc         ; $9fcb: f0 0f     
            cmp #$04           ; $9fcd: c9 04     
            beq __9fe2         ; $9fcf: f0 11     
            cmp #$05           ; $9fd1: c9 05     
            beq __9fee         ; $9fd3: f0 19     
            cmp #$06           ; $9fd5: c9 06     
            beq __9ffa         ; $9fd7: f0 21     
            jmp __9ffd         ; $9fd9: 4c fd 9f  

;-------------------------------------------------------------------------------
__9fdc:     jsr __a002         ; $9fdc: 20 02 a0  
            jmp __9ffd         ; $9fdf: 4c fd 9f  

;-------------------------------------------------------------------------------
__9fe2:     jsr __a002         ; $9fe2: 20 02 a0  
            ldy #$89           ; $9fe5: a0 89     
            cmp #$c4           ; $9fe7: c9 c4     
            beq __a01a         ; $9fe9: f0 2f     
            jmp __9ffd         ; $9feb: 4c fd 9f  

;-------------------------------------------------------------------------------
__9fee:     jsr __a002         ; $9fee: 20 02 a0  
            ldy #$71           ; $9ff1: a0 71     
            cmp #$b4           ; $9ff3: c9 b4     
            beq __a01a         ; $9ff5: f0 23     
            jmp __9ffd         ; $9ff7: 4c fd 9f  

;-------------------------------------------------------------------------------
__9ffa:     jsr __a002         ; $9ffa: 20 02 a0  
__9ffd:     lda #$00           ; $9ffd: a9 00     
            .hex 4c            ; $9fff: 4c        Suspected data
__a000:     .hex 20 a0         ; $a000: 20 a0     Suspected data
__a002:     tax                ; $a002: aa        
            dex                ; $a003: ca        
            dex                ; $a004: ca        
            lda $0c            ; $a005: a5 0c     
            ldy __8172,x       ; $a007: bc 72 81  
            cmp __8177,x       ; $a00a: dd 77 81  
            beq __a018         ; $a00d: f0 09     
            ldy __817c,x       ; $a00f: bc 7c 81  
            cmp __8181,x       ; $a012: dd 81 81  
            beq __a018         ; $a015: f0 01     
            rts                ; $a017: 60        

;-------------------------------------------------------------------------------
__a018:     pla                ; $a018: 68        
            pla                ; $a019: 68        
__a01a:     ldx $5d            ; $a01a: a6 5d     
            sty $a3,x          ; $a01c: 94 a3     
            lda #$01           ; $a01e: a9 01     
            sta $0c            ; $a020: 85 0c     
            rts                ; $a022: 60        

;-------------------------------------------------------------------------------
__a023:     sta $0b            ; $a023: 85 0b     
            ldy #$00           ; $a025: a0 00     
__a027:     lda ($08),y        ; $a027: b1 08     
            cmp #$fe           ; $a029: c9 fe     
            beq __a03a         ; $a02b: f0 0d     
            cmp $0b            ; $a02d: c5 0b     
            beq __a035         ; $a02f: f0 04     
            iny                ; $a031: c8        
            jmp __a027         ; $a032: 4c 27 a0  

;-------------------------------------------------------------------------------
__a035:     lda #$01           ; $a035: a9 01     
            jmp __a03c         ; $a037: 4c 3c a0  

;-------------------------------------------------------------------------------
__a03a:     lda #$00           ; $a03a: a9 00     
__a03c:     sta $0c            ; $a03c: 85 0c     
            sty $0a            ; $a03e: 84 0a     
            rts                ; $a040: 60        

;-------------------------------------------------------------------------------
__a041:     ldx $5d            ; $a041: a6 5d     
            lda $68,x          ; $a043: b5 68     
            sec                ; $a045: 38        
            sbc $59            ; $a046: e5 59     
            beq __a04f         ; $a048: f0 05     
            bmi __a04f         ; $a04a: 30 03     
            jmp __a052         ; $a04c: 4c 52 a0  

;-------------------------------------------------------------------------------
__a04f:     lda #$01           ; $a04f: a9 01     
            rts                ; $a051: 60        

;-------------------------------------------------------------------------------
__a052:     lda #$00           ; $a052: a9 00     
            rts                ; $a054: 60        

;-------------------------------------------------------------------------------
            ldx #$00           ; $a055: a2 00     
            ldy #$20           ; $a057: a0 20     
__a059:     lda $0200,y        ; $a059: b9 00 02  
            cmp #$ff           ; $a05c: c9 ff     
            beq __a068         ; $a05e: f0 08     
            jsr __9f27         ; $a060: 20 27 9f  
            sta $68,x          ; $a063: 95 68     
            jmp __a06c         ; $a065: 4c 6c a0  

;-------------------------------------------------------------------------------
__a068:     lda #$00           ; $a068: a9 00     
            sta $68,x          ; $a06a: 95 68     
__a06c:     tya                ; $a06c: 98        
            clc                ; $a06d: 18        
            adc #$10           ; $a06e: 69 10     
            tay                ; $a070: a8        
            inx                ; $a071: e8        
            cpx #$0a           ; $a072: e0 0a     
            bne __a059         ; $a074: d0 e3     
            rts                ; $a076: 60        

;-------------------------------------------------------------------------------
__a077:     lda #$00           ; $a077: a9 00     
            ldy #$06           ; $a079: a0 06     
__a07b:     sta $007e,y        ; $a07b: 99 7e 00  
            dey                ; $a07e: 88        
            bpl __a07b         ; $a07f: 10 fa     
            ldy #$00           ; $a081: a0 00     
__a083:     lda $0068,y        ; $a083: b9 68 00  
            beq __a090         ; $a086: f0 08     
            tax                ; $a088: aa        
            lda $7e,x          ; $a089: b5 7e     
            clc                ; $a08b: 18        
            adc #$01           ; $a08c: 69 01     
            sta $7e,x          ; $a08e: 95 7e     
__a090:     cpy #$09           ; $a090: c0 09     
            beq __a098         ; $a092: f0 04     
            iny                ; $a094: c8        
            jmp __a083         ; $a095: 4c 83 a0  

;-------------------------------------------------------------------------------
__a098:     ldx $59            ; $a098: a6 59     
            cpx #$07           ; $a09a: e0 07     
            beq __a0aa         ; $a09c: f0 0c     
            inc $7e,x          ; $a09e: f6 7e     
            lda $96            ; $a0a0: a5 96     
            cmp #$0a           ; $a0a2: c9 0a     
            bne __a0aa         ; $a0a4: d0 04     
            ldx $59            ; $a0a6: a6 59     
            inc $7e,x          ; $a0a8: f6 7e     
__a0aa:     rts                ; $a0aa: 60        

;-------------------------------------------------------------------------------
__a0ab:     lda $ad            ; $a0ab: a5 ad     
            bne __a0b0         ; $a0ad: d0 01     
            rts                ; $a0af: 60        

;-------------------------------------------------------------------------------
__a0b0:     cmp #$01           ; $a0b0: c9 01     
            bne __a0d0         ; $a0b2: d0 1c     
            lda #$20           ; $a0b4: a9 20     
            sta $00            ; $a0b6: 85 00     
            lda #$c0           ; $a0b8: a9 c0     
            sta $01            ; $a0ba: 85 01     
            lda #$fc           ; $a0bc: a9 fc     
            sta $02            ; $a0be: 85 02     
            lda #$12           ; $a0c0: a9 12     
            sta $03            ; $a0c2: 85 03     
            lda #$e0           ; $a0c4: a9 e0     
            jsr __af91         ; $a0c6: 20 91 af  
            lda #$02           ; $a0c9: a9 02     
            sta $ad            ; $a0cb: 85 ad     
            jmp __a0f1         ; $a0cd: 4c f1 a0  

;-------------------------------------------------------------------------------
__a0d0:     lda $38            ; $a0d0: a5 38     
            bne __a0f5         ; $a0d2: d0 21     
            lda #$03           ; $a0d4: a9 03     
            sta $ad            ; $a0d6: 85 ad     
            ldx #$e1           ; $a0d8: a2 e1     
            lda $0200,x        ; $a0da: bd 00 02  
            cmp #$fc           ; $a0dd: c9 fc     
            beq __a0e6         ; $a0df: f0 05     
            lda #$fc           ; $a0e1: a9 fc     
            jmp __a0e8         ; $a0e3: 4c e8 a0  

;-------------------------------------------------------------------------------
__a0e6:     lda #$fe           ; $a0e6: a9 fe     
__a0e8:     sta $0200,x        ; $a0e8: 9d 00 02  
            clc                ; $a0eb: 18        
            adc #$01           ; $a0ec: 69 01     
            sta $0204,x        ; $a0ee: 9d 04 02  
__a0f1:     lda #$10           ; $a0f1: a9 10     
            sta $38            ; $a0f3: 85 38     
__a0f5:     rts                ; $a0f5: 60        

;-------------------------------------------------------------------------------
__a0f6:     lda #$00           ; $a0f6: a9 00     
            sta $ae            ; $a0f8: 85 ae     
__a0fa:     jsr __aeee         ; $a0fa: 20 ee ae  
            lda $0200,x        ; $a0fd: bd 00 02  
            cmp #$ff           ; $a100: c9 ff     
            bne __a136         ; $a102: d0 32     
            lda $53            ; $a104: a5 53     
            cmp #$01           ; $a106: c9 01     
            beq __a111         ; $a108: f0 07     
            cmp #$04           ; $a10a: c9 04     
            beq __a124         ; $a10c: f0 16     
            jmp __a136         ; $a10e: 4c 36 a1  

;-------------------------------------------------------------------------------
__a111:     lda $40            ; $a111: a5 40     
            bne __a139         ; $a113: d0 24     
            lda $ad            ; $a115: a5 ad     
            beq __a139         ; $a117: f0 20     
            cmp #$02           ; $a119: c9 02     
            bne __a139         ; $a11b: d0 1c     
            lda #$19           ; $a11d: a9 19     
            sta $40            ; $a11f: 85 40     
            jmp __a130         ; $a121: 4c 30 a1  

;-------------------------------------------------------------------------------
__a124:     lda $40            ; $a124: a5 40     
            bne __a139         ; $a126: d0 11     
            jsr __aa08         ; $a128: 20 08 aa  
            lda __8466,x       ; $a12b: bd 66 84  
            sta $40            ; $a12e: 85 40     
__a130:     lda #$06           ; $a130: a9 06     
            ldx $ae            ; $a132: a6 ae     
            sta $af,x          ; $a134: 95 af     
__a136:     jsr __a161         ; $a136: 20 61 a1  
__a139:     ldx $53            ; $a139: a6 53     
            dex                ; $a13b: ca        
            inc $ae            ; $a13c: e6 ae     
            lda $ae            ; $a13e: a5 ae     
            cmp __81f6,x       ; $a140: dd f6 81  
            beq __a148         ; $a143: f0 03     
            jmp __a0fa         ; $a145: 4c fa a0  

;-------------------------------------------------------------------------------
__a148:     lda $53            ; $a148: a5 53     
            cmp #$03           ; $a14a: c9 03     
            beq __a160         ; $a14c: f0 12     
            lda $3b            ; $a14e: a5 3b     
            bne __a160         ; $a150: d0 0e     
            lda #$00           ; $a152: a9 00     
            sta $d2            ; $a154: 85 d2     
            sta $d3            ; $a156: 85 d3     
            sta $d4            ; $a158: 85 d4     
            sta $d5            ; $a15a: 85 d5     
            lda #$bc           ; $a15c: a9 bc     
            sta $3b            ; $a15e: 85 3b     
__a160:     rts                ; $a160: 60        

;-------------------------------------------------------------------------------
__a161:     ldx $ae            ; $a161: a6 ae     
            lda $af,x          ; $a163: b5 af     
__a165:     and #$0f           ; $a165: 29 0f     
            beq __a1a3         ; $a167: f0 3a     
            cmp #$06           ; $a169: c9 06     
            beq __a1a0         ; $a16b: f0 33     
            cmp #$08           ; $a16d: c9 08     
            beq __a1a0         ; $a16f: f0 2f     
            cmp #$01           ; $a171: c9 01     
            beq __a1a6         ; $a173: f0 31     
            cmp #$02           ; $a175: c9 02     
            beq __a1ab         ; $a177: f0 32     
            cmp #$03           ; $a179: c9 03     
            beq __a1b2         ; $a17b: f0 35     
            lda $53            ; $a17d: a5 53     
            cmp #$03           ; $a17f: c9 03     
            beq __a189         ; $a181: f0 06     
            jsr __a1c7         ; $a183: 20 c7 a1  
            jmp __a191         ; $a186: 4c 91 a1  

;-------------------------------------------------------------------------------
__a189:     lda $19,x          ; $a189: b5 19     
            and #$03           ; $a18b: 29 03     
            ldx $ae            ; $a18d: a6 ae     
            sta $af,x          ; $a18f: 95 af     
__a191:     lda $af,x          ; $a191: b5 af     
            cmp #$01           ; $a193: c9 01     
            beq __a19b         ; $a195: f0 04     
            cmp #$02           ; $a197: c9 02     
            bne __a19d         ; $a199: d0 02     
__a19b:     sta $b3,x          ; $a19b: 95 b3     
__a19d:     jmp __a165         ; $a19d: 4c 65 a1  

;-------------------------------------------------------------------------------
__a1a0:     jmp __a449         ; $a1a0: 4c 49 a4  

;-------------------------------------------------------------------------------
__a1a3:     jmp __a20a         ; $a1a3: 4c 0a a2  

;-------------------------------------------------------------------------------
__a1a6:     lda #$00           ; $a1a6: a9 00     
            jmp __a1ad         ; $a1a8: 4c ad a1  

;-------------------------------------------------------------------------------
__a1ab:     lda #$01           ; $a1ab: a9 01     
__a1ad:     sta $99            ; $a1ad: 85 99     
            jmp __a279         ; $a1af: 4c 79 a2  

;-------------------------------------------------------------------------------
__a1b2:     lda $53            ; $a1b2: a5 53     
            cmp #$01           ; $a1b4: c9 01     
            bne __a1c4         ; $a1b6: d0 0c     
            jsr __a537         ; $a1b8: 20 37 a5  
            ldx $ae            ; $a1bb: a6 ae     
            lda $af,x          ; $a1bd: b5 af     
            bne __a1c4         ; $a1bf: d0 03     
            jmp __a1a3         ; $a1c1: 4c a3 a1  

;-------------------------------------------------------------------------------
__a1c4:     jmp __a32c         ; $a1c4: 4c 2c a3  

;-------------------------------------------------------------------------------
__a1c7:     ldx $ae            ; $a1c7: a6 ae     
            lda $d2,x          ; $a1c9: b5 d2     
            bne __a1ee         ; $a1cb: d0 21     
            lda #$01           ; $a1cd: a9 01     
            sta $d2,x          ; $a1cf: 95 d2     
            lda $ae            ; $a1d1: a5 ae     
            clc                ; $a1d3: 18        
            adc #$01           ; $a1d4: 69 01     
            asl                ; $a1d6: 0a        
            asl                ; $a1d7: 0a        
            asl                ; $a1d8: 0a        
            asl                ; $a1d9: 0a        
            tay                ; $a1da: a8        
            lda $0203,y        ; $a1db: b9 03 02  
            cmp $0203          ; $a1de: cd 03 02  
            bcs __a1ea         ; $a1e1: b0 07     
            lda #$01           ; $a1e3: a9 01     
            sta $ec,x          ; $a1e5: 95 ec     
            jmp __a1ee         ; $a1e7: 4c ee a1  

;-------------------------------------------------------------------------------
__a1ea:     lda #$02           ; $a1ea: a9 02     
            sta $ec,x          ; $a1ec: 95 ec     
__a1ee:     lda $19,x          ; $a1ee: b5 19     
            and #$07           ; $a1f0: 29 07     
            sta $af,x          ; $a1f2: 95 af     
            tay                ; $a1f4: a8        
            cmp #$04           ; $a1f5: c9 04     
            bcs __a1fc         ; $a1f7: b0 03     
            jmp __a207         ; $a1f9: 4c 07 a2  

;-------------------------------------------------------------------------------
__a1fc:     ldy $ec,x          ; $a1fc: b4 ec     
            cmp #$07           ; $a1fe: c9 07     
            bcs __a205         ; $a200: b0 03     
            jmp __a207         ; $a202: 4c 07 a2  

;-------------------------------------------------------------------------------
__a205:     ldy #$03           ; $a205: a0 03     
__a207:     sty $af,x          ; $a207: 94 af     
            rts                ; $a209: 60        

;-------------------------------------------------------------------------------
__a20a:     lda #$55           ; $a20a: a9 55     
            sta $0a            ; $a20c: 85 0a     
            sta $0b            ; $a20e: 85 0b     
            jsr __a717         ; $a210: 20 17 a7  
            bne __a216         ; $a213: d0 01     
            rts                ; $a215: 60        

;-------------------------------------------------------------------------------
__a216:     jsr __aeee         ; $a216: 20 ee ae  
            stx $04            ; $a219: 86 04     
            jsr __a9fd         ; $a21b: 20 fd a9  
            ldx $ae            ; $a21e: a6 ae     
            lda $af,x          ; $a220: b5 af     
            cmp #$20           ; $a222: c9 20     
            bne __a22b         ; $a224: d0 05     
            lda #$ff           ; $a226: a9 ff     
            sta $af,x          ; $a228: 95 af     
            rts                ; $a22a: 60        

;-------------------------------------------------------------------------------
__a22b:     cmp #$10           ; $a22b: c9 10     
            beq __a234         ; $a22d: f0 05     
            dec $01            ; $a22f: c6 01     
            jmp __a236         ; $a231: 4c 36 a2  

;-------------------------------------------------------------------------------
__a234:     inc $01            ; $a234: e6 01     
__a236:     lda $04            ; $a236: a5 04     
            tay                ; $a238: a8        
            iny                ; $a239: c8        
            lda $0200,y        ; $a23a: b9 00 02  
            ldx $53            ; $a23d: a6 53     
            cpx #$04           ; $a23f: e0 04     
            beq __a251         ; $a241: f0 0e     
            cmp #$9c           ; $a243: c9 9c     
            beq __a24c         ; $a245: f0 05     
            lda #$9c           ; $a247: a9 9c     
            jmp __a25c         ; $a249: 4c 5c a2  

;-------------------------------------------------------------------------------
__a24c:     lda #$98           ; $a24c: a9 98     
            jmp __a25c         ; $a24e: 4c 5c a2  

;-------------------------------------------------------------------------------
__a251:     cmp #$ac           ; $a251: c9 ac     
            beq __a25a         ; $a253: f0 05     
            lda #$ac           ; $a255: a9 ac     
            jmp __a25c         ; $a257: 4c 5c a2  

;-------------------------------------------------------------------------------
__a25a:     lda #$a8           ; $a25a: a9 a8     
__a25c:     jsr __a9e5         ; $a25c: 20 e5 a9  
            ldx $ae            ; $a25f: a6 ae     
            lda $b3,x          ; $a261: b5 b3     
            lsr                ; $a263: 4a        
            jsr __afa7         ; $a264: 20 a7 af  
            ldx $ae            ; $a267: a6 ae     
            lda $af,x          ; $a269: b5 af     
            cmp #$10           ; $a26b: c9 10     
            beq __a274         ; $a26d: f0 05     
            lda #$10           ; $a26f: a9 10     
            jmp __a276         ; $a271: 4c 76 a2  

;-------------------------------------------------------------------------------
__a274:     lda #$20           ; $a274: a9 20     
__a276:     sta $af,x          ; $a276: 95 af     
            rts                ; $a278: 60        

;-------------------------------------------------------------------------------
__a279:     lda #$55           ; $a279: a9 55     
            sta $0a            ; $a27b: 85 0a     
            sta $0b            ; $a27d: 85 0b     
            jsr __a717         ; $a27f: 20 17 a7  
            bne __a285         ; $a282: d0 01     
            rts                ; $a284: 60        

;-------------------------------------------------------------------------------
__a285:     jsr __aeee         ; $a285: 20 ee ae  
            stx $04            ; $a288: 86 04     
            jsr __a9fd         ; $a28a: 20 fd a9  
            lda $99            ; $a28d: a5 99     
            bne __a296         ; $a28f: d0 05     
            inc $00            ; $a291: e6 00     
            jmp __a298         ; $a293: 4c 98 a2  

;-------------------------------------------------------------------------------
__a296:     dec $00            ; $a296: c6 00     
__a298:     lda $00            ; $a298: a5 00     
            and #$0f           ; $a29a: 29 0f     
            cmp #$04           ; $a29c: c9 04     
            beq __a2a7         ; $a29e: f0 07     
            cmp #$0c           ; $a2a0: c9 0c     
            beq __a2a7         ; $a2a2: f0 03     
            jmp __a2ac         ; $a2a4: 4c ac a2  

;-------------------------------------------------------------------------------
__a2a7:     inc $01            ; $a2a7: e6 01     
            jmp __a2c0         ; $a2a9: 4c c0 a2  

;-------------------------------------------------------------------------------
__a2ac:     ldx $99            ; $a2ac: a6 99     
            cmp __83e2,x       ; $a2ae: dd e2 83  
            beq __a2bb         ; $a2b1: f0 08     
            cmp __83e4,x       ; $a2b3: dd e4 83  
            beq __a2bb         ; $a2b6: f0 03     
            jmp __a2c0         ; $a2b8: 4c c0 a2  

;-------------------------------------------------------------------------------
__a2bb:     dec $01            ; $a2bb: c6 01     
            jmp __a2d1         ; $a2bd: 4c d1 a2  

;-------------------------------------------------------------------------------
__a2c0:     cmp #$04           ; $a2c0: c9 04     
            beq __a2cb         ; $a2c2: f0 07     
            cmp #$0c           ; $a2c4: c9 0c     
            beq __a2cb         ; $a2c6: f0 03     
            jmp __a2d1         ; $a2c8: 4c d1 a2  

;-------------------------------------------------------------------------------
__a2cb:     ldx $ae            ; $a2cb: a6 ae     
            lda #$ff           ; $a2cd: a9 ff     
            sta $af,x          ; $a2cf: 95 af     
__a2d1:     ldy $99            ; $a2d1: a4 99     
            jsr __a5b6         ; $a2d3: 20 b6 a5  
            bne __a2df         ; $a2d6: d0 07     
            lda #$00           ; $a2d8: a9 00     
            ldx $ae            ; $a2da: a6 ae     
            sta $af,x          ; $a2dc: 95 af     
            rts                ; $a2de: 60        

;-------------------------------------------------------------------------------
__a2df:     lda $99            ; $a2df: a5 99     
            beq __a2fe         ; $a2e1: f0 1b     
            lda $00            ; $a2e3: a5 00     
            cmp #$0c           ; $a2e5: c9 0c     
            beq __a2ee         ; $a2e7: f0 05     
            bcc __a2f7         ; $a2e9: 90 0c     
            jmp __a2fe         ; $a2eb: 4c fe a2  

;-------------------------------------------------------------------------------
__a2ee:     lda #$00           ; $a2ee: a9 00     
            ldx $ae            ; $a2f0: a6 ae     
            sta $af,x          ; $a2f2: 95 af     
            jmp __a2fe         ; $a2f4: 4c fe a2  

;-------------------------------------------------------------------------------
__a2f7:     lda #$00           ; $a2f7: a9 00     
            ldx $ae            ; $a2f9: a6 ae     
            sta $af,x          ; $a2fb: 95 af     
            rts                ; $a2fd: 60        

;-------------------------------------------------------------------------------
__a2fe:     lda $04            ; $a2fe: a5 04     
            tay                ; $a300: a8        
            iny                ; $a301: c8        
            lda $0200,y        ; $a302: b9 00 02  
            ldx $53            ; $a305: a6 53     
            cpx #$04           ; $a307: e0 04     
            beq __a319         ; $a309: f0 0e     
            cmp #$9c           ; $a30b: c9 9c     
            bcs __a314         ; $a30d: b0 05     
            lda #$9c           ; $a30f: a9 9c     
            jmp __a324         ; $a311: 4c 24 a3  

;-------------------------------------------------------------------------------
__a314:     lda #$98           ; $a314: a9 98     
            jmp __a324         ; $a316: 4c 24 a3  

;-------------------------------------------------------------------------------
__a319:     cmp #$ac           ; $a319: c9 ac     
            bcs __a322         ; $a31b: b0 05     
            lda #$ac           ; $a31d: a9 ac     
            jmp __a324         ; $a31f: 4c 24 a3  

;-------------------------------------------------------------------------------
__a322:     lda #$a8           ; $a322: a9 a8     
__a324:     jsr __a9e5         ; $a324: 20 e5 a9  
            lda $99            ; $a327: a5 99     
            jmp __afa7         ; $a329: 4c a7 af  

;-------------------------------------------------------------------------------
__a32c:     ldx $ae            ; $a32c: a6 ae     
            lda $af,x          ; $a32e: b5 af     
            lsr                ; $a330: 4a        
            lsr                ; $a331: 4a        
            lsr                ; $a332: 4a        
            tax                ; $a333: aa        
            lda $53            ; $a334: a5 53     
            cmp #$04           ; $a336: c9 04     
            beq __a347         ; $a338: f0 0d     
__a33a:     lda __83f4,x       ; $a33a: bd f4 83  
            sta $0a            ; $a33d: 85 0a     
            lda __83f5,x       ; $a33f: bd f5 83  
            sta $0b            ; $a342: 85 0b     
            jmp __a35c         ; $a344: 4c 5c a3  

;-------------------------------------------------------------------------------
__a347:     lda $50            ; $a347: a5 50     
            and #$01           ; $a349: 29 01     
            clc                ; $a34b: 18        
            adc $54            ; $a34c: 65 54     
            cmp #$03           ; $a34e: c9 03     
            bcc __a33a         ; $a350: 90 e8     
            lda __83f8,x       ; $a352: bd f8 83  
            sta $0a            ; $a355: 85 0a     
            lda __83f9,x       ; $a357: bd f9 83  
            sta $0b            ; $a35a: 85 0b     
__a35c:     .hex 20            ; $a35c: 20        Suspected data
__a35d:     .hex 17 a7         ; $a35d: 17 a7     Invalid Opcode - SLO $a7,x
            bne __a362         ; $a35f: d0 01     
            rts                ; $a361: 60        

;-------------------------------------------------------------------------------
__a362:     jsr __aeee         ; $a362: 20 ee ae  
            stx $04            ; $a365: 86 04     
            jsr __a9fd         ; $a367: 20 fd a9  
            ldx $ae            ; $a36a: a6 ae     
            lda $e8,x          ; $a36c: b5 e8     
            beq __a37e         ; $a36e: f0 0e     
            cmp #$03           ; $a370: c9 03     
            beq __a377         ; $a372: f0 03     
            jmp __a37e         ; $a374: 4c 7e a3  

;-------------------------------------------------------------------------------
__a377:     lda #$00           ; $a377: a9 00     
            sta $e8,x          ; $a379: 95 e8     
            jmp __a38b         ; $a37b: 4c 8b a3  

;-------------------------------------------------------------------------------
__a37e:     lda $01            ; $a37e: a5 01     
            and #$03           ; $a380: 29 03     
            bne __a38b         ; $a382: d0 07     
            lda #$01           ; $a384: a9 01     
            inc $e8,x          ; $a386: f6 e8     
            jmp __a41d         ; $a388: 4c 1d a4  

;-------------------------------------------------------------------------------
__a38b:     lda $53            ; $a38b: a5 53     
            cmp #$01           ; $a38d: c9 01     
            beq __a3c6         ; $a38f: f0 35     
            jsr __a6b4         ; $a391: 20 b4 a6  
            cmp #$03           ; $a394: c9 03     
            beq __a39f         ; $a396: f0 07     
            cmp #$13           ; $a398: c9 13     
            beq __a3ac         ; $a39a: f0 10     
            jmp __a41d         ; $a39c: 4c 1d a4  

;-------------------------------------------------------------------------------
__a39f:     dec $01            ; $a39f: c6 01     
            lda $01            ; $a3a1: a5 01     
            ldx $ae            ; $a3a3: a6 ae     
            cmp $db,x          ; $a3a5: d5 db     
            beq __a3b9         ; $a3a7: f0 10     
            jmp __a41d         ; $a3a9: 4c 1d a4  

;-------------------------------------------------------------------------------
__a3ac:     inc $01            ; $a3ac: e6 01     
            lda $01            ; $a3ae: a5 01     
            ldx $ae            ; $a3b0: a6 ae     
            cmp $db,x          ; $a3b2: d5 db     
            beq __a3b9         ; $a3b4: f0 03     
            jmp __a41d         ; $a3b6: 4c 1d a4  

;-------------------------------------------------------------------------------
__a3b9:     lda #$01           ; $a3b9: a9 01     
            ldx $ae            ; $a3bb: a6 ae     
            sta $af,x          ; $a3bd: 95 af     
            lda #$00           ; $a3bf: a9 00     
            sta $db,x          ; $a3c1: 95 db     
            jmp __a41d         ; $a3c3: 4c 1d a4  

;-------------------------------------------------------------------------------
__a3c6:     .hex a6            ; $a3c6: a6        Suspected data
__a3c7:     ldx __afb5         ; $a3c7: ae b5 af  
            cmp #$13           ; $a3ca: c9 13     
            beq __a3d1         ; $a3cc: f0 03     
            jmp __a3e7         ; $a3ce: 4c e7 a3  

;-------------------------------------------------------------------------------
__a3d1:     inc $01            ; $a3d1: e6 01     
            lda $ae            ; $a3d3: a5 ae     
            asl                ; $a3d5: 0a        
            tax                ; $a3d6: aa        
            inx                ; $a3d7: e8        
            lda $b9,x          ; $a3d8: b5 b9     
            cmp $01            ; $a3da: c5 01     
            bne __a3e4         ; $a3dc: d0 06     
            lda #$01           ; $a3de: a9 01     
            ldx $ae            ; $a3e0: a6 ae     
            sta $af,x          ; $a3e2: 95 af     
__a3e4:     jmp __a41d         ; $a3e4: 4c 1d a4  

;-------------------------------------------------------------------------------
__a3e7:     dec $01            ; $a3e7: c6 01     
            ldx $ae            ; $a3e9: a6 ae     
            cpx #$00           ; $a3eb: e0 00     
            bne __a40a         ; $a3ed: d0 1b     
            ldx $ae            ; $a3ef: a6 ae     
            lda $e0,x          ; $a3f1: b5 e0     
            cmp #$02           ; $a3f3: c9 02     
            beq __a40a         ; $a3f5: f0 13     
            lda $ae            ; $a3f7: a5 ae     
            asl                ; $a3f9: 0a        
            tax                ; $a3fa: aa        
            lda $b9,x          ; $a3fb: b5 b9     
            cmp $01            ; $a3fd: c5 01     
            bne __a41d         ; $a3ff: d0 1c     
            lda #$02           ; $a401: a9 02     
            ldx $ae            ; $a403: a6 ae     
            sta $af,x          ; $a405: 95 af     
            jmp __a41d         ; $a407: 4c 1d a4  

;-------------------------------------------------------------------------------
__a40a:     lda $ae            ; $a40a: a5 ae     
            asl                ; $a40c: 0a        
            tax                ; $a40d: aa        
            lda $b9,x          ; $a40e: b5 b9     
            clc                ; $a410: 18        
            adc #$0d           ; $a411: 69 0d     
            cmp $01            ; $a413: c5 01     
            bne __a41d         ; $a415: d0 06     
            lda #$13           ; $a417: a9 13     
            ldx $ae            ; $a419: a6 ae     
            sta $af,x          ; $a41b: 95 af     
__a41d:     lda $04            ; $a41d: a5 04     
            tay                ; $a41f: a8        
            iny                ; $a420: c8        
            lda $0200,y        ; $a421: b9 00 02  
            ldx $53            ; $a424: a6 53     
            cpx #$04           ; $a426: e0 04     
            beq __a438         ; $a428: f0 0e     
            cmp #$9c           ; $a42a: c9 9c     
            bcs __a433         ; $a42c: b0 05     
            lda #$9c           ; $a42e: a9 9c     
            jmp __a443         ; $a430: 4c 43 a4  

;-------------------------------------------------------------------------------
__a433:     lda #$98           ; $a433: a9 98     
            jmp __a443         ; $a435: 4c 43 a4  

;-------------------------------------------------------------------------------
__a438:     cmp #$ac           ; $a438: c9 ac     
            bcs __a441         ; $a43a: b0 05     
            lda #$ac           ; $a43c: a9 ac     
            jmp __a443         ; $a43e: 4c 43 a4  

;-------------------------------------------------------------------------------
__a441:     lda #$a8           ; $a441: a9 a8     
__a443:     jsr __a9e5         ; $a443: 20 e5 a9  
            jmp __af99         ; $a446: 4c 99 af  

;-------------------------------------------------------------------------------
__a449:     ldx $ae            ; $a449: a6 ae     
            lda $af,x          ; $a44b: b5 af     
            cmp #$06           ; $a44d: c9 06     
            beq __a459         ; $a44f: f0 08     
            cmp #$08           ; $a451: c9 08     
            beq __a456         ; $a453: f0 01     
            rts                ; $a455: 60        

;-------------------------------------------------------------------------------
__a456:     jmp __a4b0         ; $a456: 4c b0 a4  

;-------------------------------------------------------------------------------
__a459:     lda $53            ; $a459: a5 53     
            cmp #$01           ; $a45b: c9 01     
            beq __a464         ; $a45d: f0 05     
            cmp #$04           ; $a45f: c9 04     
            beq __a475         ; $a461: f0 12     
            rts                ; $a463: 60        

;-------------------------------------------------------------------------------
__a464:     lda #$20           ; $a464: a9 20     
            sta $00            ; $a466: 85 00     
            lda #$b8           ; $a468: a9 b8     
            sta $01            ; $a46a: 85 01     
            ldx $ae            ; $a46c: a6 ae     
            lda #$08           ; $a46e: a9 08     
            sta $af,x          ; $a470: 95 af     
            jmp __a4a3         ; $a472: 4c a3 a4  

;-------------------------------------------------------------------------------
__a475:     lda $0203          ; $a475: ad 03 02  
            cmp #$78           ; $a478: c9 78     
            bcc __a481         ; $a47a: 90 05     
            ldy #$00           ; $a47c: a0 00     
            jmp __a483         ; $a47e: 4c 83 a4  

;-------------------------------------------------------------------------------
__a481:     ldy #$08           ; $a481: a0 08     
__a483:     sty $0c            ; $a483: 84 0c     
            lda $19            ; $a485: a5 19     
            and #$03           ; $a487: 29 03     
            asl                ; $a489: 0a        
            clc                ; $a48a: 18        
            adc $0c            ; $a48b: 65 0c     
__a48d:     tax                ; $a48d: aa        
            lda __83ce,x       ; $a48e: bd ce 83  
            sta $00            ; $a491: 85 00     
            lda __83cf,x       ; $a493: bd cf 83  
            sta $01            ; $a496: 85 01     
            ldx $ae            ; $a498: a6 ae     
            lda #$00           ; $a49a: a9 00     
            sta $af,x          ; $a49c: 95 af     
            lda #$a8           ; $a49e: a9 a8     
            jmp __a4a5         ; $a4a0: 4c a5 a4  

;-------------------------------------------------------------------------------
__a4a3:     lda #$98           ; $a4a3: a9 98     
__a4a5:     jsr __a9e5         ; $a4a5: 20 e5 a9  
            jsr __aeee         ; $a4a8: 20 ee ae  
            sta $04            ; $a4ab: 85 04     
            jmp __af93         ; $a4ad: 4c 93 af  

;-------------------------------------------------------------------------------
__a4b0:     jsr __aeee         ; $a4b0: 20 ee ae  
            stx $04            ; $a4b3: 86 04     
            jsr __a9fd         ; $a4b5: 20 fd a9  
            lda $0201,x        ; $a4b8: bd 01 02  
            jsr __a9e5         ; $a4bb: 20 e5 a9  
            lda $53            ; $a4be: a5 53     
            cmp #$01           ; $a4c0: c9 01     
            beq __a4c5         ; $a4c2: f0 01     
            rts                ; $a4c4: 60        

;-------------------------------------------------------------------------------
__a4c5:     inc $00            ; $a4c5: e6 00     
            lda $00            ; $a4c7: a5 00     
            cmp #$2c           ; $a4c9: c9 2c     
            beq __a4cf         ; $a4cb: f0 02     
            bcc __a4f6         ; $a4cd: 90 27     
__a4cf:     inc $01            ; $a4cf: e6 01     
            lda $01            ; $a4d1: a5 01     
            cmp #$c5           ; $a4d3: c9 c5     
            bne __a4f6         ; $a4d5: d0 1f     
            lda #$00           ; $a4d7: a9 00     
            ldx $ae            ; $a4d9: a6 ae     
            sta $af,x          ; $a4db: 95 af     
            dec $00            ; $a4dd: c6 00     
            lda $00            ; $a4df: a5 00     
            cmp #$68           ; $a4e1: c9 68     
            bcs __a4ea         ; $a4e3: b0 05     
            inc $01            ; $a4e5: e6 01     
            jmp __a4ec         ; $a4e7: 4c ec a4  

;-------------------------------------------------------------------------------
__a4ea:     dec $01            ; $a4ea: c6 01     
__a4ec:     cmp #$60           ; $a4ec: c9 60     
            bne __a4f6         ; $a4ee: d0 06     
            ldx $ae            ; $a4f0: a6 ae     
            lda #$00           ; $a4f2: a9 00     
            sta $af,x          ; $a4f4: 95 af     
__a4f6:     jmp __af93         ; $a4f6: 4c 93 af  

;-------------------------------------------------------------------------------
__a4f9:     sta $0c            ; $a4f9: 85 0c     
            ldx $ae            ; $a4fb: a6 ae     
            lda $e0,x          ; $a4fd: b5 e0     
            cmp #$01           ; $a4ff: c9 01     
            beq __a520         ; $a501: f0 1d     
            cmp #$06           ; $a503: c9 06     
            beq __a520         ; $a505: f0 19     
            ldx #$00           ; $a507: a2 00     
            lda #$18           ; $a509: a9 18     
__a50b:     cmp $0c            ; $a50b: c5 0c     
            beq __a51a         ; $a50d: f0 0b     
            inx                ; $a50f: e8        
            cpx #$09           ; $a510: e0 09     
            beq __a51d         ; $a512: f0 09     
            lda __81c4,x       ; $a514: bd c4 81  
            jmp __a50b         ; $a517: 4c 0b a5  

;-------------------------------------------------------------------------------
__a51a:     lda #$00           ; $a51a: a9 00     
            rts                ; $a51c: 60        

;-------------------------------------------------------------------------------
__a51d:     lda #$01           ; $a51d: a9 01     
            rts                ; $a51f: 60        

;-------------------------------------------------------------------------------
__a520:     ldx #$04           ; $a520: a2 04     
__a522:     lda __81c4,x       ; $a522: bd c4 81  
            cmp $0c            ; $a525: c5 0c     
            beq __a531         ; $a527: f0 08     
            inx                ; $a529: e8        
            cpx #$09           ; $a52a: e0 09     
            beq __a534         ; $a52c: f0 06     
            jmp __a522         ; $a52e: 4c 22 a5  

;-------------------------------------------------------------------------------
__a531:     lda #$00           ; $a531: a9 00     
            rts                ; $a533: 60        

;-------------------------------------------------------------------------------
__a534:     lda #$01           ; $a534: a9 01     
            rts                ; $a536: 60        

;-------------------------------------------------------------------------------
__a537:     ldx $ae            ; $a537: a6 ae     
            lda $af,x          ; $a539: b5 af     
            cmp #$13           ; $a53b: c9 13     
            bne __a540         ; $a53d: d0 01     
            rts                ; $a53f: 60        

;-------------------------------------------------------------------------------
__a540:     jsr __aeee         ; $a540: 20 ee ae  
            jsr __a9fd         ; $a543: 20 fd a9  
            ldx $ae            ; $a546: a6 ae     
            lda $e0,x          ; $a548: b5 e0     
            cmp #$01           ; $a54a: c9 01     
            beq __a551         ; $a54c: f0 03     
            jmp __a57e         ; $a54e: 4c 7e a5  

;-------------------------------------------------------------------------------
__a551:     lda $00            ; $a551: a5 00     
            cmp #$5c           ; $a553: c9 5c     
            beq __a55e         ; $a555: f0 07     
            cmp #$c4           ; $a557: c9 c4     
            beq __a56e         ; $a559: f0 13     
            jmp __a5af         ; $a55b: 4c af a5  

;-------------------------------------------------------------------------------
__a55e:     lda $ae            ; $a55e: a5 ae     
            asl                ; $a560: 0a        
            tax                ; $a561: aa        
            lda #$a6           ; $a562: a9 a6     
            sta $b9,x          ; $a564: 95 b9     
            inx                ; $a566: e8        
            lda #$c7           ; $a567: a9 c7     
            sta $b9,x          ; $a569: 95 b9     
            jmp __a5a8         ; $a56b: 4c a8 a5  

;-------------------------------------------------------------------------------
__a56e:     lda $ae            ; $a56e: a5 ae     
            asl                ; $a570: 0a        
            tax                ; $a571: aa        
            lda #$ab           ; $a572: a9 ab     
            sta $b9,x          ; $a574: 95 b9     
            inx                ; $a576: e8        
            lda #$c3           ; $a577: a9 c3     
            sta $b9,x          ; $a579: 95 b9     
            jmp __a5a8         ; $a57b: 4c a8 a5  

;-------------------------------------------------------------------------------
__a57e:     lda $00            ; $a57e: a5 00     
            cmp #$2c           ; $a580: c9 2c     
            beq __a58b         ; $a582: f0 07     
            cmp #$6c           ; $a584: c9 6c     
            beq __a59b         ; $a586: f0 13     
            jmp __a5af         ; $a588: 4c af a5  

;-------------------------------------------------------------------------------
__a58b:     lda $ae            ; $a58b: a5 ae     
            asl                ; $a58d: 0a        
            tax                ; $a58e: aa        
            lda #$8d           ; $a58f: a9 8d     
            sta $b9,x          ; $a591: 95 b9     
            inx                ; $a593: e8        
            lda #$a4           ; $a594: a9 a4     
            sta $b9,x          ; $a596: 95 b9     
            jmp __a5a8         ; $a598: 4c a8 a5  

;-------------------------------------------------------------------------------
__a59b:     lda $ae            ; $a59b: a5 ae     
            asl                ; $a59d: 0a        
            tax                ; $a59e: aa        
            lda #$8a           ; $a59f: a9 8a     
            sta $b9,x          ; $a5a1: 95 b9     
            inx                ; $a5a3: e8        
            lda #$a7           ; $a5a4: a9 a7     
            sta $b9,x          ; $a5a6: 95 b9     
__a5a8:     lda #$03           ; $a5a8: a9 03     
            ldx $ae            ; $a5aa: a6 ae     
            sta $af,x          ; $a5ac: 95 af     
            rts                ; $a5ae: 60        

;-------------------------------------------------------------------------------
__a5af:     lda #$00           ; $a5af: a9 00     
            ldx $ae            ; $a5b1: a6 ae     
            sta $af,x          ; $a5b3: 95 af     
            rts                ; $a5b5: 60        

;-------------------------------------------------------------------------------
__a5b6:     lda $01            ; $a5b6: a5 01     
            clc                ; $a5b8: 18        
            adc #$0b           ; $a5b9: 69 0b     
            jsr __9f27         ; $a5bb: 20 27 9f  
            ldy $99            ; $a5be: a4 99     
            ldx $ae            ; $a5c0: a6 ae     
            sta $e0,x          ; $a5c2: 95 e0     
            lda $53            ; $a5c4: a5 53     
            cmp #$01           ; $a5c6: c9 01     
            bne __a5cd         ; $a5c8: d0 03     
            jmp __a5d7         ; $a5ca: 4c d7 a5  

;-------------------------------------------------------------------------------
__a5cd:     cmp #$03           ; $a5cd: c9 03     
            bne __a5d4         ; $a5cf: d0 03     
            jmp __a613         ; $a5d1: 4c 13 a6  

;-------------------------------------------------------------------------------
__a5d4:     jmp __a64d         ; $a5d4: 4c 4d a6  

;-------------------------------------------------------------------------------
__a5d7:     lda $00            ; $a5d7: a5 00     
            jsr __a4f9         ; $a5d9: 20 f9 a4  
            bne __a5f4         ; $a5dc: d0 16     
            ldx $ae            ; $a5de: a6 ae     
            lda $e0,x          ; $a5e0: b5 e0     
            and #$01           ; $a5e2: 29 01     
            beq __a5ec         ; $a5e4: f0 06     
            lda __879a,y       ; $a5e6: b9 9a 87  
            jmp __a5ef         ; $a5e9: 4c ef a5  

;-------------------------------------------------------------------------------
__a5ec:     lda __879c,y       ; $a5ec: b9 9c 87  
__a5ef:     clc                ; $a5ef: 18        
            adc $01            ; $a5f0: 65 01     
            sta $01            ; $a5f2: 85 01     
__a5f4:     ldx $ae            ; $a5f4: a6 ae     
            lda $e0,x          ; $a5f6: b5 e0     
            cmp #$01           ; $a5f8: c9 01     
            beq __a604         ; $a5fa: f0 08     
            lda $00            ; $a5fc: a5 00     
            cmp __83e6,y       ; $a5fe: d9 e6 83  
            .hex f0            ; $a601: f0        Suspected data
__a602:     ora #$60           ; $a602: 09 60     
__a604:     lda $00            ; $a604: a5 00     
            cmp __83e8,y       ; $a606: d9 e8 83  
            beq __a60c         ; $a609: f0 01     
            rts                ; $a60b: 60        

;-------------------------------------------------------------------------------
__a60c:     lda #$00           ; $a60c: a9 00     
            ldx $ae            ; $a60e: a6 ae     
            sta $af,x          ; $a610: 95 af     
            rts                ; $a612: 60        

;-------------------------------------------------------------------------------
__a613:     ldx $ae            ; $a613: a6 ae     
            lda $e0,x          ; $a615: b5 e0     
            cmp #$02           ; $a617: c9 02     
            bne __a62a         ; $a619: d0 0f     
            lda $00            ; $a61b: a5 00     
            cmp __83ea,y       ; $a61d: d9 ea 83  
            beq __a646         ; $a620: f0 24     
            cmp __83ec,y       ; $a622: d9 ec 83  
            beq __a646         ; $a625: f0 1f     
            jmp __a63e         ; $a627: 4c 3e a6  

;-------------------------------------------------------------------------------
__a62a:     cpy #$01           ; $a62a: c0 01     
            bne __a632         ; $a62c: d0 04     
            cmp #$04           ; $a62e: c9 04     
            beq __a63f         ; $a630: f0 0d     
__a632:     lda $00            ; $a632: a5 00     
            cmp __83ee,y       ; $a634: d9 ee 83  
            beq __a646         ; $a637: f0 0d     
            cmp __83f0,y       ; $a639: d9 f0 83  
            beq __a646         ; $a63c: f0 08     
__a63e:     rts                ; $a63e: 60        

;-------------------------------------------------------------------------------
__a63f:     lda $00            ; $a63f: a5 00     
            cmp #$db           ; $a641: c9 db     
            beq __a646         ; $a643: f0 01     
            rts                ; $a645: 60        

;-------------------------------------------------------------------------------
__a646:     ldx $ae            ; $a646: a6 ae     
            lda #$00           ; $a648: a9 00     
            sta $af,x          ; $a64a: 95 af     
            rts                ; $a64c: 60        

;-------------------------------------------------------------------------------
__a64d:     ldx $ae            ; $a64d: a6 ae     
            lda $e0,x          ; $a64f: b5 e0     
            tay                ; $a651: a8        
            dey                ; $a652: 88        
            ldx $99            ; $a653: a6 99     
            lda __83f2,x       ; $a655: bd f2 83  
__a658:     cpy #$00           ; $a658: c0 00     
            beq __a66d         ; $a65a: f0 11     
            cpx #$00           ; $a65c: e0 00     
            beq __a666         ; $a65e: f0 06     
            clc                ; $a660: 18        
            adc #$08           ; $a661: 69 08     
            jmp __a669         ; $a663: 4c 69 a6  

;-------------------------------------------------------------------------------
__a666:     sec                ; $a666: 38        
            sbc #$08           ; $a667: e9 08     
__a669:     dey                ; $a669: 88        
            jmp __a658         ; $a66a: 4c 58 a6  

;-------------------------------------------------------------------------------
__a66d:     cmp $00            ; $a66d: c5 00     
            beq __a67a         ; $a66f: f0 09     
            lda $99            ; $a671: a5 99     
            asl                ; $a673: 0a        
            jsr __a681         ; $a674: 20 81 a6  
            beq __a67a         ; $a677: f0 01     
            rts                ; $a679: 60        

;-------------------------------------------------------------------------------
__a67a:     ldx $ae            ; $a67a: a6 ae     
            lda #$00           ; $a67c: a9 00     
            sta $af,x          ; $a67e: 95 af     
            rts                ; $a680: 60        

;-------------------------------------------------------------------------------
__a681:     sta $09            ; $a681: 85 09     
            jsr __aeee         ; $a683: 20 ee ae  
            lda $0203,x        ; $a686: bd 03 02  
            sta $0a            ; $a689: 85 0a     
            ldx $ae            ; $a68b: a6 ae     
            lda $e0,x          ; $a68d: b5 e0     
            sec                ; $a68f: 38        
            sbc #$02           ; $a690: e9 02     
            asl                ; $a692: 0a        
            tax                ; $a693: aa        
            lda $c1,x          ; $a694: b5 c1     
            beq __a6a1         ; $a696: f0 09     
            ldy $09            ; $a698: a4 09     
            lda __83de,y       ; $a69a: b9 de 83  
            cmp $0a            ; $a69d: c5 0a     
            beq __a6ae         ; $a69f: f0 0d     
__a6a1:     lda $c2,x          ; $a6a1: b5 c2     
            beq __a6b1         ; $a6a3: f0 0c     
            ldy $09            ; $a6a5: a4 09     
            lda __83df,y       ; $a6a7: b9 df 83  
            cmp $0a            ; $a6aa: c5 0a     
            bne __a6b1         ; $a6ac: d0 03     
__a6ae:     lda #$00           ; $a6ae: a9 00     
            rts                ; $a6b0: 60        

;-------------------------------------------------------------------------------
__a6b1:     lda #$01           ; $a6b1: a9 01     
            rts                ; $a6b3: 60        

;-------------------------------------------------------------------------------
__a6b4:     ldx $ae            ; $a6b4: a6 ae     
            lda $db,x          ; $a6b6: b5 db     
            beq __a6bf         ; $a6b8: f0 05     
            ldx $ae            ; $a6ba: a6 ae     
            lda $af,x          ; $a6bc: b5 af     
            rts                ; $a6be: 60        

;-------------------------------------------------------------------------------
__a6bf:     lda $53            ; $a6bf: a5 53     
            sec                ; $a6c1: 38        
            sbc #$02           ; $a6c2: e9 02     
            asl                ; $a6c4: 0a        
            tay                ; $a6c5: a8        
            lda __849b,y       ; $a6c6: b9 9b 84  
            sta $07            ; $a6c9: 85 07     
            lda __849c,y       ; $a6cb: b9 9c 84  
            sta $08            ; $a6ce: 85 08     
            ldx $ae            ; $a6d0: a6 ae     
            ldy $e0,x          ; $a6d2: b4 e0     
            beq __a703         ; $a6d4: f0 2d     
            dey                ; $a6d6: 88        
            lda ($07),y        ; $a6d7: b1 07     
            sta $09            ; $a6d9: 85 09     
            iny                ; $a6db: c8        
            lda ($07),y        ; $a6dc: b1 07     
            sta $0a            ; $a6de: 85 0a     
            lda $53            ; $a6e0: a5 53     
            sec                ; $a6e2: 38        
            sbc #$02           ; $a6e3: e9 02     
            asl                ; $a6e5: 0a        
            tay                ; $a6e6: a8        
            lda __84a1,y       ; $a6e7: b9 a1 84  
            sta $07            ; $a6ea: 85 07     
            lda __84a2,y       ; $a6ec: b9 a2 84  
            sta $08            ; $a6ef: 85 08     
            ldy $09            ; $a6f1: a4 09     
__a6f3:     cpy $0a            ; $a6f3: c4 0a     
            beq __a703         ; $a6f5: f0 0c     
            lda ($07),y        ; $a6f7: b1 07     
            cmp $00            ; $a6f9: c5 00     
            beq __a70a         ; $a6fb: f0 0d     
            iny                ; $a6fd: c8        
            iny                ; $a6fe: c8        
            iny                ; $a6ff: c8        
            jmp __a6f3         ; $a700: 4c f3 a6  

;-------------------------------------------------------------------------------
__a703:     lda #$00           ; $a703: a9 00     
            ldx $ae            ; $a705: a6 ae     
            sta $af,x          ; $a707: 95 af     
            rts                ; $a709: 60        

;-------------------------------------------------------------------------------
__a70a:     iny                ; $a70a: c8        
            lda ($07),y        ; $a70b: b1 07     
            ldx $ae            ; $a70d: a6 ae     
            sta $db,x          ; $a70f: 95 db     
            iny                ; $a711: c8        
            lda ($07),y        ; $a712: b1 07     
            sta $af,x          ; $a714: 95 af     
            rts                ; $a716: 60        

;-------------------------------------------------------------------------------
__a717:     ldx $ae            ; $a717: a6 ae     
            inc $e4,x          ; $a719: f6 e4     
            lda $e4,x          ; $a71b: b5 e4     
            bmi __a726         ; $a71d: 30 07     
            cmp #$10           ; $a71f: c9 10     
            bcs __a726         ; $a721: b0 03     
            jmp __a72a         ; $a723: 4c 2a a7  

;-------------------------------------------------------------------------------
__a726:     lda #$00           ; $a726: a9 00     
            sta $e4,x          ; $a728: 95 e4     
__a72a:     cmp #$08           ; $a72a: c9 08     
            bcs __a737         ; $a72c: b0 09     
            tax                ; $a72e: aa        
            lda __81bc,x       ; $a72f: bd bc 81  
            and $0a            ; $a732: 25 0a     
            jmp __a740         ; $a734: 4c 40 a7  

;-------------------------------------------------------------------------------
__a737:     sec                ; $a737: 38        
            sbc #$08           ; $a738: e9 08     
            tax                ; $a73a: aa        
            lda __81bc,x       ; $a73b: bd bc 81  
            and $0b            ; $a73e: 25 0b     
__a740:     beq __a744         ; $a740: f0 02     
            lda #$01           ; $a742: a9 01     
__a744:     rts                ; $a744: 60        

;-------------------------------------------------------------------------------
__a745:     jsr __aa08         ; $a745: 20 08 aa  
            lda __845c,x       ; $a748: bd 5c 84  
            sta $0a            ; $a74b: 85 0a     
            lda __8461,x       ; $a74d: bd 61 84  
            sta $0b            ; $a750: 85 0b     
            lda #$00           ; $a752: a9 00     
            sta $5d            ; $a754: 85 5d     
            jsr __9ef9         ; $a756: 20 f9 9e  
            bne __a75c         ; $a759: d0 01     
            rts                ; $a75b: 60        

;-------------------------------------------------------------------------------
__a75c:     lda #$00           ; $a75c: a9 00     
            sta $d2            ; $a75e: 85 d2     
__a760:     lda $d2            ; $a760: a5 d2     
            cmp #$03           ; $a762: c9 03     
            bcs __a7ba         ; $a764: b0 54     
            tax                ; $a766: aa        
            bne __a77b         ; $a767: d0 12     
            lda $da            ; $a769: a5 da     
            cmp #$01           ; $a76b: c9 01     
            bne __a77b         ; $a76d: d0 0c     
            dec $0200          ; $a76f: ce 00 02  
            dec $0204          ; $a772: ce 04 02  
            dec $0208          ; $a775: ce 08 02  
            dec $020c          ; $a778: ce 0c 02  
__a77b:     ldy __82cc,x       ; $a77b: bc cc 82  
            lda $0200,y        ; $a77e: b9 00 02  
            cmp #$ff           ; $a781: c9 ff     
            beq __a7b5         ; $a783: f0 30     
            tya                ; $a785: 98        
            tax                ; $a786: aa        
            dec $0200,x        ; $a787: de 00 02  
            dec $0204,x        ; $a78a: de 04 02  
            lda $0200,x        ; $a78d: bd 00 02  
            cmp #$50           ; $a790: c9 50     
            bne __a79a         ; $a792: d0 06     
            jsr __a879         ; $a794: 20 79 a8  
            jmp __a7a1         ; $a797: 4c a1 a7  

;-------------------------------------------------------------------------------
__a79a:     cmp #$c8           ; $a79a: c9 c8     
            bne __a7a1         ; $a79c: d0 03     
            jsr __a882         ; $a79e: 20 82 a8  
__a7a1:     lda $0200,y        ; $a7a1: b9 00 02  
            cmp #$70           ; $a7a4: c9 70     
            bne __a7ac         ; $a7a6: d0 04     
            lda #$01           ; $a7a8: a9 01     
            sta $d8            ; $a7aa: 85 d8     
__a7ac:     lda $0200,y        ; $a7ac: b9 00 02  
            cmp #$48           ; $a7af: c9 48     
            beq __a812         ; $a7b1: f0 5f     
            bcc __a812         ; $a7b3: 90 5d     
__a7b5:     inc $d2            ; $a7b5: e6 d2     
            jmp __a760         ; $a7b7: 4c 60 a7  

;-------------------------------------------------------------------------------
__a7ba:     cmp #$06           ; $a7ba: c9 06     
            beq __a81f         ; $a7bc: f0 61     
            tax                ; $a7be: aa        
            cmp #$03           ; $a7bf: c9 03     
            bne __a7d5         ; $a7c1: d0 12     
            lda $da            ; $a7c3: a5 da     
            cmp #$02           ; $a7c5: c9 02     
            bne __a7d5         ; $a7c7: d0 0c     
            inc $0200          ; $a7c9: ee 00 02  
            inc $0204          ; $a7cc: ee 04 02  
            inc $0208          ; $a7cf: ee 08 02  
            inc $020c          ; $a7d2: ee 0c 02  
__a7d5:     ldy __82cc,x       ; $a7d5: bc cc 82  
            lda $0200,y        ; $a7d8: b9 00 02  
            cmp #$ff           ; $a7db: c9 ff     
            beq __a80d         ; $a7dd: f0 2e     
            tya                ; $a7df: 98        
            tax                ; $a7e0: aa        
            inc $0200,x        ; $a7e1: fe 00 02  
            inc $0204,x        ; $a7e4: fe 04 02  
            lda $0200,x        ; $a7e7: bd 00 02  
            cmp #$50           ; $a7ea: c9 50     
            bne __a7f4         ; $a7ec: d0 06     
            jsr __a882         ; $a7ee: 20 82 a8  
            jmp __a7fb         ; $a7f1: 4c fb a7  

;-------------------------------------------------------------------------------
__a7f4:     cmp #$c8           ; $a7f4: c9 c8     
            bne __a7fb         ; $a7f6: d0 03     
            jsr __a879         ; $a7f8: 20 79 a8  
__a7fb:     lda $0200,y        ; $a7fb: b9 00 02  
            cmp #$a8           ; $a7fe: c9 a8     
__a800:     bne __a809         ; $a800: d0 07     
            lda #$01           ; $a802: a9 01     
            sta $d9            ; $a804: 85 d9     
            lda $0200,y        ; $a806: b9 00 02  
__a809:     cmp #$d0           ; $a809: c9 d0     
            bcs __a812         ; $a80b: b0 05     
__a80d:     inc $d2            ; $a80d: e6 d2     
            jmp __a760         ; $a80f: 4c 60 a7  

;-------------------------------------------------------------------------------
__a812:     lda #$ff           ; $a812: a9 ff     
            sta $0200,y        ; $a814: 99 00 02  
            sta $0204,y        ; $a817: 99 04 02  
            inc $d2            ; $a81a: e6 d2     
            jmp __a760         ; $a81c: 4c 60 a7  

;-------------------------------------------------------------------------------
__a81f:     lda $d8            ; $a81f: a5 d8     
            cmp #$01           ; $a821: c9 01     
            bne __a84c         ; $a823: d0 27     
            lda #$00           ; $a825: a9 00     
            sta $d2            ; $a827: 85 d2     
__a829:     lda $d2            ; $a829: a5 d2     
            cmp #$03           ; $a82b: c9 03     
            beq __a878         ; $a82d: f0 49     
            tax                ; $a82f: aa        
            ldy __82cc,x       ; $a830: bc cc 82  
            lda $0200,y        ; $a833: b9 00 02  
            cmp #$ff           ; $a836: c9 ff     
            beq __a83f         ; $a838: f0 05     
            inc $d2            ; $a83a: e6 d2     
            jmp __a829         ; $a83c: 4c 29 a8  

;-------------------------------------------------------------------------------
__a83f:     lda #$d0           ; $a83f: a9 d0     
            jsr __a88b         ; $a841: 20 8b a8  
            jsr __a879         ; $a844: 20 79 a8  
            lda #$00           ; $a847: a9 00     
            sta $d8            ; $a849: 85 d8     
            rts                ; $a84b: 60        

;-------------------------------------------------------------------------------
__a84c:     lda $d9            ; $a84c: a5 d9     
            cmp #$01           ; $a84e: c9 01     
            bne __a878         ; $a850: d0 26     
            lda #$03           ; $a852: a9 03     
            sta $d2            ; $a854: 85 d2     
__a856:     lda $d2            ; $a856: a5 d2     
            cmp #$06           ; $a858: c9 06     
            beq __a878         ; $a85a: f0 1c     
            tax                ; $a85c: aa        
            ldy __82cc,x       ; $a85d: bc cc 82  
            lda $0200,y        ; $a860: b9 00 02  
            cmp #$ff           ; $a863: c9 ff     
            beq __a86c         ; $a865: f0 05     
            inc $d2            ; $a867: e6 d2     
            jmp __a856         ; $a869: 4c 56 a8  

;-------------------------------------------------------------------------------
__a86c:     lda #$48           ; $a86c: a9 48     
            jsr __a88b         ; $a86e: 20 8b a8  
            jsr __a879         ; $a871: 20 79 a8  
            lda #$00           ; $a874: a9 00     
            sta $d9            ; $a876: 85 d9     
__a878:     rts                ; $a878: 60        

;-------------------------------------------------------------------------------
__a879:     lda #$23           ; $a879: a9 23     
            sta $0202,y        ; $a87b: 99 02 02  
            sta $0206,y        ; $a87e: 99 06 02  
            rts                ; $a881: 60        

;-------------------------------------------------------------------------------
__a882:     lda #$03           ; $a882: a9 03     
            sta $0202,y        ; $a884: 99 02 02  
            sta $0206,y        ; $a887: 99 06 02  
            rts                ; $a88a: 60        

;-------------------------------------------------------------------------------
__a88b:     sta $0200,y        ; $a88b: 99 00 02  
__a88e:     sta $0204,y        ; $a88e: 99 04 02  
            rts                ; $a891: 60        

;-------------------------------------------------------------------------------
__a892:     lda #$00           ; $a892: a9 00     
            sta $0445          ; $a894: 8d 45 04  
__a897:     lda $0445          ; $a897: ad 45 04  
            jsr __aee8         ; $a89a: 20 e8 ae  
            txa                ; $a89d: 8a        
            clc                ; $a89e: 18        
            adc #$30           ; $a89f: 69 30     
            tax                ; $a8a1: aa        
            stx $04            ; $a8a2: 86 04     
            jsr __a9fd         ; $a8a4: 20 fd a9  
            cmp #$ff           ; $a8a7: c9 ff     
            beq __a901         ; $a8a9: f0 56     
            ldx $0445          ; $a8ab: ae 45 04  
            lda $0446,x        ; $a8ae: bd 46 04  
            clc                ; $a8b1: 18        
            adc #$b0           ; $a8b2: 69 b0     
            cmp $00            ; $a8b4: c5 00     
            bcc __a8c5         ; $a8b6: 90 0d     
            lda $01            ; $a8b8: a5 01     
            cmp #$26           ; $a8ba: c9 26     
            bcs __a8cf         ; $a8bc: b0 11     
            lda #$c0           ; $a8be: a9 c0     
            sta $02            ; $a8c0: 85 02     
            jmp __a8eb         ; $a8c2: 4c eb a8  

;-------------------------------------------------------------------------------
__a8c5:     jsr __a912         ; $a8c5: 20 12 a9  
            cmp #$ff           ; $a8c8: c9 ff     
            beq __a904         ; $a8ca: f0 38     
            jmp __a8fb         ; $a8cc: 4c fb a8  

;-------------------------------------------------------------------------------
__a8cf:     lda #$c4           ; $a8cf: a9 c4     
            sta $02            ; $a8d1: 85 02     
            lda $01            ; $a8d3: a5 01     
            cmp #$2e           ; $a8d5: c9 2e     
            bcc __a8eb         ; $a8d7: 90 12     
            lda #$02           ; $a8d9: a9 02     
            sta $fe            ; $a8db: 85 fe     
            lda #$2e           ; $a8dd: a9 2e     
            sta $01            ; $a8df: 85 01     
            lda $0445          ; $a8e1: ad 45 04  
            asl                ; $a8e4: 0a        
            tax                ; $a8e5: aa        
            lda #$00           ; $a8e6: a9 00     
            sta $042e,x        ; $a8e8: 9d 2e 04  
__a8eb:     lda $00            ; $a8eb: a5 00     
            clc                ; $a8ed: 18        
            adc #$02           ; $a8ee: 69 02     
            sta $00            ; $a8f0: 85 00     
            lda $0445          ; $a8f2: ad 45 04  
            clc                ; $a8f5: 18        
            adc #$01           ; $a8f6: 69 01     
            jsr __ae83         ; $a8f8: 20 83 ae  
__a8fb:     jsr __a9ec         ; $a8fb: 20 ec a9  
            jmp __a904         ; $a8fe: 4c 04 a9  

;-------------------------------------------------------------------------------
__a901:     jsr __a945         ; $a901: 20 45 a9  
__a904:     inc $0445          ; $a904: ee 45 04  
            lda $0445          ; $a907: ad 45 04  
            cmp #$03           ; $a90a: c9 03     
            beq __a911         ; $a90c: f0 03     
            jmp __a897         ; $a90e: 4c 97 a8  

;-------------------------------------------------------------------------------
__a911:     rts                ; $a911: 60        

;-------------------------------------------------------------------------------
__a912:     lda $01            ; $a912: a5 01     
            inc $01            ; $a914: e6 01     
            inc $01            ; $a916: e6 01     
            inc $01            ; $a918: e6 01     
            cmp #$26           ; $a91a: c9 26     
            bne __a922         ; $a91c: d0 04     
            ldx #$01           ; $a91e: a2 01     
            stx $fe            ; $a920: 86 fe     
__a922:     cmp #$50           ; $a922: c9 50     
            bcc __a93b         ; $a924: 90 15     
            cmp #$90           ; $a926: c9 90     
            bcc __a940         ; $a928: 90 16     
            cmp #$c0           ; $a92a: c9 c0     
            bcc __a93b         ; $a92c: 90 0d     
            cmp #$d8           ; $a92e: c9 d8     
            bcc __a940         ; $a930: 90 0e     
            jsr __a9e2         ; $a932: 20 e2 a9  
            jsr __afa5         ; $a935: 20 a5 af  
            lda #$ff           ; $a938: a9 ff     
            rts                ; $a93a: 60        

;-------------------------------------------------------------------------------
__a93b:     lda #$c4           ; $a93b: a9 c4     
            sta $02            ; $a93d: 85 02     
            rts                ; $a93f: 60        

;-------------------------------------------------------------------------------
__a940:     lda #$c0           ; $a940: a9 c0     
            sta $02            ; $a942: 85 02     
            rts                ; $a944: 60        

;-------------------------------------------------------------------------------
__a945:     lda $36            ; $a945: a5 36     
            bne __a96f         ; $a947: d0 26     
            lda $19            ; $a949: a5 19     
            and #$03           ; $a94b: 29 03     
            tax                ; $a94d: aa        
            lda __81ff,x       ; $a94e: bd ff 81  
            clc                ; $a951: 18        
            adc #$10           ; $a952: 69 10     
            ldx $0445          ; $a954: ae 45 04  
            sta $0446,x        ; $a957: 9d 46 04  
            sta $00            ; $a95a: 85 00     
            lda #$30           ; $a95c: a9 30     
            sta $01            ; $a95e: 85 01     
            lda #$c4           ; $a960: a9 c4     
            sta $02            ; $a962: 85 02     
            jsr __a9ec         ; $a964: 20 ec a9  
            jsr __aa08         ; $a967: 20 08 aa  
            lda __8457,x       ; $a96a: bd 57 84  
            sta $36            ; $a96d: 85 36     
__a96f:     rts                ; $a96f: 60        

;-------------------------------------------------------------------------------
__a970:     lda $39            ; $a970: a5 39     
            beq __a975         ; $a972: f0 01     
            rts                ; $a974: 60        

;-------------------------------------------------------------------------------
__a975:     lda #$08           ; $a975: a9 08     
            sta $0a            ; $a977: 85 0a     
            lda #$00           ; $a979: a9 00     
            sta $0b            ; $a97b: 85 0b     
            jsr __a9b2         ; $a97d: 20 b2 a9  
            bne __a983         ; $a980: d0 01     
            rts                ; $a982: 60        

;-------------------------------------------------------------------------------
__a983:     lda #$50           ; $a983: a9 50     
            sta $00            ; $a985: 85 00     
            lda #$20           ; $a987: a9 20     
            sta $01            ; $a989: 85 01     
            lda $02f1          ; $a98b: ad f1 02  
            cmp #$db           ; $a98e: c9 db     
            beq __a999         ; $a990: f0 07     
            inc $b7            ; $a992: e6 b7     
            lda #$db           ; $a994: a9 db     
            jmp __a99b         ; $a996: 4c 9b a9  

;-------------------------------------------------------------------------------
__a999:     lda #$d7           ; $a999: a9 d7     
__a99b:     jsr __a9e5         ; $a99b: 20 e5 a9  
            lda #$f0           ; $a99e: a9 f0     
            jsr __af91         ; $a9a0: 20 91 af  
            lda $b7            ; $a9a3: a5 b7     
            cmp #$04           ; $a9a5: c9 04     
            bne __a9b1         ; $a9a7: d0 08     
            lda #$00           ; $a9a9: a9 00     
            sta $b7            ; $a9ab: 85 b7     
            lda #$bb           ; $a9ad: a9 bb     
            sta $39            ; $a9af: 85 39     
__a9b1:     rts                ; $a9b1: 60        

;-------------------------------------------------------------------------------
__a9b2:     inc $b8            ; $a9b2: e6 b8     
            lda $b8            ; $a9b4: a5 b8     
            bmi __a9bf         ; $a9b6: 30 07     
            cmp #$10           ; $a9b8: c9 10     
            bcs __a9bf         ; $a9ba: b0 03     
            jmp __a9c3         ; $a9bc: 4c c3 a9  

;-------------------------------------------------------------------------------
__a9bf:     lda #$00           ; $a9bf: a9 00     
            sta $b8            ; $a9c1: 85 b8     
__a9c3:     cmp #$08           ; $a9c3: c9 08     
            bcs __a9d0         ; $a9c5: b0 09     
            tax                ; $a9c7: aa        
            lda __81bc,x       ; $a9c8: bd bc 81  
            and $0a            ; $a9cb: 25 0a     
            jmp __a9d9         ; $a9cd: 4c d9 a9  

;-------------------------------------------------------------------------------
__a9d0:     sec                ; $a9d0: 38        
            sbc #$08           ; $a9d1: e9 08     
            tax                ; $a9d3: aa        
            lda __81bc,x       ; $a9d4: bd bc 81  
            and $0b            ; $a9d7: 25 0b     
__a9d9:     beq __a9dd         ; $a9d9: f0 02     
            lda #$01           ; $a9db: a9 01     
__a9dd:     rts                ; $a9dd: 60        

;-------------------------------------------------------------------------------
__a9de:     lda #$00           ; $a9de: a9 00     
            sta $04            ; $a9e0: 85 04     
__a9e2:     jmp __a9e7         ; $a9e2: 4c e7 a9  

;-------------------------------------------------------------------------------
__a9e5:     sta $02            ; $a9e5: 85 02     
__a9e7:     lda #$22           ; $a9e7: a9 22     
            sta $03            ; $a9e9: 85 03     
            rts                ; $a9eb: 60        

;-------------------------------------------------------------------------------
__a9ec:     jsr __a9e2         ; $a9ec: 20 e2 a9  
            jmp __af93         ; $a9ef: 4c 93 af  

;-------------------------------------------------------------------------------
__a9f2:     lda $0203          ; $a9f2: ad 03 02  
            sta $00            ; $a9f5: 85 00     
            lda $0200          ; $a9f7: ad 00 02  
            sta $01            ; $a9fa: 85 01     
            rts                ; $a9fc: 60        

;-------------------------------------------------------------------------------
__a9fd:     lda $0203,x        ; $a9fd: bd 03 02  
            sta $00            ; $aa00: 85 00     
            lda $0200,x        ; $aa02: bd 00 02  
            sta $01            ; $aa05: 85 01     
            rts                ; $aa07: 60        

;-------------------------------------------------------------------------------
__aa08:     lda $50            ; $aa08: a5 50     
            and #$01           ; $aa0a: 29 01     
            clc                ; $aa0c: 18        
            adc $54            ; $aa0d: 65 54     
            tax                ; $aa0f: aa        
            cpx #$04           ; $aa10: e0 04     
            bcc __aa16         ; $aa12: 90 02     
            ldx #$04           ; $aa14: a2 04     
__aa16:     rts                ; $aa16: 60        

;-------------------------------------------------------------------------------
__aa17:     lda $0503          ; $aa17: ad 03 05  
            bne __aa1d         ; $aa1a: d0 01     
            rts                ; $aa1c: 60        

;-------------------------------------------------------------------------------
__aa1d:     lda $0505          ; $aa1d: ad 05 05  
            and #$0f           ; $aa20: 29 0f     
            sta $0505          ; $aa22: 8d 05 05  
            lda $53            ; $aa25: a5 53     
            tax                ; $aa27: aa        
            tay                ; $aa28: a8        
            dex                ; $aa29: ca        
            lda __8608,x       ; $aa2a: bd 08 86  
            sta $00            ; $aa2d: 85 00     
            lda #$20           ; $aa2f: a9 20     
            sta $01            ; $aa31: 85 01     
            tya                ; $aa33: 98        
            cmp #$02           ; $aa34: c9 02     
            bmi __aa65         ; $aa36: 30 2d     
            lda $44            ; $aa38: a5 44     
            beq __aa60         ; $aa3a: f0 24     
__aa3c:     cmp #$13           ; $aa3c: c9 13     
            bne __aa43         ; $aa3e: d0 03     
            jmp __aa96         ; $aa40: 4c 96 aa  

;-------------------------------------------------------------------------------
__aa43:     cmp #$0f           ; $aa43: c9 0f     
            bne __aa4a         ; $aa45: d0 03     
            jmp __aa9f         ; $aa47: 4c 9f aa  

;-------------------------------------------------------------------------------
__aa4a:     cmp #$0b           ; $aa4a: c9 0b     
            bne __aa51         ; $aa4c: d0 03     
            jmp __aa96         ; $aa4e: 4c 96 aa  

;-------------------------------------------------------------------------------
__aa51:     cmp #$08           ; $aa51: c9 08     
            bne __aa58         ; $aa53: d0 03     
            jmp __aa9f         ; $aa55: 4c 9f aa  

;-------------------------------------------------------------------------------
__aa58:     cmp #$04           ; $aa58: c9 04     
            bne __aa5f         ; $aa5a: d0 03     
            jsr __aab7         ; $aa5c: 20 b7 aa  
__aa5f:     rts                ; $aa5f: 60        

;-------------------------------------------------------------------------------
__aa60:     lda #$25           ; $aa60: a9 25     
            sta $44            ; $aa62: 85 44     
            rts                ; $aa64: 60        

;-------------------------------------------------------------------------------
__aa65:     lda $36            ; $aa65: a5 36     
            cmp #$18           ; $aa67: c9 18     
            beq __aa85         ; $aa69: f0 1a     
            cmp #$00           ; $aa6b: c9 00     
            beq __aa8c         ; $aa6d: f0 1d     
            lda $0515          ; $aa6f: ad 15 05  
            beq __aa80         ; $aa72: f0 0c     
            jsr __aab2         ; $aa74: 20 b2 aa  
            lda #$00           ; $aa77: a9 00     
            sta $0515          ; $aa79: 8d 15 05  
            lda #$1a           ; $aa7c: a9 1a     
            sta $44            ; $aa7e: 85 44     
__aa80:     lda $44            ; $aa80: a5 44     
            jmp __aa3c         ; $aa82: 4c 3c aa  

;-------------------------------------------------------------------------------
__aa85:     lda #$30           ; $aa85: a9 30     
            sta $44            ; $aa87: 85 44     
            jmp __aaad         ; $aa89: 4c ad aa  

;-------------------------------------------------------------------------------
__aa8c:     lda #$1a           ; $aa8c: a9 1a     
            sta $44            ; $aa8e: 85 44     
            jsr __aaa8         ; $aa90: 20 a8 aa  
            jmp __aa3c         ; $aa93: 4c 3c aa  

;-------------------------------------------------------------------------------
__aa96:     lda #$80           ; $aa96: a9 80     
            sta $fe            ; $aa98: 85 fe     
__aa9a:     lda #$40           ; $aa9a: a9 40     
            jmp __aab9         ; $aa9c: 4c b9 aa  

;-------------------------------------------------------------------------------
__aa9f:     lda #$80           ; $aa9f: a9 80     
            sta $fe            ; $aaa1: 85 fe     
__aaa3:     lda #$42           ; $aaa3: a9 42     
            jmp __aab9         ; $aaa5: 4c b9 aa  

;-------------------------------------------------------------------------------
__aaa8:     lda #$44           ; $aaa8: a9 44     
            jmp __aab9         ; $aaaa: 4c b9 aa  

;-------------------------------------------------------------------------------
__aaad:     lda #$3e           ; $aaad: a9 3e     
            jmp __aab9         ; $aaaf: 4c b9 aa  

;-------------------------------------------------------------------------------
__aab2:     lda #$00           ; $aab2: a9 00     
            jmp __aab9         ; $aab4: 4c b9 aa  

;-------------------------------------------------------------------------------
__aab7:     lda #$02           ; $aab7: a9 02     
__aab9:     jsr __87ac         ; $aab9: 20 ac 87  
            dec $44            ; $aabc: c6 44     
            lda $0505          ; $aabe: ad 05 05  
            ora #$10           ; $aac1: 09 10     
            sta $0505          ; $aac3: 8d 05 05  
            rts                ; $aac6: 60        

;-------------------------------------------------------------------------------
__aac7:     lda $45            ; $aac7: a5 45     
            beq __aacc         ; $aac9: f0 01     
            rts                ; $aacb: 60        

;-------------------------------------------------------------------------------
__aacc:     lda $2e            ; $aacc: a5 2e     
            bne __aad5         ; $aace: d0 05     
            lda #$ff           ; $aad0: a9 ff     
            sta $96            ; $aad2: 85 96     
            rts                ; $aad4: 60        

;-------------------------------------------------------------------------------
__aad5:     lda #$0b           ; $aad5: a9 0b     
            sta $45            ; $aad7: 85 45     
            lda #$01           ; $aad9: a9 01     
            sta $00            ; $aadb: 85 00     
            lda #$0a           ; $aadd: a9 0a     
            sta $01            ; $aadf: 85 01     
            jsr __b1a8         ; $aae1: 20 a8 b1  
            lda #$02           ; $aae4: a9 02     
            sta $00            ; $aae6: 85 00     
            jmp __b0fd         ; $aae8: 4c fd b0  

;-------------------------------------------------------------------------------
__aaeb:     lda $050b          ; $aaeb: ad 0b 05  
            bne __aafe         ; $aaee: d0 0e     
            lda #$01           ; $aaf0: a9 01     
            sta $050b          ; $aaf2: 8d 0b 05  
            lda #$00           ; $aaf5: a9 00     
            sta $050e          ; $aaf7: 8d 0e 05  
            sta $050c          ; $aafa: 8d 0c 05  
            rts                ; $aafd: 60        

;-------------------------------------------------------------------------------
__aafe:     lda $050c          ; $aafe: ad 0c 05  
__ab01:     beq __ab27         ; $ab01: f0 24     
            lda $050d          ; $ab03: ad 0d 05  
            cmp #$05           ; $ab06: c9 05     
            bne __ab1b         ; $ab08: d0 11     
            lda $96            ; $ab0a: a5 96     
            cmp #$0a           ; $ab0c: c9 0a     
            bne __ab14         ; $ab0e: d0 04     
            lda #$00           ; $ab10: a9 00     
            beq __ab1b         ; $ab12: f0 07     
__ab14:     lda #$04           ; $ab14: a9 04     
            sta $96            ; $ab16: 85 96     
            jmp __ab23         ; $ab18: 4c 23 ab  

;-------------------------------------------------------------------------------
__ab1b:     sta $56            ; $ab1b: 85 56     
            and #$03           ; $ab1d: 29 03     
            beq __ab23         ; $ab1f: f0 02     
            sta $57            ; $ab21: 85 57     
__ab23:     dec $050c          ; $ab23: ce 0c 05  
            rts                ; $ab26: 60        

;-------------------------------------------------------------------------------
__ab27:     ldx $050e          ; $ab27: ae 0e 05  
            lda __8028,x       ; $ab2a: bd 28 80  
            sta $050c          ; $ab2d: 8d 0c 05  
            lda __8014,x       ; $ab30: bd 14 80  
            sta $050d          ; $ab33: 8d 0d 05  
            inc $050e          ; $ab36: ee 0e 05  
            rts                ; $ab39: 60        

;-------------------------------------------------------------------------------
__ab3a:     jsr __a9f2         ; $ab3a: 20 f2 a9  
            lda #$4c           ; $ab3d: a9 4c     
            jsr __aef9         ; $ab3f: 20 f9 ae  
            lda $53            ; $ab42: a5 53     
            cmp #$03           ; $ab44: c9 03     
            beq __ab4c         ; $ab46: f0 04     
            cmp #$01           ; $ab48: c9 01     
            bne __ab4f         ; $ab4a: d0 03     
__ab4c:     jsr __ab55         ; $ab4c: 20 55 ab  
__ab4f:     jsr __ac9b         ; $ab4f: 20 9b ac  
            jmp __acd6         ; $ab52: 4c d6 ac  

;-------------------------------------------------------------------------------
__ab55:     lda #$00           ; $ab55: a9 00     
            sta $5d            ; $ab57: 85 5d     
__ab59:     lda #$3a           ; $ab59: a9 3a     
            jsr __87de         ; $ab5b: 20 de 87  
            jsr __aee6         ; $ab5e: 20 e6 ae  
            lda $53            ; $ab61: a5 53     
            cmp #$01           ; $ab63: c9 01     
            beq __ab6c         ; $ab65: f0 05     
            txa                ; $ab67: 8a        
            clc                ; $ab68: 18        
            adc #$30           ; $ab69: 69 30     
            tax                ; $ab6b: aa        
__ab6c:     jsr __a9fd         ; $ab6c: 20 fd a9  
            jsr __af00         ; $ab6f: 20 00 af  
            bne __abb8         ; $ab72: d0 44     
            lda $96            ; $ab74: a5 96     
            cmp #$04           ; $ab76: c9 04     
            bne __aba8         ; $ab78: d0 2e     
            lda $56            ; $ab7a: a5 56     
            and #$03           ; $ab7c: 29 03     
            bne __ab87         ; $ab7e: d0 07     
            lda $9c            ; $ab80: a5 9c     
            beq __ab91         ; $ab82: f0 0d     
            jmp __aba8         ; $ab84: 4c a8 ab  

;-------------------------------------------------------------------------------
__ab87:     lda $9c            ; $ab87: a5 9c     
            cmp #$03           ; $ab89: c9 03     
            bcs __aba8         ; $ab8b: b0 1b     
            lda $9e            ; $ab8d: a5 9e     
            bne __aba8         ; $ab8f: d0 17     
__ab91:     lda $9d            ; $ab91: a5 9d     
            cmp #$18           ; $ab93: c9 18     
            bcs __aba8         ; $ab95: b0 11     
            lda $00            ; $ab97: a5 00     
            sta $05            ; $ab99: 85 05     
            lda $01            ; $ab9b: a5 01     
            sta $06            ; $ab9d: 85 06     
            ldx #$00           ; $ab9f: a2 00     
            jsr __8ee5         ; $aba1: 20 e5 8e  
            lda #$20           ; $aba4: a9 20     
            sta $fd            ; $aba6: 85 fd     
__aba8:     inc $5d            ; $aba8: e6 5d     
            lda $53            ; $abaa: a5 53     
            lsr                ; $abac: 4a        
            tax                ; $abad: aa        
            lda $5d            ; $abae: a5 5d     
            cmp __81fd,x       ; $abb0: dd fd 81  
            beq __abc0         ; $abb3: f0 0b     
            jmp __ab59         ; $abb5: 4c 59 ab  

;-------------------------------------------------------------------------------
__abb8:     jsr __ae62         ; $abb8: 20 62 ae  
            lda #$ff           ; $abbb: a9 ff     
            sta $96            ; $abbd: 85 96     
            rts                ; $abbf: 60        

;-------------------------------------------------------------------------------
__abc0:     lda $53            ; $abc0: a5 53     
            cmp #$03           ; $abc2: c9 03     
            beq __abcf         ; $abc4: f0 09     
            lda $96            ; $abc6: a5 96     
            cmp #$0a           ; $abc8: c9 0a     
            bne __abcf         ; $abca: d0 03     
            jmp __abd0         ; $abcc: 4c d0 ab  

;-------------------------------------------------------------------------------
__abcf:     rts                ; $abcf: 60        

;-------------------------------------------------------------------------------
__abd0:     lda $a0            ; $abd0: a5 a0     
            bne __abd7         ; $abd2: d0 03     
            jmp __ac98         ; $abd4: 4c 98 ac  

;-------------------------------------------------------------------------------
__abd7:     lda $9f            ; $abd7: a5 9f     
            lsr                ; $abd9: 4a        
            lsr                ; $abda: 4a        
            beq __abe2         ; $abdb: f0 05     
            lda #$00           ; $abdd: a9 00     
            jmp __abe4         ; $abdf: 4c e4 ab  

;-------------------------------------------------------------------------------
__abe2:     lda #$01           ; $abe2: a9 01     
__abe4:     beq __abf9         ; $abe4: f0 13     
            lda #$04           ; $abe6: a9 04     
            clc                ; $abe8: 18        
            adc $0203          ; $abe9: 6d 03 02  
            sta $00            ; $abec: 85 00     
            lda $0200          ; $abee: ad 00 02  
            sec                ; $abf1: 38        
            sbc #$10           ; $abf2: e9 10     
            sta $01            ; $abf4: 85 01     
            jmp __ac18         ; $abf6: 4c 18 ac  

;-------------------------------------------------------------------------------
__abf9:     lda $57            ; $abf9: a5 57     
            cmp #$01           ; $abfb: c9 01     
            beq __ac08         ; $abfd: f0 09     
            lda $0203          ; $abff: ad 03 02  
            sec                ; $ac02: 38        
            sbc #$10           ; $ac03: e9 10     
            jmp __ac0e         ; $ac05: 4c 0e ac  

;-------------------------------------------------------------------------------
__ac08:     lda $0203          ; $ac08: ad 03 02  
            clc                ; $ac0b: 18        
            adc #$10           ; $ac0c: 69 10     
__ac0e:     sta $00            ; $ac0e: 85 00     
            lda $0200          ; $ac10: ad 00 02  
            clc                ; $ac13: 18        
            adc #$06           ; $ac14: 69 06     
            sta $01            ; $ac16: 85 01     
__ac18:     lda #$3c           ; $ac18: a9 3c     
            jsr __aef9         ; $ac1a: 20 f9 ae  
            lda $53            ; $ac1d: a5 53     
            cmp #$01           ; $ac1f: c9 01     
            bne __ac45         ; $ac21: d0 22     
            lda #$00           ; $ac23: a9 00     
            sta $5d            ; $ac25: 85 5d     
__ac27:     jsr __aee6         ; $ac27: 20 e6 ae  
            jsr __a9fd         ; $ac2a: 20 fd a9  
            lda #$3a           ; $ac2d: a9 3a     
            jsr __87de         ; $ac2f: 20 de 87  
            jsr __af00         ; $ac32: 20 00 af  
            bne __ac68         ; $ac35: d0 31     
            lda $5d            ; $ac37: a5 5d     
            clc                ; $ac39: 18        
            adc #$01           ; $ac3a: 69 01     
            sta $5d            ; $ac3c: 85 5d     
            cmp #$09           ; $ac3e: c9 09     
            beq __ac96         ; $ac40: f0 54     
            jmp __ac27         ; $ac42: 4c 27 ac  

;-------------------------------------------------------------------------------
__ac45:     lda #$00           ; $ac45: a9 00     
            sta $ae            ; $ac47: 85 ae     
__ac49:     jsr __aeee         ; $ac49: 20 ee ae  
            jsr __a9fd         ; $ac4c: 20 fd a9  
            .hex a9            ; $ac4f: a9        Suspected data
__ac50:     .hex 3a            ; $ac50: 3a        Invalid Opcode - NOP 
            jsr __87de         ; $ac51: 20 de 87  
            jsr __af00         ; $ac54: 20 00 af  
            bne __ac68         ; $ac57: d0 0f     
            inc $ae            ; $ac59: e6 ae     
            lda $ae            ; $ac5b: a5 ae     
            ldx $53            ; $ac5d: a6 53     
            dex                ; $ac5f: ca        
            cmp __81f6,x       ; $ac60: dd f6 81  
            beq __ac96         ; $ac63: f0 31     
            jmp __ac49         ; $ac65: 4c 49 ac  

;-------------------------------------------------------------------------------
__ac68:     lda #$02           ; $ac68: a9 02     
            sta $ff            ; $ac6a: 85 ff     
            lda $00            ; $ac6c: a5 00     
            sta $05            ; $ac6e: 85 05     
            lda $01            ; $ac70: a5 01     
            sta $06            ; $ac72: 85 06     
            lda $53            ; $ac74: a5 53     
            cmp #$01           ; $ac76: c9 01     
            bne __ac85         ; $ac78: d0 0b     
            lda #$00           ; $ac7a: a9 00     
            ldx $5d            ; $ac7c: a6 5d     
            sta $68,x          ; $ac7e: 95 68     
            lda #$01           ; $ac80: a9 01     
            jmp __ac98         ; $ac82: 4c 98 ac  

;-------------------------------------------------------------------------------
__ac85:     lda #$10           ; $ac85: a9 10     
            sta $40            ; $ac87: 85 40     
            lda #$00           ; $ac89: a9 00     
            ldx $ae            ; $ac8b: a6 ae     
            sta $e0,x          ; $ac8d: 95 e0     
            sta $db,x          ; $ac8f: 95 db     
            lda #$01           ; $ac91: a9 01     
            jmp __ac98         ; $ac93: 4c 98 ac  

;-------------------------------------------------------------------------------
__ac96:     lda #$00           ; $ac96: a9 00     
__ac98:     sta $bf            ; $ac98: 85 bf     
            rts                ; $ac9a: 60        

;-------------------------------------------------------------------------------
__ac9b:     lda #$00           ; $ac9b: a9 00     
            sta $ae            ; $ac9d: 85 ae     
            lda #$3a           ; $ac9f: a9 3a     
            jsr __87de         ; $aca1: 20 de 87  
__aca4:     jsr __aeee         ; $aca4: 20 ee ae  
            jsr __a9fd         ; $aca7: 20 fd a9  
            jsr __af00         ; $acaa: 20 00 af  
            bne __acbe         ; $acad: d0 0f     
            inc $ae            ; $acaf: e6 ae     
            lda $ae            ; $acb1: a5 ae     
            ldx $53            ; $acb3: a6 53     
            dex                ; $acb5: ca        
            cmp __81f6,x       ; $acb6: dd f6 81  
            beq __acc6         ; $acb9: f0 0b     
            jmp __aca4         ; $acbb: 4c a4 ac  

;-------------------------------------------------------------------------------
__acbe:     jsr __ae62         ; $acbe: 20 62 ae  
            lda #$ff           ; $acc1: a9 ff     
            sta $96            ; $acc3: 85 96     
            rts                ; $acc5: 60        

;-------------------------------------------------------------------------------
__acc6:     lda $96            ; $acc6: a5 96     
            cmp #$0a           ; $acc8: c9 0a     
            bne __acd5         ; $acca: d0 09     
            lda $53            ; $accc: a5 53     
            cmp #$01           ; $acce: c9 01     
            beq __acd5         ; $acd0: f0 03     
            jsr __abd0         ; $acd2: 20 d0 ab  
__acd5:     rts                ; $acd5: 60        

;-------------------------------------------------------------------------------
__acd6:     lda $53            ; $acd6: a5 53     
            cmp #$03           ; $acd8: c9 03     
            bne __ace3         ; $acda: d0 07     
            ldy $96            ; $acdc: a4 96     
            cpy #$01           ; $acde: c0 01     
            beq __ace3         ; $ace0: f0 01     
            rts                ; $ace2: 60        

;-------------------------------------------------------------------------------
__ace3:     sec                ; $ace3: 38        
            sbc #$01           ; $ace4: e9 01     
            asl                ; $ace6: 0a        
            tax                ; $ace7: aa        
            lda __842b,x       ; $ace8: bd 2b 84  
            sta $02            ; $aceb: 85 02     
            lda __842c,x       ; $aced: bd 2c 84  
            sta $03            ; $acf0: 85 03     
            lda __8423,x       ; $acf2: bd 23 84  
            sta $00            ; $acf5: 85 00     
            lda __8424,x       ; $acf7: bd 24 84  
            sta $01            ; $acfa: 85 01     
__acfc:     jsr __af00         ; $acfc: 20 00 af  
            bne __ad18         ; $acff: d0 17     
            lda $53            ; $ad01: a5 53     
            cmp #$03           ; $ad03: c9 03     
            bne __ad1c         ; $ad05: d0 15     
            lda $01            ; $ad07: a5 01     
            cmp #$c9           ; $ad09: c9 c9     
            beq __ad1c         ; $ad0b: f0 0f     
            lda #$70           ; $ad0d: a9 70     
            sta $00            ; $ad0f: 85 00     
            lda #$c9           ; $ad11: a9 c9     
            sta $01            ; $ad13: 85 01     
            jmp __acfc         ; $ad15: 4c fc ac  

;-------------------------------------------------------------------------------
__ad18:     lda #$ff           ; $ad18: a9 ff     
            sta $96            ; $ad1a: 85 96     
__ad1c:     rts                ; $ad1c: 60        

;-------------------------------------------------------------------------------
__ad1d:     lda #$80           ; $ad1d: a9 80     
            sta $0a            ; $ad1f: 85 0a     
            lda #$80           ; $ad21: a9 80     
            sta $0b            ; $ad23: 85 0b     
            jsr __9ef5         ; $ad25: 20 f5 9e  
            bne __ad2b         ; $ad28: d0 01     
            rts                ; $ad2a: 60        

;-------------------------------------------------------------------------------
__ad2b:     lda $53            ; $ad2b: a5 53     
            cmp #$01           ; $ad2d: c9 01     
            bne __ad37         ; $ad2f: d0 06     
            jsr __aee6         ; $ad31: 20 e6 ae  
            jmp __ad3a         ; $ad34: 4c 3a ad  

;-------------------------------------------------------------------------------
__ad37:     jsr __aeee         ; $ad37: 20 ee ae  
__ad3a:     stx $04            ; $ad3a: 86 04     
            jsr __a9fd         ; $ad3c: 20 fd a9  
            lda $bf            ; $ad3f: a5 bf     
            cmp #$01           ; $ad41: c9 01     
            bne __ad49         ; $ad43: d0 04     
            ldy #$02           ; $ad45: a0 02     
            sty $ff            ; $ad47: 84 ff     
__ad49:     cmp #$0b           ; $ad49: c9 0b     
            beq __ad62         ; $ad4b: f0 15     
            ldx $bf            ; $ad4d: a6 bf     
            dex                ; $ad4f: ca        
            lda __81ec,x       ; $ad50: bd ec 81  
            sta $02            ; $ad53: 85 02     
            jsr __a9ec         ; $ad55: 20 ec a9  
            ldx $04            ; $ad58: a6 04     
            lda #$02           ; $ad5a: a9 02     
            jsr __ad7d         ; $ad5c: 20 7d ad  
            inc $bf            ; $ad5f: e6 bf     
            rts                ; $ad61: 60        

;-------------------------------------------------------------------------------
__ad62:     lda $53            ; $ad62: a5 53     
            cmp #$01           ; $ad64: c9 01     
            bne __ad6d         ; $ad66: d0 05     
            lda #$03           ; $ad68: a9 03     
            jsr __ad7d         ; $ad6a: 20 7d ad  
__ad6d:     jsr __a9e2         ; $ad6d: 20 e2 a9  
            jsr __afa5         ; $ad70: 20 a5 af  
            ldx #$02           ; $ad73: a2 02     
            jsr __8ee5         ; $ad75: 20 e5 8e  
            lda #$00           ; $ad78: a9 00     
            sta $bf            ; $ad7a: 85 bf     
            rts                ; $ad7c: 60        

;-------------------------------------------------------------------------------
__ad7d:     sta $0202,x        ; $ad7d: 9d 02 02  
            sta $0206,x        ; $ad80: 9d 06 02  
            sta $020a,x        ; $ad83: 9d 0a 02  
            sta $020e,x        ; $ad86: 9d 0e 02  
            rts                ; $ad89: 60        

;-------------------------------------------------------------------------------
__ad8a:     ldy $53            ; $ad8a: a4 53     
            cpy #$01           ; $ad8c: c0 01     
            bne __ad91         ; $ad8e: d0 01     
            rts                ; $ad90: 60        

;-------------------------------------------------------------------------------
__ad91:     lda $be            ; $ad91: a5 be     
            beq __ade9         ; $ad93: f0 54     
            cpy #$04           ; $ad95: c0 04     
            bne __ae01         ; $ad97: d0 68     
            ldy #$00           ; $ad99: a0 00     
            ldx __85ff         ; $ad9b: ae ff 85  
__ad9e:     lda __85c2,x       ; $ad9e: bd c2 85  
            cmp $0203          ; $ada1: cd 03 02  
            bne __adf8         ; $ada4: d0 52     
            lda __85ae,x       ; $ada6: bd ae 85  
            cmp $0200          ; $ada9: cd 00 02  
            bcc __adf8         ; $adac: 90 4a     
            sec                ; $adae: 38        
            sbc #$11           ; $adaf: e9 11     
            cmp $0200          ; $adb1: cd 00 02  
            bcs __adf8         ; $adb4: b0 42     
            lda $00c1,y        ; $adb6: b9 c1 00  
            cmp #$00           ; $adb9: c9 00     
            bne __adea         ; $adbb: d0 2d     
            lda $96            ; $adbd: a5 96     
            cmp #$08           ; $adbf: c9 08     
            beq __ade9         ; $adc1: f0 26     
            cmp #$ff           ; $adc3: c9 ff     
            beq __ade9         ; $adc5: f0 22     
            lda #$11           ; $adc7: a9 11     
            sta $cc            ; $adc9: 85 cc     
            lda #$01           ; $adcb: a9 01     
            sta $00c1,y        ; $adcd: 99 c1 00  
            jsr __ae49         ; $add0: 20 49 ae  
            lda $0200          ; $add3: ad 00 02  
            clc                ; $add6: 18        
            adc #$10           ; $add7: 69 10     
            sta $06            ; $add9: 85 06     
            lda $0203          ; $addb: ad 03 02  
            sta $05            ; $adde: 85 05     
            ldx #$00           ; $ade0: a2 00     
            jsr __8ee5         ; $ade2: 20 e5 8e  
            lda #$20           ; $ade5: a9 20     
            sta $fd            ; $ade7: 85 fd     
__ade9:     rts                ; $ade9: 60        

;-------------------------------------------------------------------------------
__adea:     lda $96            ; $adea: a5 96     
            cmp #$04           ; $adec: c9 04     
            beq __adf7         ; $adee: f0 07     
            jsr __ae62         ; $adf0: 20 62 ae  
            lda #$08           ; $adf3: a9 08     
            sta $96            ; $adf5: 85 96     
__adf7:     rts                ; $adf7: 60        

;-------------------------------------------------------------------------------
__adf8:     cpy #$07           ; $adf8: c0 07     
            beq __ae01         ; $adfa: f0 05     
            inx                ; $adfc: e8        
            iny                ; $adfd: c8        
            jmp __ad9e         ; $adfe: 4c 9e ad  

;-------------------------------------------------------------------------------
__ae01:     ldy $53            ; $ae01: a4 53     
            ldx __85fa,y       ; $ae03: be fa 85  
            ldy #$00           ; $ae06: a0 00     
__ae08:     lda __85ae,x       ; $ae08: bd ae 85  
            cmp $0200          ; $ae0b: cd 00 02  
            bne __ae40         ; $ae0e: d0 30     
            lda __85c2,x       ; $ae10: bd c2 85  
            cmp $0203          ; $ae13: cd 03 02  
            bne __ae40         ; $ae16: d0 28     
            lda $00c9,y        ; $ae18: b9 c9 00  
            bne __ae40         ; $ae1b: d0 23     
            lda #$22           ; $ae1d: a9 22     
            sta $cc            ; $ae1f: 85 cc     
            lda #$01           ; $ae21: a9 01     
            sta $00c9,y        ; $ae23: 99 c9 00  
            jsr __ae49         ; $ae26: 20 49 ae  
            lda $0200          ; $ae29: ad 00 02  
            sec                ; $ae2c: 38        
            sbc #$08           ; $ae2d: e9 08     
            sta $06            ; $ae2f: 85 06     
            lda $0203          ; $ae31: ad 03 02  
            sta $05            ; $ae34: 85 05     
            ldx #$03           ; $ae36: a2 03     
            jsr __8ee5         ; $ae38: 20 e5 8e  
            lda #$20           ; $ae3b: a9 20     
            sta $fd            ; $ae3d: 85 fd     
__ae3f:     rts                ; $ae3f: 60        

;-------------------------------------------------------------------------------
__ae40:     cpy #$02           ; $ae40: c0 02     
            beq __ae3f         ; $ae42: f0 fb     
            inx                ; $ae44: e8        
            iny                ; $ae45: c8        
            jmp __ae08         ; $ae46: 4c 08 ae  

;-------------------------------------------------------------------------------
__ae49:     lda #$24           ; $ae49: a9 24     
            sta $cd            ; $ae4b: 85 cd     
            sta $ce            ; $ae4d: 85 ce     
            sta $cf            ; $ae4f: 85 cf     
            sta $d0            ; $ae51: 85 d0     
            lda __85d6,x       ; $ae53: bd d6 85  
            sta $01            ; $ae56: 85 01     
            lda __85e9,x       ; $ae58: bd e9 85  
            sta $00            ; $ae5b: 85 00     
            lda #$48           ; $ae5d: a9 48     
            jmp __87ac         ; $ae5f: 4c ac 87  

;-------------------------------------------------------------------------------
__ae62:     lda $96            ; $ae62: a5 96     
            cmp #$0a           ; $ae64: c9 0a     
            bne __ae82         ; $ae66: d0 1a     
            lda $a0            ; $ae68: a5 a0     
            beq __ae82         ; $ae6a: f0 16     
            sec                ; $ae6c: 38        
            sbc #$01           ; $ae6d: e9 01     
            tax                ; $ae6f: aa        
            lda #$00           ; $ae70: a9 00     
            sta $0451,x        ; $ae72: 9d 51 04  
            txa                ; $ae75: 8a        
            asl                ; $ae76: 0a        
            asl                ; $ae77: 0a        
            asl                ; $ae78: 0a        
            tax                ; $ae79: aa        
            lda #$ff           ; $ae7a: a9 ff     
            sta $02d0,x        ; $ae7c: 9d d0 02  
            sta $02d4,x        ; $ae7f: 9d d4 02  
__ae82:     rts                ; $ae82: 60        

;-------------------------------------------------------------------------------
__ae83:     stx $0f            ; $ae83: 86 0f     
            asl                ; $ae85: 0a        
            tax                ; $ae86: aa        
            lda $042c,x        ; $ae87: bd 2c 04  
            bne __aea5         ; $ae8a: d0 19     
            sta $0436,x        ; $ae8c: 9d 36 04  
            cpx #$00           ; $ae8f: e0 00     
            bne __ae98         ; $ae91: d0 05     
            lda #$08           ; $ae93: a9 08     
            jmp __ae9a         ; $ae95: 4c 9a ae  

;-------------------------------------------------------------------------------
__ae98:     lda #$80           ; $ae98: a9 80     
__ae9a:     sta $0435,x        ; $ae9a: 9d 35 04  
            lda #$f0           ; $ae9d: a9 f0     
            sta $042d,x        ; $ae9f: 9d 2d 04  
            jmp __aebe         ; $aea2: 4c be ae  

;-------------------------------------------------------------------------------
__aea5:     lda $0435,x        ; $aea5: bd 35 04  
            cpx #$00           ; $aea8: e0 00     
            bne __aeb1         ; $aeaa: d0 05     
            adc #$10           ; $aeac: 69 10     
            jmp __aeb3         ; $aeae: 4c b3 ae  

;-------------------------------------------------------------------------------
__aeb1:     adc #$30           ; $aeb1: 69 30     
__aeb3:     sta $0435,x        ; $aeb3: 9d 35 04  
            lda $0436,x        ; $aeb6: bd 36 04  
            adc #$00           ; $aeb9: 69 00     
            sta $0436,x        ; $aebb: 9d 36 04  
__aebe:     lda $042d,x        ; $aebe: bd 2d 04  
            sec                ; $aec1: 38        
            sbc $043d,x        ; $aec2: fd 3d 04  
            sta $042d,x        ; $aec5: 9d 2d 04  
            lda $01            ; $aec8: a5 01     
            sbc $043e,x        ; $aeca: fd 3e 04  
            sta $01            ; $aecd: 85 01     
            clc                ; $aecf: 18        
            lda $042d,x        ; $aed0: bd 2d 04  
            adc $0435,x        ; $aed3: 7d 35 04  
            sta $042d,x        ; $aed6: 9d 2d 04  
            lda $01            ; $aed9: a5 01     
            adc $0436,x        ; $aedb: 7d 36 04  
            sta $01            ; $aede: 85 01     
            inc $042c,x        ; $aee0: fe 2c 04  
            ldx $0f            ; $aee3: a6 0f     
            rts                ; $aee5: 60        

;-------------------------------------------------------------------------------
__aee6:     lda $5d            ; $aee6: a5 5d     
__aee8:     clc                ; $aee8: 18        
            adc #$03           ; $aee9: 69 03     
            jmp __aef3         ; $aeeb: 4c f3 ae  

;-------------------------------------------------------------------------------
__aeee:     lda $ae            ; $aeee: a5 ae     
            clc                ; $aef0: 18        
            adc #$01           ; $aef1: 69 01     
__aef3:     asl                ; $aef3: 0a        
            asl                ; $aef4: 0a        
            asl                ; $aef5: 0a        
            asl                ; $aef6: 0a        
            tax                ; $aef7: aa        
            rts                ; $aef8: 60        

;-------------------------------------------------------------------------------
__aef9:     jsr __87de         ; $aef9: 20 de 87  
__aefc:     lda #$00           ; $aefc: a9 00     
            beq __af06         ; $aefe: f0 06     
__af00:     lda #$01           ; $af00: a9 01     
            bne __af06         ; $af02: d0 02     
__af04:     lda #$02           ; $af04: a9 02     
__af06:     sta $0c            ; $af06: 85 0c     
            txa                ; $af08: 8a        
            pha                ; $af09: 48        
            tya                ; $af0a: 98        
            pha                ; $af0b: 48        
            ldy #$00           ; $af0c: a0 00     
            lda $0c            ; $af0e: a5 0c     
            bne __af29         ; $af10: d0 17     
            jsr __af74         ; $af12: 20 74 af  
            sta $46            ; $af15: 85 46     
            jsr __af7a         ; $af17: 20 7a af  
            sta $47            ; $af1a: 85 47     
            jsr __af73         ; $af1c: 20 73 af  
            sta $48            ; $af1f: 85 48     
            jsr __af7a         ; $af21: 20 7a af  
            sta $49            ; $af24: 85 49     
            jmp __af6a         ; $af26: 4c 6a af  

;-------------------------------------------------------------------------------
__af29:     jsr __af74         ; $af29: 20 74 af  
            sta $4a            ; $af2c: 85 4a     
            jsr __af7a         ; $af2e: 20 7a af  
            sta $4b            ; $af31: 85 4b     
            jsr __af73         ; $af33: 20 73 af  
            sta $4c            ; $af36: 85 4c     
            jsr __af7a         ; $af38: 20 7a af  
            sta $4d            ; $af3b: 85 4d     
            lda $4a            ; $af3d: a5 4a     
            sec                ; $af3f: 38        
            sbc $46            ; $af40: e5 46     
            sta $9c            ; $af42: 85 9c     
            lda $4b            ; $af44: a5 4b     
            sec                ; $af46: 38        
            sbc $47            ; $af47: e5 47     
            sta $9d            ; $af49: 85 9d     
            lda $49            ; $af4b: a5 49     
            cmp $4b            ; $af4d: c5 4b     
            bcc __af68         ; $af4f: 90 17     
            lda $4d            ; $af51: a5 4d     
            cmp $47            ; $af53: c5 47     
            bcc __af68         ; $af55: 90 11     
            lda $4c            ; $af57: a5 4c     
            cmp $46            ; $af59: c5 46     
            bcc __af68         ; $af5b: 90 0b     
            lda $48            ; $af5d: a5 48     
            cmp $4a            ; $af5f: c5 4a     
            bcc __af68         ; $af61: 90 05     
            lda #$01           ; $af63: a9 01     
            jmp __af6a         ; $af65: 4c 6a af  

;-------------------------------------------------------------------------------
__af68:     lda #$00           ; $af68: a9 00     
__af6a:     sta $0c            ; $af6a: 85 0c     
            pla                ; $af6c: 68        
            tay                ; $af6d: a8        
            pla                ; $af6e: 68        
            tax                ; $af6f: aa        
            lda $0c            ; $af70: a5 0c     
            rts                ; $af72: 60        

;-------------------------------------------------------------------------------
__af73:     iny                ; $af73: c8        
__af74:     lda ($02),y        ; $af74: b1 02     
            clc                ; $af76: 18        
            adc $00            ; $af77: 65 00     
            rts                ; $af79: 60        

;-------------------------------------------------------------------------------
__af7a:     iny                ; $af7a: c8        
            lda ($02),y        ; $af7b: b1 02     
            clc                ; $af7d: 18        
            adc $01            ; $af7e: 65 01     
            rts                ; $af80: 60        

;-------------------------------------------------------------------------------
__af81:     sta $02            ; $af81: 85 02     
            jsr __a9f2         ; $af83: 20 f2 a9  
__af86:     jsr __a9de         ; $af86: 20 de a9  
__af89:     lda $57            ; $af89: a5 57     
            and #$03           ; $af8b: 29 03     
            lsr                ; $af8d: 4a        
            jmp __afa7         ; $af8e: 4c a7 af  

;-------------------------------------------------------------------------------
__af91:     sta $04            ; $af91: 85 04     
__af93:     lda #$00           ; $af93: a9 00     
            beq __afa7         ; $af95: f0 10     
__af97:     sta $04            ; $af97: 85 04     
__af99:     lda #$01           ; $af99: a9 01     
            bne __afa7         ; $af9b: d0 0a     
__af9d:     sta $04            ; $af9d: 85 04     
__af9f:     lda #$04           ; $af9f: a9 04     
            bne __afa7         ; $afa1: d0 04     
__afa3:     sta $03            ; $afa3: 85 03     
__afa5:     lda #$0f           ; $afa5: a9 0f     
__afa7:     pha                ; $afa7: 48        
            sta $0f            ; $afa8: 85 0f     
            txa                ; $afaa: 8a        
            pha                ; $afab: 48        
            tya                ; $afac: 98        
            pha                ; $afad: 48        
            lda $00            ; $afae: a5 00     
            pha                ; $afb0: 48        
            lda $05            ; $afb1: a5 05     
            pha                ; $afb3: 48        
            .hex a5            ; $afb4: a5        Suspected data
__afb5:     asl $48            ; $afb5: 06 48     
            lda $07            ; $afb7: a5 07     
            pha                ; $afb9: 48        
            lda $08            ; $afba: a5 08     
            pha                ; $afbc: 48        
            lda $09            ; $afbd: a5 09     
            pha                ; $afbf: 48        
            lda #$02           ; $afc0: a9 02     
            sta $05            ; $afc2: 85 05     
            lda $0f            ; $afc4: a5 0f     
            cmp #$04           ; $afc6: c9 04     
            beq __b000         ; $afc8: f0 36     
            lda #$0f           ; $afca: a9 0f     
            and $03            ; $afcc: 25 03     
            sta $07            ; $afce: 85 07     
            lda $03            ; $afd0: a5 03     
            lsr                ; $afd2: 4a        
            lsr                ; $afd3: 4a        
            lsr                ; $afd4: 4a        
            lsr                ; $afd5: 4a        
            sta $06            ; $afd6: 85 06     
            tax                ; $afd8: aa        
            lda #$00           ; $afd9: a9 00     
            clc                ; $afdb: 18        
__afdc:     adc $07            ; $afdc: 65 07     
            dex                ; $afde: ca        
            bne __afdc         ; $afdf: d0 fb     
            sta $08            ; $afe1: 85 08     
            lda $0f            ; $afe3: a5 0f     
            bne __afed         ; $afe5: d0 06     
            jsr __b02f         ; $afe7: 20 2f b0  
            jmp __affa         ; $afea: 4c fa af  

;-------------------------------------------------------------------------------
__afed:     cmp #$01           ; $afed: c9 01     
            beq __aff7         ; $afef: f0 06     
            jsr __b0a6         ; $aff1: 20 a6 b0  
            jmp __b003         ; $aff4: 4c 03 b0  

;-------------------------------------------------------------------------------
__aff7:     jsr __b072         ; $aff7: 20 72 b0  
__affa:     jsr __b04a         ; $affa: 20 4a b0  
            jmp __b003         ; $affd: 4c 03 b0  

;-------------------------------------------------------------------------------
__b000:     jsr __b01b         ; $b000: 20 1b b0  
__b003:     pla                ; $b003: 68        
            sta $09            ; $b004: 85 09     
            pla                ; $b006: 68        
            sta $08            ; $b007: 85 08     
            pla                ; $b009: 68        
            sta $07            ; $b00a: 85 07     
            pla                ; $b00c: 68        
            sta $06            ; $b00d: 85 06     
            pla                ; $b00f: 68        
            sta $05            ; $b010: 85 05     
            pla                ; $b012: 68        
            sta $00            ; $b013: 85 00     
            pla                ; $b015: 68        
            tay                ; $b016: a8        
            pla                ; $b017: 68        
            tax                ; $b018: aa        
            pla                ; $b019: 68        
            rts                ; $b01a: 60        

;-------------------------------------------------------------------------------
__b01b:     ldx $03            ; $b01b: a6 03     
            ldy #$00           ; $b01d: a0 00     
__b01f:     lda #$ff           ; $b01f: a9 ff     
            sta ($04),y        ; $b021: 91 04     
            iny                ; $b023: c8        
            iny                ; $b024: c8        
            lda $02            ; $b025: a5 02     
            sta ($04),y        ; $b027: 91 04     
            iny                ; $b029: c8        
            iny                ; $b02a: c8        
            dex                ; $b02b: ca        
            bne __b01f         ; $b02c: d0 f1     
            rts                ; $b02e: 60        

;-------------------------------------------------------------------------------
__b02f:     lda $02            ; $b02f: a5 02     
            ldx $08            ; $b031: a6 08     
            ldy #$01           ; $b033: a0 01     
__b035:     sta ($04),y        ; $b035: 91 04     
            clc                ; $b037: 18        
            adc #$01           ; $b038: 69 01     
            iny                ; $b03a: c8        
            pha                ; $b03b: 48        
            lda ($04),y        ; $b03c: b1 04     
            and #$3f           ; $b03e: 29 3f     
            sta ($04),y        ; $b040: 91 04     
            pla                ; $b042: 68        
            iny                ; $b043: c8        
            iny                ; $b044: c8        
            iny                ; $b045: c8        
            dex                ; $b046: ca        
            bne __b035         ; $b047: d0 ec     
            rts                ; $b049: 60        

;-------------------------------------------------------------------------------
__b04a:     ldy #$00           ; $b04a: a0 00     
__b04c:     ldx $06            ; $b04c: a6 06     
            lda $01            ; $b04e: a5 01     
            sta $09            ; $b050: 85 09     
__b052:     lda $09            ; $b052: a5 09     
            sta ($04),y        ; $b054: 91 04     
            clc                ; $b056: 18        
            adc #$08           ; $b057: 69 08     
            sta $09            ; $b059: 85 09     
            iny                ; $b05b: c8        
            iny                ; $b05c: c8        
            iny                ; $b05d: c8        
            lda $00            ; $b05e: a5 00     
            sta ($04),y        ; $b060: 91 04     
            iny                ; $b062: c8        
            dex                ; $b063: ca        
            bne __b052         ; $b064: d0 ec     
            lda $00            ; $b066: a5 00     
            clc                ; $b068: 18        
            adc #$08           ; $b069: 69 08     
            sta $00            ; $b06b: 85 00     
            dec $07            ; $b06d: c6 07     
            bne __b04c         ; $b06f: d0 db     
            rts                ; $b071: 60        

;-------------------------------------------------------------------------------
__b072:     ldy #$01           ; $b072: a0 01     
            sty $0a            ; $b074: 84 0a     
            lda $08            ; $b076: a5 08     
            sec                ; $b078: 38        
            sbc $06            ; $b079: e5 06     
__b07b:     tay                ; $b07b: a8        
            sta $0b            ; $b07c: 85 0b     
            ldx $06            ; $b07e: a6 06     
__b080:     tya                ; $b080: 98        
            pha                ; $b081: 48        
            clc                ; $b082: 18        
            tya                ; $b083: 98        
            adc $02            ; $b084: 65 02     
            ldy $0a            ; $b086: a4 0a     
            sta ($04),y        ; $b088: 91 04     
            iny                ; $b08a: c8        
            lda ($04),y        ; $b08b: b1 04     
            and #$3f           ; $b08d: 29 3f     
            eor #$40           ; $b08f: 49 40     
            sta ($04),y        ; $b091: 91 04     
            iny                ; $b093: c8        
            iny                ; $b094: c8        
            iny                ; $b095: c8        
            sty $0a            ; $b096: 84 0a     
            pla                ; $b098: 68        
            tay                ; $b099: a8        
            iny                ; $b09a: c8        
            dex                ; $b09b: ca        
            bne __b080         ; $b09c: d0 e2     
            lda $0b            ; $b09e: a5 0b     
            sec                ; $b0a0: 38        
            sbc $06            ; $b0a1: e5 06     
            bpl __b07b         ; $b0a3: 10 d6     
            rts                ; $b0a5: 60        

;-------------------------------------------------------------------------------
__b0a6:     ldy #$00           ; $b0a6: a0 00     
__b0a8:     ldx $06            ; $b0a8: a6 06     
            lda $01            ; $b0aa: a5 01     
            sta $09            ; $b0ac: 85 09     
            lda #$ff           ; $b0ae: a9 ff     
__b0b0:     sta ($04),y        ; $b0b0: 91 04     
            iny                ; $b0b2: c8        
            iny                ; $b0b3: c8        
            iny                ; $b0b4: c8        
            iny                ; $b0b5: c8        
            dex                ; $b0b6: ca        
            bne __b0b0         ; $b0b7: d0 f7     
            lda $00            ; $b0b9: a5 00     
            clc                ; $b0bb: 18        
            adc #$08           ; $b0bc: 69 08     
            sta $00            ; $b0be: 85 00     
            dec $07            ; $b0c0: c6 07     
            bne __b0a8         ; $b0c2: d0 e4     
            rts                ; $b0c4: 60        

;-------------------------------------------------------------------------------
__b0c5:     lda $2002          ; $b0c5: ad 02 20  
            lda $10            ; $b0c8: a5 10     
            and #$fb           ; $b0ca: 29 fb     
            sta $2000          ; $b0cc: 8d 00 20  
            lda #$20           ; $b0cf: a9 20     
            sta $2006          ; $b0d1: 8d 06 20  
            lda #$00           ; $b0d4: a9 00     
            sta $2006          ; $b0d6: 8d 06 20  
            ldx #$04           ; $b0d9: a2 04     
            ldy #$00           ; $b0db: a0 00     
            lda #$24           ; $b0dd: a9 24     
__b0df:     sta $2007          ; $b0df: 8d 07 20  
            dey                ; $b0e2: 88        
            bne __b0df         ; $b0e3: d0 fa     
            dex                ; $b0e5: ca        
            bne __b0df         ; $b0e6: d0 f7     
            lda #$23           ; $b0e8: a9 23     
            sta $2006          ; $b0ea: 8d 06 20  
            lda #$c0           ; $b0ed: a9 c0     
            sta $2006          ; $b0ef: 8d 06 20  
            ldy #$40           ; $b0f2: a0 40     
            lda #$00           ; $b0f4: a9 00     
__b0f6:     sta $2007          ; $b0f6: 8d 07 20  
            dey                ; $b0f9: 88        
            bne __b0f6         ; $b0fa: d0 fa     
            rts                ; $b0fc: 60        

;-------------------------------------------------------------------------------
__b0fd:     lda #$04           ; $b0fd: a9 04     
__b0ff:     lsr $00            ; $b0ff: 46 00     
            bcc __b108         ; $b101: 90 05     
            pha                ; $b103: 48        
            jsr __b10e         ; $b104: 20 0e b1  
            pla                ; $b107: 68        
__b108:     clc                ; $b108: 18        
            sbc #$00           ; $b109: e9 00     
            bpl __b0ff         ; $b10b: 10 f2     
            rts                ; $b10d: 60        

;-------------------------------------------------------------------------------
__b10e:     asl                ; $b10e: 0a        
            asl                ; $b10f: 0a        
            tay                ; $b110: a8        
            sta $01            ; $b111: 85 01     
            ldx $0330          ; $b113: ae 30 03  
            lda __8000,y       ; $b116: b9 00 80  
            sta $0331,x        ; $b119: 9d 31 03  
            jsr __b197         ; $b11c: 20 97 b1  
            iny                ; $b11f: c8        
            lda __8000,y       ; $b120: b9 00 80  
            sta $0331,x        ; $b123: 9d 31 03  
            jsr __b197         ; $b126: 20 97 b1  
            iny                ; $b129: c8        
            lda __8000,y       ; $b12a: b9 00 80  
            and #$87           ; $b12d: 29 87     
            sta $0331,x        ; $b12f: 9d 31 03  
            and #$07           ; $b132: 29 07     
            sta $02            ; $b134: 85 02     
            txa                ; $b136: 8a        
            sec                ; $b137: 38        
            adc $02            ; $b138: 65 02     
            jsr __b199         ; $b13a: 20 99 b1  
            tax                ; $b13d: aa        
            stx $0330          ; $b13e: 8e 30 03  
            lda #$00           ; $b141: a9 00     
            sta $0331,x        ; $b143: 9d 31 03  
            iny                ; $b146: c8        
            lda __8000,y       ; $b147: b9 00 80  
            sta $03            ; $b14a: 85 03     
            dex                ; $b14c: ca        
            clc                ; $b14d: 18        
__b14e:     lda $0020,y        ; $b14e: b9 20 00  
            and #$0f           ; $b151: 29 0f     
            beq __b156         ; $b153: f0 01     
            clc                ; $b155: 18        
__b156:     bcc __b15a         ; $b156: 90 02     
            lda #$24           ; $b158: a9 24     
__b15a:     sta $0331,x        ; $b15a: 9d 31 03  
            dex                ; $b15d: ca        
            dec $02            ; $b15e: c6 02     
            beq __b184         ; $b160: f0 22     
            lda $0020,y        ; $b162: b9 20 00  
            and #$f0           ; $b165: 29 f0     
            php                ; $b167: 08        
            lsr                ; $b168: 4a        
            lsr                ; $b169: 4a        
__b16a:     lsr                ; $b16a: 4a        
            lsr                ; $b16b: 4a        
            plp                ; $b16c: 28        
            beq __b170         ; $b16d: f0 01     
            clc                ; $b16f: 18        
__b170:     bcc __b174         ; $b170: 90 02     
            lda #$24           ; $b172: a9 24     
__b174:     sta $0331,x        ; $b174: 9d 31 03  
            lda $03            ; $b177: a5 03     
            and #$01           ; $b179: 29 01     
            beq __b17e         ; $b17b: f0 01     
            sec                ; $b17d: 38        
__b17e:     dey                ; $b17e: 88        
            dex                ; $b17f: ca        
            dec $02            ; $b180: c6 02     
            bne __b14e         ; $b182: d0 ca     
__b184:     lda $03            ; $b184: a5 03     
            and #$10           ; $b186: 29 10     
            beq __b196         ; $b188: f0 0c     
            inx                ; $b18a: e8        
            ldy $01            ; $b18b: a4 01     
            clc                ; $b18d: 18        
            lda $0020,y        ; $b18e: b9 20 00  
            adc #$37           ; $b191: 69 37     
            sta $0331,x        ; $b193: 9d 31 03  
__b196:     rts                ; $b196: 60        

;-------------------------------------------------------------------------------
__b197:     inx                ; $b197: e8        
            txa                ; $b198: 8a        
__b199:     cmp #$3f           ; $b199: c9 3f     
            bcc __b1a7         ; $b19b: 90 0a     
            ldx $0330          ; $b19d: ae 30 03  
            lda #$00           ; $b1a0: a9 00     
            sta $0331,x        ; $b1a2: 9d 31 03  
            pla                ; $b1a5: 68        
            pla                ; $b1a6: 68        
__b1a7:     rts                ; $b1a7: 60        

;-------------------------------------------------------------------------------
__b1a8:     ldx #$ff           ; $b1a8: a2 ff     
            bne __b1ae         ; $b1aa: d0 02     
__b1ac:     ldx #$00           ; $b1ac: a2 00     
__b1ae:     stx $04            ; $b1ae: 86 04     
            ldx #$00           ; $b1b0: a2 00     
            stx $05            ; $b1b2: 86 05     
            stx $06            ; $b1b4: 86 06     
            stx $07            ; $b1b6: 86 07     
            lda $01            ; $b1b8: a5 01     
            and #$08           ; $b1ba: 29 08     
            bne __b1bf         ; $b1bc: d0 01     
            inx                ; $b1be: e8        
__b1bf:     lda $00            ; $b1bf: a5 00     
            sta $06,x          ; $b1c1: 95 06     
            lda $01            ; $b1c3: a5 01     
            jmp __b1c8         ; $b1c5: 4c c8 b1  

;-------------------------------------------------------------------------------
__b1c8:     and #$07           ; $b1c8: 29 07     
            asl                ; $b1ca: 0a        
            asl                ; $b1cb: 0a        
            tax                ; $b1cc: aa        
            lda $04            ; $b1cd: a5 04     
            beq __b1f8         ; $b1cf: f0 27     
            lda $24,x          ; $b1d1: b5 24     
            beq __b1fc         ; $b1d3: f0 27     
__b1d5:     clc                ; $b1d5: 18        
            lda $27,x          ; $b1d6: b5 27     
            sta $03            ; $b1d8: 85 03     
            lda $07            ; $b1da: a5 07     
            jsr __b24d         ; $b1dc: 20 4d b2  
            sta $27,x          ; $b1df: 95 27     
            lda $26,x          ; $b1e1: b5 26     
            sta $03            ; $b1e3: 85 03     
            lda $06            ; $b1e5: a5 06     
            jsr __b24d         ; $b1e7: 20 4d b2  
            sta $26,x          ; $b1ea: 95 26     
            lda $25,x          ; $b1ec: b5 25     
            sta $03            ; $b1ee: 85 03     
            lda $05            ; $b1f0: a5 05     
            jsr __b24d         ; $b1f2: 20 4d b2  
            sta $25,x          ; $b1f5: 95 25     
            rts                ; $b1f7: 60        

;-------------------------------------------------------------------------------
__b1f8:     lda $24,x          ; $b1f8: b5 24     
            beq __b1d5         ; $b1fa: f0 d9     
__b1fc:     sec                ; $b1fc: 38        
            lda $27,x          ; $b1fd: b5 27     
            sta $03            ; $b1ff: 85 03     
            lda $07            ; $b201: a5 07     
            jsr __b26e         ; $b203: 20 6e b2  
            sta $27,x          ; $b206: 95 27     
            lda $26,x          ; $b208: b5 26     
            sta $03            ; $b20a: 85 03     
            lda $06            ; $b20c: a5 06     
            jsr __b26e         ; $b20e: 20 6e b2  
            sta $26,x          ; $b211: 95 26     
            lda $25,x          ; $b213: b5 25     
            sta $03            ; $b215: 85 03     
            lda $05            ; $b217: a5 05     
            jsr __b26e         ; $b219: 20 6e b2  
            sta $25,x          ; $b21c: 95 25     
            lda $25,x          ; $b21e: b5 25     
            bne __b22a         ; $b220: d0 08     
            lda $26,x          ; $b222: b5 26     
            bne __b22a         ; $b224: d0 04     
            lda $27,x          ; $b226: b5 27     
            beq __b230         ; $b228: f0 06     
__b22a:     bcs __b24c         ; $b22a: b0 20     
            lda $24,x          ; $b22c: b5 24     
            eor #$ff           ; $b22e: 49 ff     
__b230:     sta $24,x          ; $b230: 95 24     
            sec                ; $b232: 38        
            lda #$00           ; $b233: a9 00     
            sta $03            ; $b235: 85 03     
            lda $27,x          ; $b237: b5 27     
            jsr __b26e         ; $b239: 20 6e b2  
            sta $27,x          ; $b23c: 95 27     
            lda $26,x          ; $b23e: b5 26     
            jsr __b26e         ; $b240: 20 6e b2  
            sta $26,x          ; $b243: 95 26     
            lda $25,x          ; $b245: b5 25     
            jsr __b26e         ; $b247: 20 6e b2  
            sta $25,x          ; $b24a: 95 25     
__b24c:     rts                ; $b24c: 60        

;-------------------------------------------------------------------------------
__b24d:     jsr __b290         ; $b24d: 20 90 b2  
            adc $01            ; $b250: 65 01     
            cmp #$0a           ; $b252: c9 0a     
            bcc __b258         ; $b254: 90 02     
            adc #$05           ; $b256: 69 05     
__b258:     clc                ; $b258: 18        
            adc $02            ; $b259: 65 02     
            sta $02            ; $b25b: 85 02     
            lda $03            ; $b25d: a5 03     
            and #$f0           ; $b25f: 29 f0     
            adc $02            ; $b261: 65 02     
            bcc __b269         ; $b263: 90 04     
__b265:     adc #$5f           ; $b265: 69 5f     
            sec                ; $b267: 38        
            rts                ; $b268: 60        

;-------------------------------------------------------------------------------
__b269:     cmp #$a0           ; $b269: c9 a0     
            bcs __b265         ; $b26b: b0 f8     
            rts                ; $b26d: 60        

;-------------------------------------------------------------------------------
__b26e:     jsr __b290         ; $b26e: 20 90 b2  
            sbc $01            ; $b271: e5 01     
            sta $01            ; $b273: 85 01     
            bcs __b281         ; $b275: b0 0a     
            adc #$0a           ; $b277: 69 0a     
            sta $01            ; $b279: 85 01     
            lda $02            ; $b27b: a5 02     
            adc #$0f           ; $b27d: 69 0f     
            sta $02            ; $b27f: 85 02     
__b281:     lda $03            ; $b281: a5 03     
            and #$f0           ; $b283: 29 f0     
            sec                ; $b285: 38        
            sbc $02            ; $b286: e5 02     
            bcs __b28d         ; $b288: b0 03     
            adc #$a0           ; $b28a: 69 a0     
            clc                ; $b28c: 18        
__b28d:     ora $01            ; $b28d: 05 01     
            rts                ; $b28f: 60        

;-------------------------------------------------------------------------------
__b290:     pha                ; $b290: 48        
            and #$0f           ; $b291: 29 0f     
            sta $01            ; $b293: 85 01     
            pla                ; $b295: 68        
            and #$f0           ; $b296: 29 f0     
            sta $02            ; $b298: 85 02     
            lda $03            ; $b29a: a5 03     
            and #$0f           ; $b29c: 29 0f     
            rts                ; $b29e: 60        

;-------------------------------------------------------------------------------
__b29f:     lda #$00           ; $b29f: a9 00     
            sta $04            ; $b2a1: 85 04     
            clc                ; $b2a3: 18        
            lda $00            ; $b2a4: a5 00     
            adc #$10           ; $b2a6: 69 10     
            and #$f0           ; $b2a8: 29 f0     
            lsr                ; $b2aa: 4a        
            lsr                ; $b2ab: 4a        
            tay                ; $b2ac: a8        
            lda $00            ; $b2ad: a5 00     
            and #$07           ; $b2af: 29 07     
            asl                ; $b2b1: 0a        
            asl                ; $b2b2: 0a        
            tax                ; $b2b3: aa        
__b2b4:     lda $0020,y        ; $b2b4: b9 20 00  
            beq __b30a         ; $b2b7: f0 51     
            lda $24,x          ; $b2b9: b5 24     
            beq __b2e3         ; $b2bb: f0 26     
__b2bd:     sec                ; $b2bd: 38        
            lda $0023,y        ; $b2be: b9 23 00  
            sta $03            ; $b2c1: 85 03     
            lda $27,x          ; $b2c3: b5 27     
            jsr __b26e         ; $b2c5: 20 6e b2  
            lda $0022,y        ; $b2c8: b9 22 00  
            sta $03            ; $b2cb: 85 03     
            lda $26,x          ; $b2cd: b5 26     
            jsr __b26e         ; $b2cf: 20 6e b2  
            lda $0021,y        ; $b2d2: b9 21 00  
            sta $03            ; $b2d5: 85 03     
            lda $25,x          ; $b2d7: b5 25     
            jsr __b26e         ; $b2d9: 20 6e b2  
            bcs __b30e         ; $b2dc: b0 30     
            lda $0020,y        ; $b2de: b9 20 00  
            bne __b313         ; $b2e1: d0 30     
__b2e3:     lda #$ff           ; $b2e3: a9 ff     
            sta $04            ; $b2e5: 85 04     
            sec                ; $b2e7: 38        
__b2e8:     tya                ; $b2e8: 98        
            bne __b309         ; $b2e9: d0 1e     
            bcc __b2fd         ; $b2eb: 90 10     
            lda $24,x          ; $b2ed: b5 24     
            sta $20            ; $b2ef: 85 20     
            lda $25,x          ; $b2f1: b5 25     
            sta $21            ; $b2f3: 85 21     
            lda $26,x          ; $b2f5: b5 26     
            sta $22            ; $b2f7: 85 22     
            lda $27,x          ; $b2f9: b5 27     
            sta $23            ; $b2fb: 85 23     
__b2fd:     lda $00            ; $b2fd: a5 00     
            and #$08           ; $b2ff: 29 08     
            beq __b309         ; $b301: f0 06     
            dex                ; $b303: ca        
            dex                ; $b304: ca        
            dex                ; $b305: ca        
            dex                ; $b306: ca        
            bpl __b2b4         ; $b307: 10 ab     
__b309:     rts                ; $b309: 60        

;-------------------------------------------------------------------------------
__b30a:     lda $24,x          ; $b30a: b5 24     
            beq __b2bd         ; $b30c: f0 af     
__b30e:     lda $0020,y        ; $b30e: b9 20 00  
            bne __b2e3         ; $b311: d0 d0     
__b313:     clc                ; $b313: 18        
            bcc __b2e8         ; $b314: 90 d2     
__b316:     ldx #$09           ; $b316: a2 09     
            dec $34            ; $b318: c6 34     
            bpl __b322         ; $b31a: 10 06     
            lda #$0a           ; $b31c: a9 0a     
            sta $34            ; $b31e: 85 34     
            ldx #$10           ; $b320: a2 10     
__b322:     lda $35,x          ; $b322: b5 35     
            beq __b328         ; $b324: f0 02     
            dec $35,x          ; $b326: d6 35     
__b328:     dex                ; $b328: ca        
            bpl __b322         ; $b329: 10 f7     
            rts                ; $b32b: 60        

;-------------------------------------------------------------------------------
__b32c:     ldx $0330          ; $b32c: ae 30 03  
            lda $01            ; $b32f: a5 01     
            sta $0331,x        ; $b331: 9d 31 03  
            jsr __b197         ; $b334: 20 97 b1  
            lda $00            ; $b337: a5 00     
            sta $0331,x        ; $b339: 9d 31 03  
            jsr __b197         ; $b33c: 20 97 b1  
            lda #$01           ; $b33f: a9 01     
            sta $0331,x        ; $b341: 9d 31 03  
            jsr __b197         ; $b344: 20 97 b1  
            tya                ; $b347: 98        
            sta $0331,x        ; $b348: 9d 31 03  
            jsr __b197         ; $b34b: 20 97 b1  
            lda #$00           ; $b34e: a9 00     
            sta $0331,x        ; $b350: 9d 31 03  
            stx $0330          ; $b353: 8e 30 03  
            rts                ; $b356: 60        

;-------------------------------------------------------------------------------
            .hex 3f 00 20      ; $b357: 3f 00 20  Invalid Opcode - RLA $2000,x
            .hex 0f 15 2c      ; $b35a: 0f 15 2c  Invalid Opcode - SLO $2c15
            .hex 12            ; $b35d: 12        Invalid Opcode - KIL 
            .hex 0f 27 02      ; $b35e: 0f 27 02  Invalid Opcode - SLO $0227
            .hex 17 0f         ; $b361: 17 0f     Invalid Opcode - SLO $0f,x
            bmi __b39b         ; $b363: 30 36     
            asl $0f            ; $b365: 06 0f     
            bmi __b395         ; $b367: 30 2c     
            bit $0f            ; $b369: 24 0f     
            .hex 02            ; $b36b: 02        Invalid Opcode - KIL 
            rol $16,x          ; $b36c: 36 16     
            .hex 0f 30 27      ; $b36e: 0f 30 27  Invalid Opcode - SLO $2730
            bit $0f            ; $b371: 24 0f     
            asl $30,x          ; $b373: 16 30     
            .hex 37 0f         ; $b375: 37 0f     Invalid Opcode - RLA $0f,x
            asl $27            ; $b377: 06 27     
            .hex 02            ; $b379: 02        Invalid Opcode - KIL 
            .hex 23 c0         ; $b37a: 23 c0     Invalid Opcode - RLA ($c0,x)
            pha                ; $b37c: 48        
            .hex ff 23 c8      ; $b37d: ff 23 c8  Invalid Opcode - ISC __c823,x
            .hex 03 55         ; $b380: 03 55     Invalid Opcode - SLO ($55,x)
            tax                ; $b382: aa        
            .hex 22            ; $b383: 22        Invalid Opcode - KIL 
            .hex 23 cd         ; $b384: 23 cd     Invalid Opcode - RLA ($cd,x)
            .hex 43 0f         ; $b386: 43 0f     Invalid Opcode - SRE ($0f,x)
            jsr __c72c         ; $b388: 20 2c c7  
            .hex 3f 20 81      ; $b38b: 3f 20 81  Invalid Opcode - RLA __8120,x
            sty $50            ; $b38e: 84 50     
            eor ($52),y        ; $b390: 51 52     
            .hex 53 20         ; $b392: 53 20     Invalid Opcode - SRE ($20),y
            .hex 82            ; $b394: 82        Suspected data
__b395:     sty $54            ; $b395: 84 54     
            eor $56,x          ; $b397: 55 56     
            .hex 57 20         ; $b399: 57 20     Invalid Opcode - SRE $20,x
__b39b:     .hex 83 84         ; $b39b: 83 84     Invalid Opcode - SAX ($84,x)
            cli                ; $b39d: 58        
            eor $5b5a,y        ; $b39e: 59 5a 5b  
            jsr __c72a         ; $b3a1: 20 2a c7  
            .hex 3f 20 ad      ; $b3a4: 3f 20 ad  Invalid Opcode - RLA __ad20,x
            lsr $30            ; $b3a7: 46 30     
            jsr $43ca          ; $b3a9: 20 ca 43  
            bmi __b3ce         ; $b3ac: 30 20     
            .hex d2            ; $b3ae: d2        Invalid Opcode - KIL 
            .hex c2 3f         ; $b3af: c2 3f     Invalid Opcode - NOP #$3f
            and ($02,x)        ; $b3b1: 21 02     
            lsr $2130          ; $b3b3: 4e 30 21  
            bpl __b3c4         ; $b3b6: 10 0c     
            rol $453e,x        ; $b3b8: 3e 3e 45  
            and $3d3d,x        ; $b3bb: 3d 3d 3d  
            .hex 3c 3c 3c      ; $b3be: 3c 3c 3c  Invalid Opcode - NOP $3c3c,x
            .hex 3b 3b 3b      ; $b3c1: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
__b3c4:     and ($2d,x)        ; $b3c4: 21 2d     
            .hex 0f 3f 24      ; $b3c6: 0f 3f 24  Invalid Opcode - SLO $243f
            bit $37            ; $b3c9: 24 37     
            .hex 37 37         ; $b3cb: 37 37     Invalid Opcode - RLA $37,x
            .hex 36            ; $b3cd: 36        Suspected data
__b3ce:     rol $36,x          ; $b3ce: 36 36     
            and $35,x          ; $b3d0: 35 35     
            and $49,x          ; $b3d2: 35 49     
            .hex 34 34         ; $b3d4: 34 34     Invalid Opcode - NOP $34,x
            and ($59,x)        ; $b3d6: 21 59     
            ora ($3f,x)        ; $b3d8: 01 3f     
            and ($6d,x)        ; $b3da: 21 6d     
            ora ($40),y        ; $b3dc: 11 40     
            sec                ; $b3de: 38        
            sec                ; $b3df: 38        
            and $3939,y        ; $b3e0: 39 39 39  
            .hex 3a            ; $b3e3: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $b3e4: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $b3e5: 3a        Invalid Opcode - NOP 
            .hex 3b 3b 3b      ; $b3e6: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
            .hex 43 3c         ; $b3e9: 43 3c     Invalid Opcode - SRE ($3c,x)
            .hex 3c 3d 3d      ; $b3eb: 3c 3d 3d  Invalid Opcode - NOP $3d3d,x
            and ($84,x)        ; $b3ee: 21 84     
            .hex 1a            ; $b3f0: 1a        Invalid Opcode - NOP 
            and $3d3d,x        ; $b3f1: 3d 3d 3d  
            rol $3e3e,x        ; $b3f4: 3e 3e 3e  
            bmi __b429         ; $b3f7: 30 30     
            bmi __b42c         ; $b3f9: 30 31     
            and ($31),y        ; $b3fb: 31 31     
            .hex 32            ; $b3fd: 32        Invalid Opcode - KIL 
            .hex 32            ; $b3fe: 32        Invalid Opcode - KIL 
            .hex 32            ; $b3ff: 32        Invalid Opcode - KIL 
            .hex 33 33         ; $b400: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 34         ; $b402: 33 34     Invalid Opcode - RLA ($34),y
            eor #$34           ; $b404: 49 34     
            and $35,x          ; $b406: 35 35     
            and $36,x          ; $b408: 35 36     
            rol $21,x          ; $b40a: 36 21     
            ldy $06            ; $b40c: a4 06     
            rol $36,x          ; $b40e: 36 36     
            .hex 4b 37         ; $b410: 4b 37     Invalid Opcode - ALR #$37
            .hex 37 37         ; $b412: 37 37     Invalid Opcode - RLA $37,x
            and ($c6,x)        ; $b414: 21 c6     
__b416:     ora ($3f,x)        ; $b416: 01 3f     
            and ($e2,x)        ; $b418: 21 e2     
            .hex 17 30         ; $b41a: 17 30     Invalid Opcode - SLO $30,x
            bmi __b45c         ; $b41c: 30 3e     
            rol $3d45,x        ; $b41e: 3e 45 3d  
            and $3c3d,x        ; $b421: 3d 3d 3c  
            .hex 43 3c         ; $b424: 43 3c     Invalid Opcode - SRE ($3c,x)
            .hex 3b 3b 3b      ; $b426: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
__b429:     .hex 3a            ; $b429: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $b42a: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $b42b: 3a        Invalid Opcode - NOP 
__b42c:     and $3939,y        ; $b42c: 39 39 39  
            sec                ; $b42f: 38        
            rti                ; $b430: 40        

;-------------------------------------------------------------------------------
            sec                ; $b431: 38        
            and ($ab,x)        ; $b432: 21 ab     
            .hex c2 3f         ; $b434: c2 3f     Invalid Opcode - NOP #$3f
            .hex 22            ; $b436: 22        Invalid Opcode - KIL 
            .hex 04 18         ; $b437: 04 18     Invalid Opcode - NOP $18
            .hex 37 37         ; $b439: 37 37     Invalid Opcode - RLA $37,x
            .hex 37 36         ; $b43b: 37 36     Invalid Opcode - RLA $36,x
            rol $36,x          ; $b43d: 36 36     
            lsr                ; $b43f: 4a        
            and $35,x          ; $b440: 35 35     
            .hex 34 34         ; $b442: 34 34     Invalid Opcode - NOP $34,x
            .hex 34 48         ; $b444: 34 48     Invalid Opcode - NOP $48,x
            .hex 33 33         ; $b446: 33 33     Invalid Opcode - RLA ($33),y
            .hex 32            ; $b448: 32        Invalid Opcode - KIL 
            .hex 32            ; $b449: 32        Invalid Opcode - KIL 
            .hex 32            ; $b44a: 32        Invalid Opcode - KIL 
            and ($31),y        ; $b44b: 31 31     
            and ($30),y        ; $b44d: 31 30     
            bmi __b481         ; $b44f: 30 30     
            .hex 22            ; $b451: 22        Invalid Opcode - KIL 
            bmi __b416         ; $b452: 30 c2     
            .hex 3f 22 39      ; $b454: 3f 22 39  Invalid Opcode - RLA $3922,x
            ora ($3f,x)        ; $b457: 01 3f     
            .hex 22            ; $b459: 22        Invalid Opcode - KIL 
            lsr                ; $b45a: 4a        
            .hex 01            ; $b45b: 01        Suspected data
__b45c:     .hex 3f 22 59      ; $b45c: 3f 22 59  Invalid Opcode - RLA $5922,x
            ora $40            ; $b45f: 05 40     
            sec                ; $b461: 38        
            sec                ; $b462: 38        
            and $2239,y        ; $b463: 39 39 22  
            .hex 64 1a         ; $b466: 64 1a     Invalid Opcode - NOP $1a
            and $3939,y        ; $b468: 39 39 39  
            .hex 3a            ; $b46b: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $b46c: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $b46d: 3a        Invalid Opcode - NOP 
            .hex 42            ; $b46e: 42        Invalid Opcode - KIL 
            .hex 3b 3b 3c      ; $b46f: 3b 3b 3c  Invalid Opcode - RLA $3c3b,y
            .hex 3c 3c 44      ; $b472: 3c 3c 44  Invalid Opcode - NOP $443c,x
            and $3e3d,x        ; $b475: 3d 3d 3e  
            rol $303e,x        ; $b478: 3e 3e 30  
            bmi __b4ad         ; $b47b: 30 30     
            and ($31),y        ; $b47d: 31 31     
            and ($32),y        ; $b47f: 31 32     
__b481:     .hex 32            ; $b481: 32        Invalid Opcode - KIL 
            .hex 22            ; $b482: 22        Invalid Opcode - KIL 
            sty $12            ; $b483: 84 12     
            .hex 32            ; $b485: 32        Invalid Opcode - KIL 
            .hex 32            ; $b486: 32        Invalid Opcode - KIL 
            .hex 47 33         ; $b487: 47 33     Invalid Opcode - SRE $33
            .hex 33 33         ; $b489: 33 33     Invalid Opcode - RLA ($33),y
            .hex 34 34         ; $b48b: 34 34     Invalid Opcode - NOP $34,x
            .hex 34 35         ; $b48d: 34 35     Invalid Opcode - NOP $35,x
            lsr                ; $b48f: 4a        
            and $36,x          ; $b490: 35 36     
            rol $36,x          ; $b492: 36 36     
            .hex 37 37         ; $b494: 37 37     Invalid Opcode - RLA $37,x
            .hex 37 22         ; $b496: 37 22     Invalid Opcode - RLA $22,x
            ldx $01            ; $b498: a6 01     
            .hex 3f 22 ae      ; $b49a: 3f 22 ae  Invalid Opcode - RLA __ae22,x
            .hex c2 3f         ; $b49d: c2 3f     Invalid Opcode - NOP #$3f
            .hex 22            ; $b49f: 22        Invalid Opcode - KIL 
            .hex c2 0b         ; $b4a0: c2 0b     Invalid Opcode - NOP #$0b
            .hex 3b 3b 3a      ; $b4a2: 3b 3b 3a  Invalid Opcode - RLA $3a3b,y
            .hex 3a            ; $b4a5: 3a        Invalid Opcode - NOP 
            eor ($39,x)        ; $b4a6: 41 39     
            and $3839,y        ; $b4a8: 39 39 38  
            sec                ; $b4ab: 38        
            sec                ; $b4ac: 38        
__b4ad:     .hex 22            ; $b4ad: 22        Invalid Opcode - KIL 
            .hex e2 1a         ; $b4ae: e2 1a     Invalid Opcode - NOP #$1a
            .hex 34 34         ; $b4b0: 34 34     Invalid Opcode - NOP $34,x
            .hex 33 33         ; $b4b2: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 32         ; $b4b4: 33 32     Invalid Opcode - RLA ($32),y
            .hex 32            ; $b4b6: 32        Invalid Opcode - KIL 
            .hex 32            ; $b4b7: 32        Invalid Opcode - KIL 
            and ($31),y        ; $b4b8: 31 31     
            lsr $30            ; $b4ba: 46 30     
            bmi __b4ee         ; $b4bc: 30 30     
            rol $3e3e,x        ; $b4be: 3e 3e 3e  
            and $3d3d,x        ; $b4c1: 3d 3d 3d  
            .hex 3c 3c 3c      ; $b4c4: 3c 3c 3c  Invalid Opcode - NOP $3c3c,x
            .hex 3b 3b 3b      ; $b4c7: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
            .hex 23 0c         ; $b4ca: 23 0c     Invalid Opcode - RLA ($0c,x)
            bpl __b50d         ; $b4cc: 10 3f     
            bit $24            ; $b4ce: 24 24     
            bit $37            ; $b4d0: 24 37     
            .hex 37 37         ; $b4d2: 37 37     Invalid Opcode - RLA $37,x
            rol $36,x          ; $b4d4: 36 36     
            rol $35,x          ; $b4d6: 36 35     
            and $35,x          ; $b4d8: 35 35     
            eor #$34           ; $b4da: 49 34     
            .hex 34 23         ; $b4dc: 34 23     Invalid Opcode - NOP $23,x
            and $3f01,y        ; $b4de: 39 01 3f  
            .hex 23 4c         ; $b4e1: 23 4c     Invalid Opcode - RLA ($4c,x)
            .hex 13 3f         ; $b4e3: 13 3f     Invalid Opcode - SLO ($3f),y
            bit $24            ; $b4e5: 24 24     
            bit $38            ; $b4e7: 24 38     
            sec                ; $b4e9: 38        
            sec                ; $b4ea: 38        
            and $3939,y        ; $b4eb: 39 39 39  
__b4ee:     .hex 3a            ; $b4ee: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $b4ef: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $b4f0: 3a        Invalid Opcode - NOP 
            .hex 42            ; $b4f1: 42        Invalid Opcode - KIL 
            .hex 3b 3b 3c      ; $b4f2: 3b 3b 3c  Invalid Opcode - RLA $3c3b,y
            .hex 3c 3c 23      ; $b4f5: 3c 3c 23  Invalid Opcode - NOP $233c,x
            adc ($4f,x)        ; $b4f8: 61 4f     
            bmi __b51f         ; $b4fa: 30 23     
            bvs __b50d         ; $b4fc: 70 0f     
            and ($31),y        ; $b4fe: 31 31     
            and ($32),y        ; $b500: 31 32     
            .hex 32            ; $b502: 32        Invalid Opcode - KIL 
            .hex 32            ; $b503: 32        Invalid Opcode - KIL 
            .hex 33 33         ; $b504: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 34         ; $b506: 33 34     Invalid Opcode - RLA ($34),y
            .hex 34 34         ; $b508: 34 34     Invalid Opcode - NOP $34,x
            and $35,x          ; $b50a: 35 35     
            .hex 35            ; $b50c: 35        Suspected data
__b50d:     .hex 23 24         ; $b50d: 23 24     Invalid Opcode - RLA ($24,x)
            .hex 82 4c         ; $b50f: 82 4c     Invalid Opcode - NOP #$4c
            eor $2523          ; $b511: 4d 23 25  
            .hex 82 4e         ; $b514: 82 4e     Invalid Opcode - NOP #$4e
            .hex 4f 00 3f      ; $b516: 4f 00 3f  Invalid Opcode - SRE $3f00
            brk                ; $b519: 00        
            php                ; $b51a: 08        
            .hex 0f 2c 27      ; $b51b: 0f 2c 27  Invalid Opcode - SLO $272c
            .hex 02            ; $b51e: 02        Invalid Opcode - KIL 
__b51f:     .hex 0f 30 12      ; $b51f: 0f 30 12  Invalid Opcode - SLO $1230
            bit $3f            ; $b522: 24 3f     
            ora $0603,x        ; $b524: 1d 03 06  
            bmi __b53b         ; $b527: 30 12     
            .hex 23 c0         ; $b529: 23 c0     Invalid Opcode - RLA ($c0,x)
            pha                ; $b52b: 48        
            .hex ff 23 c9      ; $b52c: ff 23 c9  Invalid Opcode - ISC __c923,x
            .hex 07 55         ; $b52f: 07 55     Invalid Opcode - SLO $55
            brk                ; $b531: 00        
            tax                ; $b532: aa        
            tax                ; $b533: aa        
            .hex 0f 0f 0f      ; $b534: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            .hex 23 e2         ; $b537: 23 e2     Invalid Opcode - RLA ($e2,x)
            ora $04            ; $b539: 05 04     
__b53b:     brk                ; $b53b: 00        
            brk                ; $b53c: 00        
            brk                ; $b53d: 00        
            ora ($20,x)        ; $b53e: 01 20     
            cmp $02            ; $b540: c5 02     
            bvs __b5b6         ; $b542: 70 72     
            jsr $02e5          ; $b544: 20 e5 02  
            adc ($73),y        ; $b547: 71 73     
            jsr $42ca          ; $b549: 20 ca 42  
            .hex 62            ; $b54c: 62        Invalid Opcode - KIL 
            and ($05,x)        ; $b54d: 21 05     
            lsr $62,x          ; $b54f: 56 62     
            and ($a4,x)        ; $b551: 21 a4     
            cli                ; $b553: 58        
            .hex 62            ; $b554: 62        Invalid Opcode - KIL 
            .hex 22            ; $b555: 22        Invalid Opcode - KIL 
            .hex 43 5a         ; $b556: 43 5a     Invalid Opcode - SRE ($5a,x)
            .hex 62            ; $b558: 62        Invalid Opcode - KIL 
            .hex 22            ; $b559: 22        Invalid Opcode - KIL 
            .hex e2 5c         ; $b55a: e2 5c     Invalid Opcode - NOP #$5c
            .hex 62            ; $b55c: 62        Invalid Opcode - KIL 
            .hex 23 61         ; $b55d: 23 61     Invalid Opcode - RLA ($61,x)
            lsr $2162,x        ; $b55f: 5e 62 21  
            php                ; $b562: 08        
            ora ($63,x)        ; $b563: 01 63     
            and ($17,x)        ; $b565: 21 17     
            ora ($63,x)        ; $b567: 01 63     
            and ($a8,x)        ; $b569: 21 a8     
            ora ($63,x)        ; $b56b: 01 63     
            and ($b7,x)        ; $b56d: 21 b7     
            ora ($63,x)        ; $b56f: 01 63     
            .hex 22            ; $b571: 22        Invalid Opcode - KIL 
            pha                ; $b572: 48        
            ora ($63,x)        ; $b573: 01 63     
            .hex 22            ; $b575: 22        Invalid Opcode - KIL 
            .hex 57 01         ; $b576: 57 01     Invalid Opcode - SRE $01,x
            .hex 63 22         ; $b578: 63 22     Invalid Opcode - RRA ($22,x)
            inx                ; $b57a: e8        
            ora ($63,x)        ; $b57b: 01 63     
            .hex 22            ; $b57d: 22        Invalid Opcode - KIL 
            .hex f7 01         ; $b57e: f7 01     Invalid Opcode - ISC $01,x
            .hex 63 21         ; $b580: 63 21     Invalid Opcode - RRA ($21,x)
            and $c4            ; $b582: 25 c4     
            .hex 3f 21 29      ; $b584: 3f 21 29  Invalid Opcode - RLA $2921,x
            cpy $3f            ; $b587: c4 3f     
            and ($36,x)        ; $b589: 21 36     
            cpy $3f            ; $b58b: c4 3f     
            and ($3a,x)        ; $b58d: 21 3a     
            cpy $3f            ; $b58f: c4 3f     
            and ($c4,x)        ; $b591: 21 c4     
            cpy $3f            ; $b593: c4 3f     
            and ($d0,x)        ; $b595: 21 d0     
            cpy $3f            ; $b597: c4 3f     
            and ($db,x)        ; $b599: 21 db     
            cpy $3f            ; $b59b: c4 3f     
            .hex 22            ; $b59d: 22        Invalid Opcode - KIL 
            .hex 63 c4         ; $b59e: 63 c4     Invalid Opcode - RRA ($c4,x)
            .hex 3f 22 6c      ; $b5a0: 3f 22 6c  Invalid Opcode - RLA $6c22,x
            cpy $3f            ; $b5a3: c4 3f     
            .hex 22            ; $b5a5: 22        Invalid Opcode - KIL 
            .hex 73 c4         ; $b5a6: 73 c4     Invalid Opcode - RRA ($c4),y
            .hex 3f 22 7c      ; $b5a8: 3f 22 7c  Invalid Opcode - RLA $7c22,x
            cpy $3f            ; $b5ab: c4 3f     
            .hex 23 02         ; $b5ad: 23 02     Invalid Opcode - RLA ($02,x)
            .hex c3 3f         ; $b5af: c3 3f     Invalid Opcode - DCP ($3f,x)
            .hex 23 0f         ; $b5b1: 23 0f     Invalid Opcode - RLA ($0f,x)
            .hex c3 3f         ; $b5b3: c3 3f     Invalid Opcode - DCP ($3f,x)
            .hex 23            ; $b5b5: 23        Suspected data
__b5b6:     ora $3fc3,x        ; $b5b6: 1d c3 3f  
            .hex 22            ; $b5b9: 22        Invalid Opcode - KIL 
            asl                ; $b5ba: 0a        
            .hex 82 6e         ; $b5bb: 82 6e     Invalid Opcode - NOP #$6e
            .hex 6f 22 18      ; $b5bd: 6f 22 18  Invalid Opcode - RRA $1822
            .hex 82 70         ; $b5c0: 82 70     Invalid Opcode - NOP #$70
            adc ($22),y        ; $b5c2: 71 22     
            ora $7282,y        ; $b5c4: 19 82 72  
            .hex 73 00         ; $b5c7: 73 00     Invalid Opcode - RRA ($00),y
            .hex 3f 00 08      ; $b5c9: 3f 00 08  Invalid Opcode - RLA $0800,x
            .hex 0f 15 2c      ; $b5cc: 0f 15 2c  Invalid Opcode - SLO $2c15
            asl $0f            ; $b5cf: 06 0f     
            bmi __b5fa         ; $b5d1: 30 27     
            asl $3f,x          ; $b5d3: 16 3f     
            ora $1203,x        ; $b5d5: 1d 03 12  
            .hex 37 15         ; $b5d8: 37 15     Invalid Opcode - RLA $15,x
            .hex 23 c0         ; $b5da: 23 c0     Invalid Opcode - RLA ($c0,x)
            pha                ; $b5dc: 48        
            .hex ff 23 c9      ; $b5dd: ff 23 c9  Invalid Opcode - ISC __c923,x
            .hex 02            ; $b5e0: 02        Invalid Opcode - KIL 
            tax                ; $b5e1: aa        
            .hex 22            ; $b5e2: 22        Invalid Opcode - KIL 
            .hex 23 cd         ; $b5e3: 23 cd     Invalid Opcode - RLA ($cd,x)
            .hex 43 0f         ; $b5e5: 43 0f     Invalid Opcode - SRE ($0f,x)
            .hex 23 d1         ; $b5e7: 23 d1     Invalid Opcode - RLA ($d1,x)
            .hex 82 84         ; $b5e9: 82 84     Invalid Opcode - NOP #$84
            pha                ; $b5eb: 48        
            .hex 23 d7         ; $b5ec: 23 d7     Invalid Opcode - RLA ($d7,x)
            ora $03            ; $b5ee: 05 03     
            .hex 0c 88 00      ; $b5f0: 0c 88 00  Bad Addr Mode - NOP $0088
            dey                ; $b5f3: 88        
            .hex 23 e1         ; $b5f4: 23 e1     Invalid Opcode - RLA ($e1,x)
            .hex 03 88         ; $b5f6: 03 88     Invalid Opcode - SLO ($88,x)
            brk                ; $b5f8: 00        
            dey                ; $b5f9: 88        
__b5fa:     .hex 23 e9         ; $b5fa: 23 e9     Invalid Opcode - RLA ($e9,x)
            .hex 03 88         ; $b5fc: 03 88     Invalid Opcode - SLO ($88,x)
            brk                ; $b5fe: 00        
            dey                ; $b5ff: 88        
            .hex 23 d3         ; $b600: 23 d3     Invalid Opcode - RLA ($d3,x)
            .hex 82 84         ; $b602: 82 84     Invalid Opcode - NOP #$84
            pha                ; $b604: 48        
            jsr __c72c         ; $b605: 20 2c c7  
            .hex 3f 20 2a      ; $b608: 3f 20 2a  Invalid Opcode - RLA $2a20,x
            .hex c7 3f         ; $b60b: c7 3f     Invalid Opcode - DCP $3f
            jsr $43ca          ; $b60d: 20 ca 43  
            bmi __b632         ; $b610: 30 20     
            lda $3046          ; $b612: ad 46 30  
            jsr __c2d2         ; $b615: 20 d2 c2  
            .hex 3f 21 02      ; $b618: 3f 21 02  Invalid Opcode - RLA $0221,x
            eor $30,x          ; $b61b: 55 30     
            and ($06,x)        ; $b61d: 21 06     
            .hex 02            ; $b61f: 02        Invalid Opcode - KIL 
            lsr $215f,x        ; $b620: 5e 5f 21  
            rol $02            ; $b623: 26 02     
            .hex 5c 5d 21      ; $b625: 5c 5d 21  Invalid Opcode - NOP $215d,x
            asl $5e02          ; $b628: 0e 02 5e  
            .hex 5f 21 2e      ; $b62b: 5f 21 2e  Invalid Opcode - SRE $2e21,x
            .hex 02            ; $b62e: 02        Invalid Opcode - KIL 
            .hex 5c 5d 23      ; $b62f: 5c 5d 23  Invalid Opcode - NOP $235d,x
__b632:     adc ($5e,x)        ; $b632: 61 5e     
            bmi __b659         ; $b634: 30 23     
            lsr $02            ; $b636: 46 02     
            .hex 5c 5d 23      ; $b638: 5c 5d 23  Invalid Opcode - NOP $235d,x
            ror $02            ; $b63b: 66 02     
            rts                ; $b63d: 60        

;-------------------------------------------------------------------------------
            adc ($23,x)        ; $b63e: 61 23     
            lsr $5c02          ; $b640: 4e 02 5c  
            eor $6e23,x        ; $b643: 5d 23 6e  
            .hex 02            ; $b646: 02        Invalid Opcode - KIL 
            rts                ; $b647: 60        

;-------------------------------------------------------------------------------
            adc ($21,x)        ; $b648: 61 21     
            lsr $d0            ; $b64a: 46 d0     
            .hex 74 21         ; $b64c: 74 21     Invalid Opcode - NOP $21,x
            .hex 47 d0         ; $b64e: 47 d0     Invalid Opcode - SRE $d0
            adc $21,x          ; $b650: 75 21     
            .hex 5c 42 30      ; $b652: 5c 42 30  Invalid Opcode - NOP $3042,x
            and ($79,x)        ; $b655: 21 79     
            .hex 42            ; $b657: 42        Invalid Opcode - KIL 
            .hex 30            ; $b658: 30        Suspected data
__b659:     and ($96,x)        ; $b659: 21 96     
            .hex 42            ; $b65b: 42        Invalid Opcode - KIL 
            bmi __b67f         ; $b65c: 30 21     
            .hex b2            ; $b65e: b2        Invalid Opcode - KIL 
            .hex 43 30         ; $b65f: 43 30     Invalid Opcode - SRE ($30,x)
            and ($c2,x)        ; $b661: 21 c2     
            .hex 43 30         ; $b663: 43 30     Invalid Opcode - SRE ($30,x)
            and ($c9,x)        ; $b665: 21 c9     
            .hex 44 30         ; $b667: 44 30     Invalid Opcode - NOP $30
            and ($f9,x)        ; $b669: 21 f9     
            eor $30            ; $b66b: 45 30     
            .hex 22            ; $b66d: 22        Invalid Opcode - KIL 
            .hex 33 42         ; $b66e: 33 42     Invalid Opcode - RLA ($42),y
            bmi __b694         ; $b670: 30 22     
            lsr $42,x          ; $b672: 56 42     
            bmi __b698         ; $b674: 30 22     
            adc $3042,y        ; $b676: 79 42 30  
            .hex 22            ; $b679: 22        Invalid Opcode - KIL 
            .hex 9c 42 30      ; $b67a: 9c 42 30  Invalid Opcode - SHY $3042,x
            .hex 22            ; $b67d: 22        Invalid Opcode - KIL 
            .hex 82            ; $b67e: 82        Suspected data
__b67f:     .hex 43 30         ; $b67f: 43 30     Invalid Opcode - SRE ($30,x)
            .hex 22            ; $b681: 22        Invalid Opcode - KIL 
            dex                ; $b682: ca        
            .hex 43 30         ; $b683: 43 30     Invalid Opcode - SRE ($30,x)
            .hex 22            ; $b685: 22        Invalid Opcode - KIL 
            .hex db 43 30      ; $b686: db 43 30  Invalid Opcode - DCP $3043,y
            .hex 22            ; $b689: 22        Invalid Opcode - KIL 
            sed                ; $b68a: f8        
            .hex 42            ; $b68b: 42        Invalid Opcode - KIL 
            bmi __b6b1         ; $b68c: 30 23     
            ora $42,x          ; $b68e: 15 42     
            bmi __b6b5         ; $b690: 30 23     
            .hex 22            ; $b692: 22        Invalid Opcode - KIL 
            .hex 43            ; $b693: 43        Suspected data
__b694:     bmi __b6b9         ; $b694: 30 23     
            and ($43),y        ; $b696: 31 43     
__b698:     bmi __b6bb         ; $b698: 30 21     
            rol $c3,x          ; $b69a: 36 c3     
            .hex 3f 21 7c      ; $b69c: 3f 21 7c  Invalid Opcode - RLA $7c21,x
            .hex c4            ; $b69f: c4        Suspected data
__b6a0:     .hex 3f            ; $b6a0: 3f        Suspected data
__b6a1:     and ($d3,x)        ; $b6a1: 21 d3     
            .hex c3 3f         ; $b6a3: c3 3f     Invalid Opcode - DCP ($3f,x)
            and ($e4,x)        ; $b6a5: 21 e4     
            cmp $3f            ; $b6a7: c5 3f     
            and ($ea,x)        ; $b6a9: 21 ea     
            .hex c7 3f         ; $b6ab: c7 3f     Invalid Opcode - DCP $3f
            and ($ec,x)        ; $b6ad: 21 ec     
            .hex c7 3f         ; $b6af: c7 3f     Invalid Opcode - DCP $3f
__b6b1:     .hex 22            ; $b6b1: 22        Invalid Opcode - KIL 
            ora $3fc3,y        ; $b6b2: 19 c3 3f  
__b6b5:     .hex 22            ; $b6b5: 22        Invalid Opcode - KIL 
            .hex a3 c4         ; $b6b6: a3 c4     Invalid Opcode - LAX ($c4,x)
            .hex 3f            ; $b6b8: 3f        Suspected data
__b6b9:     .hex 22            ; $b6b9: 22        Invalid Opcode - KIL 
            .hex bc            ; $b6ba: bc        Suspected data
__b6bb:     ora ($3f,x)        ; $b6bb: 01 3f     
            and ($82,x)        ; $b6bd: 21 82     
            .hex 82 70         ; $b6bf: 82 70     Invalid Opcode - NOP #$70
            adc ($21),y        ; $b6c1: 71 21     
            .hex 83 82         ; $b6c3: 83 82     Invalid Opcode - SAX ($82,x)
            .hex 72            ; $b6c5: 72        Invalid Opcode - KIL 
            .hex 73 21         ; $b6c6: 73 21     Invalid Opcode - RRA ($21),y
            ora $6e82,x        ; $b6c8: 1d 82 6e  
            .hex 6f 21 4e      ; $b6cb: 6f 21 4e  Invalid Opcode - RRA $4e21
            bne __b744         ; $b6ce: d0 74     
            and ($4f,x)        ; $b6d0: 21 4f     
            bne __b749         ; $b6d2: d0 75     
            brk                ; $b6d4: 00        
__b6d5:     jsr $0163          ; $b6d5: 20 63 01  
            .hex ff 20 6d      ; $b6d8: ff 20 6d  Invalid Opcode - ISC $6d20,x
            .hex 03 d0         ; $b6db: 03 d0     Invalid Opcode - SLO ($d0,x)
__b6dd:     cmp ($d2),y        ; $b6dd: d1 d2     
            jsr $0276          ; $b6df: 20 76 02  
            .hex fe ff         ; $b6e2: fe ff     Suspected data
__b6e4:     jsr $0a94          ; $b6e4: 20 94 0a  
            and $16            ; $b6e7: 25 16     
            rol                ; $b6e9: 2a        
            rol $27            ; $b6ea: 26 27     
            plp                ; $b6ec: 28        
            and #$2a           ; $b6ed: 29 2a     
            ora $2d,x          ; $b6ef: 15 2d     
            jsr $0ab4          ; $b6f1: 20 b4 0a  
            .hex 2b 24         ; $b6f4: 2b 24     Invalid Opcode - ANC #$24
            bit $2424          ; $b6f6: 2c 24 24  
            bit $24            ; $b6f9: 24 24     
            .hex 2c 24         ; $b6fb: 2c 24     Suspected data
__b6fd:     .hex 2f 00 17      ; $b6fd: 2f 00 17  Invalid Opcode - RLA $1700
            inc $13            ; $b700: e6 13     
            inc $0a            ; $b702: e6 0a     
            .hex e7 23         ; $b704: e7 23     Invalid Opcode - ISC $23
            sbc $8e            ; $b706: e5 8e     
            .hex e4            ; $b708: e4        Suspected data
__b709:     jsr $066e          ; $b709: 20 6e 06  
            brk                ; $b70c: 00        
            jsr $0664          ; $b70d: 20 64 06  
            brk                ; $b710: 00        
            jsr $0677          ; $b711: 20 77 06  
            brk                ; $b714: 00        
            jsr $04b7          ; $b715: 20 b7 04  
            brk                ; $b718: 00        
            jsr $01b5          ; $b719: 20 b5 01  
            brk                ; $b71c: 00        
__b71d:     bvc __b77f         ; $b71d: 50 60     
            bvs __b6a1         ; $b71f: 70 80     
            .hex 80            ; $b721: 80        Suspected data
__b722:     .hex 07            ; $b722: 07        Suspected data
__b723:     .hex 07            ; $b723: 07        Suspected data
__b724:     clv                ; $b724: b8        
__b725:     .hex b7 03         ; $b725: b7 03     Invalid Opcode - LAX $03,y
__b727:     .hex 02            ; $b727: 02        Invalid Opcode - KIL 
            inc $09b7          ; $b728: ee b7 09  
            php                ; $b72b: 08        
            brk                ; $b72c: 00        
__b72d:     clv                ; $b72d: b8        
__b72e:     .hex 02            ; $b72e: 02        Invalid Opcode - KIL 
            .hex 33 40         ; $b72f: 33 40     Invalid Opcode - RLA ($40),y
__b731:     .hex 80 90         ; $b731: 80 90     Invalid Opcode - NOP #$90
__b733:     bcc __b6d5         ; $b733: 90 a0     
            bpl __b739         ; $b735: 10 02     
            .hex 33 40         ; $b737: 33 40     Invalid Opcode - RLA ($40),y
__b739:     .hex 80 00         ; $b739: 80 00     Invalid Opcode - NOP #$00
__b73b:     bcc __b6dd         ; $b73b: 90 a0     
            bpl __b741         ; $b73d: 10 02     
__b73f:     .hex 33 40         ; $b73f: 33 40     Invalid Opcode - RLA ($40),y
__b741:     .hex 80 90         ; $b741: 80 90     Invalid Opcode - NOP #$90
__b743:     .hex a0            ; $b743: a0        Suspected data
__b744:     ldy $10            ; $b744: a4 10     
            .hex 02            ; $b746: 02        Invalid Opcode - KIL 
            .hex 33 40         ; $b747: 33 40     Invalid Opcode - RLA ($40),y
__b749:     .hex 80 00         ; $b749: 80 00     Invalid Opcode - NOP #$00
            ldy #$a4           ; $b74b: a0 a4     
            bpl __b752         ; $b74d: 10 03     
            .hex 33 40         ; $b74f: 33 40     Invalid Opcode - RLA ($40),y
            .hex 80            ; $b751: 80        Suspected data
__b752:     bcc __b6e4         ; $b752: 90 90     
            .hex a0            ; $b754: a0        Suspected data
__b755:     bpl __b759         ; $b755: 10 02     
            .hex 33 40         ; $b757: 33 40     Invalid Opcode - RLA ($40),y
__b759:     .hex 80 00         ; $b759: 80 00     Invalid Opcode - NOP #$00
            ldy #$a8           ; $b75b: a0 a8     
            bpl __b762         ; $b75d: 10 03     
            bvc __b7b1         ; $b75f: 50 50     
            .hex 90            ; $b761: 90        Suspected data
__b762:     ldy #$a0           ; $b762: a0 a0     
            ldy #$10           ; $b764: a0 10     
            .hex 03 40         ; $b766: 03 40     Invalid Opcode - SLO ($40,x)
            .hex 43 90         ; $b768: 43 90     Invalid Opcode - SRE ($90,x)
            brk                ; $b76a: 00        
            ldy #$a0           ; $b76b: a0 a0     
            .hex 10            ; $b76d: 10        Suspected data
__b76e:     .hex 04            ; $b76e: 04        Suspected data
__b76f:     rts                ; $b76f: 60        

;-------------------------------------------------------------------------------
            rts                ; $b770: 60        

;-------------------------------------------------------------------------------
            bcs __b723         ; $b771: b0 b0     
            bcs __b725         ; $b773: b0 b0     
            bpl __b77b         ; $b775: 10 04     
            .hex 5c 4e ac      ; $b777: 5c 4e ac  Invalid Opcode - NOP __ac4e,x
            brk                ; $b77a: 00        
__b77b:     bcs __b72d         ; $b77b: b0 b0     
            bpl __b783         ; $b77d: 10 04     
__b77f:     bvs __b7f1         ; $b77f: 70 70     
            bne __b743         ; $b781: d0 c0     
__b783:     cpy #$c0           ; $b783: c0 c0     
            bpl __b78b         ; $b785: 10 04     
            .hex 80 59         ; $b787: 80 59     Invalid Opcode - NOP #$59
            cld                ; $b789: d8        
            brk                ; $b78a: 00        
__b78b:     cpy #$c0           ; $b78b: c0 c0     
            .hex 10            ; $b78d: 10        Suspected data
__b78e:     .hex ff 60 d0      ; $b78e: ff 60 d0  Invalid Opcode - ISC __d060,x
            bcs __b733         ; $b791: b0 a0     
            bcs __b755         ; $b793: b0 c0     
            bvs __b76f         ; $b795: 70 d8     
            bcs __b739         ; $b797: b0 a0     
            bcs __b73b         ; $b799: b0 a0     
            .hex 80 e0         ; $b79b: 80 e0     Invalid Opcode - NOP #$e0
            bcs __b73f         ; $b79d: b0 a0     
            bcs __b731         ; $b79f: b0 90     
            bcc __b78b         ; $b7a1: 90 e8     
            cpy #$a0           ; $b7a3: c0 a0     
            bcs __b727         ; $b7a5: b0 80     
            tay                ; $b7a7: a8        
            .hex f4 d0         ; $b7a8: f4 d0     Invalid Opcode - NOP $d0,x
            ldy #$b0           ; $b7aa: a0 b0     
            bvs __b76e         ; $b7ac: 70 c0     
            .hex fc e0 a0      ; $b7ae: fc e0 a0  Invalid Opcode - NOP __a0e0,x
__b7b1:     .hex b0            ; $b7b1: b0        Suspected data
__b7b2:     ora ($00,x)        ; $b7b2: 01 00     
__b7b4:     .hex 02            ; $b7b4: 02        Invalid Opcode - KIL 
            ora ($01,x)        ; $b7b5: 01 01     
            brk                ; $b7b7: 00        
            .hex 02            ; $b7b8: 02        Invalid Opcode - KIL 
            .hex 80 e0         ; $b7b9: 80 e0     Invalid Opcode - NOP #$e0
            brk                ; $b7bb: 00        
            .hex 02            ; $b7bc: 02        Invalid Opcode - KIL 
            ora ($00,x)        ; $b7bd: 01 00     
            .hex 03 80         ; $b7bf: 03 80     Invalid Opcode - SLO ($80,x)
            cpx #$00           ; $b7c1: e0 00     
            .hex 02            ; $b7c3: 02        Invalid Opcode - KIL 
            ora ($00,x)        ; $b7c4: 01 00     
            .hex 03 80         ; $b7c6: 03 80     Invalid Opcode - SLO ($80,x)
            cpx #$01           ; $b7c8: e0 01     
            brk                ; $b7ca: 00        
            .hex 02            ; $b7cb: 02        Invalid Opcode - KIL 
            ora ($03,x)        ; $b7cc: 01 03     
            bvs __b7b4         ; $b7ce: 70 e4     
            .hex 02            ; $b7d0: 02        Invalid Opcode - KIL 
            ora ($00,x)        ; $b7d1: 01 00     
            .hex 02            ; $b7d3: 02        Invalid Opcode - KIL 
__b7d4:     .hex 04 64         ; $b7d4: 04 64     Invalid Opcode - NOP $64
            inx                ; $b7d6: e8        
            brk                ; $b7d7: 00        
            ora ($02,x)        ; $b7d8: 01 02     
            ora ($04,x)        ; $b7da: 01 04     
            .hex 54 f0         ; $b7dc: 54 f0     Invalid Opcode - NOP $f0,x
            ora ($02,x)        ; $b7de: 01 02     
            ora ($00,x)        ; $b7e0: 01 00     
__b7e2:     .hex 04            ; $b7e2: 04        Suspected data
__b7e3:     cpy #$04           ; $b7e3: c0 04     
            cpx #$04           ; $b7e5: e0 04     
            .hex ff 04 ff      ; $b7e7: ff 04 ff  Invalid Opcode - ISC __ff04,x
            ora $ff            ; $b7ea: 05 ff     
            ora $ff            ; $b7ec: 05 ff     
            .hex 02            ; $b7ee: 02        Invalid Opcode - KIL 
            .hex ff d0         ; $b7ef: ff d0     Suspected data
__b7f1:     .hex 02            ; $b7f1: 02        Invalid Opcode - KIL 
            bne __b7d4         ; $b7f2: d0 e0     
            .hex 03 b0         ; $b7f4: 03 b0     Invalid Opcode - SLO ($b0,x)
            .hex ff 04 90      ; $b7f6: ff 04 90  Invalid Opcode - ISC __9004,x
            .hex ff 04 8c      ; $b7f9: ff 04 8c  Invalid Opcode - ISC __8c04,x
            .hex ff 05 88      ; $b7fc: ff 05 88  Invalid Opcode - ISC __8805,x
            .hex ff 02 80      ; $b7ff: ff 02 80  Invalid Opcode - ISC __8002,x
            sed                ; $b802: f8        
            .hex 02            ; $b803: 02        Invalid Opcode - KIL 
            ora ($00,x)        ; $b804: 01 00     
            ora ($02,x)        ; $b806: 01 02     
            ora ($03,x)        ; $b808: 01 03     
            .hex 80 f8         ; $b80a: 80 f8     Invalid Opcode - NOP #$f8
            ora ($02,x)        ; $b80c: 01 02     
            ora ($00,x)        ; $b80e: 01 00     
            ora ($02,x)        ; $b810: 01 02     
            .hex 04 80         ; $b812: 04 80     Invalid Opcode - NOP $80
            sed                ; $b814: f8        
            .hex 02            ; $b815: 02        Invalid Opcode - KIL 
            ora ($00,x)        ; $b816: 01 00     
            ora ($02,x)        ; $b818: 01 02     
            ora ($04,x)        ; $b81a: 01 04     
            .hex 80 f8         ; $b81c: 80 f8     Invalid Opcode - NOP #$f8
            .hex 02            ; $b81e: 02        Invalid Opcode - KIL 
            brk                ; $b81f: 00        
__b820:     ora ($02,x)        ; $b820: 01 02     
            ora ($00,x)        ; $b822: 01 00     
            ora $80            ; $b824: 05 80     
            sed                ; $b826: f8        
            ora ($00,x)        ; $b827: 01 00     
            ora ($02,x)        ; $b829: 01 02     
            ora ($00,x)        ; $b82b: 01 00     
            asl $80            ; $b82d: 06 80     
            sed                ; $b82f: f8        
            ora ($02,x)        ; $b830: 01 02     
            .hex 03 00         ; $b832: 03 00     Invalid Opcode - SLO ($00,x)
            .hex 03 02         ; $b834: 03 02     Invalid Opcode - SLO ($02,x)
__b836:     sty $7c            ; $b836: 84 7c     
            pla                ; $b838: 68        
            dey                ; $b839: 88        
            .hex 80 6c         ; $b83a: 80 6c     Invalid Opcode - NOP #$6c
            sty $7000          ; $b83c: 8c 00 70  
            bvc __b89c         ; $b83f: 50 5b     
            bmi __b872         ; $b841: 30 2f     
__b843:     and $28,x          ; $b843: 35 28     
            and ($36),y        ; $b845: 31 36     
            and #$10           ; $b847: 29 10     
            .hex 04 10         ; $b849: 04 10     Invalid Opcode - NOP $10
            .hex a7 00         ; $b84b: a7 00     Invalid Opcode - LAX $00
            .hex dd 2d 00      ; $b84d: dd 2d 00  Bad Addr Mode - CMP $002d,x
            rol $30            ; $b850: 26 30     
            brk                ; $b852: 00        
            plp                ; $b853: 28        
__b854:     php                ; $b854: 08        
__b855:     .hex c7 08         ; $b855: c7 08     Invalid Opcode - DCP $08
            .hex b7 08         ; $b857: b7 08     Invalid Opcode - LAX $08,y
            .hex c7 1b         ; $b859: c7 1b     Invalid Opcode - DCP $1b
__b85b:     .hex c7 70         ; $b85b: c7 70     Invalid Opcode - DCP $70
            .hex c7            ; $b85d: c7        Suspected data
__b85e:     sec                ; $b85e: 38        
__b85f:     .hex 8f            ; $b85f: 8f        Suspected data
__b860:     cli                ; $b860: 58        
__b861:     .hex 12            ; $b861: 12        Invalid Opcode - KIL 
__b862:     cpy #$a0           ; $b862: c0 a0     
            .hex 3f 58 12      ; $b864: 3f 58 12  Invalid Opcode - RLA $1258,x
            iny                ; $b867: c8        
            .hex cd 7f         ; $b868: cd 7f     Suspected data
__b86a:     cli                ; $b86a: 58        
            .hex 12            ; $b86b: 12        Invalid Opcode - KIL 
            bne __b89e         ; $b86c: d0 30     
            .hex 37 58         ; $b86e: 37 58     Invalid Opcode - RLA $58,x
            .hex 12            ; $b870: 12        Invalid Opcode - KIL 
            cld                ; $b871: d8        
__b872:     ldy #$37           ; $b872: a0 37     
            cli                ; $b874: 58        
            .hex 12            ; $b875: 12        Invalid Opcode - KIL 
            cpy #$90           ; $b876: c0 90     
            .hex 37 58         ; $b878: 37 58     Invalid Opcode - RLA $58,x
            .hex 12            ; $b87a: 12        Invalid Opcode - KIL 
            iny                ; $b87b: c8        
            bcs __b8b4         ; $b87c: b0 36     
            .hex 74 22         ; $b87e: 74 22     Invalid Opcode - NOP $22,x
            rti                ; $b880: 40        

;-------------------------------------------------------------------------------
            eor ($66,x)        ; $b881: 41 66     
            .hex 74 22         ; $b883: 74 22     Invalid Opcode - NOP $22,x
            bvc __b8ff         ; $b885: 50 78     
            stx $2274          ; $b887: 8e 74 22  
            rts                ; $b88a: 60        

;-------------------------------------------------------------------------------
            bvc __b843         ; $b88b: 50 b6     
            .hex 74 22         ; $b88d: 74 22     Invalid Opcode - NOP $22,x
            bvs __b909         ; $b88f: 70 78     
            ldy #$74           ; $b891: a0 74     
            .hex 22            ; $b893: 22        Invalid Opcode - KIL 
            .hex 80 60         ; $b894: 80 60     Invalid Opcode - NOP #$60
            ror $7c            ; $b896: 66 7c     
            .hex 22            ; $b898: 22        Invalid Opcode - KIL 
            ldy #$b0           ; $b899: a0 b0     
            .hex b6            ; $b89b: b6        Suspected data
__b89c:     .hex 7c 22         ; $b89c: 7c 22     Suspected data
__b89e:     bcs __b820         ; $b89e: b0 80     
            rol $7c,x          ; $b8a0: 36 7c     
            .hex 22            ; $b8a2: 22        Invalid Opcode - KIL 
            cpy #$60           ; $b8a3: c0 60     
            stx $227c          ; $b8a5: 8e 7c 22  
            bne __b8ea         ; $b8a8: d0 40     
            .hex cf 94 22      ; $b8aa: cf 94 22  Invalid Opcode - DCP $2294
            cpy #$3f           ; $b8ad: c0 3f     
            .hex 8b b2         ; $b8af: 8b b2     Invalid Opcode - XAA #$b2
            and ($90,x)        ; $b8b1: 21 90     
            .hex 70            ; $b8b3: 70        Suspected data
__b8b4:     .hex 8b b2         ; $b8b4: 8b b2     Invalid Opcode - XAA #$b2
            and ($98,x)        ; $b8b6: 21 98     
            bvs __b86a         ; $b8b8: 70 b0     
            bcs __b8ce         ; $b8ba: b0 12     
            ldy #$88           ; $b8bc: a0 88     
            .hex cf b0 12      ; $b8be: cf b0 12  Invalid Opcode - DCP $12b0
            bcs __b85b         ; $b8c1: b0 98     
            .hex cf b0 12      ; $b8c3: cf b0 12  Invalid Opcode - DCP $12b0
            clv                ; $b8c6: b8        
__b8c7:     brk                ; $b8c7: 00        
__b8c8:     php                ; $b8c8: 08        
__b8c9:     cpy #$03           ; $b8c9: c0 03     
            php                ; $b8cb: 08        
            cpx #$ff           ; $b8cc: e0 ff     
__b8ce:     .hex 03 10         ; $b8ce: 03 10     Invalid Opcode - SLO ($10,x)
            rti                ; $b8d0: 40        

;-------------------------------------------------------------------------------
            .hex 03 01         ; $b8d1: 03 01     Invalid Opcode - SLO ($01,x)
            .hex 0c 02 08      ; $b8d3: 0c 02 08  Invalid Opcode - NOP $0802
            ldy #$02           ; $b8d6: a0 02     
            .hex 04 90         ; $b8d8: 04 90     Invalid Opcode - NOP $90
            .hex 03 04         ; $b8da: 03 04     Invalid Opcode - SLO ($04,x)
            cpy #$ff           ; $b8dc: c0 ff     
            .hex 02            ; $b8de: 02        Invalid Opcode - KIL 
            clc                ; $b8df: 18        
            rti                ; $b8e0: 40        

;-------------------------------------------------------------------------------
            .hex 03 18         ; $b8e1: 03 18     Invalid Opcode - SLO ($18,x)
            ldy #$ff           ; $b8e3: a0 ff     
            .hex 02            ; $b8e5: 02        Invalid Opcode - KIL 
            clc                ; $b8e6: 18        
            rti                ; $b8e7: 40        

;-------------------------------------------------------------------------------
            brk                ; $b8e8: 00        
            asl                ; $b8e9: 0a        
__b8ea:     cpy #$ff           ; $b8ea: c0 ff     
            ora ($1c,x)        ; $b8ec: 01 1c     
            bmi __b8f2         ; $b8ee: 30 02     
            .hex 04 a0         ; $b8f0: 04 a0     Invalid Opcode - NOP $a0
__b8f2:     .hex ff 14 0f      ; $b8f2: ff 14 0f  Invalid Opcode - ISC $0f14,x
            ora ($36,x)        ; $b8f5: 01 36     
            .hex 05            ; $b8f7: 05        Suspected data
__b8f8:     pha                ; $b8f8: 48        
__b8f9:     .hex bf            ; $b8f9: bf        Suspected data
__b8fa:     cmp ($78,x)        ; $b8fa: c1 78     
            and ($2f),y        ; $b8fc: 31 2f     
            .hex a0            ; $b8fe: a0        Suspected data
__b8ff:     cpy #$c1           ; $b8ff: c0 c1     
            iny                ; $b901: c8        
            bmi __b935         ; $b902: 30 31     
            ldy #$c0           ; $b904: a0 c0     
            cmp ($c8,x)        ; $b906: c1 c8     
            .hex 30            ; $b908: 30        Suspected data
__b909:     .hex 31            ; $b909: 31        Suspected data
__b90a:     ldy $94,x          ; $b90a: b4 94     
            .hex 5c 3b 30      ; $b90c: 5c 3b 30  Invalid Opcode - NOP $303b,x
            lda __b935,y       ; $b90f: b9 35 b9  
__b912:     .hex 3a            ; $b912: 3a        Invalid Opcode - NOP 
            .hex b9            ; $b913: b9        Suspected data
__b914:     .hex 64            ; $b914: 64        Suspected data
__b915:     lda __b96d,y       ; $b915: b9 6d b9  
            ror $b9,x          ; $b918: 76 b9     
            .hex 7f b9         ; $b91a: 7f b9     Suspected data
__b91c:     ror $b9,x          ; $b91c: 76 b9     
            .hex 7f b9 3f      ; $b91e: 7f b9 3f  Invalid Opcode - RRA $3fb9,x
            lda __b93f,y       ; $b921: b9 3f b9  
            .hex 3f b9         ; $b924: 3f b9     Suspected data
__b926:     .hex 3f b9 88      ; $b926: 3f b9 88  Invalid Opcode - RLA __88b9,x
            lda __b995,y       ; $b929: b9 95 b9  
            ldx #$b9           ; $b92c: a2 b9     
            .hex af b9 02      ; $b92e: af b9 02  Invalid Opcode - LAX $02b9
            .hex ab 44         ; $b931: ab 44     Invalid Opcode - LAX #$44
            brk                ; $b933: 00        
            .hex 44            ; $b934: 44        Suspected data
__b935:     .hex 02            ; $b935: 02        Invalid Opcode - KIL 
__b936:     .hex ab 53         ; $b936: ab 53     Invalid Opcode - LAX #$53
__b938:     brk                ; $b938: 00        
            .hex 53 02         ; $b939: 53 02     Invalid Opcode - SRE ($02),y
            .hex ab 64         ; $b93b: ab 64     Invalid Opcode - LAX #$64
            brk                ; $b93d: 00        
            .hex 64            ; $b93e: 64        Suspected data
__b93f:     .hex 12            ; $b93f: 12        Invalid Opcode - KIL 
            rts                ; $b940: 60        

;-------------------------------------------------------------------------------
            rol $c0,x          ; $b941: 36 c0     
            rol $c0,x          ; $b943: 36 c0     
            pha                ; $b945: 48        
            .hex 3c 48 b4      ; $b946: 3c 48 b4  Invalid Opcode - NOP __b448,x
            ror $30            ; $b949: 66 30     
            ror $30            ; $b94b: 66 30     
            sei                ; $b94d: 78        
            .hex 3c 78 3c      ; $b94e: 3c 78 3c  Invalid Opcode - NOP $3c78,x
            stx __8ec0         ; $b951: 8e c0 8e  
            cpy #$a0           ; $b954: c0 a0     
            ldy $a0,x          ; $b956: b4 a0     
            ldy $b6,x          ; $b958: b4 b6     
            bmi __b912         ; $b95a: 30 b6     
            bmi __b926         ; $b95c: 30 c8     
            .hex 3c c8 3c      ; $b95e: 3c c8 3c  Invalid Opcode - NOP $3cc8,x
            sbc __ed00         ; $b961: ed 00 ed  
            .hex 04 c0         ; $b964: 04 c0     Invalid Opcode - NOP $c0
            rol $30,x          ; $b966: 36 30     
            rol $2e,x          ; $b968: 36 2e     
            pha                ; $b96a: 48        
            .hex bf 48         ; $b96b: bf 48     Suspected data
__b96d:     .hex 04 30         ; $b96d: 04 30     Invalid Opcode - NOP $30
__b96f:     ror $c0            ; $b96f: 66 c0     
            ror $c0            ; $b971: 66 c0     
            sei                ; $b973: 78        
            .hex 2f 78 04      ; $b974: 2f 78 04  Invalid Opcode - RLA $0478
            cpy #$8e           ; $b977: c0 8e     
            bmi __b909         ; $b979: 30 8e     
            rol __c0a0         ; $b97b: 2e a0 c0  
            ldy #$04           ; $b97e: a0 04     
            bmi __b938         ; $b980: 30 b6     
            cpy #$b6           ; $b982: c0 b6     
            .hex c2 c8         ; $b984: c2 c8     Invalid Opcode - NOP #$c8
            .hex 31            ; $b986: 31        Suspected data
__b987:     iny                ; $b987: c8        
            .hex 06            ; $b988: 06        Suspected data
__b989:     cmp $1050,x        ; $b989: dd 50 10  
            bvc __b99e         ; $b98c: 50 10     
            bvs __b96d         ; $b98e: 70 dd     
            bvs __b96f         ; $b990: 70 dd     
            bcc __b994         ; $b992: 90 00     
__b994:     .hex 90            ; $b994: 90        Suspected data
__b995:     asl $dd            ; $b995: 06 dd     
            rts                ; $b997: 60        

;-------------------------------------------------------------------------------
            bpl __b9fa         ; $b998: 10 60     
            bpl __b91c         ; $b99a: 10 80     
__b99c:     .hex dd 80         ; $b99c: dd 80     Suspected data
__b99e:     .hex dd a0 00      ; $b99e: dd a0 00  Bad Addr Mode - CMP $00a0,x
            ldy #$06           ; $b9a1: a0 06     
            cmp $1050,x        ; $b9a3: dd 50 10  
            bvc __b9b8         ; $b9a6: 50 10     
            bvs __b987         ; $b9a8: 70 dd     
            bvs __b989         ; $b9aa: 70 dd     
            bcs __b9ae         ; $b9ac: b0 00     
__b9ae:     bcs __b9b8         ; $b9ae: b0 08     
            cmp $1060,x        ; $b9b0: dd 60 10  
            rts                ; $b9b3: 60        

;-------------------------------------------------------------------------------
            bpl __b936         ; $b9b4: 10 80     
            .hex dd 80         ; $b9b6: dd 80     Suspected data
__b9b8:     .hex dd c0 00      ; $b9b8: dd c0 00  Bad Addr Mode - CMP $00c0,x
            cpy #$08           ; $b9bb: c0 08     
            php                ; $b9bd: 08        
            .hex 0f            ; $b9be: 0f        Suspected data
__b9bf:     asl                ; $b9bf: 0a        
__b9c0:     jsr $6850          ; $b9c0: 20 50 68  
            .hex 80 98         ; $b9c3: 80 98     Invalid Opcode - NOP #$98
            iny                ; $b9c5: c8        
__b9c6:     cpy $ca            ; $b9c6: c4 ca     
            .hex cd d0         ; $b9c8: cd d0     Suspected data
__b9ca:     .hex d3 d9         ; $b9ca: d3 d9     Invalid Opcode - DCP ($d9),y
__b9cc:     .hex 02            ; $b9cc: 02        Invalid Opcode - KIL 
            brk                ; $b9cd: 00        
            .hex 02            ; $b9ce: 02        Invalid Opcode - KIL 
            .hex 02            ; $b9cf: 02        Invalid Opcode - KIL 
            .hex 02            ; $b9d0: 02        Invalid Opcode - KIL 
            brk                ; $b9d1: 00        
            .hex 02            ; $b9d2: 02        Invalid Opcode - KIL 
            brk                ; $b9d3: 00        
            brk                ; $b9d4: 00        
            brk                ; $b9d5: 00        
            brk                ; $b9d6: 00        
            brk                ; $b9d7: 00        
            brk                ; $b9d8: 00        
__b9d9:     brk                ; $b9d9: 00        
            brk                ; $b9da: 00        
            brk                ; $b9db: 00        
            brk                ; $b9dc: 00        
            .hex 02            ; $b9dd: 02        Invalid Opcode - KIL 
            bpl __b9ef         ; $b9de: 10 0f     
            .hex 03 03         ; $b9e0: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 0d 0a         ; $b9e2: 0d 0a     Suspected data
__b9e4:     cmp ($d3),y        ; $b9e4: d1 d3     
            cmp ($d2),y        ; $b9e6: d1 d2     
            .hex eb d4         ; $b9e8: eb d4     Invalid Opcode - SBC #$d4
            .hex da            ; $b9ea: da        Invalid Opcode - NOP 
__b9eb:     .hex dd            ; $b9eb: dd        Suspected data
__b9ec:     .hex 44            ; $b9ec: 44        Suspected data
__b9ed:     and ($4c,x)        ; $b9ed: 21 4c     
__b9ef:     and ($51,x)        ; $b9ef: 21 51     
            .hex 22            ; $b9f1: 22        Invalid Opcode - KIL 
            .hex 93 21         ; $b9f2: 93 21     Invalid Opcode - AHX ($21),y
            eor $21            ; $b9f4: 45 21     
            lsr                ; $b9f6: 4a        
            and ($d3,x)        ; $b9f7: 21 d3     
            .hex 21            ; $b9f9: 21        Suspected data
__b9fa:     brk                ; $b9fa: 00        
            brk                ; $b9fb: 00        
            sty $1222          ; $b9fc: 8c 22 12  
            .hex 22            ; $b9ff: 22        Invalid Opcode - KIL 
            .hex 4e            ; $ba00: 4e        Suspected data
__ba01:     and ($00,x)        ; $ba01: 21 00     
            brk                ; $ba03: 00        
            iny                ; $ba04: c8        
            and ($d6,x)        ; $ba05: 21 d6     
            .hex 21            ; $ba07: 21        Suspected data
__ba08:     .hex 10            ; $ba08: 10        Suspected data
__ba09:     tsx                ; $ba09: ba        
            and $43ba          ; $ba0a: 2d ba 43  
            tsx                ; $ba0d: ba        
            eor $1cba,y        ; $ba0e: 59 ba 1c  
            jsr __ac50         ; $ba11: 20 50 ac  
            bit $24            ; $ba14: 24 24     
            eor $605c,x        ; $ba16: 5d 5c 60  
            bvc __b9bf         ; $ba19: 50 a4     
            bit $24            ; $ba1b: 24 24     
            .hex 5c 5d 88      ; $ba1d: 5c 5d 88  Invalid Opcode - NOP __885d,x
            bcc __b9ca         ; $ba20: 90 a8     
            bit $24            ; $ba22: 24 24     
            bit $24            ; $ba24: 24 24     
            tya                ; $ba26: 98        
            rts                ; $ba27: 60        

;-------------------------------------------------------------------------------
            ldy $2424          ; $ba28: ac 24 24  
            .hex 5c 5c 15      ; $ba2b: 5c 5c 15  Invalid Opcode - NOP $155c,x
            plp                ; $ba2e: 28        
            bvc __b9d9         ; $ba2f: 50 a8     
            adc $65            ; $ba31: 65 65     
            bit $24            ; $ba33: 24 24     
            bvc __ba87         ; $ba35: 50 50     
            ldy $24            ; $ba37: a4 24     
            bit $65            ; $ba39: 24 65     
            adc $98            ; $ba3b: 65 98     
            bvs __b9eb         ; $ba3d: 70 ac     
            bit $24            ; $ba3f: 24 24     
            adc $65            ; $ba41: 65 65     
            ora $60,x          ; $ba43: 15 60     
            ldy #$a4           ; $ba45: a0 a4     
            adc $7924,y        ; $ba47: 79 24 79  
            bit $90            ; $ba4a: 24 90     
            .hex 80 a4         ; $ba4c: 80 a4     Invalid Opcode - NOP #$a4
            bit $24            ; $ba4e: 24 24     
            bit $24            ; $ba50: 24 24     
            bvs __baa4         ; $ba52: 70 50     
            ldy $24            ; $ba54: a4 24     
            bit $24            ; $ba56: 24 24     
            bit $0e            ; $ba58: 24 0e     
            rti                ; $ba5a: 40        

;-------------------------------------------------------------------------------
            bvs __ba01         ; $ba5b: 70 a4     
            adc $65            ; $ba5d: 65 65     
            bit $24            ; $ba5f: 24 24     
            bcs __bad3         ; $ba61: b0 70     
            ldy $24            ; $ba63: a4 24     
            bit $65            ; $ba65: 24 65     
            .hex 65            ; $ba67: 65        Suspected data
__ba68:     sei                ; $ba68: 78        
__ba69:     tsx                ; $ba69: ba        
            sei                ; $ba6a: 78        
            tsx                ; $ba6b: ba        
            .hex 7c ba 80      ; $ba6c: 7c ba 80  Invalid Opcode - NOP __80ba,x
            tsx                ; $ba6f: ba        
            dey                ; $ba70: 88        
            tsx                ; $ba71: ba        
            sty __84ba         ; $ba72: 8c ba 84  
            tsx                ; $ba75: ba        
            sty $ba            ; $ba76: 84 ba     
            .hex 07 00         ; $ba78: 07 00     Invalid Opcode - SLO $00
            clc                ; $ba7a: 18        
            .hex 0f 03 00      ; $ba7b: 0f 03 00  Bad Addr Mode - SLO $0003
            ora ($10),y        ; $ba7e: 11 10     
            .hex 0f 00 1b      ; $ba80: 0f 00 1b  Invalid Opcode - SLO $1b00
            bpl __ba88         ; $ba83: 10 03     
            brk                ; $ba85: 00        
            .hex 1d            ; $ba86: 1d        Suspected data
__ba87:     .hex 10            ; $ba87: 10        Suspected data
__ba88:     ora #$00           ; $ba88: 09 00     
            ora $050f,y        ; $ba8a: 19 0f 05  
            brk                ; $ba8d: 00        
            clc                ; $ba8e: 18        
            .hex 0f 07 04      ; $ba8f: 0f 07 04  Invalid Opcode - SLO $0407
            php                ; $ba92: 08        
            .hex 07 03         ; $ba93: 07 03     Invalid Opcode - SLO $03
            .hex 07 04         ; $ba95: 07 04     Invalid Opcode - SLO $04
            php                ; $ba97: 08        
            php                ; $ba98: 08        
            ora #$08           ; $ba99: 09 08     
            ora #$03           ; $ba9b: 09 03     
            ora #$03           ; $ba9d: 09 03     
            ora #$04           ; $ba9f: 09 04     
            brk                ; $baa1: 00        
            .hex 04 03         ; $baa2: 04 03     Invalid Opcode - NOP $03
__baa4:     .hex 04 01         ; $baa4: 04 01     Invalid Opcode - NOP $01
            .hex 0c 01 00      ; $baa6: 0c 01 00  Bad Addr Mode - NOP $0001
            ora ($1f,x)        ; $baa9: 01 1f     
            .hex 01            ; $baab: 01        Suspected data
__baac:     .hex 04 01         ; $baac: 04 01     Invalid Opcode - NOP $01
            .hex 0c 04 07      ; $baae: 0c 04 07  Invalid Opcode - NOP $0704
            php                ; $bab1: 08        
            .hex 07 09         ; $bab2: 07 09     Invalid Opcode - SLO $09
            ora ($01,x)        ; $bab4: 01 01     
            .hex 04 01         ; $bab6: 04 01     Invalid Opcode - NOP $01
            brk                ; $bab8: 00        
            brk                ; $bab9: 00        
            bpl __bb14         ; $baba: 10 58     
__babc:     .hex 37            ; $babc: 37        Suspected data
__babd:     inx                ; $babd: e8        
            ora $ec,x          ; $babe: 15 ec     
            beq __baac         ; $bac0: f0 ea     
            .hex 97 e9         ; $bac2: 97 e9     Invalid Opcode - SAX $e9,y
            .hex 12            ; $bac4: 12        Invalid Opcode - KIL 
            iny                ; $bac5: c8        
            cmp #$12           ; $bac6: c9 12     
            bit $24            ; $bac8: 24 24     
            .hex 42            ; $baca: 42        Invalid Opcode - KIL 
            bne __bb1c         ; $bacb: d0 4f     
            .hex df 22 a0      ; $bacd: df 22 a0  Invalid Opcode - DCP __a022,x
            lda ($a2,x)        ; $bad0: a1 a2     
            .hex a3            ; $bad2: a3        Suspected data
__bad3:     bit $98            ; $bad3: 24 98     
            sta __9b9a,y       ; $bad5: 99 9a 9b  
            sta ($82,x)        ; $bad8: 81 82     
            bit $83            ; $bada: 24 83     
            .hex 22            ; $badc: 22        Invalid Opcode - KIL 
            pha                ; $badd: 48        
            eor #$4a           ; $bade: 49 4a     
            .hex 4b 24         ; $bae0: 4b 24     Invalid Opcode - ALR #$24
            .hex 9c 9d 9e      ; $bae2: 9c 9d 9e  Invalid Opcode - SHY __9e9d,x
            .hex 9f 24 a4      ; $bae5: 9f 24 a4  Invalid Opcode - AHX __a424,y
            bit $a5            ; $bae8: 24 a5     
            brk                ; $baea: 00        
            cpy #$b4           ; $baeb: c0 b4     
            ldy __c0b8,x       ; $baed: bc b8 c0  
            .hex 12            ; $baf0: 12        Invalid Opcode - KIL 
            bit $24            ; $baf1: 24 24     
__baf3:     .hex 23 db         ; $baf3: 23 db     Invalid Opcode - RLA ($db,x)
            .hex 42            ; $baf5: 42        Invalid Opcode - KIL 
            bvc __bb19         ; $baf6: 50 21     
            dex                ; $baf8: ca        
            jmp $2124          ; $baf9: 4c 24 21  

;-------------------------------------------------------------------------------
            nop                ; $bafc: ea        
            .hex 0c 24 24      ; $bafd: 0c 24 24  Invalid Opcode - NOP $2424
            ora $0a15,y        ; $bb00: 19 15 0a  
            .hex 22            ; $bb03: 22        Invalid Opcode - KIL 
            asl $241b          ; $bb04: 0e 1b 24  
            cpy #$24           ; $bb07: c0 24     
            bit $00            ; $bb09: 24 00     
__bb0b:     .hex 23 e2         ; $bb0b: 23 e2     Invalid Opcode - RLA ($e2,x)
            .hex 04 04         ; $bb0d: 04 04     Invalid Opcode - NOP $04
            ora $05            ; $bb0f: 05 05     
            ora ($22,x)        ; $bb11: 01 22     
            asl                ; $bb13: 0a        
__bb14:     jmp $2224          ; $bb14: 4c 24 22  

;-------------------------------------------------------------------------------
            rol                ; $bb17: 2a        
            .hex 0c            ; $bb18: 0c        Suspected data
__bb19:     bit $10            ; $bb19: 24 10     
            asl                ; $bb1b: 0a        
__bb1c:     asl $0e,x          ; $bb1c: 16 0e     
            bit $24            ; $bb1e: 24 24     
            clc                ; $bb20: 18        
            sty $1b0e          ; $bb21: 8c 0e 1b  
            bit $22            ; $bb24: 24 22     
            lsr                ; $bb26: 4a        
            jmp $0024          ; $bb27: 4c 24 00  

;-------------------------------------------------------------------------------
            .hex 12            ; $bb2a: 12        Invalid Opcode - KIL 
            .hex 24            ; $bb2b: 24        Suspected data
__bb2c:     bit $22            ; $bb2c: 24 22     
            .hex 69            ; $bb2e: 69        Suspected data
__bb2f:     ror                ; $bb2f: 6a        
            adc #$6a           ; $bb30: 69 6a     
            and ($42,x)        ; $bb32: 21 42     
            cmp ($67),y        ; $bb34: d1 67     
            and ($5d,x)        ; $bb36: 21 5d     
            cmp ($67),y        ; $bb38: d1 67     
            .hex 23 60         ; $bb3a: 23 60     Invalid Opcode - RLA ($60,x)
            rts                ; $bb3c: 60        

;-------------------------------------------------------------------------------
            adc #$00           ; $bb3d: 69 00     
__bb3f:     .hex 57            ; $bb3f: 57        Suspected data
__bb40:     .hex bb 00 04      ; $bb40: bb 00 04  Invalid Opcode - LAS $0400,y
            lda #$bb           ; $bb43: a9 bb     
            dex                ; $bb45: ca        
            .hex bb            ; $bb46: bb        Suspected data
__bb47:     .hex d3            ; $bb47: d3        Suspected data
__bb48:     .hex bb 50 04      ; $bb48: bb 50 04  Invalid Opcode - LAS $0450,y
            and $52bc,x        ; $bb4b: 3d bc 52  
            .hex bc            ; $bb4e: bc        Suspected data
__bb4f:     .hex 73            ; $bb4f: 73        Suspected data
__bb50:     ldy $04a0,x        ; $bb50: bc a0 04  
__bb53:     cmp ($bc),y        ; $bb53: d1 bc     
            asl $bd            ; $bb55: 06 bd     
            bvc __bb81         ; $bb57: 50 28     
            .hex 5f 28 14      ; $bb59: 5f 28 14  Invalid Opcode - SRE $1428,x
            rti                ; $bb5c: 40        

;-------------------------------------------------------------------------------
            .hex 92            ; $bb5d: 92        Invalid Opcode - KIL 
            rti                ; $bb5e: 40        

;-------------------------------------------------------------------------------
            bcc __bba9         ; $bb5f: 90 48     
            cmp $3248          ; $bb61: cd 48 32  
            bvs __bbb1         ; $bb64: 70 4b     
            bvs __bb2c         ; $bb66: 70 c4     
            dey                ; $bb68: 88        
            .hex ef 88 32      ; $bb69: ef 88 32  Invalid Opcode - ISC $3288
            tya                ; $bb6c: 98        
            lsr __d498,x       ; $bb6d: 5e 98 d4  
            cpy #$e5           ; $bb70: c0 e5     
            cpy #$af           ; $bb72: c0 af     
            iny                ; $bb74: c8        
            cpy #$c8           ; $bb75: c0 c8     
            pla                ; $bb77: 68        
            iny                ; $bb78: c8        
            sei                ; $bb79: 78        
            iny                ; $bb7a: c8        
__bb7b:     .hex 8f d0 98      ; $bb7b: 8f d0 98  Invalid Opcode - SAX __98d0
            bne __bb88         ; $bb7e: d0 08     
            cld                ; $bb80: d8        
__bb81:     rti                ; $bb81: 40        

;-------------------------------------------------------------------------------
            cld                ; $bb82: d8        
            .hex ff            ; $bb83: ff        Suspected data
__bb84:     rti                ; $bb84: 40        

;-------------------------------------------------------------------------------
            plp                ; $bb85: 28        
__bb86:     .hex 5f 28         ; $bb86: 5f 28     Suspected data
__bb88:     rti                ; $bb88: 40        

;-------------------------------------------------------------------------------
            rti                ; $bb89: 40        

;-------------------------------------------------------------------------------
            .hex a3 40         ; $bb8a: a3 40     Invalid Opcode - LAX ($40,x)
            lda __cf40,x       ; $bb8c: bd 40 cf  
            rti                ; $bb8f: 40        

;-------------------------------------------------------------------------------
            brk                ; $bb90: 00        
            iny                ; $bb91: c8        
            and $62c8          ; $bb92: 2d c8 62  
            iny                ; $bb95: c8        
            .hex 77 cb         ; $bb96: 77 cb     Invalid Opcode - RRA $cb,x
            ldy $a8,x          ; $bb98: b4 a8     
            .hex cb a8         ; $bb9a: cb a8     Invalid Opcode - AXS #$a8
            iny                ; $bb9c: c8        
__bb9d:     bne __bb9d         ; $bb9d: d0 fe     
            bne __bbb9         ; $bb9f: d0 18     
            pla                ; $bba1: 68        
            jsr $0068          ; $bba2: 20 68 00  
            tay                ; $bba5: a8        
            .hex 20            ; $bba6: 20        Suspected data
__bba7:     tay                ; $bba7: a8        
            .hex ff            ; $bba8: ff        Suspected data
__bba9:     rti                ; $bba9: 40        

;-------------------------------------------------------------------------------
            plp                ; $bbaa: 28        
            .hex 5f 28 60      ; $bbab: 5f 28 60  Invalid Opcode - SRE $6028,x
__bbae:     rti                ; $bbae: 40        

;-------------------------------------------------------------------------------
            dec $40            ; $bbaf: c6 40     
__bbb1:     sec                ; $bbb1: 38        
            bvs __bb7b         ; $bbb2: 70 c7     
            bvs __bb86         ; $bbb4: 70 d0     
            bvs __bba7         ; $bbb6: 70 ef     
            .hex 70            ; $bbb8: 70        Suspected data
__bbb9:     bpl __bb53         ; $bbb9: 10 98     
            .hex 2f 98 38      ; $bbbb: 2f 98 38  Invalid Opcode - RLA $3898
            tya                ; $bbbe: 98        
            dec $98            ; $bbbf: c6 98     
            sec                ; $bbc1: 38        
            cpy #$c6           ; $bbc2: c0 c6     
            cpy #$10           ; $bbc4: c0 10     
            cld                ; $bbc6: d8        
            rti                ; $bbc7: 40        

;-------------------------------------------------------------------------------
            cld                ; $bbc8: d8        
            .hex ff 10 40      ; $bbc9: ff 10 40  Invalid Opcode - ISC $4010,x
            .hex ef 40 08      ; $bbcc: ef 40 08  Invalid Opcode - ISC $0840
            cld                ; $bbcf: d8        
            sed                ; $bbd0: f8        
            .hex da            ; $bbd1: da        Invalid Opcode - NOP 
            .hex ff 9c 20      ; $bbd2: ff 9c 20  Invalid Opcode - ISC $209c,x
            .hex 9c 24 d4      ; $bbd5: 9c 24 d4  Invalid Opcode - SHY __d424,x
            bmi __bbae         ; $bbd8: 30 d4     
            lda $30ec          ; $bbda: ad ec 30  
            cpx $14ad          ; $bbdd: ec ad 14  
            rti                ; $bbe0: 40        

;-------------------------------------------------------------------------------
            .hex 14 c3         ; $bbe1: 14 c3     Invalid Opcode - NOP $c3,x
            bit $2c40          ; $bbe3: 2c 40 2c  
            lda $406c,x        ; $bbe6: bd 6c 40  
            jmp (__8cad)       ; $bbe9: 6c ad 8c  

;-------------------------------------------------------------------------------
            rti                ; $bbec: 40        

;-------------------------------------------------------------------------------
            sty __a48d         ; $bbed: 8c 8d a4  
            pha                ; $bbf0: 48        
            ldy $ab            ; $bbf1: a4 ab     
            ldy __bc48,x       ; $bbf3: bc 48 bc  
            sta $7044,x        ; $bbf6: 9d 44 70  
            .hex 44 c4         ; $bbf9: 44 c4     Invalid Opcode - NOP $c4
            jmp ($6c18)        ; $bbfb: 6c 18 6c  

;-------------------------------------------------------------------------------
            .hex 2d ff         ; $bbfe: 2d ff     Suspected data
__bc00:     .hex 14 47         ; $bc00: 14 47     Invalid Opcode - NOP $47,x
            .hex 14 5d         ; $bc02: 14 5d     Invalid Opcode - NOP $5d,x
            .hex 14 78         ; $bc04: 14 78     Invalid Opcode - NOP $78,x
            .hex 14            ; $bc06: 14        Suspected data
__bc07:     sta $472c,x        ; $bc07: 9d 2c 47  
            .hex 2c 9d         ; $bc0a: 2c 9d     Suspected data
__bc0c:     .hex 44 47         ; $bc0c: 44 47     Invalid Opcode - NOP $47
            .hex 44 86         ; $bc0e: 44 86     Invalid Opcode - NOP $86
            .hex 5c 47 5c      ; $bc10: 5c 47 5c  Invalid Opcode - NOP $5c47,x
            adc $4774          ; $bc13: 6d 74 47  
            .hex 74 76         ; $bc16: 74 76     Invalid Opcode - NOP $76,x
            sty __8c47         ; $bc18: 8c 47 8c  
            adc $47a4          ; $bc1b: 6d a4 47  
            ldy $86            ; $bc1e: a4 86     
            ldy __bc47,x       ; $bc20: bc 47 bc  
            adc $20d4          ; $bc23: 6d d4 20  
            .hex d4 6d         ; $bc26: d4 6d     Invalid Opcode - NOP $6d,x
            cpx __ec20         ; $bc28: ec 20 ec  
            adc $186c          ; $bc2b: 6d 6c 18  
__bc2e:     jmp (__d42d)       ; $bc2e: 6c 2d d4  

;-------------------------------------------------------------------------------
            bcc __bc07         ; $bc31: 90 d4     
            lda __90ec,x       ; $bc33: bd ec 90  
            cpx __9cbd         ; $bc36: ec bd 9c  
            clc                ; $bc39: 18        
            .hex 9c 24 ff      ; $bc3a: 9c 24 ff  Invalid Opcode - SHY __ff24,x
            .hex 14 4f         ; $bc3d: 14 4f     Invalid Opcode - NOP $4f,x
            .hex 14            ; $bc3f: 14        Suspected data
__bc40:     cmp $2c            ; $bc40: c5 2c     
            .hex 4f 2c         ; $bc42: 4f 2c     Suspected data
__bc44:     cmp $d4            ; $bc44: c5 d4     
            .hex 20            ; $bc46: 20        Suspected data
__bc47:     .hex d4            ; $bc47: d4        Suspected data
__bc48:     .hex c7 ec         ; $bc48: c7 ec     Invalid Opcode - DCP $ec
            jsr __c7ec         ; $bc4a: 20 ec c7  
            jmp ($6c18)        ; $bc4d: 6c 18 6c  

;-------------------------------------------------------------------------------
            and $2cff          ; $bc50: 2d ff 2c  
            rti                ; $bc53: 40        

;-------------------------------------------------------------------------------
            bit $44c3          ; $bc54: 2c c3 44  
            rti                ; $bc57: 40        

;-------------------------------------------------------------------------------
            .hex 44 c3         ; $bc58: 44 c3     Invalid Opcode - NOP $c3
            .hex 5c 40         ; $bc5a: 5c 40     Suspected data
__bc5c:     .hex 5c c3 74      ; $bc5c: 5c c3 74  Invalid Opcode - NOP $74c3,x
            rti                ; $bc5f: 40        

;-------------------------------------------------------------------------------
            .hex 74 c3         ; $bc60: 74 c3     Invalid Opcode - NOP $c3,x
            sty __8c40         ; $bc62: 8c 40 8c  
            .hex c3 a4         ; $bc65: c3 a4     Invalid Opcode - DCP ($a4,x)
            rti                ; $bc67: 40        

;-------------------------------------------------------------------------------
            ldy $c3            ; $bc68: a4 c3     
            ldy __bc40,x       ; $bc6a: bc 40 bc  
            .hex c3 d4         ; $bc6d: c3 d4     Invalid Opcode - DCP ($d4,x)
            rti                ; $bc6f: 40        

;-------------------------------------------------------------------------------
            .hex d4 c3         ; $bc70: d4 c3     Invalid Opcode - NOP $c3,x
            .hex ff 50 10      ; $bc72: ff 50 10  Invalid Opcode - ISC $1050,x
            bne __bc87         ; $bc75: d0 10     
            bvc __bc91         ; $bc77: 50 18     
            bvc __bcb2         ; $bc79: 50 37     
            bvc __bca8         ; $bc7b: 50 2b     
            eor __d040,x       ; $bc7d: 5d 40 d0  
            bit $f8            ; $bc80: 24 f8     
            bit $07            ; $bc82: 24 07     
            .hex 43            ; $bc84: 43        Suspected data
__bc85:     .hex 92            ; $bc85: 92        Invalid Opcode - KIL 
            pha                ; $bc86: 48        
__bc87:     bcc __bcd2         ; $bc87: 90 49     
            .hex cf 50 30      ; $bc89: cf 50 30  Invalid Opcode - DCP $3050
            adc ($4b),y        ; $bc8c: 71 4b     
            sei                ; $bc8e: 78        
            cpy #$89           ; $bc8f: c0 89     
__bc91:     .hex f7 90         ; $bc91: f7 90     Invalid Opcode - ISC $90,x
            bmi __bc2e         ; $bc93: 30 99     
            .hex 5d            ; $bc95: 5d        Suspected data
__bc96:     ldy #$0a           ; $bc96: a0 0a     
            brk                ; $bc98: 00        
            asl                ; $bc99: 0a        
            .hex ff f5 00      ; $bc9a: ff f5 00  Bad Addr Mode - ISC $00f5,x
            sbc $ff,x          ; $bc9d: f5 ff     
            .hex ff            ; $bc9f: ff        Suspected data
__bca0:     rti                ; $bca0: 40        

;-------------------------------------------------------------------------------
            .hex 14 d0         ; $bca1: 14 d0     Invalid Opcode - NOP $d0,x
            .hex 14 d0         ; $bca3: 14 d0     Invalid Opcode - NOP $d0,x
            .hex 2b fe         ; $bca5: 2b fe     Invalid Opcode - ANC #$fe
            .hex 2b            ; $bca7: 2b        Suspected data
__bca8:     brk                ; $bca8: 00        
            eor ($a5,x)        ; $bca9: 41 a5     
            .hex 47 50         ; $bcab: 47 50     Invalid Opcode - SRE $50
            clc                ; $bcad: 18        
            bvc __bcef         ; $bcae: 50 3f     
__bcb0:     bvc __bce1         ; $bcb0: 50 2f     
__bcb2:     .hex 5d 2f         ; $bcb2: 5d 2f     Suspected data
__bcb4:     .hex bb 41 cf      ; $bcb4: bb 41 cf  Invalid Opcode - LAS __cf41,y
            .hex 47 b4         ; $bcb7: 47 b4     Invalid Opcode - SRE $b4
            lda #$cb           ; $bcb9: a9 cb     
            .hex af d4 95      ; $bcbb: af d4 95  Invalid Opcode - LAX __95d4
            cpx $1095          ; $bcbe: ec 95 10  
            adc #$28           ; $bcc1: 69 28     
            .hex 6f d0 90      ; $bcc3: 6f d0 90  Invalid Opcode - RRA __90d0
            beq __bc5c         ; $bcc6: f0 94     
__bcc8:     asl                ; $bcc8: 0a        
            brk                ; $bcc9: 00        
            asl                ; $bcca: 0a        
            .hex ff f5 00      ; $bccb: ff f5 00  Bad Addr Mode - ISC $00f5,x
            sbc $ff,x          ; $bcce: f5 ff     
            .hex ff d0         ; $bcd0: ff d0     Suspected data
__bcd2:     .hex 1f ef 1f      ; $bcd2: 1f ef 1f  Invalid Opcode - SLO $1fef,x
            .hex 5c 28 5c      ; $bcd5: 5c 28 5c  Invalid Opcode - NOP $5c28,x
            rti                ; $bcd8: 40        

;-------------------------------------------------------------------------------
            rts                ; $bcd9: 60        

;-------------------------------------------------------------------------------
            .hex 42            ; $bcda: 42        Invalid Opcode - KIL 
            .hex c7 45         ; $bcdb: c7 45     Invalid Opcode - DCP $45
            bpl __bd2e         ; $bcdd: 10 4f     
            .hex 2b 4f         ; $bcdf: 2b 4f     Invalid Opcode - ANC #$4f
__bce1:     sec                ; $bce1: 38        
            .hex 72            ; $bce2: 72        Invalid Opcode - KIL 
            .hex c7 75         ; $bce3: c7 75     Invalid Opcode - DCP $75
            dex                ; $bce5: ca        
            .hex 7f ef 70      ; $bce6: 7f ef 70  Invalid Opcode - RRA $70ef,x
            sec                ; $bce9: 38        
            txs                ; $bcea: 9a        
            dec $9c            ; $bceb: c6 9c     
            bpl __bc96         ; $bced: 10 a7     
__bcef:     .hex 2f a7 38      ; $bcef: 2f a7 38  Invalid Opcode - RLA $38a7
            .hex c2 c6         ; $bcf2: c2 c6     Invalid Opcode - NOP #$c6
            cmp $40            ; $bcf4: c5 40     
            bpl __bcb0         ; $bcf6: 10 b8     
            bpl __bd42         ; $bcf8: 10 48     
            brk                ; $bcfa: 00        
            pha                ; $bcfb: 48        
            plp                ; $bcfc: 28        
            asl                ; $bcfd: 0a        
            brk                ; $bcfe: 00        
            asl                ; $bcff: 0a        
            .hex ff f5 00      ; $bd00: ff f5 00  Bad Addr Mode - ISC $00f5,x
            sbc $ff,x          ; $bd03: f5 ff     
            .hex ff 08 4f      ; $bd05: ff 08 4f  Invalid Opcode - ISC $4f08,x
            sed                ; $bd08: f8        
            .hex 4f 0a 00      ; $bd09: 4f 0a 00  Bad Addr Mode - SRE $000a
            asl                ; $bd0c: 0a        
            .hex ff f5 00      ; $bd0d: ff f5 00  Bad Addr Mode - ISC $00f5,x
            sbc $ff,x          ; $bd10: f5 ff     
            .hex ff            ; $bd12: ff        Suspected data
__bd13:     sbc ($f2),y        ; $bd13: f1 f2     
            lsr __f4f3,x       ; $bd15: 5e f3 f4  
            sbc $f6,x          ; $bd18: f5 f6     
__bd1a:     ora ($02,x)        ; $bd1a: 01 02     
            .hex 03 04         ; $bd1c: 03 04     Invalid Opcode - SLO ($04,x)
            php                ; $bd1e: 08        
            .hex 12            ; $bd1f: 12        Invalid Opcode - KIL 
            .hex 16            ; $bd20: 16        Suspected data
__bd21:     .hex 25            ; $bd21: 25        Suspected data
__bd22:     lda __bd29,x       ; $bd22: bd 29 bd  
            ora $1b0f,y        ; $bd25: 19 0f 1b  
            .hex 21            ; $bd28: 21        Suspected data
__bd29:     .hex 04 0f         ; $bd29: 04 0f     Invalid Opcode - NOP $0f
            asl $21            ; $bd2b: 06 21     
__bd2d:     brk                ; $bd2d: 00        
__bd2e:     ora $00            ; $bd2e: 05 00     
            ora ($04,x)        ; $bd30: 01 04     
            ora ($04,x)        ; $bd32: 01 04     
            ora ($04,x)        ; $bd34: 01 04     
            .hex 02            ; $bd36: 02        Invalid Opcode - KIL 
            .hex 04 05         ; $bd37: 04 05     Invalid Opcode - NOP $05
            brk                ; $bd39: 00        
            .hex 02            ; $bd3a: 02        Invalid Opcode - KIL 
            .hex 04 05         ; $bd3b: 04 05     Invalid Opcode - NOP $05
            .hex 04 05         ; $bd3d: 04 05     Invalid Opcode - NOP $05
            .hex 03 00         ; $bd3f: 03 00     Invalid Opcode - SLO ($00,x)
            .hex 05            ; $bd41: 05        Suspected data
__bd42:     ora ($03,x)        ; $bd42: 01 03     
            ora ($00,x)        ; $bd44: 01 00     
            .hex 04 02         ; $bd46: 04 02     Invalid Opcode - NOP $02
            ora ($04,x)        ; $bd48: 01 04     
            .hex 02            ; $bd4a: 02        Invalid Opcode - KIL 
            .hex 04 02         ; $bd4b: 04 02     Invalid Opcode - NOP $02
__bd4d:     and $2d01          ; $bd4d: 2d 01 2d  
            and __9603         ; $bd50: 2d 03 96  
            .hex 02            ; $bd53: 02        Invalid Opcode - KIL 
            .hex 0f 1e 1e      ; $bd54: 0f 1e 1e  Invalid Opcode - SLO $1e1e
            .hex 1f 01 2d      ; $bd57: 1f 01 2d  Invalid Opcode - SLO $2d01,x
            ror $0106,x        ; $bd5a: 7e 06 01  
            asl                ; $bd5d: 0a        
            ora ($01,x)        ; $bd5e: 01 01     
            .hex 0f 01 96      ; $bd60: 0f 01 96  Invalid Opcode - SLO __9601
            .hex 0c 3c 2d      ; $bd63: 0c 3c 2d  Invalid Opcode - NOP $2d3c
            .hex 02            ; $bd66: 02        Invalid Opcode - KIL 
            ora ($0f,x)        ; $bd67: 01 0f     
            .hex 04 2c         ; $bd69: 04 2c     Invalid Opcode - NOP $2c
            .hex 10            ; $bd6b: 10        Suspected data
__bd6c:     .hex ff            ; $bd6c: ff        Suspected data
__bd6d:     pha                ; $bd6d: 48        
            txa                ; $bd6e: 8a        
            pha                ; $bd6f: 48        
            tya                ; $bd70: 98        
            pha                ; $bd71: 48        
            lda $00            ; $bd72: a5 00     
            pha                ; $bd74: 48        
            lda $01            ; $bd75: a5 01     
            pha                ; $bd77: 48        
            lda $02            ; $bd78: a5 02     
            pha                ; $bd7a: 48        
            lda $03            ; $bd7b: a5 03     
            pha                ; $bd7d: 48        
            lda $04            ; $bd7e: a5 04     
            pha                ; $bd80: 48        
            lda $05            ; $bd81: a5 05     
            pha                ; $bd83: 48        
            lda $06            ; $bd84: a5 06     
            pha                ; $bd86: 48        
            lda $07            ; $bd87: a5 07     
            pha                ; $bd89: 48        
            lda $10            ; $bd8a: a5 10     
            and #$7f           ; $bd8c: 29 7f     
            sta $2000          ; $bd8e: 8d 00 20  
            sta $10            ; $bd91: 85 10     
            jsr __e483         ; $bd93: 20 83 e4  
            jsr __e46f         ; $bd96: 20 6f e4  
            jsr __c09d         ; $bd99: 20 9d c0  
            jsr __fff7         ; $bd9c: 20 f7 ff  
            jsr __e7eb         ; $bd9f: 20 eb e7  
            lda $47            ; $bda2: a5 47     
            bne __bdba         ; $bda4: d0 14     
            lda $46            ; $bda6: a5 46     
            beq __bdcd         ; $bda8: f0 23     
            lda $4d            ; $bdaa: a5 4d     
            bne __bdb4         ; $bdac: d0 06     
            jsr __c38a         ; $bdae: 20 8a c3  
            jmp __bdd0         ; $bdb1: 4c d0 bd  

;-------------------------------------------------------------------------------
__bdb4:     jsr __c5d8         ; $bdb4: 20 d8 c5  
            jmp __bdd0         ; $bdb7: 4c d0 bd  

;-------------------------------------------------------------------------------
__bdba:     lda $4c            ; $bdba: a5 4c     
            bne __bdc4         ; $bdbc: d0 06     
            jsr __be96         ; $bdbe: 20 96 be  
            jmp __bdd0         ; $bdc1: 4c d0 bd  

;-------------------------------------------------------------------------------
__bdc4:     jsr __bdfa         ; $bdc4: 20 fa bd  
            jsr __e781         ; $bdc7: 20 81 e7  
            jmp __bdd0         ; $bdca: 4c d0 bd  

;-------------------------------------------------------------------------------
__bdcd:     jsr __bf44         ; $bdcd: 20 44 bf  
__bdd0:     jsr __e40d         ; $bdd0: 20 0d e4  
            lda $10            ; $bdd3: a5 10     
            eor #$80           ; $bdd5: 49 80     
            sta $2000          ; $bdd7: 8d 00 20  
            sta $10            ; $bdda: 85 10     
            pla                ; $bddc: 68        
            sta $07            ; $bddd: 85 07     
            pla                ; $bddf: 68        
            sta $06            ; $bde0: 85 06     
            pla                ; $bde2: 68        
            sta $05            ; $bde3: 85 05     
            pla                ; $bde5: 68        
            sta $04            ; $bde6: 85 04     
            pla                ; $bde8: 68        
            sta $03            ; $bde9: 85 03     
            pla                ; $bdeb: 68        
            sta $02            ; $bdec: 85 02     
            pla                ; $bdee: 68        
            sta $01            ; $bdef: 85 01     
            pla                ; $bdf1: 68        
            sta $00            ; $bdf2: 85 00     
            pla                ; $bdf4: 68        
            tay                ; $bdf5: a8        
            pla                ; $bdf6: 68        
            tax                ; $bdf7: aa        
            pla                ; $bdf8: 68        
            rti                ; $bdf9: 40        

;-------------------------------------------------------------------------------
__bdfa:     lda $4e            ; $bdfa: a5 4e     
            bne __be1f         ; $bdfc: d0 21     
            lda #$10           ; $bdfe: a9 10     
            sta $ec            ; $be00: 85 ec     
            ldx #$0a           ; $be02: a2 0a     
            lda #$00           ; $be04: a9 00     
__be06:     sta $24,x          ; $be06: 95 24     
            dex                ; $be08: ca        
            bne __be06         ; $be09: d0 fb     
            lda $0106          ; $be0b: ad 06 01  
            sta $ef            ; $be0e: 85 ef     
            cmp #$02           ; $be10: c9 02     
            bmi __be1b         ; $be12: 30 07     
            lda #$1c           ; $be14: a9 1c     
            sta $48            ; $be16: 85 48     
            jmp __be1f         ; $be18: 4c 1f be  

;-------------------------------------------------------------------------------
__be1b:     lda #$18           ; $be1b: a9 18     
            sta $48            ; $be1d: 85 48     
__be1f:     jsr __e3d3         ; $be1f: 20 d3 e3  
            lda #$0f           ; $be22: a9 0f     
            sta $18            ; $be24: 85 18     
            lda #$13           ; $be26: a9 13     
            sta $19            ; $be28: 85 19     
            lda #$00           ; $be2a: a9 00     
            sta $47            ; $be2c: 85 47     
            sta $0586          ; $be2e: 8d 86 05  
            sta $0587          ; $be31: 8d 87 05  
            sta $46            ; $be34: 85 46     
            lda #$00           ; $be36: a9 00     
            sta $52            ; $be38: 85 52     
            sta $e8            ; $be3a: 85 e8     
            sta $6a            ; $be3c: 85 6a     
            lda #$01           ; $be3e: a9 01     
            sta $4a            ; $be40: 85 4a     
            sta $0580          ; $be42: 8d 80 05  
            sta $0581          ; $be45: 8d 81 05  
            lda $ef            ; $be48: a5 ef     
            and #$01           ; $be4a: 29 01     
            beq __be50         ; $be4c: f0 02     
            lda #$02           ; $be4e: a9 02     
__be50:     sta $4b            ; $be50: 85 4b     
            sta $0582          ; $be52: 8d 82 05  
            sta $0583          ; $be55: 8d 83 05  
            lda #$00           ; $be58: a9 00     
            sta $49            ; $be5a: 85 49     
            sta $05b0          ; $be5c: 8d b0 05  
            sta $05b1          ; $be5f: 8d b1 05  
            sta $fc            ; $be62: 85 fc     
            lda #$03           ; $be64: a9 03     
            ldx $4e            ; $be66: a6 4e     
            beq __be6c         ; $be68: f0 02     
            lda #$01           ; $be6a: a9 01     
__be6c:     sta $4c            ; $be6c: 85 4c     
            sta $0584          ; $be6e: 8d 84 05  
            sta $0585          ; $be71: 8d 85 05  
            sta $e9            ; $be74: 85 e9     
            lda $4e            ; $be76: a5 4e     
            bne __be88         ; $be78: d0 0e     
            lda #$80           ; $be7a: a9 80     
            sta $39            ; $be7c: 85 39     
            lda #$01           ; $be7e: a9 01     
            sta $fd            ; $be80: 85 fd     
            lda #$0f           ; $be82: a9 0f     
            sta $4015          ; $be84: 8d 15 40  
            rts                ; $be87: 60        

;-------------------------------------------------------------------------------
__be88:     dec $05b4          ; $be88: ce b4 05  
            lda #$6f           ; $be8b: a9 6f     
            sta $39            ; $be8d: 85 39     
            lda #$0a           ; $be8f: a9 0a     
            sta $34            ; $be91: 85 34     
            jmp __c028         ; $be93: 4c 28 c0  

;-------------------------------------------------------------------------------
__be96:     jsr __e781         ; $be96: 20 81 e7  
            lda $4e            ; $be99: a5 4e     
            bne __beb0         ; $be9b: d0 13     
            lda $39            ; $be9d: a5 39     
            cmp #$75           ; $be9f: c9 75     
            beq __bec8         ; $bea1: f0 25     
            cmp #$74           ; $bea3: c9 74     
            beq __bed7         ; $bea5: f0 30     
            cmp #$73           ; $bea7: c9 73     
            beq __bedd         ; $bea9: f0 32     
            cmp #$5f           ; $beab: c9 5f     
            beq __bee6         ; $bead: f0 37     
            rts                ; $beaf: 60        

;-------------------------------------------------------------------------------
__beb0:     sta $4c            ; $beb0: 85 4c     
            lda #$00           ; $beb2: a9 00     
            sta $4e            ; $beb4: 85 4e     
            sta $52            ; $beb6: 85 52     
            lda #$40           ; $beb8: a9 40     
            sta $0103          ; $beba: 8d 03 01  
__bebd:     lda #$00           ; $bebd: a9 00     
            sta $0104          ; $bebf: 8d 04 01  
            jsr __c035         ; $bec2: 20 35 c0  
            jmp __c028         ; $bec5: 4c 28 c0  

;-------------------------------------------------------------------------------
__bec8:     lda $4a            ; $bec8: a5 4a     
            cmp #$02           ; $beca: c9 02     
            bne __bed1         ; $becc: d0 03     
            jsr __d822         ; $bece: 20 22 d8  
__bed1:     jsr __c028         ; $bed1: 20 28 c0  
            dec $39            ; $bed4: c6 39     
            rts                ; $bed6: 60        

;-------------------------------------------------------------------------------
__bed7:     jsr __c057         ; $bed7: 20 57 c0  
            dec $39            ; $beda: c6 39     
            rts                ; $bedc: 60        

;-------------------------------------------------------------------------------
__bedd:     jsr __c082         ; $bedd: 20 82 c0  
            jsr __e3c2         ; $bee0: 20 c2 e3  
            dec $39            ; $bee3: c6 39     
            rts                ; $bee5: 60        

;-------------------------------------------------------------------------------
__bee6:     ldx $49            ; $bee6: a6 49     
            lda #$01           ; $bee8: a9 01     
            sta $0586,x        ; $beea: 9d 86 05  
            sta $47            ; $beed: 85 47     
            lda $48            ; $beef: a5 48     
            cmp #$1c           ; $bef1: c9 1c     
            bne __bf01         ; $bef3: d0 0c     
            lda $49            ; $bef5: a5 49     
            eor #$01           ; $bef7: 49 01     
            tax                ; $bef9: aa        
            lda $0586,x        ; $befa: bd 86 05  
            sta $47            ; $befd: 85 47     
            beq __bf14         ; $beff: f0 13     
__bf01:     sta $4c            ; $bf01: 85 4c     
            jsr __c028         ; $bf03: 20 28 c0  
            jsr __c035         ; $bf06: 20 35 c0  
            lda #$40           ; $bf09: a9 40     
            sta $0103          ; $bf0b: 8d 03 01  
            lda #$00           ; $bf0e: a9 00     
            sta $0104          ; $bf10: 8d 04 01  
            rts                ; $bf13: 60        

;-------------------------------------------------------------------------------
__bf14:     ldy #$00           ; $bf14: a0 00     
            sty $46            ; $bf16: 84 46     
            stx $49            ; $bf18: 86 49     
            jsr __bf24         ; $bf1a: 20 24 bf  
            lda #$85           ; $bf1d: a9 85     
            sta $39            ; $bf1f: 85 39     
            sta $e9            ; $bf21: 85 e9     
            rts                ; $bf23: 60        

;-------------------------------------------------------------------------------
__bf24:     ldy #$00           ; $bf24: a0 00     
__bf26:     lda $0580,x        ; $bf26: bd 80 05  
            sta $004a,y        ; $bf29: 99 4a 00  
            inx                ; $bf2c: e8        
            inx                ; $bf2d: e8        
            iny                ; $bf2e: c8        
            cpy #$03           ; $bf2f: c0 03     
            bne __bf26         ; $bf31: d0 f3     
            rts                ; $bf33: 60        

;-------------------------------------------------------------------------------
__bf34:     ldy #$00           ; $bf34: a0 00     
__bf36:     lda $004a,y        ; $bf36: b9 4a 00  
            sta $0580,x        ; $bf39: 9d 80 05  
            inx                ; $bf3c: e8        
            inx                ; $bf3d: e8        
            iny                ; $bf3e: c8        
            cpy #$03           ; $bf3f: c0 03     
            bne __bf36         ; $bf41: d0 f3     
            rts                ; $bf43: 60        

;-------------------------------------------------------------------------------
__bf44:     jsr __e781         ; $bf44: 20 81 e7  
            lda $39            ; $bf47: a5 39     
            cmp #$84           ; $bf49: c9 84     
            beq __bf61         ; $bf4b: f0 14     
            cmp #$6e           ; $bf4d: c9 6e     
            bcs __bf77         ; $bf4f: b0 26     
            cmp #$68           ; $bf51: c9 68     
            bne __bf60         ; $bf53: d0 0b     
            jsr __c0a5         ; $bf55: 20 a5 c0  
            lda #$01           ; $bf58: a9 01     
            sta $46            ; $bf5a: 85 46     
            lda #$00           ; $bf5c: a9 00     
            sta $39            ; $bf5e: 85 39     
__bf60:     rts                ; $bf60: 60        

;-------------------------------------------------------------------------------
__bf61:     ldx $49            ; $bf61: a6 49     
            lda $4a            ; $bf63: a5 4a     
            cmp $0580,x        ; $bf65: dd 80 05  
            beq __bf74         ; $bf68: f0 0a     
            cmp #$01           ; $bf6a: c9 01     
            beq __bf74         ; $bf6c: f0 06     
            jsr __c663         ; $bf6e: 20 63 c6  
            jsr __c4f1         ; $bf71: 20 f1 c4  
__bf74:     dec $39            ; $bf74: c6 39     
            rts                ; $bf76: 60        

;-------------------------------------------------------------------------------
__bf77:     cmp #$74           ; $bf77: c9 74     
            beq __bf84         ; $bf79: f0 09     
            cmp #$6f           ; $bf7b: c9 6f     
            beq __bf9b         ; $bf7d: f0 1c     
            cmp #$6e           ; $bf7f: c9 6e     
            beq __bfa1         ; $bf81: f0 1e     
            rts                ; $bf83: 60        

;-------------------------------------------------------------------------------
__bf84:     lda #$49           ; $bf84: a9 49     
            sta $00            ; $bf86: 85 00     
            lda #$f2           ; $bf88: a9 f2     
            sta $01            ; $bf8a: 85 01     
            jsr __e50f         ; $bf8c: 20 0f e5  
            jsr __c028         ; $bf8f: 20 28 c0  
            jsr __c035         ; $bf92: 20 35 c0  
            jsr __c057         ; $bf95: 20 57 c0  
            dec $39            ; $bf98: c6 39     
            rts                ; $bf9a: 60        

;-------------------------------------------------------------------------------
__bf9b:     jsr __c035         ; $bf9b: 20 35 c0  
            dec $39            ; $bf9e: c6 39     
            rts                ; $bfa0: 60        

;-------------------------------------------------------------------------------
__bfa1:     jsr __c093         ; $bfa1: 20 93 c0  
            lda #$10           ; $bfa4: a9 10     
            sta $2000          ; $bfa6: 8d 00 20  
            sta $10            ; $bfa9: 85 10     
            ldx $4a            ; $bfab: a6 4a     
            dex                ; $bfad: ca        
            txa                ; $bfae: 8a        
            asl                ; $bfaf: 0a        
            sta $08            ; $bfb0: 85 08     
            tax                ; $bfb2: aa        
            lda __babc,x       ; $bfb3: bd bc ba  
            sta $00            ; $bfb6: 85 00     
            lda __babd,x       ; $bfb8: bd bd ba  
            sta $01            ; $bfbb: 85 01     
            jsr __e50f         ; $bfbd: 20 0f e5  
            lda $4a            ; $bfc0: a5 4a     
            cmp #$04           ; $bfc2: c9 04     
            beq __bfd1         ; $bfc4: f0 0b     
            lda #$5f           ; $bfc6: a9 5f     
            sta $00            ; $bfc8: 85 00     
            lda #$ed           ; $bfca: a9 ed     
            sta $01            ; $bfcc: 85 01     
            jsr __e50f         ; $bfce: 20 0f e5  
__bfd1:     lda $48            ; $bfd1: a5 48     
            cmp #$1c           ; $bfd3: c9 1c     
            beq __bfea         ; $bfd5: f0 13     
            lda #$75           ; $bfd7: a9 75     
            sta $00            ; $bfd9: 85 00     
            lda #$20           ; $bfdb: a9 20     
            sta $01            ; $bfdd: 85 01     
            lda #$2a           ; $bfdf: a9 2a     
            sta $02            ; $bfe1: 85 02     
            lda #$bb           ; $bfe3: a9 bb     
            sta $03            ; $bfe5: 85 03     
            jsr __e5a1         ; $bfe7: 20 a1 e5  
__bfea:     jsr __e27c         ; $bfea: 20 7c e2  
            jsr __c04a         ; $bfed: 20 4a c0  
            lda #$bc           ; $bff0: a9 bc     
            sta $00            ; $bff2: 85 00     
            ldy $4b            ; $bff4: a4 4b     
            lda $ef            ; $bff6: a5 ef     
            and #$01           ; $bff8: 29 01     
            beq __bffe         ; $bffa: f0 02     
            dey                ; $bffc: 88        
            dey                ; $bffd: 88        
__bffe:     iny                ; $bffe: c8        
            jsr __e797         ; $bfff: 20 97 e7  
            lda #$00           ; $c002: a9 00     
            sta $2c            ; $c004: 85 2c     
            lda #$80           ; $c006: a9 80     
            dey                ; $c008: 88        
            cpy #$04           ; $c009: c0 04     
            bpl __c010         ; $c00b: 10 03     
            lda __b71d,y       ; $c00d: b9 1d b7  
__c010:     sta $2e            ; $c010: 85 2e     
            lda #$1b           ; $c012: a9 1b     
            sta $3c            ; $c014: 85 3c     
            lda #$02           ; $c016: a9 02     
            sta $00            ; $c018: 85 00     
            jsr __e523         ; $c01a: 20 23 e5  
            dec $39            ; $c01d: c6 39     
            lda $4e            ; $c01f: a5 4e     
            beq __c027         ; $c021: f0 04     
            lda #$69           ; $c023: a9 69     
            sta $39            ; $c025: 85 39     
__c027:     rts                ; $c027: 60        

;-------------------------------------------------------------------------------
__c028:     lda #$00           ; $c028: a9 00     
            sta $04            ; $c02a: 85 04     
            lda #$ff           ; $c02c: a9 ff     
            sta $03            ; $c02e: 85 03     
            lda #$0f           ; $c030: a9 0f     
            jmp __dfe1         ; $c032: 4c e1 df  

;-------------------------------------------------------------------------------
__c035:     lda #$24           ; $c035: a9 24     
            sta $00            ; $c037: 85 00     
            lda #$01           ; $c039: a9 01     
            sta $01            ; $c03b: 85 01     
            jsr __c093         ; $c03d: 20 93 c0  
            lda #$10           ; $c040: a9 10     
            sta $2000          ; $c042: 8d 00 20  
            sta $10            ; $c045: 85 10     
            jmp __e48e         ; $c047: 4c 8e e4  

;-------------------------------------------------------------------------------
__c04a:     lda #$b5           ; $c04a: a9 b5     
            sta $00            ; $c04c: 85 00     
            lda #$20           ; $c04e: a9 20     
            sta $01            ; $c050: 85 01     
            ldy $4c            ; $c052: a4 4c     
            jmp __e797         ; $c054: 4c 97 e7  

;-------------------------------------------------------------------------------
__c057:     lda $4e            ; $c057: a5 4e     
            bne __c081         ; $c059: d0 26     
            lda $48            ; $c05b: a5 48     
            cmp #$1c           ; $c05d: c9 1c     
            bne __c081         ; $c05f: d0 20     
            ldx $49            ; $c061: a6 49     
            lda $4a            ; $c063: a5 4a     
            cmp $0580,x        ; $c065: dd 80 05  
            bne __c081         ; $c068: d0 17     
            ldy #$00           ; $c06a: a0 00     
__c06c:     lda __baf3,y       ; $c06c: b9 f3 ba  
            sta $0331,y        ; $c06f: 99 31 03  
            beq __c078         ; $c072: f0 04     
            iny                ; $c074: c8        
            jmp __c06c         ; $c075: 4c 6c c0  

;-------------------------------------------------------------------------------
__c078:     lda $49            ; $c078: a5 49     
            beq __c081         ; $c07a: f0 05     
            lda #$c1           ; $c07c: a9 c1     
            sta $0345          ; $c07e: 8d 45 03  
__c081:     rts                ; $c081: 60        

;-------------------------------------------------------------------------------
__c082:     ldy #$00           ; $c082: a0 00     
__c084:     lda __bb0b,y       ; $c084: b9 0b bb  
            sta $0331,y        ; $c087: 99 31 03  
            beq __c090         ; $c08a: f0 04     
            iny                ; $c08c: c8        
            jmp __c084         ; $c08d: 4c 84 c0  

;-------------------------------------------------------------------------------
__c090:     jmp __e3c2         ; $c090: 4c c2 e3  

;-------------------------------------------------------------------------------
__c093:     lda $11            ; $c093: a5 11     
            and #$e7           ; $c095: 29 e7     
            sta $2001          ; $c097: 8d 01 20  
            sta $11            ; $c09a: 85 11     
            rts                ; $c09c: 60        

;-------------------------------------------------------------------------------
__c09d:     lda $11            ; $c09d: a5 11     
            .hex 49            ; $c09f: 49        Suspected data
__c0a0:     clc                ; $c0a0: 18        
            sta $2001          ; $c0a1: 8d 01 20  
            rts                ; $c0a4: 60        

;-------------------------------------------------------------------------------
__c0a5:     lda #$00           ; $c0a5: a9 00     
            ldx #$53           ; $c0a7: a2 53     
__c0a9:     sta $00,x          ; $c0a9: 95 00     
            inx                ; $c0ab: e8        
            cpx #$e9           ; $c0ac: e0 e9     
            bne __c0a9         ; $c0ae: d0 f9     
            lda #$01           ; $c0b0: a9 01     
            sta $6b            ; $c0b2: 85 6b     
            sta $9a            ; $c0b4: 85 9a     
            sta $9b            ; $c0b6: 85 9b     
__c0b8:     sta $9c            ; $c0b8: 85 9c     
            sta $9d            ; $c0ba: 85 9d     
            sta $87            ; $c0bc: 85 87     
            sta $89            ; $c0be: 85 89     
            lda $4a            ; $c0c0: a5 4a     
            and #$01           ; $c0c2: 29 01     
            eor #$01           ; $c0c4: 49 01     
            sta $6d            ; $c0c6: 85 6d     
            lda #$02           ; $c0c8: a9 02     
            sta $7a            ; $c0ca: 85 7a     
            lda #$60           ; $c0cc: a9 60     
            sta $86            ; $c0ce: 85 86     
            sta $88            ; $c0d0: 85 88     
            lda #$a0           ; $c0d2: a9 a0     
            sta $7c            ; $c0d4: 85 7c     
            lda #$16           ; $c0d6: a9 16     
            sta $7b            ; $c0d8: 85 7b     
            lda #$32           ; $c0da: a9 32     
            sta $64            ; $c0dc: 85 64     
            lda #$24           ; $c0de: a9 24     
            sta $65            ; $c0e0: 85 65     
            ldx $08            ; $c0e2: a6 08     
            lda __ba08,x       ; $c0e4: bd 08 ba  
            sta $91            ; $c0e7: 85 91     
            lda __ba09,x       ; $c0e9: bd 09 ba  
            sta $92            ; $c0ec: 85 92     
            ldy #$00           ; $c0ee: a0 00     
            lda ($91),y        ; $c0f0: b1 91     
            sta $93            ; $c0f2: 85 93     
            lda #$01           ; $c0f4: a9 01     
            sta $02            ; $c0f6: 85 02     
            lda #$08           ; $c0f8: a9 08     
            sta $03            ; $c0fa: 85 03     
            lda #$10           ; $c0fc: a9 10     
            sta $04            ; $c0fe: 85 04     
            jsr __dfdf         ; $c100: 20 df df  
            lda $08            ; $c103: a5 08     
            asl                ; $c105: 0a        
            tay                ; $c106: a8        
            ldx #$00           ; $c107: a2 00     
__c109:     lda __b9cc,y       ; $c109: b9 cc b9  
            sta $8d,x          ; $c10c: 95 8d     
            iny                ; $c10e: c8        
            inx                ; $c10f: e8        
            cpx #$04           ; $c110: e0 04     
            bne __c109         ; $c112: d0 f5     
            ldy $4a            ; $c114: a4 4a     
            jsr __c1a7         ; $c116: 20 a7 c1  
            ldx $08            ; $c119: a6 08     
            jsr __c27a         ; $c11b: 20 7a c2  
            lda $e9            ; $c11e: a5 e9     
            beq __c12b         ; $c120: f0 09     
            lda #$00           ; $c122: a9 00     
            sta $e9            ; $c124: 85 e9     
            dec $4c            ; $c126: c6 4c     
            jsr __c04a         ; $c128: 20 4a c0  
__c12b:     lda $4b            ; $c12b: a5 4b     
            pha                ; $c12d: 48        
            cmp #$06           ; $c12e: c9 06     
            bmi __c136         ; $c130: 30 04     
            lda #$05           ; $c132: a9 05     
            sta $4b            ; $c134: 85 4b     
__c136:     jsr __c141         ; $c136: 20 41 c1  
            pla                ; $c139: 68        
            sta $4b            ; $c13a: 85 4b     
            ldx $49            ; $c13c: a6 49     
            jmp __bf34         ; $c13e: 4c 34 bf  

;-------------------------------------------------------------------------------
__c141:     lda $4a            ; $c141: a5 4a     
            cmp #$01           ; $c143: c9 01     
            beq __c167         ; $c145: f0 20     
            cmp #$02           ; $c147: c9 02     
            beq __c17c         ; $c149: f0 31     
            cmp #$03           ; $c14b: c9 03     
            beq __c190         ; $c14d: f0 41     
            jsr __c24c         ; $c14f: 20 4c c2  
            jsr __c2db         ; $c152: 20 db c2  
            jsr __c33f         ; $c155: 20 3f c3  
            jsr __c375         ; $c158: 20 75 c3  
            lda #$02           ; $c15b: a9 02     
            sta $00            ; $c15d: 85 00     
            jsr __c28d         ; $c15f: 20 8d c2  
            lda #$10           ; $c162: a9 10     
            sta $fc            ; $c164: 85 fc     
            rts                ; $c166: 60        

;-------------------------------------------------------------------------------
__c167:     jsr __c1ca         ; $c167: 20 ca c1  
            jsr __c2db         ; $c16a: 20 db c2  
            jsr __c308         ; $c16d: 20 08 c3  
            lda $a0            ; $c170: a5 a0     
            sta $00            ; $c172: 85 00     
            jsr __c28d         ; $c174: 20 8d c2  
            lda #$02           ; $c177: a9 02     
            sta $fc            ; $c179: 85 fc     
            rts                ; $c17b: 60        

;-------------------------------------------------------------------------------
__c17c:     jsr __c1d3         ; $c17c: 20 d3 c1  
            jsr __c325         ; $c17f: 20 25 c3  
            jsr __c375         ; $c182: 20 75 c3  
            jsr __c2b2         ; $c185: 20 b2 c2  
            jsr __d817         ; $c188: 20 17 d8  
            lda #$04           ; $c18b: a9 04     
            sta $fc            ; $c18d: 85 fc     
            rts                ; $c18f: 60        

;-------------------------------------------------------------------------------
__c190:     jsr __c22f         ; $c190: 20 2f c2  
            jsr __c32a         ; $c193: 20 2a c3  
            jsr __c33a         ; $c196: 20 3a c3  
            jsr __c375         ; $c199: 20 75 c3  
            jsr __c29e         ; $c19c: 20 9e c2  
            jsr __c2a5         ; $c19f: 20 a5 c2  
            lda #$08           ; $c1a2: a9 08     
            sta $fc            ; $c1a4: 85 fc     
            rts                ; $c1a6: 60        

;-------------------------------------------------------------------------------
__c1a7:     ldx #$00           ; $c1a7: a2 00     
__c1a9:     lda __b8c7,x       ; $c1a9: bd c7 b8  
            cmp #$ff           ; $c1ac: c9 ff     
            beq __c1c5         ; $c1ae: f0 15     
            sta $02            ; $c1b0: 85 02     
            lda __b8c8,x       ; $c1b2: bd c8 b8  
            sta $03            ; $c1b5: 85 03     
            lda __b8c9,x       ; $c1b7: bd c9 b8  
            sta $04            ; $c1ba: 85 04     
            jsr __dfdf         ; $c1bc: 20 df df  
            inx                ; $c1bf: e8        
            inx                ; $c1c0: e8        
            inx                ; $c1c1: e8        
            jmp __c1a9         ; $c1c2: 4c a9 c1  

;-------------------------------------------------------------------------------
__c1c5:     inx                ; $c1c5: e8        
            dey                ; $c1c6: 88        
            bne __c1a9         ; $c1c7: d0 e0     
            rts                ; $c1c9: 60        

;-------------------------------------------------------------------------------
__c1ca:     lda #$01           ; $c1ca: a9 01     
            sta $a2            ; $c1cc: 85 a2     
            lda #$04           ; $c1ce: a9 04     
            sta $b0            ; $c1d0: 85 b0     
            rts                ; $c1d2: 60        

;-------------------------------------------------------------------------------
__c1d3:     lda $4b            ; $c1d3: a5 4b     
            cmp #$04           ; $c1d5: c9 04     
            bcc __c1e2         ; $c1d7: 90 09     
            lda #$38           ; $c1d9: a9 38     
            sta $a3            ; $c1db: 85 a3     
            lda #$64           ; $c1dd: a9 64     
            jmp __c1e8         ; $c1df: 4c e8 c1  

;-------------------------------------------------------------------------------
__c1e2:     lda #$38           ; $c1e2: a9 38     
            sta $a3            ; $c1e4: 85 a3     
            lda #$57           ; $c1e6: a9 57     
__c1e8:     sta $a4            ; $c1e8: 85 a4     
            lda #$84           ; $c1ea: a9 84     
            sta $a5            ; $c1ec: 85 a5     
            lda #$68           ; $c1ee: a9 68     
            sta $a6            ; $c1f0: 85 a6     
            lda #$78           ; $c1f2: a9 78     
            sta $a7            ; $c1f4: 85 a7     
            lda #$9d           ; $c1f6: a9 9d     
            sta $a8            ; $c1f8: 85 a8     
            lda #$0e           ; $c1fa: a9 0e     
            sta $b4            ; $c1fc: 85 b4     
            lda #$b9           ; $c1fe: a9 b9     
            sta $b5            ; $c200: 85 b5     
            ldy #$00           ; $c202: a0 00     
__c204:     lda __bb84,y       ; $c204: b9 84 bb  
            sta $0400,y        ; $c207: 99 00 04  
            lda __bc00,y       ; $c20a: b9 00 bc  
            sta $0450,y        ; $c20d: 99 50 04  
            lda __bca0,y       ; $c210: b9 a0 bc  
            sta $04a0,y        ; $c213: 99 a0 04  
            iny                ; $c216: c8        
            cpy #$40           ; $c217: c0 40     
            bne __c204         ; $c219: d0 e9     
            lda #$ff           ; $c21b: a9 ff     
            sta $042c          ; $c21d: 8d 2c 04  
            sta $0494          ; $c220: 8d 94 04  
            sta $04d4          ; $c223: 8d d4 04  
            ldx $4b            ; $c226: a6 4b     
            lda __b7b2,x       ; $c228: bd b2 b7  
            sta $0530          ; $c22b: 8d 30 05  
            rts                ; $c22e: 60        

;-------------------------------------------------------------------------------
__c22f:     lda #$ff           ; $c22f: a9 ff     
            sta $c3            ; $c231: 85 c3     
            lda #$60           ; $c233: a9 60     
            sta $cf            ; $c235: 85 cf     
            lda #$01           ; $c237: a9 01     
            sta $b2            ; $c239: 85 b2     
            ldx #$05           ; $c23b: a2 05     
__c23d:     sta $0522,x        ; $c23d: 9d 22 05  
            dex                ; $c240: ca        
            bpl __c23d         ; $c241: 10 fa     
            lda #$20           ; $c243: a9 20     
            sta $b4            ; $c245: 85 b4     
            lda #$b9           ; $c247: a9 b9     
            sta $b5            ; $c249: 85 b5     
            rts                ; $c24b: 60        

;-------------------------------------------------------------------------------
__c24c:     lda #$01           ; $c24c: a9 01     
            sta $a2            ; $c24e: 85 a2     
            lda #$28           ; $c250: a9 28     
            sta $b4            ; $c252: 85 b4     
            lda #$b9           ; $c254: a9 b9     
            sta $b5            ; $c256: 85 b5     
            ldx #$0b           ; $c258: a2 0b     
            ldy #$05           ; $c25a: a0 05     
__c25c:     lda #$b0           ; $c25c: a9 b0     
            sta $05e7,x        ; $c25e: 9d e7 05  
            lda #$22           ; $c261: a9 22     
            sta $db,x          ; $c263: 95 db     
            dex                ; $c265: ca        
            lda __b9c0,y       ; $c266: b9 c0 b9  
            sta $05e7,x        ; $c269: 9d e7 05  
            lda __b9c6,y       ; $c26c: b9 c6 b9  
            sta $db,x          ; $c26f: 95 db     
            dey                ; $c271: 88        
            dex                ; $c272: ca        
            bpl __c25c         ; $c273: 10 e7     
            lda #$24           ; $c275: a9 24     
            sta $da            ; $c277: 85 da     
            rts                ; $c279: 60        

;-------------------------------------------------------------------------------
__c27a:     lda __b854,x       ; $c27a: bd 54 b8  
            sta $00            ; $c27d: 85 00     
            lda __b855,x       ; $c27f: bd 55 b8  
            sta $01            ; $c282: 85 01     
            lda #$50           ; $c284: a9 50     
            sta $02            ; $c286: 85 02     
            lda #$00           ; $c288: a9 00     
            jmp __dfc8         ; $c28a: 4c c8 df  

;-------------------------------------------------------------------------------
__c28d:     ldx $4a            ; $c28d: a6 4a     
            dex                ; $c28f: ca        
            bne __c297         ; $c290: d0 05     
            ldy #$00           ; $c292: a0 00     
            jmp __c299         ; $c294: 4c 99 c2  

;-------------------------------------------------------------------------------
__c297:     ldy #$14           ; $c297: a0 14     
__c299:     ldx $00            ; $c299: a6 00     
            jmp __c2b6         ; $c29b: 4c b6 c2  

;-------------------------------------------------------------------------------
__c29e:     ldx $a0            ; $c29e: a6 a0     
            ldy #$1e           ; $c2a0: a0 1e     
            jmp __c2b6         ; $c2a2: 4c b6 c2  

;-------------------------------------------------------------------------------
__c2a5:     ldx $b0            ; $c2a5: a6 b0     
            cpx #$05           ; $c2a7: e0 05     
            bmi __c2ad         ; $c2a9: 30 02     
            ldx #$04           ; $c2ab: a2 04     
__c2ad:     ldy #$37           ; $c2ad: a0 37     
            jmp __c2b6         ; $c2af: 4c b6 c2  

;-------------------------------------------------------------------------------
__c2b2:     ldx #$06           ; $c2b2: a2 06     
            ldy #$4b           ; $c2b4: a0 4b     
__c2b6:     lda __b85e,y       ; $c2b6: b9 5e b8  
            sta $00            ; $c2b9: 85 00     
            lda __b85f,y       ; $c2bb: b9 5f b8  
            sta $01            ; $c2be: 85 01     
            lda __b860,y       ; $c2c0: b9 60 b8  
            sta $02            ; $c2c3: 85 02     
            lda __b861,y       ; $c2c5: b9 61 b8  
            sta $03            ; $c2c8: 85 03     
            lda __b862,y       ; $c2ca: b9 62 b8  
            sta $04            ; $c2cd: 85 04     
            jsr __dfd5         ; $c2cf: 20 d5 df  
__c2d2:     iny                ; $c2d2: c8        
            iny                ; $c2d3: c8        
            iny                ; $c2d4: c8        
            iny                ; $c2d5: c8        
            iny                ; $c2d6: c8        
            dex                ; $c2d7: ca        
            bne __c2b6         ; $c2d8: d0 dc     
            rts                ; $c2da: 60        

;-------------------------------------------------------------------------------
__c2db:     lda #$00           ; $c2db: a9 00     
            ldx $4b            ; $c2dd: a6 4b     
__c2df:     cpx #$00           ; $c2df: e0 00     
            beq __c2ea         ; $c2e1: f0 07     
            clc                ; $c2e3: 18        
            adc #$10           ; $c2e4: 69 10     
            dex                ; $c2e6: ca        
            jmp __c2df         ; $c2e7: 4c df c2  

;-------------------------------------------------------------------------------
__c2ea:     ldy $4a            ; $c2ea: a4 4a     
            dey                ; $c2ec: 88        
            beq __c2f2         ; $c2ed: f0 03     
            clc                ; $c2ef: 18        
            adc #$08           ; $c2f0: 69 08     
__c2f2:     tay                ; $c2f2: a8        
            lda __b72e,y       ; $c2f3: b9 2e b7  
            sta $a0            ; $c2f6: 85 a0     
            ldx #$00           ; $c2f8: a2 00     
            iny                ; $c2fa: c8        
__c2fb:     lda __b72e,y       ; $c2fb: b9 2e b7  
            sta $0500,x        ; $c2fe: 9d 00 05  
            iny                ; $c301: c8        
            inx                ; $c302: e8        
            cpx #$07           ; $c303: e0 07     
            bne __c2fb         ; $c305: d0 f4     
            rts                ; $c307: 60        

;-------------------------------------------------------------------------------
__c308:     lda #$00           ; $c308: a9 00     
            ldx $4b            ; $c30a: a6 4b     
__c30c:     cpx #$00           ; $c30c: e0 00     
            beq __c317         ; $c30e: f0 07     
            clc                ; $c310: 18        
            adc #$06           ; $c311: 69 06     
            dex                ; $c313: ca        
            jmp __c30c         ; $c314: 4c 0c c3  

;-------------------------------------------------------------------------------
__c317:     tay                ; $c317: a8        
__c318:     lda __b78e,y       ; $c318: b9 8e b7  
            sta $0510,x        ; $c31b: 9d 10 05  
            iny                ; $c31e: c8        
            inx                ; $c31f: e8        
            cpx #$06           ; $c320: e0 06     
            bne __c318         ; $c322: d0 f4     
            rts                ; $c324: 60        

;-------------------------------------------------------------------------------
__c325:     ldy #$00           ; $c325: a0 00     
            jmp __c341         ; $c327: 4c 41 c3  

;-------------------------------------------------------------------------------
__c32a:     lda $4b            ; $c32a: a5 4b     
            asl                ; $c32c: 0a        
            tay                ; $c32d: a8        
            lda __b7e2,y       ; $c32e: b9 e2 b7  
            sta $a0            ; $c331: 85 a0     
            lda __b7e3,y       ; $c333: b9 e3 b7  
            sta $0540          ; $c336: 8d 40 05  
            rts                ; $c339: 60        

;-------------------------------------------------------------------------------
__c33a:     ldy #$04           ; $c33a: a0 04     
            jmp __c341         ; $c33c: 4c 41 c3  

;-------------------------------------------------------------------------------
__c33f:     ldy #$08           ; $c33f: a0 08     
__c341:     lda __b722,y       ; $c341: b9 22 b7  
            sta $00            ; $c344: 85 00     
            lda __b723,y       ; $c346: b9 23 b7  
            sta $01            ; $c349: 85 01     
            lda __b724,y       ; $c34b: b9 24 b7  
            sta $02            ; $c34e: 85 02     
            lda __b725,y       ; $c350: b9 25 b7  
            sta $03            ; $c353: 85 03     
            lda #$00           ; $c355: a9 00     
            ldx $4b            ; $c357: a6 4b     
__c359:     cpx #$00           ; $c359: e0 00     
            beq __c363         ; $c35b: f0 06     
            clc                ; $c35d: 18        
            adc $00            ; $c35e: 65 00     
            dex                ; $c360: ca        
            bne __c359         ; $c361: d0 f6     
__c363:     tay                ; $c363: a8        
            lda ($02),y        ; $c364: b1 02     
            sta $b0            ; $c366: 85 b0     
            iny                ; $c368: c8        
__c369:     lda ($02),y        ; $c369: b1 02     
            sta $0520,x        ; $c36b: 9d 20 05  
            iny                ; $c36e: c8        
            inx                ; $c36f: e8        
            cpx $01            ; $c370: e4 01     
            bne __c369         ; $c372: d0 f5     
            rts                ; $c374: 60        

;-------------------------------------------------------------------------------
__c375:     ldy $4a            ; $c375: a4 4a     
            dey                ; $c377: 88        
            dey                ; $c378: 88        
            ldx #$00           ; $c379: a2 00     
__c37b:     lda __b836,y       ; $c37b: b9 36 b8  
            sta $0570,x        ; $c37e: 9d 70 05  
            iny                ; $c381: c8        
            iny                ; $c382: c8        
            iny                ; $c383: c8        
            inx                ; $c384: e8        
            cpx #$0a           ; $c385: e0 0a     
            bne __c37b         ; $c387: d0 f2     
            rts                ; $c389: 60        

;-------------------------------------------------------------------------------
__c38a:     lda $4e            ; $c38a: a5 4e     
            beq __c39f         ; $c38c: f0 11     
            lda $06a2          ; $c38e: ad a2 06  
            bne __c396         ; $c391: d0 03     
            sta $4015          ; $c393: 8d 15 40  
__c396:     lda $15            ; $c396: a5 15     
            and #$20           ; $c398: 29 20     
            beq __c39f         ; $c39a: f0 03     
            jmp __c3ff         ; $c39c: 4c ff c3  

;-------------------------------------------------------------------------------
__c39f:     lda $eb            ; $c39f: a5 eb     
            bne __c3fc         ; $c3a1: d0 59     
            lda $ee            ; $c3a3: a5 ee     
            beq __c3aa         ; $c3a5: f0 03     
            dec $ee            ; $c3a7: c6 ee     
            rts                ; $c3a9: 60        

;-------------------------------------------------------------------------------
__c3aa:     jsr __e3e4         ; $c3aa: 20 e4 e3  
            lda $68            ; $c3ad: a5 68     
            bne __c3f3         ; $c3af: d0 42     
            lda $6b            ; $c3b1: a5 6b     
            cmp #$05           ; $c3b3: c9 05     
            beq __c3f9         ; $c3b5: f0 42     
            cmp #$04           ; $c3b7: c9 04     
            beq __c3ce         ; $c3b9: f0 13     
            lda $6b            ; $c3bb: a5 6b     
            cmp #$03           ; $c3bd: c9 03     
            beq __c3ce         ; $c3bf: f0 0d     
            lda $4e            ; $c3c1: a5 4e     
            beq __c3cb         ; $c3c3: f0 06     
            jsr __e37f         ; $c3c5: 20 7f e3  
            jmp __c3ce         ; $c3c8: 4c ce c3  

;-------------------------------------------------------------------------------
__c3cb:     jsr __c489         ; $c3cb: 20 89 c4  
__c3ce:     jsr __c4bf         ; $c3ce: 20 bf c4  
            jsr __c85b         ; $c3d1: 20 5b c8  
            jsr __ca18         ; $c3d4: 20 18 ca  
            jsr __c906         ; $c3d7: 20 06 c9  
            jsr __c511         ; $c3da: 20 11 c5  
            jsr __c4f1         ; $c3dd: 20 f1 c4  
            jsr __e1ef         ; $c3e0: 20 ef e1  
            jsr __c5b4         ; $c3e3: 20 b4 c5  
            jsr __c4e6         ; $c3e6: 20 e6 c4  
            jsr __e781         ; $c3e9: 20 81 e7  
            lda $54            ; $c3ec: a5 54     
            sta $55            ; $c3ee: 85 55     
            jmp __c3fc         ; $c3f0: 4c fc c3  

;-------------------------------------------------------------------------------
__c3f3:     jsr __c7b8         ; $c3f3: 20 b8 c7  
            jmp __c3fc         ; $c3f6: 4c fc c3  

;-------------------------------------------------------------------------------
__c3f9:     jsr __c550         ; $c3f9: 20 50 c5  
__c3fc:     jmp __c421         ; $c3fc: 4c 21 c4  

;-------------------------------------------------------------------------------
__c3ff:     lda #$01           ; $c3ff: a9 01     
            sta $47            ; $c401: 85 47     
            sta $6a            ; $c403: 85 6a     
            sta $4c            ; $c405: 85 4c     
            lda #$40           ; $c407: a9 40     
            sta $36            ; $c409: 85 36     
            lda #$00           ; $c40b: a9 00     
            sta $4e            ; $c40d: 85 4e     
            sta $52            ; $c40f: 85 52     
            lda #$40           ; $c411: a9 40     
            sta $0103          ; $c413: 8d 03 01  
            lda #$00           ; $c416: a9 00     
            sta $0104          ; $c418: 8d 04 01  
            jsr __c035         ; $c41b: 20 35 c0  
            jmp __c028         ; $c41e: 4c 28 c0  

;-------------------------------------------------------------------------------
__c421:     lda $15            ; $c421: a5 15     
            and #$10           ; $c423: 29 10     
            beq __c46b         ; $c425: f0 44     
            lda $4e            ; $c427: a5 4e     
            bne __c3ff         ; $c429: d0 d4     
            lda $15            ; $c42b: a5 15     
            cmp $ec            ; $c42d: c5 ec     
            beq __c46d         ; $c42f: f0 3c     
            sta $ec            ; $c431: 85 ec     
            lda $eb            ; $c433: a5 eb     
            beq __c456         ; $c435: f0 1f     
            lda $ee            ; $c437: a5 ee     
            bne __c455         ; $c439: d0 1a     
            lda #$00           ; $c43b: a9 00     
            sta $eb            ; $c43d: 85 eb     
            lda $0f            ; $c43f: a5 0f     
            sta $fc            ; $c441: 85 fc     
            lda $4a            ; $c443: a5 4a     
            cmp #$02           ; $c445: c9 02     
            bne __c44c         ; $c447: d0 03     
            jsr __d817         ; $c449: 20 17 d8  
__c44c:     lda $11            ; $c44c: a5 11     
            and #$ef           ; $c44e: 29 ef     
            sta $11            ; $c450: 85 11     
            jmp __c462         ; $c452: 4c 62 c4  

;-------------------------------------------------------------------------------
__c455:     rts                ; $c455: 60        

;-------------------------------------------------------------------------------
__c456:     lda #$01           ; $c456: a9 01     
            sta $eb            ; $c458: 85 eb     
            lda $fc            ; $c45a: a5 fc     
            sta $0f            ; $c45c: 85 0f     
            lda #$00           ; $c45e: a9 00     
            sta $fc            ; $c460: 85 fc     
__c462:     lda #$40           ; $c462: a9 40     
            sta $ee            ; $c464: 85 ee     
            lda #$40           ; $c466: a9 40     
            sta $fd            ; $c468: 85 fd     
            rts                ; $c46a: 60        

;-------------------------------------------------------------------------------
__c46b:     sta $ec            ; $c46b: 85 ec     
__c46d:     lda $ee            ; $c46d: a5 ee     
            beq __c474         ; $c46f: f0 03     
            dec $ee            ; $c471: c6 ee     
            rts                ; $c473: 60        

;-------------------------------------------------------------------------------
__c474:     lda $eb            ; $c474: a5 eb     
            bne __c479         ; $c476: d0 01     
            rts                ; $c478: 60        

;-------------------------------------------------------------------------------
__c479:     lda $4a            ; $c479: a5 4a     
            cmp #$02           ; $c47b: c9 02     
            bne __c482         ; $c47d: d0 03     
            jsr __d822         ; $c47f: 20 22 d8  
__c482:     lda $11            ; $c482: a5 11     
            ora #$10           ; $c484: 09 10     
            sta $11            ; $c486: 85 11     
            rts                ; $c488: 60        

;-------------------------------------------------------------------------------
__c489:     lda $49            ; $c489: a5 49     
            asl                ; $c48b: 0a        
            tax                ; $c48c: aa        
            inx                ; $c48d: e8        
            ldy #$00           ; $c48e: a0 00     
            lda $14,x          ; $c490: b5 14     
            and #$0f           ; $c492: 29 0f     
            beq __c4aa         ; $c494: f0 14     
            cmp #$08           ; $c496: c9 08     
            beq __c4a9         ; $c498: f0 0f     
            cmp #$04           ; $c49a: c9 04     
            beq __c4a8         ; $c49c: f0 0a     
            cmp #$02           ; $c49e: c9 02     
            beq __c4a7         ; $c4a0: f0 05     
            cmp #$01           ; $c4a2: c9 01     
            bne __c4aa         ; $c4a4: d0 04     
            iny                ; $c4a6: c8        
__c4a7:     iny                ; $c4a7: c8        
__c4a8:     iny                ; $c4a8: c8        
__c4a9:     iny                ; $c4a9: c8        
__c4aa:     sty $54            ; $c4aa: 84 54     
            lda $6b            ; $c4ac: a5 6b     
            cmp #$02           ; $c4ae: c9 02     
            beq __c4be         ; $c4b0: f0 0c     
            lda $14,x          ; $c4b2: b5 14     
            and #$80           ; $c4b4: 29 80     
            cmp #$00           ; $c4b6: c9 00     
            beq __c4be         ; $c4b8: f0 04     
            lda #$03           ; $c4ba: a9 03     
            sta $6b            ; $c4bc: 85 6b     
__c4be:     rts                ; $c4be: 60        

;-------------------------------------------------------------------------------
__c4bf:     lda $63            ; $c4bf: a5 63     
            beq __c4dc         ; $c4c1: f0 19     
            lda $0213          ; $c4c3: ad 13 02  
            sta $00            ; $c4c6: 85 00     
            lda $0210          ; $c4c8: ad 10 02  
            sta $01            ; $c4cb: 85 01     
            lda #$08           ; $c4cd: a9 08     
            sta $02            ; $c4cf: 85 02     
            lda $6d            ; $c4d1: a5 6d     
            eor #$01           ; $c4d3: 49 01     
            jsr __dfc8         ; $c4d5: 20 c8 df  
            lda #$00           ; $c4d8: a9 00     
            sta $63            ; $c4da: 85 63     
__c4dc:     lda $38            ; $c4dc: a5 38     
            bne __c4e5         ; $c4de: d0 05     
            lda #$ff           ; $c4e0: a9 ff     
            sta $0208          ; $c4e2: 8d 08 02  
__c4e5:     rts                ; $c4e5: 60        

;-------------------------------------------------------------------------------
__c4e6:     lda $2e            ; $c4e6: a5 2e     
            cmp #$10           ; $c4e8: c9 10     
            bpl __c4f0         ; $c4ea: 10 04     
            lda #$20           ; $c4ec: a9 20     
            sta $fc            ; $c4ee: 85 fc     
__c4f0:     rts                ; $c4f0: 60        

;-------------------------------------------------------------------------------
__c4f1:     lda $4e            ; $c4f1: a5 4e     
            bne __c510         ; $c4f3: d0 1b     
            ldx $49            ; $c4f5: a6 49     
            lda $05b0,x        ; $c4f7: bd b0 05  
            bne __c510         ; $c4fa: d0 14     
            txa                ; $c4fc: 8a        
            tay                ; $c4fd: a8        
            clc                ; $c4fe: 18        
            asl                ; $c4ff: 0a        
            asl                ; $c500: 0a        
            tax                ; $c501: aa        
            lda $25,x          ; $c502: b5 25     
            cmp #$02           ; $c504: c9 02     
            bcc __c510         ; $c506: 90 08     
            sta $05b0,y        ; $c508: 99 b0 05  
            inc $4c            ; $c50b: e6 4c     
            jsr __c04a         ; $c50d: 20 4a c0  
__c510:     rts                ; $c510: 60        

;-------------------------------------------------------------------------------
__c511:     jsr __d149         ; $c511: 20 49 d1  
            jsr __d1a2         ; $c514: 20 a2 d1  
            lda $6b            ; $c517: a5 6b     
            cmp #$05           ; $c519: c9 05     
            bne __c51e         ; $c51b: d0 01     
            rts                ; $c51d: 60        

;-------------------------------------------------------------------------------
__c51e:     lda $4a            ; $c51e: a5 4a     
            cmp #$01           ; $c520: c9 01     
            beq __c535         ; $c522: f0 11     
            cmp #$02           ; $c524: c9 02     
            beq __c53b         ; $c526: f0 13     
            cmp #$03           ; $c528: c9 03     
            beq __c54a         ; $c52a: f0 1e     
            jsr __d9dd         ; $c52c: 20 dd d9  
            jsr __d1d8         ; $c52f: 20 d8 d1  
            jmp __dbd4         ; $c532: 4c d4 db  

;-------------------------------------------------------------------------------
__c535:     jsr __d1d8         ; $c535: 20 d8 d1  
            jmp __d4c9         ; $c538: 4c c9 d4  

;-------------------------------------------------------------------------------
__c53b:     jsr __dbd4         ; $c53b: 20 d4 db  
            jsr __d6c4         ; $c53e: 20 c4 d6  
            jsr __d71d         ; $c541: 20 1d d7  
            jsr __d835         ; $c544: 20 35 d8  
            jmp __d6ed         ; $c547: 4c ed d6  

;-------------------------------------------------------------------------------
__c54a:     jsr __dad0         ; $c54a: 20 d0 da  
            jmp __dbd4         ; $c54d: 4c d4 db  

;-------------------------------------------------------------------------------
__c550:     lda #$00           ; $c550: a9 00     
            sta $fc            ; $c552: 85 fc     
            lda $64            ; $c554: a5 64     
            bne __c56f         ; $c556: d0 17     
            lda $65            ; $c558: a5 65     
            beq __c562         ; $c55a: f0 06     
            jsr __d10f         ; $c55c: 20 0f d1  
            jmp __c572         ; $c55f: 4c 72 c5  

;-------------------------------------------------------------------------------
__c562:     jsr __de7a         ; $c562: 20 7a de  
            cmp #$00           ; $c565: c9 00     
            beq __c56c         ; $c567: f0 03     
            jmp __c579         ; $c569: 4c 79 c5  

;-------------------------------------------------------------------------------
__c56c:     jmp __d0e8         ; $c56c: 4c e8 d0  

;-------------------------------------------------------------------------------
__c56f:     dec $64            ; $c56f: c6 64     
            rts                ; $c571: 60        

;-------------------------------------------------------------------------------
__c572:     lda #$03           ; $c572: a9 03     
            sta $64            ; $c574: 85 64     
            dec $65            ; $c576: c6 65     
            rts                ; $c578: 60        

;-------------------------------------------------------------------------------
__c579:     ldx $49            ; $c579: a6 49     
            jsr __bf34         ; $c57b: 20 34 bf  
            lda $4c            ; $c57e: a5 4c     
            bne __c58b         ; $c580: d0 09     
            lda #$01           ; $c582: a9 01     
            sta $47            ; $c584: 85 47     
            lda #$87           ; $c586: a9 87     
            sta $39            ; $c588: 85 39     
            rts                ; $c58a: 60        

;-------------------------------------------------------------------------------
__c58b:     lda $48            ; $c58b: a5 48     
            cmp #$1c           ; $c58d: c9 1c     
            bne __c5a9         ; $c58f: d0 18     
            lda $49            ; $c591: a5 49     
            eor #$01           ; $c593: 49 01     
            tax                ; $c595: aa        
            stx $49            ; $c596: 86 49     
            lda $0586,x        ; $c598: bd 86 05  
            .hex f0            ; $c59b: f0        Suspected data
__c59c:     ora #$8a           ; $c59c: 09 8a     
            eor #$01           ; $c59e: 49 01     
            tax                ; $c5a0: aa        
            stx $49            ; $c5a1: 86 49     
            jmp __c5a9         ; $c5a3: 4c a9 c5  

;-------------------------------------------------------------------------------
            jsr __bf24         ; $c5a6: 20 24 bf  
__c5a9:     lda #$87           ; $c5a9: a9 87     
            .hex 85            ; $c5ab: 85        Suspected data
__c5ac:     and __e985,y       ; $c5ac: 39 85 e9  
            lda #$00           ; $c5af: a9 00     
            sta $46            ; $c5b1: 85 46     
            rts                ; $c5b3: 60        

;-------------------------------------------------------------------------------
__c5b4:     jsr __c8c7         ; $c5b4: 20 c7 c8  
            lda $4a            ; $c5b7: a5 4a     
            cmp #$04           ; $c5b9: c9 04     
            bmi __c5c6         ; $c5bb: 30 09     
            lda $53            ; $c5bd: a5 53     
            cmp #$06           ; $c5bf: c9 06     
            bne __c5c5         ; $c5c1: d0 02     
            sta $4d            ; $c5c3: 85 4d     
__c5c5:     rts                ; $c5c5: 60        

;-------------------------------------------------------------------------------
__c5c6:     lda #$fb           ; $c5c6: a9 fb     
            sta $02            ; $c5c8: 85 02     
            lda #$bb           ; $c5ca: a9 bb     
            sta $03            ; $c5cc: 85 03     
            jsr __e14c         ; $c5ce: 20 4c e1  
            beq __c5d5         ; $c5d1: f0 02     
            sta $54            ; $c5d3: 85 54     
__c5d5:     sta $4d            ; $c5d5: 85 4d     
            rts                ; $c5d7: 60        

;-------------------------------------------------------------------------------
__c5d8:     lda $4d            ; $c5d8: a5 4d     
            cmp #$06           ; $c5da: c9 06     
            beq __c63f         ; $c5dc: f0 61     
            lda $6b            ; $c5de: a5 6b     
            cmp #$02           ; $c5e0: c9 02     
            beq __c5f6         ; $c5e2: f0 12     
            cmp #$03           ; $c5e4: c9 03     
            beq __c5f6         ; $c5e6: f0 0e     
            lda $78            ; $c5e8: a5 78     
            cmp #$01           ; $c5ea: c9 01     
            bne __c5fc         ; $c5ec: d0 0e     
            lda $0210          ; $c5ee: ad 10 02  
            cmp #$28           ; $c5f1: c9 28     
            bcc __c60f         ; $c5f3: 90 1a     
            rts                ; $c5f5: 60        

;-------------------------------------------------------------------------------
__c5f6:     lda $78            ; $c5f6: a5 78     
            cmp #$01           ; $c5f8: c9 01     
            bne __c600         ; $c5fa: d0 04     
__c5fc:     lda #$03           ; $c5fc: a9 03     
            sta $54            ; $c5fe: 85 54     
__c600:     jsr __c85b         ; $c600: 20 5b c8  
            jsr __c8c7         ; $c603: 20 c7 c8  
            jsr __ca18         ; $c606: 20 18 ca  
            jsr __c511         ; $c609: 20 11 c5  
            jmp __e781         ; $c60c: 4c 81 e7  

;-------------------------------------------------------------------------------
__c60f:     lda #$00           ; $c60f: a9 00     
            sta $fc            ; $c611: 85 fc     
            lda $4a            ; $c613: a5 4a     
            cmp #$01           ; $c615: c9 01     
            beq __c622         ; $c617: f0 09     
            cmp #$02           ; $c619: c9 02     
            beq __c627         ; $c61b: f0 0a     
            lda #$08           ; $c61d: a9 08     
            jmp __c629         ; $c61f: 4c 29 c6  

;-------------------------------------------------------------------------------
__c622:     lda #$02           ; $c622: a9 02     
            jmp __c629         ; $c624: 4c 29 c6  

;-------------------------------------------------------------------------------
__c627:     lda #$04           ; $c627: a9 04     
__c629:     sta $fd            ; $c629: 85 fd     
            lda #$44           ; $c62b: a9 44     
            sta $00            ; $c62d: 85 00     
            lda #$18           ; $c62f: a9 18     
            sta $01            ; $c631: 85 01     
            lda #$50           ; $c633: a9 50     
            sta $02            ; $c635: 85 02     
            lda #$00           ; $c637: a9 00     
            jsr __dfc8         ; $c639: 20 c8 df  
            jmp __c656         ; $c63c: 4c 56 c6  

;-------------------------------------------------------------------------------
__c63f:     lda $eb            ; $c63f: a5 eb     
            bne __c64d         ; $c641: d0 0a     
            jsr __c673         ; $c643: 20 73 c6  
            jsr __e781         ; $c646: 20 81 e7  
            lda $39            ; $c649: a5 39     
            beq __c650         ; $c64b: f0 03     
__c64d:     jmp __c421         ; $c64d: 4c 21 c4  

;-------------------------------------------------------------------------------
__c650:     lda #$00           ; $c650: a9 00     
            sta $4a            ; $c652: 85 4a     
            inc $4b            ; $c654: e6 4b     
__c656:     inc $4a            ; $c656: e6 4a     
            lda #$8d           ; $c658: a9 8d     
            sta $39            ; $c65a: 85 39     
            lda #$00           ; $c65c: a9 00     
            sta $46            ; $c65e: 85 46     
            sta $4d            ; $c660: 85 4d     
            rts                ; $c662: 60        

;-------------------------------------------------------------------------------
__c663:     lda $2e            ; $c663: a5 2e     
            sta $00            ; $c665: 85 00     
            lda $49            ; $c667: a5 49     
            ora #$08           ; $c669: 09 08     
            sta $01            ; $c66b: 85 01     
            jsr __e617         ; $c66d: 20 17 e6  
            jmp __e27c         ; $c670: 4c 7c e2  

;-------------------------------------------------------------------------------
__c673:     lda $a0            ; $c673: a5 a0     
            beq __c69b         ; $c675: f0 24     
            lda #$d5           ; $c677: a9 d5     
            sta $39            ; $c679: 85 39     
            lda #$00           ; $c67b: a9 00     
            sta $a0            ; $c67d: 85 a0     
            sta $fc            ; $c67f: 85 fc     
            lda #$01           ; $c681: a9 01     
            sta $a1            ; $c683: 85 a1     
            sta $0592          ; $c685: 8d 92 05  
            lda #$20           ; $c688: a9 20     
            sta $0593          ; $c68a: 8d 93 05  
            lda #$60           ; $c68d: a9 60     
            sta $86            ; $c68f: 85 86     
            lda #$01           ; $c691: a9 01     
            sta $87            ; $c693: 85 87     
            jsr __c663         ; $c695: 20 63 c6  
            jsr __c4f1         ; $c698: 20 f1 c4  
__c69b:     lda $39            ; $c69b: a5 39     
            cmp #$ca           ; $c69d: c9 ca     
            bcs __c6ae         ; $c69f: b0 0d     
            cmp #$c0           ; $c6a1: c9 c0     
            bcs __c6b1         ; $c6a3: b0 0c     
            cmp #$b9           ; $c6a5: c9 b9     
            bcs __c6b4         ; $c6a7: b0 0b     
            lda #$00           ; $c6a9: a9 00     
            sta $39            ; $c6ab: 85 39     
            rts                ; $c6ad: 60        

;-------------------------------------------------------------------------------
__c6ae:     jmp __c6b7         ; $c6ae: 4c b7 c6  

;-------------------------------------------------------------------------------
__c6b1:     jmp __c6d7         ; $c6b1: 4c d7 c6  

;-------------------------------------------------------------------------------
__c6b4:     jmp __c75a         ; $c6b4: 4c 5a c7  

;-------------------------------------------------------------------------------
__c6b7:     cmp #$d0           ; $c6b7: c9 d0     
            beq __c6bc         ; $c6b9: f0 01     
            rts                ; $c6bb: 60        

;-------------------------------------------------------------------------------
__c6bc:     jsr __c028         ; $c6bc: 20 28 c0  
            lda #$18           ; $c6bf: a9 18     
            sta $00            ; $c6c1: 85 00     
            lda #$3f           ; $c6c3: a9 3f     
            sta $01            ; $c6c5: 85 01     
            lda #$f3           ; $c6c7: a9 f3     
            sta $02            ; $c6c9: 85 02     
            lda #$b8           ; $c6cb: a9 b8     
            sta $03            ; $c6cd: 85 03     
            jsr __e5a1         ; $c6cf: 20 a1 e5  
            ldy #$05           ; $c6d2: a0 05     
            jmp __c1a7         ; $c6d4: 4c a7 c1  

;-------------------------------------------------------------------------------
__c6d7:     cmp #$c9           ; $c6d7: c9 c9     
            beq __c6e1         ; $c6d9: f0 06     
            and #$01           ; $c6db: 29 01     
            tax                ; $c6dd: aa        
            jmp __c72a         ; $c6de: 4c 2a c7  

;-------------------------------------------------------------------------------
__c6e1:     jsr __c6eb         ; $c6e1: 20 eb c6  
            lda #$10           ; $c6e4: a9 10     
            sta $fd            ; $c6e6: 85 fd     
            dec $39            ; $c6e8: c6 39     
            rts                ; $c6ea: 60        

;-------------------------------------------------------------------------------
__c6eb:     jsr __c035         ; $c6eb: 20 35 c0  
            lda #$02           ; $c6ee: a9 02     
            sta $00            ; $c6f0: 85 00     
            lda #$21           ; $c6f2: a9 21     
            sta $01            ; $c6f4: 85 01     
            lda #$2d           ; $c6f6: a9 2d     
            sta $02            ; $c6f8: 85 02     
            lda #$bb           ; $c6fa: a9 bb     
            sta $03            ; $c6fc: 85 03     
            jsr __e5a1         ; $c6fe: 20 a1 e5  
            lda #$1c           ; $c701: a9 1c     
            sta $00            ; $c703: 85 00     
            lda #$21           ; $c705: a9 21     
            sta $01            ; $c707: 85 01     
            jsr __e5a1         ; $c709: 20 a1 e5  
            lda #$bb           ; $c70c: a9 bb     
            sta $03            ; $c70e: 85 03     
            lda #$32           ; $c710: a9 32     
            sta $00            ; $c712: 85 00     
            lda #$bb           ; $c714: a9 bb     
            sta $01            ; $c716: 85 01     
            jsr __e50f         ; $c718: 20 0f e5  
            ldx #$00           ; $c71b: a2 00     
            jsr __c72a         ; $c71d: 20 2a c7  
            ldx #$08           ; $c720: a2 08     
            jsr __c27a         ; $c722: 20 7a c2  
            ldx #$00           ; $c725: a2 00     
            jmp __c742         ; $c727: 4c 42 c7  

;-------------------------------------------------------------------------------
__c72a:     lda #$1f           ; $c72a: a9 1f     
__c72c:     sta $01            ; $c72c: 85 01     
__c72e:     lda #$68           ; $c72e: a9 68     
            sta $00            ; $c730: 85 00     
            lda #$d4           ; $c732: a9 d4     
            sta $02            ; $c734: 85 02     
            lda #$46           ; $c736: a9 46     
            sta $03            ; $c738: 85 03     
            lda #$40           ; $c73a: a9 40     
            sta $04            ; $c73c: 85 04     
            txa                ; $c73e: 8a        
            jmp __dfe1         ; $c73f: 4c e1 df  

;-------------------------------------------------------------------------------
__c742:     lda #$30           ; $c742: a9 30     
            sta $01            ; $c744: 85 01     
__c746:     lda #$20           ; $c746: a9 20     
            sta $00            ; $c748: 85 00     
            lda #$c0           ; $c74a: a9 c0     
            sta $02            ; $c74c: 85 02     
__c74e:     lda #$22           ; $c74e: a9 22     
            sta $03            ; $c750: 85 03     
            lda #$a0           ; $c752: a9 a0     
            sta $04            ; $c754: 85 04     
            txa                ; $c756: 8a        
            jmp __dfe1         ; $c757: 4c e1 df  

;-------------------------------------------------------------------------------
__c75a:     lda $0240          ; $c75a: ad 40 02  
            cmp #$a7           ; $c75d: c9 a7     
            bcs __c78d         ; $c75f: b0 2c     
            cmp #$90           ; $c761: c9 90     
            bcc __c778         ; $c763: 90 13     
            lda $0213          ; $c765: ad 13 02  
            sta $00            ; $c768: 85 00     
            lda $0210          ; $c76a: ad 10 02  
            sta $01            ; $c76d: 85 01     
            lda #$cc           ; $c76f: a9 cc     
            sta $02            ; $c771: 85 02     
            lda #$01           ; $c773: a9 01     
            jsr __dfc8         ; $c775: 20 c8 df  
__c778:     lda $0240          ; $c778: ad 40 02  
            cmp #$1f           ; $c77b: c9 1f     
            bne __c783         ; $c77d: d0 04     
            ldx #$01           ; $c77f: a2 01     
            stx $ff            ; $c781: 86 ff     
__c783:     clc                ; $c783: 18        
            adc #$02           ; $c784: 69 02     
            sta $01            ; $c786: 85 01     
            ldx #$00           ; $c788: a2 00     
            jsr __c72e         ; $c78a: 20 2e c7  
__c78d:     lda $02a0          ; $c78d: ad a0 02  
            cmp #$ba           ; $c790: c9 ba     
            bne __c798         ; $c792: d0 04     
            ldx #$10           ; $c794: a2 10     
            stx $ff            ; $c796: 86 ff     
__c798:     cmp #$c1           ; $c798: c9 c1     
            bcs __c7a6         ; $c79a: b0 0a     
            clc                ; $c79c: 18        
            adc #$02           ; $c79d: 69 02     
            sta $01            ; $c79f: 85 01     
            ldx #$00           ; $c7a1: a2 00     
            jmp __c746         ; $c7a3: 4c 46 c7  

;-------------------------------------------------------------------------------
__c7a6:     lda #$c7           ; $c7a6: a9 c7     
            sta $01            ; $c7a8: 85 01     
            lda $02a3          ; $c7aa: ad a3 02  
            sta $00            ; $c7ad: 85 00     
            lda #$64           ; $c7af: a9 64     
            sta $02            ; $c7b1: 85 02     
            ldx #$01           ; $c7b3: a2 01     
            jmp __c74e         ; $c7b5: 4c 4e c7  

;-------------------------------------------------------------------------------
__c7b8:     lda $66            ; $c7b8: a5 66     
            bne __c7c2         ; $c7ba: d0 06     
            jsr __c7c6         ; $c7bc: 20 c6 c7  
            jmp __c7c5         ; $c7bf: 4c c5 c7  

;-------------------------------------------------------------------------------
__c7c2:     jsr __c822         ; $c7c2: 20 22 c8  
__c7c5:     rts                ; $c7c5: 60        

;-------------------------------------------------------------------------------
__c7c6:     lda #$01           ; $c7c6: a9 01     
            sta $fe            ; $c7c8: 85 fe     
            ldx $69            ; $c7ca: a6 69     
            lda $68            ; $c7cc: a5 68     
            cmp #$01           ; $c7ce: c9 01     
            beq __c7f3         ; $c7d0: f0 21     
            lda $0240,x        ; $c7d2: bd 40 02  
            sta $0208          ; $c7d5: 8d 08 02  
            lda #$ff           ; $c7d8: a9 ff     
__c7da:     sta $0240,x        ; $c7da: 9d 40 02  
__c7dd:     lda $0243,x        ; $c7dd: bd 43 02  
            sta $020b          ; $c7e0: 8d 0b 02  
            ldy #$03           ; $c7e3: a0 03     
            lda #$ff           ; $c7e5: a9 ff     
            sta $0244,x        ; $c7e7: 9d 44 02  
            .hex 9d 48         ; $c7ea: 9d 48     Suspected data
__c7ec:     .hex 02            ; $c7ec: 02        Invalid Opcode - KIL 
            sta $024c,x        ; $c7ed: 9d 4c 02  
            jmp __c809         ; $c7f0: 4c 09 c8  

;-------------------------------------------------------------------------------
__c7f3:     lda $02c0,x        ; $c7f3: bd c0 02  
            sta $0208          ; $c7f6: 8d 08 02  
            lda #$ff           ; $c7f9: a9 ff     
            sta $02c0,x        ; $c7fb: 9d c0 02  
            lda $02c3,x        ; $c7fe: bd c3 02  
            sta $020b          ; $c801: 8d 0b 02  
            lda #$ff           ; $c804: a9 ff     
            sta $02c4,x        ; $c806: 9d c4 02  
__c809:     lda #$90           ; $c809: a9 90     
            sta $0209          ; $c80b: 8d 09 02  
            lda #$00           ; $c80e: a9 00     
            sta $020a          ; $c810: 8d 0a 02  
            lda #$07           ; $c813: a9 07     
            sta $09            ; $c815: 85 09     
            lda #$04           ; $c817: a9 04     
            sta $08            ; $c819: 85 08     
            lda #$01           ; $c81b: a9 01     
            sta $66            ; $c81d: 85 66     
            .hex 85            ; $c81f: 85        Suspected data
__c820:     .hex 67 60         ; $c820: 67 60     Invalid Opcode - RRA $60
__c822:     dec $08            ; $c822: c6 08     
            bpl __c85a         ; $c824: 10 34     
            dec $09            ; $c826: c6 09     
            bne __c841         ; $c828: d0 17     
            lda #$ff           ; $c82a: a9 ff     
            sta $0200          ; $c82c: 8d 00 02  
            jsr __e31a         ; $c82f: 20 1a e3  
            ldx #$40           ; $c832: a2 40     
            stx $38            ; $c834: 86 38     
            lda #$00           ; $c836: a9 00     
            sta $66            ; $c838: 85 66     
            sta $68            ; $c83a: 85 68     
            ldx #$93           ; $c83c: a2 93     
            jmp __c84d         ; $c83e: 4c 4d c8  

;-------------------------------------------------------------------------------
__c841:     ldx $0209          ; $c841: ae 09 02  
            lda $67            ; $c844: a5 67     
            beq __c84c         ; $c846: f0 04     
            inx                ; $c848: e8        
            jmp __c84d         ; $c849: 4c 4d c8  

;-------------------------------------------------------------------------------
__c84c:     dex                ; $c84c: ca        
__c84d:     lda $09            ; $c84d: a5 09     
            and #$02           ; $c84f: 29 02     
            sta $67            ; $c851: 85 67     
            stx $0209          ; $c853: 8e 09 02  
            lda #$08           ; $c856: a9 08     
            sta $08            ; $c858: 85 08     
__c85a:     rts                ; $c85a: 60        

;-------------------------------------------------------------------------------
__c85b:     lda $6b            ; $c85b: a5 6b     
            cmp $6c            ; $c85d: c5 6c     
            beq __c8c6         ; $c85f: f0 65     
            lda #$00           ; $c861: a9 00     
            sta $56            ; $c863: 85 56     
            sta $78            ; $c865: 85 78     
            lda $6b            ; $c867: a5 6b     
            cmp #$01           ; $c869: c9 01     
            beq __c885         ; $c86b: f0 18     
            cmp #$02           ; $c86d: c9 02     
            beq __c892         ; $c86f: f0 21     
            cmp #$03           ; $c871: c9 03     
            beq __c89b         ; $c873: f0 26     
            cmp #$04           ; $c875: c9 04     
            beq __c8ae         ; $c877: f0 35     
            lda $6c            ; $c879: a5 6c     
            cmp #$04           ; $c87b: c9 04     
            bne __c8c2         ; $c87d: d0 43     
            jsr __d096         ; $c87f: 20 96 d0  
            jmp __c8be         ; $c882: 4c be c8  

;-------------------------------------------------------------------------------
__c885:     lda #$00           ; $c885: a9 00     
            sta $75            ; $c887: 85 75     
            sta $02            ; $c889: 85 02     
            sta $70            ; $c88b: 85 70     
            sta $6f            ; $c88d: 85 6f     
            jmp __c8c2         ; $c88f: 4c c2 c8  

;-------------------------------------------------------------------------------
__c892:     lda #$01           ; $c892: a9 01     
            sta $71            ; $c894: 85 71     
            sta $79            ; $c896: 85 79     
            jmp __c8c2         ; $c898: 4c c2 c8  

;-------------------------------------------------------------------------------
__c89b:     lda #$00           ; $c89b: a9 00     
            sta $7e            ; $c89d: 85 7e     
            sta $05c6          ; $c89f: 8d c6 05  
            lda #$40           ; $c8a2: a9 40     
            sta $ff            ; $c8a4: 85 ff     
            lda $0210          ; $c8a6: ad 10 02  
            sta $76            ; $c8a9: 85 76     
            jmp __c8c2         ; $c8ab: 4c c2 c8  

;-------------------------------------------------------------------------------
__c8ae:     lda $0210          ; $c8ae: ad 10 02  
            sta $76            ; $c8b1: 85 76     
            lda #$01           ; $c8b3: a9 01     
            sta $09            ; $c8b5: 85 09     
            lda #$00           ; $c8b7: a9 00     
            sta $71            ; $c8b9: 85 71     
            jmp __c8c2         ; $c8bb: 4c c2 c8  

;-------------------------------------------------------------------------------
__c8be:     lda #$01           ; $c8be: a9 01     
            sta $ff            ; $c8c0: 85 ff     
__c8c2:     lda $6b            ; $c8c2: a5 6b     
            sta $6c            ; $c8c4: 85 6c     
__c8c6:     rts                ; $c8c6: 60        

;-------------------------------------------------------------------------------
__c8c7:     lda $0210          ; $c8c7: ad 10 02  
            sta $01            ; $c8ca: 85 01     
            lda $0213          ; $c8cc: ad 13 02  
            sta $00            ; $c8cf: 85 00     
            lda $6b            ; $c8d1: a5 6b     
            cmp #$04           ; $c8d3: c9 04     
            bmi __c8d9         ; $c8d5: 30 02     
            lda #$01           ; $c8d7: a9 01     
__c8d9:     sec                ; $c8d9: 38        
            sbc #$01           ; $c8da: e9 01     
            asl                ; $c8dc: 0a        
            asl                ; $c8dd: 0a        
            clc                ; $c8de: 18        
            ldx $6d            ; $c8df: a6 6d     
            bne __c8e5         ; $c8e1: d0 02     
            adc #$02           ; $c8e3: 69 02     
__c8e5:     ldx $71            ; $c8e5: a6 71     
            cpx #$02           ; $c8e7: e0 02     
            bne __c8ed         ; $c8e9: d0 02     
            adc #$07           ; $c8eb: 69 07     
__c8ed:     tax                ; $c8ed: aa        
            lda __ba68,x       ; $c8ee: bd 68 ba  
            sta $02            ; $c8f1: 85 02     
            lda __ba69,x       ; $c8f3: bd 69 ba  
            sta $03            ; $c8f6: 85 03     
            jsr __e142         ; $c8f8: 20 42 e1  
            ldx #$03           ; $c8fb: a2 03     
__c8fd:     lda $3e,x          ; $c8fd: b5 3e     
            sta $05fc,x        ; $c8ff: 9d fc 05  
            dex                ; $c902: ca        
            bpl __c8fd         ; $c903: 10 f8     
            rts                ; $c905: 60        

;-------------------------------------------------------------------------------
__c906:     jsr __ca3e         ; $c906: 20 3e ca  
            cmp #$00           ; $c909: c9 00     
            beq __c90e         ; $c90b: f0 01     
            rts                ; $c90d: 60        

;-------------------------------------------------------------------------------
__c90e:     jsr __c8c7         ; $c90e: 20 c7 c8  
            lda $4a            ; $c911: a5 4a     
            cmp #$01           ; $c913: c9 01     
            beq __c925         ; $c915: f0 0e     
            cmp #$02           ; $c917: c9 02     
            beq __c92b         ; $c919: f0 10     
            cmp #$03           ; $c91b: c9 03     
            beq __c93a         ; $c91d: f0 1b     
            jsr __c9de         ; $c91f: 20 de c9  
            jmp __c9ff         ; $c922: 4c ff c9  

;-------------------------------------------------------------------------------
__c925:     jsr __c9de         ; $c925: 20 de c9  
            jmp __c9e5         ; $c928: 4c e5 c9  

;-------------------------------------------------------------------------------
__c92b:     jsr __c9ff         ; $c92b: 20 ff c9  
            jsr __c9c2         ; $c92e: 20 c2 c9  
            jsr __c940         ; $c931: 20 40 c9  
            jsr __c98d         ; $c934: 20 8d c9  
            jmp __c9d6         ; $c937: 4c d6 c9  

;-------------------------------------------------------------------------------
__c93a:     jsr __c9f1         ; $c93a: 20 f1 c9  
            jmp __c9f8         ; $c93d: 4c f8 c9  

;-------------------------------------------------------------------------------
__c940:     lda $ae            ; $c940: a5 ae     
            beq __c950         ; $c942: f0 0c     
            lda $0210          ; $c944: ad 10 02  
            cmp #$b0           ; $c947: c9 b0     
            bcc __c94f         ; $c949: 90 04     
            lda #$00           ; $c94b: a9 00     
            sta $ae            ; $c94d: 85 ae     
__c94f:     rts                ; $c94f: 60        

;-------------------------------------------------------------------------------
__c950:     lda $0210          ; $c950: ad 10 02  
            cmp #$8b           ; $c953: c9 8b     
            bcs __c960         ; $c955: b0 09     
            lda $0213          ; $c957: ad 13 02  
            cmp #$20           ; $c95a: c9 20     
            bcs __c960         ; $c95c: b0 02     
            sta $ae            ; $c95e: 85 ae     
__c960:     lda #$a0           ; $c960: a9 a0     
            sta $02            ; $c962: 85 02     
            lda #$ba           ; $c964: a9 ba     
            sta $03            ; $c966: 85 03     
            ldy #$00           ; $c968: a0 00     
__c96a:     lda $0294,y        ; $c96a: b9 94 02  
            sta $01            ; $c96d: 85 01     
            lda $0297,y        ; $c96f: b9 97 02  
            sta $00            ; $c972: 85 00     
            jsr __e147         ; $c974: 20 47 e1  
            beq __c983         ; $c977: f0 0a     
            sta $ad            ; $c979: 85 ad     
            cpy #$00           ; $c97b: c0 00     
            bne __c983         ; $c97d: d0 04     
            lda #$08           ; $c97f: a9 08     
            sta $36            ; $c981: 85 36     
__c983:     cpy #$08           ; $c983: c0 08     
            beq __c98c         ; $c985: f0 05     
            ldy #$08           ; $c987: a0 08     
            jmp __c96a         ; $c989: 4c 6a c9  

;-------------------------------------------------------------------------------
__c98c:     rts                ; $c98c: 60        

;-------------------------------------------------------------------------------
__c98d:     ldx #$01           ; $c98d: a2 01     
            ldy #$00           ; $c98f: a0 00     
            lda #$a4           ; $c991: a9 a4     
            sta $02            ; $c993: 85 02     
            lda #$ba           ; $c995: a9 ba     
            sta $03            ; $c997: 85 03     
__c999:     lda $02a3,y        ; $c999: b9 a3 02  
            sta $00            ; $c99c: 85 00     
            lda $02a0,y        ; $c99e: b9 a0 02  
            sec                ; $c9a1: 38        
            sbc #$04           ; $c9a2: e9 04     
            sta $01            ; $c9a4: 85 01     
            jsr __e147         ; $c9a6: 20 47 e1  
            tya                ; $c9a9: 98        
            clc                ; $c9aa: 18        
            adc $44            ; $c9ab: 65 44     
            sta $44            ; $c9ad: 85 44     
            jsr __e1bb         ; $c9af: 20 bb e1  
            beq __c9b7         ; $c9b2: f0 03     
            inx                ; $c9b4: e8        
            stx $ad            ; $c9b5: 86 ad     
__c9b7:     cpy #$10           ; $c9b7: c0 10     
            beq __c9c1         ; $c9b9: f0 06     
            ldy #$10           ; $c9bb: a0 10     
            inx                ; $c9bd: e8        
            jmp __c999         ; $c9be: 4c 99 c9  

;-------------------------------------------------------------------------------
__c9c1:     rts                ; $c9c1: 60        

;-------------------------------------------------------------------------------
__c9c2:     lda #$00           ; $c9c2: a9 00     
            sta $00            ; $c9c4: 85 00     
            sta $01            ; $c9c6: 85 01     
            lda #$ca           ; $c9c8: a9 ca     
            sta $02            ; $c9ca: 85 02     
            lda #$ba           ; $c9cc: a9 ba     
            sta $03            ; $c9ce: 85 03     
            jsr __e147         ; $c9d0: 20 47 e1  
            sta $bd            ; $c9d3: 85 bd     
            rts                ; $c9d5: 60        

;-------------------------------------------------------------------------------
__c9d6:     jsr __cb48         ; $c9d6: 20 48 cb  
            cmp #$00           ; $c9d9: c9 00     
            bne __ca0b         ; $c9db: d0 2e     
            rts                ; $c9dd: 60        

;-------------------------------------------------------------------------------
__c9de:     ldx $a0            ; $c9de: a6 a0     
            ldy #$00           ; $c9e0: a0 00     
            jmp __c9e9         ; $c9e2: 4c e9 c9  

;-------------------------------------------------------------------------------
__c9e5:     ldx $b0            ; $c9e5: a6 b0     
            ldy #$20           ; $c9e7: a0 20     
__c9e9:     jsr __cad9         ; $c9e9: 20 d9 ca  
            cmp #$00           ; $c9ec: c9 00     
            bne __ca0b         ; $c9ee: d0 1b     
            rts                ; $c9f0: 60        

;-------------------------------------------------------------------------------
__c9f1:     ldx $a0            ; $c9f1: a6 a0     
            ldy #$00           ; $c9f3: a0 00     
            jmp __ca03         ; $c9f5: 4c 03 ca  

;-------------------------------------------------------------------------------
__c9f8:     ldx $b0            ; $c9f8: a6 b0     
            ldy #$60           ; $c9fa: a0 60     
            jmp __ca03         ; $c9fc: 4c 03 ca  

;-------------------------------------------------------------------------------
__c9ff:     ldx $b0            ; $c9ff: a6 b0     
            ldy #$00           ; $ca01: a0 00     
__ca03:     jsr __cb21         ; $ca03: 20 21 cb  
            cmp #$00           ; $ca06: c9 00     
            bne __ca0b         ; $ca08: d0 01     
            rts                ; $ca0a: 60        

;-------------------------------------------------------------------------------
__ca0b:     lda #$05           ; $ca0b: a9 05     
            sta $6b            ; $ca0d: 85 6b     
            lda #$04           ; $ca0f: a9 04     
            sta $ff            ; $ca11: 85 ff     
            lda #$01           ; $ca13: a9 01     
            sta $09            ; $ca15: 85 09     
            rts                ; $ca17: 60        

;-------------------------------------------------------------------------------
__ca18:     jsr __c8c7         ; $ca18: 20 c7 c8  
            lda $6b            ; $ca1b: a5 6b     
            cmp #$01           ; $ca1d: c9 01     
            beq __ca2c         ; $ca1f: f0 0b     
            cmp #$02           ; $ca21: c9 02     
            beq __ca32         ; $ca23: f0 0d     
            cmp #$03           ; $ca25: c9 03     
            beq __ca38         ; $ca27: f0 0f     
            jmp __cc2a         ; $ca29: 4c 2a cc  

;-------------------------------------------------------------------------------
__ca2c:     jsr __cb6f         ; $ca2c: 20 6f cb  
            jmp __ca3b         ; $ca2f: 4c 3b ca  

;-------------------------------------------------------------------------------
__ca32:     jsr __cb8b         ; $ca32: 20 8b cb  
            jmp __ca3b         ; $ca35: 4c 3b ca  

;-------------------------------------------------------------------------------
__ca38:     jsr __cbd3         ; $ca38: 20 d3 cb  
__ca3b:     jmp __cf47         ; $ca3b: 4c 47 cf  

;-------------------------------------------------------------------------------
__ca3e:     lda $8c            ; $ca3e: a5 8c     
            beq __ca7a         ; $ca40: f0 38     
            lda $0230          ; $ca42: ad 30 02  
            sta $01            ; $ca45: 85 01     
            lda $0233          ; $ca47: ad 33 02  
            sta $00            ; $ca4a: 85 00     
            lda #$dc           ; $ca4c: a9 dc     
            sta $02            ; $ca4e: 85 02     
            lda #$b9           ; $ca50: a9 b9     
            sta $03            ; $ca52: 85 03     
            jsr __e142         ; $ca54: 20 42 e1  
            lda $4a            ; $ca57: a5 4a     
            cmp #$01           ; $ca59: c9 01     
            beq __ca6b         ; $ca5b: f0 0e     
            cmp #$02           ; $ca5d: c9 02     
            beq __ca71         ; $ca5f: f0 10     
            cmp #$03           ; $ca61: c9 03     
            beq __ca77         ; $ca63: f0 12     
            jsr __cabb         ; $ca65: 20 bb ca  
            jmp __ca7a         ; $ca68: 4c 7a ca  

;-------------------------------------------------------------------------------
__ca6b:     jsr __ca7d         ; $ca6b: 20 7d ca  
            jmp __ca7a         ; $ca6e: 4c 7a ca  

;-------------------------------------------------------------------------------
__ca71:     jsr __ca9a         ; $ca71: 20 9a ca  
            jmp __ca7a         ; $ca74: 4c 7a ca  

;-------------------------------------------------------------------------------
__ca77:     jsr __ca9d         ; $ca77: 20 9d ca  
__ca7a:     sta $68            ; $ca7a: 85 68     
            rts                ; $ca7c: 60        

;-------------------------------------------------------------------------------
__ca7d:     ldx $a0            ; $ca7d: a6 a0     
            ldy #$00           ; $ca7f: a0 00     
            jsr __cad9         ; $ca81: 20 d9 ca  
            cmp #$00           ; $ca84: c9 00     
            bne __ca95         ; $ca86: d0 0d     
            ldx $b0            ; $ca88: a6 b0     
            ldy #$20           ; $ca8a: a0 20     
            jsr __cad9         ; $ca8c: 20 d9 ca  
            cmp #$00           ; $ca8f: c9 00     
            beq __ca99         ; $ca91: f0 06     
            dec $b1            ; $ca93: c6 b1     
__ca95:     lda #$01           ; $ca95: a9 01     
            sty $69            ; $ca97: 84 69     
__ca99:     rts                ; $ca99: 60        

;-------------------------------------------------------------------------------
__ca9a:     jmp __cac6         ; $ca9a: 4c c6 ca  

;-------------------------------------------------------------------------------
__ca9d:     ldx $a0            ; $ca9d: a6 a0     
            ldy #$00           ; $ca9f: a0 00     
            jsr __cb21         ; $caa1: 20 21 cb  
            cmp #$00           ; $caa4: c9 00     
            bne __cab5         ; $caa6: d0 0d     
            ldx $b0            ; $caa8: a6 b0     
            ldy #$60           ; $caaa: a0 60     
            jsr __cb21         ; $caac: 20 21 cb  
            cmp #$00           ; $caaf: c9 00     
            beq __caba         ; $cab1: f0 07     
            dec $b1            ; $cab3: c6 b1     
__cab5:     clc                ; $cab5: 18        
            adc #$01           ; $cab6: 69 01     
            sty $69            ; $cab8: 84 69     
__caba:     rts                ; $caba: 60        

;-------------------------------------------------------------------------------
__cabb:     ldx $a0            ; $cabb: a6 a0     
            ldy #$00           ; $cabd: a0 00     
            jsr __cad9         ; $cabf: 20 d9 ca  
            cmp #$00           ; $cac2: c9 00     
            bne __cad6         ; $cac4: d0 10     
__cac6:     ldx $b0            ; $cac6: a6 b0     
            ldy #$00           ; $cac8: a0 00     
            jsr __cb21         ; $caca: 20 21 cb  
            cmp #$00           ; $cacd: c9 00     
            beq __cad8         ; $cacf: f0 07     
            clc                ; $cad1: 18        
            adc #$01           ; $cad2: 69 01     
            dec $b1            ; $cad4: c6 b1     
__cad6:     sty $69            ; $cad6: 84 69     
__cad8:     rts                ; $cad8: 60        

;-------------------------------------------------------------------------------
__cad9:     stx $05            ; $cad9: 86 05     
            ldx #$00           ; $cadb: a2 00     
__cadd:     cpy #$20           ; $cadd: c0 20     
            bpl __cae6         ; $cadf: 10 05     
            lda $a3,x          ; $cae1: b5 a3     
            jmp __cae8         ; $cae3: 4c e8 ca  

;-------------------------------------------------------------------------------
__cae6:     lda $b4,x          ; $cae6: b5 b4     
__cae8:     cmp #$02           ; $cae8: c9 02     
            bpl __caf7         ; $caea: 10 0b     
            lda #$90           ; $caec: a9 90     
            sta $02            ; $caee: 85 02     
            lda #$ba           ; $caf0: a9 ba     
            sta $03            ; $caf2: 85 03     
            jmp __caff         ; $caf4: 4c ff ca  

;-------------------------------------------------------------------------------
__caf7:     lda #$94           ; $caf7: a9 94     
            sta $02            ; $caf9: 85 02     
            lda #$ba           ; $cafb: a9 ba     
            sta $03            ; $cafd: 85 03     
__caff:     lda $02c0,y        ; $caff: b9 c0 02  
            cmp #$ff           ; $cb02: c9 ff     
            beq __cb14         ; $cb04: f0 0e     
            sta $01            ; $cb06: 85 01     
            lda $02c3,y        ; $cb08: b9 c3 02  
            sta $00            ; $cb0b: 85 00     
            jsr __e147         ; $cb0d: 20 47 e1  
            cmp #$00           ; $cb10: c9 00     
            bne __cb20         ; $cb12: d0 0c     
__cb14:     tya                ; $cb14: 98        
            clc                ; $cb15: 18        
            adc #$08           ; $cb16: 69 08     
            tay                ; $cb18: a8        
            inx                ; $cb19: e8        
            cpx $05            ; $cb1a: e4 05     
            bne __cadd         ; $cb1c: d0 bf     
            lda #$00           ; $cb1e: a9 00     
__cb20:     rts                ; $cb20: 60        

;-------------------------------------------------------------------------------
__cb21:     lda #$b0           ; $cb21: a9 b0     
            sta $02            ; $cb23: 85 02     
            lda #$ba           ; $cb25: a9 ba     
            sta $03            ; $cb27: 85 03     
__cb29:     lda $0240,y        ; $cb29: b9 40 02  
            cmp #$ff           ; $cb2c: c9 ff     
            beq __cb3e         ; $cb2e: f0 0e     
            sta $01            ; $cb30: 85 01     
            lda $0243,y        ; $cb32: b9 43 02  
            sta $00            ; $cb35: 85 00     
            jsr __e147         ; $cb37: 20 47 e1  
            cmp #$00           ; $cb3a: c9 00     
            bne __cb47         ; $cb3c: d0 09     
__cb3e:     tya                ; $cb3e: 98        
            clc                ; $cb3f: 18        
            adc #$10           ; $cb40: 69 10     
            tay                ; $cb42: a8        
            dex                ; $cb43: ca        
            bne __cb29         ; $cb44: d0 e3     
            txa                ; $cb46: 8a        
__cb47:     rts                ; $cb47: 60        

;-------------------------------------------------------------------------------
__cb48:     lda $020f          ; $cb48: ad 0f 02  
            sta $00            ; $cb4b: 85 00     
            lda $020c          ; $cb4d: ad 0c 02  
            sta $01            ; $cb50: 85 01     
            lda #$b4           ; $cb52: a9 b4     
            sta $02            ; $cb54: 85 02     
            lda #$ba           ; $cb56: a9 ba     
            sta $03            ; $cb58: 85 03     
            jmp __e147         ; $cb5a: 4c 47 e1  

;-------------------------------------------------------------------------------
__cb5d:     lda $01            ; $cb5d: a5 01     
            sec                ; $cb5f: 38        
            sbc #$58           ; $cb60: e9 58     
            sta $01            ; $cb62: 85 01     
__cb64:     lda #$b8           ; $cb64: a9 b8     
            sta $02            ; $cb66: 85 02     
            lda #$ba           ; $cb68: a9 ba     
            sta $03            ; $cb6a: 85 03     
            jmp __e147         ; $cb6c: 4c 47 e1  

;-------------------------------------------------------------------------------
__cb6f:     jsr __de6e         ; $cb6f: 20 6e de  
            cmp #$00           ; $cb72: c9 00     
            bne __cb82         ; $cb74: d0 0c     
            jsr __de7a         ; $cb76: 20 7a de  
            cmp #$00           ; $cb79: c9 00     
            bne __cb85         ; $cb7b: d0 08     
            lda #$04           ; $cb7d: a9 04     
            sta $6b            ; $cb7f: 85 6b     
            rts                ; $cb81: 60        

;-------------------------------------------------------------------------------
__cb82:     jmp __cc0b         ; $cb82: 4c 0b cc  

;-------------------------------------------------------------------------------
__cb85:     jsr __d005         ; $cb85: 20 05 d0  
            jmp __cc79         ; $cb88: 4c 79 cc  

;-------------------------------------------------------------------------------
__cb8b:     lda $79            ; $cb8b: a5 79     
            bne __cbc7         ; $cb8d: d0 38     
            jsr __d005         ; $cb8f: 20 05 d0  
            jsr __de7a         ; $cb92: 20 7a de  
            beq __cba1         ; $cb95: f0 0a     
            lda $54            ; $cb97: a5 54     
            cmp #$02           ; $cb99: c9 02     
            bne __cba1         ; $cb9b: d0 04     
            eor #$02           ; $cb9d: 49 02     
            sta $54            ; $cb9f: 85 54     
__cba1:     inc $ea            ; $cba1: e6 ea     
            jsr __de6e         ; $cba3: 20 6e de  
            cmp #$00           ; $cba6: c9 00     
            beq __cbc2         ; $cba8: f0 18     
            lda $71            ; $cbaa: a5 71     
            cmp #$01           ; $cbac: c9 01     
            beq __cbbf         ; $cbae: f0 0f     
            jsr __de72         ; $cbb0: 20 72 de  
            sta $72            ; $cbb3: 85 72     
            cmp #$11           ; $cbb5: c9 11     
            bne __cbbc         ; $cbb7: d0 03     
            jmp __ce71         ; $cbb9: 4c 71 ce  

;-------------------------------------------------------------------------------
__cbbc:     jmp __ce22         ; $cbbc: 4c 22 ce  

;-------------------------------------------------------------------------------
__cbbf:     jmp __cd13         ; $cbbf: 4c 13 cd  

;-------------------------------------------------------------------------------
__cbc2:     lda #$04           ; $cbc2: a9 04     
            sta $6b            ; $cbc4: 85 6b     
            rts                ; $cbc6: 60        

;-------------------------------------------------------------------------------
__cbc7:     lda $77            ; $cbc7: a5 77     
            sta $00            ; $cbc9: 85 00     
            jsr __d057         ; $cbcb: 20 57 d0  
            lda #$00           ; $cbce: a9 00     
            sta $79            ; $cbd0: 85 79     
            rts                ; $cbd2: 60        

;-------------------------------------------------------------------------------
__cbd3:     jsr __de6e         ; $cbd3: 20 6e de  
            cmp #$00           ; $cbd6: c9 00     
            bne __cbfb         ; $cbd8: d0 21     
            jsr __e28e         ; $cbda: 20 8e e2  
            lda $7e            ; $cbdd: a5 7e     
            cmp #$03           ; $cbdf: c9 03     
            bcc __cbea         ; $cbe1: 90 07     
            jsr __de7a         ; $cbe3: 20 7a de  
            cmp #$00           ; $cbe6: c9 00     
            bne __cbfe         ; $cbe8: d0 14     
__cbea:     jsr __de76         ; $cbea: 20 76 de  
            cmp #$00           ; $cbed: c9 00     
            bne __cc01         ; $cbef: d0 10     
            lda $0210          ; $cbf1: ad 10 02  
            cmp #$d8           ; $cbf4: c9 d8     
            bcs __cc06         ; $cbf6: b0 0e     
            jmp __cf05         ; $cbf8: 4c 05 cf  

;-------------------------------------------------------------------------------
__cbfb:     jmp __cc0b         ; $cbfb: 4c 0b cc  

;-------------------------------------------------------------------------------
__cbfe:     jmp __d013         ; $cbfe: 4c 13 d0  

;-------------------------------------------------------------------------------
__cc01:     lda #$04           ; $cc01: a9 04     
            sta $6b            ; $cc03: 85 6b     
            rts                ; $cc05: 60        

;-------------------------------------------------------------------------------
__cc06:     lda #$05           ; $cc06: a9 05     
            sta $6b            ; $cc08: 85 6b     
            rts                ; $cc0a: 60        

;-------------------------------------------------------------------------------
__cc0b:     lda $42            ; $cc0b: a5 42     
            sec                ; $cc0d: 38        
            sbc #$10           ; $cc0e: e9 10     
            sta $77            ; $cc10: 85 77     
            lda #$02           ; $cc12: a9 02     
            sta $6b            ; $cc14: 85 6b     
            lda $42            ; $cc16: a5 42     
            cmp #$14           ; $cc18: c9 14     
            beq __cc25         ; $cc1a: f0 09     
            cmp #$ec           ; $cc1c: c9 ec     
            bne __cc29         ; $cc1e: d0 09     
            lda #$01           ; $cc20: a9 01     
            sta $6d            ; $cc22: 85 6d     
            rts                ; $cc24: 60        

;-------------------------------------------------------------------------------
__cc25:     lda #$00           ; $cc25: a9 00     
            sta $6d            ; $cc27: 85 6d     
__cc29:     rts                ; $cc29: 60        

;-------------------------------------------------------------------------------
__cc2a:     jsr __de7a         ; $cc2a: 20 7a de  
            cmp #$00           ; $cc2d: c9 00     
            beq __cc39         ; $cc2f: f0 08     
            jsr __d013         ; $cc31: 20 13 d0  
            lda #$10           ; $cc34: a9 10     
            sta $ff            ; $cc36: 85 ff     
            rts                ; $cc38: 60        

;-------------------------------------------------------------------------------
__cc39:     lda $0210          ; $cc39: ad 10 02  
            cmp #$d8           ; $cc3c: c9 d8     
            bcc __cc49         ; $cc3e: 90 09     
            lda #$10           ; $cc40: a9 10     
            sta $ff            ; $cc42: 85 ff     
            lda #$05           ; $cc44: a9 05     
            sta $6b            ; $cc46: 85 6b     
            rts                ; $cc48: 60        

;-------------------------------------------------------------------------------
__cc49:     jsr __d025         ; $cc49: 20 25 d0  
            beq __cc56         ; $cc4c: f0 08     
            lda $09            ; $cc4e: a5 09     
            sta $ff            ; $cc50: 85 ff     
            lda #$00           ; $cc52: a9 00     
            sta $09            ; $cc54: 85 09     
__cc56:     lda $0213          ; $cc56: ad 13 02  
            sta $00            ; $cc59: 85 00     
            lda $0210          ; $cc5b: ad 10 02  
            clc                ; $cc5e: 18        
            adc $7a            ; $cc5f: 65 7a     
            sta $01            ; $cc61: 85 01     
            lda $0211          ; $cc63: ad 11 02  
            ldx $0212          ; $cc66: ae 12 02  
            cpx #$40           ; $cc69: e0 40     
            bmi __cc70         ; $cc6b: 30 03     
            sec                ; $cc6d: 38        
            sbc #$06           ; $cc6e: e9 06     
__cc70:     sta $02            ; $cc70: 85 02     
            lda $6d            ; $cc72: a5 6d     
            eor #$01           ; $cc74: 49 01     
            jmp __dfc8         ; $cc76: 4c c8 df  

;-------------------------------------------------------------------------------
__cc79:     lda $0210          ; $cc79: ad 10 02  
            sta $01            ; $cc7c: 85 01     
            lda $54            ; $cc7e: a5 54     
            cmp #$03           ; $cc80: c9 03     
            beq __cc8e         ; $cc82: f0 0a     
            cmp #$04           ; $cc84: c9 04     
            bne __ccb0         ; $cc86: d0 28     
            jsr __ccb1         ; $cc88: 20 b1 cc  
            jmp __cc91         ; $cc8b: 4c 91 cc  

;-------------------------------------------------------------------------------
__cc8e:     jsr __cccf         ; $cc8e: 20 cf cc  
__cc91:     sta $00            ; $cc91: 85 00     
            and #$02           ; $cc93: 29 02     
            pha                ; $cc95: 48        
            cmp $6f            ; $cc96: c5 6f     
            beq __cc9d         ; $cc98: f0 03     
            jsr __cced         ; $cc9a: 20 ed cc  
__cc9d:     pla                ; $cc9d: 68        
            sta $6f            ; $cc9e: 85 6f     
            lda $75            ; $cca0: a5 75     
            sta $02            ; $cca2: 85 02     
            lda $0210          ; $cca4: ad 10 02  
            sta $01            ; $cca7: 85 01     
            lda $6d            ; $cca9: a5 6d     
            eor #$01           ; $ccab: 49 01     
            jsr __dfc8         ; $ccad: 20 c8 df  
__ccb0:     rts                ; $ccb0: 60        

;-------------------------------------------------------------------------------
__ccb1:     lda #$01           ; $ccb1: a9 01     
            sta $6d            ; $ccb3: 85 6d     
            lda $78            ; $ccb5: a5 78     
            cmp #$04           ; $ccb7: c9 04     
            beq __ccc8         ; $ccb9: f0 0d     
            lda $56            ; $ccbb: a5 56     
            clc                ; $ccbd: 18        
            adc #$a0           ; $ccbe: 69 a0     
            sta $56            ; $ccc0: 85 56     
            lda $0213          ; $ccc2: ad 13 02  
            adc #$00           ; $ccc5: 69 00     
            rts                ; $ccc7: 60        

;-------------------------------------------------------------------------------
__ccc8:     lda $0213          ; $ccc8: ad 13 02  
            sec                ; $cccb: 38        
            sbc #$02           ; $cccc: e9 02     
            rts                ; $ccce: 60        

;-------------------------------------------------------------------------------
__cccf:     lda #$00           ; $cccf: a9 00     
            sta $6d            ; $ccd1: 85 6d     
            lda $78            ; $ccd3: a5 78     
            cmp #$03           ; $ccd5: c9 03     
            beq __cce6         ; $ccd7: f0 0d     
            lda $56            ; $ccd9: a5 56     
            sec                ; $ccdb: 38        
            sbc #$a0           ; $ccdc: e9 a0     
            sta $56            ; $ccde: 85 56     
            lda $0213          ; $cce0: ad 13 02  
            sbc #$00           ; $cce3: e9 00     
            rts                ; $cce5: 60        

;-------------------------------------------------------------------------------
__cce6:     lda $0213          ; $cce6: ad 13 02  
            clc                ; $cce9: 18        
            adc #$02           ; $ccea: 69 02     
            rts                ; $ccec: 60        

;-------------------------------------------------------------------------------
__cced:     lda $75            ; $cced: a5 75     
            beq __cd01         ; $ccef: f0 10     
            cmp #$10           ; $ccf1: c9 10     
            bpl __ccf9         ; $ccf3: 10 04     
            ldx $70            ; $ccf5: a6 70     
            beq __cd01         ; $ccf7: f0 08     
__ccf9:     sec                ; $ccf9: 38        
            sbc #$08           ; $ccfa: e9 08     
            ldx #$01           ; $ccfc: a2 01     
            jmp __cd06         ; $ccfe: 4c 06 cd  

;-------------------------------------------------------------------------------
__cd01:     clc                ; $cd01: 18        
            adc #$08           ; $cd02: 69 08     
            ldx #$00           ; $cd04: a2 00     
__cd06:     stx $70            ; $cd06: 86 70     
            sta $75            ; $cd08: 85 75     
            lda $6d            ; $cd0a: a5 6d     
            sta $6e            ; $cd0c: 85 6e     
            lda #$80           ; $cd0e: a9 80     
            sta $ff            ; $cd10: 85 ff     
            rts                ; $cd12: 60        

;-------------------------------------------------------------------------------
__cd13:     lda $54            ; $cd13: a5 54     
            beq __cd22         ; $cd15: f0 0b     
            cmp #$03           ; $cd17: c9 03     
            bmi __cd1f         ; $cd19: 30 04     
            jsr __cd94         ; $cd1b: 20 94 cd  
            rts                ; $cd1e: 60        

;-------------------------------------------------------------------------------
__cd1f:     jsr __cd23         ; $cd1f: 20 23 cd  
__cd22:     rts                ; $cd22: 60        

;-------------------------------------------------------------------------------
__cd23:     lda $0213          ; $cd23: ad 13 02  
            sta $00            ; $cd26: 85 00     
            lda $54            ; $cd28: a5 54     
            cmp #$01           ; $cd2a: c9 01     
            bne __cd34         ; $cd2c: d0 06     
            jsr __cd52         ; $cd2e: 20 52 cd  
            jmp __cd37         ; $cd31: 4c 37 cd  

;-------------------------------------------------------------------------------
__cd34:     jsr __cd76         ; $cd34: 20 76 cd  
__cd37:     sta $01            ; $cd37: 85 01     
            and #$01           ; $cd39: 29 01     
            beq __cd42         ; $cd3b: f0 05     
            lda #$28           ; $cd3d: a9 28     
            jmp __cd44         ; $cd3f: 4c 44 cd  

;-------------------------------------------------------------------------------
__cd42:     lda #$30           ; $cd42: a9 30     
__cd44:     sta $02            ; $cd44: 85 02     
            lda $6d            ; $cd46: a5 6d     
            eor #$01           ; $cd48: 49 01     
            jsr __dfc8         ; $cd4a: 20 c8 df  
            lda #$01           ; $cd4d: a9 01     
            sta $71            ; $cd4f: 85 71     
            rts                ; $cd51: 60        

;-------------------------------------------------------------------------------
__cd52:     lda $ea            ; $cd52: a5 ea     
            and #$0a           ; $cd54: 29 0a     
            bne __cd5c         ; $cd56: d0 04     
            lda #$20           ; $cd58: a9 20     
            sta $ff            ; $cd5a: 85 ff     
__cd5c:     lda $78            ; $cd5c: a5 78     
            cmp #$01           ; $cd5e: c9 01     
            beq __cd6f         ; $cd60: f0 0d     
            lda $56            ; $cd62: a5 56     
            sec                ; $cd64: 38        
            sbc #$40           ; $cd65: e9 40     
            sta $56            ; $cd67: 85 56     
            lda $0210          ; $cd69: ad 10 02  
            sbc #$00           ; $cd6c: e9 00     
            rts                ; $cd6e: 60        

;-------------------------------------------------------------------------------
__cd6f:     lda $0210          ; $cd6f: ad 10 02  
            clc                ; $cd72: 18        
            adc #$01           ; $cd73: 69 01     
            rts                ; $cd75: 60        

;-------------------------------------------------------------------------------
__cd76:     lda $78            ; $cd76: a5 78     
            cmp #$02           ; $cd78: c9 02     
            bne __cd83         ; $cd7a: d0 07     
            sec                ; $cd7c: 38        
            lda $0210          ; $cd7d: ad 10 02  
            sbc #$01           ; $cd80: e9 01     
            rts                ; $cd82: 60        

;-------------------------------------------------------------------------------
__cd83:     clc                ; $cd83: 18        
            lda $56            ; $cd84: a5 56     
            adc #$50           ; $cd86: 69 50     
            sta $56            ; $cd88: 85 56     
            lda $0210          ; $cd8a: ad 10 02  
            adc #$01           ; $cd8d: 69 01     
            ldx #$20           ; $cd8f: a2 20     
            stx $ff            ; $cd91: 86 ff     
            rts                ; $cd93: 60        

;-------------------------------------------------------------------------------
__cd94:     jsr __cdc9         ; $cd94: 20 c9 cd  
            beq __cd9a         ; $cd97: f0 01     
            rts                ; $cd99: 60        

;-------------------------------------------------------------------------------
__cd9a:     lda #$0b           ; $cd9a: a9 0b     
            ldx #$00           ; $cd9c: a2 00     
            jsr __df65         ; $cd9e: 20 65 df  
            bne __cda4         ; $cda1: d0 01     
            rts                ; $cda3: 60        

;-------------------------------------------------------------------------------
__cda4:     lda $54            ; $cda4: a5 54     
            cmp #$04           ; $cda6: c9 04     
            bne __cdb6         ; $cda8: d0 0c     
            lda $6d            ; $cdaa: a5 6d     
            beq __cdb3         ; $cdac: f0 05     
            lda #$00           ; $cdae: a9 00     
            jmp __cdbf         ; $cdb0: 4c bf cd  

;-------------------------------------------------------------------------------
__cdb3:     jmp __d067         ; $cdb3: 4c 67 d0  

;-------------------------------------------------------------------------------
__cdb6:     lda $6d            ; $cdb6: a5 6d     
            beq __cdbd         ; $cdb8: f0 03     
            jmp __d067         ; $cdba: 4c 67 d0  

;-------------------------------------------------------------------------------
__cdbd:     lda #$01           ; $cdbd: a9 01     
__cdbf:     sta $6d            ; $cdbf: 85 6d     
            jsr __d039         ; $cdc1: 20 39 d0  
            lda #$20           ; $cdc4: a9 20     
            sta $ff            ; $cdc6: 85 ff     
            rts                ; $cdc8: 60        

;-------------------------------------------------------------------------------
__cdc9:     lda $3e            ; $cdc9: a5 3e     
            pha                ; $cdcb: 48        
            lda $40            ; $cdcc: a5 40     
            pha                ; $cdce: 48        
            lda $54            ; $cdcf: a5 54     
            cmp #$03           ; $cdd1: c9 03     
            beq __cddb         ; $cdd3: f0 06     
            jsr __cdee         ; $cdd5: 20 ee cd  
            jmp __cdde         ; $cdd8: 4c de cd  

;-------------------------------------------------------------------------------
__cddb:     jsr __ce06         ; $cddb: 20 06 ce  
__cdde:     cmp #$00           ; $cdde: c9 00     
            bne __cde5         ; $cde0: d0 03     
            jsr __de76         ; $cde2: 20 76 de  
__cde5:     pla                ; $cde5: 68        
            sta $40            ; $cde6: 85 40     
            pla                ; $cde8: 68        
            sta $3e            ; $cde9: 85 3e     
            lda $0f            ; $cdeb: a5 0f     
            rts                ; $cded: 60        

;-------------------------------------------------------------------------------
__cdee:     lda $40            ; $cdee: a5 40     
            sec                ; $cdf0: 38        
            sbc $3e            ; $cdf1: e5 3e     
            clc                ; $cdf3: 18        
            adc $40            ; $cdf4: 65 40     
            bcs __ce03         ; $cdf6: b0 0b     
            ldx $40            ; $cdf8: a6 40     
            sta $40            ; $cdfa: 85 40     
            stx $3e            ; $cdfc: 86 3e     
            inc $41            ; $cdfe: e6 41     
            lda #$00           ; $ce00: a9 00     
            rts                ; $ce02: 60        

;-------------------------------------------------------------------------------
__ce03:     lda #$01           ; $ce03: a9 01     
            rts                ; $ce05: 60        

;-------------------------------------------------------------------------------
__ce06:     lda $40            ; $ce06: a5 40     
            sec                ; $ce08: 38        
            sbc $3e            ; $ce09: e5 3e     
            sta $40            ; $ce0b: 85 40     
            lda $3e            ; $ce0d: a5 3e     
            sec                ; $ce0f: 38        
            sbc $40            ; $ce10: e5 40     
            bcc __ce1f         ; $ce12: 90 0b     
            ldx $3e            ; $ce14: a6 3e     
            sta $3e            ; $ce16: 85 3e     
            stx $40            ; $ce18: 86 40     
            inc $41            ; $ce1a: e6 41     
            lda #$00           ; $ce1c: a9 00     
            rts                ; $ce1e: 60        

;-------------------------------------------------------------------------------
__ce1f:     lda #$01           ; $ce1f: a9 01     
            rts                ; $ce21: 60        

;-------------------------------------------------------------------------------
__ce22:     lda $54            ; $ce22: a5 54     
            cmp #$02           ; $ce24: c9 02     
            bmi __ce34         ; $ce26: 30 0c     
            lda #$0f           ; $ce28: a9 0f     
            ldx #$00           ; $ce2a: a2 00     
            jsr __df65         ; $ce2c: 20 65 df  
            beq __ce34         ; $ce2f: f0 03     
            jsr __ce35         ; $ce31: 20 35 ce  
__ce34:     rts                ; $ce34: 60        

;-------------------------------------------------------------------------------
__ce35:     lda $54            ; $ce35: a5 54     
            cmp #$02           ; $ce37: c9 02     
            beq __ce4c         ; $ce39: f0 11     
            cmp #$03           ; $ce3b: c9 03     
            beq __ce5e         ; $ce3d: f0 1f     
            lda #$01           ; $ce3f: a9 01     
            sta $6d            ; $ce41: 85 6d     
            lda $72            ; $ce43: a5 72     
            cmp #$01           ; $ce45: c9 01     
            beq __ce6e         ; $ce47: f0 25     
            jmp __ce6b         ; $ce49: 4c 6b ce  

;-------------------------------------------------------------------------------
__ce4c:     lda $72            ; $ce4c: a5 72     
            cmp #$01           ; $ce4e: c9 01     
            beq __ce57         ; $ce50: f0 05     
            lda #$00           ; $ce52: a9 00     
            jmp __ce59         ; $ce54: 4c 59 ce  

;-------------------------------------------------------------------------------
__ce57:     lda #$01           ; $ce57: a9 01     
__ce59:     sta $6d            ; $ce59: 85 6d     
            jmp __d039         ; $ce5b: 4c 39 d0  

;-------------------------------------------------------------------------------
__ce5e:     lda #$00           ; $ce5e: a9 00     
            sta $6d            ; $ce60: 85 6d     
            lda $72            ; $ce62: a5 72     
            cmp #$01           ; $ce64: c9 01     
            beq __ce6b         ; $ce66: f0 03     
            jmp __ce6e         ; $ce68: 4c 6e ce  

;-------------------------------------------------------------------------------
__ce6b:     jmp __d0c8         ; $ce6b: 4c c8 d0  

;-------------------------------------------------------------------------------
__ce6e:     jmp __d039         ; $ce6e: 4c 39 d0  

;-------------------------------------------------------------------------------
__ce71:     lda $54            ; $ce71: a5 54     
            bne __ce76         ; $ce73: d0 01     
            rts                ; $ce75: 60        

;-------------------------------------------------------------------------------
__ce76:     cmp #$03           ; $ce76: c9 03     
            bpl __ce7d         ; $ce78: 10 03     
            jmp __ce95         ; $ce7a: 4c 95 ce  

;-------------------------------------------------------------------------------
__ce7d:     lda #$0b           ; $ce7d: a9 0b     
            ldx #$00           ; $ce7f: a2 00     
            jsr __df65         ; $ce81: 20 65 df  
            beq __ce94         ; $ce84: f0 0e     
            lda $54            ; $ce86: a5 54     
            sec                ; $ce88: 38        
            sbc #$03           ; $ce89: e9 03     
            sta $6d            ; $ce8b: 85 6d     
            jsr __d039         ; $ce8d: 20 39 d0  
            lda #$20           ; $ce90: a9 20     
            sta $ff            ; $ce92: 85 ff     
__ce94:     rts                ; $ce94: 60        

;-------------------------------------------------------------------------------
__ce95:     lda $0213          ; $ce95: ad 13 02  
            sta $00            ; $ce98: 85 00     
            lda #$38           ; $ce9a: a9 38     
            sta $02            ; $ce9c: 85 02     
            lda $54            ; $ce9e: a5 54     
            cmp #$01           ; $cea0: c9 01     
            beq __ceaa         ; $cea2: f0 06     
            jsr __cee1         ; $cea4: 20 e1 ce  
            jmp __cead         ; $cea7: 4c ad ce  

;-------------------------------------------------------------------------------
__ceaa:     jsr __cebd         ; $ceaa: 20 bd ce  
__cead:     sta $01            ; $cead: 85 01     
            lda $01            ; $ceaf: a5 01     
            and #$04           ; $ceb1: 29 04     
            lsr                ; $ceb3: 4a        
            lsr                ; $ceb4: 4a        
            jsr __dfc8         ; $ceb5: 20 c8 df  
            lda #$02           ; $ceb8: a9 02     
            sta $71            ; $ceba: 85 71     
            rts                ; $cebc: 60        

;-------------------------------------------------------------------------------
__cebd:     lda $ea            ; $cebd: a5 ea     
            and #$08           ; $cebf: 29 08     
            bne __cec7         ; $cec1: d0 04     
            lda #$20           ; $cec3: a9 20     
            sta $ff            ; $cec5: 85 ff     
__cec7:     lda $78            ; $cec7: a5 78     
            .hex c9            ; $cec9: c9        Suspected data
__ceca:     ora ($f0,x)        ; $ceca: 01 f0     
            ora $56a5          ; $cecc: 0d a5 56  
            sec                ; $cecf: 38        
            sbc #$a0           ; $ced0: e9 a0     
__ced2:     sta $56            ; $ced2: 85 56     
            lda $0210          ; $ced4: ad 10 02  
            sbc #$00           ; $ced7: e9 00     
            rts                ; $ced9: 60        

;-------------------------------------------------------------------------------
            lda $0210          ; $ceda: ad 10 02  
            clc                ; $cedd: 18        
            adc #$01           ; $cede: 69 01     
            rts                ; $cee0: 60        

;-------------------------------------------------------------------------------
__cee1:     lda $78            ; $cee1: a5 78     
            cmp #$02           ; $cee3: c9 02     
            bne __ceee         ; $cee5: d0 07     
            lda $0210          ; $cee7: ad 10 02  
            sec                ; $ceea: 38        
            sbc #$01           ; $ceeb: e9 01     
            rts                ; $ceed: 60        

;-------------------------------------------------------------------------------
__ceee:     lda $ea            ; $ceee: a5 ea     
            and #$09           ; $cef0: 29 09     
            bne __cef8         ; $cef2: d0 04     
            lda #$20           ; $cef4: a9 20     
            sta $ff            ; $cef6: 85 ff     
__cef8:     lda $56            ; $cef8: a5 56     
            clc                ; $cefa: 18        
            adc #$90           ; $cefb: 69 90     
            sta $56            ; $cefd: 85 56     
            lda $0210          ; $ceff: ad 10 02  
            adc #$00           ; $cf02: 69 00     
            rts                ; $cf04: 60        

;-------------------------------------------------------------------------------
__cf05:     lda $0210          ; $cf05: ad 10 02  
            sta $01            ; $cf08: 85 01     
            lda #$00           ; $cf0a: a9 00     
            jsr __df88         ; $cf0c: 20 88 df  
            lda $54            ; $cf0f: a5 54     
            cmp #$03           ; $cf11: c9 03     
            bpl __cf1b         ; $cf13: 10 06     
            lda $0213          ; $cf15: ad 13 02  
            jmp __cf39         ; $cf18: 4c 39 cf  

;-------------------------------------------------------------------------------
__cf1b:     clc                ; $cf1b: 18        
            lda $56            ; $cf1c: a5 56     
            adc $7c            ; $cf1e: 65 7c     
            sta $56            ; $cf20: 85 56     
            lda #$00           ; $cf22: a9 00     
            rol                ; $cf24: 2a        
            sta $00            ; $cf25: 85 00     
            lda $0213          ; $cf27: ad 13 02  
            ldx $54            ; $cf2a: a6 54     
            cpx #$03           ; $cf2c: e0 03     
            beq __cf36         ; $cf2e: f0 06     
            clc                ; $cf30: 18        
            adc $00            ; $cf31: 65 00     
            jmp __cf39         ; $cf33: 4c 39 cf  

;-------------------------------------------------------------------------------
__cf36:     sec                ; $cf36: 38        
            sbc $00            ; $cf37: e5 00     
__cf39:     sta $00            ; $cf39: 85 00     
            lda #$18           ; $cf3b: a9 18     
            sta $02            ; $cf3d: 85 02     
            .hex a5            ; $cf3f: a5        Suspected data
__cf40:     adc $0149          ; $cf40: 6d 49 01  
            jsr __dfc8         ; $cf43: 20 c8 df  
            rts                ; $cf46: 60        

;-------------------------------------------------------------------------------
__cf47:     lda $0591          ; $cf47: ad 91 05  
            bne __cf50         ; $cf4a: d0 04     
            lda $8c            ; $cf4c: a5 8c     
            beq __cf51         ; $cf4e: f0 01     
__cf50:     rts                ; $cf50: 60        

;-------------------------------------------------------------------------------
__cf51:     lda #$e0           ; $cf51: a9 e0     
            sta $02            ; $cf53: 85 02     
            lda #$b9           ; $cf55: a9 b9     
            sta $03            ; $cf57: 85 03     
            lda #$00           ; $cf59: a9 00     
            sta $8c            ; $cf5b: 85 8c     
            ldx #$00           ; $cf5d: a2 00     
            ldy #$01           ; $cf5f: a0 01     
__cf61:     lda $9a,x          ; $cf61: b5 9a     
            beq __cf78         ; $cf63: f0 13     
            lda ($91),y        ; $cf65: b1 91     
            sta $00            ; $cf67: 85 00     
            iny                ; $cf69: c8        
            lda ($91),y        ; $cf6a: b1 91     
            sta $01            ; $cf6c: 85 01     
            jsr __e147         ; $cf6e: 20 47 e1  
            cmp #$00           ; $cf71: c9 00     
            bne __cf84         ; $cf73: d0 0f     
            jmp __cf79         ; $cf75: 4c 79 cf  

;-------------------------------------------------------------------------------
__cf78:     iny                ; $cf78: c8        
__cf79:     inx                ; $cf79: e8        
            tya                ; $cf7a: 98        
            clc                ; $cf7b: 18        
            adc #$06           ; $cf7c: 69 06     
            tay                ; $cf7e: a8        
            cpy $93            ; $cf7f: c4 93     
            bcc __cf61         ; $cf81: 90 de     
            rts                ; $cf83: 60        

;-------------------------------------------------------------------------------
__cf84:     lda #$02           ; $cf84: a9 02     
            sta $fe            ; $cf86: 85 fe     
            lda #$ff           ; $cf88: a9 ff     
            sta $0200          ; $cf8a: 8d 00 02  
            lda $8d,x          ; $cf8d: b5 8d     
            sta $02            ; $cf8f: 85 02     
            lda #$04           ; $cf91: a9 04     
            sta $03            ; $cf93: 85 03     
            lda #$30           ; $cf95: a9 30     
            sta $04            ; $cf97: 85 04     
            jsr __dfdf         ; $cf99: 20 df df  
            lda #$00           ; $cf9c: a9 00     
            sta $9a,x          ; $cf9e: 95 9a     
            txa                ; $cfa0: 8a        
            pha                ; $cfa1: 48        
            inx                ; $cfa2: e8        
            stx $8c            ; $cfa3: 86 8c     
            stx $9e            ; $cfa5: 86 9e     
            iny                ; $cfa7: c8        
            lda ($91),y        ; $cfa8: b1 91     
            sta $02            ; $cfaa: 85 02     
            lda #$22           ; $cfac: a9 22     
            sta $95            ; $cfae: 85 95     
            sta $03            ; $cfb0: 85 03     
            dex                ; $cfb2: ca        
            jsr __dfd5         ; $cfb3: 20 d5 df  
            ldx #$02           ; $cfb6: a2 02     
__cfb8:     iny                ; $cfb8: c8        
            lda ($91),y        ; $cfb9: b1 91     
            sta $94,x          ; $cfbb: 95 94     
            inx                ; $cfbd: e8        
            cpx #$06           ; $cfbe: e0 06     
            bne __cfb8         ; $cfc0: d0 f6     
            pla                ; $cfc2: 68        
            asl                ; $cfc3: 0a        
            sta $01            ; $cfc4: 85 01     
            ldx $4a            ; $cfc6: a6 4a     
            dex                ; $cfc8: ca        
            txa                ; $cfc9: 8a        
            asl                ; $cfca: 0a        
            sta $09            ; $cfcb: 85 09     
            asl                ; $cfcd: 0a        
            asl                ; $cfce: 0a        
            clc                ; $cfcf: 18        
            adc $01            ; $cfd0: 65 01     
            tax                ; $cfd2: aa        
            lda __b9ec,x       ; $cfd3: bd ec b9  
            sta $00            ; $cfd6: 85 00     
            lda __b9ed,x       ; $cfd8: bd ed b9  
            sta $01            ; $cfdb: 85 01     
            lda #$95           ; $cfdd: a9 95     
            sta $02            ; $cfdf: 85 02     
            lda #$00           ; $cfe1: a9 00     
            sta $03            ; $cfe3: 85 03     
            jsr __e5a1         ; $cfe5: 20 a1 e5  
            ldx $8c            ; $cfe8: a6 8c     
            cpx #$03           ; $cfea: e0 03     
            bpl __d002         ; $cfec: 10 14     
            dex                ; $cfee: ca        
            txa                ; $cfef: 8a        
            clc                ; $cff0: 18        
            adc $09            ; $cff1: 65 09     
            tax                ; $cff3: aa        
            lda __b9e4,x       ; $cff4: bd e4 b9  
            sta $00            ; $cff7: 85 00     
            ldy #$00           ; $cff9: a0 00     
            lda #$23           ; $cffb: a9 23     
            sta $01            ; $cffd: 85 01     
            jsr __e797         ; $cfff: 20 97 e7  
__d002:     jmp __e350         ; $d002: 4c 50 e3  

;-------------------------------------------------------------------------------
__d005:     jsr __de76         ; $d005: 20 76 de  
            cmp #$00           ; $d008: c9 00     
            beq __d010         ; $d00a: f0 04     
            lda $55            ; $d00c: a5 55     
            sta $54            ; $d00e: 85 54     
__d010:     sta $78            ; $d010: 85 78     
            rts                ; $d012: 60        

;-------------------------------------------------------------------------------
__d013:     jsr __d025         ; $d013: 20 25 d0  
            bne __d020         ; $d016: d0 08     
            jsr __d096         ; $d018: 20 96 d0  
            lda #$01           ; $d01b: a9 01     
            jmp __d022         ; $d01d: 4c 22 d0  

;-------------------------------------------------------------------------------
__d020:     lda #$05           ; $d020: a9 05     
__d022:     sta $6b            ; $d022: 85 6b     
            rts                ; $d024: 60        

;-------------------------------------------------------------------------------
__d025:     lda $0210          ; $d025: ad 10 02  
            cmp $76            ; $d028: c5 76     
            bcc __d033         ; $d02a: 90 07     
            sec                ; $d02c: 38        
            sbc $76            ; $d02d: e5 76     
            cmp $7b            ; $d02f: c5 7b     
            bcs __d036         ; $d031: b0 03     
__d033:     lda #$00           ; $d033: a9 00     
            rts                ; $d035: 60        

;-------------------------------------------------------------------------------
__d036:     lda #$01           ; $d036: a9 01     
            rts                ; $d038: 60        

;-------------------------------------------------------------------------------
__d039:     lda $0210          ; $d039: ad 10 02  
            sta $01            ; $d03c: 85 01     
            .hex ad 13         ; $d03e: ad 13     Suspected data
__d040:     .hex 02            ; $d040: 02        Invalid Opcode - KIL 
            ldx $71            ; $d041: a6 71     
            cpx #$02           ; $d043: e0 02     
            bne __d055         ; $d045: d0 0e     
            ldx $6d            ; $d047: a6 6d     
            beq __d050         ; $d049: f0 05     
            lda $73            ; $d04b: a5 73     
            jmp __d052         ; $d04d: 4c 52 d0  

;-------------------------------------------------------------------------------
__d050:     lda $74            ; $d050: a5 74     
__d052:     sec                ; $d052: 38        
            sbc #$10           ; $d053: e9 10     
__d055:     sta $00            ; $d055: 85 00     
__d057:     lda #$28           ; $d057: a9 28     
            sta $02            ; $d059: 85 02     
            lda $6d            ; $d05b: a5 6d     
            eor #$01           ; $d05d: 49 01     
            jsr __dfc8         ; $d05f: 20 c8 df  
            lda #$01           ; $d062: a9 01     
            sta $71            ; $d064: 85 71     
            rts                ; $d066: 60        

;-------------------------------------------------------------------------------
__d067:     txa                ; $d067: 8a        
            pha                ; $d068: 48        
            lda $0210          ; $d069: ad 10 02  
            sta $01            ; $d06c: 85 01     
            lda $0213          ; $d06e: ad 13 02  
            ldx $6d            ; $d071: a6 6d     
            beq __d07d         ; $d073: f0 08     
            sec                ; $d075: 38        
            sbc #$0c           ; $d076: e9 0c     
            sta $00            ; $d078: 85 00     
            jmp __d082         ; $d07a: 4c 82 d0  

;-------------------------------------------------------------------------------
__d07d:     clc                ; $d07d: 18        
            adc #$0c           ; $d07e: 69 0c     
            sta $00            ; $d080: 85 00     
__d082:     lda #$38           ; $d082: a9 38     
            sta $02            ; $d084: 85 02     
            lda $6d            ; $d086: a5 6d     
            eor #$01           ; $d088: 49 01     
            jsr __dfc8         ; $d08a: 20 c8 df  
            lda #$02           ; $d08d: a9 02     
            sta $71            ; $d08f: 85 71     
            sta $6b            ; $d091: 85 6b     
            pla                ; $d093: 68        
            tax                ; $d094: aa        
            rts                ; $d095: 60        

;-------------------------------------------------------------------------------
__d096:     lda $43            ; $d096: a5 43     
            sec                ; $d098: 38        
            sbc #$11           ; $d099: e9 11     
            sta $01            ; $d09b: 85 01     
            lda $0213          ; $d09d: ad 13 02  
            sta $00            ; $d0a0: 85 00     
            lda #$20           ; $d0a2: a9 20     
            sta $02            ; $d0a4: 85 02     
            sta $63            ; $d0a6: 85 63     
            lda $6d            ; $d0a8: a5 6d     
            eor #$01           ; $d0aa: 49 01     
            jsr __dfc8         ; $d0ac: 20 c8 df  
            lda #$60           ; $d0af: a9 60     
            sta $86            ; $d0b1: 85 86     
            lda #$01           ; $d0b3: a9 01     
            sta $87            ; $d0b5: 85 87     
            lda #$02           ; $d0b7: a9 02     
            sta $7a            ; $d0b9: 85 7a     
            lda #$18           ; $d0bb: a9 18     
            sta $7b            ; $d0bd: 85 7b     
            lda #$a0           ; $d0bf: a9 a0     
            sta $7c            ; $d0c1: 85 7c     
            lda #$10           ; $d0c3: a9 10     
            sta $ff            ; $d0c5: 85 ff     
            rts                ; $d0c7: 60        

;-------------------------------------------------------------------------------
__d0c8:     lda $0210          ; $d0c8: ad 10 02  
            sta $01            ; $d0cb: 85 01     
            sta $76            ; $d0cd: 85 76     
            lda $0213          ; $d0cf: ad 13 02  
            sta $00            ; $d0d2: 85 00     
            lda #$18           ; $d0d4: a9 18     
            sta $02            ; $d0d6: 85 02     
            lda $6d            ; $d0d8: a5 6d     
            eor #$01           ; $d0da: 49 01     
            jsr __dfc8         ; $d0dc: 20 c8 df  
            lda #$00           ; $d0df: a9 00     
            sta $71            ; $d0e1: 85 71     
            lda #$04           ; $d0e3: a9 04     
            sta $6b            ; $d0e5: 85 6b     
            rts                ; $d0e7: 60        

;-------------------------------------------------------------------------------
__d0e8:     lda $0210          ; $d0e8: ad 10 02  
            cmp #$d8           ; $d0eb: c9 d8     
            bcs __d108         ; $d0ed: b0 19     
            clc                ; $d0ef: 18        
            adc #$02           ; $d0f0: 69 02     
            sta $01            ; $d0f2: 85 01     
            lda $09            ; $d0f4: a5 09     
            sta $ff            ; $d0f6: 85 ff     
            lda $0213          ; $d0f8: ad 13 02  
            sta $00            ; $d0fb: 85 00     
            lda #$40           ; $d0fd: a9 40     
            sta $02            ; $d0ff: 85 02     
            lda #$00           ; $d101: a9 00     
            sta $09            ; $d103: 85 09     
            jmp __dfc8         ; $d105: 4c c8 df  

;-------------------------------------------------------------------------------
__d108:     lda $08            ; $d108: a5 08     
            sta $ff            ; $d10a: 85 ff     
            jmp __c579         ; $d10c: 4c 79 c5  

;-------------------------------------------------------------------------------
__d10f:     lda $65            ; $d10f: a5 65     
            cmp #$24           ; $d111: c9 24     
            bne __d119         ; $d113: d0 04     
            lda #$02           ; $d115: a9 02     
            sta $ff            ; $d117: 85 ff     
__d119:     lda $0210          ; $d119: ad 10 02  
            sta $01            ; $d11c: 85 01     
            lda $0213          ; $d11e: ad 13 02  
            sta $00            ; $d121: 85 00     
            ldx #$40           ; $d123: a2 40     
            lda $65            ; $d125: a5 65     
            and #$02           ; $d127: 29 02     
            bne __d12d         ; $d129: d0 02     
            ldx #$48           ; $d12b: a2 48     
__d12d:     stx $02            ; $d12d: 86 02     
            lda #$00           ; $d12f: a9 00     
            jsr __dfc8         ; $d131: 20 c8 df  
            lda #$20           ; $d134: a9 20     
            sta $39            ; $d136: 85 39     
            lda $0210          ; $d138: ad 10 02  
            cmp #$d8           ; $d13b: c9 d8     
            bcs __d144         ; $d13d: b0 05     
            lda #$10           ; $d13f: a9 10     
            jmp __d146         ; $d141: 4c 46 d1  

;-------------------------------------------------------------------------------
__d144:     lda #$00           ; $d144: a9 00     
__d146:     sta $08            ; $d146: 85 08     
            rts                ; $d148: 60        

;-------------------------------------------------------------------------------
__d149:     lda $0590          ; $d149: ad 90 05  
            bne __d155         ; $d14c: d0 07     
            lda #$20           ; $d14e: a9 20     
            sta $35            ; $d150: 85 35     
            sta $0590          ; $d152: 8d 90 05  
__d155:     ldy $35            ; $d155: a4 35     
            bne __d15f         ; $d157: d0 06     
            lda #$00           ; $d159: a9 00     
            sta $0591          ; $d15b: 8d 91 05  
            rts                ; $d15e: 60        

;-------------------------------------------------------------------------------
__d15f:     lda #$20           ; $d15f: a9 20     
            sta $01            ; $d161: 85 01     
            lda #$c8           ; $d163: a9 c8     
            ldx $4a            ; $d165: a6 4a     
            cpx #$04           ; $d167: e0 04     
            bne __d16d         ; $d169: d0 02     
            lda #$c4           ; $d16b: a9 c4     
__d16d:     sta $00            ; $d16d: 85 00     
            cpx #$03           ; $d16f: e0 03     
            beq __d17c         ; $d171: f0 09     
            lda #$ce           ; $d173: a9 ce     
            sta $02            ; $d175: 85 02     
            lda #$ba           ; $d177: a9 ba     
            jmp __d182         ; $d179: 4c 82 d1  

;-------------------------------------------------------------------------------
__d17c:     lda #$d3           ; $d17c: a9 d3     
            sta $02            ; $d17e: 85 02     
            lda #$ba           ; $d180: a9 ba     
__d182:     sta $03            ; $d182: 85 03     
            cpy #$10           ; $d184: c0 10     
            beq __d199         ; $d186: f0 11     
            cpy #$01           ; $d188: c0 01     
            beq __d192         ; $d18a: f0 06     
            lda #$00           ; $d18c: a9 00     
            sta $0591          ; $d18e: 8d 91 05  
            rts                ; $d191: 60        

;-------------------------------------------------------------------------------
__d192:     lda $02            ; $d192: a5 02     
            clc                ; $d194: 18        
            adc #$0e           ; $d195: 69 0e     
            sta $02            ; $d197: 85 02     
__d199:     jsr __e5a1         ; $d199: 20 a1 e5  
            lda #$01           ; $d19c: a9 01     
            sta $0591          ; $d19e: 8d 91 05  
            rts                ; $d1a1: 60        

;-------------------------------------------------------------------------------
__d1a2:     ldx $8c            ; $d1a2: a6 8c     
            beq __d1d7         ; $d1a4: f0 31     
            lda #$30           ; $d1a6: a9 30     
            sta $04            ; $d1a8: 85 04     
            lda $0230          ; $d1aa: ad 30 02  
            cmp #$d8           ; $d1ad: c9 d8     
            bcs __d1bc         ; $d1af: b0 0b     
            clc                ; $d1b1: 18        
            adc #$02           ; $d1b2: 69 02     
            sta $01            ; $d1b4: 85 01     
            lda #$00           ; $d1b6: a9 00     
            pha                ; $d1b8: 48        
            jmp __d1c5         ; $d1b9: 4c c5 d1  

;-------------------------------------------------------------------------------
__d1bc:     lda #$00           ; $d1bc: a9 00     
            sta $8c            ; $d1be: 85 8c     
            lda #$ff           ; $d1c0: a9 ff     
            sta $01            ; $d1c2: 85 01     
            pha                ; $d1c4: 48        
__d1c5:     lda $0231          ; $d1c5: ad 31 02  
            sta $02            ; $d1c8: 85 02     
            lda #$22           ; $d1ca: a9 22     
            sta $03            ; $d1cc: 85 03     
            lda $0233          ; $d1ce: ad 33 02  
            sta $00            ; $d1d1: 85 00     
            pla                ; $d1d3: 68        
            jsr __dfe1         ; $d1d4: 20 e1 df  
__d1d7:     rts                ; $d1d7: 60        

;-------------------------------------------------------------------------------
__d1d8:     lda #$c0           ; $d1d8: a9 c0     
            sta $04            ; $d1da: 85 04     
            lda #$00           ; $d1dc: a9 00     
            ldx #$00           ; $d1de: a2 00     
            ldy #$00           ; $d1e0: a0 00     
__d1e2:     pha                ; $d1e2: 48        
            lda $02c0,y        ; $d1e3: b9 c0 02  
            cmp #$ff           ; $d1e6: c9 ff     
            bne __d1f0         ; $d1e8: d0 06     
            jsr __d28c         ; $d1ea: 20 8c d2  
            jmp __d230         ; $d1ed: 4c 30 d2  

;-------------------------------------------------------------------------------
__d1f0:     sta $01            ; $d1f0: 85 01     
            lda $02c3,y        ; $d1f2: b9 c3 02  
            sta $00            ; $d1f5: 85 00     
            lda $a3,x          ; $d1f7: b5 a3     
            cmp #$02           ; $d1f9: c9 02     
            bpl __d206         ; $d1fb: 10 09     
            lda #$98           ; $d1fd: a9 98     
            sta $02            ; $d1ff: 85 02     
            lda #$ba           ; $d201: a9 ba     
            jmp __d20c         ; $d203: 4c 0c d2  

;-------------------------------------------------------------------------------
__d206:     lda #$9c           ; $d206: a9 9c     
            sta $02            ; $d208: 85 02     
            lda #$ba           ; $d20a: a9 ba     
__d20c:     sta $03            ; $d20c: 85 03     
            jsr __e142         ; $d20e: 20 42 e1  
            jsr __de6e         ; $d211: 20 6e de  
            cmp #$00           ; $d214: c9 00     
            bne __d245         ; $d216: d0 2d     
            jsr __de7e         ; $d218: 20 7e de  
            cmp #$00           ; $d21b: c9 00     
            bne __d262         ; $d21d: d0 43     
            dec $a2            ; $d21f: c6 a2     
            cpy $a2            ; $d221: c4 a2     
            beq __d276         ; $d223: f0 51     
            inc $a2            ; $d225: e6 a2     
            lda $a3,x          ; $d227: b5 a3     
            cmp #$02           ; $d229: c9 02     
            bpl __d280         ; $d22b: 10 53     
            jmp __d286         ; $d22d: 4c 86 d2  

;-------------------------------------------------------------------------------
__d230:     pla                ; $d230: 68        
            tax                ; $d231: aa        
            inx                ; $d232: e8        
            cpx $a0            ; $d233: e4 a0     
            beq __d244         ; $d235: f0 0d     
            tya                ; $d237: 98        
            clc                ; $d238: 18        
            adc #$08           ; $d239: 69 08     
            tay                ; $d23b: a8        
            adc #$c0           ; $d23c: 69 c0     
            sta $04            ; $d23e: 85 04     
            txa                ; $d240: 8a        
            jmp __d1e2         ; $d241: 4c e2 d1  

;-------------------------------------------------------------------------------
__d244:     rts                ; $d244: 60        

;-------------------------------------------------------------------------------
__d245:     jsr __de7e         ; $d245: 20 7e de  
            cmp #$00           ; $d248: c9 00     
            beq __d258         ; $d24a: f0 0c     
            jsr __d40e         ; $d24c: 20 0e d4  
            lda $a3,x          ; $d24f: b5 a3     
            cmp #$02           ; $d251: c9 02     
            bmi __d266         ; $d253: 30 11     
            jmp __d25c         ; $d255: 4c 5c d2  

;-------------------------------------------------------------------------------
__d258:     lda #$00           ; $d258: a9 00     
            sta $a8,x          ; $d25a: 95 a8     
__d25c:     jsr __d2dd         ; $d25c: 20 dd d2  
            jmp __d230         ; $d25f: 4c 30 d2  

;-------------------------------------------------------------------------------
__d262:     lda #$00           ; $d262: a9 00     
            sta $a8,x          ; $d264: 95 a8     
__d266:     iny                ; $d266: c8        
            cpy $a2            ; $d267: c4 a2     
            bne __d26f         ; $d269: d0 04     
            lda #$00           ; $d26b: a9 00     
            sta $a2            ; $d26d: 85 a2     
__d26f:     dey                ; $d26f: 88        
            jsr __d330         ; $d270: 20 30 d3  
            jmp __d230         ; $d273: 4c 30 d2  

;-------------------------------------------------------------------------------
__d276:     jsr __d2bb         ; $d276: 20 bb d2  
            inc $a2            ; $d279: e6 a2     
            sta $a3,x          ; $d27b: 95 a3     
            jmp __d230         ; $d27d: 4c 30 d2  

;-------------------------------------------------------------------------------
__d280:     jsr __d393         ; $d280: 20 93 d3  
            jmp __d230         ; $d283: 4c 30 d2  

;-------------------------------------------------------------------------------
__d286:     jsr __d3cd         ; $d286: 20 cd d3  
            jmp __d230         ; $d289: 4c 30 d2  

;-------------------------------------------------------------------------------
__d28c:     lda $0211          ; $d28c: ad 11 02  
            cmp #$50           ; $d28f: c9 50     
            beq __d299         ; $d291: f0 06     
            lda $4b            ; $d293: a5 4b     
            cmp #$03           ; $d295: c9 03     
            bmi __d2ba         ; $d297: 30 21     
__d299:     lda $a2            ; $d299: a5 a2     
            bne __d2ba         ; $d29b: d0 1d     
            iny                ; $d29d: c8        
            sty $a2            ; $d29e: 84 a2     
            dey                ; $d2a0: 88        
            lda #$40           ; $d2a1: a9 40     
            sta $00            ; $d2a3: 85 00     
            lda #$34           ; $d2a5: a9 34     
            sta $01            ; $d2a7: 85 01     
            lda #$58           ; $d2a9: a9 58     
            sta $02            ; $d2ab: 85 02     
            lda #$12           ; $d2ad: a9 12     
            sta $03            ; $d2af: 85 03     
            lda #$00           ; $d2b1: a9 00     
            sta $80            ; $d2b3: 85 80     
            sta $a3,x          ; $d2b5: 95 a3     
            jsr __dfda         ; $d2b7: 20 da df  
__d2ba:     rts                ; $d2ba: 60        

;-------------------------------------------------------------------------------
__d2bb:     lda $02c0,y        ; $d2bb: b9 c0 02  
            sta $01            ; $d2be: 85 01     
            lda #$01           ; $d2c0: a9 01     
            jsr __df88         ; $d2c2: 20 88 df  
            lda $57,x          ; $d2c5: b5 57     
            adc #$80           ; $d2c7: 69 80     
            sta $57,x          ; $d2c9: 95 57     
            lda #$00           ; $d2cb: a9 00     
            .hex 79            ; $d2cd: 79        Suspected data
__d2ce:     .hex c3 02         ; $d2ce: c3 02     Invalid Opcode - DCP ($02,x)
            sta $00            ; $d2d0: 85 00     
            lda #$58           ; $d2d2: a9 58     
            sta $02            ; $d2d4: 85 02     
            lda #$12           ; $d2d6: a9 12     
            sta $03            ; $d2d8: 85 03     
            jmp __dfda         ; $d2da: 4c da df  

;-------------------------------------------------------------------------------
__d2dd:     lda $a3,x          ; $d2dd: b5 a3     
            cmp #$02           ; $d2df: c9 02     
            bne __d2eb         ; $d2e1: d0 08     
            jsr __d30a         ; $d2e3: 20 0a d3  
            ldx #$00           ; $d2e6: a2 00     
            jmp __d2f0         ; $d2e8: 4c f0 d2  

;-------------------------------------------------------------------------------
__d2eb:     jsr __d320         ; $d2eb: 20 20 d3  
            ldx #$02           ; $d2ee: a2 02     
__d2f0:     and #$02           ; $d2f0: 29 02     
            beq __d2f9         ; $d2f2: f0 05     
            lda #$60           ; $d2f4: a9 60     
            jmp __d2fb         ; $d2f6: 4c fb d2  

;-------------------------------------------------------------------------------
__d2f9:     lda #$62           ; $d2f9: a9 62     
__d2fb:     sta $02            ; $d2fb: 85 02     
            lda $02c3,y        ; $d2fd: b9 c3 02  
            sta $00            ; $d300: 85 00     
            lda #$21           ; $d302: a9 21     
            sta $03            ; $d304: 85 03     
            txa                ; $d306: 8a        
            jmp __dfe1         ; $d307: 4c e1 df  

;-------------------------------------------------------------------------------
__d30a:     lda $57,x          ; $d30a: b5 57     
            clc                ; $d30c: 18        
            adc $0501          ; $d30d: 6d 01 05  
            sta $57,x          ; $d310: 95 57     
            lda #$00           ; $d312: a9 00     
            rol                ; $d314: 2a        
            sta $01            ; $d315: 85 01     
            lda $02c0,y        ; $d317: b9 c0 02  
            sec                ; $d31a: 38        
            sbc $01            ; $d31b: e5 01     
            sta $01            ; $d31d: 85 01     
            rts                ; $d31f: 60        

;-------------------------------------------------------------------------------
__d320:     lda $57,x          ; $d320: b5 57     
            clc                ; $d322: 18        
            adc $0502          ; $d323: 6d 02 05  
            sta $57,x          ; $d326: 95 57     
            lda #$00           ; $d328: a9 00     
            adc $02c0,y        ; $d32a: 79 c0 02  
            sta $01            ; $d32d: 85 01     
            rts                ; $d32f: 60        

;-------------------------------------------------------------------------------
__d330:     lda $0210          ; $d330: ad 10 02  
            cmp $02c0,y        ; $d333: d9 c0 02  
            bcc __d33d         ; $d336: 90 05     
            lda #$40           ; $d338: a9 40     
            jmp __d340         ; $d33a: 4c 40 d3  

;-------------------------------------------------------------------------------
__d33d:     lda $0506          ; $d33d: ad 06 05  
__d340:     cmp $18,x          ; $d340: d5 18     
            bcc __d345         ; $d342: 90 01     
            rts                ; $d344: 60        

;-------------------------------------------------------------------------------
__d345:     lda $a3,x          ; $d345: b5 a3     
            cmp #$00           ; $d347: c9 00     
            bne __d351         ; $d349: d0 06     
            jsr __d371         ; $d34b: 20 71 d3  
            jmp __d354         ; $d34e: 4c 54 d3  

;-------------------------------------------------------------------------------
__d351:     jsr __d37f         ; $d351: 20 7f d3  
__d354:     sta $00            ; $d354: 85 00     
            and #$02           ; $d356: 29 02     
            bne __d35f         ; $d358: d0 05     
            lda #$58           ; $d35a: a9 58     
            jmp __d361         ; $d35c: 4c 61 d3  

;-------------------------------------------------------------------------------
__d35f:     lda #$5a           ; $d35f: a9 5a     
__d361:     sta $02            ; $d361: 85 02     
            lda $02c0,y        ; $d363: b9 c0 02  
            sta $01            ; $d366: 85 01     
            lda #$12           ; $d368: a9 12     
            sta $03            ; $d36a: 85 03     
            lda $a3,x          ; $d36c: b5 a3     
            jmp __dfe1         ; $d36e: 4c e1 df  

;-------------------------------------------------------------------------------
__d371:     lda $57,x          ; $d371: b5 57     
            clc                ; $d373: 18        
            adc $0500          ; $d374: 6d 00 05  
            sta $57,x          ; $d377: 95 57     
            lda #$00           ; $d379: a9 00     
            adc $02c3,y        ; $d37b: 79 c3 02  
            rts                ; $d37e: 60        

;-------------------------------------------------------------------------------
__d37f:     lda $57,x          ; $d37f: b5 57     
            clc                ; $d381: 18        
            adc $0500          ; $d382: 6d 00 05  
            sta $57,x          ; $d385: 95 57     
            lda #$00           ; $d387: a9 00     
            rol                ; $d389: 2a        
            sta $00            ; $d38a: 85 00     
            lda $02c3,y        ; $d38c: b9 c3 02  
            sec                ; $d38f: 38        
            sbc $00            ; $d390: e5 00     
            rts                ; $d392: 60        

;-------------------------------------------------------------------------------
__d393:     lda $a3,x          ; $d393: b5 a3     
            cmp #$02           ; $d395: c9 02     
            bne __d3a2         ; $d397: d0 09     
            lda #$03           ; $d399: a9 03     
            sta $a3,x          ; $d39b: 95 a3     
            ldx #$00           ; $d39d: a2 00     
            jmp __d3ab         ; $d39f: 4c ab d3  

;-------------------------------------------------------------------------------
__d3a2:     lda #$02           ; $d3a2: a9 02     
            sta $a3,x          ; $d3a4: 95 a3     
            ldx #$01           ; $d3a6: a2 01     
            jmp __d3b4         ; $d3a8: 4c b4 d3  

;-------------------------------------------------------------------------------
__d3ab:     lda $02c0,y        ; $d3ab: b9 c0 02  
            clc                ; $d3ae: 18        
            adc #$01           ; $d3af: 69 01     
            jmp __d3ba         ; $d3b1: 4c ba d3  

;-------------------------------------------------------------------------------
__d3b4:     lda $02c0,y        ; $d3b4: b9 c0 02  
            sec                ; $d3b7: 38        
            sbc #$01           ; $d3b8: e9 01     
__d3ba:     sta $01            ; $d3ba: 85 01     
            lda $02c3,y        ; $d3bc: b9 c3 02  
            sta $00            ; $d3bf: 85 00     
            lda #$62           ; $d3c1: a9 62     
            sta $02            ; $d3c3: 85 02     
            lda #$21           ; $d3c5: a9 21     
            sta $03            ; $d3c7: 85 03     
            txa                ; $d3c9: 8a        
            jmp __dfe1         ; $d3ca: 4c e1 df  

;-------------------------------------------------------------------------------
__d3cd:     lda $a3,x          ; $d3cd: b5 a3     
            cmp #$00           ; $d3cf: c9 00     
            bne __d3de         ; $d3d1: d0 0b     
            lda #$5a           ; $d3d3: a9 5a     
            sta $02            ; $d3d5: 85 02     
            lda #$01           ; $d3d7: a9 01     
            .hex 95            ; $d3d9: 95        Suspected data
__d3da:     .hex a3 4c         ; $d3da: a3 4c     Invalid Opcode - LAX ($4c,x)
            .hex e9            ; $d3dc: e9        Suspected data
__d3dd:     .hex d3            ; $d3dd: d3        Suspected data
__d3de:     lda #$58           ; $d3de: a9 58     
            sta $02            ; $d3e0: 85 02     
            lda #$00           ; $d3e2: a9 00     
            sta $a3,x          ; $d3e4: 95 a3     
            jmp __d3e9         ; $d3e6: 4c e9 d3  

;-------------------------------------------------------------------------------
__d3e9:     pha                ; $d3e9: 48        
            lda $02c0,y        ; $d3ea: b9 c0 02  
            sta $01            ; $d3ed: 85 01     
            pla                ; $d3ef: 68        
            beq __d3fb         ; $d3f0: f0 09     
            lda $02c3,y        ; $d3f2: b9 c3 02  
            sec                ; $d3f5: 38        
            sbc #$01           ; $d3f6: e9 01     
            jmp __d401         ; $d3f8: 4c 01 d4  

;-------------------------------------------------------------------------------
__d3fb:     lda $02c3,y        ; $d3fb: b9 c3 02  
            clc                ; $d3fe: 18        
            adc #$01           ; $d3ff: 69 01     
__d401:     sta $00            ; $d401: 85 00     
            lda #$12           ; $d403: a9 12     
            sta $03            ; $d405: 85 03     
            lda $a3,x          ; $d407: b5 a3     
            eor #$01           ; $d409: 49 01     
            jmp __dfe1         ; $d40b: 4c e1 df  

;-------------------------------------------------------------------------------
__d40e:     txa                ; $d40e: 8a        
            pha                ; $d40f: 48        
            lda $a8,x          ; $d410: b5 a8     
            beq __d417         ; $d412: f0 03     
            jmp __d44f         ; $d414: 4c 4f d4  

;-------------------------------------------------------------------------------
__d417:     lda #$01           ; $d417: a9 01     
            sta $a8,x          ; $d419: 95 a8     
            lda $a3,x          ; $d41b: b5 a3     
            sta $08            ; $d41d: 85 08     
            lda #$00           ; $d41f: a9 00     
            sta $a3,x          ; $d421: 95 a3     
            jsr __d452         ; $d423: 20 52 d4  
            lda $19            ; $d426: a5 19     
            cmp $05            ; $d428: c5 05     
            bcc __d43d         ; $d42a: 90 11     
            .hex a5            ; $d42c: a5        Suspected data
__d42d:     .hex 1a            ; $d42d: 1a        Invalid Opcode - NOP 
            cmp $06            ; $d42e: c5 06     
            bcc __d43b         ; $d430: 90 09     
            lda $1b            ; $d432: a5 1b     
            cmp $07            ; $d434: c5 07     
            bcs __d43f         ; $d436: b0 07     
            jmp __d441         ; $d438: 4c 41 d4  

;-------------------------------------------------------------------------------
__d43b:     inc $a3,x          ; $d43b: f6 a3     
__d43d:     inc $a3,x          ; $d43d: f6 a3     
__d43f:     inc $a3,x          ; $d43f: f6 a3     
__d441:     lda $a3,x          ; $d441: b5 a3     
            ldx $08            ; $d443: a6 08     
            jsr __d6ac         ; $d445: 20 ac d6  
            clc                ; $d448: 18        
            adc $02c3,y        ; $d449: 79 c3 02  
            sta $02c3,y        ; $d44c: 99 c3 02  
__d44f:     pla                ; $d44f: 68        
            tax                ; $d450: aa        
            rts                ; $d451: 60        

;-------------------------------------------------------------------------------
__d452:     lda $02c3,y        ; $d452: b9 c3 02  
            sta $00            ; $d455: 85 00     
            lda $02c0,y        ; $d457: b9 c0 02  
            sta $01            ; $d45a: 85 01     
            lda #$30           ; $d45c: a9 30     
            sta $05            ; $d45e: 85 05     
            lda #$40           ; $d460: a9 40     
            sta $06            ; $d462: 85 06     
            lda #$80           ; $d464: a9 80     
            sta $07            ; $d466: 85 07     
            jsr __d4ba         ; $d468: 20 ba d4  
            lda $4a            ; $d46b: a5 4a     
            cmp #$04           ; $d46d: c9 04     
            beq __d48c         ; $d46f: f0 1b     
            dec $3f            ; $d471: c6 3f     
            dec $41            ; $d473: c6 41     
            jsr __de6e         ; $d475: 20 6e de  
            inc $3f            ; $d478: e6 3f     
            inc $41            ; $d47a: e6 41     
            cmp #$00           ; $d47c: c9 00     
            beq __d48c         ; $d47e: f0 0c     
            jsr __cb5d         ; $d480: 20 5d cb  
            cmp #$00           ; $d483: c9 00     
            bne __d49f         ; $d485: d0 18     
            lda $02c0,y        ; $d487: b9 c0 02  
            sta $01            ; $d48a: 85 01     
__d48c:     jsr __cb64         ; $d48c: 20 64 cb  
            cmp #$00           ; $d48f: c9 00     
            bne __d4a5         ; $d491: d0 12     
            lda $0223          ; $d493: ad 23 02  
            cmp $00            ; $d496: c5 00     
__d498:     bcc __d4b1         ; $d498: 90 17     
            beq __d49e         ; $d49a: f0 02     
            bcs __d4ab         ; $d49c: b0 0d     
__d49e:     rts                ; $d49e: 60        

;-------------------------------------------------------------------------------
__d49f:     lda $0503          ; $d49f: ad 03 05  
            sta $05            ; $d4a2: 85 05     
            rts                ; $d4a4: 60        

;-------------------------------------------------------------------------------
__d4a5:     lda $0504          ; $d4a5: ad 04 05  
            sta $06            ; $d4a8: 85 06     
            rts                ; $d4aa: 60        

;-------------------------------------------------------------------------------
__d4ab:     lda $0505          ; $d4ab: ad 05 05  
            sta $07            ; $d4ae: 85 07     
            rts                ; $d4b0: 60        

;-------------------------------------------------------------------------------
__d4b1:     sec                ; $d4b1: 38        
            lda #$ff           ; $d4b2: a9 ff     
            sbc $0505          ; $d4b4: ed 05 05  
            sta $07            ; $d4b7: 85 07     
            rts                ; $d4b9: 60        

;-------------------------------------------------------------------------------
__d4ba:     txa                ; $d4ba: 8a        
            pha                ; $d4bb: 48        
            ldx #$03           ; $d4bc: a2 03     
__d4be:     lda $05fc,x        ; $d4be: bd fc 05  
            sta $3e,x          ; $d4c1: 95 3e     
            dex                ; $d4c3: ca        
            bpl __d4be         ; $d4c4: 10 f8     
            pla                ; $d4c6: 68        
            tax                ; $d4c7: aa        
            rts                ; $d4c8: 60        

;-------------------------------------------------------------------------------
__d4c9:     lda #$e0           ; $d4c9: a9 e0     
            sta $04            ; $d4cb: 85 04     
            lda #$00           ; $d4cd: a9 00     
            ldx #$00           ; $d4cf: a2 00     
            ldy #$00           ; $d4d1: a0 00     
__d4d3:     pha                ; $d4d3: 48        
            txa                ; $d4d4: 8a        
            pha                ; $d4d5: 48        
            lda $02e0,y        ; $d4d6: b9 e0 02  
            cmp #$ff           ; $d4d9: c9 ff     
            beq __d4f1         ; $d4db: f0 14     
            lda $b9,x          ; $d4dd: b5 b9     
            bne __d4f7         ; $d4df: d0 16     
            lda $b4,x          ; $d4e1: b5 b4     
            cmp #$03           ; $d4e3: c9 03     
            beq __d503         ; $d4e5: f0 1c     
            cmp #$01           ; $d4e7: c9 01     
            beq __d509         ; $d4e9: f0 1e     
            .hex 20 dd         ; $d4eb: 20 dd     Suspected data
__d4ed:     cmp $4c,x          ; $d4ed: d5 4c     
            .hex 0c d5         ; $d4ef: 0c d5     Suspected data
__d4f1:     jsr __d54e         ; $d4f1: 20 4e d5  
            jmp __d538         ; $d4f4: 4c 38 d5  

;-------------------------------------------------------------------------------
__d4f7:     sec                ; $d4f7: 38        
            sbc #$01           ; $d4f8: e9 01     
            sta $b9,x          ; $d4fa: 95 b9     
            bne __d538         ; $d4fc: d0 3a     
            sta $b3            ; $d4fe: 85 b3     
            jmp __d538         ; $d500: 4c 38 d5  

;-------------------------------------------------------------------------------
__d503:     jsr __d636         ; $d503: 20 36 d6  
            jmp __d50c         ; $d506: 4c 0c d5  

;-------------------------------------------------------------------------------
__d509:     jsr __d5a7         ; $d509: 20 a7 d5  
__d50c:     and #$04           ; $d50c: 29 04     
            beq __d515         ; $d50e: f0 05     
            lda #$58           ; $d510: a9 58     
            jmp __d517         ; $d512: 4c 17 d5  

;-------------------------------------------------------------------------------
__d515:     lda #$5a           ; $d515: a9 5a     
__d517:     sta $02            ; $d517: 85 02     
            ldy $b4,x          ; $d519: b4 b4     
            cpy #$03           ; $d51b: c0 03     
            beq __d52a         ; $d51d: f0 0b     
            lda #$12           ; $d51f: a9 12     
            sta $03            ; $d521: 85 03     
            lda $b4,x          ; $d523: b5 b4     
            eor #$00           ; $d525: 49 00     
            jmp __d535         ; $d527: 4c 35 d5  

;-------------------------------------------------------------------------------
__d52a:     clc                ; $d52a: 18        
            adc #$08           ; $d52b: 69 08     
            sta $02            ; $d52d: 85 02     
            lda #$21           ; $d52f: a9 21     
            sta $03            ; $d531: 85 03     
            lda #$02           ; $d533: a9 02     
__d535:     jsr __dfe1         ; $d535: 20 e1 df  
__d538:     pla                ; $d538: 68        
            tax                ; $d539: aa        
            pla                ; $d53a: 68        
            inx                ; $d53b: e8        
            cpx $b0            ; $d53c: e4 b0     
            beq __d54d         ; $d53e: f0 0d     
            clc                ; $d540: 18        
            adc #$08           ; $d541: 69 08     
            tay                ; $d543: a8        
            clc                ; $d544: 18        
            adc #$e0           ; $d545: 69 e0     
            sta $04            ; $d547: 85 04     
            tya                ; $d549: 98        
            jmp __d4d3         ; $d54a: 4c d3 d4  

;-------------------------------------------------------------------------------
__d54d:     rts                ; $d54d: 60        

;-------------------------------------------------------------------------------
__d54e:     lda $36            ; $d54e: a5 36     
            bne __d5a6         ; $d550: d0 54     
            lda $0510          ; $d552: ad 10 05  
            sta $36            ; $d555: 85 36     
            lda $b3            ; $d557: a5 b3     
            bne __d5a6         ; $d559: d0 4b     
            lda $b0            ; $d55b: a5 b0     
            cmp $b1            ; $d55d: c5 b1     
            beq __d5a6         ; $d55f: f0 45     
            bmi __d5a6         ; $d561: 30 43     
            inc $b1            ; $d563: e6 b1     
            lda #$01           ; $d565: a9 01     
            sta $b3            ; $d567: 85 b3     
            lda #$30           ; $d569: a9 30     
            sta $b9,x          ; $d56b: 95 b9     
            sta $35            ; $d56d: 85 35     
            lda #$50           ; $d56f: a9 50     
            sta $00            ; $d571: 85 00     
            lda #$37           ; $d573: a9 37     
            sta $01            ; $d575: 85 01     
            lda #$58           ; $d577: a9 58     
            sta $02            ; $d579: 85 02     
            lda #$12           ; $d57b: a9 12     
            sta $03            ; $d57d: 85 03     
            lda $0213          ; $d57f: ad 13 02  
            cmp #$45           ; $d582: c9 45     
            bcs __d58f         ; $d584: b0 09     
            lda #$ff           ; $d586: a9 ff     
            sec                ; $d588: 38        
            sbc $0515          ; $d589: ed 15 05  
            jmp __d592         ; $d58c: 4c 92 d5  

;-------------------------------------------------------------------------------
__d58f:     lda $0515          ; $d58f: ad 15 05  
__d592:     cmp $19            ; $d592: c5 19     
            bcc __d59b         ; $d594: 90 05     
            lda #$00           ; $d596: a9 00     
            jmp __d59d         ; $d598: 4c 9d d5  

;-------------------------------------------------------------------------------
__d59b:     lda #$01           ; $d59b: a9 01     
__d59d:     sta $b4,x          ; $d59d: 95 b4     
            lda #$00           ; $d59f: a9 00     
            sta $b2            ; $d5a1: 85 b2     
            jsr __dfd5         ; $d5a3: 20 d5 df  
__d5a6:     rts                ; $d5a6: 60        

;-------------------------------------------------------------------------------
__d5a7:     lda $02e3,y        ; $d5a7: b9 e3 02  
            clc                ; $d5aa: 18        
            adc #$08           ; $d5ab: 69 08     
            cmp #$2c           ; $d5ad: c9 2c     
            beq __d5be         ; $d5af: f0 0d     
            cmp #$14           ; $d5b1: c9 14     
            bne __d5bb         ; $d5b3: d0 06     
            jsr __d693         ; $d5b5: 20 93 d6  
            jmp __d636         ; $d5b8: 4c 36 d6  

;-------------------------------------------------------------------------------
__d5bb:     jmp __d5c8         ; $d5bb: 4c c8 d5  

;-------------------------------------------------------------------------------
__d5be:     jsr __d662         ; $d5be: 20 62 d6  
            lda $b4,x          ; $d5c1: b5 b4     
            cmp #$03           ; $d5c3: c9 03     
            bne __d5c8         ; $d5c5: d0 01     
            rts                ; $d5c7: 60        

;-------------------------------------------------------------------------------
__d5c8:     lda $02e0,y        ; $d5c8: b9 e0 02  
            sta $01            ; $d5cb: 85 01     
            lda $5d,x          ; $d5cd: b5 5d     
            sec                ; $d5cf: 38        
            sbc $0511          ; $d5d0: ed 11 05  
            .hex 95            ; $d5d3: 95        Suspected data
__d5d4:     eor __e3b9,x       ; $d5d4: 5d b9 e3  
            .hex 02            ; $d5d7: 02        Invalid Opcode - KIL 
            sbc #$00           ; $d5d8: e9 00     
            sta $00            ; $d5da: 85 00     
            rts                ; $d5dc: 60        

;-------------------------------------------------------------------------------
            lda $02e3,y        ; $d5dd: b9 e3 02  
            clc                ; $d5e0: 18        
            adc #$07           ; $d5e1: 69 07     
            cmp #$94           ; $d5e3: c9 94     
            beq __d604         ; $d5e5: f0 1d     
            cmp #$6b           ; $d5e7: c9 6b     
            beq __d607         ; $d5e9: f0 1c     
            cmp #$8b           ; $d5eb: c9 8b     
            beq __d607         ; $d5ed: f0 18     
            cmp #$a3           ; $d5ef: c9 a3     
            beq __d607         ; $d5f1: f0 14     
            cmp #$bb           ; $d5f3: c9 bb     
            beq __d607         ; $d5f5: f0 10     
            cmp #$d3           ; $d5f7: c9 d3     
            bne __d601         ; $d5f9: d0 06     
            jsr __d693         ; $d5fb: 20 93 d6  
            jmp __d636         ; $d5fe: 4c 36 d6  

;-------------------------------------------------------------------------------
__d601:     jmp __d611         ; $d601: 4c 11 d6  

;-------------------------------------------------------------------------------
__d604:     jmp __d626         ; $d604: 4c 26 d6  

;-------------------------------------------------------------------------------
__d607:     jsr __d662         ; $d607: 20 62 d6  
            lda $b4,x          ; $d60a: b5 b4     
            cmp #$03           ; $d60c: c9 03     
            bne __d611         ; $d60e: d0 01     
            rts                ; $d610: 60        

;-------------------------------------------------------------------------------
__d611:     lda $02e0,y        ; $d611: b9 e0 02  
            sta $01            ; $d614: 85 01     
            lda $5d,x          ; $d616: b5 5d     
            clc                ; $d618: 18        
            adc $0511          ; $d619: 6d 11 05  
            sta $5d,x          ; $d61c: 95 5d     
            lda #$00           ; $d61e: a9 00     
            adc $02e3,y        ; $d620: 79 e3 02  
            sta $00            ; $d623: 85 00     
            rts                ; $d625: 60        

;-------------------------------------------------------------------------------
__d626:     lda $02e0,y        ; $d626: b9 e0 02  
            clc                ; $d629: 18        
            adc #$08           ; $d62a: 69 08     
            sta $01            ; $d62c: 85 01     
            lda $02e3,y        ; $d62e: b9 e3 02  
            sta $00            ; $d631: 85 00     
            inc $00            ; $d633: e6 00     
            rts                ; $d635: 60        

;-------------------------------------------------------------------------------
__d636:     lda $02e0,y        ; $d636: b9 e0 02  
            cmp #$e0           ; $d639: c9 e0     
            bcc __d64a         ; $d63b: 90 0d     
            lda #$ff           ; $d63d: a9 ff     
            sta $00            ; $d63f: 85 00     
            sta $01            ; $d641: 85 01     
            dec $b1            ; $d643: c6 b1     
            lda #$00           ; $d645: a9 00     
            sta $b4,x          ; $d647: 95 b4     
            rts                ; $d649: 60        

;-------------------------------------------------------------------------------
__d64a:     lda #$03           ; $d64a: a9 03     
            sta $b4,x          ; $d64c: 95 b4     
            lda $02e3,y        ; $d64e: b9 e3 02  
            sta $00            ; $d651: 85 00     
            lda $5d,x          ; $d653: b5 5d     
            adc $0512          ; $d655: 6d 12 05  
            sta $5d,x          ; $d658: 95 5d     
            lda #$00           ; $d65a: a9 00     
            adc $02e0,y        ; $d65c: 79 e0 02  
            sta $01            ; $d65f: 85 01     
            rts                ; $d661: 60        

;-------------------------------------------------------------------------------
__d662:     lda $02e3,y        ; $d662: b9 e3 02  
            sta $00            ; $d665: 85 00     
            lda $02e0,y        ; $d667: b9 e0 02  
            sta $01            ; $d66a: 85 01     
            jsr __d4ba         ; $d66c: 20 ba d4  
            jsr __cb64         ; $d66f: 20 64 cb  
            beq __d67a         ; $d672: f0 06     
            lda $0514          ; $d674: ad 14 05  
            jmp __d688         ; $d677: 4c 88 d6  

;-------------------------------------------------------------------------------
__d67a:     lda $0210          ; $d67a: ad 10 02  
            cmp #$47           ; $d67d: c9 47     
            bcc __d686         ; $d67f: 90 05     
            lda #$40           ; $d681: a9 40     
            jmp __d688         ; $d683: 4c 88 d6  

;-------------------------------------------------------------------------------
__d686:     lda #$10           ; $d686: a9 10     
__d688:     cmp $18,x          ; $d688: d5 18     
            bcs __d68d         ; $d68a: b0 01     
            rts                ; $d68c: 60        

;-------------------------------------------------------------------------------
__d68d:     jsr __d693         ; $d68d: 20 93 d6  
            jmp __d636         ; $d690: 4c 36 d6  

;-------------------------------------------------------------------------------
__d693:     txa                ; $d693: 8a        
            pha                ; $d694: 48        
            lda $b4,x          ; $d695: b5 b4     
            sta $00            ; $d697: 85 00     
            lda #$03           ; $d699: a9 03     
            sta $b4,x          ; $d69b: 95 b4     
            ldx $00            ; $d69d: a6 00     
            jsr __d6ac         ; $d69f: 20 ac d6  
            clc                ; $d6a2: 18        
            adc $02e3,y        ; $d6a3: 79 e3 02  
            sta $02e3,y        ; $d6a6: 99 e3 02  
            pla                ; $d6a9: 68        
            tax                ; $d6aa: aa        
            rts                ; $d6ab: 60        

;-------------------------------------------------------------------------------
__d6ac:     cpx #$02           ; $d6ac: e0 02     
            bpl __d6ba         ; $d6ae: 10 0a     
            cmp #$02           ; $d6b0: c9 02     
            bpl __d6b7         ; $d6b2: 10 03     
            lda #$00           ; $d6b4: a9 00     
            rts                ; $d6b6: 60        

;-------------------------------------------------------------------------------
__d6b7:     lda #$05           ; $d6b7: a9 05     
            rts                ; $d6b9: 60        

;-------------------------------------------------------------------------------
__d6ba:     cmp #$02           ; $d6ba: c9 02     
            bpl __d6c1         ; $d6bc: 10 03     
            lda #$fb           ; $d6be: a9 fb     
            rts                ; $d6c0: 60        

;-------------------------------------------------------------------------------
__d6c1:     lda #$00           ; $d6c1: a9 00     
            rts                ; $d6c3: 60        

;-------------------------------------------------------------------------------
__d6c4:     lda $d0            ; $d6c4: a5 d0     
            beq __d6ec         ; $d6c6: f0 24     
            ldx $020c          ; $d6c8: ae 0c 02  
            cpx #$a0           ; $d6cb: e0 a0     
            beq __d6e0         ; $d6cd: f0 11     
            inx                ; $d6cf: e8        
            stx $020c          ; $d6d0: 8e 0c 02  
            lda #$f0           ; $d6d3: a9 f0     
            sta $020d          ; $d6d5: 8d 0d 02  
            lda #$ab           ; $d6d8: a9 ab     
            sta $020f          ; $d6da: 8d 0f 02  
            .hex 4c ec         ; $d6dd: 4c ec     Suspected data
__d6df:     .hex d6            ; $d6df: d6        Suspected data
__d6e0:     lda #$ff           ; $d6e0: a9 ff     
            sta $020c          ; $d6e2: 8d 0c 02  
            sta $020f          ; $d6e5: 8d 0f 02  
            lda #$00           ; $d6e8: a9 00     
            sta $d0            ; $d6ea: 85 d0     
__d6ec:     rts                ; $d6ec: 60        

;-------------------------------------------------------------------------------
__d6ed:     ldx $ad            ; $d6ed: a6 ad     
            bne __d6f2         ; $d6ef: d0 01     
            rts                ; $d6f1: 60        

;-------------------------------------------------------------------------------
__d6f2:     lda $0210          ; $d6f2: ad 10 02  
            cmp #$8b           ; $d6f5: c9 8b     
            bcs __d6fb         ; $d6f7: b0 02     
            lda #$8c           ; $d6f9: a9 8c     
__d6fb:     sta $01            ; $d6fb: 85 01     
            dex                ; $d6fd: ca        
            lda #$00           ; $d6fe: a9 00     
            sta $ad            ; $d700: 85 ad     
            lda $0213          ; $d702: ad 13 02  
            clc                ; $d705: 18        
            adc $a0,x          ; $d706: 75 a0     
            sta $00            ; $d708: 85 00     
            lda $0211          ; $d70a: ad 11 02  
            ldx $6d            ; $d70d: a6 6d     
            bne __d714         ; $d70f: d0 03     
            sec                ; $d711: 38        
            sbc #$06           ; $d712: e9 06     
__d714:     sta $02            ; $d714: 85 02     
            lda $6d            ; $d716: a5 6d     
            eor #$01           ; $d718: 49 01     
            jmp __dfc8         ; $d71a: 4c c8 df  

;-------------------------------------------------------------------------------
__d71d:     lda $bd            ; $d71d: a5 bd     
            bne __d764         ; $d71f: d0 43     
            cmp $bc            ; $d721: c5 bc     
            beq __d763         ; $d723: f0 3e     
            sta $bc            ; $d725: 85 bc     
            lda $0210          ; $d727: ad 10 02  
            cmp #$c2           ; $d72a: c9 c2     
            bcs __d74f         ; $d72c: b0 21     
            lda #$01           ; $d72e: a9 01     
            sta $6c            ; $d730: 85 6c     
            lda #$03           ; $d732: a9 03     
            sta $6b            ; $d734: 85 6b     
            ldx $6d            ; $d736: a6 6d     
            inx                ; $d738: e8        
            inx                ; $d739: e8        
            inx                ; $d73a: e8        
            stx $54            ; $d73b: 86 54     
            lda $87            ; $d73d: a5 87     
            cmp #$02           ; $d73f: c9 02     
            beq __d74f         ; $d741: f0 0c     
            lda #$01           ; $d743: a9 01     
            sta $87            ; $d745: 85 87     
            lda #$90           ; $d747: a9 90     
            sta $7c            ; $d749: 85 7c     
            lda #$60           ; $d74b: a9 60     
            sta $86            ; $d74d: 85 86     
__d74f:     lda #$02           ; $d74f: a9 02     
            sta $7a            ; $d751: 85 7a     
            lda #$00           ; $d753: a9 00     
            sta $be            ; $d755: 85 be     
            sta $38            ; $d757: 85 38     
            lda #$94           ; $d759: a9 94     
            sta $02            ; $d75b: 85 02     
            jsr __d804         ; $d75d: 20 04 d8  
            jsr __d817         ; $d760: 20 17 d8  
__d763:     rts                ; $d763: 60        

;-------------------------------------------------------------------------------
__d764:     cmp $bc            ; $d764: c5 bc     
            beq __d79e         ; $d766: f0 36     
            sta $bc            ; $d768: 85 bc     
            lda $0213          ; $d76a: ad 13 02  
            sta $00            ; $d76d: 85 00     
            lda $0210          ; $d76f: ad 10 02  
            sta $01            ; $d772: 85 01     
            lda #$08           ; $d774: a9 08     
            sta $02            ; $d776: 85 02     
            lda $6d            ; $d778: a5 6d     
            eor #$01           ; $d77a: 49 01     
            jsr __dfc8         ; $d77c: 20 c8 df  
            lda #$04           ; $d77f: a9 04     
            sta $6b            ; $d781: 85 6b     
            lda #$fe           ; $d783: a9 fe     
            sta $38            ; $d785: 85 38     
            lda #$01           ; $d787: a9 01     
            sta $7a            ; $d789: 85 7a     
            lda #$90           ; $d78b: a9 90     
            sta $86            ; $d78d: 85 86     
            lda #$01           ; $d78f: a9 01     
            sta $87            ; $d791: 85 87     
            lda #$20           ; $d793: a9 20     
            sta $7b            ; $d795: 85 7b     
            lda #$70           ; $d797: a9 70     
            sta $7c            ; $d799: 85 7c     
            jsr __d822         ; $d79b: 20 22 d8  
__d79e:     lda $38            ; $d79e: a5 38     
            and #$02           ; $d7a0: 29 02     
            bne __d7cf         ; $d7a2: d0 2b     
            lda $be            ; $d7a4: a5 be     
            bne __d7be         ; $d7a6: d0 16     
            lda $0210          ; $d7a8: ad 10 02  
            cmp #$c8           ; $d7ab: c9 c8     
            bcc __d7b1         ; $d7ad: 90 02     
            sta $be            ; $d7af: 85 be     
__d7b1:     lda $02c1          ; $d7b1: ad c1 02  
            cmp #$a0           ; $d7b4: c9 a0     
            beq __d7d2         ; $d7b6: f0 1a     
            clc                ; $d7b8: 18        
            adc #$04           ; $d7b9: 69 04     
            jmp __d7d2         ; $d7bb: 4c d2 d7  

;-------------------------------------------------------------------------------
__d7be:     lda #$fe           ; $d7be: a9 fe     
            sta $7a            ; $d7c0: 85 7a     
            lda $02c1          ; $d7c2: ad c1 02  
            cmp #$94           ; $d7c5: c9 94     
            beq __d7d2         ; $d7c7: f0 09     
            sec                ; $d7c9: 38        
            sbc #$04           ; $d7ca: e9 04     
            jmp __d7d2         ; $d7cc: 4c d2 d7  

;-------------------------------------------------------------------------------
__d7cf:     lda $02c1          ; $d7cf: ad c1 02  
__d7d2:     sta $02            ; $d7d2: 85 02     
            cmp #$a0           ; $d7d4: c9 a0     
            bne __d804         ; $d7d6: d0 2c     
            lda $6d            ; $d7d8: a5 6d     
            beq __d804         ; $d7da: f0 28     
            lda $76            ; $d7dc: a5 76     
            cmp #$c0           ; $d7de: c9 c0     
            bcc __d804         ; $d7e0: 90 22     
            lda $14            ; $d7e2: a5 14     
            and #$80           ; $d7e4: 29 80     
            cmp #$80           ; $d7e6: c9 80     
            beq __d7f2         ; $d7e8: f0 08     
            lda $16            ; $d7ea: a5 16     
            and #$80           ; $d7ec: 29 80     
            cmp #$80           ; $d7ee: c9 80     
            bne __d804         ; $d7f0: d0 12     
__d7f2:     lda #$d0           ; $d7f2: a9 d0     
            cmp $19            ; $d7f4: c5 19     
            bcc __d804         ; $d7f6: 90 0c     
            lda #$40           ; $d7f8: a9 40     
            sta $86            ; $d7fa: 85 86     
            lda #$02           ; $d7fc: a9 02     
            sta $87            ; $d7fe: 85 87     
            lda #$60           ; $d800: a9 60     
            sta $7c            ; $d802: 85 7c     
__d804:     lda #$40           ; $d804: a9 40     
            sta $00            ; $d806: 85 00     
            lda #$cf           ; $d808: a9 cf     
            sta $01            ; $d80a: 85 01     
            lda #$22           ; $d80c: a9 22     
            sta $03            ; $d80e: 85 03     
            lda #$c0           ; $d810: a9 c0     
            sta $04            ; $d812: 85 04     
            jmp __dfd5         ; $d814: 4c d5 df  

;-------------------------------------------------------------------------------
__d817:     lda #$c4           ; $d817: a9 c4     
            sta $02            ; $d819: 85 02     
            lda #$ba           ; $d81b: a9 ba     
            sta $03            ; $d81d: 85 03     
            jmp __d82a         ; $d81f: 4c 2a d8  

;-------------------------------------------------------------------------------
__d822:     lda #$c7           ; $d822: a9 c7     
            sta $02            ; $d824: 85 02     
            lda #$ba           ; $d826: a9 ba     
            sta $03            ; $d828: 85 03     
__d82a:     lda #$48           ; $d82a: a9 48     
            sta $00            ; $d82c: 85 00     
            lda #$23           ; $d82e: a9 23     
            sta $01            ; $d830: 85 01     
            jmp __e5a1         ; $d832: 4c a1 e5  

;-------------------------------------------------------------------------------
__d835:     ldx #$00           ; $d835: a2 00     
            ldy #$00           ; $d837: a0 00     
__d839:     lda $0293,y        ; $d839: b9 93 02  
            cmp $a3,x          ; $d83c: d5 a3     
            bne __d847         ; $d83e: d0 07     
            lda #$01           ; $d840: a9 01     
            sta $a9,x          ; $d842: 95 a9     
            jmp __d84f         ; $d844: 4c 4f d8  

;-------------------------------------------------------------------------------
__d847:     cmp $a6,x          ; $d847: d5 a6     
            bne __d84f         ; $d849: d0 04     
            lda #$00           ; $d84b: a9 00     
            sta $a9,x          ; $d84d: 95 a9     
__d84f:     lda $a9,x          ; $d84f: b5 a9     
            cpx #$00           ; $d851: e0 00     
            beq __d86b         ; $d853: f0 16     
            cpx #$01           ; $d855: e0 01     
            beq __d85f         ; $d857: f0 06     
            jsr __d8ed         ; $d859: 20 ed d8  
            jmp __d862         ; $d85c: 4c 62 d8  

;-------------------------------------------------------------------------------
__d85f:     jsr __d8d3         ; $d85f: 20 d3 d8  
__d862:     jsr __d95b         ; $d862: 20 5b d9  
            jsr __d994         ; $d865: 20 94 d9  
            jmp __d871         ; $d868: 4c 71 d8  

;-------------------------------------------------------------------------------
__d86b:     jsr __d87f         ; $d86b: 20 7f d8  
            jsr __d917         ; $d86e: 20 17 d9  
__d871:     cpx #$02           ; $d871: e0 02     
            beq __d87e         ; $d873: f0 09     
            inx                ; $d875: e8        
            tya                ; $d876: 98        
            clc                ; $d877: 18        
            adc #$10           ; $d878: 69 10     
            tay                ; $d87a: a8        
            jmp __d839         ; $d87b: 4c 39 d8  

;-------------------------------------------------------------------------------
__d87e:     rts                ; $d87e: 60        

;-------------------------------------------------------------------------------
__d87f:     jsr __d9b8         ; $d87f: 20 b8 d9  
            clc                ; $d882: 18        
            adc $0293          ; $d883: 6d 93 02  
            sta $0293          ; $d886: 8d 93 02  
            sta $0297          ; $d889: 8d 97 02  
            clc                ; $d88c: 18        
            adc #$30           ; $d88d: 69 30     
            sta $029b          ; $d88f: 8d 9b 02  
            sta $029f          ; $d892: 8d 9f 02  
            lda $0294          ; $d895: ad 94 02  
            cmp #$8b           ; $d898: c9 8b     
            beq __d8a2         ; $d89a: f0 06     
            cmp #$92           ; $d89c: c9 92     
            bne __d8b0         ; $d89e: d0 10     
            lda #$00           ; $d8a0: a9 00     
__d8a2:     sta $00            ; $d8a2: 85 00     
            cmp $ac            ; $d8a4: c5 ac     
            beq __d8ac         ; $d8a6: f0 04     
            lda #$43           ; $d8a8: a9 43     
            sta $36            ; $d8aa: 85 36     
__d8ac:     lda $00            ; $d8ac: a5 00     
            sta $ac            ; $d8ae: 85 ac     
__d8b0:     lda $36            ; $d8b0: a5 36     
            cmp #$00           ; $d8b2: c9 00     
            bne __d8d2         ; $d8b4: d0 1c     
            lda $ac            ; $d8b6: a5 ac     
            cmp #$00           ; $d8b8: c9 00     
            bne __d8c5         ; $d8ba: d0 09     
            lda $0294          ; $d8bc: ad 94 02  
            sec                ; $d8bf: 38        
            sbc #$01           ; $d8c0: e9 01     
            jmp __d8cb         ; $d8c2: 4c cb d8  

;-------------------------------------------------------------------------------
__d8c5:     lda $0294          ; $d8c5: ad 94 02  
            clc                ; $d8c8: 18        
            adc #$01           ; $d8c9: 69 01     
__d8cb:     sta $0294          ; $d8cb: 8d 94 02  
            lda #$06           ; $d8ce: a9 06     
            sta $36            ; $d8d0: 85 36     
__d8d2:     rts                ; $d8d2: 60        

;-------------------------------------------------------------------------------
__d8d3:     jsr __d9b8         ; $d8d3: 20 b8 d9  
            clc                ; $d8d6: 18        
            adc $02a3          ; $d8d7: 6d a3 02  
            sta $00            ; $d8da: 85 00     
            lda #$b0           ; $d8dc: a9 b0     
            sta $01            ; $d8de: 85 01     
            sta $02            ; $d8e0: 85 02     
            lda #$12           ; $d8e2: a9 12     
            sta $03            ; $d8e4: 85 03     
            lda #$a0           ; $d8e6: a9 a0     
            sta $04            ; $d8e8: 85 04     
            jmp __dfd5         ; $d8ea: 4c d5 df  

;-------------------------------------------------------------------------------
__d8ed:     jsr __d9b8         ; $d8ed: 20 b8 d9  
            clc                ; $d8f0: 18        
            adc $02b3          ; $d8f1: 6d b3 02  
            sta $00            ; $d8f4: 85 00     
            lda #$cf           ; $d8f6: a9 cf     
            sta $01            ; $d8f8: 85 01     
            lda #$b0           ; $d8fa: a9 b0     
            sta $02            ; $d8fc: 85 02     
            lda #$12           ; $d8fe: a9 12     
            sta $03            ; $d900: 85 03     
            lda #$b0           ; $d902: a9 b0     
            sta $04            ; $d904: 85 04     
            jsr __dfd5         ; $d906: 20 d5 df  
            lda $00            ; $d909: a5 00     
            clc                ; $d90b: 18        
            adc #$10           ; $d90c: 69 10     
            sta $00            ; $d90e: 85 00     
            lda #$b8           ; $d910: a9 b8     
            sta $04            ; $d912: 85 04     
            jmp __dfd5         ; $d914: 4c d5 df  

;-------------------------------------------------------------------------------
__d917:     lda $ae            ; $d917: a5 ae     
            bne __d94c         ; $d919: d0 31     
            lda $0297          ; $d91b: ad 97 02  
            sta $00            ; $d91e: 85 00     
            lda $0294          ; $d920: ad 94 02  
            sta $01            ; $d923: 85 01     
            lda #$a0           ; $d925: a9 a0     
            sta $02            ; $d927: 85 02     
            lda #$ba           ; $d929: a9 ba     
            sta $03            ; $d92b: 85 03     
            jsr __e142         ; $d92d: 20 42 e1  
            lda $029f          ; $d930: ad 9f 02  
            sta $00            ; $d933: 85 00     
            lda $029c          ; $d935: ad 9c 02  
            sta $01            ; $d938: 85 01     
            jsr __e147         ; $d93a: 20 47 e1  
            stx $05            ; $d93d: 86 05     
            ldx #$07           ; $d93f: a2 07     
__d941:     lda $3e,x          ; $d941: b5 3e     
            sta $048c,x        ; $d943: 9d 8c 04  
            dex                ; $d946: ca        
            bpl __d941         ; $d947: 10 f8     
            ldx $05            ; $d949: a6 05     
            rts                ; $d94b: 60        

;-------------------------------------------------------------------------------
__d94c:     stx $05            ; $d94c: 86 05     
            lda #$00           ; $d94e: a9 00     
            ldx #$07           ; $d950: a2 07     
__d952:     sta $048c,x        ; $d952: 9d 8c 04  
            dex                ; $d955: ca        
            bpl __d952         ; $d956: 10 fa     
            ldx $05            ; $d958: a6 05     
            rts                ; $d95a: 60        

;-------------------------------------------------------------------------------
__d95b:     lda $02a3          ; $d95b: ad a3 02  
            sta $00            ; $d95e: 85 00     
            lda $02a0          ; $d960: ad a0 02  
            sta $01            ; $d963: 85 01     
            lda #$a4           ; $d965: a9 a4     
            sta $02            ; $d967: 85 02     
            lda #$ba           ; $d969: a9 ba     
            sta $03            ; $d96b: 85 03     
            jsr __e142         ; $d96d: 20 42 e1  
            lda $02b3          ; $d970: ad b3 02  
            sta $00            ; $d973: 85 00     
            lda $02b0          ; $d975: ad b0 02  
            sta $01            ; $d978: 85 01     
            lda #$a8           ; $d97a: a9 a8     
            sta $02            ; $d97c: 85 02     
            lda #$ba           ; $d97e: a9 ba     
            sta $03            ; $d980: 85 03     
            jsr __e147         ; $d982: 20 47 e1  
            stx $05            ; $d985: 86 05     
            ldx #$07           ; $d987: a2 07     
__d989:     lda $3e,x          ; $d989: b5 3e     
            sta $0424,x        ; $d98b: 9d 24 04  
            dex                ; $d98e: ca        
            bpl __d989         ; $d98f: 10 f8     
            ldx $05            ; $d991: a6 05     
            rts                ; $d993: 60        

;-------------------------------------------------------------------------------
__d994:     lda $02a3          ; $d994: ad a3 02  
            sta $00            ; $d997: 85 00     
            lda $02a0          ; $d999: ad a0 02  
            sta $01            ; $d99c: 85 01     
            lda #$ac           ; $d99e: a9 ac     
            sta $02            ; $d9a0: 85 02     
            lda #$ba           ; $d9a2: a9 ba     
            sta $03            ; $d9a4: 85 03     
            jsr __e142         ; $d9a6: 20 42 e1  
            stx $05            ; $d9a9: 86 05     
            ldx #$03           ; $d9ab: a2 03     
__d9ad:     lda $3e,x          ; $d9ad: b5 3e     
            sta $04d0,x        ; $d9af: 9d d0 04  
            dex                ; $d9b2: ca        
            bpl __d9ad         ; $d9b3: 10 f8     
            ldx $05            ; $d9b5: a6 05     
            rts                ; $d9b7: 60        

;-------------------------------------------------------------------------------
__d9b8:     cmp #$00           ; $d9b8: c9 00     
            beq __d9c9         ; $d9ba: f0 0d     
            lda $57,x          ; $d9bc: b5 57     
            clc                ; $d9be: 18        
            adc #$3a           ; $d9bf: 69 3a     
            sta $57,x          ; $d9c1: 95 57     
            lda #$00           ; $d9c3: a9 00     
            rol                ; $d9c5: 2a        
            jmp __d9da         ; $d9c6: 4c da d9  

;-------------------------------------------------------------------------------
__d9c9:     lda $57,x          ; $d9c9: b5 57     
            sec                ; $d9cb: 38        
            sbc #$3a           ; $d9cc: e9 3a     
            sta $57,x          ; $d9ce: 95 57     
            lda #$00           ; $d9d0: a9 00     
            rol                ; $d9d2: 2a        
            eor #$01           ; $d9d3: 49 01     
            eor #$ff           ; $d9d5: 49 ff     
            clc                ; $d9d7: 18        
            adc #$01           ; $d9d8: 69 01     
__d9da:     sta $a0,x          ; $d9da: 95 a0     
            rts                ; $d9dc: 60        

;-------------------------------------------------------------------------------
__d9dd:     lda $0591          ; $d9dd: ad 91 05  
            beq __d9e3         ; $d9e0: f0 01     
            rts                ; $d9e2: 60        

;-------------------------------------------------------------------------------
__d9e3:     ldx #$00           ; $d9e3: a2 00     
            sta $e7            ; $d9e5: 85 e7     
            ldy #$06           ; $d9e7: a0 06     
__d9e9:     tya                ; $d9e9: 98        
            pha                ; $d9ea: 48        
            txa                ; $d9eb: 8a        
            pha                ; $d9ec: 48        
            lda $05e7,x        ; $d9ed: bd e7 05  
            sta $00            ; $d9f0: 85 00     
            lda $05e8,x        ; $d9f2: bd e8 05  
            cmp #$40           ; $d9f5: c9 40     
            beq __da1c         ; $d9f7: f0 23     
            sta $01            ; $d9f9: 85 01     
            lda #$bc           ; $d9fb: a9 bc     
            sta $02            ; $d9fd: 85 02     
            lda #$b9           ; $d9ff: a9 b9     
            sta $03            ; $da01: 85 03     
            jsr __e147         ; $da03: 20 47 e1  
            cmp #$00           ; $da06: c9 00     
            beq __da1c         ; $da08: f0 12     
            lda $55            ; $da0a: a5 55     
            beq __da1c         ; $da0c: f0 0e     
            cmp $54            ; $da0e: c5 54     
            bne __da1c         ; $da10: d0 0a     
            cmp #$01           ; $da12: c9 01     
            bne __da1c         ; $da14: d0 06     
            jsr __da3a         ; $da16: 20 3a da  
            jsr __da59         ; $da19: 20 59 da  
__da1c:     pla                ; $da1c: 68        
            tax                ; $da1d: aa        
            pla                ; $da1e: 68        
            tay                ; $da1f: a8        
__da20:     dey                ; $da20: 88        
            beq __da2e         ; $da21: f0 0b     
            lda $0d            ; $da23: a5 0d     
            cmp #$02           ; $da25: c9 02     
            beq __da2e         ; $da27: f0 05     
            inx                ; $da29: e8        
            inx                ; $da2a: e8        
            jmp __d9e9         ; $da2b: 4c e9 d9  

;-------------------------------------------------------------------------------
__da2e:     lda $e7            ; $da2e: a5 e7     
            beq __da39         ; $da30: f0 07     
            jsr __e27c         ; $da32: 20 7c e2  
            lda #$00           ; $da35: a9 00     
            sta $e7            ; $da37: 85 e7     
__da39:     rts                ; $da39: 60        

;-------------------------------------------------------------------------------
__da3a:     pha                ; $da3a: 48        
            txa                ; $da3b: 8a        
            pha                ; $da3c: 48        
            tya                ; $da3d: 98        
            pha                ; $da3e: 48        
            lda #$6d           ; $da3f: a9 6d     
            ldx #$01           ; $da41: a2 01     
            clc                ; $da43: 18        
__da44:     ldy #$02           ; $da44: a0 02     
__da46:     sta $d1,x          ; $da46: 95 d1     
            adc #$01           ; $da48: 69 01     
            inx                ; $da4a: e8        
            dey                ; $da4b: 88        
            bne __da46         ; $da4c: d0 f8     
            inx                ; $da4e: e8        
            cpx #$0a           ; $da4f: e0 0a     
            bne __da44         ; $da51: d0 f1     
            pla                ; $da53: 68        
            tay                ; $da54: a8        
            pla                ; $da55: 68        
            tax                ; $da56: aa        
            pla                ; $da57: 68        
            rts                ; $da58: 60        

;-------------------------------------------------------------------------------
__da59:     lda #$33           ; $da59: a9 33     
            sta $d1            ; $da5b: 85 d1     
            lda #$24           ; $da5d: a9 24     
            sta $d4            ; $da5f: 85 d4     
            lda #$65           ; $da61: a9 65     
            sta $d7            ; $da63: 85 d7     
            lda $db,x          ; $da65: b5 db     
            sec                ; $da67: 38        
            sbc #$20           ; $da68: e9 20     
            sta $db,x          ; $da6a: 95 db     
            sta $00            ; $da6c: 85 00     
            lda $dc,x          ; $da6e: b5 dc     
            sbc #$00           ; $da70: e9 00     
            sta $dc,x          ; $da72: 95 dc     
            sta $01            ; $da74: 85 01     
            lda $05e8,x        ; $da76: bd e8 05  
            sec                ; $da79: 38        
            sbc #$08           ; $da7a: e9 08     
            sta $05e8,x        ; $da7c: 9d e8 05  
            pha                ; $da7f: 48        
            cmp #$40           ; $da80: c9 40     
            beq __da93         ; $da82: f0 0f     
            cmp #$48           ; $da84: c9 48     
            beq __daaa         ; $da86: f0 22     
            cmp #$b0           ; $da88: c9 b0     
            bne __dab4         ; $da8a: d0 28     
            lda #$66           ; $da8c: a9 66     
            sta $d7            ; $da8e: 85 d7     
            jmp __dab4         ; $da90: 4c b4 da  

;-------------------------------------------------------------------------------
__da93:     lda #$69           ; $da93: a9 69     
            sta $d2            ; $da95: 85 d2     
            sta $d8            ; $da97: 85 d8     
            lda #$6a           ; $da99: a9 6a     
            sta $d3            ; $da9b: 85 d3     
            sta $d9            ; $da9d: 85 d9     
            lda #$8a           ; $da9f: a9 8a     
            sta $d5            ; $daa1: 85 d5     
            lda #$ff           ; $daa3: a9 ff     
            sta $d6            ; $daa5: 85 d6     
            jmp __dab4         ; $daa7: 4c b4 da  

;-------------------------------------------------------------------------------
__daaa:     lda #$6a           ; $daaa: a9 6a     
            sta $d2            ; $daac: 85 d2     
            sta $d8            ; $daae: 85 d8     
            lda #$6f           ; $dab0: a9 6f     
            sta $d5            ; $dab2: 85 d5     
__dab4:     lda #$d1           ; $dab4: a9 d1     
            sta $02            ; $dab6: 85 02     
            lda #$00           ; $dab8: a9 00     
            sta $03            ; $daba: 85 03     
            jsr __e5a1         ; $dabc: 20 a1 e5  
            pla                ; $dabf: 68        
            cmp #$40           ; $dac0: c9 40     
            bne __dacf         ; $dac2: d0 0b     
            lda #$04           ; $dac4: a9 04     
            sta $fe            ; $dac6: 85 fe     
            inc $e7            ; $dac8: e6 e7     
            inc $53            ; $daca: e6 53     
            jsr __e362         ; $dacc: 20 62 e3  
__dacf:     rts                ; $dacf: 60        

;-------------------------------------------------------------------------------
__dad0:     lda #$40           ; $dad0: a9 40     
            sta $04            ; $dad2: 85 04     
            ldx #$00           ; $dad4: a2 00     
            ldy #$00           ; $dad6: a0 00     
            stx $05            ; $dad8: 86 05     
            stx $06            ; $dada: 86 06     
__dadc:     txa                ; $dadc: 8a        
            asl                ; $dadd: 0a        
            tax                ; $dade: aa        
            lda __b914,x       ; $dadf: bd 14 b9  
            sta $02            ; $dae2: 85 02     
            lda __b915,x       ; $dae4: bd 15 b9  
            sta $03            ; $dae7: 85 03     
            lda $0240,y        ; $dae9: b9 40 02  
            cmp #$ff           ; $daec: c9 ff     
            bne __daf3         ; $daee: d0 03     
            jmp __db7b         ; $daf0: 4c 7b db  

;-------------------------------------------------------------------------------
__daf3:     ldx $06            ; $daf3: a6 06     
            cmp __b8f8,x       ; $daf5: dd f8 b8  
            beq __db13         ; $daf8: f0 19     
            bcs __db10         ; $dafa: b0 14     
            lda __b8f8,x       ; $dafc: bd f8 b8  
            sec                ; $daff: 38        
            sbc #$12           ; $db00: e9 12     
            cmp $0240,y        ; $db02: d9 40 02  
            bcc __db0a         ; $db05: 90 03     
            jmp __db13         ; $db07: 4c 13 db  

;-------------------------------------------------------------------------------
__db0a:     lda $0240,y        ; $db0a: b9 40 02  
            jmp __db13         ; $db0d: 4c 13 db  

;-------------------------------------------------------------------------------
__db10:     lda __b8f8,x       ; $db10: bd f8 b8  
__db13:     sta $01            ; $db13: 85 01     
            lda $0243,y        ; $db15: b9 43 02  
            sta $00            ; $db18: 85 00     
            jsr __de1b         ; $db1a: 20 1b de  
            sta $07            ; $db1d: 85 07     
            cmp #$02           ; $db1f: c9 02     
            bne __db33         ; $db21: d0 10     
            lda $00            ; $db23: a5 00     
            cmp __b8f9,x       ; $db25: dd f9 b8  
            beq __db2f         ; $db28: f0 05     
            cmp __b8fa,x       ; $db2a: dd fa b8  
            bne __db33         ; $db2d: d0 04     
__db2f:     lda #$03           ; $db2f: a9 03     
            sta $07            ; $db31: 85 07     
__db33:     lda $05            ; $db33: a5 05     
            tax                ; $db35: aa        
            beq __db4c         ; $db36: f0 14     
            cpx #$02           ; $db38: e0 02     
            bpl __db42         ; $db3a: 10 06     
            lda $4b            ; $db3c: a5 4b     
            cmp #$05           ; $db3e: c9 05     
            bpl __db4c         ; $db40: 10 0a     
__db42:     lda $0540          ; $db42: ad 40 05  
            sta $a1            ; $db45: 85 a1     
            lda #$00           ; $db47: a9 00     
            jmp __db52         ; $db49: 4c 52 db  

;-------------------------------------------------------------------------------
__db4c:     lda #$ef           ; $db4c: a9 ef     
            sta $a1            ; $db4e: 85 a1     
            lda #$01           ; $db50: a9 01     
__db52:     sta $a2            ; $db52: 85 a2     
            lda $07            ; $db54: a5 07     
            cmp #$02           ; $db56: c9 02     
            bmi __db62         ; $db58: 30 08     
            jsr __db9c         ; $db5a: 20 9c db  
            sta $01            ; $db5d: 85 01     
            jmp __db67         ; $db5f: 4c 67 db  

;-------------------------------------------------------------------------------
__db62:     jsr __dbb8         ; $db62: 20 b8 db  
            sta $00            ; $db65: 85 00     
__db67:     and #$04           ; $db67: 29 04     
            bne __db70         ; $db69: d0 05     
            lda #$74           ; $db6b: a9 74     
            jmp __db72         ; $db6d: 4c 72 db  

;-------------------------------------------------------------------------------
__db70:     lda #$78           ; $db70: a9 78     
__db72:     sta $02            ; $db72: 85 02     
            lda #$22           ; $db74: a9 22     
            sta $03            ; $db76: 85 03     
            jsr __dfd5         ; $db78: 20 d5 df  
__db7b:     ldx $05            ; $db7b: a6 05     
            inx                ; $db7d: e8        
            cpx $a0            ; $db7e: e4 a0     
            beq __db9b         ; $db80: f0 19     
            stx $05            ; $db82: 86 05     
            inc $06            ; $db84: e6 06     
            inc $06            ; $db86: e6 06     
            inc $06            ; $db88: e6 06     
            tya                ; $db8a: 98        
            clc                ; $db8b: 18        
            adc #$10           ; $db8c: 69 10     
            tay                ; $db8e: a8        
            clc                ; $db8f: 18        
            lda $04            ; $db90: a5 04     
            adc #$10           ; $db92: 69 10     
            sta $04            ; $db94: 85 04     
            ldx $05            ; $db96: a6 05     
            jmp __dadc         ; $db98: 4c dc da  

;-------------------------------------------------------------------------------
__db9b:     rts                ; $db9b: 60        

;-------------------------------------------------------------------------------
__db9c:     cmp #$02           ; $db9c: c9 02     
            beq __dbac         ; $db9e: f0 0c     
            lda $57,x          ; $dba0: b5 57     
            sec                ; $dba2: 38        
            sbc $a1            ; $dba3: e5 a1     
            sta $57,x          ; $dba5: 95 57     
            lda $01            ; $dba7: a5 01     
            sbc $a2            ; $dba9: e5 a2     
            rts                ; $dbab: 60        

;-------------------------------------------------------------------------------
__dbac:     lda $57,x          ; $dbac: b5 57     
            clc                ; $dbae: 18        
            adc $a1            ; $dbaf: 65 a1     
            sta $57,x          ; $dbb1: 95 57     
            lda $01            ; $dbb3: a5 01     
            adc $a2            ; $dbb5: 65 a2     
            rts                ; $dbb7: 60        

;-------------------------------------------------------------------------------
__dbb8:     cmp #$00           ; $dbb8: c9 00     
            bne __dbc8         ; $dbba: d0 0c     
            lda $57,x          ; $dbbc: b5 57     
            clc                ; $dbbe: 18        
            adc $a1            ; $dbbf: 65 a1     
            sta $57,x          ; $dbc1: 95 57     
            lda $00            ; $dbc3: a5 00     
            adc $a2            ; $dbc5: 65 a2     
            rts                ; $dbc7: 60        

;-------------------------------------------------------------------------------
__dbc8:     lda $57,x          ; $dbc8: b5 57     
            sec                ; $dbca: 38        
            sbc $a1            ; $dbcb: e5 a1     
            sta $57,x          ; $dbcd: 95 57     
            lda $00            ; $dbcf: a5 00     
            sbc $a2            ; $dbd1: e5 a2     
            rts                ; $dbd3: 60        

;-------------------------------------------------------------------------------
__dbd4:     ldx #$00           ; $dbd4: a2 00     
            ldy $cf            ; $dbd6: a4 cf     
__dbd8:     sty $05            ; $dbd8: 84 05     
            lda $0240,y        ; $dbda: b9 40 02  
            cmp #$ff           ; $dbdd: c9 ff     
            beq __dc48         ; $dbdf: f0 67     
            cmp $0575          ; $dbe1: cd 75 05  
            bcc __dc51         ; $dbe4: 90 6b     
            sta $01            ; $dbe6: 85 01     
            iny                ; $dbe8: c8        
            iny                ; $dbe9: c8        
            iny                ; $dbea: c8        
            lda $0240,y        ; $dbeb: b9 40 02  
            cmp #$01           ; $dbee: c9 01     
            bcs __dbf7         ; $dbf0: b0 05     
            lda #$0f           ; $dbf2: a9 0f     
            jmp __dc2a         ; $dbf4: 4c 2a dc  

;-------------------------------------------------------------------------------
__dbf7:     sta $00            ; $dbf7: 85 00     
            tya                ; $dbf9: 98        
            pha                ; $dbfa: 48        
            lda $0522,x        ; $dbfb: bd 22 05  
            asl                ; $dbfe: 0a        
            tay                ; $dbff: a8        
            lda ($b4),y        ; $dc00: b1 b4     
            sta $02            ; $dc02: 85 02     
            iny                ; $dc04: c8        
            lda ($b4),y        ; $dc05: b1 b4     
            sta $03            ; $dc07: 85 03     
            jsr __de1b         ; $dc09: 20 1b de  
            sta $06            ; $dc0c: 85 06     
            lda $b2            ; $dc0e: a5 b2     
            beq __dc15         ; $dc10: f0 03     
            jsr __ddb4         ; $dc12: 20 b4 dd  
__dc15:     pla                ; $dc15: 68        
            tay                ; $dc16: a8        
            lda $06            ; $dc17: a5 06     
            cmp #$08           ; $dc19: c9 08     
            beq __dc2a         ; $dc1b: f0 0d     
            cmp #$02           ; $dc1d: c9 02     
            beq __dc27         ; $dc1f: f0 06     
            jsr __dc57         ; $dc21: 20 57 dc  
            jmp __dc2a         ; $dc24: 4c 2a dc  

;-------------------------------------------------------------------------------
__dc27:     jsr __dcbe         ; $dc27: 20 be dc  
__dc2a:     pha                ; $dc2a: 48        
            lda #$22           ; $dc2b: a9 22     
            sta $03            ; $dc2d: 85 03     
            lda #$40           ; $dc2f: a9 40     
            clc                ; $dc31: 18        
            adc $05            ; $dc32: 65 05     
            sta $04            ; $dc34: 85 04     
            pla                ; $dc36: 68        
            and #$07           ; $dc37: 29 07     
            jsr __dfe1         ; $dc39: 20 e1 df  
__dc3c:     lda $05            ; $dc3c: a5 05     
            clc                ; $dc3e: 18        
            adc #$10           ; $dc3f: 69 10     
            tay                ; $dc41: a8        
            inx                ; $dc42: e8        
            cpx $b0            ; $dc43: e4 b0     
            bne __dbd8         ; $dc45: d0 91     
            rts                ; $dc47: 60        

;-------------------------------------------------------------------------------
__dc48:     jsr __dcf8         ; $dc48: 20 f8 dc  
            jsr __dd1b         ; $dc4b: 20 1b dd  
            jmp __dc3c         ; $dc4e: 4c 3c dc  

;-------------------------------------------------------------------------------
__dc51:     jsr __dd3d         ; $dc51: 20 3d dd  
            jmp __dc2a         ; $dc54: 4c 2a dc  

;-------------------------------------------------------------------------------
__dc57:     pha                ; $dc57: 48        
            cmp #$00           ; $dc58: c9 00     
            beq __dc62         ; $dc5a: f0 06     
            jsr __dc8a         ; $dc5c: 20 8a dc  
            jmp __dc65         ; $dc5f: 4c 65 dc  

;-------------------------------------------------------------------------------
__dc62:     jsr __dc7c         ; $dc62: 20 7c dc  
__dc65:     sta $00            ; $dc65: 85 00     
            and $0576          ; $dc67: 2d 76 05  
            beq __dc72         ; $dc6a: f0 06     
            lda $0570          ; $dc6c: ad 70 05  
            jmp __dc75         ; $dc6f: 4c 75 dc  

;-------------------------------------------------------------------------------
__dc72:     lda $0571          ; $dc72: ad 71 05  
__dc75:     sta $02            ; $dc75: 85 02     
            dey                ; $dc77: 88        
            dey                ; $dc78: 88        
            dey                ; $dc79: 88        
            pla                ; $dc7a: 68        
            rts                ; $dc7b: 60        

;-------------------------------------------------------------------------------
__dc7c:     lda $5d,x          ; $dc7c: b5 5d     
            clc                ; $dc7e: 18        
            adc $0521          ; $dc7f: 6d 21 05  
            sta $5d,x          ; $dc82: 95 5d     
            lda $0240,y        ; $dc84: b9 40 02  
            adc #$00           ; $dc87: 69 00     
            rts                ; $dc89: 60        

;-------------------------------------------------------------------------------
__dc8a:     lda $4a            ; $dc8a: a5 4a     
            cmp #$02           ; $dc8c: c9 02     
            bne __dcb0         ; $dc8e: d0 20     
            lda $0240,y        ; $dc90: b9 40 02  
            cmp $0577          ; $dc93: cd 77 05  
            bne __dcb0         ; $dc96: d0 18     
            pha                ; $dc98: 48        
            lda #$04           ; $dc99: a9 04     
            sta $fc            ; $dc9b: 85 fc     
            pla                ; $dc9d: 68        
            cpx $0530          ; $dc9e: ec 30 05  
            bne __dcb0         ; $dca1: d0 0d     
            lda #$01           ; $dca3: a9 01     
            sta $d0            ; $dca5: 85 d0     
            lda $023d,y        ; $dca7: b9 3d 02  
            clc                ; $dcaa: 18        
            adc #$08           ; $dcab: 69 08     
            sta $020c          ; $dcad: 8d 0c 02  
__dcb0:     lda $5d,x          ; $dcb0: b5 5d     
            sec                ; $dcb2: 38        
            sbc $0521          ; $dcb3: ed 21 05  
            sta $5d,x          ; $dcb6: 95 5d     
            lda $0240,y        ; $dcb8: b9 40 02  
            sbc #$00           ; $dcbb: e9 00     
            rts                ; $dcbd: 60        

;-------------------------------------------------------------------------------
__dcbe:     dey                ; $dcbe: 88        
            dey                ; $dcbf: 88        
            dey                ; $dcc0: 88        
            lda $4a            ; $dcc1: a5 4a     
            cmp #$02           ; $dcc3: c9 02     
            bne __dccd         ; $dcc5: d0 06     
            lda $fc            ; $dcc7: a5 fc     
            ora #$40           ; $dcc9: 09 40     
            sta $fc            ; $dccb: 85 fc     
__dccd:     lda $5d,x          ; $dccd: b5 5d     
            clc                ; $dccf: 18        
            adc $0521          ; $dcd0: 6d 21 05  
            sta $5d,x          ; $dcd3: 95 5d     
            lda $0240,y        ; $dcd5: b9 40 02  
            adc #$00           ; $dcd8: 69 00     
            sta $01            ; $dcda: 85 01     
            lda $b2            ; $dcdc: a5 b2     
            bne __dce6         ; $dcde: d0 06     
            lda $0572          ; $dce0: ad 72 05  
            jmp __dcf3         ; $dce3: 4c f3 dc  

;-------------------------------------------------------------------------------
__dce6:     lda $01            ; $dce6: a5 01     
            and #$04           ; $dce8: 29 04     
            beq __dcf1         ; $dcea: f0 05     
            lda #$7c           ; $dcec: a9 7c     
            jmp __dcf3         ; $dcee: 4c f3 dc  

;-------------------------------------------------------------------------------
__dcf1:     lda #$80           ; $dcf1: a9 80     
__dcf3:     sta $02            ; $dcf3: 85 02     
            lda #$00           ; $dcf5: a9 00     
            rts                ; $dcf7: 60        

;-------------------------------------------------------------------------------
__dcf8:     lda $ce            ; $dcf8: a5 ce     
            bne __dd3c         ; $dcfa: d0 40     
            lda $35            ; $dcfc: a5 35     
            bne __dd3c         ; $dcfe: d0 3c     
            lda $0520          ; $dd00: ad 20 05  
            sta $35            ; $dd03: 85 35     
            lda $b2            ; $dd05: a5 b2     
            sta $ce            ; $dd07: 85 ce     
            lda $0573          ; $dd09: ad 73 05  
            sta $00            ; $dd0c: 85 00     
            lda $0574          ; $dd0e: ad 74 05  
            sta $01            ; $dd11: 85 01     
            lda $0570          ; $dd13: ad 70 05  
            sta $02            ; $dd16: 85 02     
            jmp __dd29         ; $dd18: 4c 29 dd  

;-------------------------------------------------------------------------------
__dd1b:     lda $b2            ; $dd1b: a5 b2     
            beq __dd3c         ; $dd1d: f0 1d     
            lda $c4            ; $dd1f: a5 c4     
            beq __dd3c         ; $dd21: f0 19     
            sta $00            ; $dd23: 85 00     
            lda #$48           ; $dd25: a9 48     
            sta $01            ; $dd27: 85 01     
__dd29:     lda #$22           ; $dd29: a9 22     
            sta $03            ; $dd2b: 85 03     
            tya                ; $dd2d: 98        
            clc                ; $dd2e: 18        
            adc #$40           ; $dd2f: 69 40     
            sta $04            ; $dd31: 85 04     
            lda #$00           ; $dd33: a9 00     
            sta $c4            ; $dd35: 85 c4     
            jsr __dfd5         ; $dd37: 20 d5 df  
            inc $b1            ; $dd3a: e6 b1     
__dd3c:     rts                ; $dd3c: 60        

;-------------------------------------------------------------------------------
__dd3d:     lda $b2            ; $dd3d: a5 b2     
            bne __dd7b         ; $dd3f: d0 3a     
            iny                ; $dd41: c8        
            iny                ; $dd42: c8        
            iny                ; $dd43: c8        
            lda $0240,y        ; $dd44: b9 40 02  
            cmp $0577          ; $dd47: cd 77 05  
            bne __dd5a         ; $dd4a: d0 0e     
            sta $00            ; $dd4c: 85 00     
            lda $0572          ; $dd4e: ad 72 05  
            sta $02            ; $dd51: 85 02     
            lda #$31           ; $dd53: a9 31     
            sta $01            ; $dd55: 85 01     
            lda #$00           ; $dd57: a9 00     
            rts                ; $dd59: 60        

;-------------------------------------------------------------------------------
__dd5a:     and #$08           ; $dd5a: 29 08     
            bne __dd69         ; $dd5c: d0 0b     
            lda $0570          ; $dd5e: ad 70 05  
            sta $02            ; $dd61: 85 02     
            lda $0578          ; $dd63: ad 78 05  
            jmp __dd71         ; $dd66: 4c 71 dd  

;-------------------------------------------------------------------------------
__dd69:     lda $0571          ; $dd69: ad 71 05  
            sta $02            ; $dd6c: 85 02     
            lda $0579          ; $dd6e: ad 79 05  
__dd71:     sta $01            ; $dd71: 85 01     
            jsr __dc7c         ; $dd73: 20 7c dc  
            sta $00            ; $dd76: 85 00     
            lda #$00           ; $dd78: a9 00     
            rts                ; $dd7a: 60        

;-------------------------------------------------------------------------------
__dd7b:     lda $35            ; $dd7b: a5 35     
            beq __dd99         ; $dd7d: f0 1a     
            and #$04           ; $dd7f: 29 04     
            beq __dd88         ; $dd81: f0 05     
            lda #$7c           ; $dd83: a9 7c     
            jmp __dd8a         ; $dd85: 4c 8a dd  

;-------------------------------------------------------------------------------
__dd88:     lda #$80           ; $dd88: a9 80     
__dd8a:     sta $02            ; $dd8a: 85 02     
            lda $0573          ; $dd8c: ad 73 05  
            sta $00            ; $dd8f: 85 00     
            lda $0574          ; $dd91: ad 74 05  
            sta $01            ; $dd94: 85 01     
            lda #$00           ; $dd96: a9 00     
            rts                ; $dd98: 60        

;-------------------------------------------------------------------------------
__dd99:     lda $0573          ; $dd99: ad 73 05  
            sta $00            ; $dd9c: 85 00     
            lda $0575          ; $dd9e: ad 75 05  
            sta $01            ; $dda1: 85 01     
            lda #$7c           ; $dda3: a9 7c     
            sta $02            ; $dda5: 85 02     
            lda #$00           ; $dda7: a9 00     
            sta $ce            ; $dda9: 85 ce     
            inc $b1            ; $ddab: e6 b1     
            lda #$a0           ; $ddad: a9 a0     
            sta $35            ; $ddaf: 85 35     
            lda #$00           ; $ddb1: a9 00     
            rts                ; $ddb3: 60        

;-------------------------------------------------------------------------------
__ddb4:     lda $01            ; $ddb4: a5 01     
            cmp #$48           ; $ddb6: c9 48     
            bne __dde4         ; $ddb8: d0 2a     
            lda $00            ; $ddba: a5 00     
            ldy #$00           ; $ddbc: a0 00     
__ddbe:     cmp __b90a,y       ; $ddbe: d9 0a b9  
            beq __ddc9         ; $ddc1: f0 06     
            bcs __dde4         ; $ddc3: b0 1f     
            iny                ; $ddc5: c8        
            jmp __ddbe         ; $ddc6: 4c be dd  

;-------------------------------------------------------------------------------
__ddc9:     cpx $c3            ; $ddc9: e4 c3     
            beq __ddf6         ; $ddcb: f0 29     
            lda $0210          ; $ddcd: ad 10 02  
            cmp #$68           ; $ddd0: c9 68     
            bcs __dde4         ; $ddd2: b0 10     
            lda $19,x          ; $ddd4: b5 19     
            cmp #$60           ; $ddd6: c9 60     
            bcc __dde5         ; $ddd8: 90 0b     
            lda $1a,x          ; $ddda: b5 1a     
            cmp #$a0           ; $dddc: c9 a0     
            bcc __dde4         ; $ddde: 90 04     
            lda $00            ; $dde0: a5 00     
            sta $c4            ; $dde2: 85 c4     
__dde4:     rts                ; $dde4: 60        

;-------------------------------------------------------------------------------
__dde5:     lda $1a,x          ; $dde5: b5 1a     
            cmp #$60           ; $dde7: c9 60     
            bcc __ddfe         ; $dde9: 90 13     
            stx $c3            ; $ddeb: 86 c3     
            lda #$90           ; $dded: a9 90     
            sta $36            ; $ddef: 85 36     
            lda #$7c           ; $ddf1: a9 7c     
            jmp __de14         ; $ddf3: 4c 14 de  

;-------------------------------------------------------------------------------
__ddf6:     lda $36            ; $ddf6: a5 36     
            bne __de09         ; $ddf8: d0 0f     
            lda #$ff           ; $ddfa: a9 ff     
            sta $c3            ; $ddfc: 85 c3     
__ddfe:     inc $01            ; $ddfe: e6 01     
            lda #$7c           ; $de00: a9 7c     
            sta $02            ; $de02: 85 02     
            lda #$02           ; $de04: a9 02     
            jmp __de18         ; $de06: 4c 18 de  

;-------------------------------------------------------------------------------
__de09:     and #$04           ; $de09: 29 04     
            beq __de12         ; $de0b: f0 05     
            lda #$80           ; $de0d: a9 80     
            jmp __de14         ; $de0f: 4c 14 de  

;-------------------------------------------------------------------------------
__de12:     lda #$7c           ; $de12: a9 7c     
__de14:     sta $02            ; $de14: 85 02     
            lda #$08           ; $de16: a9 08     
__de18:     sta $06            ; $de18: 85 06     
            rts                ; $de1a: 60        

;-------------------------------------------------------------------------------
__de1b:     txa                ; $de1b: 8a        
            pha                ; $de1c: 48        
            tya                ; $de1d: 98        
            pha                ; $de1e: 48        
            ldy #$00           ; $de1f: a0 00     
            lda ($02),y        ; $de21: b1 02     
            tax                ; $de23: aa        
            ldy #$02           ; $de24: a0 02     
__de26:     lda ($02),y        ; $de26: b1 02     
            cmp $01            ; $de28: c5 01     
            beq __de36         ; $de2a: f0 0a     
            iny                ; $de2c: c8        
            iny                ; $de2d: c8        
            dex                ; $de2e: ca        
            bne __de26         ; $de2f: d0 f5     
            lda #$02           ; $de31: a9 02     
            jmp __de65         ; $de33: 4c 65 de  

;-------------------------------------------------------------------------------
__de36:     dey                ; $de36: 88        
            lda ($02),y        ; $de37: b1 02     
            cmp $00            ; $de39: c5 00     
            bne __de4f         ; $de3b: d0 12     
            iny                ; $de3d: c8        
            iny                ; $de3e: c8        
            lda ($02),y        ; $de3f: b1 02     
            cmp $00            ; $de41: c5 00     
            bcc __de4a         ; $de43: 90 05     
            lda #$00           ; $de45: a9 00     
            jmp __de65         ; $de47: 4c 65 de  

;-------------------------------------------------------------------------------
__de4a:     lda #$01           ; $de4a: a9 01     
            jmp __de65         ; $de4c: 4c 65 de  

;-------------------------------------------------------------------------------
__de4f:     iny                ; $de4f: c8        
            iny                ; $de50: c8        
            lda ($02),y        ; $de51: b1 02     
            cmp $00            ; $de53: c5 00     
            bcc __de63         ; $de55: 90 0c     
            beq __de5e         ; $de57: f0 05     
            lda #$00           ; $de59: a9 00     
            jmp __de65         ; $de5b: 4c 65 de  

;-------------------------------------------------------------------------------
__de5e:     lda #$02           ; $de5e: a9 02     
            jmp __de65         ; $de60: 4c 65 de  

;-------------------------------------------------------------------------------
__de63:     lda #$01           ; $de63: a9 01     
__de65:     sta $0f            ; $de65: 85 0f     
            pla                ; $de67: 68        
            tay                ; $de68: a8        
            pla                ; $de69: 68        
            tax                ; $de6a: aa        
            lda $0f            ; $de6b: a5 0f     
            rts                ; $de6d: 60        

;-------------------------------------------------------------------------------
__de6e:     lda #$00           ; $de6e: a9 00     
            beq __de80         ; $de70: f0 0e     
__de72:     lda #$01           ; $de72: a9 01     
            bne __de80         ; $de74: d0 0a     
__de76:     lda #$02           ; $de76: a9 02     
            bne __de80         ; $de78: d0 06     
__de7a:     lda #$03           ; $de7a: a9 03     
            bne __de80         ; $de7c: d0 02     
__de7e:     lda #$04           ; $de7e: a9 04     
__de80:     sta $0f            ; $de80: 85 0f     
            txa                ; $de82: 8a        
            pha                ; $de83: 48        
            tya                ; $de84: 98        
            pha                ; $de85: 48        
            lda $00            ; $de86: a5 00     
            pha                ; $de88: 48        
            lda $01            ; $de89: a5 01     
            pha                ; $de8b: 48        
            lda $02            ; $de8c: a5 02     
            pha                ; $de8e: 48        
            lda $03            ; $de8f: a5 03     
            pha                ; $de91: 48        
            lda $0f            ; $de92: a5 0f     
            cmp #$01           ; $de94: c9 01     
            beq __deca         ; $de96: f0 32     
            cmp #$02           ; $de98: c9 02     
            beq __df01         ; $de9a: f0 65     
            cmp #$03           ; $de9c: c9 03     
            bne __dea3         ; $de9e: d0 03     
            jmp __df18         ; $dea0: 4c 18 df  

;-------------------------------------------------------------------------------
__dea3:     cmp #$04           ; $dea3: c9 04     
            bne __deaa         ; $dea5: d0 03     
            jmp __df38         ; $dea7: 4c 38 df  

;-------------------------------------------------------------------------------
__deaa:     jsr __deb6         ; $deaa: 20 b6 de  
            ldx $42            ; $dead: a6 42     
            stx $73            ; $deaf: 86 73     
            stx $74            ; $deb1: 86 74     
            jmp __df3e         ; $deb3: 4c 3e df  

;-------------------------------------------------------------------------------
__deb6:     lda $4a            ; $deb6: a5 4a     
            sec                ; $deb8: 38        
            sbc #$01           ; $deb9: e9 01     
            asl                ; $debb: 0a        
            tax                ; $debc: aa        
            lda __bb47,x       ; $debd: bd 47 bb  
            sta $02            ; $dec0: 85 02     
            lda __bb48,x       ; $dec2: bd 48 bb  
            sta $03            ; $dec5: 85 03     
            jmp __e14c         ; $dec7: 4c 4c e1  

;-------------------------------------------------------------------------------
__deca:     lda $3e            ; $deca: a5 3e     
            pha                ; $decc: 48        
            clc                ; $decd: 18        
            adc #$10           ; $dece: 69 10     
            sta $3e            ; $ded0: 85 3e     
            jsr __deb6         ; $ded2: 20 b6 de  
            ldx $42            ; $ded5: a6 42     
            stx $73            ; $ded7: 86 73     
            sta $0d            ; $ded9: 85 0d     
            pla                ; $dedb: 68        
            sta $3e            ; $dedc: 85 3e     
            lda $40            ; $dede: a5 40     
            pha                ; $dee0: 48        
            sec                ; $dee1: 38        
            sbc #$10           ; $dee2: e9 10     
            sta $40            ; $dee4: 85 40     
            jsr __deb6         ; $dee6: 20 b6 de  
            ldx $42            ; $dee9: a6 42     
            stx $74            ; $deeb: 86 74     
            cmp #$00           ; $deed: c9 00     
            beq __def7         ; $deef: f0 06     
            lda $0d            ; $def1: a5 0d     
            ora #$10           ; $def3: 09 10     
            sta $0d            ; $def5: 85 0d     
__def7:     pla                ; $def7: 68        
            sta $40            ; $def8: 85 40     
            lda $0d            ; $defa: a5 0d     
            sta $0f            ; $defc: 85 0f     
            jmp __df3e         ; $defe: 4c 3e df  

;-------------------------------------------------------------------------------
__df01:     lda $4a            ; $df01: a5 4a     
            sec                ; $df03: 38        
            sbc #$01           ; $df04: e9 01     
            asl                ; $df06: 0a        
            tax                ; $df07: aa        
            lda __bb4f,x       ; $df08: bd 4f bb  
            sta $02            ; $df0b: 85 02     
            lda __bb50,x       ; $df0d: bd 50 bb  
            sta $03            ; $df10: 85 03     
            jsr __e14c         ; $df12: 20 4c e1  
            jmp __df3e         ; $df15: 4c 3e df  

;-------------------------------------------------------------------------------
__df18:     jsr __df53         ; $df18: 20 53 df  
            lda $3f            ; $df1b: a5 3f     
            pha                ; $df1d: 48        
            lda $41            ; $df1e: a5 41     
            pha                ; $df20: 48        
            clc                ; $df21: 18        
            adc #$01           ; $df22: 69 01     
            sta $3f            ; $df24: 85 3f     
            adc #$01           ; $df26: 69 01     
            sta $41            ; $df28: 85 41     
            jsr __e14c         ; $df2a: 20 4c e1  
            pla                ; $df2d: 68        
            sta $41            ; $df2e: 85 41     
            pla                ; $df30: 68        
            sta $3f            ; $df31: 85 3f     
            lda $0f            ; $df33: a5 0f     
            jmp __df3e         ; $df35: 4c 3e df  

;-------------------------------------------------------------------------------
__df38:     jsr __df53         ; $df38: 20 53 df  
            jsr __e14c         ; $df3b: 20 4c e1  
__df3e:     sta $0f            ; $df3e: 85 0f     
            pla                ; $df40: 68        
            sta $03            ; $df41: 85 03     
            pla                ; $df43: 68        
            sta $02            ; $df44: 85 02     
            pla                ; $df46: 68        
            sta $01            ; $df47: 85 01     
            pla                ; $df49: 68        
            sta $00            ; $df4a: 85 00     
            pla                ; $df4c: 68        
            tay                ; $df4d: a8        
            pla                ; $df4e: 68        
            tax                ; $df4f: aa        
            lda $0f            ; $df50: a5 0f     
            rts                ; $df52: 60        

;-------------------------------------------------------------------------------
__df53:     lda $4a            ; $df53: a5 4a     
            sec                ; $df55: 38        
            sbc #$01           ; $df56: e9 01     
            asl                ; $df58: 0a        
            tax                ; $df59: aa        
            lda __bb3f,x       ; $df5a: bd 3f bb  
            sta $02            ; $df5d: 85 02     
            lda __bb40,x       ; $df5f: bd 40 bb  
            sta $03            ; $df62: 85 03     
            rts                ; $df64: 60        

;-------------------------------------------------------------------------------
__df65:     sta $05e0          ; $df65: 8d e0 05  
            lda $55            ; $df68: a5 55     
            cmp $54            ; $df6a: c5 54     
            bne __df7c         ; $df6c: d0 0e     
            dec $05e1,x        ; $df6e: de e1 05  
            lda $05e1,x        ; $df71: bd e1 05  
            cmp #$ff           ; $df74: c9 ff     
            beq __df7c         ; $df76: f0 04     
            cmp #$00           ; $df78: c9 00     
            bne __df85         ; $df7a: d0 09     
__df7c:     lda $05e0          ; $df7c: ad e0 05  
            sta $05e1,x        ; $df7f: 9d e1 05  
            lda #$01           ; $df82: a9 01     
            rts                ; $df84: 60        

;-------------------------------------------------------------------------------
__df85:     lda #$00           ; $df85: a9 00     
            rts                ; $df87: 60        

;-------------------------------------------------------------------------------
__df88:     stx $0f            ; $df88: 86 0f     
            asl                ; $df8a: 0a        
            tax                ; $df8b: aa        
            lda $7e,x          ; $df8c: b5 7e     
            bne __df9d         ; $df8e: d0 0d     
            sta $83,x          ; $df90: 95 83     
            lda #$08           ; $df92: a9 08     
            sta $82,x          ; $df94: 95 82     
            lda #$f0           ; $df96: a9 f0     
            sta $7f,x          ; $df98: 95 7f     
            jmp __dfa9         ; $df9a: 4c a9 df  

;-------------------------------------------------------------------------------
__df9d:     lda $82,x          ; $df9d: b5 82     
            adc #$10           ; $df9f: 69 10     
            sta $82,x          ; $dfa1: 95 82     
            lda $83,x          ; $dfa3: b5 83     
            adc #$00           ; $dfa5: 69 00     
            sta $83,x          ; $dfa7: 95 83     
__dfa9:     lda $7f,x          ; $dfa9: b5 7f     
            sec                ; $dfab: 38        
            sbc $86,x          ; $dfac: f5 86     
            sta $7f,x          ; $dfae: 95 7f     
            lda $01            ; $dfb0: a5 01     
            sbc $87,x          ; $dfb2: f5 87     
            sta $01            ; $dfb4: 85 01     
            clc                ; $dfb6: 18        
            lda $7f,x          ; $dfb7: b5 7f     
            adc $82,x          ; $dfb9: 75 82     
            sta $7f,x          ; $dfbb: 95 7f     
            lda $01            ; $dfbd: a5 01     
            adc $83,x          ; $dfbf: 75 83     
            sta $01            ; $dfc1: 85 01     
            inc $7e,x          ; $dfc3: f6 7e     
            ldx $0f            ; $dfc5: a6 0f     
            rts                ; $dfc7: 60        

;-------------------------------------------------------------------------------
__dfc8:     pha                ; $dfc8: 48        
            lda #$24           ; $dfc9: a9 24     
            sta $03            ; $dfcb: 85 03     
            lda #$10           ; $dfcd: a9 10     
            sta $04            ; $dfcf: 85 04     
            pla                ; $dfd1: 68        
            jmp __dfe1         ; $dfd2: 4c e1 df  

;-------------------------------------------------------------------------------
__dfd5:     lda #$00           ; $dfd5: a9 00     
            jmp __dfe1         ; $dfd7: 4c e1 df  

;-------------------------------------------------------------------------------
__dfda:     lda #$01           ; $dfda: a9 01     
            jmp __dfe1         ; $dfdc: 4c e1 df  

;-------------------------------------------------------------------------------
__dfdf:     lda #$04           ; $dfdf: a9 04     
__dfe1:     pha                ; $dfe1: 48        
            sta $0f            ; $dfe2: 85 0f     
            txa                ; $dfe4: 8a        
            pha                ; $dfe5: 48        
            tya                ; $dfe6: 98        
            pha                ; $dfe7: 48        
            lda $00            ; $dfe8: a5 00     
            pha                ; $dfea: 48        
            lda $01            ; $dfeb: a5 01     
            pha                ; $dfed: 48        
            lda $05            ; $dfee: a5 05     
            pha                ; $dff0: 48        
            lda $06            ; $dff1: a5 06     
            pha                ; $dff3: 48        
            lda $07            ; $dff4: a5 07     
            pha                ; $dff6: 48        
            lda $08            ; $dff7: a5 08     
            pha                ; $dff9: 48        
            lda $09            ; $dffa: a5 09     
            pha                ; $dffc: 48        
            lda #$02           ; $dffd: a9 02     
            sta $05            ; $dfff: 85 05     
            lda $0f            ; $e001: a5 0f     
            cmp #$04           ; $e003: c9 04     
            beq __e04a         ; $e005: f0 43     
            lda #$0f           ; $e007: a9 0f     
            and $03            ; $e009: 25 03     
            sta $07            ; $e00b: 85 07     
            lda $03            ; $e00d: a5 03     
            lsr                ; $e00f: 4a        
            lsr                ; $e010: 4a        
            lsr                ; $e011: 4a        
            lsr                ; $e012: 4a        
            sta $06            ; $e013: 85 06     
            tax                ; $e015: aa        
            lda #$00           ; $e016: a9 00     
            clc                ; $e018: 18        
__e019:     adc $07            ; $e019: 65 07     
            dex                ; $e01b: ca        
            bne __e019         ; $e01c: d0 fb     
            sta $08            ; $e01e: 85 08     
            lda $0f            ; $e020: a5 0f     
            bne __e02a         ; $e022: d0 06     
            jsr __e078         ; $e024: 20 78 e0  
            jmp __e044         ; $e027: 4c 44 e0  

;-------------------------------------------------------------------------------
__e02a:     cmp #$01           ; $e02a: c9 01     
            beq __e038         ; $e02c: f0 0a     
            cmp #$02           ; $e02e: c9 02     
            beq __e03e         ; $e030: f0 0c     
            jsr __e123         ; $e032: 20 23 e1  
            jmp __e04d         ; $e035: 4c 4d e0  

;-------------------------------------------------------------------------------
__e038:     jsr __e0b9         ; $e038: 20 b9 e0  
            jmp __e044         ; $e03b: 4c 44 e0  

;-------------------------------------------------------------------------------
__e03e:     jsr __e0ed         ; $e03e: 20 ed e0  
            jmp __e044         ; $e041: 4c 44 e0  

;-------------------------------------------------------------------------------
__e044:     jsr __e093         ; $e044: 20 93 e0  
            jmp __e04d         ; $e047: 4c 4d e0  

;-------------------------------------------------------------------------------
__e04a:     jsr __e068         ; $e04a: 20 68 e0  
__e04d:     pla                ; $e04d: 68        
            sta $09            ; $e04e: 85 09     
            pla                ; $e050: 68        
            sta $08            ; $e051: 85 08     
            pla                ; $e053: 68        
            sta $07            ; $e054: 85 07     
            pla                ; $e056: 68        
            sta $06            ; $e057: 85 06     
            pla                ; $e059: 68        
            sta $05            ; $e05a: 85 05     
            pla                ; $e05c: 68        
            sta $01            ; $e05d: 85 01     
            pla                ; $e05f: 68        
            sta $00            ; $e060: 85 00     
            pla                ; $e062: 68        
            tay                ; $e063: a8        
            pla                ; $e064: 68        
            tax                ; $e065: aa        
            pla                ; $e066: 68        
            rts                ; $e067: 60        

;-------------------------------------------------------------------------------
__e068:     lda $02            ; $e068: a5 02     
            ldx $03            ; $e06a: a6 03     
            ldy #$02           ; $e06c: a0 02     
__e06e:     sta ($04),y        ; $e06e: 91 04     
            iny                ; $e070: c8        
            iny                ; $e071: c8        
            iny                ; $e072: c8        
            iny                ; $e073: c8        
            dex                ; $e074: ca        
            bne __e06e         ; $e075: d0 f7     
            rts                ; $e077: 60        

;-------------------------------------------------------------------------------
__e078:     lda $02            ; $e078: a5 02     
            ldx $08            ; $e07a: a6 08     
            ldy #$01           ; $e07c: a0 01     
__e07e:     sta ($04),y        ; $e07e: 91 04     
            clc                ; $e080: 18        
            adc #$01           ; $e081: 69 01     
            iny                ; $e083: c8        
            pha                ; $e084: 48        
            lda ($04),y        ; $e085: b1 04     
            and #$3f           ; $e087: 29 3f     
            sta ($04),y        ; $e089: 91 04     
            pla                ; $e08b: 68        
            iny                ; $e08c: c8        
            iny                ; $e08d: c8        
            iny                ; $e08e: c8        
            dex                ; $e08f: ca        
            bne __e07e         ; $e090: d0 ec     
            rts                ; $e092: 60        

;-------------------------------------------------------------------------------
__e093:     ldy #$00           ; $e093: a0 00     
__e095:     ldx $06            ; $e095: a6 06     
            lda $01            ; $e097: a5 01     
            sta $09            ; $e099: 85 09     
__e09b:     lda $09            ; $e09b: a5 09     
            sta ($04),y        ; $e09d: 91 04     
            clc                ; $e09f: 18        
            adc #$08           ; $e0a0: 69 08     
            sta $09            ; $e0a2: 85 09     
            iny                ; $e0a4: c8        
            iny                ; $e0a5: c8        
            iny                ; $e0a6: c8        
            lda $00            ; $e0a7: a5 00     
            sta ($04),y        ; $e0a9: 91 04     
            iny                ; $e0ab: c8        
            dex                ; $e0ac: ca        
            bne __e09b         ; $e0ad: d0 ec     
            clc                ; $e0af: 18        
            adc #$08           ; $e0b0: 69 08     
            sta $00            ; $e0b2: 85 00     
            dec $07            ; $e0b4: c6 07     
            bne __e095         ; $e0b6: d0 dd     
            rts                ; $e0b8: 60        

;-------------------------------------------------------------------------------
__e0b9:     ldy #$01           ; $e0b9: a0 01     
            sty $0a            ; $e0bb: 84 0a     
            lda $08            ; $e0bd: a5 08     
            sec                ; $e0bf: 38        
            sbc $06            ; $e0c0: e5 06     
__e0c2:     tay                ; $e0c2: a8        
            sta $0b            ; $e0c3: 85 0b     
            ldx $06            ; $e0c5: a6 06     
__e0c7:     tya                ; $e0c7: 98        
            pha                ; $e0c8: 48        
            clc                ; $e0c9: 18        
            tya                ; $e0ca: 98        
            adc $02            ; $e0cb: 65 02     
            ldy $0a            ; $e0cd: a4 0a     
            sta ($04),y        ; $e0cf: 91 04     
            iny                ; $e0d1: c8        
            lda ($04),y        ; $e0d2: b1 04     
            and #$3f           ; $e0d4: 29 3f     
            eor #$40           ; $e0d6: 49 40     
            sta ($04),y        ; $e0d8: 91 04     
            iny                ; $e0da: c8        
            iny                ; $e0db: c8        
            iny                ; $e0dc: c8        
__e0dd:     sty $0a            ; $e0dd: 84 0a     
            pla                ; $e0df: 68        
            tay                ; $e0e0: a8        
            iny                ; $e0e1: c8        
            dex                ; $e0e2: ca        
            bne __e0c7         ; $e0e3: d0 e2     
            lda $0b            ; $e0e5: a5 0b     
            sec                ; $e0e7: 38        
            sbc $06            ; $e0e8: e5 06     
            bpl __e0c2         ; $e0ea: 10 d6     
            rts                ; $e0ec: 60        

;-------------------------------------------------------------------------------
__e0ed:     lda #$01           ; $e0ed: a9 01     
            sta $0a            ; $e0ef: 85 0a     
            lda $06            ; $e0f1: a5 06     
            sec                ; $e0f3: 38        
            sbc #$01           ; $e0f4: e9 01     
__e0f6:     tay                ; $e0f6: a8        
            sta $0b            ; $e0f7: 85 0b     
            ldx $06            ; $e0f9: a6 06     
__e0fb:     tya                ; $e0fb: 98        
            pha                ; $e0fc: 48        
            clc                ; $e0fd: 18        
            tya                ; $e0fe: 98        
            adc $02            ; $e0ff: 65 02     
            ldy $0a            ; $e101: a4 0a     
            sta ($04),y        ; $e103: 91 04     
            iny                ; $e105: c8        
            lda ($04),y        ; $e106: b1 04     
            and #$3f           ; $e108: 29 3f     
            ora #$80           ; $e10a: 09 80     
            sta ($04),y        ; $e10c: 91 04     
            iny                ; $e10e: c8        
            iny                ; $e10f: c8        
            iny                ; $e110: c8        
            sty $0a            ; $e111: 84 0a     
            pla                ; $e113: 68        
            tay                ; $e114: a8        
            dey                ; $e115: 88        
            dex                ; $e116: ca        
            bne __e0fb         ; $e117: d0 e2     
            lda $0b            ; $e119: a5 0b     
            clc                ; $e11b: 18        
            adc $06            ; $e11c: 65 06     
            cmp $08            ; $e11e: c5 08     
            bmi __e0f6         ; $e120: 30 d4     
            rts                ; $e122: 60        

;-------------------------------------------------------------------------------
__e123:     ldy #$00           ; $e123: a0 00     
__e125:     ldx $06            ; $e125: a6 06     
            lda $01            ; $e127: a5 01     
            sta $09            ; $e129: 85 09     
            lda #$ff           ; $e12b: a9 ff     
__e12d:     sta ($04),y        ; $e12d: 91 04     
            iny                ; $e12f: c8        
            iny                ; $e130: c8        
            iny                ; $e131: c8        
            iny                ; $e132: c8        
            dex                ; $e133: ca        
            bne __e12d         ; $e134: d0 f7     
            lda $00            ; $e136: a5 00     
            clc                ; $e138: 18        
            adc #$08           ; $e139: 69 08     
            sta $00            ; $e13b: 85 00     
            dec $07            ; $e13d: c6 07     
            bne __e125         ; $e13f: d0 e4     
            rts                ; $e141: 60        

;-------------------------------------------------------------------------------
__e142:     lda #$00           ; $e142: a9 00     
            jmp __e14e         ; $e144: 4c 4e e1  

;-------------------------------------------------------------------------------
__e147:     lda #$01           ; $e147: a9 01     
            jmp __e14e         ; $e149: 4c 4e e1  

;-------------------------------------------------------------------------------
__e14c:     lda #$02           ; $e14c: a9 02     
__e14e:     sta $0f            ; $e14e: 85 0f     
            txa                ; $e150: 8a        
            pha                ; $e151: 48        
            tya                ; $e152: 98        
            pha                ; $e153: 48        
            ldy #$00           ; $e154: a0 00     
            lda $0f            ; $e156: a5 0f     
            cmp #$02           ; $e158: c9 02     
            beq __e16f         ; $e15a: f0 13     
            cmp #$01           ; $e15c: c9 01     
            beq __e166         ; $e15e: f0 06     
            jsr __e19a         ; $e160: 20 9a e1  
            jmp __e193         ; $e163: 4c 93 e1  

;-------------------------------------------------------------------------------
__e166:     jsr __e19a         ; $e166: 20 9a e1  
            jsr __e1bb         ; $e169: 20 bb e1  
            jmp __e191         ; $e16c: 4c 91 e1  

;-------------------------------------------------------------------------------
__e16f:     lda ($02),y        ; $e16f: b1 02     
            cmp #$ff           ; $e171: c9 ff     
            beq __e18f         ; $e173: f0 1a     
            sta $42            ; $e175: 85 42     
            iny                ; $e177: c8        
            lda ($02),y        ; $e178: b1 02     
            sta $43            ; $e17a: 85 43     
            iny                ; $e17c: c8        
            lda ($02),y        ; $e17d: b1 02     
            sta $44            ; $e17f: 85 44     
            iny                ; $e181: c8        
            lda ($02),y        ; $e182: b1 02     
            sta $45            ; $e184: 85 45     
            iny                ; $e186: c8        
            jsr __e1bb         ; $e187: 20 bb e1  
            beq __e16f         ; $e18a: f0 e3     
            jmp __e191         ; $e18c: 4c 91 e1  

;-------------------------------------------------------------------------------
__e18f:     lda #$00           ; $e18f: a9 00     
__e191:     sta $0f            ; $e191: 85 0f     
__e193:     pla                ; $e193: 68        
            tay                ; $e194: a8        
            pla                ; $e195: 68        
            tax                ; $e196: aa        
            lda $0f            ; $e197: a5 0f     
            rts                ; $e199: 60        

;-------------------------------------------------------------------------------
__e19a:     ldx #$00           ; $e19a: a2 00     
            lda $0f            ; $e19c: a5 0f     
            beq __e1a2         ; $e19e: f0 02     
            ldx #$04           ; $e1a0: a2 04     
__e1a2:     jmp __e1a5         ; $e1a2: 4c a5 e1  

;-------------------------------------------------------------------------------
__e1a5:     jsr __e1a8         ; $e1a5: 20 a8 e1  
__e1a8:     lda ($02),y        ; $e1a8: b1 02     
            clc                ; $e1aa: 18        
            adc $00            ; $e1ab: 65 00     
            sta $3e,x          ; $e1ad: 95 3e     
            inx                ; $e1af: e8        
            iny                ; $e1b0: c8        
            lda ($02),y        ; $e1b1: b1 02     
            clc                ; $e1b3: 18        
            adc $01            ; $e1b4: 65 01     
            sta $3e,x          ; $e1b6: 95 3e     
            inx                ; $e1b8: e8        
            iny                ; $e1b9: c8        
            rts                ; $e1ba: 60        

;-------------------------------------------------------------------------------
__e1bb:     lda $3e            ; $e1bb: a5 3e     
            cmp $42            ; $e1bd: c5 42     
            bcc __e1cc         ; $e1bf: 90 0b     
            beq __e1d2         ; $e1c1: f0 0f     
            cmp $44            ; $e1c3: c5 44     
            bcc __e1d2         ; $e1c5: 90 0b     
            beq __e1d2         ; $e1c7: f0 09     
            lda #$00           ; $e1c9: a9 00     
            rts                ; $e1cb: 60        

;-------------------------------------------------------------------------------
__e1cc:     lda $40            ; $e1cc: a5 40     
            cmp $42            ; $e1ce: c5 42     
            bcc __e1ec         ; $e1d0: 90 1a     
__e1d2:     lda $3f            ; $e1d2: a5 3f     
            cmp $43            ; $e1d4: c5 43     
            bcc __e1e3         ; $e1d6: 90 0b     
            beq __e1e9         ; $e1d8: f0 0f     
            cmp $45            ; $e1da: c5 45     
            bcc __e1e9         ; $e1dc: 90 0b     
            beq __e1e9         ; $e1de: f0 09     
            lda #$00           ; $e1e0: a9 00     
            rts                ; $e1e2: 60        

;-------------------------------------------------------------------------------
__e1e3:     lda $41            ; $e1e3: a5 41     
            cmp $43            ; $e1e5: c5 43     
            bcc __e1ec         ; $e1e7: 90 03     
__e1e9:     lda #$01           ; $e1e9: a9 01     
            rts                ; $e1eb: 60        

;-------------------------------------------------------------------------------
__e1ec:     lda #$00           ; $e1ec: a9 00     
            rts                ; $e1ee: 60        

;-------------------------------------------------------------------------------
__e1ef:     ldx #$00           ; $e1ef: a2 00     
            ldy #$00           ; $e1f1: a0 00     
__e1f3:     lda $3a,x          ; $e1f3: b5 3a     
            bne __e1ff         ; $e1f5: d0 08     
            lda #$ff           ; $e1f7: a9 ff     
            sta $0200,y        ; $e1f9: 99 00 02  
            sta $0204,y        ; $e1fc: 99 04 02  
__e1ff:     inx                ; $e1ff: e8        
            tya                ; $e200: 98        
            clc                ; $e201: 18        
            adc #$30           ; $e202: 69 30     
            tay                ; $e204: a8        
            lda $0231          ; $e205: ad 31 02  
            and #$f0           ; $e208: 29 f0     
            cmp #$a0           ; $e20a: c9 a0     
            beq __e212         ; $e20c: f0 04     
            cpx #$02           ; $e20e: e0 02     
            bmi __e1f3         ; $e210: 30 e1     
__e212:     rts                ; $e212: 60        

;-------------------------------------------------------------------------------
__e213:     ldy #$00           ; $e213: a0 00     
            sty $0f            ; $e215: 84 0f     
            jsr __e25c         ; $e217: 20 5c e2  
__e21a:     lda $0200,y        ; $e21a: b9 00 02  
            cmp #$ff           ; $e21d: c9 ff     
            bne __e250         ; $e21f: d0 2f     
            lda $05            ; $e221: a5 05     
            sta $0203,y        ; $e223: 99 03 02  
            clc                ; $e226: 18        
            adc #$08           ; $e227: 69 08     
            sta $0207,y        ; $e229: 99 07 02  
            lda $06            ; $e22c: a5 06     
            sta $0200,y        ; $e22e: 99 00 02  
            sta $0204,y        ; $e231: 99 04 02  
            lda __bd13,x       ; $e234: bd 13 bd  
            sta $0201,y        ; $e237: 99 01 02  
            lda #$01           ; $e23a: a9 01     
            sta $0202,y        ; $e23c: 99 02 02  
            lda #$f7           ; $e23f: a9 f7     
            sta $0205,y        ; $e241: 99 05 02  
            lda #$01           ; $e244: a9 01     
            sta $0206,y        ; $e246: 99 06 02  
            ldx $0f            ; $e249: a6 0f     
            lda #$04           ; $e24b: a9 04     
            sta $3a,x          ; $e24d: 95 3a     
            rts                ; $e24f: 60        

;-------------------------------------------------------------------------------
__e250:     tya                ; $e250: 98        
            clc                ; $e251: 18        
            adc #$30           ; $e252: 69 30     
            tay                ; $e254: a8        
            inc $0f            ; $e255: e6 0f     
            cpy #$60           ; $e257: c0 60     
            bmi __e21a         ; $e259: 30 bf     
            rts                ; $e25b: 60        

;-------------------------------------------------------------------------------
__e25c:     txa                ; $e25c: 8a        
            pha                ; $e25d: 48        
            tya                ; $e25e: 98        
            pha                ; $e25f: 48        
            lda $4e            ; $e260: a5 4e     
            bne __e277         ; $e262: d0 13     
            lda $49            ; $e264: a5 49     
            ora #$18           ; $e266: 09 18     
            sta $01            ; $e268: 85 01     
            lda __bd1a,x       ; $e26a: bd 1a bd  
            jsr __e452         ; $e26d: 20 52 e4  
            lda $e7            ; $e270: a5 e7     
            bne __e277         ; $e272: d0 03     
            jsr __e27c         ; $e274: 20 7c e2  
__e277:     pla                ; $e277: 68        
            tay                ; $e278: a8        
            pla                ; $e279: 68        
            tax                ; $e27a: aa        
            rts                ; $e27b: 60        

;-------------------------------------------------------------------------------
__e27c:     lda #$30           ; $e27c: a9 30     
            sta $01            ; $e27e: 85 01     
            lda #$f9           ; $e280: a9 f9     
            jsr __e452         ; $e282: 20 52 e4  
            lda #$40           ; $e285: a9 40     
            sta $01            ; $e287: 85 01     
            lda $48            ; $e289: a5 48     
            jmp __e452         ; $e28b: 4c 52 e4  

;-------------------------------------------------------------------------------
__e28e:     lda $4a            ; $e28e: a5 4a     
            cmp #$04           ; $e290: c9 04     
            bne __e295         ; $e292: d0 01     
            rts                ; $e294: 60        

;-------------------------------------------------------------------------------
__e295:     cmp #$01           ; $e295: c9 01     
            bne __e29a         ; $e297: d0 01     
            rts                ; $e299: 60        

;-------------------------------------------------------------------------------
__e29a:     lda $05c6          ; $e29a: ad c6 05  
            beq __e2a0         ; $e29d: f0 01     
            rts                ; $e29f: 60        

;-------------------------------------------------------------------------------
__e2a0:     lda $03            ; $e2a0: a5 03     
            pha                ; $e2a2: 48        
            lda $04            ; $e2a3: a5 04     
            pha                ; $e2a5: 48        
            lda $6d            ; $e2a6: a5 6d     
            and #$01           ; $e2a8: 29 01     
            bne __e2b1         ; $e2aa: d0 05     
            ldx #$00           ; $e2ac: a2 00     
            jmp __e2b3         ; $e2ae: 4c b3 e2  

;-------------------------------------------------------------------------------
__e2b1:     ldx #$02           ; $e2b1: a2 02     
__e2b3:     lda __bd21,x       ; $e2b3: bd 21 bd  
            sta $02            ; $e2b6: 85 02     
            lda __bd22,x       ; $e2b8: bd 22 bd  
            sta $03            ; $e2bb: 85 03     
            lda $0213          ; $e2bd: ad 13 02  
            sta $00            ; $e2c0: 85 00     
            lda $0210          ; $e2c2: ad 10 02  
            sta $01            ; $e2c5: 85 01     
            lda #$00           ; $e2c7: a9 00     
            jsr __e14e         ; $e2c9: 20 4e e1  
            lda $4a            ; $e2cc: a5 4a     
            cmp #$03           ; $e2ce: c9 03     
            beq __e2e1         ; $e2d0: f0 0f     
            ldx $b0            ; $e2d2: a6 b0     
            ldy #$00           ; $e2d4: a0 00     
            jsr __cb21         ; $e2d6: 20 21 cb  
            beq __e2f6         ; $e2d9: f0 1b     
            jsr __e30e         ; $e2db: 20 0e e3  
            jmp __e2f6         ; $e2de: 4c f6 e2  

;-------------------------------------------------------------------------------
__e2e1:     ldx $a0            ; $e2e1: a6 a0     
            ldy #$00           ; $e2e3: a0 00     
            jsr __cb21         ; $e2e5: 20 21 cb  
            bne __e2f3         ; $e2e8: d0 09     
            ldx $b0            ; $e2ea: a6 b0     
            ldy #$60           ; $e2ec: a0 60     
            jsr __cb21         ; $e2ee: 20 21 cb  
            beq __e2f6         ; $e2f1: f0 03     
__e2f3:     jsr __e30e         ; $e2f3: 20 0e e3  
__e2f6:     jsr __d4ba         ; $e2f6: 20 ba d4  
            pla                ; $e2f9: 68        
            sta $04            ; $e2fa: 85 04     
            pla                ; $e2fc: 68        
            sta $03            ; $e2fd: 85 03     
            ldx $05c6          ; $e2ff: ae c6 05  
            bne __e305         ; $e302: d0 01     
            rts                ; $e304: 60        

;-------------------------------------------------------------------------------
__e305:     lda #$20           ; $e305: a9 20     
            sta $fd            ; $e307: 85 fd     
            ldx #$00           ; $e309: a2 00     
            jmp __e213         ; $e30b: 4c 13 e2  

;-------------------------------------------------------------------------------
__e30e:     lda $00            ; $e30e: a5 00     
            sta $05            ; $e310: 85 05     
            lda $01            ; $e312: a5 01     
            sta $06            ; $e314: 85 06     
            inc $05c6          ; $e316: ee c6 05  
            rts                ; $e319: 60        

;-------------------------------------------------------------------------------
__e31a:     lda $9e            ; $e31a: a5 9e     
            cmp $9f            ; $e31c: c5 9f     
            beq __e32c         ; $e31e: f0 0c     
            sta $9f            ; $e320: 85 9f     
            lda #$00           ; $e322: a9 00     
            sta $05c7          ; $e324: 8d c7 05  
            ldx #$04           ; $e327: a2 04     
            jmp __e33d         ; $e329: 4c 3d e3  

;-------------------------------------------------------------------------------
__e32c:     inc $05c7          ; $e32c: ee c7 05  
            lda #$01           ; $e32f: a9 01     
            cmp $05c7          ; $e331: cd c7 05  
            bne __e33b         ; $e334: d0 05     
            ldx #$05           ; $e336: a2 05     
            jmp __e33d         ; $e338: 4c 3d e3  

;-------------------------------------------------------------------------------
__e33b:     ldx #$06           ; $e33b: a2 06     
__e33d:     lda $0208          ; $e33d: ad 08 02  
            sec                ; $e340: 38        
            sbc #$08           ; $e341: e9 08     
            sta $06            ; $e343: 85 06     
            lda $020b          ; $e345: ad 0b 02  
            sec                ; $e348: 38        
            sbc #$04           ; $e349: e9 04     
            sta $05            ; $e34b: 85 05     
            jmp __e213         ; $e34d: 4c 13 e2  

;-------------------------------------------------------------------------------
__e350:     lda $0233          ; $e350: ad 33 02  
            sta $05            ; $e353: 85 05     
            lda $0230          ; $e355: ad 30 02  
            sec                ; $e358: 38        
            sbc #$04           ; $e359: e9 04     
            sta $06            ; $e35b: 85 06     
            ldx #$03           ; $e35d: a2 03     
            jmp __e213         ; $e35f: 4c 13 e2  

;-------------------------------------------------------------------------------
__e362:     lda $01            ; $e362: a5 01     
            pha                ; $e364: 48        
            txa                ; $e365: 8a        
            pha                ; $e366: 48        
            lda $05e7,x        ; $e367: bd e7 05  
            sta $05            ; $e36a: 85 05     
            lda $05e8,x        ; $e36c: bd e8 05  
            clc                ; $e36f: 18        
            adc #$18           ; $e370: 69 18     
            sta $06            ; $e372: 85 06     
            ldx #$01           ; $e374: a2 01     
            .hex 20 13         ; $e376: 20 13     Suspected data
__e378:     .hex e2 68         ; $e378: e2 68     Invalid Opcode - NOP #$68
            tax                ; $e37a: aa        
            pla                ; $e37b: 68        
            sta $01            ; $e37c: 85 01     
            rts                ; $e37e: 60        

;-------------------------------------------------------------------------------
__e37f:     lda $e8            ; $e37f: a5 e8     
            bne __e39a         ; $e381: d0 17     
            lda #$01           ; $e383: a9 01     
            sta $e8            ; $e385: 85 e8     
            lda #$00           ; $e387: a9 00     
            sta $4f            ; $e389: 85 4f     
            sta $50            ; $e38b: 85 50     
            lda #$0f           ; $e38d: a9 0f     
            sta $18            ; $e38f: 85 18     
            lda #$13           ; $e391: a9 13     
            sta $19            ; $e393: 85 19     
            lda #$09           ; $e395: a9 09     
            sta $39            ; $e397: 85 39     
            rts                ; $e399: 60        

;-------------------------------------------------------------------------------
__e39a:     lda $50            ; $e39a: a5 50     
            beq __e3b0         ; $e39c: f0 12     
            lda $51            ; $e39e: a5 51     
            cmp #$05           ; $e3a0: c9 05     
            bne __e3ab         ; $e3a2: d0 07     
            lda #$03           ; $e3a4: a9 03     
            sta $6b            ; $e3a6: 85 6b     
            jmp __e3ad         ; $e3a8: 4c ad e3  

;-------------------------------------------------------------------------------
__e3ab:     sta $54            ; $e3ab: 85 54     
__e3ad:     dec $50            ; $e3ad: c6 50     
            rts                ; $e3af: 60        

;-------------------------------------------------------------------------------
__e3b0:     sta $0515          ; $e3b0: 8d 15 05  
            ldx $4f            ; $e3b3: a6 4f     
            lda __bd4d,x       ; $e3b5: bd 4d bd  
            .hex 85            ; $e3b8: 85        Suspected data
__e3b9:     bvc __e378         ; $e3b9: 50 bd     
            and __85bd         ; $e3bb: 2d bd 85  
            eor ($e6),y        ; $e3be: 51 e6     
            .hex 4f 60         ; $e3c0: 4f 60     Suspected data
__e3c2:     lda $ef            ; $e3c2: a5 ef     
            and #$01           ; $e3c4: 29 01     
            asl                ; $e3c6: 0a        
            tax                ; $e3c7: aa        
            lda $21            ; $e3c8: a5 21     
            sta $010e,x        ; $e3ca: 9d 0e 01  
            lda $22            ; $e3cd: a5 22     
            sta $010f,x        ; $e3cf: 9d 0f 01  
            rts                ; $e3d2: 60        

;-------------------------------------------------------------------------------
__e3d3:     lda $ef            ; $e3d3: a5 ef     
            and #$01           ; $e3d5: 29 01     
            asl                ; $e3d7: 0a        
            tax                ; $e3d8: aa        
            lda $010e,x        ; $e3d9: bd 0e 01  
            sta $21            ; $e3dc: 85 21     
            lda $010f,x        ; $e3de: bd 0f 01  
            .hex 85            ; $e3e1: 85        Suspected data
__e3e2:     .hex 22            ; $e3e2: 22        Invalid Opcode - KIL 
            rts                ; $e3e3: 60        

;-------------------------------------------------------------------------------
__e3e4:     lda $3c            ; $e3e4: a5 3c     
            beq __e3e9         ; $e3e6: f0 01     
            rts                ; $e3e8: 60        

;-------------------------------------------------------------------------------
__e3e9:     lda $2e            ; $e3e9: a5 2e     
            bne __e3f2         ; $e3eb: d0 05     
            lda #$05           ; $e3ed: a9 05     
            sta $6b            ; $e3ef: 85 6b     
            rts                ; $e3f1: 60        

;-------------------------------------------------------------------------------
__e3f2:     lda #$0f           ; $e3f2: a9 0f     
            sta $3c            ; $e3f4: 85 3c     
            lda #$01           ; $e3f6: a9 01     
            sta $00            ; $e3f8: 85 00     
            lda #$0a           ; $e3fa: a9 0a     
            sta $01            ; $e3fc: 85 01     
            jsr __e613         ; $e3fe: 20 13 e6  
            lda #$02           ; $e401: a9 02     
            sta $00            ; $e403: 85 00     
            lda #$01           ; $e405: a9 01     
            sta $05c8          ; $e407: 8d c8 05  
            jmp __e523         ; $e40a: 4c 23 e5  

;-------------------------------------------------------------------------------
__e40d:     lda $0331          ; $e40d: ad 31 03  
            bne __e451         ; $e410: d0 3f     
            ldx $0300          ; $e412: ae 00 03  
            lda $0302,x        ; $e415: bd 02 03  
            beq __e451         ; $e418: f0 37     
            and #$f0           ; $e41a: 29 f0     
            lsr                ; $e41c: 4a        
            lsr                ; $e41d: 4a        
            lsr                ; $e41e: 4a        
            tay                ; $e41f: a8        
            lda __b6fd,y       ; $e420: b9 fd b6  
            sta $02            ; $e423: 85 02     
            iny                ; $e425: c8        
            lda __b6fd,y       ; $e426: b9 fd b6  
            sta $03            ; $e429: 85 03     
            lda $0302,x        ; $e42b: bd 02 03  
            and #$0f           ; $e42e: 29 0f     
            sta $01            ; $e430: 85 01     
            lda #$00           ; $e432: a9 00     
            sta $0302,x        ; $e434: 9d 02 03  
            lda #$e4           ; $e437: a9 e4     
            pha                ; $e439: 48        
            lda #$0c           ; $e43a: a9 0c     
            pha                ; $e43c: 48        
            inx                ; $e43d: e8        
            inx                ; $e43e: e8        
            txa                ; $e43f: 8a        
            cmp #$2e           ; $e440: c9 2e     
            bcc __e446         ; $e442: 90 02     
            lda #$00           ; $e444: a9 00     
__e446:     sta $0300          ; $e446: 8d 00 03  
            lda $0301,x        ; $e449: bd 01 03  
            sta $00            ; $e44c: 85 00     
            jmp ($0002)        ; $e44e: 6c 02 00  

;-------------------------------------------------------------------------------
__e451:     rts                ; $e451: 60        

;-------------------------------------------------------------------------------
__e452:     ldx $0301          ; $e452: ae 01 03  
            ldy $0302,x        ; $e455: bc 02 03  
            bne __e46e         ; $e458: d0 14     
            sta $0303,x        ; $e45a: 9d 03 03  
            lda $01            ; $e45d: a5 01     
            sta $0302,x        ; $e45f: 9d 02 03  
            inx                ; $e462: e8        
            inx                ; $e463: e8        
            txa                ; $e464: 8a        
            cmp #$2e           ; $e465: c9 2e     
            bcc __e46b         ; $e467: 90 02     
            lda #$00           ; $e469: a9 00     
__e46b:     sta $0301          ; $e46b: 8d 01 03  
__e46e:     rts                ; $e46e: 60        

;-------------------------------------------------------------------------------
__e46f:     lda #$31           ; $e46f: a9 31     
            sta $00            ; $e471: 85 00     
            lda #$03           ; $e473: a9 03     
            sta $01            ; $e475: 85 01     
            jsr __e50f         ; $e477: 20 0f e5  
            lda #$00           ; $e47a: a9 00     
            sta $0330          ; $e47c: 8d 30 03  
            sta $0331          ; $e47f: 8d 31 03  
            rts                ; $e482: 60        

;-------------------------------------------------------------------------------
__e483:     lda #$00           ; $e483: a9 00     
            sta $2003          ; $e485: 8d 03 20  
            lda #$02           ; $e488: a9 02     
            sta $4014          ; $e48a: 8d 14 40  
            rts                ; $e48d: 60        

;-------------------------------------------------------------------------------
__e48e:     lda $2002          ; $e48e: ad 02 20  
            lda $10            ; $e491: a5 10     
            and #$fb           ; $e493: 29 fb     
            sta $2000          ; $e495: 8d 00 20  
            sta $10            ; $e498: 85 10     
            lda #$1c           ; $e49a: a9 1c     
            clc                ; $e49c: 18        
__e49d:     adc #$04           ; $e49d: 69 04     
            dec $01            ; $e49f: c6 01     
            bne __e49d         ; $e4a1: d0 fa     
            sta $02            ; $e4a3: 85 02     
            sta $2006          ; $e4a5: 8d 06 20  
            lda #$00           ; $e4a8: a9 00     
            sta $2006          ; $e4aa: 8d 06 20  
            ldx #$04           ; $e4ad: a2 04     
            ldy #$00           ; $e4af: a0 00     
            lda $00            ; $e4b1: a5 00     
__e4b3:     sta $2007          ; $e4b3: 8d 07 20  
            dey                ; $e4b6: 88        
            bne __e4b3         ; $e4b7: d0 fa     
            dex                ; $e4b9: ca        
            bne __e4b3         ; $e4ba: d0 f7     
            lda $02            ; $e4bc: a5 02     
            adc #$03           ; $e4be: 69 03     
            sta $2006          ; $e4c0: 8d 06 20  
            lda #$c0           ; $e4c3: a9 c0     
            sta $2006          ; $e4c5: 8d 06 20  
            ldy #$40           ; $e4c8: a0 40     
            lda #$00           ; $e4ca: a9 00     
__e4cc:     sta $2007          ; $e4cc: 8d 07 20  
            dey                ; $e4cf: 88        
            bne __e4cc         ; $e4d0: d0 fa     
            rts                ; $e4d2: 60        

;-------------------------------------------------------------------------------
__e4d3:     sta $2006          ; $e4d3: 8d 06 20  
            iny                ; $e4d6: c8        
            lda ($00),y        ; $e4d7: b1 00     
            sta $2006          ; $e4d9: 8d 06 20  
            iny                ; $e4dc: c8        
            lda ($00),y        ; $e4dd: b1 00     
            asl                ; $e4df: 0a        
            pha                ; $e4e0: 48        
            lda $10            ; $e4e1: a5 10     
            ora #$04           ; $e4e3: 09 04     
            bcs __e4e9         ; $e4e5: b0 02     
            and #$fb           ; $e4e7: 29 fb     
__e4e9:     sta $2000          ; $e4e9: 8d 00 20  
            sta $10            ; $e4ec: 85 10     
            pla                ; $e4ee: 68        
            asl                ; $e4ef: 0a        
            bcc __e4f5         ; $e4f0: 90 03     
            ora #$02           ; $e4f2: 09 02     
            iny                ; $e4f4: c8        
__e4f5:     lsr                ; $e4f5: 4a        
            lsr                ; $e4f6: 4a        
            tax                ; $e4f7: aa        
__e4f8:     bcs __e4fb         ; $e4f8: b0 01     
            iny                ; $e4fa: c8        
__e4fb:     lda ($00),y        ; $e4fb: b1 00     
            sta $2007          ; $e4fd: 8d 07 20  
            dex                ; $e500: ca        
            bne __e4f8         ; $e501: d0 f5     
            sec                ; $e503: 38        
            tya                ; $e504: 98        
            adc $00            ; $e505: 65 00     
            sta $00            ; $e507: 85 00     
            lda #$00           ; $e509: a9 00     
            adc $01            ; $e50b: 65 01     
            sta $01            ; $e50d: 85 01     
__e50f:     ldx $2002          ; $e50f: ae 02 20  
            ldy #$00           ; $e512: a0 00     
            lda ($00),y        ; $e514: b1 00     
            bne __e4d3         ; $e516: d0 bb     
            lda $12            ; $e518: a5 12     
            sta $2005          ; $e51a: 8d 05 20  
            lda $13            ; $e51d: a5 13     
            sta $2005          ; $e51f: 8d 05 20  
            rts                ; $e522: 60        

;-------------------------------------------------------------------------------
__e523:     lda #$04           ; $e523: a9 04     
__e525:     lsr $00            ; $e525: 46 00     
            bcc __e52e         ; $e527: 90 05     
            pha                ; $e529: 48        
            jsr __e534         ; $e52a: 20 34 e5  
            pla                ; $e52d: 68        
__e52e:     clc                ; $e52e: 18        
            sbc #$00           ; $e52f: e9 00     
            bpl __e525         ; $e531: 10 f2     
            rts                ; $e533: 60        

;-------------------------------------------------------------------------------
__e534:     asl                ; $e534: 0a        
            asl                ; $e535: 0a        
            tay                ; $e536: a8        
            sta $02            ; $e537: 85 02     
            ldx $0330          ; $e539: ae 30 03  
            lda __b709,y       ; $e53c: b9 09 b7  
            sta $0331,x        ; $e53f: 9d 31 03  
            jsr __e5ff         ; $e542: 20 ff e5  
            iny                ; $e545: c8        
            lda __b709,y       ; $e546: b9 09 b7  
            sta $0331,x        ; $e549: 9d 31 03  
            jsr __e5ff         ; $e54c: 20 ff e5  
            iny                ; $e54f: c8        
            lda __b709,y       ; $e550: b9 09 b7  
            and #$07           ; $e553: 29 07     
            sta $0331,x        ; $e555: 9d 31 03  
            sta $01            ; $e558: 85 01     
            txa                ; $e55a: 8a        
            sec                ; $e55b: 38        
            adc $01            ; $e55c: 65 01     
            jsr __e601         ; $e55e: 20 01 e6  
            tax                ; $e561: aa        
            stx $0330          ; $e562: 8e 30 03  
            lda #$00           ; $e565: a9 00     
            sta $0331,x        ; $e567: 9d 31 03  
            iny                ; $e56a: c8        
            lda __b709,y       ; $e56b: b9 09 b7  
            sta $03            ; $e56e: 85 03     
__e570:     dex                ; $e570: ca        
            lda $0020,y        ; $e571: b9 20 00  
            and #$0f           ; $e574: 29 0f     
            sta $0331,x        ; $e576: 9d 31 03  
            dec $01            ; $e579: c6 01     
            beq __e58f         ; $e57b: f0 12     
            dex                ; $e57d: ca        
            lda $0020,y        ; $e57e: b9 20 00  
            and #$f0           ; $e581: 29 f0     
            lsr                ; $e583: 4a        
            lsr                ; $e584: 4a        
            lsr                ; $e585: 4a        
            lsr                ; $e586: 4a        
            sta $0331,x        ; $e587: 9d 31 03  
            dey                ; $e58a: 88        
            dec $01            ; $e58b: c6 01     
            bne __e570         ; $e58d: d0 e1     
__e58f:     lda $03            ; $e58f: a5 03     
            and #$01           ; $e591: 29 01     
            beq __e5a0         ; $e593: f0 0b     
            ldy $02            ; $e595: a4 02     
            clc                ; $e597: 18        
            lda $0020,y        ; $e598: b9 20 00  
            adc #$37           ; $e59b: 69 37     
            sta $0331,x        ; $e59d: 9d 31 03  
__e5a0:     rts                ; $e5a0: 60        

;-------------------------------------------------------------------------------
__e5a1:     txa                ; $e5a1: 8a        
            pha                ; $e5a2: 48        
            tya                ; $e5a3: 98        
            pha                ; $e5a4: 48        
            ldy #$00           ; $e5a5: a0 00     
            lda ($02),y        ; $e5a7: b1 02     
            and #$0f           ; $e5a9: 29 0f     
            sta $05            ; $e5ab: 85 05     
            lda ($02),y        ; $e5ad: b1 02     
            lsr                ; $e5af: 4a        
            lsr                ; $e5b0: 4a        
            lsr                ; $e5b1: 4a        
            lsr                ; $e5b2: 4a        
            sta $04            ; $e5b3: 85 04     
            ldx $0330          ; $e5b5: ae 30 03  
__e5b8:     lda $01            ; $e5b8: a5 01     
            sta $0331,x        ; $e5ba: 9d 31 03  
            jsr __e5ff         ; $e5bd: 20 ff e5  
            lda $00            ; $e5c0: a5 00     
            sta $0331,x        ; $e5c2: 9d 31 03  
            jsr __e5ff         ; $e5c5: 20 ff e5  
            lda $04            ; $e5c8: a5 04     
            sta $06            ; $e5ca: 85 06     
            ora #$80           ; $e5cc: 09 80     
            sta $0331,x        ; $e5ce: 9d 31 03  
__e5d1:     jsr __e5ff         ; $e5d1: 20 ff e5  
            iny                ; $e5d4: c8        
            lda ($02),y        ; $e5d5: b1 02     
            sta $0331,x        ; $e5d7: 9d 31 03  
            dec $06            ; $e5da: c6 06     
            bne __e5d1         ; $e5dc: d0 f3     
            jsr __e5ff         ; $e5de: 20 ff e5  
            clc                ; $e5e1: 18        
            lda #$01           ; $e5e2: a9 01     
            adc $00            ; $e5e4: 65 00     
            sta $00            ; $e5e6: 85 00     
            lda #$00           ; $e5e8: a9 00     
            adc $01            ; $e5ea: 65 01     
            sta $01            ; $e5ec: 85 01     
            stx $0330          ; $e5ee: 8e 30 03  
            dec $05            ; $e5f1: c6 05     
            bne __e5b8         ; $e5f3: d0 c3     
            lda #$00           ; $e5f5: a9 00     
            sta $0331,x        ; $e5f7: 9d 31 03  
__e5fa:     pla                ; $e5fa: 68        
            tay                ; $e5fb: a8        
            pla                ; $e5fc: 68        
            tax                ; $e5fd: aa        
            rts                ; $e5fe: 60        

;-------------------------------------------------------------------------------
__e5ff:     inx                ; $e5ff: e8        
            txa                ; $e600: 8a        
__e601:     cmp #$3f           ; $e601: c9 3f     
            bcc __e612         ; $e603: 90 0d     
            ldx $0330          ; $e605: ae 30 03  
            lda #$00           ; $e608: a9 00     
            sta $0331,x        ; $e60a: 9d 31 03  
            pla                ; $e60d: 68        
            pla                ; $e60e: 68        
            jmp __e5fa         ; $e60f: 4c fa e5  

;-------------------------------------------------------------------------------
__e612:     rts                ; $e612: 60        

;-------------------------------------------------------------------------------
__e613:     ldx #$ff           ; $e613: a2 ff     
            bne __e619         ; $e615: d0 02     
__e617:     ldx #$00           ; $e617: a2 00     
__e619:     stx $04            ; $e619: 86 04     
            ldx #$00           ; $e61b: a2 00     
            stx $05            ; $e61d: 86 05     
            stx $06            ; $e61f: 86 06     
            stx $07            ; $e621: 86 07     
            lda $01            ; $e623: a5 01     
            and #$08           ; $e625: 29 08     
            bne __e62a         ; $e627: d0 01     
            inx                ; $e629: e8        
__e62a:     lda $00            ; $e62a: a5 00     
            sta $06,x          ; $e62c: 95 06     
            lda $01            ; $e62e: a5 01     
            jmp __e633         ; $e630: 4c 33 e6  

;-------------------------------------------------------------------------------
__e633:     and #$07           ; $e633: 29 07     
            asl                ; $e635: 0a        
            asl                ; $e636: 0a        
            tax                ; $e637: aa        
            lda $04            ; $e638: a5 04     
            beq __e663         ; $e63a: f0 27     
            lda $24,x          ; $e63c: b5 24     
            beq __e667         ; $e63e: f0 27     
__e640:     clc                ; $e640: 18        
            lda $27,x          ; $e641: b5 27     
            sta $03            ; $e643: 85 03     
            lda $07            ; $e645: a5 07     
            jsr __e6b8         ; $e647: 20 b8 e6  
            sta $27,x          ; $e64a: 95 27     
            lda $26,x          ; $e64c: b5 26     
            sta $03            ; $e64e: 85 03     
            lda $06            ; $e650: a5 06     
            jsr __e6b8         ; $e652: 20 b8 e6  
            sta $26,x          ; $e655: 95 26     
            lda $25,x          ; $e657: b5 25     
            sta $03            ; $e659: 85 03     
            lda $05            ; $e65b: a5 05     
            jsr __e6b8         ; $e65d: 20 b8 e6  
            sta $25,x          ; $e660: 95 25     
            rts                ; $e662: 60        

;-------------------------------------------------------------------------------
__e663:     lda $24,x          ; $e663: b5 24     
            beq __e640         ; $e665: f0 d9     
__e667:     sec                ; $e667: 38        
            lda $27,x          ; $e668: b5 27     
            sta $03            ; $e66a: 85 03     
            lda $07            ; $e66c: a5 07     
            jsr __e6d9         ; $e66e: 20 d9 e6  
            sta $27,x          ; $e671: 95 27     
            lda $26,x          ; $e673: b5 26     
            sta $03            ; $e675: 85 03     
            lda $06            ; $e677: a5 06     
            jsr __e6d9         ; $e679: 20 d9 e6  
            sta $26,x          ; $e67c: 95 26     
            lda $25,x          ; $e67e: b5 25     
            sta $03            ; $e680: 85 03     
            lda $05            ; $e682: a5 05     
            jsr __e6d9         ; $e684: 20 d9 e6  
            sta $25,x          ; $e687: 95 25     
            lda $25,x          ; $e689: b5 25     
            bne __e695         ; $e68b: d0 08     
            lda $26,x          ; $e68d: b5 26     
            bne __e695         ; $e68f: d0 04     
            lda $27,x          ; $e691: b5 27     
            beq __e69b         ; $e693: f0 06     
__e695:     bcs __e6b7         ; $e695: b0 20     
            lda $24,x          ; $e697: b5 24     
            eor #$ff           ; $e699: 49 ff     
__e69b:     sta $24,x          ; $e69b: 95 24     
            sec                ; $e69d: 38        
            lda #$00           ; $e69e: a9 00     
            sta $03            ; $e6a0: 85 03     
            lda $27,x          ; $e6a2: b5 27     
            jsr __e6d9         ; $e6a4: 20 d9 e6  
            sta $27,x          ; $e6a7: 95 27     
            lda $26,x          ; $e6a9: b5 26     
            jsr __e6d9         ; $e6ab: 20 d9 e6  
            sta $26,x          ; $e6ae: 95 26     
            lda $25,x          ; $e6b0: b5 25     
            jsr __e6d9         ; $e6b2: 20 d9 e6  
            sta $25,x          ; $e6b5: 95 25     
__e6b7:     rts                ; $e6b7: 60        

;-------------------------------------------------------------------------------
__e6b8:     jsr __e6fb         ; $e6b8: 20 fb e6  
            adc $01            ; $e6bb: 65 01     
            cmp #$0a           ; $e6bd: c9 0a     
            bcc __e6c3         ; $e6bf: 90 02     
            adc #$05           ; $e6c1: 69 05     
__e6c3:     clc                ; $e6c3: 18        
            adc $02            ; $e6c4: 65 02     
            sta $02            ; $e6c6: 85 02     
            lda $03            ; $e6c8: a5 03     
            and #$f0           ; $e6ca: 29 f0     
            adc $02            ; $e6cc: 65 02     
            bcc __e6d4         ; $e6ce: 90 04     
__e6d0:     adc #$5f           ; $e6d0: 69 5f     
            sec                ; $e6d2: 38        
            rts                ; $e6d3: 60        

;-------------------------------------------------------------------------------
__e6d4:     cmp #$a0           ; $e6d4: c9 a0     
            bcs __e6d0         ; $e6d6: b0 f8     
            rts                ; $e6d8: 60        

;-------------------------------------------------------------------------------
__e6d9:     jsr __e6fb         ; $e6d9: 20 fb e6  
            sbc $01            ; $e6dc: e5 01     
            sta $01            ; $e6de: 85 01     
            bcs __e6ec         ; $e6e0: b0 0a     
            adc #$0a           ; $e6e2: 69 0a     
            sta $01            ; $e6e4: 85 01     
            lda $02            ; $e6e6: a5 02     
            adc #$0f           ; $e6e8: 69 0f     
            sta $02            ; $e6ea: 85 02     
__e6ec:     lda $03            ; $e6ec: a5 03     
            and #$f0           ; $e6ee: 29 f0     
            sec                ; $e6f0: 38        
            sbc $02            ; $e6f1: e5 02     
            bcs __e6f8         ; $e6f3: b0 03     
            adc #$a0           ; $e6f5: 69 a0     
            clc                ; $e6f7: 18        
__e6f8:     ora $01            ; $e6f8: 05 01     
            rts                ; $e6fa: 60        

;-------------------------------------------------------------------------------
__e6fb:     pha                ; $e6fb: 48        
            and #$0f           ; $e6fc: 29 0f     
            sta $01            ; $e6fe: 85 01     
            pla                ; $e700: 68        
            and #$f0           ; $e701: 29 f0     
            sta $02            ; $e703: 85 02     
            lda $03            ; $e705: a5 03     
            and #$0f           ; $e707: 29 0f     
            rts                ; $e709: 60        

;-------------------------------------------------------------------------------
            lda #$00           ; $e70a: a9 00     
            sta $04            ; $e70c: 85 04     
            clc                ; $e70e: 18        
            lda $00            ; $e70f: a5 00     
            adc #$10           ; $e711: 69 10     
            and #$f0           ; $e713: 29 f0     
            lsr                ; $e715: 4a        
            lsr                ; $e716: 4a        
            tay                ; $e717: a8        
            lda $00            ; $e718: a5 00     
            and #$07           ; $e71a: 29 07     
            asl                ; $e71c: 0a        
            asl                ; $e71d: 0a        
            tax                ; $e71e: aa        
__e71f:     lda $0020,y        ; $e71f: b9 20 00  
            beq __e775         ; $e722: f0 51     
            lda $24,x          ; $e724: b5 24     
            beq __e74e         ; $e726: f0 26     
__e728:     sec                ; $e728: 38        
            lda $0023,y        ; $e729: b9 23 00  
            sta $03            ; $e72c: 85 03     
            lda $27,x          ; $e72e: b5 27     
            jsr __e6d9         ; $e730: 20 d9 e6  
            lda $0022,y        ; $e733: b9 22 00  
            sta $03            ; $e736: 85 03     
            lda $26,x          ; $e738: b5 26     
            jsr __e6d9         ; $e73a: 20 d9 e6  
            lda $0021,y        ; $e73d: b9 21 00  
            sta $03            ; $e740: 85 03     
            lda $25,x          ; $e742: b5 25     
            jsr __e6d9         ; $e744: 20 d9 e6  
            bcs __e779         ; $e747: b0 30     
            lda $0020,y        ; $e749: b9 20 00  
            bne __e77e         ; $e74c: d0 30     
__e74e:     lda #$ff           ; $e74e: a9 ff     
            sta $04            ; $e750: 85 04     
            sec                ; $e752: 38        
__e753:     tya                ; $e753: 98        
            bne __e774         ; $e754: d0 1e     
            bcc __e768         ; $e756: 90 10     
            lda $24,x          ; $e758: b5 24     
            sta $20            ; $e75a: 85 20     
            lda $25,x          ; $e75c: b5 25     
            sta $21            ; $e75e: 85 21     
            lda $26,x          ; $e760: b5 26     
            sta $22            ; $e762: 85 22     
            lda $27,x          ; $e764: b5 27     
            sta $23            ; $e766: 85 23     
__e768:     lda $00            ; $e768: a5 00     
            and #$08           ; $e76a: 29 08     
            beq __e774         ; $e76c: f0 06     
            dex                ; $e76e: ca        
            dex                ; $e76f: ca        
            dex                ; $e770: ca        
            dex                ; $e771: ca        
            bpl __e71f         ; $e772: 10 ab     
__e774:     rts                ; $e774: 60        

;-------------------------------------------------------------------------------
__e775:     lda $24,x          ; $e775: b5 24     
            beq __e728         ; $e777: f0 af     
__e779:     lda $0020,y        ; $e779: b9 20 00  
            bne __e74e         ; $e77c: d0 d0     
__e77e:     clc                ; $e77e: 18        
            bcc __e753         ; $e77f: 90 d2     
__e781:     ldx #$03           ; $e781: a2 03     
            dec $34            ; $e783: c6 34     
            bpl __e78d         ; $e785: 10 06     
            lda #$0a           ; $e787: a9 0a     
            sta $34            ; $e789: 85 34     
            ldx #$08           ; $e78b: a2 08     
__e78d:     lda $35,x          ; $e78d: b5 35     
            beq __e793         ; $e78f: f0 02     
            dec $35,x          ; $e791: d6 35     
__e793:     dex                ; $e793: ca        
            bpl __e78d         ; $e794: 10 f7     
            rts                ; $e796: 60        

;-------------------------------------------------------------------------------
__e797:     txa                ; $e797: 8a        
            pha                ; $e798: 48        
            tya                ; $e799: 98        
            pha                ; $e79a: 48        
            ldx $0330          ; $e79b: ae 30 03  
            lda $01            ; $e79e: a5 01     
            sta $0331,x        ; $e7a0: 9d 31 03  
            jsr __e5ff         ; $e7a3: 20 ff e5  
            lda $00            ; $e7a6: a5 00     
            sta $0331,x        ; $e7a8: 9d 31 03  
            jsr __e5ff         ; $e7ab: 20 ff e5  
            lda #$01           ; $e7ae: a9 01     
            sta $0331,x        ; $e7b0: 9d 31 03  
            jsr __e5ff         ; $e7b3: 20 ff e5  
            tya                ; $e7b6: 98        
            sta $0331,x        ; $e7b7: 9d 31 03  
            jsr __e5ff         ; $e7ba: 20 ff e5  
            lda #$00           ; $e7bd: a9 00     
            sta $0331,x        ; $e7bf: 9d 31 03  
            stx $0330          ; $e7c2: 8e 30 03  
            pla                ; $e7c5: 68        
            tay                ; $e7c6: a8        
            pla                ; $e7c7: 68        
            tax                ; $e7c8: aa        
            rts                ; $e7c9: 60        

;-------------------------------------------------------------------------------
__e7ca:     lda $18            ; $e7ca: a5 18     
            and #$02           ; $e7cc: 29 02     
            sta $00            ; $e7ce: 85 00     
            lda $19            ; $e7d0: a5 19     
            and #$02           ; $e7d2: 29 02     
            eor $00            ; $e7d4: 45 00     
            clc                ; $e7d6: 18        
            beq __e7da         ; $e7d7: f0 01     
            sec                ; $e7d9: 38        
__e7da:     ror $18            ; $e7da: 66 18     
            ror $19            ; $e7dc: 66 19     
            ror $1a            ; $e7de: 66 1a     
            ror $1b            ; $e7e0: 66 1b     
            ror $1c            ; $e7e2: 66 1c     
            ror $1d            ; $e7e4: 66 1d     
            ror $1e            ; $e7e6: 66 1e     
            ror $1f            ; $e7e8: 66 1f     
            rts                ; $e7ea: 60        

;-------------------------------------------------------------------------------
__e7eb:     lda #$01           ; $e7eb: a9 01     
            sta $4016          ; $e7ed: 8d 16 40  
            ldx #$00           ; $e7f0: a2 00     
            lda #$00           ; $e7f2: a9 00     
            sta $4016          ; $e7f4: 8d 16 40  
            jsr __e7fe         ; $e7f7: 20 fe e7  
            inx                ; $e7fa: e8        
            jmp __e7fe         ; $e7fb: 4c fe e7  

;-------------------------------------------------------------------------------
__e7fe:     ldy #$08           ; $e7fe: a0 08     
__e800:     pha                ; $e800: 48        
            lda $4016,x        ; $e801: bd 16 40  
__e804:     sta $00            ; $e804: 85 00     
            lsr                ; $e806: 4a        
            ora $00            ; $e807: 05 00     
            lsr                ; $e809: 4a        
            pla                ; $e80a: 68        
            rol                ; $e80b: 2a        
            dey                ; $e80c: 88        
            bne __e800         ; $e80d: d0 f1     
            stx $00            ; $e80f: 86 00     
            asl $00            ; $e811: 06 00     
            ldx $00            ; $e813: a6 00     
            ldy $14,x          ; $e815: b4 14     
            sty $00            ; $e817: 84 00     
            sta $14,x          ; $e819: 95 14     
            and #$ff           ; $e81b: 29 ff     
            bpl __e825         ; $e81d: 10 06     
            bit $00            ; $e81f: 24 00     
__e821:     bpl __e825         ; $e821: 10 02     
            .hex 29            ; $e823: 29        Suspected data
__e824:     .hex 7f            ; $e824: 7f        Suspected data
__e825:     ldy $15,x          ; $e825: b4 15     
            sta $15,x          ; $e827: 95 15     
            tya                ; $e829: 98        
            and #$0f           ; $e82a: 29 0f     
            and $15,x          ; $e82c: 35 15     
            beq __e836         ; $e82e: f0 06     
            ora #$f0           ; $e830: 09 f0     
            and $15,x          ; $e832: 35 15     
            sta $15,x          ; $e834: 95 15     
__e836:     rts                ; $e836: 60        

;-------------------------------------------------------------------------------
            .hex 3f 00 20      ; $e837: 3f 00 20  Invalid Opcode - RLA $2000,x
            .hex 0f 2a 17      ; $e83a: 0f 2a 17  Invalid Opcode - SLO $172a
            .hex 37 0f         ; $e83d: 37 0f     Invalid Opcode - RLA $0f,x
            bmi __e86b         ; $e83f: 30 2a     
            asl $0f,x          ; $e841: 16 0f     
            bmi __e87b         ; $e843: 30 36     
            asl $0f            ; $e845: 06 0f     
            .hex 12            ; $e847: 12        Invalid Opcode - KIL 
            .hex 37 16         ; $e848: 37 16     Invalid Opcode - RLA $16,x
            .hex 0f 30 2a      ; $e84a: 0f 30 2a  Invalid Opcode - SLO $2a30
            asl $0f,x          ; $e84d: 16 0f     
            bmi __e857         ; $e84f: 30 06     
            rol $0f,x          ; $e851: 36 0f     
            rol                ; $e853: 2a        
            .hex 17 37         ; $e854: 17 37     Invalid Opcode - SLO $37,x
            .hex 0f            ; $e856: 0f        Suspected data
__e857:     bmi __e889         ; $e857: 30 30     
            .hex 12            ; $e859: 12        Invalid Opcode - KIL 
            .hex 23 c0         ; $e85a: 23 c0     Invalid Opcode - RLA ($c0,x)
            pha                ; $e85c: 48        
            eor $23,x          ; $e85d: 55 23     
            iny                ; $e85f: c8        
            .hex 04 aa         ; $e860: 04 aa     Invalid Opcode - NOP $aa
            tax                ; $e862: aa        
            bmi __e871         ; $e863: 30 0c     
            .hex 23 cd         ; $e865: 23 cd     Invalid Opcode - RLA ($cd,x)
            .hex 43 05         ; $e867: 43 05     Invalid Opcode - SRE ($05,x)
            .hex 23 d3         ; $e869: 23 d3     Invalid Opcode - RLA ($d3,x)
__e86b:     ora ($10,x)        ; $e86b: 01 10     
            .hex 23 f8         ; $e86d: 23 f8     Invalid Opcode - RLA ($f8,x)
            pha                ; $e86f: 48        
            .hex ff            ; $e870: ff        Suspected data
__e871:     jsr $43a9          ; $e871: 20 a9 43  
            lsr __c820,x       ; $e874: 5e 20 c8  
            .hex 02            ; $e877: 02        Invalid Opcode - KIL 
            pha                ; $e878: 48        
            lsr                ; $e879: 4a        
            .hex 20            ; $e87a: 20        Suspected data
__e87b:     inx                ; $e87b: e8        
            .hex 02            ; $e87c: 02        Invalid Opcode - KIL 
            eor #$4b           ; $e87d: 49 4b     
            jsr __828d         ; $e87f: 20 8d 82  
            .hex 5c 5d 20      ; $e882: 5c 5d 20  Invalid Opcode - NOP $205d,x
            .hex 93 01         ; $e885: 93 01     Invalid Opcode - AHX ($01),y
            .hex 5d 21         ; $e887: 5d 21     Suspected data
__e889:     brk                ; $e889: 00        
            .hex 53 5e         ; $e88a: 53 5e     Invalid Opcode - SRE ($5e),y
            and ($32,x)        ; $e88c: 21 32     
            pha                ; $e88e: 48        
            lsr $2221,x        ; $e88f: 5e 21 22  
            bcc __e8f0         ; $e892: 90 5c     
            .hex 5c 5c 5d      ; $e894: 5c 5c 5d  Invalid Opcode - NOP $5d5c,x
            .hex 5c 5c 5c      ; $e897: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            .hex 5c 5c 5c      ; $e89a: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            eor $5c5c,x        ; $e89d: 5d 5c 5c  
            .hex 5c 5c 5d      ; $e8a0: 5c 5c 5d  Invalid Opcode - NOP $5d5c,x
            and ($25,x)        ; $e8a3: 21 25     
            .hex 8f 5c 5c      ; $e8a5: 8f 5c 5c  Invalid Opcode - SAX $5c5c
            .hex 5c 5c 5c      ; $e8a8: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            .hex 5c 5c 5d      ; $e8ab: 5c 5c 5d  Invalid Opcode - NOP $5d5c,x
            .hex 5c 5c 5c      ; $e8ae: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            .hex 5c 5c 5c      ; $e8b1: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            eor __e821,x       ; $e8b4: 5d 21 e8  
            txa                ; $e8b7: 8a        
            .hex 5c 5c 5c      ; $e8b8: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            eor $5c5c,x        ; $e8bb: 5d 5c 5c  
            .hex 5c 5c 5c      ; $e8be: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            eor $2d21,x        ; $e8c1: 5d 21 2d  
            .hex c7 5c         ; $e8c4: c7 5c     Invalid Opcode - DCP $5c
            .hex 22            ; $e8c6: 22        Invalid Opcode - KIL 
            ora $5d86          ; $e8c7: 0d 86 5d  
            .hex 5c 5c 5c      ; $e8ca: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            .hex 5c 5d 21      ; $e8cd: 5c 5d 21  Invalid Opcode - NOP $215d,x
            and ($89),y        ; $e8d0: 31 89     
            .hex 5c 5c 5c      ; $e8d2: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            .hex 5c 5d 5c      ; $e8d5: 5c 5d 5c  Invalid Opcode - NOP $5c5d,x
            .hex 5c 5c 5d      ; $e8d8: 5c 5c 5d  Invalid Opcode - NOP $5d5c,x
            and ($54,x)        ; $e8db: 21 54     
            sty $5c5c          ; $e8dd: 8c 5c 5c  
            .hex 5c 5c 5d      ; $e8e0: 5c 5c 5d  Invalid Opcode - NOP $5d5c,x
            .hex 5c 5c 5c      ; $e8e3: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            eor $5c5c,x        ; $e8e6: 5d 5c 5c  
            eor $5721,x        ; $e8e9: 5d 21 57  
            txa                ; $e8ec: 8a        
            .hex 5c 5d 5c      ; $e8ed: 5c 5d 5c  Invalid Opcode - NOP $5c5d,x
__e8f0:     .hex 5c 5c 5c      ; $e8f0: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            .hex 5c 5d 5c      ; $e8f3: 5c 5d 5c  Invalid Opcode - NOP $5c5d,x
            eor __da20,x       ; $e8f6: 5d 20 da  
            bcc __e957         ; $e8f9: 90 5c     
            .hex 5c 5c 5c      ; $e8fb: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            .hex 5c 5d 5c      ; $e8fe: 5c 5d 5c  Invalid Opcode - NOP $5c5d,x
            .hex 5c 5c 5c      ; $e901: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            eor $5c5c,x        ; $e904: 5d 5c 5c  
            .hex 5c 5c 5d      ; $e907: 5c 5c 5d  Invalid Opcode - NOP $5d5c,x
            jsr __cadd         ; $e90a: 20 dd ca  
            .hex 5c 22 1d      ; $e90d: 5c 22 1d  Invalid Opcode - NOP $1d22,x
            stx $5d            ; $e910: 86 5d     
            .hex 5c 5c 5c      ; $e912: 5c 5c 5c  Invalid Opcode - NOP $5c5c,x
            .hex 5c 5d 21      ; $e915: 5c 5d 21  Invalid Opcode - NOP $215d,x
            dec $44            ; $e918: c6 44     
            lsr $3822,x        ; $e91a: 5e 22 38  
            pha                ; $e91d: 48        
            lsr $6622,x        ; $e91e: 5e 22 66  
            lsr $5e            ; $e921: 46 5e     
            .hex 23 1a         ; $e923: 23 1a     Invalid Opcode - RLA ($1a,x)
            .hex 04 5f         ; $e925: 04 5f     Invalid Opcode - NOP $5f
            rts                ; $e927: 60        

;-------------------------------------------------------------------------------
            rts                ; $e928: 60        

;-------------------------------------------------------------------------------
            adc ($23,x)        ; $e929: 61 23     
            bit $5f04          ; $e92b: 2c 04 5f  
            rts                ; $e92e: 60        

;-------------------------------------------------------------------------------
            rts                ; $e92f: 60        

;-------------------------------------------------------------------------------
            adc ($23,x)        ; $e930: 61 23     
            and $08,x          ; $e932: 35 08     
            .hex 5f 60 60      ; $e934: 5f 60 60  Invalid Opcode - SRE $6060,x
            adc ($24,x)        ; $e937: 61 24     
            bit $62            ; $e939: 24 62     
            .hex 62            ; $e93b: 62        Invalid Opcode - KIL 
            .hex 23 4d         ; $e93c: 23 4d     Invalid Opcode - RLA ($4d,x)
            .hex 42            ; $e93e: 42        Invalid Opcode - KIL 
            .hex 62            ; $e93f: 62        Invalid Opcode - KIL 
            .hex 23 51         ; $e940: 23 51     Invalid Opcode - RLA ($51,x)
            .hex 03 5f         ; $e942: 03 5f     Invalid Opcode - SLO ($5f,x)
            rts                ; $e944: 60        

;-------------------------------------------------------------------------------
            adc ($23,x)        ; $e945: 61 23     
            lsr $42,x          ; $e947: 56 42     
            .hex 62            ; $e949: 62        Invalid Opcode - KIL 
            .hex 23 5b         ; $e94a: 23 5b     Invalid Opcode - RLA ($5b,x)
            .hex 42            ; $e94c: 42        Invalid Opcode - KIL 
            .hex 62            ; $e94d: 62        Invalid Opcode - KIL 
            .hex 23 60         ; $e94e: 23 60     Invalid Opcode - RLA ($60,x)
            pha                ; $e950: 48        
            rts                ; $e951: 60        

;-------------------------------------------------------------------------------
            .hex 23 68         ; $e952: 23 68     Invalid Opcode - RLA ($68,x)
            ora ($61,x)        ; $e954: 01 61     
            .hex 23            ; $e956: 23        Suspected data
__e957:     adc $6242          ; $e957: 6d 42 62  
            .hex 23 72         ; $e95a: 23 72     Invalid Opcode - RLA ($72,x)
            ora ($62,x)        ; $e95c: 01 62     
            .hex 23 76         ; $e95e: 23 76     Invalid Opcode - RLA ($76,x)
            .hex 42            ; $e960: 42        Invalid Opcode - KIL 
            .hex 62            ; $e961: 62        Invalid Opcode - KIL 
            .hex 23 7b         ; $e962: 23 7b     Invalid Opcode - RLA ($7b,x)
            .hex 42            ; $e964: 42        Invalid Opcode - KIL 
            .hex 62            ; $e965: 62        Invalid Opcode - KIL 
            .hex 23 80         ; $e966: 23 80     Invalid Opcode - RLA ($80,x)
            rts                ; $e968: 60        

;-------------------------------------------------------------------------------
            .hex 63 23         ; $e969: 63 23     Invalid Opcode - RRA ($23,x)
            ldy #$60           ; $e96b: a0 60     
            .hex 64 21         ; $e96d: 64 21     Invalid Opcode - NOP $21
            .hex 44 82         ; $e96f: 44 82     Invalid Opcode - NOP $82
            cli                ; $e971: 58        
            eor $4521,y        ; $e972: 59 21 45  
            .hex 82 5a         ; $e975: 82 5a     Invalid Opcode - NOP #$5a
            .hex 5b 21 4c      ; $e977: 5b 21 4c  Invalid Opcode - SRE $4c21,y
            .hex 82 50         ; $e97a: 82 50     Invalid Opcode - NOP #$50
            eor ($21),y        ; $e97c: 51 21     
            eor __9682         ; $e97e: 4d 82 96  
            .hex 97 21         ; $e981: 97 21     Invalid Opcode - SAX $21,y
            .hex 93 82         ; $e983: 93 82     Invalid Opcode - AHX ($82),y
__e985:     cli                ; $e985: 58        
            eor __9421,y       ; $e986: 59 21 94  
            .hex 82 5a         ; $e989: 82 5a     Invalid Opcode - NOP #$5a
            .hex 5b 22 51      ; $e98b: 5b 22 51  Invalid Opcode - SRE $5122,y
            .hex 82 54         ; $e98e: 82 54     Invalid Opcode - NOP #$54
            eor $22,x          ; $e990: 55 22     
            .hex 52            ; $e992: 52        Invalid Opcode - KIL 
            .hex 82 56         ; $e993: 82 56     Invalid Opcode - NOP #$56
            .hex 57 00         ; $e995: 57 00     Invalid Opcode - SRE $00,x
            .hex 3f 00 04      ; $e997: 3f 00 04  Invalid Opcode - RLA $0400,x
            .hex 0f 21 12      ; $e99a: 0f 21 12  Invalid Opcode - SLO $1221
            .hex 37 3f         ; $e99d: 37 3f     Invalid Opcode - RLA $3f,x
            clc                ; $e99f: 18        
            php                ; $e9a0: 08        
            .hex 0f 30 27      ; $e9a1: 0f 30 27  Invalid Opcode - SLO $2730
            .hex 13 0f         ; $e9a4: 13 0f     Invalid Opcode - SLO ($0f),y
            bmi __e9d4         ; $e9a6: 30 2c     
            .hex 12            ; $e9a8: 12        Invalid Opcode - KIL 
            .hex 23 c0         ; $e9a9: 23 c0     Invalid Opcode - RLA ($c0,x)
            pha                ; $e9ab: 48        
            eor $23,x          ; $e9ac: 55 23     
            cmp #$07           ; $e9ae: c9 07     
            .hex ff ff aa      ; $e9b0: ff ff aa  Invalid Opcode - ISC __aaff,x
            tax                ; $e9b3: aa        
            sbc $05,x          ; $e9b4: f5 05     
            ora $23            ; $e9b6: 05 23     
            .hex da            ; $e9b8: da        Invalid Opcode - NOP 
            .hex 04 10         ; $e9b9: 04 10     Invalid Opcode - NOP $10
            brk                ; $e9bb: 00        
            brk                ; $e9bc: 00        
            rti                ; $e9bd: 40        

;-------------------------------------------------------------------------------
            jsr $0163          ; $e9be: 20 63 01  
            sbc $6b20,x        ; $e9c1: fd 20 6b  
            .hex 03 8d         ; $e9c4: 03 8d     Invalid Opcode - SLO ($8d,x)
            stx $208f          ; $e9c6: 8e 8f 20  
            adc $02,x          ; $e9c9: 75 02     
            .hex fc fd 20      ; $e9cb: fc fd 20  Invalid Opcode - NOP $20fd,x
            sty __8012         ; $e9ce: 8c 12 80  
            bmi __ea07         ; $e9d1: 30 34     
            sec                ; $e9d3: 38        
__e9d4:     .hex 3c 40 44      ; $e9d4: 3c 40 44  Invalid Opcode - NOP $4440,x
            .hex 7f 25 13      ; $e9d7: 7f 25 13  Invalid Opcode - RRA $1325,x
            rol                ; $e9da: 2a        
            rol $27            ; $e9db: 26 27     
            plp                ; $e9dd: 28        
            and #$2a           ; $e9de: 29 2a     
            ora $2d,x          ; $e9e0: 15 2d     
            jsr $13ab          ; $e9e2: 20 ab 13  
            adc $3124,x        ; $e9e5: 7d 24 31  
            and $39,x          ; $e9e8: 35 39     
            and $4541,x        ; $e9ea: 3d 41 45  
            bit $2b            ; $e9ed: 24 2b     
            bit $2c            ; $e9ef: 24 2c     
            bit $24            ; $e9f1: 24 24     
            bit $24            ; $e9f3: 24 24     
            bit $2f24          ; $e9f5: 2c 24 2f  
            jsr $0cca          ; $e9f8: 20 ca 0c  
            adc __8024,x       ; $e9fb: 7d 24 80  
            .hex 32            ; $e9fe: 32        Invalid Opcode - KIL 
            rol $3a,x          ; $e9ff: 36 3a     
            rol $4642,x        ; $ea01: 3e 42 46  
            .hex 7f 24 7e      ; $ea04: 7f 24 7e  Invalid Opcode - RRA $7e24,x
__ea07:     jsr $0ee9          ; $ea07: 20 e9 0e  
            pla                ; $ea0a: 68        
            bit $68            ; $ea0b: 24 68     
            bit $33            ; $ea0d: 24 33     
            .hex 37 3b         ; $ea0f: 37 3b     Invalid Opcode - RLA $3b,x
            .hex 3f 43 47      ; $ea11: 3f 43 47  Invalid Opcode - RLA $4743,x
            bit $68            ; $ea14: 24 68     
            bit $68            ; $ea16: 24 68     
            jsr $02c4          ; $ea18: 20 c4 02  
            pha                ; $ea1b: 48        
            lsr                ; $ea1c: 4a        
            jsr $02e4          ; $ea1d: 20 e4 02  
            eor #$4b           ; $ea20: 49 4b     
            and ($02,x)        ; $ea22: 21 02     
            .hex 1c 69 69      ; $ea24: 1c 69 69  Invalid Opcode - NOP $6969,x
            adc #$6b           ; $ea27: 69 6b     
            adc #$69           ; $ea29: 69 69     
            adc #$69           ; $ea2b: 69 69     
            adc #$6b           ; $ea2d: 69 6b     
            adc #$69           ; $ea2f: 69 69     
            .hex 6b 69         ; $ea31: 6b 69     Invalid Opcode - ARR #$69
            adc #$6b           ; $ea33: 69 6b     
            adc #$69           ; $ea35: 69 69     
            .hex 6b 69         ; $ea37: 6b 69     Invalid Opcode - ARR #$69
            adc #$69           ; $ea39: 69 69     
            adc #$69           ; $ea3b: 69 69     
            .hex 6b 69         ; $ea3d: 6b 69     Invalid Opcode - ARR #$69
            adc #$69           ; $ea3f: 69 69     
            and ($22,x)        ; $ea41: 21 22     
            .hex 1c 6a 6a      ; $ea43: 1c 6a 6a  Invalid Opcode - NOP $6a6a,x
            ror                ; $ea46: 6a        
            jmp ($6a6a)        ; $ea47: 6c 6a 6a  

;-------------------------------------------------------------------------------
            ror                ; $ea4a: 6a        
            ror                ; $ea4b: 6a        
            ror                ; $ea4c: 6a        
            jmp ($6a6a)        ; $ea4d: 6c 6a 6a  

;-------------------------------------------------------------------------------
            jmp ($6a6a)        ; $ea50: 6c 6a 6a  

;-------------------------------------------------------------------------------
            jmp ($6a6a)        ; $ea53: 6c 6a 6a  

;-------------------------------------------------------------------------------
            jmp ($6a6a)        ; $ea56: 6c 6a 6a  

;-------------------------------------------------------------------------------
            ror                ; $ea59: 6a        
            ror                ; $ea5a: 6a        
            ror                ; $ea5b: 6a        
            jmp ($6a6a)        ; $ea5c: 6c 6a 6a  

;-------------------------------------------------------------------------------
            ror                ; $ea5f: 6a        
            and ($42,x)        ; $ea60: 21 42     
            cmp ($67),y        ; $ea62: d1 67     
__ea64:     and ($5d,x)        ; $ea64: 21 5d     
            cmp ($67),y        ; $ea66: d1 67     
            and ($45,x)        ; $ea68: 21 45     
            .hex cf 65 21      ; $ea6a: cf 65 21  Invalid Opcode - DCP $2165
            pha                ; $ea6d: 48        
            .hex cf 65 21      ; $ea6e: cf 65 21  Invalid Opcode - DCP $2165
            .hex 4b cf         ; $ea71: 4b cf     Invalid Opcode - ALR #$cf
            adc $21            ; $ea73: 65 21     
            lsr $65cf          ; $ea75: 4e cf 65  
            and ($51,x)        ; $ea78: 21 51     
            .hex cf 65 21      ; $ea7a: cf 65 21  Invalid Opcode - DCP $2165
            .hex 54 cf         ; $ea7d: 54 cf     Invalid Opcode - NOP $cf,x
            adc $21            ; $ea7f: 65 21     
            .hex 57 cf         ; $ea81: 57 cf     Invalid Opcode - SRE $cf,x
            adc $21            ; $ea83: 65 21     
            .hex 5a            ; $ea85: 5a        Invalid Opcode - NOP 
            .hex cf 65 23      ; $ea86: cf 65 23  Invalid Opcode - DCP $2365
            ora $16            ; $ea89: 05 16     
            ror $24            ; $ea8b: 66 24     
            bit $66            ; $ea8d: 24 66     
            bit $24            ; $ea8f: 24 24     
            ror $24            ; $ea91: 66 24     
            bit $66            ; $ea93: 24 66     
            bit $24            ; $ea95: 24 24     
            ror $24            ; $ea97: 66 24     
            bit $66            ; $ea99: 24 66     
            bit $24            ; $ea9b: 24 24     
            ror $24            ; $ea9d: 66 24     
            bit $66            ; $ea9f: 24 66     
            .hex 23 60         ; $eaa1: 23 60     Invalid Opcode - RLA ($60,x)
            rts                ; $eaa3: 60        

;-------------------------------------------------------------------------------
            adc #$21           ; $eaa4: 69 21     
            iny                ; $eaa6: c8        
            .hex 02            ; $eaa7: 02        Invalid Opcode - KIL 
            bvc __eafc         ; $eaa8: 50 52     
            and ($e8,x)        ; $eaaa: 21 e8     
            .hex 02            ; $eaac: 02        Invalid Opcode - KIL 
            eor ($53),y        ; $eaad: 51 53     
            and ($d6,x)        ; $eaaf: 21 d6     
            .hex 02            ; $eab1: 02        Invalid Opcode - KIL 
            bvc __eb06         ; $eab2: 50 52     
            and ($f6,x)        ; $eab4: 21 f6     
            .hex 02            ; $eab6: 02        Invalid Opcode - KIL 
            eor ($53),y        ; $eab7: 51 53     
            .hex 22            ; $eab9: 22        Invalid Opcode - KIL 
            cpy $03            ; $eaba: c4 03     
            adc $716f          ; $eabc: 6d 6f 71  
            .hex 22            ; $eabf: 22        Invalid Opcode - KIL 
            cpx $03            ; $eac0: e4 03     
            ror $7270          ; $eac2: 6e 70 72  
            .hex 22            ; $eac5: 22        Invalid Opcode - KIL 
            cmp $6d03,y        ; $eac6: d9 03 6d  
            .hex 6f 71 22      ; $eac9: 6f 71 22  Invalid Opcode - RRA $2271
            sbc $6e03,y        ; $eacc: f9 03 6e  
            bvs __eb43         ; $eacf: 70 72     
            .hex 22            ; $ead1: 22        Invalid Opcode - KIL 
            dex                ; $ead2: ca        
            .hex 0c 6d 6f      ; $ead3: 0c 6d 6f  Invalid Opcode - NOP $6f6d
            adc ($6d),y        ; $ead6: 71 6d     
            .hex 6f 71 6d      ; $ead8: 6f 71 6d  Invalid Opcode - RRA $6d71
            .hex 6f 71 6d      ; $eadb: 6f 71 6d  Invalid Opcode - RRA $6d71
            .hex 6f 71 22      ; $eade: 6f 71 22  Invalid Opcode - RRA $2271
            nop                ; $eae1: ea        
            .hex 0c 6e 70      ; $eae2: 0c 6e 70  Invalid Opcode - NOP $706e
            .hex 72            ; $eae5: 72        Invalid Opcode - KIL 
            .hex 6e            ; $eae6: 6e        Suspected data
__eae7:     bvs __eb5b         ; $eae7: 70 72     
            ror $7270          ; $eae9: 6e 70 72  
            ror $7270          ; $eaec: 6e 70 72  
            brk                ; $eaef: 00        
            .hex 3f 00 04      ; $eaf0: 3f 00 04  Invalid Opcode - RLA $0400,x
            .hex 0f 30 13      ; $eaf3: 0f 30 13  Invalid Opcode - SLO $1330
            .hex 22            ; $eaf6: 22        Invalid Opcode - KIL 
            .hex 3f 18 08      ; $eaf7: 3f 18 08  Invalid Opcode - RLA $0818,x
            .hex 0f 30         ; $eafa: 0f 30     Suspected data
__eafc:     .hex 27 15         ; $eafc: 27 15     Invalid Opcode - RLA $15
            .hex 0f 30 2c      ; $eafe: 0f 30 2c  Invalid Opcode - SLO $2c30
            .hex 02            ; $eb01: 02        Invalid Opcode - KIL 
            .hex 23 c0         ; $eb02: 23 c0     Invalid Opcode - RLA ($c0,x)
            pha                ; $eb04: 48        
            .hex 55            ; $eb05: 55        Suspected data
__eb06:     .hex 23 c8         ; $eb06: 23 c8     Invalid Opcode - RLA ($c8,x)
            php                ; $eb08: 08        
            tax                ; $eb09: aa        
            tax                ; $eb0a: aa        
            beq __eb19         ; $eb0b: f0 0c     
            brk                ; $eb0d: 00        
            ora $05            ; $eb0e: 05 05     
            ora $23            ; $eb10: 05 23     
            .hex d3 01         ; $eb12: d3 01     Invalid Opcode - DCP ($01),y
            rti                ; $eb14: 40        

;-------------------------------------------------------------------------------
            .hex 23 e4         ; $eb15: 23 e4     Invalid Opcode - RLA ($e4,x)
            ora ($04,x)        ; $eb17: 01 04     
__eb19:     .hex 23 eb         ; $eb19: 23 eb     Invalid Opcode - RLA ($eb,x)
            ora ($01,x)        ; $eb1b: 01 01     
            jsr __c28d         ; $eb1d: 20 8d c2  
            .hex 7a            ; $eb20: 7a        Invalid Opcode - NOP 
            jsr $03a9          ; $eb21: 20 a9 03  
            adc $75,x          ; $eb24: 75 75     
            .hex 77 20         ; $eb26: 77 20     Invalid Opcode - RRA $20,x
            iny                ; $eb28: c8        
            .hex 03 98         ; $eb29: 03 98     Invalid Opcode - SLO ($98,x)
            txs                ; $eb2b: 9a        
            sta ($20,x)        ; $eb2c: 81 20     
            inx                ; $eb2e: e8        
            .hex 04 99         ; $eb2f: 04 99     Invalid Opcode - NOP $99
            .hex 9b            ; $eb31: 9b        Invalid Opcode - TAS 
            .hex 82 83         ; $eb32: 82 83     Invalid Opcode - NOP #$83
            and ($03,x)        ; $eb34: 21 03     
            eor $75,x          ; $eb36: 55 75     
            and ($23,x)        ; $eb38: 21 23     
            eor $76,x          ; $eb3a: 55 76     
            and ($02,x)        ; $eb3c: 21 02     
            .hex 82 73         ; $eb3e: 82 73     Invalid Opcode - NOP #$73
            .hex 74 21         ; $eb40: 74 21     Invalid Opcode - NOP $21,x
            .hex 05            ; $eb42: 05        Suspected data
__eb43:     .hex 03 77         ; $eb43: 03 77     Invalid Opcode - SLO ($77,x)
            bit $73            ; $eb45: 24 73     
            and ($25,x)        ; $eb47: 21 25     
            .hex 03 78         ; $eb49: 03 78     Invalid Opcode - SLO ($78,x)
            bit $74            ; $eb4b: 24 74     
            and ($18,x)        ; $eb4d: 21 18     
            .hex 82 77         ; $eb4f: 82 77     Invalid Opcode - NOP #$77
            sei                ; $eb51: 78        
            and ($28,x)        ; $eb52: 21 28     
            sty $7c7b          ; $eb54: 8c 7b 7c  
            .hex 7c 7c 7c      ; $eb57: 7c 7c 7c  Invalid Opcode - NOP $7c7c,x
            .hex 75            ; $eb5a: 75        Suspected data
__eb5b:     .hex 7b 7c 7c      ; $eb5b: 7b 7c 7c  Invalid Opcode - RRA $7c7c,y
            .hex 7c 75 7b      ; $eb5e: 7c 75 7b  Invalid Opcode - NOP $7b75,x
            and ($2c,x)        ; $eb61: 21 2c     
            sta $7b            ; $eb63: 85 7b     
            .hex 7c 7c 7c      ; $eb65: 7c 7c 7c  Invalid Opcode - NOP $7c7c,x
            .hex 7c 21 33      ; $eb68: 7c 21 33  Invalid Opcode - NOP $3321,x
            sta $7b            ; $eb6b: 85 7b     
            .hex 7c 7c 7c      ; $eb6d: 7c 7c 7c  Invalid Opcode - NOP $7c7c,x
            .hex 7c 21 37      ; $eb70: 7c 21 37  Invalid Opcode - NOP $3721,x
            sta $7b            ; $eb73: 85 7b     
            .hex 7c 7c 7c      ; $eb75: 7c 7c 7c  Invalid Opcode - NOP $7c7c,x
            .hex 7c 21 42      ; $eb78: 7c 21 42  Invalid Opcode - NOP $4221,x
            .hex cf 8b 21      ; $eb7b: cf 8b 21  Invalid Opcode - DCP $218b
            eor $cf            ; $eb7e: 45 cf     
            .hex 7a            ; $eb80: 7a        Invalid Opcode - NOP 
            jsr __d3da         ; $eb81: 20 da d3  
            .hex 8b 20         ; $eb84: 8b 20     Invalid Opcode - XAA #$20
            cmp $7ad3,x        ; $eb86: dd d3 7a  
            and ($c8,x)        ; $eb89: 21 c8     
            bvc __ec02         ; $eb8b: 50 75     
            and ($d8,x)        ; $eb8d: 21 d8     
            asl $77            ; $eb8f: 06 77     
            bit $73            ; $eb91: 24 73     
            adc $75,x          ; $eb93: 75 75     
            .hex 77 21         ; $eb95: 77 21     Invalid Opcode - RRA $21,x
            .hex f7 07         ; $eb97: f7 07     Invalid Opcode - ISC $07,x
            .hex 7b 78 24      ; $eb99: 7b 78 24  Invalid Opcode - RRA $2478,y
            .hex 74 76         ; $eb9c: 74 76     Invalid Opcode - NOP $76,x
            ror $78,x          ; $eb9e: 76 78     
            and ($c7,x)        ; $eba0: 21 c7     
            .hex 82 73         ; $eba2: 82 73     Invalid Opcode - NOP #$73
            .hex 74 21         ; $eba4: 74 21     Invalid Opcode - NOP $21,x
            sbc #$4e           ; $eba6: e9 4e     
            adc $6322,y        ; $eba8: 79 22 63  
            eor $75,x          ; $ebab: 55 75     
            .hex 22            ; $ebad: 22        Invalid Opcode - KIL 
            .hex 62            ; $ebae: 62        Invalid Opcode - KIL 
            .hex 82 73         ; $ebaf: 82 73     Invalid Opcode - NOP #$73
            .hex 74 22         ; $ebb1: 74 22     Invalid Opcode - NOP $22,x
            .hex 83 05         ; $ebb3: 83 05     Invalid Opcode - SAX ($05,x)
            ror $76,x          ; $ebb5: 76 76     
            sei                ; $ebb7: 78        
            bit $74            ; $ebb8: 24 74     
            .hex 22            ; $ebba: 22        Invalid Opcode - KIL 
            adc $03            ; $ebbb: 65 03     
            .hex 77 24         ; $ebbd: 77 24     Invalid Opcode - RRA $24,x
            .hex 73 22         ; $ebbf: 73 22     Invalid Opcode - RRA ($22),y
            .hex 89 4e         ; $ebc1: 89 4e     Invalid Opcode - NOP #$4e
            adc $7822,y        ; $ebc3: 79 22 78  
            .hex 82 77         ; $ebc6: 82 77     Invalid Opcode - NOP #$77
            sei                ; $ebc8: 78        
            .hex 22            ; $ebc9: 22        Invalid Opcode - KIL 
            .hex 97 86         ; $ebca: 97 86     Invalid Opcode - SAX $86,y
            .hex 7b 7c 7c      ; $ebcc: 7b 7c 7c  Invalid Opcode - RRA $7c7c,y
            .hex 7c 75 7b      ; $ebcf: 7c 75 7b  Invalid Opcode - NOP $7b75,x
            .hex 23 07         ; $ebd2: 23 07     Invalid Opcode - RLA ($07,x)
            .hex 82 73         ; $ebd4: 82 73     Invalid Opcode - NOP #$73
            .hex 74 23         ; $ebd6: 74 23     Invalid Opcode - NOP $23,x
            plp                ; $ebd8: 28        
            .hex 83 7b         ; $ebd9: 83 7b     Invalid Opcode - SAX ($7b,x)
            .hex 7c 77 23      ; $ebdb: 7c 77 23  Invalid Opcode - NOP $2377,x
            php                ; $ebde: 08        
            bvc __ec56         ; $ebdf: 50 75     
            .hex 23 29         ; $ebe1: 23 29     Invalid Opcode - RLA ($29,x)
            lsr $2379          ; $ebe3: 4e 79 23  
            .hex 37 01         ; $ebe6: 37 01     Invalid Opcode - RLA $01,x
            .hex 7b 23 18      ; $ebe8: 7b 23 18  Invalid Opcode - RRA $1823,y
            .hex 82 77         ; $ebeb: 82 77     Invalid Opcode - NOP #$77
            sei                ; $ebed: 78        
            .hex 23 62         ; $ebee: 23 62     Invalid Opcode - RLA ($62,x)
            ora ($73,x)        ; $ebf0: 01 73     
            .hex 23 63         ; $ebf2: 23 63     Invalid Opcode - RLA ($63,x)
            eor $75            ; $ebf4: 45 75     
            and ($4e,x)        ; $ebf6: 21 4e     
            .hex 02            ; $ebf8: 02        Invalid Opcode - KIL 
            bvc __ec4d         ; $ebf9: 50 52     
            and ($6e,x)        ; $ebfb: 21 6e     
            .hex 02            ; $ebfd: 02        Invalid Opcode - KIL 
            eor ($53),y        ; $ebfe: 51 53     
            .hex 22            ; $ec00: 22        Invalid Opcode - KIL 
            .hex 12            ; $ec01: 12        Invalid Opcode - KIL 
__ec02:     .hex 02            ; $ec02: 02        Invalid Opcode - KIL 
            bvc __ec57         ; $ec03: 50 52     
            .hex 22            ; $ec05: 22        Invalid Opcode - KIL 
            .hex 32            ; $ec06: 32        Invalid Opcode - KIL 
            .hex 02            ; $ec07: 02        Invalid Opcode - KIL 
            eor ($53),y        ; $ec08: 51 53     
            .hex 22            ; $ec0a: 22        Invalid Opcode - KIL 
            sty $5002          ; $ec0b: 8c 02 50  
            .hex 52            ; $ec0e: 52        Invalid Opcode - KIL 
            .hex 22            ; $ec0f: 22        Invalid Opcode - KIL 
            ldy $5102          ; $ec10: ac 02 51  
            .hex 53 00         ; $ec13: 53 00     Invalid Opcode - SRE ($00),y
            .hex 3f 00 04      ; $ec15: 3f 00 04  Invalid Opcode - RLA $0400,x
            .hex 0f 2a 17      ; $ec18: 0f 2a 17  Invalid Opcode - SLO $172a
            .hex 37 3f         ; $ec1b: 37 3f     Invalid Opcode - RLA $3f,x
            clc                ; $ec1d: 18        
            php                ; $ec1e: 08        
            .hex 0f            ; $ec1f: 0f        Suspected data
__ec20:     rol                ; $ec20: 2a        
            .hex 27 38         ; $ec21: 27 38     Invalid Opcode - RLA $38
            .hex 0f 30 13      ; $ec23: 0f 30 13  Invalid Opcode - SLO $1330
            .hex 37 23         ; $ec26: 37 23     Invalid Opcode - RLA $23,x
            cpy #$48           ; $ec28: c0 48     
            eor $23,x          ; $ec2a: 55 23     
            iny                ; $ec2c: c8        
            php                ; $ec2d: 08        
            tax                ; $ec2e: aa        
            tax                ; $ec2f: aa        
            bmi __ec3e         ; $ec30: 30 0c     
            brk                ; $ec32: 00        
            ora $05            ; $ec33: 05 05     
            ora $23            ; $ec35: 05 23     
            .hex d2            ; $ec37: d2        Invalid Opcode - KIL 
            .hex 82 40         ; $ec38: 82 40     Invalid Opcode - NOP #$40
            bmi __ec5f         ; $ec3a: 30 23     
            .hex e7 01         ; $ec3c: e7 01     Invalid Opcode - ISC $01
__ec3e:     .hex 03 20         ; $ec3e: 03 20     Invalid Opcode - SLO ($20,x)
            sta $6582          ; $ec40: 8d 82 65  
            ror $20            ; $ec43: 66 20     
            .hex 93 01         ; $ec45: 93 01     Invalid Opcode - AHX ($01),y
            ror $20            ; $ec47: 66 20     
            lda #$43           ; $ec49: a9 43     
            .hex 5e 20         ; $ec4b: 5e 20     Suspected data
__ec4d:     iny                ; $ec4d: c8        
            .hex 02            ; $ec4e: 02        Invalid Opcode - KIL 
            pha                ; $ec4f: 48        
            lsr                ; $ec50: 4a        
            jsr $02e8          ; $ec51: 20 e8 02  
            eor #$4b           ; $ec54: 49 4b     
__ec56:     .hex 21            ; $ec56: 21        Suspected data
__ec57:     brk                ; $ec57: 00        
            eor $5e,x          ; $ec58: 55 5e     
            and ($17,x)        ; $ec5a: 21 17     
            .hex 43 5e         ; $ec5c: 43 5e     Invalid Opcode - SRE ($5e,x)
            .hex 21            ; $ec5e: 21        Suspected data
__ec5f:     .hex c3 d0         ; $ec5f: c3 d0     Invalid Opcode - DCP ($d0,x)
            .hex 62            ; $ec61: 62        Invalid Opcode - KIL 
            .hex 23 44         ; $ec62: 23 44     Invalid Opcode - RLA ($44,x)
            cpy $62            ; $ec64: c4 62     
            .hex 23 45         ; $ec66: 23 45     Invalid Opcode - RLA ($45,x)
            cpy $62            ; $ec68: c4 62     
            .hex 22            ; $ec6a: 22        Invalid Opcode - KIL 
            .hex c2 c8         ; $ec6b: c2 c8     Invalid Opcode - NOP #$c8
            .hex 62            ; $ec6d: 62        Invalid Opcode - KIL 
            .hex 22            ; $ec6e: 22        Invalid Opcode - KIL 
            cmp ($c8,x)        ; $ec6f: c1 c8     
            .hex 62            ; $ec71: 62        Invalid Opcode - KIL 
            .hex 22            ; $ec72: 22        Invalid Opcode - KIL 
            cpy #$c8           ; $ec73: c0 c8     
            .hex 62            ; $ec75: 62        Invalid Opcode - KIL 
            .hex 23 4c         ; $ec76: 23 4c     Invalid Opcode - RLA ($4c,x)
            cpy $62            ; $ec78: c4 62     
            .hex 23 4d         ; $ec7a: 23 4d     Invalid Opcode - RLA ($4d,x)
            cpy $62            ; $ec7c: c4 62     
            .hex 23 4e         ; $ec7e: 23 4e     Invalid Opcode - RLA ($4e,x)
            cpy $62            ; $ec80: c4 62     
            .hex 22            ; $ec82: 22        Invalid Opcode - KIL 
            .hex 7b c7 62      ; $ec83: 7b c7 62  Invalid Opcode - RRA $62c7,y
            .hex 22            ; $ec86: 22        Invalid Opcode - KIL 
            .hex 7c c7 62      ; $ec87: 7c c7 62  Invalid Opcode - NOP $62c7,x
            .hex 23 79         ; $ec8a: 23 79     Invalid Opcode - RLA ($79,x)
            .hex 47 62         ; $ec8c: 47 62     Invalid Opcode - SRE $62
            .hex 23 99         ; $ec8e: 23 99     Invalid Opcode - RLA ($99,x)
            .hex 47 62         ; $ec90: 47 62     Invalid Opcode - SRE $62
            .hex 23 b9         ; $ec92: 23 b9     Invalid Opcode - RLA ($b9,x)
            .hex 47 62         ; $ec94: 47 62     Invalid Opcode - SRE $62
            and ($a2,x)        ; $ec96: 21 a2     
            .hex 03 5f         ; $ec98: 03 5f     Invalid Opcode - SLO ($5f,x)
            rts                ; $ec9a: 60        

;-------------------------------------------------------------------------------
            adc ($22,x)        ; $ec9b: 61 22     
            .hex 5a            ; $ec9d: 5a        Invalid Opcode - NOP 
            .hex 04 5f         ; $ec9e: 04 5f     Invalid Opcode - NOP $5f
            rts                ; $eca0: 60        

;-------------------------------------------------------------------------------
            rts                ; $eca1: 60        

;-------------------------------------------------------------------------------
            adc ($22,x)        ; $eca2: 61 22     
            ldy #$44           ; $eca4: a0 44     
            rts                ; $eca6: 60        

;-------------------------------------------------------------------------------
            .hex 22            ; $eca7: 22        Invalid Opcode - KIL 
            ldy $01            ; $eca8: a4 01     
            adc ($22,x)        ; $ecaa: 61 22     
            ldx $04,y          ; $ecac: b6 04     
            .hex 5f 60 60      ; $ecae: 5f 60 60  Invalid Opcode - SRE $6060,x
            adc ($23,x)        ; $ecb1: 61 23     
            jsr $6046          ; $ecb3: 20 46 60  
            .hex 23 26         ; $ecb6: 23 26     Invalid Opcode - RLA ($26,x)
            ora ($61,x)        ; $ecb8: 01 61     
            .hex 23 2b         ; $ecba: 23 2b     Invalid Opcode - RLA ($2b,x)
            ora $5f            ; $ecbc: 05 5f     
            rts                ; $ecbe: 60        

;-------------------------------------------------------------------------------
            rts                ; $ecbf: 60        

;-------------------------------------------------------------------------------
            rts                ; $ecc0: 60        

;-------------------------------------------------------------------------------
            adc ($23,x)        ; $ecc1: 61 23     
            cli                ; $ecc3: 58        
            ora ($5f,x)        ; $ecc4: 01 5f     
            .hex 23 59         ; $ecc6: 23 59     Invalid Opcode - RLA ($59,x)
            .hex 47 60         ; $ecc8: 47 60     Invalid Opcode - SRE $60
            .hex 22            ; $ecca: 22        Invalid Opcode - KIL 
            .hex 27 55         ; $eccb: 27 55     Invalid Opcode - RLA $55
            sty $22            ; $eccd: 84 22     
            .hex 1c 82 85      ; $eccf: 1c 82 85  Invalid Opcode - NOP __8582,x
            stx $22            ; $ecd2: 86 22     
            ora __8782,x       ; $ecd4: 1d 82 87  
            dey                ; $ecd7: 88        
            and ($22,x)        ; $ecd8: 21 22     
            .hex 83 65         ; $ecda: 83 65     Invalid Opcode - SAX ($65,x)
            adc $66            ; $ecdc: 65 66     
            and ($c2,x)        ; $ecde: 21 c2     
            cmp $65            ; $ece0: c5 65     
            .hex 22            ; $ece2: 22        Invalid Opcode - KIL 
            .hex 62            ; $ece3: 62        Invalid Opcode - KIL 
            ora ($66,x)        ; $ece4: 01 66     
            and ($25,x)        ; $ece6: 21 25     
            dex                ; $ece8: ca        
            adc $22            ; $ece9: 65 22     
            adc $01            ; $eceb: 65 01     
            ror $21            ; $eced: 66 21     
            plp                ; $ecef: 28        
            .hex c7 65         ; $ecf0: c7 65     Invalid Opcode - DCP $65
            .hex 22            ; $ecf2: 22        Invalid Opcode - KIL 
            php                ; $ecf3: 08        
            ora ($66,x)        ; $ecf4: 01 66     
            and ($2b,x)        ; $ecf6: 21 2b     
            sta $65            ; $ecf8: 85 65     
            sty $95,x          ; $ecfa: 94 95     
            adc $66            ; $ecfc: 65 66     
            and ($4a,x)        ; $ecfe: 21 4a     
__ed00:     .hex 82 50         ; $ed00: 82 50     Invalid Opcode - NOP #$50
            eor ($21),y        ; $ed02: 51 21     
            rol $65c5          ; $ed04: 2e c5 65  
            and ($ce,x)        ; $ed07: 21 ce     
            ora ($66,x)        ; $ed09: 01 66     
            and ($31,x)        ; $ed0b: 21 31     
            sta $65            ; $ed0d: 85 65     
            adc $65            ; $ed0f: 65 65     
            adc $66            ; $ed11: 65 66     
            and ($34,x)        ; $ed13: 21 34     
            dey                ; $ed15: 88        
            adc $65            ; $ed16: 65 65     
            adc $65            ; $ed18: 65 65     
            adc $90            ; $ed1a: 65 90     
            sta ($66),y        ; $ed1c: 91 66     
            and ($d3,x)        ; $ed1e: 21 d3     
            .hex 82 58         ; $ed20: 82 58     Invalid Opcode - NOP #$58
            eor $3721,y        ; $ed22: 59 21 37  
            sta $65            ; $ed25: 85 65     
            adc $65            ; $ed27: 65 65     
            adc $66            ; $ed29: 65 66     
            jsr __c7da         ; $ed2b: 20 da c7  
            adc $21            ; $ed2e: 65 21     
            tsx                ; $ed30: ba        
            ora ($66,x)        ; $ed31: 01 66     
            jsr __c7dd         ; $ed33: 20 dd c7  
            adc $21            ; $ed36: 65 21     
            lda $6601,x        ; $ed38: bd 01 66  
            and ($46,x)        ; $ed3b: 21 46     
            .hex 82 56         ; $ed3d: 82 56     Invalid Opcode - NOP #$56
            .hex 57 21         ; $ed3f: 57 21     Invalid Opcode - SRE $21,x
            eor $82            ; $ed41: 45 82     
            .hex 92            ; $ed43: 92        Invalid Opcode - KIL 
            .hex 93 22         ; $ed44: 93 22     Invalid Opcode - AHX ($22),y
            .hex 7a            ; $ed46: 7a        Invalid Opcode - NOP 
            sta $65            ; $ed47: 85 65     
            adc $65            ; $ed49: 65 65     
            adc $66            ; $ed4b: 65 66     
            .hex 22            ; $ed4d: 22        Invalid Opcode - KIL 
            adc $6585,x        ; $ed4e: 7d 85 65  
            adc $65            ; $ed51: 65 65     
            adc $66            ; $ed53: 65 66     
            .hex 23 88         ; $ed55: 23 88     Invalid Opcode - RLA ($88,x)
            .hex 02            ; $ed57: 02        Invalid Opcode - KIL 
            .hex 5f 61 23      ; $ed58: 5f 61 23  Invalid Opcode - SRE $2361,x
            tay                ; $ed5b: a8        
            .hex 42            ; $ed5c: 42        Invalid Opcode - KIL 
            .hex 62            ; $ed5d: 62        Invalid Opcode - KIL 
            brk                ; $ed5e: 00        
            jsr $0163          ; $ed5f: 20 63 01  
            sbc $6b20,x        ; $ed62: fd 20 6b  
            .hex 03 8d         ; $ed65: 03 8d     Invalid Opcode - SLO ($8d,x)
            stx $208f          ; $ed67: 8e 8f 20  
            adc $02,x          ; $ed6a: 75 02     
            .hex fc fd 20      ; $ed6c: fc fd 20  Invalid Opcode - NOP $20fd,x
            sty $0a,x          ; $ed6f: 94 0a     
            and $13            ; $ed71: 25 13     
            rol                ; $ed73: 2a        
            rol $27            ; $ed74: 26 27     
            plp                ; $ed76: 28        
            and #$2a           ; $ed77: 29 2a     
            ora $2d,x          ; $ed79: 15 2d     
            jsr $0ab4          ; $ed7b: 20 b4 0a  
            .hex 2b 24         ; $ed7e: 2b 24     Invalid Opcode - ANC #$24
            bit $2424          ; $ed80: 2c 24 24  
            bit $24            ; $ed83: 24 24     
            bit $2f24          ; $ed85: 2c 24 2f  
            jsr $0682          ; $ed88: 20 82 06  
            bmi __edc1         ; $ed8b: 30 34     
            sec                ; $ed8d: 38        
            .hex 3c 40 44      ; $ed8e: 3c 40 44  Invalid Opcode - NOP $4440,x
            jsr $06a2          ; $ed91: 20 a2 06  
            and ($35),y        ; $ed94: 31 35     
            and $413d,y        ; $ed96: 39 3d 41  
            eor $20            ; $ed99: 45 20     
            stx $4c82          ; $ed9b: 8e 82 4c  
            eor __8f20         ; $ed9e: 4d 20 8f  
            .hex 82 4e         ; $eda1: 82 4e     Invalid Opcode - NOP #$4e
            .hex 4f 20 c2      ; $eda3: 4f 20 c2  Invalid Opcode - SRE __c220
            asl $32            ; $eda6: 06 32     
            rol $3a,x          ; $eda8: 36 3a     
            rol $4642,x        ; $edaa: 3e 42 46  
            jsr $06e2          ; $edad: 20 e2 06  
            .hex 33 37         ; $edb0: 33 37     Invalid Opcode - RLA ($37),y
            .hex 3b 3f 43      ; $edb2: 3b 3f 43  Invalid Opcode - RLA $433f,y
            .hex 47 00         ; $edb5: 47 00     Invalid Opcode - SRE $00

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      cld                ; $edb7: d8        
            sei                ; $edb8: 78        
__edb9:     lda $2002          ; $edb9: ad 02 20  
            bpl __edb9         ; $edbc: 10 fb     
__edbe:     lda $2002          ; $edbe: ad 02 20  
__edc1:     bpl __edbe         ; $edc1: 10 fb     
            ldx #$00           ; $edc3: a2 00     
            stx $2000          ; $edc5: 8e 00 20  
            stx $2001          ; $edc8: 8e 01 20  
            dex                ; $edcb: ca        
            txs                ; $edcc: 9a        
            lda #$01           ; $edcd: a9 01     
            jsr __effe         ; $edcf: 20 fe ef  
            lda $0112          ; $edd2: ad 12 01  
            cmp #$4b           ; $edd5: c9 4b     
            bne __eded         ; $edd7: d0 14     
            lda $0113          ; $edd9: ad 13 01  
            cmp #$45           ; $eddc: c9 45     
            bne __eded         ; $edde: d0 0d     
            lda $0114          ; $ede0: ad 14 01  
            cmp #$4e           ; $ede3: c9 4e     
            bne __eded         ; $ede5: d0 06     
            jsr __f043         ; $ede7: 20 43 f0  
            jmp __ee07         ; $edea: 4c 07 ee  

;-------------------------------------------------------------------------------
__eded:     ldx #$00           ; $eded: a2 00     
            txa                ; $edef: 8a        
__edf0:     sta $00,x          ; $edf0: 95 00     
            sta $0100,x        ; $edf2: 9d 00 01  
            sta $0300,x        ; $edf5: 9d 00 03  
            sta $0400,x        ; $edf8: 9d 00 04  
            sta $0500,x        ; $edfb: 9d 00 05  
            .hex 9d 00         ; $edfe: 9d 00     Suspected data
__ee00:     asl $9d            ; $ee00: 06 9d     
            brk                ; $ee02: 00        
            .hex 07 e8         ; $ee03: 07 e8     Invalid Opcode - SLO $e8
            bne __edf0         ; $ee05: d0 e9     
__ee07:     jsr __8ac0         ; $ee07: 20 c0 8a  
            jsr __8ac9         ; $ee0a: 20 c9 8a  
            lda #$4b           ; $ee0d: a9 4b     
            sta $0112          ; $ee0f: 8d 12 01  
            lda #$45           ; $ee12: a9 45     
            sta $0113          ; $ee14: 8d 13 01  
            lda #$4e           ; $ee17: a9 4e     
            sta $0114          ; $ee19: 8d 14 01  
            lda #$98           ; $ee1c: a9 98     
            sta $2000          ; $ee1e: 8d 00 20  
            sta $10            ; $ee21: 85 10     
            lda #$00           ; $ee23: a9 00     
            sta $4011          ; $ee25: 8d 11 40  
            sta $0104          ; $ee28: 8d 04 01  
            sta $0105          ; $ee2b: 8d 05 01  
            sta $0106          ; $ee2e: 8d 06 01  
            sta $0109          ; $ee31: 8d 09 01  
            lda #$41           ; $ee34: a9 41     
            sta $0103          ; $ee36: 8d 03 01  
__ee39:     jsr __e7ca         ; $ee39: 20 ca e7  
            jmp __ee39         ; $ee3c: 4c 39 ee  

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        bit $0103          ; $ee3f: 2c 03 01  
            bvs __ee4c         ; $ee42: 70 08     
            bmi __ee49         ; $ee44: 30 03     
            jmp __87f6         ; $ee46: 4c f6 87  

;-------------------------------------------------------------------------------
__ee49:     jmp __bd6d         ; $ee49: 4c 6d bd  

;-------------------------------------------------------------------------------
__ee4c:     pha                ; $ee4c: 48        
            tya                ; $ee4d: 98        
            pha                ; $ee4e: 48        
            txa                ; $ee4f: 8a        
            pha                ; $ee50: 48        
            lda $10            ; $ee51: a5 10     
            and #$7f           ; $ee53: 29 7f     
            sta $2000          ; $ee55: 8d 00 20  
            sta $10            ; $ee58: 85 10     
            jsr __e483         ; $ee5a: 20 83 e4  
            jsr __e46f         ; $ee5d: 20 6f e4  
            lda $12            ; $ee60: a5 12     
            sta $2005          ; $ee62: 8d 05 20  
            lda $13            ; $ee65: a5 13     
            sta $2005          ; $ee67: 8d 05 20  
            lda $11            ; $ee6a: a5 11     
            sta $2001          ; $ee6c: 8d 01 20  
            jsr __c09d         ; $ee6f: 20 9d c0  
            jsr __fff7         ; $ee72: 20 f7 ff  
            jsr __f005         ; $ee75: 20 05 f0  
            jsr __b316         ; $ee78: 20 16 b3  
            jsr __ee8d         ; $ee7b: 20 8d ee  
            lda $10            ; $ee7e: a5 10     
            ora #$80           ; $ee80: 09 80     
            sta $2000          ; $ee82: 8d 00 20  
            sta $10            ; $ee85: 85 10     
            pla                ; $ee87: 68        
            tax                ; $ee88: aa        
            pla                ; $ee89: 68        
            tay                ; $ee8a: a8        
            pla                ; $ee8b: 68        
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        rti                ; $ee8c: 40        

;-------------------------------------------------------------------------------
__ee8d:     ldx $0104          ; $ee8d: ae 04 01  
            beq __ee95         ; $ee90: f0 03     
            jmp __ef0a         ; $ee92: 4c 0a ef  

;-------------------------------------------------------------------------------
__ee95:     jsr __c093         ; $ee95: 20 93 c0  
            lda #$18           ; $ee98: a9 18     
            sta $10            ; $ee9a: 85 10     
            lda #$01           ; $ee9c: a9 01     
            jsr __effe         ; $ee9e: 20 fe ef  
            lda #$97           ; $eea1: a9 97     
            sta $00            ; $eea3: 85 00     
            lda #$f0           ; $eea5: a9 f0     
            sta $01            ; $eea7: 85 01     
            jsr __e50f         ; $eea9: 20 0f e5  
            lda $14            ; $eeac: a5 14     
            pha                ; $eeae: 48        
            jsr __f043         ; $eeaf: 20 43 f0  
            pla                ; $eeb2: 68        
            sta $14            ; $eeb3: 85 14     
            jsr __ef6e         ; $eeb5: 20 6e ef  
            lda #$20           ; $eeb8: a9 20     
            sta $44            ; $eeba: 85 44     
            lda #$80           ; $eebc: a9 80     
            sta $fd            ; $eebe: 85 fd     
            ldy #$40           ; $eec0: a0 40     
            lda $0109          ; $eec2: ad 09 01  
            lsr                ; $eec5: 4a        
            bcc __eeca         ; $eec6: 90 02     
            ldy #$c0           ; $eec8: a0 c0     
__eeca:     .hex 8c 03         ; $eeca: 8c 03     Suspected data
__eecc:     ora ($a0,x)        ; $eecc: 01 a0     
            brk                ; $eece: 00        
            lda $0109          ; $eecf: ad 09 01  
            and #$06           ; $eed2: 29 06     
            bne __eed8         ; $eed4: d0 02     
            ldy #$0f           ; $eed6: a0 0f     
__eed8:     sty $4015          ; $eed8: 8c 15 40  
            inc $0109          ; $eedb: ee 09 01  
            inc $0104          ; $eede: ee 04 01  
            rts                ; $eee1: 60        

;-------------------------------------------------------------------------------
__eee2:     sty $58            ; $eee2: 84 58     
            ldy #$18           ; $eee4: a0 18     
            sty $51            ; $eee6: 84 51     
            ldy #$01           ; $eee8: a0 01     
            sty $4e            ; $eeea: 84 4e     
            sty $55            ; $eeec: 84 55     
            dey                ; $eeee: 88        
            sty $4f            ; $eeef: 84 4f     
            sty $0103          ; $eef1: 8c 03 01  
            rts                ; $eef4: 60        

;-------------------------------------------------------------------------------
__eef5:     sty $4e            ; $eef5: 84 4e     
            ldy #$18           ; $eef7: a0 18     
            sty $48            ; $eef9: 84 48     
            ldy #$01           ; $eefb: a0 01     
            sty $4c            ; $eefd: 84 4c     
            sty $47            ; $eeff: 84 47     
            dey                ; $ef01: 88        
            sty $46            ; $ef02: 84 46     
            ldy #$80           ; $ef04: a0 80     
            sty $0103          ; $ef06: 8c 03 01  
__ef09:     rts                ; $ef09: 60        

;-------------------------------------------------------------------------------
__ef0a:     lda $44            ; $ef0a: a5 44     
            bne __ef1b         ; $ef0c: d0 0d     
            jsr __f067         ; $ef0e: 20 67 f0  
            ldy #$01           ; $ef11: a0 01     
            lda $0109          ; $ef13: ad 09 01  
            lsr                ; $ef16: 4a        
            bcs __eee2         ; $ef17: b0 c9     
            bcc __eef5         ; $ef19: 90 da     
__ef1b:     lda $0107          ; $ef1b: ad 07 01  
            and #$d0           ; $ef1e: 29 d0     
            beq __ef2e         ; $ef20: f0 0c     
            jsr __f067         ; $ef22: 20 67 f0  
            ldy #$00           ; $ef25: a0 00     
            lda $0105          ; $ef27: ad 05 01  
            beq __eee2         ; $ef2a: f0 b6     
            bne __eef5         ; $ef2c: d0 c7     
__ef2e:     lda $0107          ; $ef2e: ad 07 01  
            and #$20           ; $ef31: 29 20     
            beq __ef3f         ; $ef33: f0 0a     
            lda $0105          ; $ef35: ad 05 01  
            eor #$01           ; $ef38: 49 01     
            sta $0105          ; $ef3a: 8d 05 01  
            bpl __ef6e         ; $ef3d: 10 2f     
__ef3f:     lda $15            ; $ef3f: a5 15     
            lsr                ; $ef41: 4a        
            bcc __ef4b         ; $ef42: 90 07     
            lda #$01           ; $ef44: a9 01     
            sta $0105          ; $ef46: 8d 05 01  
            bne __ef6e         ; $ef49: d0 23     
__ef4b:     lsr                ; $ef4b: 4a        
            bcc __ef55         ; $ef4c: 90 07     
            lda #$00           ; $ef4e: a9 00     
            sta $0105          ; $ef50: 8d 05 01  
            beq __ef6e         ; $ef53: f0 19     
__ef55:     lsr                ; $ef55: 4a        
            bcc __ef5e         ; $ef56: 90 06     
            inc $0106          ; $ef58: ee 06 01  
            jmp __ef64         ; $ef5b: 4c 64 ef  

;-------------------------------------------------------------------------------
__ef5e:     lsr                ; $ef5e: 4a        
            bcc __ef09         ; $ef5f: 90 a8     
            dec $0106          ; $ef61: ce 06 01  
__ef64:     lda $0106          ; $ef64: ad 06 01  
            and #$03           ; $ef67: 29 03     
            sta $0106          ; $ef69: 8d 06 01  
            bpl __ef94         ; $ef6c: 10 26     
__ef6e:     lda #$00           ; $ef6e: a9 00     
            ldy $0105          ; $ef70: ac 05 01  
            beq __ef78         ; $ef73: f0 03     
            clc                ; $ef75: 18        
            adc #$11           ; $ef76: 69 11     
__ef78:     tay                ; $ef78: a8        
            lda #$11           ; $ef79: a9 11     
            sta $00            ; $ef7b: 85 00     
            ldx $0330          ; $ef7d: ae 30 03  
__ef80:     lda __f25d,y       ; $ef80: b9 5d f2  
            sta $0331,x        ; $ef83: 9d 31 03  
            inx                ; $ef86: e8        
            iny                ; $ef87: c8        
            dec $00            ; $ef88: c6 00     
            bne __ef80         ; $ef8a: d0 f4     
            lda #$00           ; $ef8c: a9 00     
            sta $0331,x        ; $ef8e: 9d 31 03  
            stx $0330          ; $ef91: 8e 30 03  
__ef94:     lda #$77           ; $ef94: a9 77     
            sta $0200          ; $ef96: 8d 00 02  
            sta $0208          ; $ef99: 8d 08 02  
__ef9c:     lda #$7f           ; $ef9c: a9 7f     
            sta $0204          ; $ef9e: 8d 04 02  
            sta $020c          ; $efa1: 8d 0c 02  
            lda #$25           ; $efa4: a9 25     
            sta $0201          ; $efa6: 8d 01 02  
            lda #$2b           ; $efa9: a9 2b     
            sta $0205          ; $efab: 8d 05 02  
            lda #$2d           ; $efae: a9 2d     
            sta $0209          ; $efb0: 8d 09 02  
            lda #$2f           ; $efb3: a9 2f     
            sta $020d          ; $efb5: 8d 0d 02  
            lda #$00           ; $efb8: a9 00     
            sta $0202          ; $efba: 8d 02 02  
            .hex 8d            ; $efbd: 8d        Suspected data
__efbe:     asl $02            ; $efbe: 06 02     
            sta $020a          ; $efc0: 8d 0a 02  
            sta $020e          ; $efc3: 8d 0e 02  
            sta $0212          ; $efc6: 8d 12 02  
            ldy $0105          ; $efc9: ac 05 01  
            lda __eff6,y       ; $efcc: b9 f6 ef  
            sta $0203          ; $efcf: 8d 03 02  
            sta $0207          ; $efd2: 8d 07 02  
            lda __eff8,y       ; $efd5: b9 f8 ef  
            .hex 8d 0b         ; $efd8: 8d 0b     Suspected data
__efda:     .hex 02            ; $efda: 02        Invalid Opcode - KIL 
            sta $020f          ; $efdb: 8d 0f 02  
            ldy $0106          ; $efde: ac 06 01  
            lda __effa,y       ; $efe1: b9 fa ef  
            sta $0210          ; $efe4: 8d 10 02  
            lda #$fb           ; $efe7: a9 fb     
            sta $0211          ; $efe9: 8d 11 02  
            lda #$38           ; $efec: a9 38     
__efee:     sta $0213          ; $efee: 8d 13 02  
            lda #$40           ; $eff1: a9 40     
            sta $44            ; $eff3: 85 44     
            rts                ; $eff5: 60        

;-------------------------------------------------------------------------------
__eff6:     plp                ; $eff6: 28        
            .hex 80            ; $eff7: 80        Suspected data
__eff8:     bvs __efda         ; $eff8: 70 e0     
__effa:     bcc __ef9c         ; $effa: 90 a0     
            bcs __efbe         ; $effc: b0 c0     
__effe:     tay                ; $effe: a8        
            sta __f003,y       ; $efff: 99 03 f0  
            rts                ; $f002: 60        

;-------------------------------------------------------------------------------
__f003:     brk                ; $f003: 00        
            .hex 01            ; $f004: 01        Suspected data
__f005:     ldy #$01           ; $f005: a0 01     
            sty $4016          ; $f007: 8c 16 40  
            dey                ; $f00a: 88        
            sty $4016          ; $f00b: 8c 16 40  
            ldy #$08           ; $f00e: a0 08     
__f010:     pha                ; $f010: 48        
            lda $4016          ; $f011: ad 16 40  
            sta $00            ; $f014: 85 00     
            lsr                ; $f016: 4a        
            ora $00            ; $f017: 05 00     
            lsr                ; $f019: 4a        
            pla                ; $f01a: 68        
            rol                ; $f01b: 2a        
            dey                ; $f01c: 88        
            bne __f010         ; $f01d: d0 f1     
            ldy $14            ; $f01f: a4 14     
            sty $00            ; $f021: 84 00     
            sta $14            ; $f023: 85 14     
            eor $00            ; $f025: 45 00     
            and $14            ; $f027: 25 14     
            sta $0107          ; $f029: 8d 07 01  
            sta $15            ; $f02c: 85 15     
            ldy #$30           ; $f02e: a0 30     
            lda $14            ; $f030: a5 14     
            cmp $00            ; $f032: c5 00     
            bne __f03f         ; $f034: d0 09     
            dec $0108          ; $f036: ce 08 01  
            bne __f042         ; $f039: d0 07     
            sta $15            ; $f03b: 85 15     
            ldy #$10           ; $f03d: a0 10     
__f03f:     sty $0108          ; $f03f: 8c 08 01  
__f042:     rts                ; $f042: 60        

;-------------------------------------------------------------------------------
__f043:     lda $10            ; $f043: a5 10     
            pha                ; $f045: 48        
            lda $11            ; $f046: a5 11     
            pha                ; $f048: 48        
            ldx #$00           ; $f049: a2 00     
            txa                ; $f04b: 8a        
__f04c:     sta $00,x          ; $f04c: 95 00     
            sta $0300,x        ; $f04e: 9d 00 03  
            sta $0400,x        ; $f051: 9d 00 04  
            sta $0500,x        ; $f054: 9d 00 05  
            sta $0600,x        ; $f057: 9d 00 06  
            sta $0700,x        ; $f05a: 9d 00 07  
            inx                ; $f05d: e8        
            bne __f04c         ; $f05e: d0 ec     
            pla                ; $f060: 68        
            sta $11            ; $f061: 85 11     
            pla                ; $f063: 68        
            sta $10            ; $f064: 85 10     
            rts                ; $f066: 60        

;-------------------------------------------------------------------------------
__f067:     lda $10            ; $f067: a5 10     
            pha                ; $f069: 48        
            lda $11            ; $f06a: a5 11     
            pha                ; $f06c: 48        
            jsr __f077         ; $f06d: 20 77 f0  
            pla                ; $f070: 68        
            sta $11            ; $f071: 85 11     
            pla                ; $f073: 68        
            sta $10            ; $f074: 85 10     
            rts                ; $f076: 60        

;-------------------------------------------------------------------------------
__f077:     ldx #$00           ; $f077: a2 00     
            txa                ; $f079: 8a        
__f07a:     sta $0300,x        ; $f07a: 9d 00 03  
            sta $0400,x        ; $f07d: 9d 00 04  
            sta $0500,x        ; $f080: 9d 00 05  
            sta $0700,x        ; $f083: 9d 00 07  
            cpx #$f0           ; $f086: e0 f0     
            bcs __f08c         ; $f088: b0 02     
            sta $00,x          ; $f08a: 95 00     
__f08c:     cpx #$80           ; $f08c: e0 80     
            bcs __f093         ; $f08e: b0 03     
            sta $0600,x        ; $f090: 9d 00 06  
__f093:     inx                ; $f093: e8        
            bne __f07a         ; $f094: d0 e4     
            rts                ; $f096: 60        

;-------------------------------------------------------------------------------
            .hex 3f 00 20      ; $f097: 3f 00 20  Invalid Opcode - RLA $2000,x
            ora ($22,x)        ; $f09a: 01 22     
            .hex 37 3a         ; $f09c: 37 3a     Invalid Opcode - RLA $3a,x
            ora ($30,x)        ; $f09e: 01 30     
            .hex 14 09         ; $f0a0: 14 09     Invalid Opcode - NOP $09,x
            ora ($0f,x)        ; $f0a2: 01 0f     
            and ($16),y        ; $f0a4: 31 16     
            ora ($30,x)        ; $f0a6: 01 30     
            ora $30,x          ; $f0a8: 15 30     
            ora ($32,x)        ; $f0aa: 01 32     
            .hex 32            ; $f0ac: 32        Invalid Opcode - KIL 
            .hex 32            ; $f0ad: 32        Invalid Opcode - KIL 
            ora ($32,x)        ; $f0ae: 01 32     
            .hex 32            ; $f0b0: 32        Invalid Opcode - KIL 
            .hex 32            ; $f0b1: 32        Invalid Opcode - KIL 
            ora ($32,x)        ; $f0b2: 01 32     
            .hex 32            ; $f0b4: 32        Invalid Opcode - KIL 
            .hex 32            ; $f0b5: 32        Invalid Opcode - KIL 
            ora ($32,x)        ; $f0b6: 01 32     
            .hex 32            ; $f0b8: 32        Invalid Opcode - KIL 
            .hex 32            ; $f0b9: 32        Invalid Opcode - KIL 
            jsr $0164          ; $f0ba: 20 64 01  
            .hex 73 20         ; $f0bd: 73 20     Invalid Opcode - RRA ($20),y
            .hex 7c 01 77      ; $f0bf: 7c 01 77  Invalid Opcode - NOP $7701,x
            jsr $5765          ; $f0c2: 20 65 57  
            adc $20,x          ; $f0c5: 75 20     
            sty $c5            ; $f0c7: 84 c5     
            .hex f2            ; $f0c9: f2        Invalid Opcode - KIL 
            jsr __c59c         ; $f0ca: 20 9c c5  
            .hex f3 21         ; $f0cd: f3 21     Invalid Opcode - ISC ($21),y
            bit $03            ; $f0cf: 24 03     
            .hex 74            ; $f0d1: 74        Suspected data
__f0d2:     ror $f4,x          ; $f0d2: 76 f4     
            and ($3a,x)        ; $f0d4: 21 3a     
            .hex 03 f5         ; $f0d6: 03 f5     Invalid Opcode - SLO ($f5,x)
            ror $78,x          ; $f0d8: 76 78     
            and ($46,x)        ; $f0da: 21 46     
            sty $f2            ; $f0dc: 84 f2     
            .hex f2            ; $f0de: f2        Invalid Opcode - KIL 
            .hex f2            ; $f0df: f2        Invalid Opcode - KIL 
            .hex 74 21         ; $f0e0: 74 21     Invalid Opcode - NOP $21,x
            .hex 5a            ; $f0e2: 5a        Invalid Opcode - NOP 
            sty $f3            ; $f0e3: 84 f3     
            .hex f3 f3         ; $f0e5: f3 f3     Invalid Opcode - ISC ($f3),y
            sei                ; $f0e7: 78        
            and ($a7,x)        ; $f0e8: 21 a7     
            .hex 53 76         ; $f0ea: 53 76     Invalid Opcode - SRE ($76),y
            jsr $15a6          ; $f0ec: 20 a6 15  
            .hex cb ce         ; $f0ef: cb ce     Invalid Opcode - AXS #$ce
            cpx __d4ed         ; $f0f1: ec ed d4  
            .hex d2            ; $f0f4: d2        Invalid Opcode - KIL 
            .hex d2            ; $f0f5: d2        Invalid Opcode - KIL 
            .hex d2            ; $f0f6: d2        Invalid Opcode - KIL 
            .hex cb dc         ; $f0f7: cb dc     Invalid Opcode - AXS #$dc
            .hex d2            ; $f0f9: d2        Invalid Opcode - KIL 
            .hex d2            ; $f0fa: d2        Invalid Opcode - KIL 
            bit $d2            ; $f0fb: 24 d2     
            .hex d2            ; $f0fd: d2        Invalid Opcode - KIL 
            cpx __d4ed         ; $f0fe: ec ed d4  
            .hex d2            ; $f101: d2        Invalid Opcode - KIL 
            bne __f0d2         ; $f102: d0 ce     
            jsr $15c6          ; $f104: 20 c6 15  
            cpy __eecc         ; $f107: cc cc ee  
            .hex ef            ; $f10a: ef        Suspected data
__f10b:     cmp $d6,x          ; $f10b: d5 d6     
__f10d:     cld                ; $f10d: d8        
            .hex d9            ; $f10e: d9        Suspected data
__f10f:     .hex da            ; $f10f: da        Invalid Opcode - NOP 
            .hex db de         ; $f110: db de     Suspected data
__f112:     .hex df 24         ; $f112: df 24     Suspected data
__f114:     cld                ; $f114: d8        
            cmp __efee,y       ; $f115: d9 ee ef  
            cmp $d6,x          ; $f118: d5 d6     
            cpy $20e2          ; $f11a: cc e2 20  
            inc $15            ; $f11d: e6 15     
            .hex cd cf         ; $f11f: cd cf     Suspected data
__f121:     beq __f114         ; $f121: f0 f1     
            .hex d3 d7         ; $f123: d3 d7     Invalid Opcode - DCP ($d7),y
            .hex d3 f8         ; $f125: d3 f8     Invalid Opcode - DCP ($f8),y
            cmp __e0dd         ; $f127: cd dd e0  
            sbc ($24,x)        ; $f12a: e1 24     
            .hex d3 f8         ; $f12c: d3 f8     Invalid Opcode - DCP ($f8),y
            beq __f121         ; $f12e: f0 f1     
            .hex d3 d7         ; $f130: d3 d7     Invalid Opcode - DCP ($d7),y
            cmp ($e3),y        ; $f132: d1 e3     
            and ($29,x)        ; $f134: 21 29     
            ora ($d0),y        ; $f136: 11 d0     
            dec $24d2          ; $f138: ce d2 24  
            bne __f10b         ; $f13b: d0 ce     
            bne __f10d         ; $f13d: d0 ce     
            bne __f10f         ; $f13f: d0 ce     
            .hex d2            ; $f141: d2        Invalid Opcode - KIL 
            bne __f112         ; $f142: d0 ce     
            bne __f114         ; $f144: d0 ce     
            inc $f7,x          ; $f146: f6 f7     
            and ($49,x)        ; $f148: 21 49     
            .hex 0f cc e7      ; $f14a: 0f cc e7  Invalid Opcode - SLO __e7cc
            cpy __e824         ; $f14d: cc 24 e8  
            sbc #$ea           ; $f150: e9 ea     
            .hex eb ea         ; $f152: eb ea     Invalid Opcode - SBC #$ea
            .hex eb cc         ; $f154: eb cc     Invalid Opcode - SBC #$cc
            cpy __eae7         ; $f156: cc e7 ea  
            .hex eb 21         ; $f159: eb 21     Invalid Opcode - SBC #$21
            adc #$0f           ; $f15b: 69 0f     
            cmp ($cf),y        ; $f15d: d1 cf     
            cmp __d3dd         ; $f15f: cd dd d3  
            .hex d3 d1         ; $f162: d3 d1     Invalid Opcode - DCP ($d1),y
            .hex cf d1 cf      ; $f164: cf d1 cf  Invalid Opcode - DCP __cfd1
            .hex d3 d1         ; $f167: d3 d1     Invalid Opcode - DCP ($d1),y
            .hex cf d1 cf      ; $f169: cf d1 cf  Invalid Opcode - DCP __cfd1
            and ($e7,x)        ; $f16c: 21 e7     
            asl $0d            ; $f16e: 06 0d     
            clc                ; $f170: 18        
            .hex 17 14         ; $f171: 17 14     Invalid Opcode - SLO $14,x
            asl $2222          ; $f173: 0e 22 22  
            .hex 07 06         ; $f176: 07 06     Invalid Opcode - SLO $06
            .hex 14 18         ; $f178: 14 18     Invalid Opcode - NOP $18,x
            .hex 17 10         ; $f17a: 17 10     Invalid Opcode - SLO $10,x
            bit $fa            ; $f17c: 24 fa     
            and ($f2,x)        ; $f17e: 21 f2     
            asl $0d            ; $f180: 06 0d     
            clc                ; $f182: 18        
            .hex 17 14         ; $f183: 17 14     Invalid Opcode - SLO $14,x
            asl $2222          ; $f185: 0e 22 22  
            .hex 12            ; $f188: 12        Invalid Opcode - KIL 
            ora #$14           ; $f189: 09 14     
            clc                ; $f18b: 18        
            .hex 17 10         ; $f18c: 17 10     Invalid Opcode - SLO $10,x
            bit $13            ; $f18e: 24 13     
            .hex 1b c7 fa      ; $f190: 1b c7 fa  Invalid Opcode - SLO __fac7,y
            .hex 22            ; $f193: 22        Invalid Opcode - KIL 
            eor #$0e           ; $f194: 49 0e     
            ora ($19,x)        ; $f196: 01 19     
            ora $0a,x          ; $f198: 15 0a     
            .hex 22            ; $f19a: 22        Invalid Opcode - KIL 
            asl $241b          ; $f19b: 0e 1b 24  
            bpl __f1aa         ; $f19e: 10 0a     
            asl $0e,x          ; $f1a0: 16 0e     
            bit $0a            ; $f1a2: 24 0a     
            .hex 22            ; $f1a4: 22        Invalid Opcode - KIL 
            .hex 89 0e         ; $f1a5: 89 0e     Invalid Opcode - NOP #$0e
            ora ($19,x)        ; $f1a7: 01 19     
            .hex 15            ; $f1a9: 15        Suspected data
__f1aa:     asl                ; $f1aa: 0a        
            .hex 22            ; $f1ab: 22        Invalid Opcode - KIL 
            asl $241b          ; $f1ac: 0e 1b 24  
            bpl __f1bb         ; $f1af: 10 0a     
            asl $0e,x          ; $f1b1: 16 0e     
            bit $0b            ; $f1b3: 24 0b     
            .hex 22            ; $f1b5: 22        Invalid Opcode - KIL 
            cmp #$0e           ; $f1b6: c9 0e     
            .hex 02            ; $f1b8: 02        Invalid Opcode - KIL 
            .hex 19 15         ; $f1b9: 19 15     Suspected data
__f1bb:     asl                ; $f1bb: 0a        
            .hex 22            ; $f1bc: 22        Invalid Opcode - KIL 
            asl $241b          ; $f1bd: 0e 1b 24  
            bpl __f1cc         ; $f1c0: 10 0a     
            asl $0e,x          ; $f1c2: 16 0e     
            bit $0a            ; $f1c4: 24 0a     
            .hex 23 09         ; $f1c6: 23 09     Invalid Opcode - RLA ($09,x)
            asl $1902          ; $f1c8: 0e 02 19  
            .hex 15            ; $f1cb: 15        Suspected data
__f1cc:     asl                ; $f1cc: 0a        
            .hex 22            ; $f1cd: 22        Invalid Opcode - KIL 
            asl $241b          ; $f1ce: 0e 1b 24  
            bpl __f1dd         ; $f1d1: 10 0a     
            asl $0e,x          ; $f1d3: 16 0e     
            bit $0b            ; $f1d5: 24 0b     
            .hex 23 46         ; $f1d7: 23 46     Invalid Opcode - RLA ($46,x)
            .hex 14 fe         ; $f1d9: 14 fe     Invalid Opcode - NOP $fe,x
            bit $01            ; $f1db: 24 01     
__f1dd:     ora #$08           ; $f1dd: 09 08     
            ora ($c7,x)        ; $f1df: 01 c7     
            ora ($09,x)        ; $f1e1: 01 09     
            php                ; $f1e3: 08        
            .hex 02            ; $f1e4: 02        Invalid Opcode - KIL 
            bit $17            ; $f1e5: 24 17     
            .hex 12            ; $f1e7: 12        Invalid Opcode - KIL 
            .hex 17 1d         ; $f1e8: 17 1d     Invalid Opcode - SLO $1d,x
            asl $0d17          ; $f1ea: 0e 17 0d  
            clc                ; $f1ed: 18        
            .hex 23 c0         ; $f1ee: 23 c0     Invalid Opcode - RLA ($c0,x)
            jsr __a000         ; $f1f0: 20 00 a0  
            ldy #$a0           ; $f1f3: a0 a0     
            ldy #$a0           ; $f1f5: a0 a0     
            ldy #$20           ; $f1f7: a0 20     
            brk                ; $f1f9: 00        
            inc $ffff          ; $f1fa: ee ff ff  
            .hex ff ff ff      ; $f1fd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex 22            ; $f200: 22        Invalid Opcode - KIL 
            brk                ; $f201: 00        
            txa                ; $f202: 8a        
            .hex ff ff ff      ; $f203: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 8b 02      ; $f206: ff 8b 02  Invalid Opcode - ISC $028b,x
            brk                ; $f209: 00        
            cli                ; $f20a: 58        
            .hex 5a            ; $f20b: 5a        Invalid Opcode - NOP 
            .hex 5a            ; $f20c: 5a        Invalid Opcode - NOP 
            .hex 5a            ; $f20d: 5a        Invalid Opcode - NOP 
            .hex 5a            ; $f20e: 5a        Invalid Opcode - NOP 
            asl                ; $f20f: 0a        
            bpl __f235         ; $f210: 10 23     
            cpx #$20           ; $f212: e0 20     
            brk                ; $f214: 00        
            ora $f5            ; $f215: 05 f5     
            sbc $f5,x          ; $f217: f5 f5     
            sbc $05,x          ; $f219: f5 05     
            ora ($00,x)        ; $f21b: 01 00     
            .hex 04 ff         ; $f21d: 04 ff     Invalid Opcode - NOP $ff
            .hex ff ff ff      ; $f21f: ff ff ff  Invalid Opcode - ISC $ffff,x
            brk                ; $f222: 00        
            brk                ; $f223: 00        
            brk                ; $f224: 00        
            brk                ; $f225: 00        
            .hex 0f 0f 0f      ; $f226: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            .hex 0f 00 00      ; $f229: 0f 00 00  Bad Addr Mode - SLO $0000
            brk                ; $f22c: 00        
            brk                ; $f22d: 00        
            brk                ; $f22e: 00        
            brk                ; $f22f: 00        
            brk                ; $f230: 00        
            brk                ; $f231: 00        
            brk                ; $f232: 00        
            brk                ; $f233: 00        
            brk                ; $f234: 00        
__f235:     .hex 3f 00 10      ; $f235: 3f 00 10  Invalid Opcode - RLA $1000,x
            .hex 0f 15 2c      ; $f238: 0f 15 2c  Invalid Opcode - SLO $2c15
            .hex 12            ; $f23b: 12        Invalid Opcode - KIL 
            .hex 0f 27 02      ; $f23c: 0f 27 02  Invalid Opcode - SLO $0227
            .hex 17 0f         ; $f23f: 17 0f     Invalid Opcode - SLO $0f,x
            bmi __f279         ; $f241: 30 36     
            asl $0f            ; $f243: 06 0f     
            bmi __f273         ; $f245: 30 2c     
            bit $00            ; $f247: 24 00     
            .hex 3f 00 10      ; $f249: 3f 00 10  Invalid Opcode - RLA $1000,x
            .hex 0f 2a 17      ; $f24c: 0f 2a 17  Invalid Opcode - SLO $172a
            .hex 37 0f         ; $f24f: 37 0f     Invalid Opcode - RLA $0f,x
            bmi __f27d         ; $f251: 30 2a     
            asl $0f,x          ; $f253: 16 0f     
            bmi __f28d         ; $f255: 30 36     
            asl $0f            ; $f257: 06 0f     
            .hex 12            ; $f259: 12        Invalid Opcode - KIL 
            .hex 37 16         ; $f25a: 37 16     Invalid Opcode - RLA $16,x
            brk                ; $f25c: 00        
__f25d:     .hex 23 d9         ; $f25d: 23 d9     Invalid Opcode - RLA ($d9,x)
            asl $5a5a          ; $f25f: 0e 5a 5a  
            .hex 5a            ; $f262: 5a        Invalid Opcode - NOP 
            asl                ; $f263: 0a        
            asl                ; $f264: 0a        
            asl                ; $f265: 0a        
            brk                ; $f266: 00        
            brk                ; $f267: 00        
            ora $f5            ; $f268: 05 f5     
            sbc $f0,x          ; $f26a: f5 f0     
__f26c:     beq __f26e         ; $f26c: f0 00     
__f26e:     .hex 23 d9         ; $f26e: 23 d9     Invalid Opcode - RLA ($d9,x)
            asl $0a0a          ; $f270: 0e 0a 0a  
__f273:     asl                ; $f273: 0a        
            .hex 5a            ; $f274: 5a        Invalid Opcode - NOP 
            .hex 5a            ; $f275: 5a        Invalid Opcode - NOP 
            asl                ; $f276: 0a        
            brk                ; $f277: 00        
            brk                ; $f278: 00        
__f279:     brk                ; $f279: 00        
            beq __f26c         ; $f27a: f0 f0     
            .hex f5            ; $f27c: f5        Suspected data
__f27d:     sbc $05,x          ; $f27d: f5 05     
            .hex ff ff ff      ; $f27f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f282: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f285: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f288: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff         ; $f28b: ff ff     Suspected data
__f28d:     .hex ff ff ff      ; $f28d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f290: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f293: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f296: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f299: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f29c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f29f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2a2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2a5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2b7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2c0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2c9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2d2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2d5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2d8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2db: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2de: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2e1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2e4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2ea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2ed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2f0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2f3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2f6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2f9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2fc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2ff: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f302: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f305: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f308: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f30b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f30e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f311: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f314: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f317: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f31a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f31d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f320: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f323: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f326: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f329: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f32c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f32f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f332: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f335: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f338: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f33b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f33e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f341: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f344: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f347: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f34a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f34d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f350: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f353: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f356: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f359: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f35c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f35f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f362: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f365: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f368: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f36b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f36e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f371: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f374: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f377: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f37a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f37d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f380: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f383: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f386: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f389: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f38c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff            ; $f38f: ff        Suspected data
__f390:     .hex 07            ; $f390: 07        Suspected data
__f391:     beq __f393         ; $f391: f0 00     
__f393:     brk                ; $f393: 00        
            brk                ; $f394: 00        
            adc #$00           ; $f395: 69 00     
            .hex 53 00         ; $f397: 53 00     Invalid Opcode - SRE ($00),y
            lsr $00            ; $f399: 46 00     
            .hex d4 00         ; $f39b: d4 00     Invalid Opcode - NOP $00,x
            lda __a800,x       ; $f39d: bd 00 a8  
            brk                ; $f3a0: 00        
            .hex 9f 00 8d      ; $f3a1: 9f 00 8d  Invalid Opcode - AHX __8d00,y
            brk                ; $f3a4: 00        
            ror __ab01,x       ; $f3a5: 7e 01 ab  
            ora ($7c,x)        ; $f3a8: 01 7c     
            ora ($67,x)        ; $f3aa: 01 67     
            ora ($52,x)        ; $f3ac: 01 52     
            ora ($3f,x)        ; $f3ae: 01 3f     
            ora ($2d,x)        ; $f3b0: 01 2d     
            ora ($1c,x)        ; $f3b2: 01 1c     
            ora ($0c,x)        ; $f3b4: 01 0c     
            brk                ; $f3b6: 00        
            sbc __ee00,x       ; $f3b7: fd 00 ee  
            brk                ; $f3ba: 00        
            sbc ($03,x)        ; $f3bb: e1 03     
            .hex 57 02         ; $f3bd: 57 02     Invalid Opcode - SRE $02,x
            sbc __a602,y       ; $f3bf: f9 02 a6  
            .hex 02            ; $f3c2: 02        Invalid Opcode - KIL 
            .hex 80 02         ; $f3c3: 80 02     Invalid Opcode - NOP #$02
            .hex 3a            ; $f3c5: 3a        Invalid Opcode - NOP 
            .hex 02            ; $f3c6: 02        Invalid Opcode - KIL 
            .hex 1a            ; $f3c7: 1a        Invalid Opcode - NOP 
            ora ($fc,x)        ; $f3c8: 01 fc     
            ora ($df,x)        ; $f3ca: 01 df     
            ora ($c4,x)        ; $f3cc: 01 c4     
            asl $ae            ; $f3ce: 06 ae     
            ora $f3            ; $f3d0: 05 f3     
            ora $9e            ; $f3d2: 05 9e     
            ora $4d            ; $f3d4: 05 4d     
            ora $01            ; $f3d6: 05 01     
            .hex 04 b9         ; $f3d8: 04 b9     Invalid Opcode - NOP $b9
            .hex 04 75         ; $f3da: 04 75     Invalid Opcode - NOP $75
            .hex 04 35         ; $f3dc: 04 35     Invalid Opcode - NOP $35
            .hex 03 f8         ; $f3de: 03 f8     Invalid Opcode - SLO ($f8,x)
            .hex 03 bf         ; $f3e0: 03 bf     Invalid Opcode - SLO ($bf,x)
            .hex 03 89         ; $f3e2: 03 89     Invalid Opcode - SLO ($89,x)
            brk                ; $f3e4: 00        
            stx $00,y          ; $f3e5: 96 00     
            bvs __f3ea         ; $f3e7: 70 01     
            .hex 93            ; $f3e9: 93        Suspected data
__f3ea:     ora $0a            ; $f3ea: 05 0a     
            .hex 14 28         ; $f3ec: 14 28     Invalid Opcode - NOP $28,x
            bvc __f40e         ; $f3ee: 50 1e     
            .hex 3c 0b 06      ; $f3f0: 3c 0b 06  Invalid Opcode - NOP $060b,x
            .hex 0c 18 30      ; $f3f3: 0c 18 30  Invalid Opcode - NOP $3018
            plp                ; $f3f6: 28        
            bit $10            ; $f3f7: 24 10     
            .hex 04 06         ; $f3f9: 04 06     Invalid Opcode - NOP $06
            .hex 0c 18 30      ; $f3fb: 0c 18 30  Invalid Opcode - NOP $3018
            rts                ; $f3fe: 60        

;-------------------------------------------------------------------------------
            bit $48            ; $f3ff: 24 48     
            .hex 04 07         ; $f401: 04 07     Invalid Opcode - NOP $07
            ora $341a          ; $f403: 0d 1a 34  
            sei                ; $f406: 78        
            .hex 27 4e         ; $f407: 27 4e     Invalid Opcode - RLA $4e
__f409:     php                ; $f409: 08        
            asl                ; $f40a: 0a        
            .hex 14 03         ; $f40b: 14 03     Invalid Opcode - NOP $03,x
            .hex 07            ; $f40d: 07        Suspected data
__f40e:     php                ; $f40e: 08        
            .hex 10            ; $f40f: 10        Suspected data
__f410:     asl                ; $f410: 0a        
            php                ; $f411: 08        
            ora $0a            ; $f412: 05 0a     
            .hex 09            ; $f414: 09        Suspected data
__f415:     lda $0103          ; $f415: ad 03 01  
            bpl __f41d         ; $f418: 10 03     
            jmp __f967         ; $f41a: 4c 67 f9  

;-------------------------------------------------------------------------------
__f41d:     lda #$c0           ; $f41d: a9 c0     
            sta $4017          ; $f41f: 8d 17 40  
            jsr __f546         ; $f422: 20 46 f5  
            ldx #$00           ; $f425: a2 00     
            stx $ff            ; $f427: 86 ff     
            stx $fe            ; $f429: 86 fe     
            stx $fd            ; $f42b: 86 fd     
            lda $06f0          ; $f42d: ad f0 06  
            cmp #$90           ; $f430: c9 90     
            bcs __f439         ; $f432: b0 05     
            ldx #$00           ; $f434: a2 00     
            stx $06f1          ; $f436: 8e f1 06  
__f439:     cmp #$d8           ; $f439: c9 d8     
            bcc __f440         ; $f43b: 90 03     
            inc $06f1          ; $f43d: ee f1 06  
__f440:     tay                ; $f440: a8        
            lsr                ; $f441: 4a        
            lsr                ; $f442: 4a        
            lsr                ; $f443: 4a        
            lsr                ; $f444: 4a        
            lsr                ; $f445: 4a        
            lsr                ; $f446: 4a        
            sta $00            ; $f447: 85 00     
            tya                ; $f449: 98        
            ldx $06f1          ; $f44a: ae f1 06  
            bne __f454         ; $f44d: d0 05     
            sec                ; $f44f: 38        
            adc $00            ; $f450: 65 00     
            bne __f457         ; $f452: d0 03     
__f454:     clc                ; $f454: 18        
            sbc $00            ; $f455: e5 00     
__f457:     sta $06f0          ; $f457: 8d f0 06  
            rts                ; $f45a: 60        

;-------------------------------------------------------------------------------
__f45b:     ldy #$07           ; $f45b: a0 07     
__f45d:     asl                ; $f45d: 0a        
            bcs __f463         ; $f45e: b0 03     
            dey                ; $f460: 88        
            bne __f45d         ; $f461: d0 fa     
__f463:     rts                ; $f463: 60        

;-------------------------------------------------------------------------------
__f464:     sta $f1            ; $f464: 85 f1     
            sty $f2            ; $f466: 84 f2     
__f468:     ldy #$7f           ; $f468: a0 7f     
__f46a:     stx $4000          ; $f46a: 8e 00 40  
            sty $4001          ; $f46d: 8c 01 40  
            rts                ; $f470: 60        

;-------------------------------------------------------------------------------
            jsr __f46a         ; $f471: 20 6a f4  
__f474:     ldx #$00           ; $f474: a2 00     
__f476:     tay                ; $f476: a8        
            lda __f391,y       ; $f477: b9 91 f3  
            beq __f487         ; $f47a: f0 0b     
            sta $4002,x        ; $f47c: 9d 02 40  
            lda __f390,y       ; $f47f: b9 90 f3  
            ora #$08           ; $f482: 09 08     
            sta $4003,x        ; $f484: 9d 03 40  
__f487:     rts                ; $f487: 60        

;-------------------------------------------------------------------------------
__f488:     sty $4005          ; $f488: 8c 05 40  
            ldx #$04           ; $f48b: a2 04     
            bne __f476         ; $f48d: d0 e7     
__f48f:     sta $4008          ; $f48f: 8d 08 40  
            txa                ; $f492: 8a        
            and #$3e           ; $f493: 29 3e     
            ldx #$08           ; $f495: a2 08     
            bne __f476         ; $f497: d0 dd     
__f499:     tax                ; $f499: aa        
            ror                ; $f49a: 6a        
            txa                ; $f49b: 8a        
            rol                ; $f49c: 2a        
            rol                ; $f49d: 2a        
            rol                ; $f49e: 2a        
__f49f:     and #$07           ; $f49f: 29 07     
            clc                ; $f4a1: 18        
            adc $068d          ; $f4a2: 6d 8d 06  
            tay                ; $f4a5: a8        
            lda __f3ea,y       ; $f4a6: b9 ea f3  
            rts                ; $f4a9: 60        

;-------------------------------------------------------------------------------
__f4aa:     tya                ; $f4aa: 98        
            lsr                ; $f4ab: 4a        
__f4ac:     lsr                ; $f4ac: 4a        
            lsr                ; $f4ad: 4a        
            sta $00            ; $f4ae: 85 00     
            tya                ; $f4b0: 98        
            sec                ; $f4b1: 38        
            sbc $00            ; $f4b2: e5 00     
            rts                ; $f4b4: 60        

;-------------------------------------------------------------------------------
__f4b5:     lda #$90           ; $f4b5: a9 90     
            sta $4000          ; $f4b7: 8d 00 40  
            rts                ; $f4ba: 60        

;-------------------------------------------------------------------------------
__f4bb:     bvc __f4fd         ; $f4bb: 50 40     
            lsr $4a            ; $f4bd: 46 4a     
            bvc __f517         ; $f4bf: 50 56     
            .hex 5c 64 6c      ; $f4c1: 5c 64 6c  Invalid Opcode - NOP $6c64,x
            .hex 74 7c         ; $f4c4: 74 7c     Invalid Opcode - NOP $7c,x
            dey                ; $f4c6: 88        
            bcc __f463         ; $f4c7: 90 9a     
__f4c9:     sta $f0            ; $f4c9: 85 f0     
            sta $fb            ; $f4cb: 85 fb     
            ldy #$08           ; $f4cd: a0 08     
            jmp __f6d5         ; $f4cf: 4c d5 f6  

;-------------------------------------------------------------------------------
__f4d2:     sty $f0            ; $f4d2: 84 f0     
            lda #$71           ; $f4d4: a9 71     
            ldy #$00           ; $f4d6: a0 00     
            ldx #$9f           ; $f4d8: a2 9f     
            jsr __f464         ; $f4da: 20 64 f4  
__f4dd:     ldx $f2            ; $f4dd: a6 f2     
            ldy __f4bb,x       ; $f4df: bc bb f4  
            dec $f1            ; $f4e2: c6 f1     
            lda $f1            ; $f4e4: a5 f1     
            beq __f4c9         ; $f4e6: f0 e1     
            and #$07           ; $f4e8: 29 07     
            bne __f4f4         ; $f4ea: d0 08     
            tya                ; $f4ec: 98        
            lsr                ; $f4ed: 4a        
            adc __f4bb,x       ; $f4ee: 7d bb f4  
            tay                ; $f4f1: a8        
            .hex d0            ; $f4f2: d0        Suspected data
__f4f3:     .hex 07            ; $f4f3: 07        Suspected data
__f4f4:     and #$03           ; $f4f4: 29 03     
            bne __f506         ; $f4f6: d0 0e     
            inc $f2            ; $f4f8: e6 f2     
            clc                ; $f4fa: 18        
            .hex 8c 02         ; $f4fb: 8c 02     Suspected data
__f4fd:     rti                ; $f4fd: 40        

;-------------------------------------------------------------------------------
            ldy #$28           ; $f4fe: a0 28     
            bcc __f503         ; $f500: 90 01     
            iny                ; $f502: c8        
__f503:     sty $4003          ; $f503: 8c 03 40  
__f506:     lda #$00           ; $f506: a9 00     
            jmp __f76e         ; $f508: 4c 6e f7  

;-------------------------------------------------------------------------------
__f50b:     sty $f0            ; $f50b: 84 f0     
            lda #$54           ; $f50d: a9 54     
            ldy #$6a           ; $f50f: a0 6a     
            ldx #$9c           ; $f511: a2 9c     
            jsr __f464         ; $f513: 20 64 f4  
__f516:     .hex a4            ; $f516: a4        Suspected data
__f517:     .hex f2            ; $f517: f2        Invalid Opcode - KIL 
            lda $f1            ; $f518: a5 f1     
            and #$03           ; $f51a: 29 03     
            beq __f528         ; $f51c: f0 0a     
            cmp #$03           ; $f51e: c9 03     
            bne __f52d         ; $f520: d0 0b     
            jsr __f4aa         ; $f522: 20 aa f4  
            sta $f2            ; $f525: 85 f2     
            tay                ; $f527: a8        
__f528:     tya                ; $f528: 98        
            lsr                ; $f529: 4a        
            adc $f2            ; $f52a: 65 f2     
            tay                ; $f52c: a8        
__f52d:     tya                ; $f52d: 98        
            rol                ; $f52e: 2a        
            rol                ; $f52f: 2a        
            rol                ; $f530: 2a        
            sta $4002          ; $f531: 8d 02 40  
            rol                ; $f534: 2a        
            sta $4003          ; $f535: 8d 03 40  
            lda $f1            ; $f538: a5 f1     
            cmp #$18           ; $f53a: c9 18     
            bcs __f598         ; $f53c: b0 5a     
            lsr                ; $f53e: 4a        
            ora #$90           ; $f53f: 09 90     
            sta $4000          ; $f541: 8d 00 40  
            bne __f598         ; $f544: d0 52     
__f546:     ldy $ff            ; $f546: a4 ff     
            lda $f0            ; $f548: a5 f0     
            lsr                ; $f54a: 4a        
            bcs __f4dd         ; $f54b: b0 90     
            lsr $ff            ; $f54d: 46 ff     
            bcs __f4d2         ; $f54f: b0 81     
            ldx $fa            ; $f551: a6 fa     
            bne __f59f         ; $f553: d0 4a     
            lsr                ; $f555: 4a        
            bcs __f516         ; $f556: b0 be     
            lsr $ff            ; $f558: 46 ff     
            bcs __f50b         ; $f55a: b0 af     
            lsr                ; $f55c: 4a        
            bcs __f57c         ; $f55d: b0 1d     
            lsr $ff            ; $f55f: 46 ff     
            bcs __f56d         ; $f561: b0 0a     
            lsr                ; $f563: 4a        
            bcs __f5b6         ; $f564: b0 50     
            lsr $ff            ; $f566: 46 ff     
            bcs __f5a5         ; $f568: b0 3b     
__f56a:     jmp __f5fe         ; $f56a: 4c fe f5  

;-------------------------------------------------------------------------------
__f56d:     sty $f0            ; $f56d: 84 f0     
            lda #$22           ; $f56f: a9 22     
            sta $f1            ; $f571: 85 f1     
            ldy #$0b           ; $f573: a0 0b     
            sty $f2            ; $f575: 84 f2     
            lda #$20           ; $f577: a9 20     
            jsr __f474         ; $f579: 20 74 f4  
__f57c:     dec $f2            ; $f57c: c6 f2     
            bne __f584         ; $f57e: d0 04     
            lda #$07           ; $f580: a9 07     
            sta $f2            ; $f582: 85 f2     
__f584:     ldx $f2            ; $f584: a6 f2     
            ldy __f5d6,x       ; $f586: bc d6 f5  
            ldx #$5a           ; $f589: a2 5a     
            lda $f1            ; $f58b: a5 f1     
            cmp #$14           ; $f58d: c9 14     
            bcs __f595         ; $f58f: b0 04     
            lsr                ; $f591: 4a        
            ora #$50           ; $f592: 09 50     
            tax                ; $f594: aa        
__f595:     jsr __f46a         ; $f595: 20 6a f4  
__f598:     dec $f1            ; $f598: c6 f1     
            bne __f56a         ; $f59a: d0 ce     
            jsr __f4b5         ; $f59c: 20 b5 f4  
__f59f:     lda #$00           ; $f59f: a9 00     
            sta $f0            ; $f5a1: 85 f0     
            beq __f56a         ; $f5a3: f0 c5     
__f5a5:     sty $f0            ; $f5a5: 84 f0     
            lda #$0a           ; $f5a7: a9 0a     
            sta $f1            ; $f5a9: 85 f1     
            ldy $06f0          ; $f5ab: ac f0 06  
            sty $4002          ; $f5ae: 8c 02 40  
            lda #$88           ; $f5b1: a9 88     
            sta $4003          ; $f5b3: 8d 03 40  
__f5b6:     lda $18            ; $f5b6: a5 18     
            and #$08           ; $f5b8: 29 08     
            clc                ; $f5ba: 18        
            adc $f1            ; $f5bb: 65 f1     
            adc #$fe           ; $f5bd: 69 fe     
            tax                ; $f5bf: aa        
            ldy __f5c6,x       ; $f5c0: bc c6 f5  
            ldx #$41           ; $f5c3: a2 41     
            .hex d0            ; $f5c5: d0        Suspected data
__f5c6:     dec __8d8d         ; $f5c6: ce 8d 8d  
            sty __8b8c         ; $f5c9: 8c 8c 8b  
            sty __8383         ; $f5cc: 8c 83 83  
            .hex 8f 8f 8f      ; $f5cf: 8f 8f 8f  Invalid Opcode - SAX __8f8f
            .hex 8f 8d 85      ; $f5d2: 8f 8d 85  Invalid Opcode - SAX __858d
            .hex 84            ; $f5d5: 84        Suspected data
__f5d6:     sta $7f            ; $f5d6: 85 7f     
            sta $85            ; $f5d8: 85 85     
            sta $7f            ; $f5da: 85 7f     
            sta __8d8d         ; $f5dc: 8d 8d 8d  
            .hex 8d 8d         ; $f5df: 8d 8d     Suspected data
__f5e1:     lda #$0e           ; $f5e1: a9 0e     
            sta $06a5          ; $f5e3: 8d a5 06  
            ldy #$85           ; $f5e6: a0 85     
            lda #$46           ; $f5e8: a9 46     
            jsr __f488         ; $f5ea: 20 88 f4  
__f5ed:     dec $06a5          ; $f5ed: ce a5 06  
            beq __f60b         ; $f5f0: f0 19     
            lda $06a5          ; $f5f2: ad a5 06  
            ora #$90           ; $f5f5: 09 90     
            tay                ; $f5f7: a8        
            dey                ; $f5f8: 88        
            sty $4004          ; $f5f9: 8c 04 40  
            bne __f60b         ; $f5fc: d0 0d     
__f5fe:     lda $f3            ; $f5fe: a5 f3     
            bne __f60b         ; $f600: d0 09     
            lda $06a5          ; $f602: ad a5 06  
            bne __f5ed         ; $f605: d0 e6     
            ldy $fe            ; $f607: a4 fe     
            bmi __f5e1         ; $f609: 30 d6     
__f60b:     lda $fc            ; $f60b: a5 fc     
            bne __f679         ; $f60d: d0 6a     
            lda $f9            ; $f60f: a5 f9     
            bne __f679         ; $f611: d0 66     
            ldy $fe            ; $f613: a4 fe     
            lda $06a1          ; $f615: ad a1 06  
            lsr $fe            ; $f618: 46 fe     
            bcs __f628         ; $f61a: b0 0c     
            lsr                ; $f61c: 4a        
            bcs __f62c         ; $f61d: b0 0d     
            lsr                ; $f61f: 4a        
            bcs __f65e         ; $f620: b0 3c     
            lsr $fe            ; $f622: 46 fe     
            bcs __f649         ; $f624: b0 23     
            bcc __f679         ; $f626: 90 51     
__f628:     lda #$28           ; $f628: a9 28     
            bne __f64b         ; $f62a: d0 1f     
__f62c:     lda $f5            ; $f62c: a5 f5     
            bne __f634         ; $f62e: d0 04     
            lsr $fe            ; $f630: 46 fe     
            bcs __f649         ; $f632: b0 15     
__f634:     lda $f6            ; $f634: a5 f6     
            lsr                ; $f636: 4a        
            lsr                ; $f637: 4a        
            lsr                ; $f638: 4a        
            lsr                ; $f639: 4a        
            lsr                ; $f63a: 4a        
            adc $f6            ; $f63b: 65 f6     
            bcc __f66e         ; $f63d: 90 2f     
__f63f:     lda #$00           ; $f63f: a9 00     
            sta $06a1          ; $f641: 8d a1 06  
            .hex 8d 08         ; $f644: 8d 08     Suspected data
__f646:     rti                ; $f646: 40        

;-------------------------------------------------------------------------------
            beq __f679         ; $f647: f0 30     
__f649:     lda #$fe           ; $f649: a9 fe     
__f64b:     sty $06a1          ; $f64b: 8c a1 06  
            ldx #$0e           ; $f64e: a2 0e     
            stx $f5            ; $f650: 86 f5     
            ldy #$ff           ; $f652: a0 ff     
            sty $4008          ; $f654: 8c 08 40  
            ldy #$08           ; $f657: a0 08     
            sty $400b          ; $f659: 8c 0b 40  
            bne __f66e         ; $f65c: d0 10     
__f65e:     lda #$fe           ; $f65e: a9 fe     
            ldy $f5            ; $f660: a4 f5     
            beq __f63f         ; $f662: f0 db     
            cpy #$07           ; $f664: c0 07     
            beq __f66e         ; $f666: f0 06     
            lda $f6            ; $f668: a5 f6     
            tay                ; $f66a: a8        
            jsr __f4ac         ; $f66b: 20 ac f4  
__f66e:     sta $f6            ; $f66e: 85 f6     
            sta $400a          ; $f670: 8d 0a 40  
            lda $f5            ; $f673: a5 f5     
            beq __f679         ; $f675: f0 02     
            dec $f5            ; $f677: c6 f5     
__f679:     ldx $fa            ; $f679: a6 fa     
            bne __f6c6         ; $f67b: d0 49     
            lda $fc            ; $f67d: a5 fc     
__f67f:     bne __f686         ; $f67f: d0 05     
            sta $06a3          ; $f681: 8d a3 06  
            beq __f6c6         ; $f684: f0 40     
__f686:     eor $06a3          ; $f686: 4d a3 06  
            beq __f6a3         ; $f689: f0 18     
__f68b:     lda $fc            ; $f68b: a5 fc     
            sta $06a3          ; $f68d: 8d a3 06  
            jsr __f45b         ; $f690: 20 5b f4  
            lda __f93b,y       ; $f693: b9 3b f9  
            sta $0680          ; $f696: 8d 80 06  
            lda #$42           ; $f699: a9 42     
            sta $f5            ; $f69b: 85 f5     
            lda #$f9           ; $f69d: a9 f9     
            sta $f6            ; $f69f: 85 f6     
            bne __f6a8         ; $f6a1: d0 05     
__f6a3:     dec $0698          ; $f6a3: ce 98 06  
            bne __f6c6         ; $f6a6: d0 1e     
__f6a8:     ldy $0680          ; $f6a8: ac 80 06  
            inc $0680          ; $f6ab: ee 80 06  
            lda ($f5),y        ; $f6ae: b1 f5     
            beq __f68b         ; $f6b0: f0 d9     
            tax                ; $f6b2: aa        
            ror                ; $f6b3: 6a        
            txa                ; $f6b4: 8a        
            rol                ; $f6b5: 2a        
            rol                ; $f6b6: 2a        
            rol                ; $f6b7: 2a        
            and #$07           ; $f6b8: 29 07     
            tay                ; $f6ba: a8        
            lda __f410,y       ; $f6bb: b9 10 f4  
            sta $0698          ; $f6be: 8d 98 06  
            lda #$10           ; $f6c1: a9 10     
            jsr __f48f         ; $f6c3: 20 8f f4  
__f6c6:     lda $fd            ; $f6c6: a5 fd     
            bne __f6d0         ; $f6c8: d0 06     
            lda $0102          ; $f6ca: ad 02 01  
            bne __f709         ; $f6cd: d0 3a     
            rts                ; $f6cf: 60        

;-------------------------------------------------------------------------------
__f6d0:     jsr __f45b         ; $f6d0: 20 5b f4  
            sty $fb            ; $f6d3: 84 fb     
__f6d5:     lda __f7c7,y       ; $f6d5: b9 c7 f7  
            tay                ; $f6d8: a8        
            lda __f7c7,y       ; $f6d9: b9 c7 f7  
            sta $068d          ; $f6dc: 8d 8d 06  
            lda __f7c8,y       ; $f6df: b9 c8 f7  
            sta $f7            ; $f6e2: 85 f7     
            lda __f7c9,y       ; $f6e4: b9 c9 f7  
            sta $f8            ; $f6e7: 85 f8     
            lda __f7ca,y       ; $f6e9: b9 ca f7  
            sta $f9            ; $f6ec: 85 f9     
            lda __f7cb,y       ; $f6ee: b9 cb f7  
            sta $fa            ; $f6f1: 85 fa     
            lda #$01           ; $f6f3: a9 01     
            sta $0695          ; $f6f5: 8d 95 06  
            sta $0696          ; $f6f8: 8d 96 06  
            sta $0698          ; $f6fb: 8d 98 06  
            sta $0102          ; $f6fe: 8d 02 01  
            ldy #$00           ; $f701: a0 00     
            sty $f3            ; $f703: 84 f3     
            lda $fb            ; $f705: a5 fb     
            beq __f712         ; $f707: f0 09     
__f709:     ldy $fa            ; $f709: a4 fa     
            beq __f746         ; $f70b: f0 39     
            dec $0696          ; $f70d: ce 96 06  
            bne __f746         ; $f710: d0 34     
__f712:     inc $fa            ; $f712: e6 fa     
            lda ($f7),y        ; $f714: b1 f7     
            beq __f757         ; $f716: f0 3f     
            bpl __f726         ; $f718: 10 0c     
            jsr __f49f         ; $f71a: 20 9f f4  
            sta $0691          ; $f71d: 8d 91 06  
            ldy $fa            ; $f720: a4 fa     
            inc $fa            ; $f722: e6 fa     
            lda ($f7),y        ; $f724: b1 f7     
__f726:     jsr __f474         ; $f726: 20 74 f4  
            bne __f72f         ; $f729: d0 04     
            ldy #$10           ; $f72b: a0 10     
            bne __f73d         ; $f72d: d0 0e     
__f72f:     ldx #$9f           ; $f72f: a2 9f     
            lda $fb            ; $f731: a5 fb     
            beq __f73d         ; $f733: f0 08     
            ldx #$06           ; $f735: a2 06     
            lda $f9            ; $f737: a5 f9     
            bne __f73d         ; $f739: d0 02     
            ldx #$86           ; $f73b: a2 86     
__f73d:     jsr __f468         ; $f73d: 20 68 f4  
            lda $0691          ; $f740: ad 91 06  
            sta $0696          ; $f743: 8d 96 06  
__f746:     lda $fb            ; $f746: a5 fb     
            beq __f79f         ; $f748: f0 55     
            dec $0695          ; $f74a: ce 95 06  
            bne __f79f         ; $f74d: d0 50     
            ldy $f3            ; $f74f: a4 f3     
            inc $f3            ; $f751: e6 f3     
            lda ($f7),y        ; $f753: b1 f7     
            bne __f777         ; $f755: d0 20     
__f757:     jsr __f4b5         ; $f757: 20 b5 f4  
            lda #$00           ; $f75a: a9 00     
            sta $fa            ; $f75c: 85 fa     
            sta $f3            ; $f75e: 85 f3     
            sta $f9            ; $f760: 85 f9     
            sta $0102          ; $f762: 8d 02 01  
            ldy $fb            ; $f765: a4 fb     
            beq __f76e         ; $f767: f0 05     
            ldy $06a1          ; $f769: ac a1 06  
            bne __f771         ; $f76c: d0 03     
__f76e:     sta $4008          ; $f76e: 8d 08 40  
__f771:     lda #$10           ; $f771: a9 10     
            sta $4004          ; $f773: 8d 04 40  
            rts                ; $f776: 60        

;-------------------------------------------------------------------------------
__f777:     jsr __f499         ; $f777: 20 99 f4  
            sta $0695          ; $f77a: 8d 95 06  
            txa                ; $f77d: 8a        
            and #$3e           ; $f77e: 29 3e     
            ldy #$7f           ; $f780: a0 7f     
            jsr __f488         ; $f782: 20 88 f4  
            bne __f78b         ; $f785: d0 04     
            ldx #$10           ; $f787: a2 10     
            bne __f79c         ; $f789: d0 11     
__f78b:     ldx #$89           ; $f78b: a2 89     
            lda $0695          ; $f78d: ad 95 06  
            cmp #$18           ; $f790: c9 18     
            bcs __f79c         ; $f792: b0 08     
            ldx #$86           ; $f794: a2 86     
            cmp #$10           ; $f796: c9 10     
            bcs __f79c         ; $f798: b0 02     
            ldx #$84           ; $f79a: a2 84     
__f79c:     stx $4004          ; $f79c: 8e 04 40  
__f79f:     ldy $f9            ; $f79f: a4 f9     
            beq __f7c6         ; $f7a1: f0 23     
            dec $0698          ; $f7a3: ce 98 06  
            bne __f7c6         ; $f7a6: d0 1e     
            inc $f9            ; $f7a8: e6 f9     
            lda ($f7),y        ; $f7aa: b1 f7     
            jsr __f499         ; $f7ac: 20 99 f4  
            sta $0698          ; $f7af: 8d 98 06  
            clc                ; $f7b2: 18        
            adc #$fe           ; $f7b3: 69 fe     
            asl                ; $f7b5: 0a        
            asl                ; $f7b6: 0a        
            cmp #$38           ; $f7b7: c9 38     
            bcc __f7bd         ; $f7b9: 90 02     
            lda #$38           ; $f7bb: a9 38     
__f7bd:     ldy $fb            ; $f7bd: a4 fb     
            bne __f7c3         ; $f7bf: d0 02     
            lda #$ff           ; $f7c1: a9 ff     
__f7c3:     jsr __f48f         ; $f7c3: 20 8f f4  
__f7c6:     rts                ; $f7c6: 60        

;-------------------------------------------------------------------------------
__f7c7:     .hex 09            ; $f7c7: 09        Suspected data
__f7c8:     .hex 0e            ; $f7c8: 0e        Suspected data
__f7c9:     .hex 13            ; $f7c9: 13        Suspected data
__f7ca:     clc                ; $f7ca: 18        
__f7cb:     ora $2722,x        ; $f7cb: 1d 22 27  
            .hex 2c 31 00      ; $f7ce: 2c 31 00  Bad Addr Mode - BIT $0031
            sbc $1bf7,x        ; $f7d1: fd f7 1b  
            brk                ; $f7d4: 00        
            bpl __f7f5         ; $f7d5: 10 1e     
            sed                ; $f7d7: f8        
            brk                ; $f7d8: 00        
            .hex 0c 00 3d      ; $f7d9: 0c 00 3d  Invalid Opcode - NOP $3d00
            sed                ; $f7dc: f8        
            brk                ; $f7dd: 00        
            .hex 1a            ; $f7de: 1a        Invalid Opcode - NOP 
            bpl __f854         ; $f7df: 10 73     
            sed                ; $f7e1: f8        
            brk                ; $f7e2: 00        
            .hex 0b 00         ; $f7e3: 0b 00     Invalid Opcode - ANC #$00
            .hex 1b f9 00      ; $f7e5: 1b f9 00  Invalid Opcode - SLO $00f9,y
            .hex 03 00         ; $f7e8: 03 00     Invalid Opcode - SLO ($00,x)
            .hex 2c f9 00      ; $f7ea: 2c f9 00  Bad Addr Mode - BIT $00f9
            brk                ; $f7ed: 00        
            brk                ; $f7ee: 00        
            .hex 32            ; $f7ef: 32        Invalid Opcode - KIL 
            sbc $0000,y        ; $f7f0: f9 00 00  
            clc                ; $f7f3: 18        
            .hex 8e            ; $f7f4: 8e        Suspected data
__f7f5:     sed                ; $f7f5: f8        
            and ($3e,x)        ; $f7f6: 21 3e     
            brk                ; $f7f8: 00        
            .hex 0f f9 08      ; $f7f9: 0f f9 08  Invalid Opcode - SLO $08f9
            brk                ; $f7fc: 00        
            stx $4e            ; $f7fd: 86 4e     
            .hex 82 52         ; $f7ff: 82 52     Invalid Opcode - NOP #$52
            .hex 83 2c         ; $f801: 83 2c     Invalid Opcode - SAX ($2c,x)
            lsr $3880          ; $f803: 4e 80 38  
            rol $38,x          ; $f806: 36 38     
            rol $38,x          ; $f808: 36 38     
            rol $38,x          ; $f80a: 36 38     
            rol $38,x          ; $f80c: 36 38     
            rol $38,x          ; $f80e: 36 38     
            rol $38,x          ; $f810: 36 38     
            rol $38,x          ; $f812: 36 38     
            rol $84,x          ; $f814: 36 84     
            sec                ; $f816: 38        
            brk                ; $f817: 00        
            .hex af b0 f2      ; $f818: af b0 f2  Invalid Opcode - LAX __f2b0
            inc $3937          ; $f81b: ee 37 39  
            asl $16,x          ; $f81e: 16 16     
            .hex 57 22         ; $f820: 57 22     Invalid Opcode - SRE $22,x
            rol $6a            ; $f822: 26 6a     
            ldx #$22           ; $f824: a2 22     
            rol $6a            ; $f826: 26 6a     
            ldx #$00           ; $f828: a2 00     
            .hex 80 34         ; $f82a: 80 34     Invalid Opcode - NOP #$34
            .hex 34 85         ; $f82c: 34 85     Invalid Opcode - NOP $85,x
            .hex 34 80         ; $f82e: 34 80     Invalid Opcode - NOP $80,x
            .hex 1c 1e 81      ; $f830: 1c 1e 81  Invalid Opcode - NOP __811e,x
            .hex 22            ; $f833: 22        Invalid Opcode - KIL 
            .hex 82 1c         ; $f834: 82 1c     Invalid Opcode - NOP #$1c
            .hex 80 1c         ; $f836: 80 1c     Invalid Opcode - NOP #$1c
            asl $2281,x        ; $f838: 1e 81 22  
            .hex 82 1c         ; $f83b: 82 1c     Invalid Opcode - NOP #$1c
            .hex 62            ; $f83d: 62        Invalid Opcode - KIL 
            .hex 62            ; $f83e: 62        Invalid Opcode - KIL 
            lsr $5c5e,x        ; $f83f: 5e 5e 5c  
            .hex 5c 58 58      ; $f842: 5c 58 58  Invalid Opcode - NOP $5858,x
            .hex 57 16         ; $f845: 57 16     Invalid Opcode - SRE $16,x
            clc                ; $f847: 18        
            .hex 9c 96 59      ; $f848: 9c 96 59  Invalid Opcode - SHY $5996,x
            clc                ; $f84b: 18        
            .hex 1c 9e 98      ; $f84c: 1c 9e 98  Invalid Opcode - NOP __989e,x
            .hex 63 62         ; $f84f: 63 62     Invalid Opcode - RRA ($62,x)
            ror $62            ; $f851: 66 62     
            .hex 5e            ; $f853: 5e        Suspected data
__f854:     .hex 5c 23 00      ; $f854: 5c 23 00  Bad Addr Mode - NOP $0023,x
            sta ($1c,x)        ; $f857: 81 1c     
            .hex 1c 18 18      ; $f859: 1c 18 18  Invalid Opcode - NOP $1818,x
            asl $16,x          ; $f85c: 16 16     
            .hex 3c 3c 82      ; $f85e: 3c 3c 82  Invalid Opcode - NOP __823c,x
            bit $2c4a          ; $f861: 2c 4a 2c  
            lsr                ; $f864: 4a        
            rol $2e4e          ; $f865: 2e 4e 2e  
            lsr $2e34          ; $f868: 4e 34 2e  
            .hex 34 2e         ; $f86b: 34 2e     Invalid Opcode - NOP $2e,x
            sta ($3e,x)        ; $f86d: 81 3e     
            sta $42            ; $f86f: 85 42     
            sty $3e            ; $f871: 84 3e     
            .hex 62            ; $f873: 62        Invalid Opcode - KIL 
            .hex 02            ; $f874: 02        Invalid Opcode - KIL 
            rol $42            ; $f875: 26 42     
            lsr                ; $f877: 4a        
            .hex 42            ; $f878: 42        Invalid Opcode - KIL 
            ror $62            ; $f879: 66 62     
            ror $1f            ; $f87b: 66 1f     
            brk                ; $f87d: 00        
            .hex 82 2c         ; $f87e: 82 2c     Invalid Opcode - NOP #$2c
            lsr                ; $f880: 4a        
            bit __814a         ; $f881: 2c 4a 81  
            lsr $80            ; $f884: 46 80     
            lsr                ; $f886: 4a        
            jmp $2c50          ; $f887: 4c 50 2c  

;-------------------------------------------------------------------------------
            rol __8330         ; $f88a: 2e 30 83  
            .hex 32            ; $f88d: 32        Invalid Opcode - KIL 
            lsr $56,x          ; $f88e: 56 56     
            inc $42            ; $f890: e6 42     
            .hex 5c 62 5e      ; $f892: 5c 62 5e  Invalid Opcode - NOP $5e62,x
            sta $5858,y        ; $f895: 99 58 58  
            inx                ; $f898: e8        
            .hex 42            ; $f899: 42        Invalid Opcode - KIL 
            .hex 62            ; $f89a: 62        Invalid Opcode - KIL 
            ror $62            ; $f89b: 66 62     
            sta $5c5c,x        ; $f89d: 9d 5c 5c  
            dex                ; $f8a0: ca        
            .hex 42            ; $f8a1: 42        Invalid Opcode - KIL 
            ror $68            ; $f8a2: 66 68     
            lsr                ; $f8a4: 4a        
            sta $625e          ; $f8a5: 8d 5e 62  
            inc $42            ; $f8a8: e6 42     
            .hex 5c 5e 62      ; $f8aa: 5c 5e 62  Invalid Opcode - NOP $625e,x
            .hex 1f 00 82      ; $f8ad: 1f 00 82  Invalid Opcode - SLO __8200,x
            .hex 73 72         ; $f8b0: 73 72     Invalid Opcode - RRA ($72),y
            .hex f2            ; $f8b2: f2        Invalid Opcode - KIL 
            adc $74,x          ; $f8b3: 75 74     
            .hex f4 7b         ; $f8b5: f4 7b     Invalid Opcode - NOP $7b,x
            .hex 7a            ; $f8b7: 7a        Invalid Opcode - NOP 
            .hex fa            ; $f8b8: fa        Invalid Opcode - NOP 
            .hex 57 56         ; $f8b9: 57 56     Invalid Opcode - SRE $56,x
            dec $a6,x          ; $f8bb: d6 a6     
            .hex 9c 96 b8      ; $f8bd: 9c 96 b8  Invalid Opcode - SHY __b896,x
            tay                ; $f8c0: a8        
            .hex 9e 98 ba      ; $f8c1: 9e 98 ba  Invalid Opcode - SHX __ba98,y
            lsr __969e,x       ; $f8c4: 5e 9e 96  
            .hex 57 5e         ; $f8c7: 57 5e     Invalid Opcode - SRE $5e,x
            stx $78,y          ; $f8c9: 96 78     
            .hex 33 85         ; $f8cb: 33 85     Invalid Opcode - RLA ($85),y
            .hex 02            ; $f8cd: 02        Invalid Opcode - KIL 
            sta ($32,x)        ; $f8ce: 81 32     
            sec                ; $f8d0: 38        
            .hex 32            ; $f8d1: 32        Invalid Opcode - KIL 
            .hex 83 38         ; $f8d2: 83 38     Invalid Opcode - SAX ($38,x)
            sta ($50,x)        ; $f8d4: 81 50     
            rol $2e34          ; $f8d6: 2e 34 2e  
            .hex 34 2e         ; $f8d9: 34 2e     Invalid Opcode - NOP $2e,x
            sta $34            ; $f8db: 85 34     
            sta ($34,x)        ; $f8dd: 81 34     
            .hex 3a            ; $f8df: 3a        Invalid Opcode - NOP 
            .hex 34 83         ; $f8e0: 34 83     Invalid Opcode - NOP $83,x
            .hex 3a            ; $f8e2: 3a        Invalid Opcode - NOP 
            sta ($2c,x)        ; $f8e3: 81 2c     
            bmi __f91b         ; $f8e5: 30 34     
            bmi __f91d         ; $f8e7: 30 34     
            bmi __f901         ; $f8e9: 30 16     
            asl $1c,x          ; $f8eb: 16 1c     
            asl $38,x          ; $f8ed: 16 38     
            asl $1c,x          ; $f8ef: 16 1c     
            asl $38,x          ; $f8f1: 16 38     
            asl $1e,x          ; $f8f3: 16 1e     
            clc                ; $f8f5: 18        
            .hex 3a            ; $f8f6: 3a        Invalid Opcode - NOP 
            clc                ; $f8f7: 18        
            asl $3a18,x        ; $f8f8: 1e 18 3a  
            clc                ; $f8fb: 18        
            asl $32,x          ; $f8fc: 16 32     
            .hex 80 16         ; $f8fe: 80 16     Invalid Opcode - NOP #$16
            .hex 3a            ; $f900: 3a        Invalid Opcode - NOP 
__f901:     sec                ; $f901: 38        
            .hex 3a            ; $f902: 3a        Invalid Opcode - NOP 
            .hex 83 16         ; $f903: 83 16     Invalid Opcode - SAX ($16,x)
            sta ($02,x)        ; $f905: 81 02     
            .hex 32            ; $f907: 32        Invalid Opcode - KIL 
            .hex 80 16         ; $f908: 80 16     Invalid Opcode - NOP #$16
            .hex 3a            ; $f90a: 3a        Invalid Opcode - NOP 
            sec                ; $f90b: 38        
            .hex 34 86         ; $f90c: 34 86     Invalid Opcode - NOP $86,x
            .hex 32            ; $f90e: 32        Invalid Opcode - KIL 
            sta ($1c,x)        ; $f90f: 81 1c     
            .hex 82 22         ; $f911: 82 22     Invalid Opcode - NOP #$22
            .hex 34 83         ; $f913: 34 83     Invalid Opcode - NOP $83,x
            asl $00,x          ; $f915: 16 00     
            .hex 42            ; $f917: 42        Invalid Opcode - KIL 
            stx $b4,y          ; $f918: 96 b4     
            .hex ec            ; $f91a: ec        Suspected data
__f91b:     .hex 03 83         ; $f91b: 03 83     Invalid Opcode - SLO ($83,x)
__f91d:     brk                ; $f91d: 00        
            .hex 87 4a         ; $f91e: 87 4a     Invalid Opcode - SAX $4a
__f920:     .hex 44 4a         ; $f920: 44 4a     Invalid Opcode - NOP $4a
            .hex 44 4a         ; $f922: 44 4a     Invalid Opcode - NOP $4a
            .hex 44 4a         ; $f924: 44 4a     Invalid Opcode - NOP $4a
            .hex 44 4a         ; $f926: 44 4a     Invalid Opcode - NOP $4a
            .hex 44 4a         ; $f928: 44 4a     Invalid Opcode - NOP $4a
            .hex 82 44         ; $f92a: 82 44     Invalid Opcode - NOP #$44
            asl                ; $f92c: 0a        
            .hex 0c 0e 54      ; $f92d: 0c 0e 54  Invalid Opcode - NOP $540e
            bcc __f932         ; $f930: 90 00     
__f932:     .hex 04 12         ; $f932: 04 12     Invalid Opcode - NOP $12
            .hex 04 12         ; $f934: 04 12     Invalid Opcode - NOP $12
            .hex 04 12         ; $f936: 04 12     Invalid Opcode - NOP $12
            .hex 04 92         ; $f938: 04 92     Invalid Opcode - NOP $92
            brk                ; $f93a: 00        
__f93b:     brk                ; $f93b: 00        
            brk                ; $f93c: 00        
            brk                ; $f93d: 00        
            brk                ; $f93e: 00        
            ora #$0e           ; $f93f: 09 0e     
            .hex 12            ; $f941: 12        Invalid Opcode - KIL 
            asl $02,x          ; $f942: 16 02     
            .hex 02            ; $f944: 02        Invalid Opcode - KIL 
            .hex 1c 02 22      ; $f945: 1c 02 22  Invalid Opcode - NOP $2202,x
            rol $22            ; $f948: 26 22     
            brk                ; $f94a: 00        
            .hex 5c 42 56      ; $f94b: 5c 42 56  Invalid Opcode - NOP $5642,x
            lsr $00,x          ; $f94e: 56 00     
            ora #$07           ; $f950: 09 07     
            ora $00            ; $f952: 05 00     
            dex                ; $f954: ca        
            txa                ; $f955: 8a        
            txa                ; $f956: 8a        
            dex                ; $f957: ca        
            dex                ; $f958: ca        
            dec __ceca         ; $f959: ce ca ce  
            dex                ; $f95c: ca        
            dec __8e8e         ; $f95d: ce 8e 8e  
            dec __d2ce         ; $f960: ce ce d2  
            dec __ced2         ; $f963: ce d2 ce  
            brk                ; $f966: 00        
__f967:     lda #$c0           ; $f967: a9 c0     
            sta $4017          ; $f969: 8d 17 40  
            jsr __fab9         ; $f96c: 20 b9 fa  
            ldx #$00           ; $f96f: a2 00     
            stx $ff            ; $f971: 86 ff     
            stx $fe            ; $f973: 86 fe     
            stx $fd            ; $f975: 86 fd     
            lda $fb            ; $f977: a5 fb     
            cmp #$20           ; $f979: c9 20     
            bcs __f980         ; $f97b: b0 03     
            stx $06b2          ; $f97d: 8e b2 06  
__f980:     cmp #$80           ; $f980: c9 80     
            bcc __f987         ; $f982: 90 03     
            inc $06b2          ; $f984: ee b2 06  
__f987:     tay                ; $f987: a8        
            lsr                ; $f988: 4a        
            lsr                ; $f989: 4a        
            lsr                ; $f98a: 4a        
            lsr                ; $f98b: 4a        
            lsr                ; $f98c: 4a        
            sta $00            ; $f98d: 85 00     
            tya                ; $f98f: 98        
            ldx $06b2          ; $f990: ae b2 06  
            bne __f99a         ; $f993: d0 05     
            sec                ; $f995: 38        
            adc $00            ; $f996: 65 00     
            bne __f99d         ; $f998: d0 03     
__f99a:     clc                ; $f99a: 18        
            sbc $00            ; $f99b: e5 00     
__f99d:     sta $fb            ; $f99d: 85 fb     
            rts                ; $f99f: 60        

;-------------------------------------------------------------------------------
            ldy #$7f           ; $f9a0: a0 7f     
__f9a2:     stx $4000          ; $f9a2: 8e 00 40  
            sty $4001          ; $f9a5: 8c 01 40  
            rts                ; $f9a8: 60        

;-------------------------------------------------------------------------------
__f9a9:     sta $f3            ; $f9a9: 85 f3     
            stx $f4            ; $f9ab: 86 f4     
            sty $06a1          ; $f9ad: 8c a1 06  
            ldx #$9a           ; $f9b0: a2 9a     
            ldy #$08           ; $f9b2: a0 08     
            stx $4004          ; $f9b4: 8e 04 40  
            sty $4005          ; $f9b7: 8c 05 40  
            rts                ; $f9ba: 60        

;-------------------------------------------------------------------------------
__f9bb:     sta $f5            ; $f9bb: 85 f5     
            stx $f6            ; $f9bd: 86 f6     
            sty $06c0          ; $f9bf: 8c c0 06  
            lda #$ff           ; $f9c2: a9 ff     
            sta $4008          ; $f9c4: 8d 08 40  
            lda #$08           ; $f9c7: a9 08     
            sta $400b          ; $f9c9: 8d 0b 40  
            rts                ; $f9cc: 60        

;-------------------------------------------------------------------------------
__f9cd:     stx $f1            ; $f9cd: 86 f1     
            sty $f0            ; $f9cf: 84 f0     
            bne __f9d8         ; $f9d1: d0 05     
__f9d3:     ldy #$7f           ; $f9d3: a0 7f     
__f9d5:     jsr __f9a2         ; $f9d5: 20 a2 f9  
__f9d8:     ldx #$00           ; $f9d8: a2 00     
__f9da:     tay                ; $f9da: a8        
            lda __f391,y       ; $f9db: b9 91 f3  
            beq __f9eb         ; $f9de: f0 0b     
            sta $4002,x        ; $f9e0: 9d 02 40  
            lda __f390,y       ; $f9e3: b9 90 f3  
            ora #$08           ; $f9e6: 09 08     
            sta $4003,x        ; $f9e8: 9d 03 40  
__f9eb:     rts                ; $f9eb: 60        

;-------------------------------------------------------------------------------
__f9ec:     ldx #$04           ; $f9ec: a2 04     
            bne __f9da         ; $f9ee: d0 ea     
__f9f0:     txa                ; $f9f0: 8a        
            and #$3e           ; $f9f1: 29 3e     
            ldx #$08           ; $f9f3: a2 08     
            bne __f9da         ; $f9f5: d0 e3     
__f9f7:     lda #$00           ; $f9f7: a9 00     
__f9f9:     lsr                ; $f9f9: 4a        
            lsr                ; $f9fa: 4a        
            ora #$90           ; $f9fb: 09 90     
            sta $4000          ; $f9fd: 8d 00 40  
            rts                ; $fa00: 60        

;-------------------------------------------------------------------------------
__fa01:     tax                ; $fa01: aa        
            ror                ; $fa02: 6a        
            txa                ; $fa03: 8a        
            rol                ; $fa04: 2a        
            rol                ; $fa05: 2a        
            rol                ; $fa06: 2a        
__fa07:     and #$07           ; $fa07: 29 07     
            clc                ; $fa09: 18        
            adc $068d          ; $fa0a: 6d 8d 06  
            tay                ; $fa0d: a8        
            lda __f3ea,y       ; $fa0e: b9 ea f3  
            rts                ; $fa11: 60        

;-------------------------------------------------------------------------------
__fa12:     tya                ; $fa12: 98        
            lsr                ; $fa13: 4a        
__fa14:     lsr                ; $fa14: 4a        
__fa15:     lsr                ; $fa15: 4a        
            sta $00            ; $fa16: 85 00     
            tya                ; $fa18: 98        
            sec                ; $fa19: 38        
            sbc $00            ; $fa1a: e5 00     
            rts                ; $fa1c: 60        

;-------------------------------------------------------------------------------
__fa1d:     lda $06d1          ; $fa1d: ad d1 06  
            cmp #$80           ; $fa20: c9 80     
            bcs __fa27         ; $fa22: b0 03     
            inc $06d1          ; $fa24: ee d1 06  
__fa27:     lsr                ; $fa27: 4a        
            sta $4011          ; $fa28: 8d 11 40  
            rts                ; $fa2b: 60        

;-------------------------------------------------------------------------------
__fa2c:     lda $06d1          ; $fa2c: ad d1 06  
            beq __fa27         ; $fa2f: f0 f6     
            dec $06d1          ; $fa31: ce d1 06  
            jmp __fa27         ; $fa34: 4c 27 fa  

;-------------------------------------------------------------------------------
__fa37:     ldy #$07           ; $fa37: a0 07     
__fa39:     asl                ; $fa39: 0a        
            bcs __fa3f         ; $fa3a: b0 03     
            dey                ; $fa3c: 88        
            bne __fa39         ; $fa3d: d0 fa     
__fa3f:     rts                ; $fa3f: 60        

;-------------------------------------------------------------------------------
__fa40:     sta $84            ; $fa40: 85 84     
            sty $84            ; $fa42: 84 84     
            sty $8c            ; $fa44: 84 8c     
            .hex 8c 8c         ; $fa46: 8c 8c     Suspected data
__fa48:     sta $f0            ; $fa48: 85 f0     
            sta $06a1          ; $fa4a: 8d a1 06  
            sta $06a2          ; $fa4d: 8d a2 06  
            rts                ; $fa50: 60        

;-------------------------------------------------------------------------------
__fa51:     sty $f0            ; $fa51: 84 f0     
            lda #$08           ; $fa53: a9 08     
            sta $f1            ; $fa55: 85 f1     
            ldx #$9f           ; $fa57: a2 9f     
            ldy #$a5           ; $fa59: a0 a5     
            lda #$04           ; $fa5b: a9 04     
            jsr __f9d5         ; $fa5d: 20 d5 f9  
__fa60:     dec $f1            ; $fa60: c6 f1     
            bne __fab7         ; $fa62: d0 53     
            lda #$8f           ; $fa64: a9 8f     
            jmp __fafa         ; $fa66: 4c fa fa  

;-------------------------------------------------------------------------------
__fa69:     sty $f0            ; $fa69: 84 f0     
            lda #$80           ; $fa6b: a9 80     
            sta $f1            ; $fa6d: 85 f1     
            ldx #$9c           ; $fa6f: a2 9c     
            lda #$56           ; $fa71: a9 56     
            jsr __f9d3         ; $fa73: 20 d3 f9  
__fa76:     dec $f1            ; $fa76: c6 f1     
            lda $f1            ; $fa78: a5 f1     
            beq __fa48         ; $fa7a: f0 cc     
            cmp #$30           ; $fa7c: c9 30     
            bcs __fa83         ; $fa7e: b0 03     
            jsr __f9f9         ; $fa80: 20 f9 f9  
__fa83:     lda $f1            ; $fa83: a5 f1     
            and #$07           ; $fa85: 29 07     
            tay                ; $fa87: a8        
            lda __fa40,y       ; $fa88: b9 40 fa  
            sta $4001          ; $fa8b: 8d 01 40  
            jmp __fdd9         ; $fa8e: 4c d9 fd  

;-------------------------------------------------------------------------------
__fa91:     ldx #$0e           ; $fa91: a2 0e     
            lda #$26           ; $fa93: a9 26     
            jsr __f9cd         ; $fa95: 20 cd f9  
            lda #$fe           ; $fa98: a9 fe     
            sta $f2            ; $fa9a: 85 f2     
            ldx #$84           ; $fa9c: a2 84     
            ldy #$8a           ; $fa9e: a0 8a     
            jsr __f9a2         ; $faa0: 20 a2 f9  
__faa3:     dec $f1            ; $faa3: c6 f1     
            beq __faf8         ; $faa5: f0 51     
            lda $f1            ; $faa7: a5 f1     
            lsr                ; $faa9: 4a        
            bcs __faf5         ; $faaa: b0 49     
            lda $f2            ; $faac: a5 f2     
            tay                ; $faae: a8        
            jsr __fa14         ; $faaf: 20 14 fa  
            sta $f2            ; $fab2: 85 f2     
            sta $4002          ; $fab4: 8d 02 40  
__fab7:     bne __faf5         ; $fab7: d0 3c     
__fab9:     lda $fa            ; $fab9: a5 fa     
            bne __faf5         ; $fabb: d0 38     
            ldy $ff            ; $fabd: a4 ff     
            lda $f0            ; $fabf: a5 f0     
            lsr                ; $fac1: 4a        
            bcs __fa60         ; $fac2: b0 9c     
            lsr $ff            ; $fac4: 46 ff     
            bcs __fa51         ; $fac6: b0 89     
            lsr                ; $fac8: 4a        
            bcs __fa76         ; $fac9: b0 ab     
            lsr $ff            ; $facb: 46 ff     
            bcs __fa69         ; $facd: b0 9a     
            lsr                ; $facf: 4a        
            bcs __faa3         ; $fad0: b0 d1     
            lsr $ff            ; $fad2: 46 ff     
            bcs __fa91         ; $fad4: b0 bb     
            lsr                ; $fad6: 4a        
            lsr $ff            ; $fad7: 46 ff     
            lsr                ; $fad9: 4a        
            bcs __fb0a         ; $fada: b0 2e     
            lsr $ff            ; $fadc: 46 ff     
            bcs __fb03         ; $fade: b0 23     
            lsr                ; $fae0: 4a        
            bcs __fb1b         ; $fae1: b0 38     
            lsr $ff            ; $fae3: 46 ff     
            bcs __fb14         ; $fae5: b0 2d     
            lsr                ; $fae7: 4a        
            bcs __fb34         ; $fae8: b0 4a     
            lsr $ff            ; $faea: 46 ff     
            bcs __fb2d         ; $faec: b0 3f     
            lsr                ; $faee: 4a        
            bcs __fb56         ; $faef: b0 65     
            lsr $ff            ; $faf1: 46 ff     
            bcs __fb50         ; $faf3: b0 5b     
__faf5:     jmp __fc7e         ; $faf5: 4c 7e fc  

;-------------------------------------------------------------------------------
__faf8:     lda #$90           ; $faf8: a9 90     
__fafa:     sta $4000          ; $fafa: 8d 00 40  
            lda #$00           ; $fafd: a9 00     
            sta $f0            ; $faff: 85 f0     
            beq __faf5         ; $fb01: f0 f2     
__fb03:     ldx #$0c           ; $fb03: a2 0c     
            lda #$2c           ; $fb05: a9 2c     
            jsr __f9cd         ; $fb07: 20 cd f9  
__fb0a:     ldx #$85           ; $fb0a: a2 85     
            ldy #$85           ; $fb0c: a0 85     
            dec $f1            ; $fb0e: c6 f1     
__fb10:     beq __faf8         ; $fb10: f0 e6     
            bne __fb4b         ; $fb12: d0 37     
__fb14:     ldx #$0a           ; $fb14: a2 0a     
            lda #$12           ; $fb16: a9 12     
            jsr __f9cd         ; $fb18: 20 cd f9  
__fb1b:     dec $f1            ; $fb1b: c6 f1     
            ldy #$84           ; $fb1d: a0 84     
            lda $f1            ; $fb1f: a5 f1     
            cmp #$03           ; $fb21: c9 03     
            beq __fb10         ; $fb23: f0 eb     
            cmp #$08           ; $fb25: c9 08     
            bcs __fb48         ; $fb27: b0 1f     
            ldy #$8b           ; $fb29: a0 8b     
            bne __fb48         ; $fb2b: d0 1b     
__fb2d:     ldx #$15           ; $fb2d: a2 15     
            lda #$0a           ; $fb2f: a9 0a     
            jsr __f9cd         ; $fb31: 20 cd f9  
__fb34:     dec $f1            ; $fb34: c6 f1     
            beq __fb10         ; $fb36: f0 d8     
            ldy #$84           ; $fb38: a0 84     
            lda $f1            ; $fb3a: a5 f1     
            cmp #$12           ; $fb3c: c9 12     
            bcs __fb42         ; $fb3e: b0 02     
            ldy #$8d           ; $fb40: a0 8d     
__fb42:     cmp #$0a           ; $fb42: c9 0a     
            bcc __fb48         ; $fb44: 90 02     
            lda #$0a           ; $fb46: a9 0a     
__fb48:     ora #$50           ; $fb48: 09 50     
            tax                ; $fb4a: aa        
__fb4b:     jsr __f9a2         ; $fb4b: 20 a2 f9  
            bne __faf5         ; $fb4e: d0 a5     
__fb50:     sty $f0            ; $fb50: 84 f0     
            lda #$0c           ; $fb52: a9 0c     
            sta $f1            ; $fb54: 85 f1     
__fb56:     lda $fb            ; $fb56: a5 fb     
            rol                ; $fb58: 2a        
            rol                ; $fb59: 2a        
            rol                ; $fb5a: 2a        
            sta $4002          ; $fb5b: 8d 02 40  
            rol                ; $fb5e: 2a        
            sta $4003          ; $fb5f: 8d 03 40  
            dec $f1            ; $fb62: c6 f1     
            lda $f1            ; $fb64: a5 f1     
            cmp #$02           ; $fb66: c9 02     
            beq __fb10         ; $fb68: f0 a6     
            ldy #$7f           ; $fb6a: a0 7f     
            bne __fb48         ; $fb6c: d0 da     
__fb6e:     lda #$48           ; $fb6e: a9 48     
            ldx #$fe           ; $fb70: a2 fe     
            jsr __f9a9         ; $fb72: 20 a9 f9  
__fb75:     ldy $f4            ; $fb75: a4 f4     
            dec $f3            ; $fb77: c6 f3     
            lda $f3            ; $fb79: a5 f3     
            beq __fba6         ; $fb7b: f0 29     
            and #$03           ; $fb7d: 29 03     
            beq __fb8c         ; $fb7f: f0 0b     
            cmp #$03           ; $fb81: c9 03     
            beq __fb91         ; $fb83: f0 0c     
            tya                ; $fb85: 98        
            jsr __fa15         ; $fb86: 20 15 fa  
            tay                ; $fb89: a8        
            bne __fb91         ; $fb8a: d0 05     
__fb8c:     jsr __fa12         ; $fb8c: 20 12 fa  
            sta $f4            ; $fb8f: 85 f4     
__fb91:     tya                ; $fb91: 98        
            clc                ; $fb92: 18        
            rol                ; $fb93: 2a        
            rol                ; $fb94: 2a        
            sta $4006          ; $fb95: 8d 06 40  
            rol                ; $fb98: 2a        
            bne __fbc0         ; $fb99: d0 25     
__fb9b:     lda #$1c           ; $fb9b: a9 1c     
            ldx #$2a           ; $fb9d: a2 2a     
            jsr __f9a9         ; $fb9f: 20 a9 f9  
__fba2:     dec $f3            ; $fba2: c6 f3     
            lda $f3            ; $fba4: a5 f3     
__fba6:     beq __fbeb         ; $fba6: f0 43     
            lsr                ; $fba8: 4a        
            lda $f4            ; $fba9: a5 f4     
            bcs __fbb3         ; $fbab: b0 06     
            lsr                ; $fbad: 4a        
            clc                ; $fbae: 18        
            adc $f4            ; $fbaf: 65 f4     
            bne __fbbb         ; $fbb1: d0 08     
__fbb3:     lsr                ; $fbb3: 4a        
            lsr                ; $fbb4: 4a        
            lsr                ; $fbb5: 4a        
            clc                ; $fbb6: 18        
            adc $f4            ; $fbb7: 65 f4     
            sta $f4            ; $fbb9: 85 f4     
__fbbb:     sta $4006          ; $fbbb: 8d 06 40  
            lda #$08           ; $fbbe: a9 08     
__fbc0:     sta $4007          ; $fbc0: 8d 07 40  
            lda $f3            ; $fbc3: a5 f3     
            cmp #$18           ; $fbc5: c9 18     
            bcs __fbcf         ; $fbc7: b0 06     
            lsr                ; $fbc9: 4a        
            ora #$90           ; $fbca: 09 90     
            sta $4004          ; $fbcc: 8d 04 40  
__fbcf:     rts                ; $fbcf: 60        

;-------------------------------------------------------------------------------
__fbd0:     ldy $fe            ; $fbd0: a4 fe     
            lda $06a1          ; $fbd2: ad a1 06  
            lsr $fe            ; $fbd5: 46 fe     
            bcs __fb6e         ; $fbd7: b0 95     
            lsr                ; $fbd9: 4a        
            bcs __fb75         ; $fbda: b0 99     
            lsr                ; $fbdc: 4a        
            bcs __fba2         ; $fbdd: b0 c3     
            lsr $fe            ; $fbdf: 46 fe     
            bcs __fb9b         ; $fbe1: b0 b8     
            lsr $fe            ; $fbe3: 46 fe     
            bcs __fbf4         ; $fbe5: b0 0d     
            lsr                ; $fbe7: 4a        
            bcs __fc08         ; $fbe8: b0 1e     
            rts                ; $fbea: 60        

;-------------------------------------------------------------------------------
__fbeb:     sta $06a1          ; $fbeb: 8d a1 06  
            lda #$10           ; $fbee: a9 10     
            sta $400c          ; $fbf0: 8d 0c 40  
            rts                ; $fbf3: 60        

;-------------------------------------------------------------------------------
__fbf4:     sty $06a1          ; $fbf4: 8c a1 06  
            lda #$20           ; $fbf7: a9 20     
            .hex 85            ; $fbf9: 85        Suspected data
__fbfa:     .hex f3 a9         ; $fbfa: f3 a9     Invalid Opcode - ISC ($a9),y
            .hex 04 85         ; $fbfc: 04 85     Invalid Opcode - NOP $85
            .hex f4 a9         ; $fbfe: f4 a9     Invalid Opcode - NOP $a9,x
            ora $8d            ; $fc00: 05 8d     
            .hex 0c 40 0a      ; $fc02: 0c 40 0a  Invalid Opcode - NOP $0a40
            sta $400f          ; $fc05: 8d 0f 40  
__fc08:     ldy #$02           ; $fc08: a0 02     
            dec $f3            ; $fc0a: c6 f3     
            lda $f3            ; $fc0c: a5 f3     
            beq __fbeb         ; $fc0e: f0 db     
            cmp #$18           ; $fc10: c9 18     
            beq __fc18         ; $fc12: f0 04     
            bcs __fc2b         ; $fc14: b0 15     
            bcc __fc22         ; $fc16: 90 0a     
__fc18:     ldx #$0f           ; $fc18: a2 0f     
            stx $400c          ; $fc1a: 8e 0c 40  
            ldx #$50           ; $fc1d: a2 50     
            stx $400f          ; $fc1f: 8e 0f 40  
__fc22:     ldy $f4            ; $fc22: a4 f4     
            lsr                ; $fc24: 4a        
            bcs __fc30         ; $fc25: b0 09     
            inc $f4            ; $fc27: e6 f4     
            bne __fc2e         ; $fc29: d0 03     
__fc2b:     lsr                ; $fc2b: 4a        
            bcs __fc30         ; $fc2c: b0 02     
__fc2e:     ldy #$0e           ; $fc2e: a0 0e     
__fc30:     sty $400e          ; $fc30: 8c 0e 40  
            rts                ; $fc33: 60        

;-------------------------------------------------------------------------------
__fc34:     ldx #$18           ; $fc34: a2 18     
            jsr __f9bb         ; $fc36: 20 bb f9  
            bne __fc3f         ; $fc39: d0 04     
__fc3b:     dec $f5            ; $fc3b: c6 f5     
            bne __fc91         ; $fc3d: d0 52     
__fc3f:     lda #$05           ; $fc3f: a9 05     
            sta $f5            ; $fc41: 85 f5     
            lda $f6            ; $fc43: a5 f6     
            lsr                ; $fc45: 4a        
            lsr                ; $fc46: 4a        
            clc                ; $fc47: 18        
            adc $f6            ; $fc48: 65 f6     
            bcs __fc8c         ; $fc4a: b0 40     
            sta $f6            ; $fc4c: 85 f6     
            bne __fc6b         ; $fc4e: d0 1b     
__fc50:     ldy #$02           ; $fc50: a0 02     
            lda #$0c           ; $fc52: a9 0c     
            ldx #$6f           ; $fc54: a2 6f     
            jsr __f9bb         ; $fc56: 20 bb f9  
__fc59:     dec $f5            ; $fc59: c6 f5     
            lda $f5            ; $fc5b: a5 f5     
            beq __fc50         ; $fc5d: f0 f1     
            cmp #$06           ; $fc5f: c9 06     
            beq __fc8c         ; $fc61: f0 29     
            lda $f6            ; $fc63: a5 f6     
            tay                ; $fc65: a8        
            jsr __fa14         ; $fc66: 20 14 fa  
            sta $f6            ; $fc69: 85 f6     
__fc6b:     sta $400a          ; $fc6b: 8d 0a 40  
            jsr __fa1d         ; $fc6e: 20 1d fa  
            jmp __fd30         ; $fc71: 4c 30 fd  

;-------------------------------------------------------------------------------
__fc74:     cmp #$06           ; $fc74: c9 06     
            beq __fc3b         ; $fc76: f0 c3     
            cmp #$03           ; $fc78: c9 03     
            beq __fcf9         ; $fc7a: f0 7d     
            bne __fc59         ; $fc7c: d0 db     
__fc7e:     ldx $f9            ; $fc7e: a6 f9     
            bne __fcf0         ; $fc80: d0 6e     
            lda $fc            ; $fc82: a5 fc     
            bne __fc94         ; $fc84: d0 0e     
            sta $06b6          ; $fc86: 8d b6 06  
            sta $06c0          ; $fc89: 8d c0 06  
__fc8c:     lda #$00           ; $fc8c: a9 00     
            sta $4008          ; $fc8e: 8d 08 40  
__fc91:     jmp __fd30         ; $fc91: 4c 30 fd  

;-------------------------------------------------------------------------------
__fc94:     eor $06b6          ; $fc94: 4d b6 06  
            beq __fcc0         ; $fc97: f0 27     
__fc99:     lda $fc            ; $fc99: a5 fc     
            sta $06b6          ; $fc9b: 8d b6 06  
            jsr __fa37         ; $fc9e: 20 37 fa  
            cpy #$06           ; $fca1: c0 06     
            beq __fc34         ; $fca3: f0 8f     
            cpy #$03           ; $fca5: c0 03     
            beq __fcf2         ; $fca7: f0 49     
            cpy #$02           ; $fca9: c0 02     
            beq __fc50         ; $fcab: f0 a3     
            stx $06c0          ; $fcad: 8e c0 06  
            lda __ffa8,y       ; $fcb0: b9 a8 ff  
            sta $0680          ; $fcb3: 8d 80 06  
            lda #$ae           ; $fcb6: a9 ae     
            sta $f5            ; $fcb8: 85 f5     
            lda #$ff           ; $fcba: a9 ff     
            sta $f6            ; $fcbc: 85 f6     
            bne __fccd         ; $fcbe: d0 0d     
__fcc0:     lda $06c0          ; $fcc0: ad c0 06  
            bne __fc74         ; $fcc3: d0 af     
            jsr __fa2c         ; $fcc5: 20 2c fa  
            dec $0698          ; $fcc8: ce 98 06  
            bne __fd30         ; $fccb: d0 63     
__fccd:     ldy $0680          ; $fccd: ac 80 06  
            inc $0680          ; $fcd0: ee 80 06  
            lda ($f5),y        ; $fcd3: b1 f5     
            beq __fc99         ; $fcd5: f0 c2     
            tax                ; $fcd7: aa        
            ror                ; $fcd8: 6a        
            txa                ; $fcd9: 8a        
            rol                ; $fcda: 2a        
            rol                ; $fcdb: 2a        
            rol                ; $fcdc: 2a        
            and #$07           ; $fcdd: 29 07     
            tay                ; $fcdf: a8        
            lda __f409,y       ; $fce0: b9 09 f4  
            sta $0698          ; $fce3: 8d 98 06  
            jsr __f9f0         ; $fce6: 20 f0 f9  
            beq __fd30         ; $fce9: f0 45     
            lda #$10           ; $fceb: a9 10     
            sta $4008          ; $fced: 8d 08 40  
__fcf0:     bne __fd30         ; $fcf0: d0 3e     
__fcf2:     sty $06c0          ; $fcf2: 8c c0 06  
            lda #$06           ; $fcf5: a9 06     
            sta $f5            ; $fcf7: 85 f5     
__fcf9:     ldy #$00           ; $fcf9: a0 00     
            dec $f5            ; $fcfb: c6 f5     
            bne __fd15         ; $fcfd: d0 16     
            lda #$0a           ; $fcff: a9 0a     
            sta $f5            ; $fd01: 85 f5     
            lda $18            ; $fd03: a5 18     
            and $19            ; $fd05: 25 19     
            sta $400a          ; $fd07: 8d 0a 40  
            and #$f0           ; $fd0a: 29 f0     
            bne __fd25         ; $fd0c: d0 17     
            lda $fb            ; $fd0e: a5 fb     
            sta $400a          ; $fd10: 8d 0a 40  
            bne __fd25         ; $fd13: d0 10     
__fd15:     lda $f5            ; $fd15: a5 f5     
            cmp #$05           ; $fd17: c9 05     
            bne __fd30         ; $fd19: d0 15     
            lda $18            ; $fd1b: a5 18     
            sta $400a          ; $fd1d: 8d 0a 40  
            lda $19            ; $fd20: a5 19     
            bne __fd25         ; $fd22: d0 01     
            iny                ; $fd24: c8        
__fd25:     sty $400b          ; $fd25: 8c 0b 40  
            lda #$08           ; $fd28: a9 08     
            sta $4008          ; $fd2a: 8d 08 40  
            jsr __fa1d         ; $fd2d: 20 1d fa  
__fd30:     lda $fd            ; $fd30: a5 fd     
            bne __fd3c         ; $fd32: d0 08     
            lda $06a2          ; $fd34: ad a2 06  
            bne __fd80         ; $fd37: d0 47     
            jmp __fbd0         ; $fd39: 4c d0 fb  

;-------------------------------------------------------------------------------
__fd3c:     jsr __fa37         ; $fd3c: 20 37 fa  
            inc $06a2          ; $fd3f: ee a2 06  
            sty $06f1          ; $fd42: 8c f1 06  
            lda __fe35,y       ; $fd45: b9 35 fe  
            tay                ; $fd48: a8        
            lda __fe35,y       ; $fd49: b9 35 fe  
            sta $068d          ; $fd4c: 8d 8d 06  
            lda __fe36,y       ; $fd4f: b9 36 fe  
            sta $f7            ; $fd52: 85 f7     
            lda __fe37,y       ; $fd54: b9 37 fe  
            sta $f8            ; $fd57: 85 f8     
            lda __fe38,y       ; $fd59: b9 38 fe  
            sta $f9            ; $fd5c: 85 f9     
            lda __fe39,y       ; $fd5e: b9 39 fe  
            sta $fa            ; $fd61: 85 fa     
            lda #$7f           ; $fd63: a9 7f     
            sta $4001          ; $fd65: 8d 01 40  
            sta $4005          ; $fd68: 8d 05 40  
            lda #$01           ; $fd6b: a9 01     
            sta $0695          ; $fd6d: 8d 95 06  
            sta $0696          ; $fd70: 8d 96 06  
            sta $0698          ; $fd73: 8d 98 06  
            ldy #$00           ; $fd76: a0 00     
            sty $0682          ; $fd78: 8c 82 06  
            lda $06f1          ; $fd7b: ad f1 06  
            beq __fd84         ; $fd7e: f0 04     
__fd80:     ldy $fa            ; $fd80: a4 fa     
            beq __fdc2         ; $fd82: f0 3e     
__fd84:     dec $0696          ; $fd84: ce 96 06  
            bne __fdc2         ; $fd87: d0 39     
            inc $fa            ; $fd89: e6 fa     
            lda ($f7),y        ; $fd8b: b1 f7     
            beq __fdd6         ; $fd8d: f0 47     
            bpl __fd9d         ; $fd8f: 10 0c     
            jsr __fa07         ; $fd91: 20 07 fa  
            sta $0691          ; $fd94: 8d 91 06  
            ldy $fa            ; $fd97: a4 fa     
            inc $fa            ; $fd99: e6 fa     
            lda ($f7),y        ; $fd9b: b1 f7     
__fd9d:     jsr __f9d8         ; $fd9d: 20 d8 f9  
            bne __fda6         ; $fda0: d0 04     
            ldy #$10           ; $fda2: a0 10     
            bne __fdb5         ; $fda4: d0 0f     
__fda6:     ldy #$9f           ; $fda6: a0 9f     
            lda $06f1          ; $fda8: ad f1 06  
            beq __fdb5         ; $fdab: f0 08     
            ldy #$06           ; $fdad: a0 06     
            lda $f9            ; $fdaf: a5 f9     
            bne __fdb5         ; $fdb1: d0 02     
            ldy #$86           ; $fdb3: a0 86     
__fdb5:     sty $4000          ; $fdb5: 8c 00 40  
            lda $0691          ; $fdb8: ad 91 06  
            sta $0696          ; $fdbb: 8d 96 06  
            lda #$00           ; $fdbe: a9 00     
            sta $f0            ; $fdc0: 85 f0     
__fdc2:     lda $06f1          ; $fdc2: ad f1 06  
            beq __fe06         ; $fdc5: f0 3f     
            dec $0695          ; $fdc7: ce 95 06  
            bne __fe06         ; $fdca: d0 3a     
            ldy $0682          ; $fdcc: ac 82 06  
            inc $0682          ; $fdcf: ee 82 06  
            lda ($f7),y        ; $fdd2: b1 f7     
            bne __fde6         ; $fdd4: d0 10     
__fdd6:     jsr __f9f7         ; $fdd6: 20 f7 f9  
__fdd9:     lda #$00           ; $fdd9: a9 00     
            sta $fa            ; $fddb: 85 fa     
            sta $f9            ; $fddd: 85 f9     
            sta $06a2          ; $fddf: 8d a2 06  
            sta $4008          ; $fde2: 8d 08 40  
            rts                ; $fde5: 60        

;-------------------------------------------------------------------------------
__fde6:     jsr __fa01         ; $fde6: 20 01 fa  
            sta $0695          ; $fde9: 8d 95 06  
            txa                ; $fdec: 8a        
            and #$3e           ; $fded: 29 3e     
            jsr __f9ec         ; $fdef: 20 ec f9  
            ldy #$87           ; $fdf2: a0 87     
            lda $0695          ; $fdf4: ad 95 06  
            cmp #$10           ; $fdf7: c9 10     
            bcs __fe03         ; $fdf9: b0 08     
            ldy #$85           ; $fdfb: a0 85     
            cmp #$08           ; $fdfd: c9 08     
            bcs __fe03         ; $fdff: b0 02     
            ldy #$82           ; $fe01: a0 82     
__fe03:     sty $4004          ; $fe03: 8c 04 40  
__fe06:     ldy $f9            ; $fe06: a4 f9     
            beq __fe34         ; $fe08: f0 2a     
            jsr __fa2c         ; $fe0a: 20 2c fa  
            dec $0698          ; $fe0d: ce 98 06  
            bne __fe34         ; $fe10: d0 22     
            inc $f9            ; $fe12: e6 f9     
            lda ($f7),y        ; $fe14: b1 f7     
            jsr __fa01         ; $fe16: 20 01 fa  
            sta $0698          ; $fe19: 8d 98 06  
            clc                ; $fe1c: 18        
            adc #$fe           ; $fe1d: 69 fe     
            asl                ; $fe1f: 0a        
            asl                ; $fe20: 0a        
            cmp #$3c           ; $fe21: c9 3c     
            bcc __fe27         ; $fe23: 90 02     
            lda #$3c           ; $fe25: a9 3c     
__fe27:     ldy $06f1          ; $fe27: ac f1 06  
            bne __fe2e         ; $fe2a: d0 02     
            lda #$ff           ; $fe2c: a9 ff     
__fe2e:     sta $4008          ; $fe2e: 8d 08 40  
            jsr __f9f0         ; $fe31: 20 f0 f9  
__fe34:     rts                ; $fe34: 60        

;-------------------------------------------------------------------------------
__fe35:     php                ; $fe35: 08        
__fe36:     .hex 0d            ; $fe36: 0d        Suspected data
__fe37:     .hex 12            ; $fe37: 12        Invalid Opcode - KIL 
__fe38:     .hex 17            ; $fe38: 17        Suspected data
__fe39:     .hex 1c 21 26      ; $fe39: 1c 21 26  Invalid Opcode - NOP $2621,x
            .hex 2b 08         ; $fe3c: 2b 08     Invalid Opcode - ANC #$08
            adc $fe            ; $fe3e: 65 fe     
            asl $00,x          ; $fe40: 16 00     
            brk                ; $fe42: 00        
            sta $fe            ; $fe43: 85 fe     
            ora ($00),y        ; $fe45: 11 00     
            brk                ; $fe47: 00        
            .hex a7 fe         ; $fe48: a7 fe     Invalid Opcode - LAX $fe
            brk                ; $fe4a: 00        
            .hex 13 00         ; $fe4b: 13 00     Invalid Opcode - SLO ($00),y
            .hex d7 fe         ; $fe4d: d7 fe     Invalid Opcode - DCP $fe,x
            brk                ; $fe4f: 00        
            .hex 1c 00 18      ; $fe50: 1c 00 18  Invalid Opcode - NOP $1800,x
            .hex ff 20 00      ; $fe53: ff 20 00  Bad Addr Mode - ISC $0020,x
            .hex 1f 8b ff      ; $fe56: 1f 8b ff  Invalid Opcode - SLO __ff8b,x
            brk                ; $fe59: 00        
            .hex 07 00         ; $fe5a: 07 00     Invalid Opcode - SLO $00
            .hex 9f ff 00      ; $fe5c: 9f ff 00  Invalid Opcode - AHX $00ff,y
            brk                ; $fe5f: 00        
            php                ; $fe60: 08        
            ora #$ff           ; $fe61: 09 ff     
            .hex 1f 3f 81      ; $fe63: 1f 3f 81  Invalid Opcode - SLO __813f,x
            .hex 02            ; $fe66: 02        Invalid Opcode - KIL 
            rti                ; $fe67: 40        

;-------------------------------------------------------------------------------
            lsr $4c            ; $fe68: 46 4c     
            .hex 52            ; $fe6a: 52        Invalid Opcode - KIL 
            rol $3632          ; $fe6b: 2e 32 36  
            .hex 3c 80 18      ; $fe6e: 3c 80 18  Invalid Opcode - NOP $1880,x
            cli                ; $fe71: 58        
            clc                ; $fe72: 18        
            cli                ; $fe73: 58        
            clc                ; $fe74: 18        
            cli                ; $fe75: 58        
            clc                ; $fe76: 18        
            cli                ; $fe77: 58        
            .hex 83 18         ; $fe78: 83 18     Invalid Opcode - SAX ($18,x)
            brk                ; $fe7a: 00        
            .hex 82 6e         ; $fe7b: 82 6e     Invalid Opcode - NOP #$6e
            .hex 72            ; $fe7d: 72        Invalid Opcode - KIL 
            ror $7c,x          ; $fe7e: 76 7c     
            cli                ; $fe80: 58        
            lsr __ea64,x       ; $fe81: 5e 64 ea  
            nop                ; $fe84: ea        
            .hex 62            ; $fe85: 62        Invalid Opcode - KIL 
            txa                ; $fe86: 8a        
            .hex 62            ; $fe87: 62        Invalid Opcode - KIL 
            txa                ; $fe88: 8a        
            ldx #$60           ; $fe89: a2 60     
            txa                ; $fe8b: 8a        
            rts                ; $fe8c: 60        

;-------------------------------------------------------------------------------
            txa                ; $fe8d: 8a        
            ldy #$5e           ; $fe8e: a0 5e     
            txa                ; $fe90: 8a        
            lsr __8e8a,x       ; $fe91: 5e 8a 8e  
            .hex 13 00         ; $fe94: 13 00     Invalid Opcode - SLO ($00),y
            stx $9c,y          ; $fe96: 96 9c     
            ldx #$96           ; $fe98: a2 96     
            stx $9a,y          ; $fe9a: 96 9a     
            ldy #$9a           ; $fe9c: a0 9a     
            tya                ; $fe9e: 98        
            .hex 9e a6 8a      ; $fe9f: 9e a6 8a  Invalid Opcode - SHX __8aa6,y
            .hex 82 20         ; $fea2: 82 20     Invalid Opcode - NOP #$20
            .hex 62            ; $fea4: 62        Invalid Opcode - KIL 
            .hex 02            ; $fea5: 02        Invalid Opcode - KIL 
            .hex f4 96         ; $fea6: f4 96     Invalid Opcode - NOP $96,x
            cli                ; $fea8: 58        
            .hex 5c 9e 9c      ; $fea9: 5c 9e 9c  Invalid Opcode - NOP __9c9e,x
            tya                ; $feac: 98        
            lsr $bc,x          ; $fead: 56 bc     
            sei                ; $feaf: 78        
            ldy $96,x          ; $feb0: b4 96     
            cli                ; $feb2: 58        
            .hex 5c 9e 9c      ; $feb3: 5c 9e 9c  Invalid Opcode - NOP __9c9e,x
            tya                ; $feb6: 98        
            lsr $fc,x          ; $feb7: 56 fc     
            brk                ; $feb9: 00        
            .hex 82 34         ; $feba: 82 34     Invalid Opcode - NOP #$34
            sta ($38,x)        ; $febc: 81 38     
            .hex 3c 82 16      ; $febe: 3c 82 16  Invalid Opcode - NOP $1682,x
            asl $16,x          ; $fec1: 16 16     
            sta ($38,x)        ; $fec3: 81 38     
            .hex 82 34         ; $fec5: 82 34     Invalid Opcode - NOP #$34
            sta ($32,x)        ; $fec7: 81 32     
            .hex 82 30         ; $fec9: 82 30     Invalid Opcode - NOP #$30
            .hex 34 81         ; $fecb: 34 81     Invalid Opcode - NOP $81,x
            sec                ; $fecd: 38        
            .hex 3c 82 16      ; $fece: 3c 82 16  Invalid Opcode - NOP $1682,x
            asl $16,x          ; $fed1: 16 16     
            sta ($38,x)        ; $fed3: 81 38     
            sty $34            ; $fed5: 84 34     
            .hex 5c 64 6a      ; $fed7: 5c 64 6a  Invalid Opcode - NOP $6a64,x
            jmp $6660          ; $feda: 4c 60 66  

;-------------------------------------------------------------------------------
            lsr                ; $fedd: 4a        
            .hex 4e 10         ; $fede: 4e 10     Suspected data
__fee0:     .hex 0c 0e 0a      ; $fee0: 0c 0e 0a  Invalid Opcode - NOP $0a0e
            .hex 0c 2a 0a      ; $fee3: 0c 2a 0a  Invalid Opcode - NOP $0a2a
            rol $2a            ; $fee6: 26 2a     
            .hex 22            ; $fee8: 22        Invalid Opcode - KIL 
            rol $1e            ; $fee9: 26 1e     
            .hex 22            ; $feeb: 22        Invalid Opcode - KIL 
            .hex 1c 1e 18      ; $feec: 1c 1e 18  Invalid Opcode - NOP $181e,x
            .hex 17            ; $feef: 17        Suspected data
__fef0:     .hex 03 83         ; $fef0: 03 83     Invalid Opcode - SLO ($83,x)
            brk                ; $fef2: 00        
            .hex 82 30         ; $fef3: 82 30     Invalid Opcode - NOP #$30
            .hex 52            ; $fef5: 52        Invalid Opcode - KIL 
            pha                ; $fef6: 48        
            .hex 42            ; $fef7: 42        Invalid Opcode - KIL 
            rol $4a52          ; $fef8: 2e 52 4a  
            .hex 44 81         ; $fefb: 44 81     Invalid Opcode - NOP $81
            rol $4440,x        ; $fefd: 3e 40 44  
__ff00:     .hex 82 4a         ; $ff00: 82 4a     Invalid Opcode - NOP #$4a
            sta ($4e,x)        ; $ff02: 81 4e     
            bit __842e         ; $ff04: 2c 2e 84  
            bit __9602         ; $ff07: 2c 02 96  
            ldx #$5c           ; $ff0a: a2 5c     
            .hex 57 bc         ; $ff0c: 57 bc     Invalid Opcode - SRE $bc,x
            ldx #$5c           ; $ff0e: a2 5c     
            adc __96b8,x       ; $ff10: 7d b8 96  
            lsr $5ea2,x        ; $ff13: 5e a2 5e  
            .hex dc d8 96      ; $ff16: dc d8 96  Invalid Opcode - NOP __96d8,x
            ldx #$5c           ; $ff19: a2 5c     
            .hex 57 bc         ; $ff1b: 57 bc     Invalid Opcode - SRE $bc,x
            ldx #$5c           ; $ff1d: a2 5c     
            adc __96b8,x       ; $ff1f: 7d b8 96  
            .hex 5c a2 5c      ; $ff22: 5c a2 5c  Invalid Opcode - NOP $5ca2,x
            cld                ; $ff25: d8        
            dec $00,x          ; $ff26: d6 00     
            stx $b4,y          ; $ff28: 96 b4     
            bcs __fee0         ; $ff2a: b0 b4     
            .hex 9c bc b4      ; $ff2c: 9c bc b4  Invalid Opcode - SHY __b4bc,x
            ldy __969e,x       ; $ff2f: bc 9e 96  
            clv                ; $ff32: b8        
            stx $96,y          ; $ff33: 96 96     
            ldy $b4,x          ; $ff35: b4 b4     
            tya                ; $ff37: 98        
            stx $b4,y          ; $ff38: 96 b4     
            bcs __fef0         ; $ff3a: b0 b4     
            .hex 9c bc b4      ; $ff3c: 9c bc b4  Invalid Opcode - SHY __b4bc,x
            ldy __969e,x       ; $ff3f: bc 9e 96  
            bcs __ff00         ; $ff42: b0 bc     
            .hex 74 b4         ; $ff44: 74 b4     Invalid Opcode - NOP $b4,x
            ror __83d6         ; $ff46: 6e d6 83  
            .hex 02            ; $ff49: 02        Invalid Opcode - KIL 
            sta ($02,x)        ; $ff4a: 81 02     
            asl                ; $ff4c: 0a        
            .hex 0c 0e 83      ; $ff4d: 0c 0e 83  Invalid Opcode - NOP __830e
            .hex 02            ; $ff50: 02        Invalid Opcode - KIL 
            sta ($02,x)        ; $ff51: 81 02     
            rol                ; $ff53: 2a        
            asl                ; $ff54: 0a        
            .hex 0c 02 1e      ; $ff55: 0c 02 1e  Invalid Opcode - NOP $1e02
            rol $0a            ; $ff58: 26 0a     
            .hex 02            ; $ff5a: 02        Invalid Opcode - KIL 
            rol $0a            ; $ff5b: 26 0a     
            bpl __ff61         ; $ff5d: 10 02     
            .hex 0e 0a         ; $ff5f: 0e 0a     Suspected data
__ff61:     asl $0c02          ; $ff61: 0e 02 0c  
            rol                ; $ff64: 2a        
            .hex 0c 82 0a      ; $ff65: 0c 82 0a  Invalid Opcode - NOP $0a82
            .hex 87 0a         ; $ff68: 87 0a     Invalid Opcode - SAX $0a
            asl $1284          ; $ff6a: 0e 84 12  
            .hex 82 02         ; $ff6d: 82 02     Invalid Opcode - NOP #$02
            rol                ; $ff6f: 2a        
            .hex 87 2a         ; $ff70: 87 2a     Invalid Opcode - SAX $2a
            .hex 1c 84 12      ; $ff72: 1c 84 12  Invalid Opcode - NOP $1284,x
            .hex 83 02         ; $ff75: 83 02     Invalid Opcode - SAX ($02,x)
            .hex 87 1e         ; $ff77: 87 1e     Invalid Opcode - SAX $1e
            asl                ; $ff79: 0a        
            sty $10            ; $ff7a: 84 10     
            .hex 87 1c         ; $ff7c: 87 1c     Invalid Opcode - SAX $1c
            rol                ; $ff7e: 2a        
            sty $0e            ; $ff7f: 84 0e     
            .hex 87 22         ; $ff81: 87 22     Invalid Opcode - SAX $22
            rol                ; $ff83: 2a        
            stx $0c            ; $ff84: 86 0c     
            .hex 87 1c         ; $ff86: 87 1c     Invalid Opcode - SAX $1c
            .hex 22            ; $ff88: 22        Invalid Opcode - KIL 
            .hex 83 0a         ; $ff89: 83 0a     Invalid Opcode - SAX ($0a,x)
            .hex c2 03         ; $ff8b: c2 03     Invalid Opcode - NOP #$03
            .hex c2 03         ; $ff8d: c2 03     Invalid Opcode - NOP #$03
            .hex c2 03         ; $ff8f: c2 03     Invalid Opcode - NOP #$03
            brk                ; $ff91: 00        
            .hex 83 2a         ; $ff92: 83 2a     Invalid Opcode - SAX ($2a,x)
            sty $0a            ; $ff94: 84 0a     
            .hex 83 54         ; $ff96: 83 54     Invalid Opcode - SAX ($54,x)
            sty $12            ; $ff98: 84 12     
            .hex 83 56         ; $ff9a: 83 56     Invalid Opcode - SAX ($56,x)
            sty $04            ; $ff9c: 84 04     
            brk                ; $ff9e: 00        
            .hex 04 12         ; $ff9f: 04 12     Invalid Opcode - NOP $12
            .hex 04 12         ; $ffa1: 04 12     Invalid Opcode - NOP $12
            .hex 04 12         ; $ffa3: 04 12     Invalid Opcode - NOP $12
            .hex 04 52         ; $ffa5: 04 52     Invalid Opcode - NOP $52
            brk                ; $ffa7: 00        
__ffa8:     brk                ; $ffa8: 00        
            brk                ; $ffa9: 00        
            brk                ; $ffaa: 00        
            brk                ; $ffab: 00        
            .hex 13 2e         ; $ffac: 13 2e     Invalid Opcode - SLO ($2e),y
            .hex 9f 99 97      ; $ffae: 9f 99 97  Invalid Opcode - AHX __9799,y
            eor __9f9f,y       ; $ffb1: 59 9f 9f  
            eor __9997,y       ; $ffb4: 59 97 99  
            .hex a3 9d         ; $ffb7: a3 9d     Invalid Opcode - LAX ($9d,x)
            sta __a35d,y       ; $ffb9: 99 5d a3  
            .hex a3 5d         ; $ffbc: a3 5d     Invalid Opcode - LAX ($5d,x)
            sta $009d,y        ; $ffbe: 99 9d 00  
            lsr $569e,x        ; $ffc1: 5e 9e 56  
            lsr $569e,x        ; $ffc4: 5e 9e 56  
            lsr $569e,x        ; $ffc7: 5e 9e 56  
            lsr $5e5c,x        ; $ffca: 5e 5c 5e  
            rts                ; $ffcd: 60        

;-------------------------------------------------------------------------------
            .hex 62            ; $ffce: 62        Invalid Opcode - KIL 
            ldx #$58           ; $ffcf: a2 58     
            .hex 62            ; $ffd1: 62        Invalid Opcode - KIL 
            ldx #$58           ; $ffd2: a2 58     
            .hex 62            ; $ffd4: 62        Invalid Opcode - KIL 
            ldx #$58           ; $ffd5: a2 58     
            .hex 62            ; $ffd7: 62        Invalid Opcode - KIL 
            rts                ; $ffd8: 60        

;-------------------------------------------------------------------------------
            .hex 62            ; $ffd9: 62        Invalid Opcode - KIL 
            .hex 64 00         ; $ffda: 64 00     Invalid Opcode - NOP $00
            asl                ; $ffdc: 0a        
            asl                ; $ffdd: 0a        
            asl                ; $ffde: 0a        
            asl                ; $ffdf: 0a        
            .hex 0c 0e 10      ; $ffe0: 0c 0e 10  Invalid Opcode - NOP $100e
            bpl __fff5         ; $ffe3: 10 10     
            bpl __fff5         ; $ffe5: 10 0e     
            .hex 0c 00 ff      ; $ffe7: 0c 00 ff  Invalid Opcode - NOP __ff00
            .hex ff ff ff      ; $ffea: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffed: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fff0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff         ; $fff3: ff ff     Suspected data
__fff5:     .hex ff ff         ; $fff5: ff ff     Suspected data
__fff7:     jmp __f415         ; $fff7: 4c 15 f4  

;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: 3f ee     Vector table
            .dw reset                      ; $fffc: b7 ed     Vector table
            .dw irq                        ; $fffe: 8c ee     Vector table

;-------------------------------------------------------------------------------
; CHR-ROM
;-------------------------------------------------------------------------------
            .incbin d_k_classic.chr ; Include CHR-ROM
