{@type:filter}
setbarfreq("AD");

input: day(30, "投信交易期間");

value1 = summation(GetField("投信買賣超")[1], day); 
value2 = summation(volume[2], day);

condition1 = value1 < value2 * 0.02;
//先前投信不怎麼買這檔股票

condition2 = GetField("投信買賣超")>= volume[1] * 0.15;
//投信開始較大買超

condition3 = H > H[1];
//買了股價有往上攻

condition4 = C > C[1];
//今天收盤有往上走

condition5=close<close[10]*1.05;

RET = condition1 and condition2 and condition3 and condition4 and condition5;

outputfield(1,GetField("投信買賣超","D"),0,"投信買超", order := 1);
