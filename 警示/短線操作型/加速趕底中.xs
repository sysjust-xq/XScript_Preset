{@type:sensor}
settotalbar(210);

if Close[4] > Close *1.07 and
   TrueAll (truerange/Close > 0.02,3) and
   Close < Highest(high,200) *0.7 
then Ret=1;
    
{自高檔回跌三成且近5期收低7%以上,近3期每期波動至少有2%}