module PC32(
input [31:0] PC_in,
output reg [31:0] PC_out,
input Clock, //clock signal
input RST, //reset signal
input PC_write
);

initial begin
PC_out = 32'h00000000;
end

always @(posedge Clock)begin
//program counter always updates it result at rising edge of the clock
if(RST == 1)begin
PC_out <= 32'h00000000;
end
else 
begin
if(PC_write == 1)begin
PC_out <= PC_in;
end
end

end
endmodule
