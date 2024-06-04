{@type:sensor|@guid:4227a50780f5449082c36ad0321772cf|@path:/價量指標/當日量跌破|@hash:35994dd86122b4301b844de446f4b4ff}
input:initialtime(090000); setinputname(1,"起算時間HHmmss");
input:timeline(100000);   setinputname(2,"截止時間HHmmss");
settotalbar(50);
variable: intervalhighv(0);
variable: keyprice(0);

if date <> date[1] then  intervalhighv =0 ; 

if time >= initialtime and time <= timeline then
begin 
   intervalhighv = maxlist(volume,intervalhighv ); 
   keyprice =close;
end;

if volume > intervalhighv and time >timeline and
   close < keyprice  and close>=open then ret=1;  
	
	



        
        