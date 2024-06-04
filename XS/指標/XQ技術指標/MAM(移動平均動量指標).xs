{@type:indicator|@guid:9bb439d30ea044b88890790547d47f32|@path:/XQ技術指標/MAM(移動平均動量指標)|@hash:797d0ecd37bcc508880d6ed05c39db0a}
// XQ: MAM指標
//
Input: Length(10), Distance(10);
Variable: mam(0);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Value1 = Average(Close, Length);
Value2 = Average(Close, Length)[Distance];

mam = Value1 - Value2;
	
Plot1(mam, "MAM");
		