{@type:sensor}
settotalbar(3);
if GetField("漲停價", "D") = q_Ask and close <> GetField("漲停價", "D") then ret=1;