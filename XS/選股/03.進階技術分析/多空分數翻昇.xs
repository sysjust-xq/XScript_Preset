{@type:filter|@guid:dee93ce3ed1b4c9cb3539a5539392cc9|@path:/03.進階技術分析/多空分數翻昇}
// 計算技術指標分數序列, 判斷指標分數是否翻轉
//
settotalbar(168);

value1 = techscore();
value2 = average(value1, 10);
if value2 crosses above 5 then ret = 1;


