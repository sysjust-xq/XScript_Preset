{@type:sensor}
//系統用time來代表時間，顯示格式為hhmmss

//===========範例：開盤前三根K線都是陽線======================

//3.引用時間序列的回傳值﹙包括開高低收成交量等﹚
//時間函數應用
if time=091500 //時間是九點十五分

and close>close[1]     and close>open      
and close[1]>close[2]  and close[1]>open[1]
and close[2]>close[3]  and close[2]>open[2]

then ret=1;