{@type:sensor}
{股價長期低於季線 今日帶量突破季線 [僅適用日線] }
input:Length(66); setinputname(1,"計算期間[僅日線有效]");
input:downLength(100); setinputname(2,"長期低於季線的天數");
input:ratio(25); setinputname(3,"突破量超過均量百分比(%)");
input:VLength(20); setinputname(4,"突破幾日均量");
input:TXT("僅適用日線"); setinputname(5,"使用限制");

settotalbar(downLength + 8);
setbarback(maxlist(Length + vLength));

if barfreq <> "D" then return;

value1=average(close,Length);//季線值
value2=average(volume,VLength);//均量值

condition1 = TrueAll(high[1] < value1[1], downLength);

if condition1 and close crosses over value1 and volume > value2* (100+ratio)/100
then ret=1;
