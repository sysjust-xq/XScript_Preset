{@type:filter}
condition1=false;
condition2=false;
condition3=false;
//先把簡單的價量條件全部放在condition1
if highest(high,3)<lowest(low,3)*1.15
//區間震盪小於15%
and close>5 
//股價大於5元
and close<200
//股價小於5元
and volume>300
//當日成交量大於300張
and high=highest(high,2)
//創兩日來新高
and close>close[1]*1.02
//最近一日上漲超過2%
then condition1=true;

//用condition2來處理月線斜率大於0.4
value1=average(close,20);
//先算出月線
value2=linearregslope(value1,10);
//算出季線這十天的斜率
if value2>0.4 then condition2=true;
//月線斜率要大於0.4

//處理布林帶寬
input:length(20,"計算天期");
input:width(35,"帶寬%");
variable:up1(0),down1(0),mid1(0),bbandwidth(0);
up1 = bollingerband(Close, Length, 1);
down1 = bollingerband(Close, Length, -1 );
mid1 = (up1 + down1) / 2;

bbandwidth = 100 * (up1 - down1) / mid1;
if bbandwidth <width
then condition3=true;

ret=condition1 and condition2 and condition3;