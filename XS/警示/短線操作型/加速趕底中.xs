{@type:sensor|@guid:1e718d5d101c4b35ac79c63a2be9e10c|@path:/短線操作型/加速趕底中|@hash:c8c211c4214204209e7f494eea6ee26d}
settotalbar(210);

if Close[4] > Close *1.07 and
   TrueAll (truerange/Close > 0.02,3) and
   Close < Highest(high,200) *0.7 
then Ret=1;
    
{自高檔回跌三成且近5期收低7%以上,近3期每期波動至少有2%}