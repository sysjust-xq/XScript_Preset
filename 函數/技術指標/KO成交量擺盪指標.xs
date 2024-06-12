{@type:function}
SetBarMode(2);

Input: Length1(numericsimple, "短天期");
Input: Length2(numericsimple, "長天期");

variable: kovolume(0), tp(0), ko(0), koaverage(0);   

tp = typicalprice;   

if tp >= tp[1] then   
	kovolume = volume   
else    
	kovolume = -volume;
  
ko = average(kovolume, Length1) - average(kovolume, Length2);

ret = ko;