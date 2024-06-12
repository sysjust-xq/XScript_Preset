{@type:function}
//上影線佔實體比例
SetBarMode(1);

if range = 0 then
	upshadow = 0
else 
	upshadow = (high - maxlist(open,close)) / range;

