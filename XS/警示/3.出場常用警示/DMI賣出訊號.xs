{@type:sensor|@guid:c51047bd2b39428fa6aa56a57542e4d0|@path:/3.出場常用警示/DMI賣出訊號|@hash:a739ca34adea7b3314a6e345021495e6}
input:Length(14); setinputname(1,"計算期數");
variable: pdi(0), ndi(0), adx_value(0);

settotalbar(maxlist(Length,6) * 13 + 8);

DirectionMovement(Length, pdi, ndi, adx_value);

if pdi<pdi[1] and ndi>ndi[1] and ndi crosses over pdi
then ret=1;