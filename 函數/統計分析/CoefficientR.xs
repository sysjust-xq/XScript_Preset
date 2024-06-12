{@type:function}
SetBarMode(1);

input:Indep(numericseries);{說明:獨立的K棒值}
input:Dep(numericseries);{說明:不獨立的K棒值}
input:Length(numericsimple);{說明:過去N期}

{
	                 Sum((Xi-Xb)*(Yi-Yb))
 r = --------------------------------------------------
	 Sqrt(Sum((Xi-Xb)(Xi-Xb)) * Sum((Yi-Yb)*(Yi-Yb)))
	
}

variable:
	idx(0), Xb(0), Yb(0), sumXiXb(0), sumYiYb(0), sumCovar(0);

	CoefficientR = 0;
	if Length <= 0 Then Return;
	
	Xb = average(Indep, Length);
	Yb = average(Dep, Length);
	
	sumXiXb = 0;
	sumYiYb = 0;
	sumCovar = 0;
	
	for idx = 0 to Length - 1 
	  begin
		sumXiXb = sumXiXb + (Indep[idx] - Xb) * (Indep[idx] - Xb);
		sumYiYb = sumYiYb + (Dep[idx] - Yb) * (Dep[idx] - Yb);
		sumCovar = sumCovar + (Indep[idx] - Xb) * (Dep[idx] - Yb);
	  end;
	
	if sumXiXb <> 0 and sumYiYb <> 0 then
	  begin
		Value1 = sumCovar / squareroot(sumXiXb * sumYiYb);
		if -1 <= Value1 and Value1 <= 1 then
			CoefficientR = Value1;
	  end;
	

        