{@type:indicator}
{
指標說明
https://xstrader.net/當xs遇到ai-從特徵值的選取開始/
}

input:day(20);
input:ratio(10);

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

variable:count(0),x(0);

value1=GetField("總成交次數","D");
value2=average(value1,day);
value3=GetField("強弱指標");
value5=GetField("外盤均量");
value6=average(value5,day);
value7=GetField("主動買力");
value8=average(value7,day);
value9=GetField("開盤委買");
value10=average(value9,day);
value11=GetField("資金流向");
value12=average(value11,day);
value13=countif(value3>1,day);
value14=average(value13,day);//比大盤強天數
value16=GetField("法人買張");

count=0;
if value1>value2*(1+ratio/100) then count=count+1;
//比大盤強的天數
if value13>value14*(1+ratio/100) then count=count+1;
if value5>value6*(1+ratio/100) then count=count+1;
if value7>value8*(1+ratio/100) then count=count+1;
if value9>value10*(1+ratio/100) then count=count+1;
//真實波動區間
if truerange> average(truerange,20) then count=count+1;
//計算承接的力道
if truerange<>0 then begin
	if close<=open then
		value15=(close-low)/truerange*100
	else
		value15=(open-low)/truerange*100;
end;
if value15 > average(value15,day)*(1+ratio/100) then count=count+1;
//法人買張佔成交量比例
if volume<>0 then value17=value16/volume*100;
if value17>average(value17,10)*(1+ratio/100) then count=count+1;
if value11>average(value11,10)*(1+ratio/100) then count=count+1;

value18=countif(close>=close[1]*1.02,5);
//N日來漲幅較大的天數
if value18 >= 2 then count=count+1;

value19=GetField("融資買進張數");
value20=GetField("融券買進張數");
value21=(value19+value20);
value22=average(value21,day);
//散戶作多指標
if value21<value22*0.9 then count=count+1;

plot1(average(count,3),"股性綜合分數指標");
plot2(3);
 



