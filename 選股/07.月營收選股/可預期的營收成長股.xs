{@type:filter}
// 找出過去幾年這個月的營收都會成長的股票
//
input: years(3, "過去N年");
input: growrate(10, "YOY成長%");

variable: mm(0);
variable: count(0);
variable: idx(0);

settotalbar(1);

// 最新一期營收月份
//
mm = Month(getfielddate("月營收", "M"));

// 下一期營收月份
mm = mm + 1;
if mm > 12 then mm = 1;

while count < years begin
	if Month(getfielddate("月營收", "M")[idx]) = mm then begin
		// 看同月份的營收YOY是否符合標準, 不符合的話就不用再找了
		if getfield("月營收年增率", "M")[idx] < growrate then return;
		count = count + 1;
	end;
	idx = idx + 1;	
end;

ret = 1;



