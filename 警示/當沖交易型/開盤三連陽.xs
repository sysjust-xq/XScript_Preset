{@type:sensor}
input:TXT("僅適用60分鐘線以內"); setinputname(1,"使用限制");
settotalbar(5);
if barfreq = "Min" and barinterval <= 60 and
   (time[2] = 84500 or time[2] = 90000) and
    Close > Close[1] and Close[1] > Close[2] and
	Close[2] > Open[2] 
then ret=1;