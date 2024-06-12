{@type:sensor}
settotalbar(3);
if Close > highD(1) and GetField("Volume", "D")>  GetField("Volume", "D")[1] then ret=1;  