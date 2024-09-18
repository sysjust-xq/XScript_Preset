{@type:indicator}
{指標數值定義：散戶 = 成交單量 < X的委託由Tick資料去累計計算
支援商品：台(股票)、台(期貨)}

if symbolexchange <> "TW" and symbolexchange <> "TF" then raiseruntimeerror("不支援此商品");
if SymbolType <> 2 and SymbolType <> 3 then raiseruntimeerror("不支援此商品");

if barfreq <> "Min" then 
	raiseruntimeerror("僅支援分鐘頻率");
	
value91 = GetField("上漲量");

{
	顯示開盤迄今的累計外盤小單 - 累計內盤小單, 也就是盤中散戶的買賣力趨勢
	小單定義: 成交單量 <= X
}

input: threshold(30, "小單門檻(張or口)");

var: intrabarpersist _v_buy_acc(0), intrabarpersist _v_sell_acc(0);
var: intrabarpersist _last_seq(0);
var: _cur_seq(0), _i(0), _curbar_date(0); 
var: _last_date(0);

if getfielddate("date") <> _last_date then begin
	_last_date = getfielddate("date");
	_v_buy_acc = 0;
	_v_sell_acc = 0;
	_last_seq = 0;
end;

// 抓洗價當時最新一筆Tick的位置跟日期
//
_cur_seq = GetField("SeqNo", "Tick");
_curbar_date = GetField("Date", "Tick");

if symbolexchange = "TW" and SymbolType = 2 then begin	//台(股票)
	if _curbar_date <> date then begin
		// 如果開盤到有某些分鐘沒有成交, 此時會對到昨日之前的Tick => 這些分鐘不要計算
		//
		_cur_seq = 0;

	end else if _cur_seq > 0 and _cur_seq > _last_seq then begin
		// _last_seq是上一次畫圖時最後一筆Tick的位置
		//
		// 所以就統計 _cur_seq .. _last_seq之間的Tick的成交資料
		//
		_i = _last_seq + 1;	
		while _i <= _cur_seq begin
			var: tv(0), _first(0), _complete(0);
		
			value1 = GetField("BidAskFlag", "Tick")[_cur_seq - _i];	// 外盤=1, 內盤=-1
			value2 = GetField("Close", "Tick")[_cur_seq - _i];		// 價格
			value3 = GetField("Volume", "Tick")[_cur_seq - _i];		// 單量
			value4 = GetField("SeqNo", "Tick")[_cur_seq - _i];		// Tick編號
			//-------------------------------------------------
			// multitick的處理
			//
			// TickGroup回傳以下數值
			//  -1 = 集合競價(每天第一盤, 最後一盤, 包含暫緩之後的搓合, etc.) 
			//	0 = 逐筆搓合單筆
			//	1 = 逐筆搓合開始
			//  2 = 逐筆搓合中間
			//  3 = 逐筆搓合結束
			//
			value5 = GetField("TickGroup", "Tick")[_cur_seq - _i];

			tv = value3;
			_complete = 0;

			if value5 = -1 then begin
				// 集合競價: 不列入統計
				_i = _i + 1;
				tv = 0;
			end else if value5 = 0 then begin
				// 獨立一筆: 列入統計
				_i = _i + 1;
			end else if value5 = 1 then begin
				// 把連續撮合的所有資料合併成一筆統計
				// 連續撮合的第一筆 = 1, 中間 = 2, 最後 = 3
				_first = _i;
				_i = _i + 1;
				while _i <= _cur_seq and _complete = 0 begin
					value99 = GetField("Time", "Tick")[_cur_seq - _i];			// 價格
					value22 = GetField("Close", "Tick")[_cur_seq - _i];			// 價格
					value33 = GetField("Volume", "Tick")[_cur_seq - _i];		// 單量
					value44 = GetField("SeqNo", "Tick")[_cur_seq - _i];			// Seq
					value55 = GetField("TickGroup", "Tick")[_cur_seq - _i];
					tv = tv + value33;
					
					_i = _i + 1;
					if value55 = 3 then _complete = 1;
				end;

				if _complete = 0 then begin
					// 有可能交易所還沒有傳送完整的連續撮合Ticks, 所以等下一次洗價時再處理
					//
					_cur_seq = _first;
					break;
				end;
			end else begin	
				// 異常狀況: 跳過
				_i = _i + 1;
			end;	
			
			// 如果小於門檻, 則依照外盤/內盤分別累計(成交量)
			//
			if tv <= threshold then begin
				if value1 = 1 then _v_buy_acc = _v_buy_acc + tv;
				if value1 = -1 then _v_sell_acc = _v_sell_acc + tv;
			end;	
		end;
	end;	
end;

if symbolexchange = "TF" and SymbolType = 3 then begin	//台(期貨)
	if _curbar_date <> date then begin
		// 如果開盤到有某些分鐘沒有成交, 此時會對到昨日之前的Tick => 這些分鐘不要計算
		//
		_cur_seq = 0;

	end else if _cur_seq > 0 and _cur_seq > _last_seq then begin
		// _last_seq是上一次畫圖時最後一筆Tick的位置
		//
		// 所以就統計 _cur_seq .. _last_seq之間的Tick的成交資料
		//
		_i = _last_seq + 1;	
		while _i <= _cur_seq begin
			value1 = GetField("BidAskFlag", "Tick")[_cur_seq - _i];	// 外盤=1, 內盤=-1
			value2 = GetField("Close", "Tick")[_cur_seq - _i];		// 價格
			value3 = GetField("Volume", "Tick")[_cur_seq - _i];		// 單量
			value4 = GetField("SeqNo", "Tick")[_cur_seq - _i];		// Tick編號
			
			// 如果超過門檻, 則依照外盤/內盤分別累計(成交量)
			//
			if value3 < threshold then begin
				if value1 = 1 then _v_buy_acc = _v_buy_acc + value3;
				if value1 = -1 then _v_sell_acc = _v_sell_acc + value3;
			end;	
			
			_i = _i + 1;
		end;
	end;
end;

_last_seq = _cur_seq;

plot1(_v_buy_acc - _v_sell_acc, "散戶買賣力(自訂)");
plot2(_v_buy_acc, "大戶(自訂)外盤量",checkbox:=0);
plot3(_v_sell_acc, "大戶(自訂)內盤量",checkbox:=0);