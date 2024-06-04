{@type:sensor|@guid:c7e65ba12ee24d5389a22bb5338e92bd|@path:/2.市場常用語/當日上漲n%|@hash:7b1590cd7234e3ab373618680436ea79}
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