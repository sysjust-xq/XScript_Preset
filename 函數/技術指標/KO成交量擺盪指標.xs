{@type:function|@guid:26f5e18d32f94a36aab6bac8d2d2a673|@path:/技術指標/KO成交量擺盪指標}
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