module alu32bit(
input [31:0] a,
input [31:0] b,
input [5:0] opcode,
output reg [31:0]res,
output reg [31:0]res_High,
output reg zf, //zero flag
output reg sf, //sign flag
output reg cf, //carry flag
output reg lt, //less than
output reg gt, //greater than
output reg eq, //equal to
integer i
);

wire [63:0] Product;
wire [63:0] Sn_Product;
assign Product = (a*b);
assign Sn_Product = ($signed(a)*$signed(b));

always @(*)begin
cf = 1'b0;
lt = 1'b0;
gt = 1'b0;
eq = 1'b0;
res_High = 32'd0;

case(opcode)
//arithmetic operations
6'b00_0000:begin
res = Product[31:0];
res_High = Product[63:32];
end
6'b00_0001:begin
res = Sn_Product[31:0];
res_High = Sn_Product[63:32];
end
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

//shift operations
6'b11_1100:res = {a<<b[4:0]};
6'b10_0001:res = {a>>b[4:0]};
6'b10_1001:res = {b<<a[4:0]};
6'b00_0001:res = {b>>a[4:0]};

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
default:res = 31'd0;

endcase
zf = (res == 31'd0)?1'b1:1'b0;
sf = res[31];
end 
endmodule
