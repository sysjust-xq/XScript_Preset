{@type:sensor|@guid:6bacda99c9ed42489a52384af4a22e20|@path:/抄底策略/大跌後的低檔五連陽}
if trueall(close>open,5) 
and close*1.4<close[90]
then ret=1;