{@type:sensor}
//除了一般K線的開高低收量之外，還可以透過getfield這樣的指令取得其他商品相關資訊
//例如可以讓使用者把台股特有的外資買賣超的資料拿來語法中運算
//只要在編輯器上打getfield就會列出可以使用的資料供user點選
//一樣可以透過[n]的方式來回傳前第n根的數值

//===========範例：外資連續多日買超超過1億元的語法==============================

//1.宣告參數：利用input宣告輸入的參數。
input:periods(3);//連續買超天數，預設是最近三天
input:last(10000);//單日最低買超金額，單位是萬元

//2.宣告變數，利用variable
variable:xi(1);
variable:count(0);

//4.運用函數
//利用getfield取得外資買賣超資料
value1=Getfield("外資買賣超");//取得今日外資買賣超的值，單位是張數
value1=Getfield("外資買賣超")[1];//取得昨日外資買賣超的值，單位是張數
value2=close*value1/10;//收盤價*張數為買超金額，再將單位調整成萬元
//今日盤中時,交易所並不會即時公告融資融券外資買賣超等籌碼資料
//須等到交易所公告資後後才能正確取得今日籌碼詳細資訊
//逐日計算是否滿足最低單日買超金額
for xi=1 to periods
begin
	if value2[xi]>last//單日外資買超超過最低要求數值
	then count=count+1;
end;

//6.設定警示條件：if.. then ret=1;
if count=periods and close/close[1]<1.01//count=periods代表連續n日無一日不符合條件
then ret=1;