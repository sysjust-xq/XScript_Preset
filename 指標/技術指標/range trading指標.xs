{@type:indicator|@guid:98d4d80201be4c5e945aecc12c068c4a|@path:/技術指標/range trading指標|@hash:3f60837d26e20905a431b2001790621b}
value1=average(range,200);
value2=average(range,3);
value3=(value2-value1)/value1;
plot1(value3,"長短天期range差");
 
