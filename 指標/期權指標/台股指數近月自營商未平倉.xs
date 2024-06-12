{@type:indicator}
value1 = getsymbolfield("FITX*1.TF","自營商買方未平倉口數");
value2 = getsymbolfield("FITX*1.TF","自營商賣方未平倉口數");
value3 = value1 - value2;
plot1(value1,"自營商未平倉買口");
plot2(value2,"自營商未平倉賣口");
plot3(value3,"自營商未平倉淨口");

