{@type:sensor}
input:OpenGap(1); setinputname(1,"開高幅度%");
input:Downpercent(1);setinputname(2,"從最高點回檔下跌幅度%");

settotalbar(3);

if  GetField("High", "D") = GetField("Open", "D") and
    GetField("Open", "D") > GetField("RefPrice", "D") * (1+ OpenGap/100) and
    Close < GetField("High", "D") * (1 - Downpercent/100)
then ret=1;