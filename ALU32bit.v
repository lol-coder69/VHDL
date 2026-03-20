module alu32bit(
input [31:0] a,
input [31:0] b,
input [5:0] opcode,
output reg [31:0]res,
output reg zf, //zero flag
output reg sf, //sign flag
output reg cf, //carry flag
output reg lt, //less than
output reg gt, //greater than
output reg eq, //equal to
integer i
);

always @(*)begin
cf = 1'b0;
case(opcode)
//arithmetic operations
6'b00_0000://opcode for multiplication
6'b00_0100:res = {a+b};
6'b00_1000:begin
res = {a-b};
if(a < b)begin
cf = 1'b1;
end
end
6'b01_0100:res = {a+1'b1};
6'b10_0000:res = {a-1'b1};
6'b10_0100:res = {b-1'b1};
6'b10_1000:res = {b+1'b1};

//logical operations
6'b00_1100:res = {a&b};
6'b01_1100:res = {a|b};
6'b01_1000:res = {~(a&b)};
6'b01_0000:res = {a^b};

//comparison operations
6'b10_1100:eq = (a == b)?
6'b11_0000:gt = (a > b)?
6'b11_0100:lt = (a < b)?
6'b10_0010:gt = ($signed(a) < $signed(b))?
6'b10_0111:lt = ($signed(a) > $signed(b))?
6'b11_1000:eq = ($signed(a) == $signed(b))?

//shift operations
6'b11_1100:res = {32'd0, a<<b[4:0]};
6'b10_0001:res = {32'd0, a>>b[4:0]};
6'b10_1001:res = {32'd0, b<<a[4:0]};
6'b00_0001:res = {32'd0, b>>a[4:0]};

//arithmetic shift operations
6'b10_1010:res = {$signed(a)>>>b[4:0]};
6'b10_0110:res = {$signed(a)<<<b[4:0]};
6'b00_0111:res = {$signed(b)>>>a[4:0]};
6'b00_1100:res = {$signed(b)<<<a[4:0]};

//rotational operations
6'b11_1001:res = {(a>>b[4:0])|(a<<(32 - b[4:0]))};
6'b11_1000:res = {(a<<b[4:0])|(a>>(32 - b[4:0]))};
6'b11_0001:res = {(b>>a[4:0])|(b<<(32 - a[4:0]))};
6'b10_1001:res = {(b<<a[4:0])|(b>>(32 - a[4:0]))};

//default case
default:res = 64'd0;

endcase
zf = (res == 64'd0)?1'b1:1'b0;
sf = res[63];
end 
endmodule
