{@type:filter}
input:peratio(17,"本益比上限倍數");
input:ratio(60,"現金股利佔股利之比重下限");
input:epsl(2,"預估本益EPS下限");
input:rate1(5,"累計營收成長率下限");
 
value1=GetField("累計營收年增率","M");//單位%
value2=GetField("現金股利佔股利比重","Y");
value3=GetField("營業利益","Q");//單位百萬;
value4=GetField("最新股本");//單位億;
value5=summation(value3,4)/(value4*10);//每股預估EPS

if value1>=rate1 //本業持續成長
and value2>=ratio //主要以現金股利為主
and value5>=EPSl //每股推估本業獲利高
and value5/close<=peratio //本益比低
then ret=1;

