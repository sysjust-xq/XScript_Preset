{@type:indicator}
input:length(30,"期數");
variable:up1(0),down1(0),mid1(0),bbandwidth(0);
variable:dayprofit(0),accprofit(0);
up1 = bollingerband(Close[1], Length, 2);
down1 = bollingerband(Close[1], Length, -2 );
if open*1.01>up1 then begin
	dayprofit=open-close;
end else if down1*1.01>open then begin
	dayprofit=close-open;
end else
	dayprofit=0;
accprofit=accprofit[1]+dayprofit;
plot1(accprofit,"累計獲利");



