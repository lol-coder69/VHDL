module regFile32(
input [4:0] ReadReg1,
input [4:0] ReadReg2,
input [4:0] WriteReg,
input [31:0] WriteData,
output [31:0] DataRead1,
output [31:0] DataRead2,
input RegisterWrite,
input Clock
);

reg [31:0] register[0:31];
integer i;

initial begin
for(i = 0;i < 32; i = i+1)begin
  register[i] <= 32'd0; //using for loop to initialize the 32 registers of width 32 bits
end
end

always@(posedge Clock)begin
if(RegisterWrite == 1'b1 && WriteReg != 5'd0)begin
register[WriteReg] <= WriteData;
end
end
  //grounding the register[0] regardless of the state
assign DataRead1 = (ReadReg1 == 5'd0)?32'd0:register[ReadReg1];
assign DataRead2 = (ReadReg2 == 5'd0)?32'd0:register[ReadReg2];

endmodule
