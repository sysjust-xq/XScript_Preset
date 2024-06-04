{@type:sensor|@guid:6af1b39cf57f4964862dd44319cf5fed|@path:/2.市場常用語/連日量縮下跌|@hash:e8cd7c0a5ed80b3f80b933597d98560e}
input:percent(4);setinputname(1,"累計下跌幅度%"); 
input:ratio(20); setinputname(2,"量縮幅度%"); 
input:Length(3);setinputname(3,"持續期數");

settotalbar(Length + 3);

if close[Length-1]  > Close * (1+percent/100) and 
   volume[Length-1] > Volume* (1+ratio/100) and 
   TrueAll(Close < Close[1] ,Length-1) 
then ret=1;