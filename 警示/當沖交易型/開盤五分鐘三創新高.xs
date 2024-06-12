{@type:sensor}
input: volumeRatio(0.1, "分鐘量暴量比例");
input: changeRatio(3, "最近3日最大上漲幅度");
input: averageVolume(1000, "5日均量");

variable:KBarOfDay(0), BreakHigh(false); 
 
KBarOfDay+=1;
if date<>date[1] then begin
	KBarOfDay=1; 
	BreakHigh = false;
end; 
 
condition1 = KBarOfDay = 6;
//一分鐘線每天的第六根

condition2 = Countif(High > High[1] and Close > Close[1] ,5) >=3;
//近五根裡至少三根最高價比前一根高且收盤比前一根高

if KBarOfDay = 1
and close > getfield("close", "d")[1] 
then BreakHigh = true;
//開高

value1 = average(GetField("Volume", "D")[1], 5);
//五日均量

condition3 = value1 > averageVolume;
//五日均量大於某張數 

value2 = rateofchange(GetField("Close", "D")[1], 3);
condition4 = AbsValue(value2) < changeRatio;
//前三日漲帳幅小於一定標準

condition5 = summation(volume, 5) > value1 * volumeRatio;
//前五根一分鐘線成交量的合計大於五日均量某個比例

condition6 = GetSymbolField("TSE.TW","收盤價","D")>average(GetSymbolField("TSE.TW","收盤價","D"),10);
//大盤屬於多頭結構

if condition1 and condition2 and condition3
and Condition4 and Condition5 and condition6
and BreakHigh
then ret=1;