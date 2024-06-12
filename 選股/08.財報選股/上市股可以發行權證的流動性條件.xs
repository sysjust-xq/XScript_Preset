{@type:filter}
{
	1. 市值超過100億元
	
	2. (a or b)
		a. 最近3個月成交股數佔已發行股份總額比例達20%以上。
		b. 最近三個月月平均成交股數達1億股以上。

	3. 最近期經會計師查核或核閱之財務報告無虧損
}

settotalbar(3);

// 近三個月成交股數佔以發行股份比例
//
Value1 = Summation(GetField("成交量", "M"), 3) * 100 / (GetField("發行張數","D") * 10000);

// 最近三個月月平均成交股數
//
Value2 = Average(GetField("成交量", "M"), 3) * 1000;

if GetField("總市值","D") >= 100 and 
   (Value1 >= 20 or Value2 >= 10000000) and 
   GetField("每股稅後淨利(元)","Q") > 0 
then 
Ret = 1;


 