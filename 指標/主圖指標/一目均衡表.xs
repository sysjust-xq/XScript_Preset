{@type:indicator}
input: ConvPeriod(9, "轉換天數");
input: BasePeriod(26, "樞紐天數");
input: LagPeriod(52, "延遲天數");

// 轉換線
Value1 = (Highest(High, ConvPeriod) + Lowest(Low, ConvPeriod)) / 2;

// 樞紐線
Value2 = (Highest(High, BasePeriod) + Lowest(Low, BasePeriod)) / 2;

// 先行帶 A
Value3 = (Value1 + Value2) / 2;

// 先行帶 B
Value4 = (Highest(High, LagPeriod) + Lowest(Low, LagPeriod)) / 2;  

Plot(1, value1, "轉換線");
Plot(2, value2, "樞紐線");
Plot(3, Close, "後行時間", shift:=-BasePeriod);
Plot(4, Value3, "先行時間(1)", shift:=BasePeriod);
Plot(5, Value4, "先行時間(2)", shift:=BasePeriod);
if value3 > value4 then begin 
    PlotFill(6, Value3, Value4, shift:=BasePeriod);
	noplot(7);
	end
else begin 
    plotfill(7, Value3, Value4, shift:=BasePeriod);	
	noplot(6);
	end;
