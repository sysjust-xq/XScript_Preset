{@type:filter}
setbarfreq("D");
settotalbar(3);

if summation(GetField("外資買賣超","D"),20)<0
and trueall(GetField("外資買賣超","D")>200,3)
then ret=1;

