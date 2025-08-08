{@type:indicator}
input: periods(5, "期數");
 
Value1 = Angle(Date[periods], Date);

Plot1(Value1, "角度");