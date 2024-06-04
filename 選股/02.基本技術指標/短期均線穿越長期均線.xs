{@type:filter|@guid:344862d8215b4259845871d6f8f025a3|@path:/02.基本技術指標/短期均線穿越長期均線|@hash:8c667f84ce51f5939cc03c01c055fc47}
input: Shortlength(5); setinputname(1,"短期均線期數");
input: Longlength(20); setinputname(2,"長期均線期數");

settotalbar(3);

If Average(Close,Shortlength) crosses over Average(Close,Longlength) then Ret=1;



        