{@type:function}
SetBarMode(1);

variable: support(0), resist(0), hlDiff(0);
 
support = (Close - Low);
resist = (High - Close);
hlDiff = (High - Low);

if hlDiff = 0 then
	VAO = 0
else
	VAO = (support - resist) / hlDiff * v;
