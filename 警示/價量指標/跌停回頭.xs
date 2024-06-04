{@type:sensor|@guid:4c22e1c74997477cb1c6320e7b8e9866|@path:/價量指標/跌停回頭|@hash:f7bca6798628f06ead31f924e3c8c644}
settotalbar(3);
If Close[1] = GetField("跌停價", "D") And Close> GetField("跌停價", "D") Then ret = 1;
        
        