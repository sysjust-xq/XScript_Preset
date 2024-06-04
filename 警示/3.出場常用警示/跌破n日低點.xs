{@type:sensor|@guid:c6e6f48dc67d48ebbded186d6354c3d9|@path:/3.出場常用警示/跌破n日低點|@hash:bf129eb0a3905e85c56041af4070eff3}
input:Length(20); setinputname(1,"計算期數");

settotalbar(Length + 3);

if close  < lowest(low[1],Length) then ret=1;