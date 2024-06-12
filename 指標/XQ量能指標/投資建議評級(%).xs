{@type:indicator}
//支援頻率：不定期
//支援商品 ：美(股票)
{ 說明：
value1 = getField("投資建議評級");
1<= value1 < 1.5 (SB_積極買進)
1.5 <= value1 < 2.5 (B_買進)
2.5 <= value1 < 3.5 (H_中立)
3.5 <= value1 < 4.5 (S_賣出)
4.5 <= value1 <= 5(SS_積極賣出) 
}
var:exchange("");
exchange = GetSymbolInfo("交易所");
if exchange <> "NYSE" and exchange <> "NASDAQ" and exchange <> "AMEX" then raiseruntimeerror("僅支援美股");

var:rank(0);
value1 = getField("投資建議評級");
if value1 = 0 then raiseruntimeerror("無投資建議評級的歷史紀錄");
rank = (5-value1)/4; //將投資建議評級，轉成0~100的分布形式

plot1(rank);

if 1>=rank and rank>0.875 then begin
	plot20(rank);
	setplotLabel(1,"積極買進");
end else if 0.875>=rank and rank>0.625 then begin 
	plot21(rank);
	setplotLabel(1,"買進");
end else if 0.625>=rank and rank>0.375 then begin
	plot22(rank);
	setplotLabel(1,"中立");
end else if 0.375>=rank and rank>0.125 then begin
	plot23(rank);
	setplotLabel(1,"賣出");
end else if 0.125>=rank and rank>=0 then begin
	plot24(rank);
	setplotLabel(1,"積極賣出");
end;