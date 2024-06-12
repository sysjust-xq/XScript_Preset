{@type:sensor}
//開高5%以上，拉回又再拉漲停
settotalbar(3);

condition1  =  (Close  =  GetField("漲停價", "D"));
condition2  =  (GetField("Open", "D") > GetField("RefPrice", "D") *1.05);
condition3  =  (GetField("Low", "D") < GetField("Open", "D"));
condition4  =   close > close[1];

if condition1 and condition2 and condition3 and condition4 then ret=1;