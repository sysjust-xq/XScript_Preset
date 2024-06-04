{@type:filter|@guid:04a0d8473fb1433980814989b6dd6abb|@path:/02.基本技術指標/帶量突破均線|@hash:a506c3174ab569fe6701fee76049450a}
// 帶量突破均線
//
input: Length(10), VolFactor(2);

SetInputName(1, "期數");
SetInputName(2, "成交量放大倍數");

settotalbar(3);

if close > Average(close, Length) and  close[1] <  Average(close, Length) and
   volume > Average(volume[1], Length) * VolFactor 
then ret=1;  



        