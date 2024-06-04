{@type:sensor|@guid:6e7c6ae66cf840debf65c7532ab16b59|@path:/長線投資/大跌後的定存股標的}
input:Length(200,"尋找高點期數");
input:percent(38.2,"自高點回檔幅度%");
 
if close < highest(high,Length)*(1- percent/100) then Ret=1;