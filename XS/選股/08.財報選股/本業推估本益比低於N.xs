{@type:filter|@guid:e871341fd0a444b7ba06cc1053f3d14e|@path:/08.財報選股/本業推估本益比低於N}
input:epsl(15,"預估本益比上限");

value3= summation(GetField("營業利益","Q"),4); //單位百萬;
value4= GetField("最新股本");//單位億;
value5= value3/(value4*10);//每股預估EPS
if value5>0 and close/value5<=epsl
then ret=1;

outputfield(1,close/value5,1,"預估本益比", order := 1);
