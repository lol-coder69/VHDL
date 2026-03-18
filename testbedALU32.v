`timescale 1ps/1ps

module tb_alu_32bit();
    reg [31:0] a;
    reg [31:0] b;
    reg [5:0] opcode;

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
        opcode = 6'b00_1000; // SUB
        #200; 
        // TEST 2: Logical Shift Left (LSL)
        a = 32'h00000001; // Decimal 1
        b = 32'd4;        // Shift by 4
        opcode = 6'b11_1100; // LSL
        #200; 
        // TEST 3: Arithmetic Shift Right (ASR)
        // Shifting a negative number (MSB is 1)
        a = 32'hFFFF0000; 
        b = 32'd4;        // Shift by 4
        opcode = 6'b10_1010; // ASR
        #200; 
        // TEST 4: Rotate Right (ROR)
        a = 32'h00000005; // Binary: ...0101
        b = 32'd1;        // Rotate right by 1
        opcode = 6'b11_1001; // ROR
        #200; 
        // Result: 0x80000002

        $finish;
    end

endmodule
