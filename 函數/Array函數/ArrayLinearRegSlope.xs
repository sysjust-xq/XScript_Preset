{@type:function}
{
	傳入Array來計算LinearRegression的Slope
	最新一期的資料放在ThePriceArray[1]
}

Input: ThePriceArray[DataLength](NumericArray);
Input: Length(numericsimple, "統計天期");

if DataLength < Length then RaiseRunTimeError("Array的長度不能小於Length");

variable: SumX(0), //和
      SumX2(0), //平方和
      SumY(0),
      SumXY(0);

SumX = Length * (Length+1)/2;
SumX2 = Length * (Length+1)*(2*Length+1)/6;


variable: Xi(0);

SumXY=0; SumY=0;
for Xi = 1 to Length
Begin
   SumXY += Xi* ThePriceArray[Length-Xi+1];
   SumY  += ThePriceArray[Length-Xi+1];
End;

retval = IFF((Length*SumX2 - Square(SumX)) <> 0,
             (Length*SumXY - SumX*SumY) / (Length*SumX2 - Square(SumX)),
			 0);
