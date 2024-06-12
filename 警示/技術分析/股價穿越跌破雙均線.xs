{@type:sensor}
input: shortlength(5); setinputname(1,"短期均線期數");
input: Longlength(20); setinputname(2,"長期均線期數");

settotalbar(3);
setbarback(maxlist(shortlength,Longlength));

variable: Longaverage(0);
variable: shortaverage(0);

Longaverage = Average(close,Longlength);
shortaverage=Average(close,shortlength) ;

if open > maxlist(shortaverage, longaverage) and
   close < minlist(shortaverage, longaverage)
 then ret=1;


 
        