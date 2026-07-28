{@type:indicator}
//支援頻率：日線圖、週線圖、月線圖、季線圖
//季線圖時，月營收抓取的是當季最後一個月資料
//Note: 本指標採公告日對齊，季報數據約有 45-60 天之發布延遲

variable: _CL(0);
_CL = GetField("合約負債", "Q",Default := 0);

variable: _MR(0);
_MR = GetField("月營收", "M");

Plot1(_CL, "合約負債(百萬)");
Plot2(_MR, "月營收(億)");