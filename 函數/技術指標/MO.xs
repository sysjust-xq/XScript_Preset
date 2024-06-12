{@type:function}
SetBarMode(2);

{
MO運動量震盪指標(Momentum Oscillator)可以說是
MOM運動量指標的另一種的表現方式，
它把原先以絕對數值展現的MOM指標，改成以相對的數值來展現
Length: 計算期數
}

input: Length(numeric);

 if  Close[Length] > 0  then
        mo = 100 * Close / Close[Length]
	else
	    mo=0;



		