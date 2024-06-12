{@type:sensor}
input:OpenGap(1); setinputname(1,"開低幅度%");
input:uppercent(1);setinputname(2,"從最低點反彈上揚幅度%");

settotalbar(3);

if  GetField("Low", "D") = GetField("Open", "D") and
    GetField("Open", "D") < GetField("RefPrice", "D") * (1- OpenGap/100) and
    q_Last	> GetField("Low", "D") * (1+uppercent/100)
then ret=1;