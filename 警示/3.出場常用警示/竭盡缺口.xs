{@type:sensor}
input:Length(50); setinputname(1,"計算漲幅的區間");
input:Ratio(30); setinputname(2,"區間累計上漲幅度%");
input:OpenGapRatio(2); setinputname(3,"今日跳空上漲幅度%");
input:TXT("建議使用日線"); setinputname(4,"使用說明");

settotalbar(Length + 3);

if close / lowest(close,Length) >= 1+Ratio/100//區間漲幅夠大
and open[1]>close[2] //前一日已跳空
and open/close[1] >= 1+OpenGapRatio/100    //今天又跳空
then ret=1;