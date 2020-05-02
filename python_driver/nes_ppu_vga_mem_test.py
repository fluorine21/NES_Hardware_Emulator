# -*- coding: utf-8 -*-
"""
Created on Wed Apr 29 21:44:08 2020

@author: James Williams
"""

import vram_listing
import spram_listing
import nes_fpga
import time

sl = spram_listing.spram_listing
vl = vram_listing.vram_listing

print("\n~~~~~Did you recompile with clks per bit = 217?~~~~~\n")

#Start by appending spram listing with 0s to avoid garbage sprites
#224 appends
for i in range(0, 224):
    
    spram_listing.spram_listing.append(i+32)
    spram_listing.spram_listing.append(0)
    
    
#Create the NES object
NES_obj = nes_fpga.NES_FPGA("COM8")

NES_obj.open_nes()



#Ping the board
if(NES_obj.ping_board() != 1):
    print("Error communicating with NES, unable to ping board\n")
    #quit()    
else:
    print("Connection to board is up!")
    

#Halt the CPU to see if the LED comes on
#NES_obj.halt_cpu()
    
if(NES_obj.mem_test() == -1):
    print("Mem test failed")
else:
    print("Mem test passed!")
        


#Set the PPU control registers to display sprites and background
NES_obj.write_byte(0x2000, 0x08)
NES_obj.write_byte(0x2001, 0x18)


#Write the scroll pointer
NES_obj.write_byte(0x2005, 0)
NES_obj.write_byte(0x2005, 0)

#write and verrify the spram listing
NES_obj.write_spram(sl)
NES_obj.verify_spram(sl)

#write and verify the vram listing
NES_obj.write_vram(vl)
NES_obj.verify_vram(vl)


#Set the CPU address to 2002 so we're resetting ppu vsync
NES_obj.read_byte(0x2002)


NES_obj.resume_cpu()
NES_obj.close_nes()
    

