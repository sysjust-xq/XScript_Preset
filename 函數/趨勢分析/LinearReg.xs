{@type:function}
SetBarMode(1);

input:thePrice(numericseries);	{資料序列} 
input:Length(numericsimple); 	{資料長度}
input:target(numericsimple); 	{預期日期位置:0表示現在,-1表示未來一天,1表示過去一天}
input:_slope(numericref); 		{回傳:斜率}
input:_angle(numericref);		{回傳:弧度} 
input:intercept(numericref);	{回傳:X軸切點} 
input:forecast(numericref); 	{回傳:target日後預期值}

variable: SumX((Length* (Length+1))/2), //和
      sumX2(Length*(Length+1)*(2*Length+1)/6 ), //平方和
      sumY(0),
      SumXY(0),
      t_slope(0),
      tIntercept(0);
	
sumX2 = Length*(Length+1)*(2*Length+1)/6;
SumX = (Length* (Length+1))/2;

LinearReg = -1;
if Length < 1 then return;

variable: Xi(0);

SumXY=0; SumY =0;
for Xi = 1 to Length
Begin
   SumXY += Xi* thePrice[ Length -Xi];
   SumY  += thePrice[ Length -Xi];
End;

t_slope = IFF((Length*SumX2 -Square(SumX))<>0,
             ( Length *SumXY -SumX *SumY) / (Length*SumX2 -Square(SumX)),
			 0);
tIntercept = (SumY - t_slope*SumX)/Length;

_slope =t_slope;
_angle = arctangent(t_slope);
intercept =tIntercept;
forecast = intercept + _slope * (Length - target + ExecOffset);

LinearReg = 1;