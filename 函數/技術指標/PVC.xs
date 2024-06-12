{@type:function}
SetBarMode(1);

Input: Length(numericsimple, "天數");

value1 = Average(Volume, Length);
if value1 <> 0 then
	PVC = 100 * (Volume - value1) / value1
else
	PVC = 0;
