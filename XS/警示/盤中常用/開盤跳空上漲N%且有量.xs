{@type:sensor|@guid:8e73a35f8904401cbf2aff1b2dcd6749|@path:/盤中常用/開盤跳空上漲N%且有量}
if open >=close[1]*1.03
and volume*close>300000
then ret=1;