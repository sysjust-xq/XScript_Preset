{@type:function}
SetBarMode(1);

input:n(NumericSimple);

//Keltner Channels 的繪製，是以一條指數移動平均線為中間， 然後在上下兩邊依據所謂的"平均真實範圍值"來繪出軌道的範圍來。

KeltnerMA = XAverage(close, n);



