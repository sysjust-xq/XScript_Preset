{@type:sensor|@guid:7bf49e80e39b486fb442efe3e9d23fcd|@path:/期權策略/快到期了還是價內}
if  q_IOofMoney>0 
and datediff(GetSymbolInfo("到期日"),date)<10
and datediff(GetSymbolInfo("到期日"),date)>0
then ret=1;





