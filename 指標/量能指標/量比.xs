{@type:indicator}
{量比公式 = 估計量 / 昨量
當量比 > 1時表示量是放大的, 數值越大表示越強
支援商品：台(股票)}

if barfreq <> "Min" and barfreq <> "D" then 
	raiseruntimeerror("僅支援分鐘與日頻率");

value1 = GetField("量比");

plot1(value1, "量比");
plot2(1, "基準線");