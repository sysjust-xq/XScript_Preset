{@type:function}
SetBarMode(2);

{
RC指標變動率
Length: 計算期數
}
input: Length(numeric);

if  Close[Length] > 0 then
 RC = (Close - Close[Length]) / Close[Length]
else
 RC=0;


		