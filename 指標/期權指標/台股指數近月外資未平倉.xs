{@type:indicator}
value1 = getsymbolfield("FITX*1.TF","外資買方未平倉口數");
value2 = getsymbolfield("FITX*1.TF","外資賣方未平倉口數");
value3 = value1 - value2;
plot1(value1,"外資未平倉買口");
plot2(value2,"外資未平倉賣口");
plot3(value3,"外資未平倉淨口");

