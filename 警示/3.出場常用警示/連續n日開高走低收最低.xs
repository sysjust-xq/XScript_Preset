{@type:sensor}
input:Length(2); setinputname(1,"計算期數");

settotalbar(Length + 3);

if Trueall( Open > Close[1]*1.005 and Close<open and close = low , Length) then ret=1;