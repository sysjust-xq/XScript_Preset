{@type:sensor|@guid:834e302f3f97478fae7e674854ae8f97|@path:/價量指標/當日跌幅預警|@hash:45c7bca54395d2bdcef51236448a7eac}
input:AlertChangeRatio(3); setinputname(1,"預警幅度%");
settotalbar(3);
If q_PriceChangeRatio < AlertChangeRatio*-1 Then ret = 1;
        
        