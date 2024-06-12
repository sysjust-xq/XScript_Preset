{@type:sensor}
variable:kst(0);
 
kst=callfunction("KST確認指標");

if kst crosses over -50 then ret=1;


