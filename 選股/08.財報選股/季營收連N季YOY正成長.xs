{@type:filter}
input:n(12,"期數(單位:季)");
setbarfreq("Q");
settotalbar(n+4);

value1=GetField("營業收入淨額","Q");//單位:百萬
if trueall(value1>value1[4],n)
then ret=1;