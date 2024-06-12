{@type:function}
{
    讀取從上次洗價到這次洗價之間的Tick資料

    - 可以指定最大的讀取筆數(如果兩次洗價之間的資料量超過這個限制的話, 則只回傳最新的資料)
    - 自動合併台股逐筆撮合的MultiTick(連續成交序列)
        - 所謂MultiTick, 指的是在台股逐筆撮合時, 一筆買單(賣單)同時產生了多筆不同價格的成交的情形,
        - 當發生這種情形時, 交易所會把每一個價格的成交資料分別傳送, 可是ReadTicks會把這些成交紀錄合併統計, 
		  方便使用者計算這個大單的總量,
        - 關於MultiTick, 請參考 https://bit.ly/3uZtwbG 內的更多說明

    呼叫方式:

    var: intrabarpersist readtick_cookie(0);// ReadTicks內部使用, 每次呼叫時請照實傳入
    array: tick_array[100, 11](0);          // 需要宣告一個2維陣列來儲存Tick資料
                                            // 陣列的第一維是最大讀取筆數,
                                            // 陣列的第二維是每一筆的欄位數, 請傳入11

    var: idx(0);
    value1 = ReadTicks(tick_array, readtick_cookie);
    for idx = 1 to value1 begin
        // 依序處理回傳的每一筆Tick
        // 每一筆Tick共有11個欄位, 分別是 tick_array[idx, 1], tick_array[idx, 2], .. tick_array[idx, 11]
        // 請參考底下說明
    end;

    回傳結果說明:

    - value1會是tick_array內所讀到的筆數, 如果上次洗價到這次洗價之間實際成交筆數超過tick_array宣告的大小的話, 則只會回傳最新的前N筆資料

    - tick_array[1, ..]是洗價當時最新的一筆, tick_array[2, ..]是前一筆, tick_array[value1, ..]是回傳的最後一筆

    舉例:

    如果目前已經收到了#1, #2, #3, #4 這四筆ticks, 而#3跟#4是屬於同一組MultiTick, 那麼呼叫ReadTicks時, 會回傳3筆紀錄,
    第一筆紀錄(tick_array[1,..])是#3跟#4合併的結果, 第二筆紀錄(tick_array[2,..])是#2的資料,第三筆紀錄(tick_array[3,..])是#1的資料

    - value1有可能是0, 表示到目前為止還沒有收到一筆完整的Tick. 這種情形可能會發生在系統收到了MultiTick的資料, 可是最後一筆MultiTick的資料還沒有收到.
      因為ReadTicks會把完整的MultiTick合併成一筆回傳給你, 所以此時value1會先回0. 等到下一次收到最後一筆MultiTick時就會把完整的MultiTick資料回傳給用戶.


    每一筆資料會有11個欄位, 以下分別說明

    - tick_array[n, 1] = Date (成交日期, 格式為yyyyHHmm)

    - tick_array[n, 2] = Time (成交時間, 格式為HHmmss)
        - 如果是MultiTick的話, 每一筆的Time都是一樣的(同時間成交)

    - tick_array[n, 3] = Close (成交價),
        - 如果是MultiTick的話, 回的是MultiTick序列最後一筆的成交價, 如果是買盤的話, 會是價格最高的那一筆, 如果是賣盤的話, 會是價格最低的那一筆

    - tick_array[n, 4] = Volume (成交量),
        - 如果是MultiTick的話, 回的是MultiTick序列最後一筆的成交量, 如果想要得到整組MultiTick的成交量(加總)的話, 請讀取tick_array[n, 10]

    - tick_array[n, 5] = BidAskFlag (內外盤標記, 1=外盤, -1=內盤, 0=不分),

    - tick_array[n, 6] = SeqNo (Tick序號, 每日的第一筆從1開始編制, 越來越大)
        - 如果是MultiTick的話, 回的是MultiTick序列最後一筆的Tick序號

    - tick_array[n, 7] = 成交方式註記
        - 如果不是台股的話, 這個欄位都會回-1
        - 如果是台股的話, 則依照這一筆成交資料的撮合方式來決定. 如果這一筆是集合競價的話, 回傳-1. 
		  依照目前台股的撮合規則, 每一日的開盤, 收盤, 都是集合競價, 如果商品被處置(分盤交易), 每一筆資料也是集合競價, 
		  如果商品委託價格發生很大的異動時, 交易所可能也會暫緩撮合, 此時也是集合競價.
        - 當這一筆資料被標示成集合競價時, 代表的是, 這一筆資料的價格/數量, 可能是很多個人委託單的合併, 所以XQ統計大單時, 會略過這些資料,
        - 如果是台股, 而且不是集合競價的話(也就是逐筆撮合), 那則依照這一筆是單筆成交, 還是連續成交序列(MultiTick)來判斷,
        - 如果是單筆成交的話, 回傳0, 如果是連續成交序列的話, 則回傳連續成交序列的筆數

    - tick_array[n, 8] (請看底下說明)
    - tick_array[n, 9] (請看底下說明)

    - tick_array[n, 10] = 成交量加總
        - 如果不是MultiTick的話, tick_array[n, 10]的數值跟tick_array[n, 4]是一樣的
        - 如果是MultiTick的話, tick_array[n, 10]的數值是這一組MultiTick每一筆成交量的加總

    - tick_array[n, 11] = 成交值加總(股票適用)
        - 如果不是MultiTick的話, tick_array[n, 11]是這一筆成交資料的成交值(元)
        - 如果是MultiTick的話, tick_array[n, 10]的數值是這一組MultiTick每一筆成交值的加總

    應用方式:

    value1 = ReadTicks(tick_array, readtick_cookie);
    for idx = 1 to value1 begin
        if tick_array[idx, 7] = -1 then begin
            // 集合撮合: 不判斷這一筆是否是大單
        end else begin
            // 逐筆撮合: 可以用tick_array[10]跟tick_array[11]來判斷這一筆資料的成交量/成交金額
            //
            if tick_array[idx, 10] >= 400 then ret=1;           // 400張的大單
            if tick_array[idx, 11] >= 100*10000 then ret=1;     // 100萬的大單
        end;
    end;

    - tick_array[n, 8] = 這一筆資料與目前系統最新一筆Tick的資料間隔(offset)
        - 如果這是MultiTick的話, 則[n, 8]回傳的是MultiTick序列內「第一筆資料」與目前系統最新一筆tick的offset,
        - 如果這不是MultiTick的話, 則[n, 8]回傳的是這一筆資料與目前系統最新一筆tick的offset,
        - 這個欄位的主要目的, 是讓使用者如果想要讀取MultiTick內「每一筆成交紀錄」時可以使用, 請參考底下的範例

    - tick_array[n, 9] = 這一筆資料與目前系統最新一筆Tick的資料間隔(offset)
        - 如果這是MultiTick的話, 則[n, 9]回傳的是MultiTick序列內「最後一筆資料」與目前系統最新一筆tick的offset,
        - 如果這不是MultiTick的話, 則[n, 9]回傳的是這一筆資料與目前系統最新一筆tick的offset,

    應用方式:

    value1 = ReadTicks(tick_array, readtick_cookie);
    for idx = 1 to value1 begin
        if tick_array[idx, 7] > 0 then begin
            // 這是一個MultiTick
            // 以下的寫法是從第一筆scan到最後一筆, 如果是買盤的話, 則價格由低到高, 如果是賣盤的話, 則價格由高到低
            //
            for j = tick_array[_i, 8] downto tick_array[_i, 9] begin
                value11 = GetField("Close", "Tick")[j];     // MultiTick: 其中一筆成交價
                value12 = GetField("Volume", "Tick")[j];    // MultiTick: 其中一筆成交量
            end;
        end;
    end;
}

