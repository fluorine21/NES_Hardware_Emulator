# -*- coding: utf-8 -*-

import serial

DEFAULT_BAUD = 9600
UART_TIMEOUT = 0.1

HALT_CPU = 0x00 
RESUME_CPU = 0x01
WRITE_BYTE = 0x02
READ_BYTE = 0x03
RESET_CPU = 0x04
PING_BOARD = 0x05
ACK_RESPONSE = 0

#02 20 06 00 02 20 06 00 02 20 07 AB
#02 20 06 00 02 20 06 00 03 20 07

class NES_FPGA:
    port = None
    
    def __init__(self, portname):
        self.port = serial.Serial()
        self.port.baudrate = DEFAULT_BAUD
        self.port.port = portname
        self.port.timeout = UART_TIMEOUT
        
    def open_nes(self):
        self.port.open()
        
    def close_nes(self):
        self.port.close()

    def ping_board(self):
        try:
            #self.port.open()
            #self.port.reset_input_buffer()
            self.port.write([PING_BOARD])
            #self.port.flush()
            result = self.wait_ack()
            #self.port.reset_input_buffer()
            #self.port.close()
            if result == ACK_RESPONSE:
                return 1
            else:
                return 0
        except:
            #self.port.close()
            return 0
        
    #Writes a byte stream over serial and waits for ack    
    #Used by everything except writing or reading bytes from CPU address space
    def write_bytes(self, b):
        try:
            #self.port.open()
            if not self.port.is_open:
                return -1
            #self.port.reset_input_buffer()
            self.port.write(b)
            #Wait until everything is written
            self.port.flush()
            #wait for the ack
            ret_val = self.wait_ack()
            #close the port
            #self.port.close()
            return ret_val
        except:
            #self.port.close()
            return -1
        
    #returns ACK_RESPONSE if ack successfully recieved
    def wait_ack(self):
        try:
            rv = self.port.read(1)
            #self.port.reset_input_buffer()
            return rv[0]
        except:
            print("Error waiting for ACK from NES\n")
            return -1
        
        
    def halt_cpu(self):
        
        #Send the halt CPU command
        if(self.write_bytes([HALT_CPU]) == -1):
            print("Error halting cpu\n")
        
    def reset_cpu(self):
        
        #Send the reset CPU command
        if(self.write_bytes([RESET_CPU]) == -1):
            print("Error resetting cpu\n")
     
        
        
    def resume_cpu(self):
        
         #Send the start CPU command
        if(self.write_bytes([RESUME_CPU]) == -1):
            print("Error resuming cpu\n")

    #Returns a byte read from the CPU's memory space at address
    #Returns -1 if request timed out
    def read_byte(self, address):
        
        #Send the write byte command
        #Then the high address byte
        #Then the low address byte
        #Then wait for the response
        
        if(address > 65535):
            print("Error, address for read_byte too high!")
            return
        try:
            #self.port.open()
            addr_high = int(address / 256)
            addr_low = int(address & 255)
            self.port.write([READ_BYTE, addr_high, addr_low])
            byte_result = self.port.read(1)
            #self.port.close()
            return byte_result[0]
        
        except:
            #self.port.close()
            return -1
        
        
        
    #Writes a byte to the CPU's address space
    #Returns -1 on faliure, 0 on success
    def write_byte(self, address, data):
        
        #Send the write byte command
        #Then the high address byte
        #Then the low address byte
        #Then wait for the response
        
        if(address > 65535):
            print("Error, address for read_byte too high!")
            return
        try:
            #self.port.open()
            addr_high = int(address / 256)
            addr_low = int(address & 255)
            payload = [WRITE_BYTE, addr_high, addr_low, data&255]
            self.port.write(payload)
            self.port.flushOutput()
            byte_result = self.port.read(1)
            #self.port.close()
            if(byte_result[0] == 0):
                return 0
            return -1
        
        except:
            #self.port.close()
            return -1
        
    
        
    def write_vram(self, listing):
        
        #Halt the cpu first
        self.halt_cpu()
        
        for i in range(0, int(len(listing)/2)):
            
            result = 0
            
            #Write the high address byte to 2006
            result += self.write_vram_byte(listing[i*2], listing[(i*2)+1])
        
            
            if(result != 0):
                print("Error writing bytes: addr = " + hex(int(listing[i*2]/256)) + hex(int(listing[i*2]&255)))
                print(", data = " + hex(int(listing[(i*2)+1]&255)) + "\n")
                return
            
            
        
        #unhalt the CPU 
        self.resume_cpu()
             
            
    def verify_vram(self, listing):
                
        #Halt the CPU first
        self.halt_cpu()
        
        pass_cnt = 0
        fail_cnt = 0
        
        for i in range(0, int(len(listing)/2)):
            
            result = 0
            
            #Write the high address byte to 2006
            byte_result = self.read_vram_byte(listing[i*2])
            byte_result = self.read_vram_byte(listing[i*2])
            byte_result = self.read_vram_byte(listing[i*2])
            
            if(result != 0):
                print("Error, timeout while verifying vram listing\n")
                continue
            
            if(byte_result != int(listing[(i*2)+1]&255)):
                print("Error verrifying address " + hex(int(listing[i*2]/256)) + hex(int(listing[i*2]&255)) + ", ")
                print("expecting " + hex(int(listing[(i*2)+1]&255)) + ", got " + hex(byte_result) + "\n")
                fail_cnt += 1
            else:
                pass_cnt += 1
            
        
        
        #unhalt the CPU 
        self.resume_cpu()
        print("VRAM listing check complete, " + str(pass_cnt) + " passed, " + str(fail_cnt) + " failed")
        
    #Writes an spram listing to spram
    def write_spram(self, listing):
        
        #Halt the CPU first
        self.halt_cpu()
        
        
        for i in range(0, int(len(listing)/2)):
            
            result = 0
            #Write the address byte to 2003
            result += self.write_byte(0x2003, int(listing[i*2]&255))
            
            #Write the data to 2004
            result += self.write_byte(0x2004, int(listing[(i*2)+1]&255))
            
            if(result != 0):
                print("Error writing bytes to SPRAM at addr = " + hex(int(listing[i*2]&255)))
                print(", data = " + str(int(listing[(i*2)+1]&255)) + "\n")
        
        
         #unhalt the CPU 
        self.resume_cpu()
        #Reset spram address back to 0
        self.write_byte(0x2003, 0)
        
        #Writes an spram listing to spram
    def verify_spram(self, listing):
        
        #Halt the CPU first
        self.halt_cpu()
        
        pass_cnt = 0
        fail_cnt = 0
        
        for i in range(0, int(len(listing)/2)):
            
           
            
            result = 0
            #Write the address byte to 2003
            result += self.write_byte(0x2003, int(listing[i*2]&255))
            
            #Write the data to 2004
            byte_result = self.read_byte(0x2004)
            
            if(result != 0):
                print("Error, timeout while verifying spram listing\n")
                continue
            
            if(byte_result != int(listing[(i*2)+1]&255)):
                print("Error readig bytes to SPRAM at addr = " + hex(int(listing[i*2]&255)))
                print(", expected " + int(listing[(i*2)+1]&255) + ", got " + hex(byte_result) + "\n")
                fail_cnt = fail_cnt + 1
            else:
                pass_cnt = pass_cnt + 1
        
        
         #unhalt the CPU 
        self.resume_cpu()
        #Reset the sprite address back to 0
        self.write_byte(0x2003, 0)
        
        print("SPRAM listing check complete, " + str(pass_cnt) + " passed, " + str(fail_cnt) + " failed")
        
        
    def mem_test(self):
        
        #Halt the CPU first
        self.halt_cpu()
        
        #Try writing 0000
        self.write_byte(0x0000, 0xAB)
        b_res = self.read_byte(0x0000)
        
        if(b_res != 0xAB):
            print("Unable to access memory at 0x0000")
            self.resume_cpu()
            return -1
            
        #Try writing C000
        self.write_byte(0xC000, 0x12)
        b_res = self.read_byte(0xC000)
        
        #unhalt the CPU
        
        self.resume_cpu()
        
        if(b_res != 0x12):
            print("Unable to access memory at 0xC000")
            return -1
            
        return 0
    
    def write_vram_byte(self, addr, data):
        
        self.halt_cpu()
        ret_v = 0
        payload = [WRITE_BYTE, 0x20, 0x06, int(addr/256)&255, WRITE_BYTE, 0x20, 0x06, int(addr)&255, WRITE_BYTE, 0x20, 0x07, int(data)&255]
        self.port.write(payload)
        self.port.flushOutput()
        port_res = self.port.read(3)
        if(port_res[0] != 0x00 or port_res[1] != 0x00 or port_res[2] != 0x00):
            print("Unexpected output from VRAM when writing byte")
            ret_v = -1
        self.port.flushInput()
    
        return ret_v
        
    def read_vram_byte(self, addr):
        
        self.halt_cpu()
        self.port.flushInput()
        payload = [WRITE_BYTE, 0x20, 0x06, int(addr/256)&255, WRITE_BYTE, 0x20, 0x06, int(addr)&255, READ_BYTE, 0x20, 0x07]
        self.port.write(payload)
        self.port.flushOutput()
        byte_arr = self.port.read(3)
        if(byte_arr[0] != 0x00 or byte_arr[1] != 0x00):
            print("Unexpected output from VRAM when reading byte")
            
        self.port.flushInput()
    
        return byte_arr[2]
        
        
    
    def vram_test(self):
        
        ret_v = 0
        
        self.halt_cpu()
        
        #Try writing to 0x0000
        self.write_vram_byte(0x0000, 0xAB)
        
        #Try reading back 0x0000
        byte_result = self.read_vram_byte(0x0000)
        byte_result = self.read_vram_byte(0x0000)
        byte_result = self.read_vram_byte(0x0000)

        if(byte_result != 0xAB):
            print("Unable to access VRAM at 0x0000")
            ret_v = -1
        
        
        # and 0x2000
        self.write_vram_byte(0x2000, 0xCD)
        
        
            
        #Try reading back 0x2000
        byte_result = self.read_vram_byte(0x2000)
        byte_result = self.read_vram_byte(0x2000)
        byte_result = self.read_vram_byte(0x2000)
        
        if(byte_result != 0xCD):
            print("Unable to access VRAM at 0x0000")
            ret_v = -1
            
            
        #Try reading back 0x0000 again
        byte_result = self.read_vram_byte(0x0000)
        byte_result = self.read_vram_byte(0x0000)
        byte_result = self.read_vram_byte(0x0000)
        
        if(byte_result != 0xAB):
            print("Unable to access VRAM at 0x0000 on second access")
            ret_v = -1
        
       
        self.resume_cpu()   
            
        return ret_v
            
            
            