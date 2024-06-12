{@type:sensor}
input:AlertChangeRatio(3); setinputname(1,"預警幅度%");
settotalbar(3);
If q_PriceChangeRatio > AlertChangeRatio Then ret = 1;
        
        