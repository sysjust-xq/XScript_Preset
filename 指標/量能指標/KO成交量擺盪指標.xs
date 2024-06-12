{@type:indicator}
Input: length1(34);	setinputname(1, "短天期");
Input: length2(55);	setinputname(2, "長天期");
Input: length3(13);	setinputname(3, "平均天期");

variable: kovolume(0), tp(0), ko(0), koaverage(0);   

tp =(close+high+low)/3;   

if tp >= tp[1] then   
	kovolume = volume   
else    
	kovolume = -volume;
  
ko = average(kovolume, length1) - average(kovolume, length2);
koaverage = average(ko, length3);

Plot1(ko, "KO");
Plot2(koaverage, "平均");

 