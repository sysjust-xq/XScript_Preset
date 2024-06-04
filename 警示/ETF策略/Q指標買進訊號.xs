{@type:sensor|@guid:dfbe5f992bf94b5eae67e08cf3ce3f04|@path:/ETF策略/Q指標買進訊號}
input:t1(10,"計算累積價格變動的bar數");
input:t2(5,"計算價格累積變化量移動平均的期別");
input:t3(20,"計算雜訊的移動平均期別");
variable:Qindicator(0);

Qindicator=callfunction("Q指標",t1,t2,t3);

if linearregangle(Qindicator,5)>40
and barslast(linearregangle(Qindicator,5)>45)[1]>20
then ret=1;