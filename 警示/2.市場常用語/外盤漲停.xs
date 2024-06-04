{@type:sensor|@guid:3eb67be32e294539996a4bf9c2323577|@path:/2.市場常用語/外盤漲停|@hash:a0f03edd08a4af7cc7fbad437db9440b}
settotalbar(3);
if GetField("漲停價", "D") = q_Ask and close <> GetField("漲停價", "D") then ret=1;