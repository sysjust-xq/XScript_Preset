{@type:sensor|@guid:c3c38c5cf72e4fd59e2d68310c593c40|@path:/價量指標/漲停回頭|@hash:24ac84f790217bfd3096a51cd18644d9}
settotalbar(3);
If Close[1] = GetField("漲停價", "D") And q_Last < GetField("漲停價", "D") Then ret = 1;
        
        