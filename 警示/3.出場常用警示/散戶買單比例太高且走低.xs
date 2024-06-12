{@type:sensor}
input:ratio(20); setinputname(1,"散戶買單比例%");
input:TXT("須逐筆洗價"); setinputname(2,"使用限制");

//單筆外盤成交值低於五十萬元稱為散單 //內外盤:內盤-1 外盤1
variable: intrabarpersist ACount(0);
variable: intrabarpersist TimeStamp(0);

settotalbar(3);

if barfreq ="Min" and currentdate = date then //分鐘線在今天時
begin
  TimeStamp =currenttime;
  if TimeStamp = TimeStamp[1] then  ACount=0;
  if TimeStamp[1] <= time  then // 盤中開啟 or 換Bar第一個進價
  begin
      if  GetField("內外盤","Tick") > 0 and GetField("Volume", "Tick") *Close <=500 then
            ACount = GetField("Volume", "Tick") *Close
 	    else 
	        ACount=0;
  end
  else
  begin
     if  GetField("內外盤","Tick") > 0 and GetField("Volume", "Tick") *Close <=500 then ACount+= GetField("Volume", "Tick") *Close;
  end;
  if ACount >= Ratio/100 * volume*close and  
     Close < GetField("RefPrice", "D")*0.985 and GetField("High", "D") < GetField("RefPrice", "D")*1.005 then ret=1;
end;

if barfreq ="D" then 
begin
  if  Date <> currentdate then Acount=0;
  if  GetField("內外盤","Tick") > 0 and GetField("Volume", "Tick") *Close <=500 then ACount+= GetField("Volume", "Tick") *Close;
  if ACount >= Ratio/100 * GetField("Volume", "D") * GetField("均價") and
     Close < GetField("RefPrice", "D")*0.985 and GetField("High", "D") < GetField("RefPrice", "D")*1.005 then ret=1;
end;

