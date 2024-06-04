{@type:indicator|@guid:b6644f0602fb431cbd6550a69c86df81|@path:/量能指標/成交量擺盪指標|@hash:e09983349760cabd6e9f75a693cab5ca}
Input: length1(5);	setinputname(1, "短天期");
Input: length2(20);	setinputname(2, "長天期");

Value1 = Average(Volume, length1);
Value2 = Average(Volume, length2);

if value1 = 0 then value3 = 0 else Value3 = (Value1 - Value2) * 100 / Value1;

Plot1(Value3, "OSCV");
