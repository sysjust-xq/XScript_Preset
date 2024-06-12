{@type:function}
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
        