{@type:indicator|@guid:a5f95e28c0004141ab8c58c431b40b66|@path:/XQ技術指標/ADI (累積分配指標)|@hash:b406bfde9995e273777fb96821b19d55}
// XQ: A/DI 指標
//
variable: adi(0);

if Close > Close[1] then
	adi = adi[1] + (Close - minlist(low, close[1])) 
else
  begin
	if Close < Close[1] then
		adi = adi[1] - (maxlist(high, close[1]) - close)
	else
		adi = adi[1];
  end;

Plot1(adi, "A/DI");
		