{@type:sensor|@guid:af1daf8632684a7bacb3ecc5008fc699|@path:/3.出場常用警示/川上三鴉|@hash:975f4d768e728982596a9ceed3b81d69}
settotalbar(3);
if TrueAll((open-close) > (high-low) * 0.5 and close <close[1],3) then ret=1;
             

        
        