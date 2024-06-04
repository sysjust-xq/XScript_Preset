{@type:indicator|@guid:23885a544d744283acfb39d172a5cad4|@path:/技術指標/ease of movement指標|@hash:37acbe786a8beec18b72ecc5adeeea19}
input:
	length1(9,"一次平滑期數"),
	length2(9,"二次平滑期數");

value1=(high+low)/2;
value2=value1-value1[1];
value3=volume/(high-low);
value4=value2/value3;
value5=average(value4,length1);
value6=average(value5,length2);

plot1(value5,"EMV");
plot2(value6,"EMV-MA");