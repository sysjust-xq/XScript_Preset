{@type:sensor|@guid:dae2191e81a04bbb8e5f0eb280d0c223|@path:/當沖交易型/突破波動範圍|@hash:747f55ffe179ccdb510da6e96b68bc28}
input:Length(20); setinputname(1,"高低計算期數");
settotalbar(3);
setbarback(Length);
variable:HighLow(0);
HighLow=high-low;
if C>highest(H[1],Length) *1.005 and  HighLow>highest(HighLow[1],Length) then ret=1;