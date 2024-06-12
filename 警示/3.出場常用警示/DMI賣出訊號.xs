{@type:sensor}
input:Length(14); setinputname(1,"計算期數");
variable: pdi(0), ndi(0), adx_value(0);

settotalbar(maxlist(Length,6) * 13 + 8);

DirectionMovement(Length, pdi, ndi, adx_value);

if pdi<pdi[1] and ndi>ndi[1] and ndi crosses over pdi
then ret=1;