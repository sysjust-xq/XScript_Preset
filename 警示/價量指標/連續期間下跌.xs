{@type:sensor}
input:Length(3); setinputname(1,"連續下跌期數");
settotalbar(Length + 3);
If TrueAll(Close < Close[1],Length) then ret=1;


        
        