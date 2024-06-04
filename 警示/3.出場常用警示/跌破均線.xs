{@type:sensor|@guid:902f63251d174229a15552f61fbff269|@path:/3.出場常用警示/跌破均線|@hash:90f6ece3c2a54dad64ee25c3f617f1f4}
input: shortlength(5); setinputname(1,"短期均線期數");
input: midlength(10); setinputname(2,"中期均線期數");
input: Longlength(20); setinputname(3,"長期均線期數");

variable: shortaverage(0);
variable: midaverage(0);
variable: Longaverage(0);

settotalbar(3);
setbarback(maxlist(shortlength,midlength,Longlength));

shortaverage=Average(close,shortlength);
midaverage=Average(close,midlength) ;
Longaverage = Average(close,Longlength); 

if open > maxlist(shortaverage, midaverage, longaverage) and
   close < minlist(shortaverage, midaverage, longaverage)
then ret=1;        