{@type:sensor}
input: lastvolume1(2000);  setinputname(1,"跌停期間放量張數");
input: lastvolume2(10000); setinputname(2,"當日總成交量上限");
input:TXT1("需使用逐筆洗價"); setinputname(3,"使用限制");
settotalbar(3);
variable: DNLVol(0);

if Date <> Date[1] then DNLVol = 0;

if Close = GetField("跌停價", "D") then 
begin
  DNLVol += GetField("Volume", "Tick");
  if q_BestAskSize1 <lastvolume1 and 
     GetField("Volume", "D") >lastvolume2 and
	 DNLVol > lastvolume1 
  then RET=1;
end;
