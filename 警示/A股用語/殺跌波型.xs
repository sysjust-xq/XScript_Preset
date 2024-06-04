{@type:sensor|@guid:0a6d0833c6e74a569b9508e820ce77f2|@path:/A股用語/殺跌波型|@hash:d93d4003204bd47cb4615c6ec62865e5}
//黑三兵
input:TXT("請使用1分鐘線"); setinputname(1,"使用方法");

settotalbar(5);

if    ( open - close ) > (high -low) * 0.75 and 
      ( open[1] - close[1] ) > (high[1] -low[1]) * 0.75 and
      ( open[2] - close[2] ) > (high[2] -low[2]) * 0.75 and
      close < close[1] and close[1] < close[2] 
then ret=1;  