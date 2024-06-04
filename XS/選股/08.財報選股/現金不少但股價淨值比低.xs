{@type:filter|@guid:203b4da02dbb4dbfbafd4b4eff95dc8a|@path:/08.財報選股/現金不少但股價淨值比低}
input:r1(0,"來自營運之現金流量下限");
input:r2(10,"現金及約當現金單位億元");
input:r3(0.8,"股價淨值比上限");

value1=GetField("來自營運之現金流量","Q");
value2=GetField("現金及約當現金","Q");
value3=GetField("股價淨值比","D");

if value1>r1
and value2/100>r2
and value3<r3
then ret=1;
 