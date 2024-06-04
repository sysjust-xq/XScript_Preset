{@type:filter|@guid:3da7185f3b9a4c7aa2d811eeacf1c23a|@path:/03.進階技術分析/多空分數轉空}
// 計算技術指標分數序列, 判斷指標分數是否翻轉
//
settotalbar(168);

value1 = techscore();
value2 = average(value1, 10);
if value2 crosses under 10 then ret = 1;





 