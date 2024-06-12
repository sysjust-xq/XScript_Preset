{@type:sensor}
input: shortlength(5); setinputname(1,"短期均線期數");
input: midlength(10);  setinputname(2,"中期均線期數");
input: Longlength(20); setinputname(3,"長期均線期數");

settotalbar(3);
setbarback(maxlist(shortlength,midlength,Longlength));

variable: shortaverage(0);
variable: midaverage(0);
variable: Longaverage(0);


shortaverage=Average(close,shortlength);
midaverage=Average(close,midlength) ;
Longaverage = Average(close,Longlength); 

if close > maxlist(shortaverage, midaverage, longaverage) and
     open < minlist(shortaverage, midaverage, longaverage)
     then ret=1;  



        
        