{@type:sensor}
input: day(30, "投信交易期間");

if GetSymbolField("TSE.TW","收盤價") > average(GetSymbolField("TSE.TW","收盤價"),10)
and Average(Volume[1], 100) >= 1000
then begin

	value1 = summation(GetField("投信買賣超")[1], day); 
	value2 = summation(volume[2], day);


	condition1 = value1 < value2 * 0.02;
	//先前投信不怎麼買這檔股票

	if getfielddate("投信買賣超") <> date then
		value99 = GetField("投信買賣超")[1]
	else
		value99 = GetField("投信買賣超");

	condition2 = value99>= volume[1] * 0.15;
	//投信開始較大買超

	condition3 = H > H[1];
	//買了股價有往上攻

	condition4 = C > C[1];
	//今天收盤有往上走

	condition5=close<close[10]*1.05;

	condition6=GetSymbolField("TSE.TW","收盤價") > average(GetSymbolField("TSE.TW","收盤價"),10);
	
	if condition1 
	and condition2 
	and condition3 
	and condition4
	and condition5 
	and condition6
	then ret=1;
 
end;


