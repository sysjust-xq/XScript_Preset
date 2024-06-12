{@type:sensor}
input:Ratio(5); setinputname(1,"逆襲上漲幅度%");
input:TXT1("僅適用日線"); setinputname(2,"使用限制");
input:TXT2("需選用逐筆洗價"); setinputname(3,"使用說明");
settotalbar(5);

if BarFreq = "D" and Close > Close[2] *(1+Ratio/100) and
   Close > Close[1] and Close[1] > Close[2]
then
begin
  if GetField("融券餘額張數")[1] = 0 and  GetField("融券餘額張數")[2] = 0 and 
     GetField("融資餘額張數")[1] >0 {推測是除權前停券} then ret=1; 
end;