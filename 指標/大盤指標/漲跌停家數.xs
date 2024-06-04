{@type:indicator|@guid:0737c35cc72f4b79ae8e7e2b50af7332|@path:/大盤指標/漲跌停家數|@hash:cc5f0754501b14b1ae78c83485d0e267}
value1=GetField("漲停家數");
value2=GetField("跌停家數");
plot1(value1,"漲停家數");
plot2(value2,"跌停家數");