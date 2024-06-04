{@type:indicator|@guid:aa14886c86cd437db20ac11f6022216e|@path:/技術指標/進攻力道線|@hash:271713d46e7503d2dc97ee47ffa1cdf5}
input:period(5,"期別");
value1=summationif(close>close[1],high-close[1],period);
plot1(value1,"進攻力道線");

