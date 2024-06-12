{@type:filter}
input:
	smr(5,"月營收月增率"),
	syr(10,"月營收年增率"),
	gr(45,"營業毛利率"),
	epsy(1,"年EPS"),
	epsq(0.5,"季EPS");

value1=GetField("月營收月增率","M");
value2=GetField("月營收年增率","M");
value3=GetField("營業毛利率","Q");

if value1> smr //月營收月增率大於10%
and value2> syr//月營收年增率大於10%
and value3>= gr//毛利率大於45%
and GetField("每股稅後淨利(元)","Y")<epsy//最近一年稅後EPS小於1
and GetField("每股稅後淨利(元)","Q")<epsq//最近一季稅後EPS小於0.5
and GetField("每股營業額(元)","Y")>10//每股年營收大於10
then ret=1; 
