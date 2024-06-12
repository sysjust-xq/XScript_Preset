{@type:sensor}
settotalbar(5);
if minlist(open,close) - low > absvalue(open-close)*2 and
    Volume > Maxlist(volume[1],volume[2],volume[3]) then ret=1;
	


