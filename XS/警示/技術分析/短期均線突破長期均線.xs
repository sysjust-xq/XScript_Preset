{@type:sensor|@guid:a2055f9d53ba4cfaa633fb024cd7f9ba|@path:/技術分析/短期均線突破長期均線|@hash:330b630f17aa3bed5e194e5a726ef81b}
input: Shortlength(5); setinputname(1,"短期均線期數");
input: Longlength(20); setinputname(2,"長期均線期數");

settotalbar(8);
setbarback(maxlist(Shortlength,Longlength,6));

If Average(Close,Shortlength) crosses over Average(Close,Longlength) then Ret=1;



        