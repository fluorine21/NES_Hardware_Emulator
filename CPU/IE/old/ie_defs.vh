



//Flags for determining where to load/store things from
`define zero 0//source
`define a_reg 1//source/dest
`define x_reg 2//source/dest
`define y_reg 3//source/dest
`define mem_load 4//source
`define mem_store 5//dest
`define imm 6//source
`define one 7

//Branch instructions		   
`define BCC 8'h04//Branch on carry clear
`define BCS 8'h05//Branch on carry set
`define BEQ 8'h06//Branch on zero set
`define BMI 8'h07//Branch on minus set
`define BNE 8'h08//Branch on zero clear
`define BPL 8'h09//Branch on minus clear
`define BVC 8'h0A//Branch on overflow clear
`define BVS 8'h0B//Branch on overflow set
`define JMP 8'h1C//Jump direct or indirect 

`define ADD
`define ADC // add with carry
`define SUB
`define AND
`define OR
`define ASL
`define ASR
`define RR
`define RL
`define XOR
`define NAND
`define NOR