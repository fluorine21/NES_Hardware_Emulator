# -*- coding: utf-8 -*-
"""
Created on Mon May 25 23:18:58 2020

@author: James Williams
"""

import nes_fpga
#chr_file = "../test_programs/joy_test_ppu.txt"
#pgr_file = "../test_programs/joy_test_cpu.txt"
chr_file = "../test_programs/vram_test_ppu.txt"
pgr_file = "../test_programs/vram_test_rom.txt"

#chr_file = "../test_programs/pallet_test_ppu.txt"
#pgr_file = "../test_programs/pallet_test_cpu.txt"

#chr_file = "../test_programs/ppu_full_ppu.txt"
#pgr_file = "../test_programs/ppu_full_cpu.txt"

NES_obj = nes_fpga.NES_FPGA("COM8")


NES_obj.open_nes();

if(NES_obj.ping_board()):
    print("Connected to board!")
else:
    print("Failed to ping board!")
    
NES_obj.halt_cpu();


NES_obj.load_chrom(chr_file, 0)
#NES_obj.write_byte(0x2006, 0x00)
#NES_obj.write_byte(0x2006, 0x00)

#A for vram test
#C for joycon test
#E for pallet test
#8 for ppu full

NES_obj.load_pgrom(pgr_file, 0, 0xA000)#0xC000
NES_obj.resume_cpu()
    
NES_obj.close_nes()