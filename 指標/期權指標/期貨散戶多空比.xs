{@type:indicator}
variable: OI_all(0), OI_small_bull(0), OI_small_bear(0), OI_small_ratio(0), OI_big_ratio(0);

OI_all = getsymbolfield("FITX*1.TF","未平倉","D") 
	+ getsymbolfield("FITX*2.TF","未平倉","D")
	+ getsymbolfield("FIMTX*1.TF","未平倉","D") * 0.25 
	+ getsymbolfield("FIMTX*2.TF","未平倉","D") * 0.25;
OI_small_bull = OI_all - getsymbolfield("FITX*1.TF","十大交易人未沖銷買口","D");
OI_small_bear = OI_all - getsymbolfield("FITX*1.TF","十大交易人未沖銷賣口","D");
if OI_small_bull + OI_small_bear = 0 then
	OI_small_ratio = 0
else
	OI_small_ratio = 100 * OI_small_bull / (OI_small_bull + OI_small_bear) - 50;
plot1(OI_small_ratio,"散戶");

