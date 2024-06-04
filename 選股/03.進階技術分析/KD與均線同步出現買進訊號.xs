{@type:filter|@guid:023163215b6f4c7cb4e900eeedcf1536|@path:/03.進階技術分析/KD與均線同步出現買進訊號}
input: Length(60, "均線期間");

variable:rsv1(0),k1(0),d1(0);

stochastic(9,3,3,rsv1,k1,d1);

// K線黃金交叉
condition1 = k1 crosses over d1;

condition2 = close crosses over average(close,Length) or close[1] crosses over average(close[1],Length);

// 確認有一定的成交量
condition3 = average(volume,20) > 1000;

ret = condition1 and condition2 and condition3;

outputfield(1,average(close,Length),2,"60日均線", order := -1);
