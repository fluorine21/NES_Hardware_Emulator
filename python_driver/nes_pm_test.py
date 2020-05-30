# -*- coding: utf-8 -*-
"""
Created on Tue May 26 16:43:38 2020

@author: James Williams
"""

import nes_fpga
chr_file = "../games/pm/pm_ppu.txt"
pgr_file = "../games/pm/pm_cpu.txt"


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
NES_obj.load_pgrom(pgr_file, 0, 0x8000)
NES_obj.resume_cpu()
    
NES_obj.close_nes()
