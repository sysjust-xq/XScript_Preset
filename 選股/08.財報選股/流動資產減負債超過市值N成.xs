{@type:filter}
input:ratio(80,"佔總市值百分比%");
if (GetField("流動資產","Q")-GetField("負債總額","Q"))*100>GetField("總市值","D")*ratio/100
then ret=1;