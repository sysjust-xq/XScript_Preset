{@type:filter|@guid:b036f2db77cd4cb28bf77c1b6bbd9355|@path:/10.價值投資/跌不下去的高殖利率股}
input:N(20, "天期");
 
condition1 = L = Lowest(L,N);
condition2 = H = Highest(H,N);
 
if condition2
//股價創區間以來高點
and	TrueAll(Condition1=false,N)
//這段區間都未破底
and close<close[N-1]*1.05
and volume>600
//區間股價漲幅不大
then ret=1;

outputfield(1, GetField("股東權益報酬率","Q"),2, "股東權益%", order := 1);
outputfield(2, GetField("現金股利","Y"),2, "現金股利");
