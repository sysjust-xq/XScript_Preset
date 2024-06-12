{@type:indicator}
input:period(5,"期別");
value1=summationif(close>close[1],high-close[1],period);
plot1(value1,"進攻力道線");

