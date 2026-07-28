{@type:function}
// Wave Smoother

// 設定
Input:Period(5,NumericSimple);
Input:Phase(70,NumericSimple,"相位(度)");
Var:vWave(0),WaveSum(0),WacePriceSum(0);
Var:i(0);
SetTotalBar(Period*3);

// 計算 (前N日價量不包含今日)
WacePriceSum=0;
WaveSum=0;
For i = 0 To Period-1 Begin 
    // Sin、Cos 輸入為徑度
    vWave=(Sin( pi*(i/Period) + Phase*(pi/180) )) * (Cos( pi*i/(2*Period) ));
    // Wave累計
	WaveSum=WaveSum+vWave;
    // vWave*價格累計
	WacePriceSum=WacePriceSum+(C[i]*vWave);
End;

// 因子
If WaveSum<>0 Then
   Value99=WacePriceSum/WaveSum
Else 
   Value99=0;
If Value99<>0 Then retVal = Value99;