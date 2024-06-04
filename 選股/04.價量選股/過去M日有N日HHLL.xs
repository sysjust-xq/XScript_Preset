{@type:filter|@guid:bc71049b8314425e8989aca352d535d4|@path:/04.價量選股/過去M日有N日HHLL}
input:days(5,"計算天期");
input:occurrence(2, "發生次數");

condition1= high>high[1] and low>low[1] ;
value1=countif(condition1,days);
if value1>=occurrence then ret=1;

