{@type:function_bool}
{
	判斷成交金額是否是特大單
	
	級距表請參考:
	
	https://www.xq.com.tw/%e5%8f%b0%e8%82%a1%e9%80%90%e7%ad%86%e5%8a%9f%e8%83%bd%e8%a1%8c%e6%83%85%e7%ab%af%e7%9b%b8%e9%97%9c%e7%95%b0%e5%8b%95/	
}


input: pv(numericsimple, "成交金額");

var: intraBarPersist _open_price(0);
var: intraBarPersist _threshold(0);
var: intraBarPersist _last_date(0);

if _last_date <> Date then begin
	_last_date = Date;
	_open_price = GetField("Open", "D");
	if _open_price < 30 then 
		_threshold = 800000
	else if _open_price < 50 then 
		_threshold = 1000000
	else if _open_price < 100 then 
		_threshold = 1200000
	else if _open_price < 200 then 
		_threshold = 2000000
	else if _open_price < 500 then 
		_threshold = 4000000
	else
		_threshold = 4000000;
end;

if pv > _threshold then retval = true else retval = false;


