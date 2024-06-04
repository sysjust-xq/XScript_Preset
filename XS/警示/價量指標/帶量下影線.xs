{@type:sensor|@guid:17c0e14cb98a4bbf8cdc321bbc354b6d|@path:/價量指標/帶量下影線|@hash:8b35272dbdc37af5e8f94921bb2a1821}
settotalbar(5);
if minlist(open,close) - low > absvalue(open-close)*2 and
    Volume > Maxlist(volume[1],volume[2],volume[3]) then ret=1;
	


