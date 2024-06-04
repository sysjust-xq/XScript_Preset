{@type:sensor|@guid:0a174d588a5949599b5810bf4d5ba192|@path:/A股用語/回頭高飛|@hash:08f9e2ae88042431ee518bfcfde7e93b}
//開高5%以上，拉回又再拉漲停
settotalbar(3);

condition1  =  (Close  =  GetField("漲停價", "D"));
condition2  =  (GetField("Open", "D") > GetField("RefPrice", "D") *1.05);
condition3  =  (GetField("Low", "D") < GetField("Open", "D"));
condition4  =   close > close[1];

if condition1 and condition2 and condition3 and condition4 then ret=1;