{@type:sensor}
input:TXT("限用10分鐘以下"); setinputname(1,"使用限制");

settotalbar(3);

variable:KeyPrice(0);

if Date> date[1] then KeyPrice = 0;		// 換日的話則重新定義KeyPrice
if time>132000 and KeyPrice = 0 then KeyPrice =close;

if KeyPrice > 0 and close <= KeyPrice *0.99//時間超過13:20分且十分鐘跌幅超過1%
then ret=1;
