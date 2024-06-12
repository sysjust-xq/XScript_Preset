{@type:sensor}
settotalbar(3);
If Close[1] = GetField("跌停價", "D") And Close> GetField("跌停價", "D") Then ret = 1;
        
        