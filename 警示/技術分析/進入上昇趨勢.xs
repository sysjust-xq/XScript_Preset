{@type:sensor|@guid:b502691d060f4c5c8a1bc940d7e5d04a|@path:/技術分析/進入上昇趨勢}

//高ROE股持有20天
input:period(12);
value1=countif(low<lowest(low[1],period),period);
value2=countif(high>highest(high[1],period),period);
value3=value2-value1;
if average(GetSymbolField("tse.tw","收盤價","D"),5)
> average(GetSymbolField("tse.tw","收盤價","D"),20)
then begin
 
if value3 crosses over 4
  
then ret=1;
 
end;