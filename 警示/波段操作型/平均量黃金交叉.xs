{@type:sensor}
input: shortlength(5); setinputname(1,"短均量期數");
input: Longlength(22); setinputname(2,"長均量期數");

settotalbar(8);
setbarback(maxlist(shortlength,Longlength));

variable: Longaverage(0);
variable: shortaverage(0);

Longaverage = Average(volume,Longlength);
shortaverage=Average(volume,shortlength) ;

if shortaverage crosses over  Longaverage then ret=1;  
        