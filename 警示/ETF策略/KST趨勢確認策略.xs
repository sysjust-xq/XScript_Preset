{@type:sensor|@guid:03ec7f4195f348b2a2c393ecb677ee4c|@path:/ETF策略/KST趨勢確認策略}
variable:kst(0);
 
kst=callfunction("KST確認指標");

if kst crosses over -50 then ret=1;


