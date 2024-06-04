{@type:filter|@guid:46cd6f0df91e48069ae1aea93589602a|@path:/08.財報選股/流動資產減負債超過市值N成}
input:ratio(80,"佔總市值百分比%");
if (GetField("流動資產","Q")-GetField("負債總額","Q"))*100>GetField("總市值","D")*ratio/100
then ret=1;