`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/05 13:29:42
// Design Name: 
// Module Name: instr_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//1
module instr_decoder(
    input [31:0]instr_code,
    input decoder_ena,
    output reg [53:0] i

    );
    wire [11:0] tmp;
    assign tmp = {instr_code[31:26],instr_code[5:0]};
    always @ (*)
    begin
        if (decoder_ena)begin
        
            casez(tmp)
                12'b000000100000 :i = 54'b000000000000000000000000000000000000000000000000000001;//add 0
                12'b000000100001 :i = 54'b000000000000000000000000000000000000000000000000000010;//addu 1
                12'b000000100010 :i = 54'b000000000000000000000000000000000000000000000000000100;//sub 2
                12'b000000100011 :i = 54'b000000000000000000000000000000000000000000000000001000;//subu 3
                12'b000000100100 :i = 54'b000000000000000000000000000000000000000000000000010000;//and 4
                12'b000000100101 :i = 54'b000000000000000000000000000000000000000000000000100000;//or 5
                12'b000000100110 :i = 54'b000000000000000000000000000000000000000000000001000000;//xor 6
                12'b000000100111 :i = 54'b000000000000000000000000000000000000000000000010000000;//nor 7
                12'b000000101010 :i = 54'b000000000000000000000000000000000000000000000100000000;//slt 8  //rd �?(rs < rt)
                12'b000000101011 :i = 54'b000000000000000000000000000000000000000000001000000000;//sltu 9
                12'b000000000000 :i = 54'b000000000000000000000000000000000000000000010000000000;//sll 10  //rd �? rt << sa
                12'b000000000010 :i = 54'b000000000000000000000000000000000000000000100000000000;//srl 11
                12'b000000000011 :i = 54'b000000000000000000000000000000000000000001000000000000;//sra 12 
                12'b000000000100 :i = 54'b000000000000000000000000000000000000000010000000000000;//sllv 13 //rd �? rt << rs
                12'b000000000110 :i = 54'b000000000000000000000000000000000000000100000000000000;//srlv 14
                12'b000000000111 :i = 54'b000000000000000000000000000000000000001000000000000000;//srav 15
                12'b000000001000 :i = 54'b000000000000000000000000000000000000010000000000000000;//jr 16
                12'b001000?????? :i = 54'b000000000000000000000000000000000000100000000000000000;//addi 17
                12'b001001?????? :i = 54'b000000000000000000000000000000000001000000000000000000;//addiu 18 
                12'b001100?????? :i = 54'b000000000000000000000000000000000010000000000000000000;//andi 19
                12'b001101?????? :i = 54'b000000000000000000000000000000000100000000000000000000;//ori 20
                12'b001110?????? :i = 54'b000000000000000000000000000000001000000000000000000000;//xori 21
                12'b100011?????? :i = 54'b000000000000000000000000000000010000000000000000000000;//lw 22
                12'b101011?????? :i = 54'b000000000000000000000000000000100000000000000000000000;//sw 23
                12'b000100?????? :i = 54'b000000000000000000000000000001000000000000000000000000;//beq 24
                12'b000101?????? :i = 54'b000000000000000000000000000010000000000000000000000000;//bne 25
                12'b001010?????? :i = 54'b000000000000000000000000000100000000000000000000000000;//slti 26
                12'b001011?????? :i = 54'b000000000000000000000000001000000000000000000000000000;//sltiu 27
                12'b001111?????? :i = 54'b000000000000000000000000010000000000000000000000000000;//lui 28
                12'b000010?????? :i = 54'b000000000000000000000000100000000000000000000000000000;//j 29
                12'b000011?????? :i = 54'b000000000000000000000001000000000000000000000000000000;//jal 30
                12'b011100100000 :i = 54'b000000000000000000000010000000000000000000000000000000;//clz 31
                12'b000000011011 :i = 54'b000000000000000000000100000000000000000000000000000000;//divu 32
                12'b000000011010 :i = 54'b000000000000000000001000000000000000000000000000000000;//div 33
                12'b011100000010 :i = 54'b000000000000000000010000000000000000000000000000000000;//mul 34
                12'b000000011001 :i = 54'b000000000000000000100000000000000000000000000000000000;//mulu 35
                12'b000000001001 :i = 54'b000000000000000001000000000000000000000000000000000000;//jalr 36
                12'b000001?????? :i = 54'b000000000000000010000000000000000000000000000000000000;//bgez 37
                12'b100001?????? :i = 54'b000000000000000100000000000000000000000000000000000000;//lh 38
                12'b100000?????? :i = 54'b000000000000001000000000000000000000000000000000000000;//lb 39
                12'b100100?????? :i = 54'b000000000000010000000000000000000000000000000000000000;//lbu 40
                12'b100101?????? :i = 54'b000000000000100000000000000000000000000000000000000000;//lhu 41
                12'b101000?????? :i = 54'b000000000001000000000000000000000000000000000000000000;//sb 42
                12'b101001?????? :i = 54'b000000000010000000000000000000000000000000000000000000;//sh 43
                // 12'b010000000000 :i = 54'b000000000100000000000000000000000000000000000000000000;//mfc0 44 cp0->rf
                // 12'b010000000000 :i = 54'b000000001000000000000000000000000000000000000000000000;//mtc0 45
                12'b000000010000 :i = 54'b000000010000000000000000000000000000000000000000000000;//mfhi 46 rf->hi
                12'b000000010001 :i = 54'b000000100000000000000000000000000000000000000000000000;//mthi 47
                12'b000000010010 :i = 54'b000001000000000000000000000000000000000000000000000000;//mflo 48
                12'b000000010011 :i = 54'b000010000000000000000000000000000000000000000000000000;//mtlo 49
                12'b010000011000 :i = 54'b000100000000000000000000000000000000000000000000000000;//eret 50 cp0->pc
                12'b000000001100 :i = 54'b001000000000000000000000000000000000000000000000000000;//syscall 51
                12'b000000110100 :i = 54'b010000000000000000000000000000000000000000000000000000;//teq 52
                12'b000000001101 :i = 54'b100000000000000000000000000000000000000000000000000000;//break 53
                default:  begin
                    if (instr_code[31:21]==11'b01000000000)begin
                        i = 54'b000000000100000000000000000000000000000000000000000000;//mfc0 44
                    end
                    else if(instr_code[31:21]==11'b01000000100)begin
                        i = 54'b000000001000000000000000000000000000000000000000000000;//mtc0 45
                    end
                    else begin
                        i = 54'bx;
                    end
                end        

                
            endcase
         
        end
    end
endmodule
 /*
����

*/  