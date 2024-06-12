{@type:filter}
settotalbar(3);

if trueall(GetField("營業外收入合計","Y") > GetField("營業外收入合計","Y")[1], 3) 
then ret=1;

