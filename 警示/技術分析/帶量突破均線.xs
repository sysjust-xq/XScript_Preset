{@type:sensor}
// 帶量突破均線
//
input: Length(10), VolFactor(2);

settotalbar(3);
setbarback(Length);

SetInputName(1, "期數");
SetInputName(2, "成交量放大倍數");

if close > Average(close, Length) and  close[1] <  Average(close, Length) and
   volume > Average(volume, Length) * VolFactor 
then ret=1;  



        