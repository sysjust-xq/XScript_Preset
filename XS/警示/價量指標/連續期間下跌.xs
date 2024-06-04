{@type:sensor|@guid:5383fa5b63964167a4927105cd37fcd0|@path:/價量指標/連續期間下跌|@hash:9c1f6382589f2dc1482c0b03c395b068}
input:Length(3); setinputname(1,"連續下跌期數");
settotalbar(Length + 3);
If TrueAll(Close < Close[1],Length) then ret=1;


        
        