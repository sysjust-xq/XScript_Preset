{@type:indicator}
input: _len(3, "天數"), _reversal(1, "趨勢反轉判斷", inputkind:=Dict(["依據K線圖高/低點",1],["依據寶塔線高低/點",2]));

var: _name("");

SetBackBar(_len);

if _reversal = 1 then begin
    value1 = highest(high[1], _len);
    value2 = lowest(low[1], _len);
	end
else if _reversal = 2 then begin
    value1 = highest(value3[1], _len);
    value2 = lowest(value4[1], _len);
	end;

value3 = maxlist(close, close[1]);
value4 = minlist(close, close[1]);

if close cross over value1 then begin
    condition1 = True;
	condition2 = False;
	end
else if close cross under value2 then begin
    condition1 = False;
	condition2 = True;
	end;


if currentbar > _len then begin
    if not condition1[1] and condition1 then
	    _name = "翻紅"
	else if condition1 then
	    _name = "續紅"
	else if not condition2[1] and condition2 then
	    _name = "翻黑"
	else if condition2 then
	    _name = "續黑";
		
	if condition1 then 
	    plotk(1, value4, value3, value4, value3)
	else if condition2 then
	    plotk(1, value3, value3, value4, value4);
	end;
	
setplotLabel(1, text(_name));