{@type:filter|@guid:61ebf47023d74fd5a6f64d4e907fc1ec|@path:/04.價量選股/波段漲幅不大，近N日有過漲停的}
input:day(10,"計算區間");
value1=GetField("漲停價","D");
if trueany(close=value1,day)
//近十日有一天漲停
and close<close[30]*1.2
//近三十日漲幅不到兩成

then ret=1;