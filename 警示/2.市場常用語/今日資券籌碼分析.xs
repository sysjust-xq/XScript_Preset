{@type:sensor}
variable:i(1);
if Currenttime > 220000  or Currenttime < 083000 then i=0; 

settotalbar(3);

if GetField("成交金額")[i]>10000000 and GetField("融資使用率")[i+1] > 0 and
   (GetField("融資使用率")[i]/GetField("融資使用率")[i+1]-1)*100 * (C[i]/C[i+1]-1)*100 >40
then ret=1;

if  C[i] > C[i+2]*1.1 and (GetField("融券增減張數")[i]*C[i])> 10000 then ret=1;