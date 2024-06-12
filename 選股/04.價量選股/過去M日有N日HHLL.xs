{@type:filter}
input:days(5,"計算天期");
input:occurrence(2, "發生次數");

condition1= high>high[1] and low>low[1] ;
value1=countif(condition1,days);
if value1>=occurrence then ret=1;

