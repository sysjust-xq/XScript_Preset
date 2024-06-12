{@type:sensor}
input:Length(6); setinputname(1,"起始期數");
input:TLength(20); setinputname(2,"終止期數");
input:AddLength(1); setinputname(3,"期數調整項");
input:TuneRatio(3); setinputname(4,"調整係數");

settotalbar(TLength + 8);

variable: AvgTR(0);

if Length >= TLength then return;

AvgTR = average(TrueRange,Length);

value2 = intportion( (TLength -Length)/ AddLength);
for value1 =  Length to TLength
begin
    if mod( value1 ,AddLength) = 0  or value1 =TLength then
	 begin
		if (AvgTR > Close *  TuneRatio*0.01 ) then
		begin
		AvgTR = average(TrueRange,value1);
		value3 = value1; 
		end;
   end;
end;

if close crosses over  average(close[1] ,value3) then ret=1;