{@type:sensor}
input: Periods(5); setinputname(1,"N天內第一根漲停");
input: Size(1500); setinputname(2,"漲停委賣張數");
settotalbar(Periods + 3);

if Periods < 1 then return;

if q_ask=GetField("漲停價", "D") and q_bestasksize1<Size then 
begin
	for value1 = 1 to Periods
	begin
		if closeD(value1-1) > closeD(value1) * 1.065 then return;
	end;
	ret=1;
end;