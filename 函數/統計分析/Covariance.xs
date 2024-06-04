{@type:function|@guid:9f01ee25cc1f435599ca8aee4c4d66d8|@path:/統計分析/Covariance|@hash:752250a341d009f2bc4898d7253f51c4}
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
        