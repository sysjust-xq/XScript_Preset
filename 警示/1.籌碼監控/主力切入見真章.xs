{@type:sensor}
input: pastDays(3); setinputname(1,"近期天數");
input: UpRatio(3.5); setinputname(2, "上漲幅度(%)");
input: _buyAmount(3000); setinputname(3,"累積金額(萬)");
input:TXT("僅適用日線"); setinputname(4,"使用限制");

variable: SumForce(0);
variable:intrabarpersist tickcounter(0);

settotalbar(pastdays + 3);

if BarFreq <> "D" then return;

if   close > close[1]*(1 + UpRatio/100) then
begin
	// 過去N日 主力買賣超的成交金額的總和
    //	
    SumForce = Summation((AvgPrice * GetField("主力買賣超張數")/10)[1], pastDays);

	if SumForce > _buyAmount  then ret =1;
end;
