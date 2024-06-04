{@type:indicator|@guid:9b016a905aa740db84b370be52c07b22|@path:/技術指標/CMI市場波動指標|@hash:ca89b0f353c2f4f538a70f9033a8c2fc}
{
指標說明
https://xstrader.net/如何判斷現在是趨勢還是盤整-一個還在研究的課/
}

input:period(10,"計算區間");
value1=(close-close[period-1])/(highest(high,period)-lowest(low,period))*100;
value2=absvalue(value1)-30;
value3=average(value2,3);
plot1(value3,"市場波動指標");