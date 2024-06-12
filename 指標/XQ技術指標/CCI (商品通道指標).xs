{@type:indicator}
// XQ: CCI指標
//
input: 
Length1(14,"天數一"), 
Length2(28,"天數二"), 
Length3(42,"天數三"),
UpBaseLine(100,"上基準線"), 
MidBaseLine(0,"中基準線"), 
UnderBaseLine(-100,"下基準線");

Plot1(CommodityChannel(Length1), "CCI1");
Plot2(CommodityChannel(Length2), "CCI2");
Plot3(CommodityChannel(Length3), "CCI3");
plot4(UpBaseLine, "上基準線", checkbox:=0);
plot5(MidBaseLine, "中基準線", checkbox:=0);
plot6(UnderBaseLine, "下基準線" , checkbox:=0);
		