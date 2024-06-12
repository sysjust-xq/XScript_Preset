{@type:filter}
{本益比小於 15 倍 股價淨值比小於 2 倍 殖利率大於 3%}



if GetField("本益比","D") < 10 and
   GetField("股價淨值比","D") <1.5 and
   GetField("殖利率","D") > 3  and
   GetField("營收成長率","Q") >0 
    
    
   then ret=1;
   
   