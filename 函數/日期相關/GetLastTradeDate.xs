{@type:function|@guid:4ccd60568ab94d4085a852218b37ba80|@path:/日期相關/GetLastTradeDate|@hash:fee175b65f19c276d837b3e785173103}
SetBarMode(1);

// 傳入到期月份/年份, 回傳台灣期交所指數期貨的到期日
// (不考慮國定假日等特殊事件)
//
input:  
	_ExpiredM(numericsimple),
    _ExpiredY(numericsimple);

GetLastTradeDate = NthDayofMonth(EncodeDate(_ExpiredY,_ExpiredM,1),3,3);