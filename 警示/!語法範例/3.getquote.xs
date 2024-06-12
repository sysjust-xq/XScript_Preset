{@type:sensor}
//第三個範例，我們示範如何利用盤中即時數據﹙委買、委賣、內盤量、外盤量等等﹚來製作警示
//使用者可以透過"getquote"來取得這些數據
//只要在編輯器上打getquote就可以直接挑選所提供的欄位

//=====================範例：外盤漲停=======================================

//4.運用函數
//利用getfield取得買進價、賣出價及漲停價
value1=GetQuote("Ask");//賣出價
value2=GetQuote("DailyUplimit");//漲停價
value3=GetQuote("Bid");//買進價
//可以用q_來取代GetQuote完成快速引用

//6.設定警示條件：if.. then ret=1;
//賣出價=漲停價  且買進價跟賣出價相差不超過0.5%
if value1=value2 and value1/value2<=1.005
then ret=1;