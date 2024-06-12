{@type:sensor}
if trueall(close>open,5) 
and close*1.4<close[90]
then ret=1;