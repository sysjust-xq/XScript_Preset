{@type:indicator}
{
指標說明
https://xstrader.net/先進指標zero-lag-heikinashi/
}

input: Length(14,"期數");

variable: 
		price(0), haO(0), haC(0), haMax(0), haMin(0), 
		TEMA1(0), EMAValue1(0), DbEMAValue1(0), 
		TEMA2(0), EMAValue2(0), DbEMAValue2(0), ZeroLagHA(0);
 
price = (close+open+high+low)/4;
haO = (haO[1]+price)/2;
haMax = maxlist(high, haO);
haMin = minlist(low, haO);
 
haC = (price+haO+haMax+haMin)/4;
 
EMAValue1 = xaverage(haC, Length);
DbEMAValue1 = xaverage(EMAValue1, Length);
TEMA1 = 3*EMAValue1-3*DbEMAValue1+xaverage(DbEMAValue1, Length);
EMAValue2 = xaverage(TEMA1, Length);
DbEMAValue2 = xaverage(EMAValue2, Length);
TEMA2 = 3*EMAValue2-3*DbEMAValue2+xaverage(DbEMAValue2, Length);
 
ZeroLagHA = 2*TEMA1-TEMA2;
 
plot1(ZeroLagHA, "Zero Lag HeikinAshi");
plot2(average(C,20),"Average");