{@type:sensor|@guid:6b2d180f9335487ea8da41489e0fe44e|@path:/2.市場常用語/高點回檔n%|@hash:7db1070bca1a438b849868a4a47275d7}
input:Length(20);  setinputname(1,"尋找高點期數");
input:percent(7); setinputname(2,"自高點回檔幅度%");

settotalbar(Length + 3);

if close < highest(high,Length)*(1- percent/100) then Ret=1;