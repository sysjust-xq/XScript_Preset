{@type:indicator|@guid:37ab2ff7739242d099e9469a58bf019e|@path:/量能指標/量比|@hash:03485057f84dde1ddc302b78c0e22cde}
{量比公式 = 估計量 / 昨量
當量比 > 1時表示量是放大的, 數值越大表示越強
支援商品：台(股票)}

if barfreq <> "Min" and barfreq <> "D" then 
	raiseruntimeerror("僅支援分鐘與日頻率");

value1 = GetField("量比");

plot1(value1, "量比");
plot2(1, "基準線");