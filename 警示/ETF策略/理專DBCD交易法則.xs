{@type:sensor}
input:length1(10,"短天期"),length2(20,"長天期"),length3(14,"平滑天期");
input:Threshold(-2,"觸發標準");

value1=bias(length1);
value2=bias(length2);
value3=value2-value1;
value4=average(value3,length3);

if value4 crosses over Threshold
then ret=1;