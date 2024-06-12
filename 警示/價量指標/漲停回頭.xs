{@type:sensor}
settotalbar(3);
If Close[1] = GetField("漲停價", "D") And q_Last < GetField("漲停價", "D") Then ret = 1;
        
        