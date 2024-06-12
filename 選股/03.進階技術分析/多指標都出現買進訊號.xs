{@type:filter}
settotalbar(120);

//=========計算RSI======================
Input:rsilength(6);		Setinputname(1,"設定RSI計算天期");
input:rsilimit(50);		Setinputname(2,"設定RSI要突破的限制");

Value1=rsi(close,rsilength);//計算RSI的值

//==========計算威廉指標==================
input: rLength(3);		SetInputName(3, "設定威廉指標天期");
input: rLimit(-50);		SetInputName(4, "設定威廉指標的限制");

value2 = PercentR(rLength) - 100;

//============計算DMI=======================
input: dmiLength(10);	setinputname(5,"設定DMI天期");
variable: pdi_value(0), ndi_value(0), adx_value(0);
DirectionMovement(dmiLength, pdi_value, ndi_value, adx_value);
value4=pdi_value;

//============純粹只是想確認本週股價都沒有跌破前週低==============
condition1 = GetField("Low", "W") > GetField("Low", "W")[1];

//============ XQ: tt指標==========================================
input: Length(10);		SetInputName(6, "設定tt指標計算期數");

variable: kk(0), qu(0), qd(0), qf(0), tt(0);

qf = 0;
qu = 0;
qd = 0;

for kk = 1 to length
  begin
	if close[(kk - 1)] > close[kk] then
		qu = qu + Volume[(kk - 1)]
	else
	  begin
		if close[(kk - 1)] < close[kk] then
			qd = qd + Volume[(kk - 1)]
		else { close[(kk - 1)] = close[kk] }
			qf = qf + Volume[(kk - 1)];
	  end;
  end;

if (qd + qf/2) <> 0 then
	tt = 100 * (qu + qf/2) /(qd + qf/2)
else
	tt = 1000;

value5=tt;

//==================設定警示條件====================================
if value1 > rsilimit 
and value2 > rLimit
and condition1 = true
and value4 > 0
and value5 > 800 
then ret=1; 
