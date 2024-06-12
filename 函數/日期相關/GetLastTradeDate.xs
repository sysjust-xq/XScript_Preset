{@type:function}
SetBarMode(1);

// 傳入到期月份/年份, 回傳台灣期交所指數期貨的到期日
// (不考慮國定假日等特殊事件)
//
input:  
	_ExpiredM(numericsimple),
    _ExpiredY(numericsimple);

GetLastTradeDate = NthDayofMonth(EncodeDate(_ExpiredY,_ExpiredM,1),3,3);