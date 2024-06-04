{@type:filter|@guid:27c736947dad41418ef49da4f7408b93|@path:/10.價值投資/低PB股的逆襲}
if close<15
and H = highest(H,20)
and close<lowest(low,20)*1.07
and highest(h,40)>close*1.1
then ret=1;

outputfield(1, GetField("股價淨值比","D"),2, "PB比", order := 1);
