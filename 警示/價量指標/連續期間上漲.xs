{@type:sensor|@guid:d1303866bffa4d2a832609ada9c503d9|@path:/價量指標/連續期間上漲|@hash:f024246ac605d66bc6a20c20abd549e6}
input:Length(3); setinputname(1,"連續上漲期數");
settotalbar(Length + 3);
If TrueAll(Close > Close[1],Length) then ret=1;


        
        