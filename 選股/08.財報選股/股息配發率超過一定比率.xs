{@type:filter}
input:ratio(60,"股息配發率%");
value1=GetField("每股稅後淨利(元)","Y");
value2=GetField("現金股利","Y");
if value1>0
then value3=value2/value1*100;//股息配發率

if trueall(value3>ratio,3) then ret=1;