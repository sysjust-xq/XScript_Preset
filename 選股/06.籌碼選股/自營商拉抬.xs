{@type:filter|@guid:a8dcda42f51946a9a36821213ed9ea10|@path:/06.籌碼選股/自營商拉抬|@hash:4f776f8010cc087ddc90b9139dab161d}
// 
//
input: Length(10); setinputname(1,"計算天數");
input: UpRatio(3.5); setinputname(2, "上漲幅度(%)");
input: VolumeRatio(5); setinputname(3, "買超佔比例(%)");

variable: SumForce(0);
variable: SumTotalVolume(0);

settotalbar(3);

if RateOfChange(Close, 1) >= UpRatio then
begin
	SumTotalVolume = Summation(volume, Length);
	SumForce = Summation(GetField("自營商買賣超"), Length);
	if SumForce > SumTotalVolume * VolumeRatio / 100 then ret =1;
end;

SetOutputName1("自營商累計買超張數");
OutputField1(SumForce);
