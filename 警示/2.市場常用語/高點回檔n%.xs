{@type:sensor}
input:Length(20);  setinputname(1,"尋找高點期數");
input:percent(7); setinputname(2,"自高點回檔幅度%");

settotalbar(Length + 3);

if close < highest(high,Length)*(1- percent/100) then Ret=1;