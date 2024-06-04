{@type:autotrade|@guid:cb1d8e993f1947429c9af3b4aa65e7de|@path:/常見技術分析/空頭/ATR觸發下通道}
// 宣告參數
input:period(20,"計算TrueRange的區間"),N(2,"N倍通道");

// 資料讀取筆數設定
settotalbar(period + 3);

value1=average(truerange,period);
value2=average(close,period);
value3=value2+N*value1;
value4=value2-N*value1;

// 空方進場策略：向下跌破下通道。出場策略：向上突破上通道。
if close crosses below value4 then setposition(-1);		
if close crosses over value3 then setposition(0);