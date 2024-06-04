{@type:indicator|@guid:6af8d6671a6d4038aa2adfc72d91f085|@path:/技術指標/N日內上漲天數|@hash:a410c7523215492fb319b0722bcf47ef}
input:length(20,"期數");

variable:count(0);
variable:x1(0);

count=countif(close>close[1],length);

plot1(count,"上漲天數");