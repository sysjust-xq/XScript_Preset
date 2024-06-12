{@type:autotrade}
{
	除了Filled跟FilledAvgPirce之外, 系統也提供FilledRecord相關的函數, 讓腳本可以取得每一筆成交的詳細資料
}

{
	FilledRecordCount: 取得商品執行迄今的成交筆數

	請注意:
	
	成交筆數會對應到真實的交易紀錄, 例如買進5張, 如果分三次成交, 分別成交2張, 2張, 1張, 
	那麼FilledRecordCount會是3	
}	

value1 = FilledRecordCount;		{ 回傳成交筆數 }

{
	取得成交筆數之後, 就可以一筆一筆把成交紀錄資料讀出來
	
	FilledRecordDate(n): 回傳第n筆成交紀錄的日期, 格式是YYYYMMDD, 例如20200727 (2020年7月27日)
	FilledRecordTime(n): 回傳第n筆成交紀錄的時間, 格式是HHMMSS, 例如103000 (10點30分0秒)
	FilledRecordBS(n):   回傳第n筆成交紀錄的買賣別, 買進的話是1, 賣出的話是-1
	FilledRecordPrice(n):回傳第n筆成交紀錄的成交價格, 請注意這個數值的正負跟買進/賣出無關(以台股來說都會 > 0)
	FilledRecordQty(n):  回傳第n筆成交紀錄的成交數量, 請注意不管是買進或是賣出, 這個數值都是 > 0的整數	
	FilledRecordIsRealtime(n): 回傳第n筆成交紀錄是否是在即時區間成交的, 如果是的話回傳1, 否則回傳0

	n的範圍從1到FilledRecordCount
}


var: idx(0);

for idx = 1 to FilledRecordCount begin
	value2 = FilledRecordDate(idx);
	value3 = FilledRecordTime(idx);
	value4 = FilledRecordBS(idx);
	value5 = FilledRecordPrice(idx);
	value6 = FilledRecordQty(idx);	
	value7 = FilledRecordIsRealtime(idx);
end;

