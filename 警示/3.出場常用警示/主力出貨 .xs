{@type:sensor}
input:RatioThre(1.5); setinputname(1,"下跌量上漲量比");

settotalbar(8);

variable: upvolume(0);//累計上漲量
variable: downvolume(0);//累計下跌量
variable: uprange(0);//累計上漲值
variable: downrange(0);//累計下跌值
variable: DUratio(0);//下跌量上漲量比
if date[1] <> date then 
begin 
      downvolume  =0; upvolume =0;
	  uprange =0; downrange=0;
      if close > open then  
	    begin 
	      upvolume = volume; 
		  uprange = close -open;   
		end
      else 
	  if close < open then  
		begin 
		  downvolume = volume;  
		  downrange = open -close; 
		end
	  else 
	  if close < close[1] then  
	    begin 
		  downvolume = volume;  
		  downrange = close[1] -close; 
	    end
	  else 
	  if close > close[1] then  
	    begin 
		  upvolume = volume; 
		  uprange = close -close[1]; 
	    end;
end;//如果前一個跟Bar跟目前的bar日期不同 今天第一根起算

if date[1] = date then  //還在同一天
begin 
      if close > close[1] then  
	    begin 
	      upvolume += volume; 
		  uprange += close -close[1];   
		end
      else 
	  if close < close[1] then  
	    begin 
		  downvolume += volume;  
		  downrange += close[1] -close; 
	    end;
 if upvolume > 0 then DUratio = downvolume/upvolume else DUratio=1;
end;

if DUratio crosses over RatioThre and uprange crosses under downrange then ret=1;
