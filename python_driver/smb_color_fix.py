# -*- coding: utf-8 -*-
"""
Created on Thu May 21 21:57:06 2020

@author: James Williams
"""

import nes_fpga

NES_obj = nes_fpga.NES_FPGA("COM8")
NES_obj.open_nes()
NES_obj.override_color_table()