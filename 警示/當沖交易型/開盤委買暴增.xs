{@type:sensor}
input:iVOL(1000);                setinputname(1,"開盤委買賣差張");
input:Ratio(10);                 setinputname(2,"開盤委買力道比");
input:TXT1("適用1分鐘");         setinputname(3,"使用限制");
input:TXT2("僅開盤第1分鐘洗價"); setinputname(4,"使用說明");
settotalbar(300);
if barfreq ="Min" and barinterval =1 and Date= Currentdate and
   Time =90000 and GetQuote("總委買") - GetQuote("總委賣") >iVOL and
   GetQuote("總委買") / summation(volume[1],270) > Ratio 
then ret=1;
