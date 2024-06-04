{@type:filter|@guid:16c025c0a56a4fa58382f3537dfca082|@path:/02.基本技術指標/短期均線跌破長期均線|@hash:fa4f12451ed258cbec6ce1d6e2532255}
input: Shortlength(5); setinputname(1,"短期均線期數");
input: Longlength(20); setinputname(2,"長期均線期數");

settotalbar(3);

If Average(Close,Shortlength) crosses under Average(Close,Longlength) then Ret=1;



