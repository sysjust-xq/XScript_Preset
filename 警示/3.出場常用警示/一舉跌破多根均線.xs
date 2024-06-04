{@type:sensor|@guid:6e5f1cdaad4b473a8086721def82c0d6|@path:/3.出場常用警示/一舉跌破多根均線|@hash:936226627f228b1fce0e242251f337b6}
input: shortlength(5); setinputname(1,"短期均線期數");
input: midlength(10);  setinputname(2,"中期均線期數");
input: Longlength(20); setinputname(3,"長期均線期數");

setbarback(maxlist(shortlength,midlength,Longlength,6)+8);

variable: shortaverage(0);
variable: midaverage(0);
variable: Longaverage(0);


shortaverage=Average(close,shortlength);
midaverage=Average(close,midlength) ;
Longaverage = Average(close,Longlength); 

if close  crosses under  shortaverage and 
   close  crosses under  midlength and 
   close  crosses under  Longaverage 
then ret=1;  
