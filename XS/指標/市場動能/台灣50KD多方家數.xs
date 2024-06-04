{@type:indicator|@guid:081c44448f044465b92dfa3d69044fd5|@path:/市場動能/台灣50KD多方家數|@hash:c8450eb90650badaa0d88f985b419f56}
{統計台灣50成分股內, 目前K > D的家數
使用KD指標，資料期數為9，K值平滑期數為3，D值平滑期數為3。}

value1 = GetSymbolField("TSE50.SJ","TW50KD多空家數");

plot1(value1,"台灣50KD多方家數");