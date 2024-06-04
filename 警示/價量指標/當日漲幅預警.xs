{@type:sensor|@guid:a095724efdb040d6a29fdd1f37393043|@path:/價量指標/當日漲幅預警|@hash:347aef9537773b3ed9da28cdf48c4f58}
input:AlertChangeRatio(3); setinputname(1,"預警幅度%");
settotalbar(3);
If q_PriceChangeRatio > AlertChangeRatio Then ret = 1;
        
        