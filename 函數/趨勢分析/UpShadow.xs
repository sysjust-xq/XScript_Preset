{@type:function|@guid:8bf9f9ddd97f4beab44e64d47f7cd4fe|@path:/趨勢分析/UpShadow}
//上影線佔實體比例
SetBarMode(1);

if range = 0 then
	upshadow = 0
else 
	upshadow = (high - maxlist(open,close)) / range;

