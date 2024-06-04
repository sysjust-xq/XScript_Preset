{@type:filter|@guid:c5e12ace2bec4f31965b0773a9115175|@path:/08.財報選股/營業外收入愈來愈高}
settotalbar(3);

if trueall(GetField("營業外收入合計","Y") > GetField("營業外收入合計","Y")[1], 3) 
then ret=1;

