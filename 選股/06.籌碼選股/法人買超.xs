{@type:filter}
input: Length(10); setinputname(1,"計算天數");
input: UpRatio(3.5); setinputname(2, "上漲幅度(%)");
input: VolumeRatio(5); setinputname(3, "買超佔比例(%)");

variable: SumForce(0);
variable: SumTotalVolume(0);

settotalbar(3);

if RateOfChange(Close, 1) >= UpRatio then
begin
	SumTotalVolume = Summation(volume, Length);
	SumForce = Summation(GetField("法人買賣超張數"), Length);
	if SumForce > SumTotalVolume * VolumeRatio / 100 then ret =1;
end;

SetOutputName1("三大法人累計買超張數");
OutputField1(SumForce);
