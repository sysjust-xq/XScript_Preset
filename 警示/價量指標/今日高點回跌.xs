{@type:sensor}
input:HighBound(2); setinputname(1,"高點幅度%");
input:Reaction(1); setinputname(2,"回檔預警幅度%");

settotalbar(3);

if GetField("High", "D") > GetField("RefPrice", "D")*(1+0.01*HighBound) and
   Close <=  GetField("High", "D")*(1-0.01*Reaction) then
   ret = 1;
