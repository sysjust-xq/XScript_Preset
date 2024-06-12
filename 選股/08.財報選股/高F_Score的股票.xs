{@type:filter}
setbarfreq("Q");
settotalbar(5);

variable:score(0);

value1=GetField("資產報酬率","Q");
value2=GetField("來自營運之現金流量","Q");//單位百萬
value3=GetField("本期稅後淨利","Q");//單位百萬
value5=GetField("負債比率","Q");
value6=GetField("流動比率","Q");
value7=GetField("現金增資佔股本比重","y");
value8=GetField("營業毛利率","Q");
value9=GetField("總資產週轉率(次)","Q");

if date<>date[1] then score=0;
if value1>0 then score=score+1;
if value1-value1[3]>0 then score=score+1;
if value2>0 then score=score+1;
if value3>value2 then score=score+1;
if value5<value5[3] then score=score+1;
if value6>value6[3] then score=score+1;
if value7<=value7[3] then score=score+1;
if value8>value8[3] then score=score+1;
if value9>value9[3] then score=score+1;

if score>=8 
then ret=1;