{@type:sensor|@guid:0d654062d44a4fb59f7b75795329fe3f|@path:/2.市場常用語/開低走高|@hash:94c472e7788852cbd81ea73473fc9e73}
input:OpenGap(1); setinputname(1,"開低幅度%");
input:uppercent(1);setinputname(2,"從最低點反彈上揚幅度%");

settotalbar(3);

if  GetField("Low", "D") = GetField("Open", "D") and
    GetField("Open", "D") < GetField("RefPrice", "D") * (1- OpenGap/100) and
    q_Last	> GetField("Low", "D") * (1+uppercent/100)
then ret=1;