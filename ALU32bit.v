//verilog code for a 32 bit alu which performs arthimetic operations , logical operations and shift-rotate operations 

module alu32bit(
input [31:0] a,
input [31:0] b,
  input [5:0] opcode,//opcodes for performing operations
output reg [63:0]res,
output reg zf,
output reg sf,
output reg cf
);

always @(*)begin
cf = 1'b0;
case(opcode)
//arithmetic operations
6'b000000:res = a*b;
6'b000100:res = {32'd0, a+b};
6'b001000:begin
res = {32'd0, a-b};
if(a < b)begin
cf = 1'b1;
end
end
6'b010100:res = {32'd0, a+1'b1};
6'b100000:res = {32'd0, a-1'b1};
6'b100100:res = {32'd0, b-1'b1};
6'b101000:res = {32'd0, b+1'b1};

//logical operations
6'b001100:res = {32'd0, a&b};
6'b011100:res = {32'd0, a|b};
6'b011000:res = {32'd0, ~(a&b)};
6'b010000:res = {32'd0, a^b};

//comparison operations
6'b101100:res = (a == b)?64'd1:64'd0;
6'b110000:res = (a > b)?64'd1:64'd0;
6'b110100:res = (a < b)?64'd1:64'd0;

//shift operations
6'b111100:res = {32'd0, a<<b[4:0]};
6'b100001:res = {32'd0, a>>b[4:0]};
6'b101001:res = {32'd0, b<<b[4:0]};
6'b000001:res = {32'd0, b>>b[4:0]};

//arithmetic shift operations
6'b101010:res = {32'd0, $signed(a)>>>b[4:0]};
6'b100110:res = {32'd0, $signed(a)<<<b[4:0]};
6'b000111:res = {32'd0, $signed(b)>>>b[4:0]};
6'b001100:res = {32'd0, $signed(b)<<<b[4:0]};

//rotational operations
6'b111001:res = {32'd0,(a>>b[4:0])|(a<<(32 - b[4:0]))};
6'b111000:res = {32'd0,(a<<b[4:0])|(a>>(32 - b[4:0]))};
6'b110001:res = {32'd0,(b>>b[4:0])|(b<<(32 - b[4:0]))};
6'b101001:res = {32'd0,(b<<b[4:0])|(b>>(32 - b[4:0]))};

//default case
default:res = 64'd0;

endcase
zf = (res == 64'd0)?1'b1:1'b0;
sf = res[63];
end 
endmodule
