{@type:filter|@guid:2ff3babda762416b96fe44e9b14db55d|@path:/06.籌碼選股/外資由空翻多}
setbarfreq("D");
settotalbar(3);

if summation(GetField("外資買賣超","D"),20)<0
and trueall(GetField("外資買賣超","D")>200,3)
then ret=1;

