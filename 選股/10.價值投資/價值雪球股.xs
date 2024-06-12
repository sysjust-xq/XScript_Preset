{@type:filter}
if GetField("本益比","D") < 15 and
   GetField("股價淨值比","D") <2 and
   GetField("殖利率","D") > 3  and
   GetField("營收成長率","Q") >0 and
   GetField("營業利益","Q") >GetField("營業利益","Q")[1] and
   C > Lowest(L,255) + (highest(h,255)-Lowest(L,255))*0.5
   then ret=1;
   
outputfield(1,GetField("本益比","D"),1,"本益比");
outputfield(2,GetField("股價淨值比","D"),1,"PB比");
outputfield(3,GetField("殖利率","D"),2, "殖利率", order := 1);
