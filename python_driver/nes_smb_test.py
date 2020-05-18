# -*- coding: utf-8 -*-
"""
Created on Sun May 17 15:46:39 2020

@author: James Williams
"""


import nes_fpga

chr_file = "../games/smb/smb_ppu_mem.txt"

NES_obj = nes_fpga.NES_FPGA("COM9")


NES_obj.load_chrom(chr_file)