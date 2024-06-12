{@type:sensor}
input: Shortlength(5); setinputname(1,"短期均線期數");
input: Longlength(20); setinputname(2,"長期均線期數");

settotalbar(8);
setbarback(maxlist(Shortlength,Longlength,6));

If Average(Close,Shortlength) crosses over Average(Close,Longlength) then Ret=1;



        