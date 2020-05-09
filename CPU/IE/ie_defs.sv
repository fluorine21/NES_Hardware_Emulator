

package ie_defs;

//Flags for determining where to load/store things from
localparam [7:0] zero = 0,//source
a_reg = 1,//source/dest
x_reg = 2,//source/dest
y_reg = 3,//source/dest
mem_load = 4,//source
mem_store = 5,//dest
imm = 6,//source
one = 7;

//Branch instructions		   
localparam [7:0] BCC = 8'h04,//Branch on carry clear
BCS = 8'h05,//Branch on carry set
BEQ = 8'h06,//Branch on zero set
BMI = 8'h07,//Branch on minus set
BNE = 8'h08,//Branch on zero clear
BPL = 8'h09,//Branch on minus clear
BVC = 8'h0A,//Branch on overflow clear
BVS = 8'h0B,//Branch on overflow set
JMP = 8'h1C;//Jump direct or indirect 





endpackage