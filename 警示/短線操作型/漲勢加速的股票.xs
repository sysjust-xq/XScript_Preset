{@type:sensor}
input:day2(5,"近期");
input:day1(10,"中期");

if angle(date[day1],date[day2])>0
and angle(date[day2],date)>angle(date[day1],date[day2])
and angle(date[day2],date)>25
and GetSymbolField("tse.tw","收盤價","W")
>average(GetSymbolField("tse.tw","收盤價","W"),13)
then ret=1;