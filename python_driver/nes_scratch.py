# -*- coding: utf-8 -*-
"""
Created on Wed May 20 16:44:51 2020

@author: James Williams
"""


import nes_fpga

NES_obj = nes_fpga.NES_FPGA("COM8")


#NES_obj.load_chrom(chr_file)


NES_obj.open_nes();

NES_obj.halt_cpu();

print("Status was " + hex(NES_obj.read_byte(0x2002)));

NES_obj.resume_cpu();