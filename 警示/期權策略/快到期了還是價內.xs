{@type:sensor}
if  q_IOofMoney>0 
and datediff(GetSymbolInfo("到期日"),date)<10
and datediff(GetSymbolInfo("到期日"),date)>0
then ret=1;





