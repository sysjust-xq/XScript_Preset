{@type:sensor}
input:Vtimes(3);            setinputname(1,"爆量倍數");
input:atVolume(100);            setinputname(2,"暴量門檻張數");
input:TXT1("僅適用1分鐘");  setinputname(3,"使用限制");
input:TXT2("盤中可用");  setinputname(4,"使用說明:建議日內單次觸發");
settotalbar(300);
if barfreq <> "Min" or Barinterval <> 1 then return;

variable: OpenVolume(0), OpenVolumeDate(0);
if CurrentBar = 1 then
  begin
	// 找到當日第一筆分鐘K線的成交量
	//
	variable: idx(0);
	idx = 0;
	while date[idx] = date
	  begin
		OpenVolume = Volume[idx];
		OpenVolumeDate = date[idx];
		idx = idx + 1;
	  end;
  end
else
	if Date <> OpenVolumeDate then
	  begin
		// 開盤量為換日後的第一筆分鐘K線的成交量
		OpenVolumeDate = Date;
		OpenVolume = Volume;
	  end;
if CurrentDate = OpenVolumeDate And 
   OpenVolume > AtVolume And
   OpenVolume > GetQuote("昨量")/270 * Vtimes then ret=1;

