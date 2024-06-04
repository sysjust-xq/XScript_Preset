{@type:sensor|@guid:de8de5c952b64cc789f35f22269c5c37|@path:/3.出場常用警示/OBV退潮|@hash:d475f128586485604cc1860b75939b0b}
input:Length(15); setinputname(1,"計算期數");
variable: OBVolume(0);

settotalbar(10);

value1 = close-close[1];

if close<> close[1] then 
   OBVolume +=  Volume*(value1)/absvalue(value1);

 if close<highest(high,Length) and
    OBVolume[2]=highest(OBVolume,Length) and 
	OBVolume=lowest(OBVolume,3)
 then ret=1;