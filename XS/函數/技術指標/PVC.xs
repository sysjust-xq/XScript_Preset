{@type:function|@guid:d024bf38df904a4aa5d01019881effde|@path:/技術指標/PVC|@hash:66b14dde4936435f73ad4d41774ca3fe}
SetBarMode(1);

Input: Length(numericsimple, "天數");

value1 = Average(Volume, Length);
if value1 <> 0 then
	PVC = 100 * (Volume - value1) / value1
else
	PVC = 0;
