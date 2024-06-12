{@type:sensor}

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