{@type:function}
// Kiosotto Indicator

// 設定
// 計算區間 = 120日
Var:tsbul(0),tsber(0),hpres(0),lpres(9999999);
Var:buffer1(0),buffer2(0),i(0); 
SetTotalBar(120*2);

// 初始化
tsbul=0;tsber=0;
hpres=0;lpres=9999999;

// 計算
For i=0 to 120 - 1 Begin
    // Update hpres and tsbul when current high is greater than hpres
    If High[i]>hpres Then Begin
       hpres=High[i];
       tsbul=tsbul+RSI(Close,120)[i]*Close[i];
    End;

    // Update lpres and tsber when current low is less than lpres
    If Low[i]<lpres Then Begin
       lpres=Low[i];
       tsber=tsber+RSI(Close,120)[i]*Close[i];
    End;
End;
// 買進動能
If tsber<>0 Then
   buffer1=tsbul/tsber
Else
   buffer1=0;
	
// 賣出動能
If tsbul<>0 Then
   buffer2=tsber/tsbul
Else
   buffer2=0;

// 因子
//Value99=buffer1;
Value99=buffer2;
If Value99<>0 Then retVal = Value99;