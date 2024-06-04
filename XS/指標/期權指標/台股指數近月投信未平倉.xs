{@type:indicator|@guid:8f3c460901294a8791f68d7f49addfb0|@path:/期權指標/台股指數近月投信未平倉|@hash:ba42d03800e66410eae022da01620c87}
value1 = getsymbolfield("FITX*1.TF","投信買方未平倉口數");
value2 = getsymbolfield("FITX*1.TF","投信賣方未平倉口數");
value3 = value1 - value2;
plot1(value1,"投信未平倉買口");
plot2(value2,"投信未平倉賣口");
plot3(value3,"投信未平倉淨口");

