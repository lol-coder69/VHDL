module alu32bit(
input [31:0] a,
input [31:0] b,
input [5:0] opcode,//6 bit opcode for operations
output reg [63:0]res,
output reg zf,
output reg sf,
output reg cf
);

always @(*)begin
cf = 1'b0;
case(opcode)
//arithmetic operations
6'b00_0000:res = a*b;
6'b00_0100:res = {32'd0, a+b};
6'b00_1000:begin
res = {32'd0, a-b};
if(a < b)begin
cf = 1'b1;
end
end
6'b01_0100:res = {32'd0, a+1'b1};
6'b10_0000:res = {32'd0, a-1'b1};
6'b10_0100:res = {32'd0, b-1'b1};
6'b10_1000:res = {32'd0, b+1'b1};

//logical operations
6'b00_1100:res = {32'd0, a&b};
6'b01_1100:res = {32'd0, a|b};
6'b01_1000:res = {32'd0, ~(a&b)};
6'b01_0000:res = {32'd0, a^b};

//comparison operations
6'b10_1100:res = (a == b)?64'd1:64'd0;
6'b11_0000:res = (a > b)?64'd1:64'd0;
6'b11_0100:res = (a < b)?64'd1:64'd0;

//shift operations
6'b11_1100:res = {32'd0, a<<b[4:0]};
6'b10_0001:res = {32'd0, a>>b[4:0]};
6'b10_1001:res = {32'd0, b<<a[4:0]};
6'b00_0001:res = {32'd0, b>>a[4:0]};

//arithmetic shift operations
6'b10_1010:res = {32'd0, $signed(a)>>>b[4:0]};
6'b10_0110:res = {32'd0, $signed(a)<<<b[4:0]};
6'b00_0111:res = {32'd0, $signed(b)>>>a[4:0]};
6'b00_1100:res = {32'd0, $signed(b)<<<a[4:0]};

//rotational operations
6'b11_1001:res = {32'd0,(a>>b[4:0])|(a<<(32 - b[4:0]))};
6'b11_1000:res = {32'd0,(a<<b[4:0])|(a>>(32 - b[4:0]))};
6'b11_0001:res = {32'd0,(b>>a[4:0])|(b<<(32 - a[4:0]))};
6'b10_1001:res = {32'd0,(b<<a[4:0])|(b>>(32 - a[4:0]))};

//default case
default:res = 64'd0;

endcase
zf = (res == 64'd0)?1'b1:1'b0;
sf = res[63];
end 
endmodule
