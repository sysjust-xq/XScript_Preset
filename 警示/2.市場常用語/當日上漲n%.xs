{@type:sensor}
input:percent(1.5); setinputname(1,"當日上漲幅度%");

settotalbar(3);

variable:WorkTrue(true);

if  WorkTrue and  currenttime <= TimeAdd(time,"M",1) and 
    Close > GetField("RefPrice", "D") * (1+ Percent/100) then 
begin
Ret=1;
WorkTrue =false;
end;

if WorkTrue =false and Close < GetField("RefPrice", "D") * (1+ Percent/100) then WorkTrue =true;