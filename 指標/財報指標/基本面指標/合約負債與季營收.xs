{@type:indicator}
//支援頻率：日線圖、週線圖、月線圖、季線圖
//Note: 本指標採公告日對齊，季報數據約有 45-60 天之發布延遲

variable: _CL(0);
_CL = GetField("合約負債", "Q");

variable: _QR(0);
_QR = GetField("營業收入淨額", "Q");

Plot1(_CL, "合約負債(百萬)");
Plot2(_QR, "營業收入淨額(百萬)");
