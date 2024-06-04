{@type:sensor|@guid:d122d480bbd146b7a6ce0056d248a191|@path:/技術分析/野百合的春天}
//獲利穩定的公司  20天後出場

settotalbar(700);
if getsymbolfield("tse.tw","收盤價")
> average(getsymbolfield("tse.tw","收盤價"),10)
then begin
value4=GetField("總市值");
value5=average(value4,600);
if value4[1]<value5[1]*0.7
and close=highest(close,10)
then ret=1;
end;