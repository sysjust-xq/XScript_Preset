{@type:sensor|@guid:3ded5bb880024236894e4d3dfa5df5f6|@path:/價量指標/今日高點回跌|@hash:0d6d0b36c7c036c728342d76d2096ef5}
input:HighBound(2); setinputname(1,"高點幅度%");
input:Reaction(1); setinputname(2,"回檔預警幅度%");

settotalbar(3);

if GetField("High", "D") > GetField("RefPrice", "D")*(1+0.01*HighBound) and
   Close <=  GetField("High", "D")*(1-0.01*Reaction) then
   ret = 1;
