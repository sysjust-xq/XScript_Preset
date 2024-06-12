{@type:indicator}
input: period(14,"設定區間");

variable:pvm(0);
variable:nvm(0);

pvm=absvalue(high-low[1]);
nvm=absvalue(low-high[1]);
value1=summation(pvm,period);
value2=summation(nvm,period);
value3=summation(truerange,period);
value4=value1/value3;
value5=value2/value3;
value6=value4-value5;

plot1(value6,"vortex");
 