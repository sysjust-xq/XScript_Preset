{@type:sensor}
settotalbar(5);
if high - maxlist(open,close) > absvalue(open-close)*2 and
    Volume > maxlist(volume[1],volume[2],volume[3]) then ret=1;



