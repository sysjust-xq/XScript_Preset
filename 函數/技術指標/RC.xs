{@type:function|@guid:9b897f8a1db340fbb7c66d347fc8f90d|@path:/技術指標/RC}
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


		