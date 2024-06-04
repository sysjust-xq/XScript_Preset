{@type:sensor|@guid:0994e771e66246409f95d51a9c44389f|@path:/2.市場常用語/拉尾盤|@hash:14d3561641ba6c031ec2eecd519dc1f0}
input:Ratio(1); setinputname(1,"拉尾盤幅度%");
input:tTime(130000); setinputname(2,"尾盤切算時間%");
input:TXT("限用5分鐘以下"); setinputname(3,"使用限制");
if barfreq <> "Min" or barinterval > 5 then return;

settotalbar(3);

variable:fPrice(0); if date<>date[1] then fPrice=0;

if time < tTime then fPrice = Close else
if Close > fPrice*(1+Ratio/100) and time >= tTime and fPrice>0 
then RET=1;