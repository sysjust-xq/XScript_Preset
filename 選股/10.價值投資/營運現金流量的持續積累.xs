{@type:filter}
input:ratio(50, "比例");//總市值減去淨值是十年營運現金流的的多少百分比, 單位是%

var: nv(0);
value1=GetField("來自營運之現金流量","q");//單位百萬
value2=GetField("總市值","D");//單位億
value3=summation(value1,8);//最近八季的營運現金流總和
value4=value3*5;//以最近兩年來推未來十年營運現金流總和

nv=GetField("股東權益總額","Q");//單位百萬
if value2*100-nv<value4*ratio/100
then ret=1;

outputfield(1, 100*value2/value4,1, "市值/現金流", order := -1);
