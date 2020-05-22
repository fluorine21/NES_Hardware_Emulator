# -*- coding: utf-8 -*-
"""
Created on Thu May 21 21:57:06 2020

@author: James Williams
"""

import nes_fpga


chr_file = "../games/smb/smb_ppu_mem.txt"
NES_obj = nes_fpga.NES_FPGA("COM8")
NES_obj.open_nes()
NES_obj.override_color_table()

NES_obj.write_bytes([nes_fpga.HALT_CPU])
NES_obj.load_chrom(chr_file, 0)
NES_obj.write_bytes([nes_fpga.RESUME_CPU])