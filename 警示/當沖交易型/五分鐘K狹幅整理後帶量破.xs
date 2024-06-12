{@type:sensor}
input:Length(100,"計算期數");
input:Ratio(0.5,"突破幅度%");
input:RRatio(1.5,"盤整區間幅度%");
input:TXT1("僅適用5分鐘線","使用限制");
 
settotalbar(3);
setbarback(Length);
 
if barfreq<> "Min" or barinterval <> 5 then return;
 
variable: RangeHigh(0);
variable: RangeLow(0);
RangeHigh=highest(close[1],length);
RangeLow=lowest(close[1],length);
 
if RangeHigh[1] < RangeLow[1] * (1+ RRatio/100) then begin
	if Close crosses over RangeHigh*(1+Ratio/100)
	and volume>average(volume,length)*1.5
	and trueall(GetField("成交量","D")>500,10)
	and countif(GetField("主力買賣超張數","D")[1]>0,10)>=7
	and GetSymbolField("tse.tw","收盤價","D")>GetSymbolField("tse.tw","收盤價","D")[1]
	and GetSymbolField("tse.tw","收盤價","D")>average(GetSymbolField("tse.tw","收盤價","D"),5)
	then ret=1;
end;