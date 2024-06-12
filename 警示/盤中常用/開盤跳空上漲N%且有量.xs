{@type:sensor}
if open >=close[1]*1.03
and volume*close>300000
then ret=1;