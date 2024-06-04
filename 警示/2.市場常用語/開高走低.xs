{@type:sensor|@guid:4d348647549f4f079e063596ab7d6f0c|@path:/2.市場常用語/開高走低|@hash:7c9997f1409df8e78681383fc6047f3b}
input:OpenGap(1); setinputname(1,"開高幅度%");
input:Downpercent(1);setinputname(2,"從最高點回檔下跌幅度%");

settotalbar(3);

if  GetField("High", "D") = GetField("Open", "D") and
    GetField("Open", "D") > GetField("RefPrice", "D") * (1+ OpenGap/100) and
    Close < GetField("High", "D") * (1 - Downpercent/100)
then ret=1;