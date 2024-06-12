{@type:function}
SetBarMode(1);

input:Indep(numericseries);{說明:獨立的K棒值}
input:Dep(numericseries);{說明:不獨立的K棒值}
input:Length(numericsimple);{說明:過去N期}

Correlation = -2;
if Length <= 0 then return;

Value1 = CountIf((Indep >= Indep[1] and Dep >= Dep[1]) or (Indep < Indep[1] and Dep < Dep[1]), Length); 
	
Correlation = 2 * Value1 / Length - 1;

