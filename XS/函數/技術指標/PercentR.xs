{@type:function|@guid:b348a25d74c84ec4b6c1807d146a49fa|@path:/技術指標/PercentR|@hash:27e15dd39c9b72060167a222e1e676a9}
SetBarMode(1);

// PercentR function (for 威廉指標)
//
input: Length(numericsimple);
variable: variableA(0), variableB(0);

variableA = Highest(High, Length);
variableB = variableA - Lowest(Low, Length);

if variableB <> 0 then  
	PercentR = 100 - ((variableA - Close) / variableB) * 100
else 
	PercentR = 0;
        