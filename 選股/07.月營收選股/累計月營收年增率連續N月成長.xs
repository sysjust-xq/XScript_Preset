{@type:filter|@guid:776791c72c594c1ea494ecb73cd5332b|@path:/07.月營收選股/累計月營收年增率連續N月成長}
input:period(6,"計算區間");
settotalbar(period+1);
value1=GetField("累計營收年增率","M");
if trueall(value1>value1[1],period)
then ret=1;
