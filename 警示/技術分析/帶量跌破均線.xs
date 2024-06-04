{@type:sensor|@guid:16884a9a4cd444b7812454d5ee6f3a69|@path:/技術分析/帶量跌破均線|@hash:6411452f107bc194fd28c175f55ef690}
// 帶量跌破均線
//
input: Length(10), VolFactor(2);

settotalbar(3);
setbarback(Length);

SetInputName(1, "期數");
SetInputName(2, "成交量放大倍數");

if close < Average(close, Length) and  close[1] >  Average(close, Length) and
   volume > Average(volume, Length) * VolFactor 
then ret=1;  



        