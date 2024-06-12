{@type:filter}
input:day(60,"計算區間");//設定計算區間
input:GP(30,"波段漲幅下限");//設定波段漲幅下限，單位是%
input:pc(2,"M頭兩高點價差上限");//設定M頭兩高點價差上限，單位是%
input:rg(30,"波段低點到高點的最少天數");//波段低點到高點的最少天數
input:bc(4,"M谷底距離頭部最低跌幅");//M谷底距離頭部最低跌幅，單位是%

value1=highest(high,day);//找出波段最高點
value2=lowest(low,day);//找出波段最低點
value3=nthhighest(2,high,day);//波段第二高點
value4=nthhighestbar(1,high,day);//最高價在距今第幾根bar
value5=nthlowestbar(1,low,day);//最低價在距今第幾根bar
value6=nthhighestbar(2,high,day);//第二價在距今第幾根bar
value7=lowest(low,maxlist(value4,value6));//從第一個M頭以來的最低點
value8=nthlowestbar(1,low,maxlist(value4,value6));//谷底距今第幾根bar
condition1=false;
condition2=false;
condition3=false;
condition4=false;

if value1>value2*(1+gp/100) then condition1=true;//波段漲幅超過30%
if value5>maxlist(value4,value6)+rg then condition2=true;//低點在圖左邊
if value1<=value3*(1+pc/100) then condition3=true;//兩個高點之間的價差不大
if value8>minlist(value4,value6) and value8<minlist(value4,value6)
then condition4=true;//谷底在兩頭之間

if condition1 and condition2 and condition3 and condition4  
then ret=1;  
