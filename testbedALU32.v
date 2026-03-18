
`timescale 1ns / 1ps

module tb_alu_32bit();

    reg [31:0] a;
    reg [31:0] b;
    reg [3:0] opcode;

    wire [63:0] res;
    wire zf, sf, cf;

    // Instantiate the ALU
    alu32bit uut (
        .a(a), 
        .b(b), 
        .opcode(opcode), 
        .res(res), 
        .zf(zf), 
        .sf(sf), 
        .cf(cf)
    );

    initial begin
        // TEST 1: Subtraction (Checking Borrow/Less Than)
        a = 32'd100; 
        b = 32'd200;
        opcode = 4'b0010; // SUB
        #20; 
        // TEST 2: Logical Shift Left (LSL)
        a = 32'h00000001; // Decimal 1
        b = 32'd4;        // Shift by 4
        opcode = 4'b1011; // LSL
        #20; 
        // TEST 3: Arithmetic Shift Right (ASR)
        // Shifting a negative number (MSB is 1)
        a = 32'hFFFF0000; 
        b = 32'd4;        // Shift by 4
        opcode = 4'b1101; // ASR
        #20; 
        // TEST 4: Rotate Right (ROR)
        a = 32'h00000005; // Binary: ...0101
        b = 32'd1;        // Rotate right by 1
        opcode = 4'b1110; // ROR
        #20; 
        // Result: 0x80000002

        $finish;
    end

endmodule
