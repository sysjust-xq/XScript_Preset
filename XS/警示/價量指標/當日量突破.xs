{@type:sensor|@guid:78ec0ac39ced48e0a9ded414226d6c94|@path:/價量指標/當日量突破|@hash:d35ac7869b558919ae52f653bae363fe}
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
   close > keyprice  and close>=open then ret=1;  
	
	



        
        