{@type:filter|@guid:eae514c591fc40a29d35bf81402b745d|@path:/08.財報選股/季營收連N季YOY正成長}
input:n(12,"期數(單位:季)");
setbarfreq("Q");
settotalbar(n+4);

value1=GetField("營業收入淨額","Q");//單位:百萬
if trueall(value1>value1[4],n)
then ret=1;