{@type:autotrade}
{
	範例: 透過Filled來判斷是否需要追價
	
	當發生做多情境時, 買進1口
	如果發生出場情境時, 多單出場(變成空手)
	如果買進委託沒有成交的話, 則追價

}


{
	當腳本呼叫SetPosition的話, 系統會依照目前委託/成交的情形, 決定如何送出委託單.
	
    以下情境假設一開始執行時Position = 0. 

	情境#1
	
	腳本呼叫SetPosition(1)時, 系統送出一筆買進1口的委託單
	經過一段時間後, 腳本呼叫SetPosition(0), 此時會發生以下的情形
	
	- 如果剛剛那一筆委託單已經成交(Position=1, Filled=1), 接下來SetPosition(0), 就會送出一筆賣出1口的委託
	- 如果剛剛那一筆委託單還沒有成交(Position=1, Filled=0), 接下來SetPosition(0), 就會**刪除買進的那一筆委託**
	  (這樣子的話, 使用者的部位就剛好是0)
	
	情境#2
	
	腳本呼叫SetPosition(1)時, 系統送出一筆買進1口的委託單
	經過一段時間後, 腳本又呼叫SetPosition(1), 此時會發生以下的情形

	- 如果剛剛那一筆委託單已經成交(Position=1, Filled=1), 接下來SetPosition(1), 不會送出任何委託
	- 如果剛剛那一筆委託單還沒有成交(Position=1, Filled=0), 接下來SetPosition(1), 系統會執行以下的邏輯
		- 如果新的SetPosition(1)的委託價格跟先前的委託價格**不一樣**的話, 則刪除剛剛的委託, 
		  然後送出一筆買進1口的委託單(使用新的委託價格)
		- 如果新的SetPosition(1)的委託價格跟先前的委託價格一樣的話, 則不會做任何動作

	情境#3

	腳本呼叫SetPosition(2)時, 送出一筆買進2口的委託單
	經過一段時間後, 腳本又呼叫SetPosition(3), 此時會發生以下的情形
	
	- 如果剛剛那一筆委託單已經完全成交(Position=2, Filled=2)
		- 接下來SetPosition(3), 就會送出一筆買進1口的委託
	- 如果剛剛那一筆委託單都沒有成交(Position=2, Filled=0)
		- 接下來SetPosition(3), 就會刪除先前的委託, 然後送出一筆買進3口的委託
	- 如果剛剛那一筆委託單部分成交(Position=2, Filled=1)
		- 接下來SetPosition(3), 就會刪除先前的委託, 然後送出一筆買進2口的委託
	
	小結:
	
	如果Position跟Filled一樣的話, 這個表示先前送出的委託都已經完全成交, 或是已經被取消. 
	此時如果收到新的SetPosition()的話, 系統的動作是送出一筆買進或是賣出的委託

	如果Position跟Filled不一樣的話, 這個表示目前應該有一筆[尚未完全成交的委託], 如果此時收到新的SetPosition()的話,
	系統會先刪除目前這一筆委託, 確認這一筆委託的成交數量之後, 再依照新的需求決定如何送單.
	
}

var: 
	long_condition(false), 		{ 是否做多 }
	exit_long_condition(false); { 是否多單出場 }


if Position = 0 and long_condition then begin
	{ 如果目前是空手, 且符合做多情境(long_condition), 則以目前收盤價買進1口, }
	SetPosition(1, Close);

end else if Position = 1 and exit_long_condition then begin
	SetPosition(0);

	{ 多單出場: 如果已經買到了, 就賣出剛剛買到的1口, 如果還沒有買到, 就取消買進的委託單 }
	
end else if Position = 1 and Filled = 0 then begin

	{ 如果已經送出買進委託, 可是還沒有成交的話, 則追價(系統會刪除先前委託, 然後再送出買進1張) }
	
	SetPosition(1, Close);

	{ 為了確保委託單排隊的順序, 如果新的委託價跟先前委託價格一樣的話, 系統就不會執行委託異動的動作 }

end;	

