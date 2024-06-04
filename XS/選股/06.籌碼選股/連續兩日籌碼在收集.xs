{@type:filter|@guid:30d5581fac6f413cbdb15f011e94fcc0|@path:/06.籌碼選股/連續兩日籌碼在收集}
value1=GetField("分公司買進家數","D");
value2=GetField("分公司賣出家數","D");
value3=value2-value1;
if trueall(value3>30,2)
then ret=1;