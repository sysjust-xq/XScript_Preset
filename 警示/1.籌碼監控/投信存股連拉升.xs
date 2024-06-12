{@type:sensor}
input: HoldRatio(50); setinputname(1,"投信持股比例下限(%)");
input: Length(25); setinputname(2, "持股檢查區間");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

settotalbar(Length + 3);

if BarFreq <> "D" then return;

if  GetField("投信持股比例")[1]> holdratio and
    GetField("投信持股比例")[1]=highest(GetField("投信持股比例")[1], Length) and
    close > close[1] and close[1] > close[2] and close[2] > close[3]
    
    then ret =1;
   
        