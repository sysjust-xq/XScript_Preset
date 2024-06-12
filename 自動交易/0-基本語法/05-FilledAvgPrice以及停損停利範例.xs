{@type:autotrade}
{
	除了可以使用Filled來知道目前的成交部位之外, 
	也可以透過FilledAvgPrice這個函數來取得目前"未平倉"部位的成本	
}

{
	範例: 多單1口進場後, +1.5%停利, -1.5%停損
}

var: 
	long_condition(false); 		{ 是否做多 }


if Position = 0 and long_condition then SetPosition(1);

if Position = 1 and Filled = 1 then begin		
	{ 多單已經買進1口 }

	{ 計算損益% }
	var: plratio(0);

	{ 
		請注意: 不管Filled是大於0還是小於0, FilledAvgPrice的數值都是'正數'(>0) 
	}
	plratio = 100 * (Close - FilledAvgPrice) / FilledAvgPrice;
	
	if plratio >= 1.5 then SetPosition(0);		{ 停利 }
	if plratio <= -1.5 then SetPosition(0);		{ 停損 }
end;	

{
	目前計算未平倉成本的方式是採用**先進先出的沖銷方式**來計算, 以下是沖銷順序的範例:
	
	範例#1
	
	假設策略執行過程總共產生三筆成交, 依照時間先後順序, 資料分別為
	
	- 第一筆: 買進1張, 成交價100元,
	- 第二筆: 買進1張, 成交價102元,
	- 第三筆: 賣出1張, 成交價101元
	
	在第一筆成交時, Filled = 1, FilledAvgPrice = 100
	在第二筆成交時, Filled = 2, FilledAvgPrice = (100 + 102) / 2 = 101
	在第三筆成交時, Filled = 1, FilledAvgPrice = 102 (第三筆-1沖銷第一筆+1, 所以未平倉剩下第二筆1張, 未平倉成本=102)
	
	
	範例#2
	
	假設策略執行過程總共產生四筆成交, 依照時間先後順序, 資料分別為
	
	- 第一筆: 買進2張, 成交價100元,
	- 第二筆: 買進2張, 成交價101元,
	- 第三筆: 買進2張, 成交價102元,
	- 第四筆: 賣出3張, 成交價101元,
	
	在第一筆成交時, Filled = 2, FilledAvgPrice = 100
	在第二筆成交時, Filled = 4, FilledAvgPrice = (100*2 + 101*2) / 4 = 100.5
	在第三筆成交時, Filled = 6, FilledAvgPrice = (100*2 + 101*2 + 102*2) / 6 = 101
	在第四筆成交時, Filled = 3, FilledAvgPrice = (101*1 + 102 * 2) / 3 = 101.66666
	(第一筆成交的2張被沖銷, 第二筆成交的1張被沖銷)

}
	

