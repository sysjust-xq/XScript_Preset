{@type:sensor|@guid:1fe89c90f2044b23b6221220be6cbd6f|@path:/波段操作型/平均量黃金交叉|@hash:84d1adcbe86d9769fdb103b4100e1c60}
input: shortlength(5); setinputname(1,"短均量期數");
input: Longlength(22); setinputname(2,"長均量期數");

settotalbar(8);
setbarback(maxlist(shortlength,Longlength));

variable: Longaverage(0);
variable: shortaverage(0);

Longaverage = Average(volume,Longlength);
shortaverage=Average(volume,shortlength) ;

if shortaverage crosses over  Longaverage then ret=1;  
        