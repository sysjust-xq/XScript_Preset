{@type:filter}
input: months(24);	setinputname(1, "月營收計算期間(月)");
input: quarters(16);setinputname(2, "營業毛利率計算期間(季)");

settotalbar(3);

value1=GetField("月營收年增率","M");
value2=GetField("營業毛利率","Q");
if value1 = lowest(GetField("月營收年增率","M"), months) and
   value2 = lowest(GetField("營業毛利率","Q"), quarters) then
ret = 1;



