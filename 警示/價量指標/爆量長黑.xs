{@type:sensor}
settotalbar(8);
if volume >  Average(volume[1],5)  *3    and 
 ( open - close ) >( high -low ) * 0.75  and 
   open > close  + (high[1]- low[1])
then ret=1;  


        
        