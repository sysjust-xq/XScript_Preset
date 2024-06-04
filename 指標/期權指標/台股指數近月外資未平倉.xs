{@type:indicator|@guid:7cc224d775a74eb5b836752ead7b8bf4|@path:/期權指標/台股指數近月外資未平倉|@hash:b6dd64cfdad54b38dd46d5a93fe3910d}
value1 = getsymbolfield("FITX*1.TF","外資買方未平倉口數");
value2 = getsymbolfield("FITX*1.TF","外資賣方未平倉口數");
value3 = value1 - value2;
plot1(value1,"外資未平倉買口");
plot2(value2,"外資未平倉賣口");
plot3(value3,"外資未平倉淨口");