input: tick_array[X,Y](NumericArray);	{ 參數1: 傳入要儲存tick資料的array }
input: readtick_cookie(NumericRef);		{ 參數2: Cookie: 儲存最後一次**處理**完畢的Tick編號 }

if Y < 10 then raiseruntimeerror("tick_array的第二維至少要 >= 10");

var: _cur_tickseq(0), _row(0), _i(0);
var: _last_multitick_start(0);
var: _lotsize(-1);

_cur_tickseq = GetField("SeqNo", "Tick");

if readtick_cookie > _cur_tickseq then
	readtick_cookie = 0;

if _lotsize < 0 then _lotsize = GetSymbolInfo("交易單位");

// 從上次到目前的資料範圍: readtick_cookie+1 .. _cur_tickseq
//
_i = _cur_tickseq; 	
_row = 1;
_last_multitick_start = 0;
while _i > readtick_cookie and _row <= X begin

	value1 = GetField("Date", "Tick")[_cur_tickseq - _i];
	value2 = GetField("Time", "Tick")[_cur_tickseq - _i];
	value3 = GetField("Close", "Tick")[_cur_tickseq - _i];
	value4 = GetField("Volume", "Tick")[_cur_tickseq - _i];
	value5 = GetField("BidAskFlag", "Tick")[_cur_tickseq - _i];
	value6 = GetField("SeqNo", "Tick")[_cur_tickseq - _i];
	value7 = GetField("TickGroup", "Tick")[_cur_tickseq - _i];
	
	if value7 = 0 or value7 = -1 then begin
		// 不是MultiTick
		//
		tick_array[_row, 1] = value1;		// Date
		tick_array[_row, 2] = value2;		// Time
		tick_array[_row, 3] = value3;		// Close
		tick_array[_row, 4] = value4;		// Volume
		tick_array[_row, 5] = value5;		// BidAskFlag
		tick_array[_row, 6] = value6;		// SeqNo
		
		if Y = 10 then
			tick_array[_row, 7] = 0			// (舊版邏輯) 不是MultiTick: 回0  
		else
			tick_array[_row, 7] = value7;	// (新版邏輯) 不是MultiTick: 回這一筆的TickGroup
				
		tick_array[_row, 8] = _cur_tickseq - value6;	// 這一筆的offset			
		tick_array[_row, 9] = _cur_tickseq - value6;	// 這一筆的offset
		tick_array[_row, 10] = value4;		// Volume
		
		if Y > 10 then
			tick_array[_row, 11] = value3 * value4 * _lotsize;	// (新版邏輯) 成交金額
				
		_row = _row + 1;
		_i = _i - 1;			
		
	end else begin
		// 這是MultiTick
		//
		// value7的內容應該是1, 2, 2, 3 (從舊到新)
		//
		var: _total_v(0), _total_pv(0), _count(0);
		var: _complete(false);
		
		_complete = false;
		_count = 1;
		_i = _i - 1;
		_total_v = value4;
		_total_pv = value3 * value4 * _lotsize;

		if value7 = 1 then begin
			_complete = true;
		end else begin
			while not _complete and _i > readtick_cookie begin
				value33 = GetField("Close", "Tick")[_cur_tickseq - _i];
				value44 = GetField("Volume", "Tick")[_cur_tickseq - _i];
				value66 = GetField("SeqNo", "Tick")[_cur_tickseq - _i];
				value77 = GetField("TickGroup", "Tick")[_cur_tickseq - _i];
				
				_total_v = _total_v + value44;
				_total_pv = _total_pv + value33 * value44 * _lotsize;
			
				_i = _i - 1;
				_count = _count + 1;
				
				if value77 = 1 then _complete = true;
			end;
		end;
		
		// 三種情形
		//	case#1: _complete 而且 value7(最新一筆的標記) =3 => 我們讀到了一個完整的multitick序列
		//	case#2: _complete 可是 value7不是3 
		//		=> 這個表示我們收到了一個multitick序列的開頭, 可是結尾還沒有收到
		//		case#2a	=> 如果這種情形發生在最新的資料端, 那我們可以等待下一次洗價時再來處理
		//				Example: 0, 0, 0, 1 (2, 3 is coming)
		//		case#2b	=> 如果這種情形發生在最新的資料端, 那我們可以等待下一次洗價時再來處理
		//				Example: 0, 0, 0, 1, 2, 2 (3 is coming)
		//		case#2c	=> 可是如果這種情形是發生在中間的話, 那就是資料有問題了, 例如
		//				Example: 0, 0, 0, 1 (where is 3 ?) 0, 0
		//	case#3: not _complete => 這個表示這一整批資料的第一筆竟然不是multitick序列的開頭, 可能有人傳錯 readtick_cookie了 ?
		//				Example: (where is 1 ?) 2, 2, 2, 3
		//
		// 如果是 case#2a的話, 目前收到的multitick資料就先不處理, 等下一次呼叫時再來處理
		// 其餘情形我們就組一筆MultiTick的資料
		//
		if _complete and value7 <> 3 and _row = 1 then begin
			// 紀錄這一批multitick的第一筆, 當成下一次的開始
			//
			_last_multitick_start = _i;
		
		end else begin
			tick_array[_row, 1] = value1;		// Date
			tick_array[_row, 2] = value2;		// Time
			tick_array[_row, 3] = value3;		// Close = MultiTick最後一筆的價格
			tick_array[_row, 4] = value4;		// Volume
			tick_array[_row, 5] = value5;		// BidAskFlag
			tick_array[_row, 6] = value6;		// SeqNo
			tick_array[_row, 7] = _count;		// MultiTick的筆數
			tick_array[_row, 8] = _cur_tickseq - value66; // MultiTick 第一筆的位置
			tick_array[_row, 9] = _cur_tickseq - value6;  // MultiTick 最後一筆的位置
			tick_array[_row, 10] = _total_v;	// MultiTick的總成交量

			if Y > 10 then
				tick_array[_row, 11] = _total_pv;	// (新版邏輯) 成交金額(MultiTick加總)
			
			_row = _row + 1;
		end;
	
	end;
end;


if _last_multitick_start <> 0 then begin
	readtick_cookie = _last_multitick_start;	
end else begin
	readtick_cookie = _cur_tickseq;
end;

retval = _row - 1;		// 回傳的筆數
