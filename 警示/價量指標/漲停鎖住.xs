{@type:sensor|@guid:07b842faf2c34f8b8dfc1fdcd239b5c4|@path:/價量指標/漲停鎖住|@hash:338b1bd133f524bd11f7886519d14c36}
settotalbar(3);
If Close = GetField("漲停價", "D") And q_AskSize <=0 Then ret = 1;
        
        