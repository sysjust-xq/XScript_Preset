{@type:sensor|@guid:8084cc09424d4f29bd438404bde5dd65|@path:/2.市場常用語/殺尾盤|@hash:d2bf88ae218f3f4e111a70cfa7bc63c9}
input:TXT("限用10分鐘以下"); setinputname(1,"使用限制");

settotalbar(3);

variable:KeyPrice(0);

if Date> date[1] then KeyPrice = 0;		// 換日的話則重新定義KeyPrice
if time>132000 and KeyPrice = 0 then KeyPrice =close;

if KeyPrice > 0 and close <= KeyPrice *0.99//時間超過13:20分且十分鐘跌幅超過1%
then ret=1;
