{@type:filter}
value1=GetField("營業利益","Q");//單位:百萬
value2=GetField("月營收","M");//單位:億
value3=GetField("營業利益率","Q");
value4=SUMMATION(GETFIELD("月營收","M"),3);//近三個月營收
value5=value4*value3/100;
//用最近一期營益率去估算的最近一季營業利益
value6=SUMMATION(GetField("營業利益","Q"),3)+value5*100;
//前三季營業利益加上最近一季預估營業利益
value8=GetField("最新股本");//單位億
value9=value6/(value8*100)*10;
//估算出來的EPS

value10=value9/close*100;
//eps/股價*100: 預估殖利率

if value10>10 and value3>0 and close>10
then ret=1;
outputfield(1,value10,1,"殖利率");
outputfield(2,value9,1,"預估EPS");

