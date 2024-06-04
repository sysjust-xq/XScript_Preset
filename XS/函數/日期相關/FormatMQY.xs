{@type:function_string|@guid:5c82a9a1c49e4bbf8e9488647f48f1ba|@path:/日期相關/FormatMQY}
SetBarMode(1);

input:Date1(numericsimple);

value1 = ceiling(month(Date1)/3);
switch (Barfreq) Begin
	case "M","AM":
		formatMQY = Formatdate("yyyyMM",Date1);
	case "Q" :
		formatMQY = Formatdate("yyyy",Date1) + "Q" + numtostr(value1,0);
	case "Y" :
		formatMQY = Formatdate("yyyy",Date1);
	default:
		formatMQY = Formatdate("yyyyMMdd",Date1);
end;



