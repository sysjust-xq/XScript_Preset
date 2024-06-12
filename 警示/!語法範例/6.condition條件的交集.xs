{@type:sensor}
//就像value1~value99是系統內建變數，其回傳值是一個數值
//condition1~condition99是系統內建回傳true或false邏輯值的變數名稱
//於是我們在口語上的如果~而且~就通知我，這樣的語法很容易用這個方式來撰寫

//========範例：融資餘額前十天大減超過2000張且減幅超過兩成===================
//1.宣告參數：利用input宣告輸入的參數。
input: range1(2000);
input: percent(0.2);

condition1=false;//將condition1設成false狀態，一旦符合條件才轉成true

//4.運用函數
//利用getfield取得外資買賣超資料
value1=getfield("融資餘額張數")[1];
value2=getfield("融資餘額張數")[10];


if value2-value1>range1 and (value2-value1)/value2>percent//計算融資增減張數
then condition1=true;//融資餘額前十天大減超過2000張且減幅超過兩成

//6.設定警示條件：if.. then ret=1;
//多重條件交易才觸發警示
if condition1 and average(close,20)/close[1]>1.05 and q_ask>open//近20天跌幅超過5%且現在外盤超過開盤價
then ret=1;








