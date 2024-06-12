{@type:indicator}
{近15分鐘累計的(買進大單量+買進特大單量)-(賣出大單量+賣出特大單量)
抓近15分鐘的目的是希望可以看到最近的買賣力。}
array:_ArrayLarge[15](0),_ArraySmall[15](0);
var:_Count(0);
if barfreq <> "Min" or barinterval <> 1 then 
	raiseruntimeerror("僅支援 1 分鐘頻率");
//初始化
if getfieldDate("Date") <> getfieldDate("Date")[1] then begin
	_Count = 0;
	Array_SetValRange(_ArrayLarge, 1, 15, 0);
	Array_SetValRange(_ArraySmall, 1, 15, 0);
	value3 = 0;
	value99 = 0;
end else begin
	_Count += 1;
end;
value99 = mod(_count,15) + 1;
_ArrayLarge[value99] = GetField("買進大單量", "1") + GetField("買進特大單量", "1");
_ArraySmall[value99] = GetField("賣出大單量", "1") + GetField("賣出特大單量", "1");
value1 = Array_Sum(_ArrayLarge, 1, 15);
value2 = Array_Sum(_ArraySmall, 1, 15);
value3 = value1 - value2;
plot1(value3,"流動大戶買賣力");