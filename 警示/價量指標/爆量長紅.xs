{@type:sensor|@guid:f7c0ee739f8d4b14ae9fc4604d6e5902|@path:/價量指標/爆量長紅|@hash:5c7109c6c9d4d3858b6f4c41784a9705}
settotalbar(8);
if volume >  Average(volume[1],5)  *3    and 
 ( close - open ) >( high -low ) * 0.75  and 
   close > open + (high[1]- low[1])
then ret=1;  


        
        