{@type:sensor|@guid:0660a644e06f47439fe64311ab902882|@path:/價量指標/跌停鎖住|@hash:d58d1e39a4d43f3fd5b80c7283e7189b}
settotalbar(3);
If Close = GetField("跌停價", "D") And q_bidsize <=0 Then ret = 1;
        
        