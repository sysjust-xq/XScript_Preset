{@type:sensor|@guid:08ab607764e94bf0af1efc48aa1b0b2b|@path:/波段操作型/突破下降趨勢線|@hash:1269c0b2413421de10db532bf6671e66}
input:Length(20); setinputname(1,"下降趨勢計算期數");
input:Rate(150); setinputname(2,"反轉率%");
variable: Factor(0);

settotalbar(Length + 3);

Factor = 100/Close[Length];

value1 = linearregslope(high*Factor,Length);
value2 = linearregslope(high*Factor,3);

if close > open and close < close[length]  and  value1 < 0 and value2-value1 > Rate*0.01 then ret=1;