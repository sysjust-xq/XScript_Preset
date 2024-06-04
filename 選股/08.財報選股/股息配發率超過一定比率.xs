{@type:filter|@guid:67547fc0c1bb4dd6a13409bcc3fdd6c5|@path:/08.財報選股/股息配發率超過一定比率}
input:ratio(60,"股息配發率%");
value1=GetField("每股稅後淨利(元)","Y");
value2=GetField("現金股利","Y");
if value1>0
then value3=value2/value1*100;//股息配發率

if trueall(value3>ratio,3) then ret=1;