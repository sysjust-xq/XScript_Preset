{@type:sensor}
input:ratio(4);     setinputname(1,"開低幅度%"); 
input:ratio1(0.5);  setinputname(2,"開低後回升幅度%");
settotalbar(3);
if GetField("Open", "D") < GetField("RefPrice", "D") * (1 -Ratio/100) and 
   GetField("Open", "D") >= GetField("Low", "D")  and
   (GetField("Open", "D")- GetField("Low", "D"))<  Close * Ratio1 and
   Close > GetField("Open", "D") * (1 + Ratio1/100) 
then ret=1;