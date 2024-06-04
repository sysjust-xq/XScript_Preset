{@type:sensor|@guid:f204bd1e24cb4d7c894a5c99860629be|@path:/技術分析/短期均線跌破長期均線|@hash:9696a1724e64d997d4220eb686224b51}
input: Shortlength(5); setinputname(1,"短期均線期數");
input: Longlength(20); setinputname(2,"長期均線期數");

settotalbar(8);
setbarback(maxlist(Shortlength,Longlength,6));

If Average(Close,Shortlength) crosses under Average(Close,Longlength) then Ret=1;



