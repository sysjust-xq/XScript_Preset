{@type:function_bool}
{
	判斷是否已經進入收盤階段: 用來判斷不再進場 or 平倉當日部位
	
	使用時須傳入N, 代表在最後可以送單前N分鐘就認定進入收盤階段, 
	例如如果傳1, 而且是台股的話, 那在13:24:00就會回傳True, 代表已經進入收盤階段


	請注意: 這個函數只支援台股, 以及台灣期貨市場內的常用商品, 也不考慮部分外匯期貨 or 其他市場期貨, 例如東証指
}

input: exit_period(numericsimple, "收盤前N分鐘");

var: market_close_time(0);		{ 市場收盤時間 }
var: market_lasttrade_time(0);	{ 最後可交易時間 }

if symbolexchange = "TW" then begin
	market_close_time = 134000;		{ 往後延長一點, 處理Tick可能延後收到的情形 }
	market_lasttrade_time = 132500;
end else if symbolexchange = "TF" then begin
	if daystoexpirationtf = 0 then begin
		market_lasttrade_time = 133000;
		market_close_time = 134000;	{ 往後延長一點, 處理Tick可能延後收到的情形 }
	end else begin	
		market_lasttrade_time = 134500;
		market_close_time = 135000; { 往後延長一點, 處理Tick可能延後收到的情形 }
	end;	
end else
	raiseruntimeerror("不支援此商品");

{ 往前推算N分鐘 }
market_lasttrade_time = TimeAdd(market_lasttrade_time, "M", -1 * exit_period);

if CurrentTime >= market_lasttrade_time and CurrentTime <= market_close_time then retval = true else retval = false;

