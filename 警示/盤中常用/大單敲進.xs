{@type:sensor}
input: atVolume(50,"大單門檻");
input: LaTime(10,"大單筆數");
input: TXT("須逐筆洗價","使用限制");

settotalbar(3);

variable:  intrabarpersist Xtime(0);
//計數器
variable: intrabarpersist Volumestamp(0);

Volumestamp =GetField("Volume", "D");
if time < time[1] 
or Volumestamp = Volumestamp[1]
then Xtime =0; //開盤那根要歸0次數

if GetField("Volume", "Tick") > atVolume
//單筆tick成交量超過大單門檻
and GetField("內外盤","Tick")=1
//外盤成交
then Xtime+=1; 
//量夠大就加1次
if Xtime > LaTime then begin
	ret=1; 
	Xtime=0;
end;