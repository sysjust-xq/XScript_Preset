{@type:autotrade}
{
	Position代表的是這個商品在這個策略內的’預期部位’, Position是一個整數, 可以大於0, 也可以小於0.
	
	**請注意: 一個交易策略內可以跑多個商品，每個商品的Position是獨立的**
	
	當我們想要執行交易時, 就呼叫SetPosition這一個函數, 傳入我們預期的部位(同時也可以傳入委託價格).
	
	腳本開始執行時, 商品的Position預設數值是0, 當我們想要買進時, 就透過SetPosition把Position變大, 想要賣出時, 就透過
	SetPosition把Position變小.
	
	系統收到了SetPosition()的呼叫之後, 就會依照目前的Position, 目前委託/成交的執行狀態, 決定如何送單, 來讓你的策略可以達到(成交)
	這個新的預期的部位.
		
	SetPosition()可以接受兩個參數:
	
	第一個參數是預期的部位,
	第二個參數是委託的價格, 這個參數如果不傳的話, 則會採用策略的預設買進/賣出價格
	
	請看以下範例
}

{
	把部位(Position)變成1, 如果原先部位是0的話, 則等於買進1張
	第二個參數(委託價格)如果不傳的話, 則使用策略設定內的預設價格	
}
SetPosition(1);	

{
	第二個參數可以傳入價格, MARKET是系統保留字, 代表是'市價'(期貨的話則會是'範圍市價')
}
SetPosition(1, MARKET);

{
	也可以傳入K棒的價格, 例如Close
}
SetPosition(1, Close);

{
	也可以傳入數值運算式
}
SetPosition(1, Close + 1.0);

{
	也可以傳入絕對值, 例如100.0
}
SetPosition(1, 100.0);

{
	支援檔位換算功能(AddSpread), 
	AddSpread(Close, 1)表示是Close價格往上加1檔, AddSpread(Close, 2)表示加2檔
	AddSpread(Close, -1)表示是Close價格往下減1檔
	
	AddSpread也可以用在警示腳本, 以及指標腳本
}
SetPosition(1, AddSpread(Close, 1));

{
	Position也可以是負的, 如果原先部位是0的話, 則等於賣出1張
}
SetPosition(-1);

{
	除了可以SetPosition之外, 也可以讀到目前的Position

	SetPosition(Position+1)表示是加碼1張
}
value1 = Position;
SetPosition(Position+1);

{	
	SetPosition的價格如果不符合商品的交易規則的話, 系統會自動轉換,
	例如: 如果超過漲停價, 則只會送出漲停價,
	例如: 如果不符合跳動點的話, 則會自動轉換到符合跳動點價格
}
SetPosition(1, 123.1);		{ 如果是買進台積電的話, 則會送出委託價格=123元 }


