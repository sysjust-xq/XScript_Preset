{@type:function|@guid:607a9823aec54a91ab43847239ccd4dd|@path:/技術指標/MTM}
SetBarMode(1);

{
以收盤價計算的運動量指標
Length: 計算期數
}
input: Length(numeric);

MTM = Momentum(Close, Length);



		