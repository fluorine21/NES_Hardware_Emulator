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
    
NES_obj.write_bytes([nes_fpga.HALT_CPU])

#Halt the CPU to see if the LED comes on
#NES_obj.halt_cpu()
    
#if(NES_obj.mem_test() == -1):
#    print("Mem test failed")
#else:
#    print("Mem test passed!")
    
#if(NES_obj.vram_test() == -1):
#    print("VRAM test failed")
#else:
#    print("VRAM test passed!")
        


#Set the PPU control registers to display sprites and background

NES_obj.write_byte(0x2000, 0x88)
NES_obj.write_byte(0x2001, 0x18)


#Try reading those registers back to make sure they were set
if(NES_obj.read_byte(0x2000) != 0x88):
    print("Failed to write ppu_ctrl1")
else:
    print("Successfully wrote ppu_ctrl1")
if(NES_obj.read_byte(0x2001) != 0x18):
    print("Failed to write ppu_ctrl2")
else:
    print("Successfully wrote ppu_ctrl2")

#Write the scroll pointer
NES_obj.write_byte(0x2005, 0)
NES_obj.write_byte(0x2005, 0)

#write and verrify the spram listing
#NES_obj.write_spram(sl)
#NES_obj.verify_spram(sl)
nametable_file = "nametable_dump.txt"
chr_file = "../games/smb/smb_ppu_mem.txt"
NES_obj.load_chrom(chr_file, 0)
NES_obj.write_nametable(nametable_file)
NES_obj.override_color_table()

#write and verify the vram listing
#NES_obj.resume_cpu()


#Reset the spram address pointer
NES_obj.write_byte(0x2003, 0);

#Set the CPU address to 2002 so we're resetting ppu vsync
NES_obj.read_byte(0x2002)


#NES_obj.resume_cpu()

col_pos = 16
#for i in range(0, 50):
#    time.sleep(1)
#    
#    NES_obj.halt_cpu()
#    NES_obj.write_byte(0x2003, 0x07)
#    NES_obj.write_byte(0x2004, col_pos&255)
#    NES_obj.write_byte(0x2003, 0x07)
#    byte_res = NES_obj.read_byte(0x2004)
#    if(byte_res != col_pos&255):
#        print("Failed to write new sprite column")
#    else:
#        print("Successfully wrote new sprite column")
#    col_pos += 3
#    
#    #Reset the sprite address
#    NES_obj.write_byte(0x2003, 0)
#    
#    NES_obj.resume_cpu()



NES_obj.close_nes()
    

