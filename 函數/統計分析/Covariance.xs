{@type:function}
SetBarMode(1);

input: DepValue(numericseries),
       IndepVal(numericseries),
       Length(numericsimple);

variable:
		Xb(0), Yb(0), idx(0), sum(0);

{
	Covar(x,y) = Sum((Xi-Xb)*(Yi-Yb)) / N
}

If Length <> 0 Then
Begin
    Xb = Average(IndepVal, Length);
    Yb = Average(DepValue, Length);

	sum = 0;
    For idx = 0 To Length - 1
      Begin
      	 sum = sum + (IndepVal[idx] - Xb) * (DepValue[idx] - Yb);
      End;

    Covariance = sum / Length;
End;
        