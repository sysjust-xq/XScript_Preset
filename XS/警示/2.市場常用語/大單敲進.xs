{@type:sensor|@guid:748c581bf90e4c06afcba3b1dbfc27b6|@path:/2.市場常用語/大單敲進|@hash:857e449dbafcece5a1875f8385515ec4}
input: atVolume(100); setinputname(1,"大單門檻");
input: LaTime(10); setinputname(2,"大單筆數");
input:TXT("須逐筆洗價"); setinputname(3,"使用限制");

settotalbar(3);

variable: intrabarpersist Xtime(0);//計數器
variable: intrabarpersist Volumestamp(0);
variable: intrabarpersist XDate(0);

Volumestamp =GetField("Volume", "D");

if Date > XDate or Volumestamp = Volumestamp[1]  then Xtime =0; //開盤那根要歸0次數
XDate = Date;

if GetField("Volume", "Tick") > atVolume and GetField("內外盤","Tick")=1 then  Xtime+=1; //量夠大就加1次

if Xtime > LaTime  then 
begin
	ret=1; 
	Xtime=0;
end;