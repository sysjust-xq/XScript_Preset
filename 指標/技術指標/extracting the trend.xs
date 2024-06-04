{@type:indicator|@guid:6cba1e14ef61413ab32f3db130d1f1c8|@path:/技術指標/extracting the trend|@hash:d158c0c88ed0bd0fca85f92dd3b1d4f2}
input:
	period(20),
	delta(0.1);
	
variable: price(0),gamma(0),alpha(0),beta(0),BP(0),trend(0);
price=(h+l)/2;

beta=cosine(360/period);
gamma=1/cosine(720*delta/period);
alpha=gamma-squareroot(gamma*gamma-1);
BP=0.5*(1-alpha)*(price-price[2])+beta*(1+alpha)*BP[1]-alpha*BP[2];
trend=average(bp,2*period);

plot1(trend);
plot2(0);
 