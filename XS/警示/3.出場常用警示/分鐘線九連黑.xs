{@type:sensor|@guid:f274bf7b693a426588e40fd0063ea40c|@path:/3.出場常用警示/分鐘線九連黑|@hash:bf274bddb32d0b1e30f185d26af4aed1}
Input: Length(9); SetInputName(1, "連續筆數");

settotalbar(Length + 3);

if Barfreq ="Min" then 
   if trueall(close < open,Length) then ret=1;
