{@type:sensor}
input:Length(200,"尋找高點期數");
input:percent(38.2,"自高點回檔幅度%");
 
if close < highest(high,Length)*(1- percent/100) then Ret=1;