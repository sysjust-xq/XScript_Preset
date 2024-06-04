{@type:sensor|@guid:e44c6d2fd6f94cc186ea09b4bd70b865|@path:/波段操作型/法人作多股|@hash:2890eb312e4ccc2022d8d18004949eaf}
input: ForceType(1); setinputname(1,"1:外資 2:投信 3:自營");
input: Atleast(1000); setinputname(2,"最少買超張數");
input:TXT("須逐筆洗價"); setinputname(3,"使用限制:日線");

settotalbar(3);

if barfreq <> "D" then return;

variable: ForcePush(0);
Switch ( ForceType ) 
Begin 
Case 1: ForcePush =Getfield("外資買賣超")[1];
Case 2: ForcePush =Getfield("投信買賣超")[1];
Case 3: ForcePush =Getfield("自營商買賣超")[1]; 
End; 

if  volume > volume[1] then 
begin
      condition1 = ( close[1]-open[1]  > 0.75 *high[1]-low[1] )  and //長紅棒
                   (high[1] -low[1]) > 2 *( high[2]-low[2]);      

      if condition1 and q_Ask > highest(high[1],3) and ForcePush >Atleast then ret=1;
end;

