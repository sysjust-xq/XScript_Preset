{@type:sensor|@guid:7250696c1afe4c69a720f4e952fb981d|@path:/價量指標/爆量長黑|@hash:3858ae1a18203912bd034dfaf9ffc67c}
settotalbar(8);
if volume >  Average(volume[1],5)  *3    and 
 ( open - close ) >( high -low ) * 0.75  and 
   open > close  + (high[1]- low[1])
then ret=1;  


        
        