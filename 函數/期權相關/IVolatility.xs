{@type:function}
SetBarMode(1);

input: 
	iCallPutFlag(stringsimple),	 	//C表買權、P表賣權
    iSpotPrice(numericsimple),		//標的價格
	iStrikePrice(numericsimple),	//履約價
	iDtoM(numericsimple),			//到期天數
	iRate100(numericsimple),		//無風險利率
	iB100(numericsimple),			//持有成本
									//股票選擇權 b=r-殖利率
									//期貨選擇權 b=0
									//外匯選擇權 b=r-外國無風險利率
	iPrice(numericsimple);			//選擇權現價

variable: 
	var1( 0 ), 
	var2( 0 ), 
	var3( 0 ), 
	var4( 0 ) ;

condition1 = iDtoM > 0 and iStrikePrice > 0 and iSpotPrice > 0 ;
if condition1 then
	begin
	var1 = 100 ;
	var2 = bsprice(iCallPutFlag, iSpotPrice, iStrikePrice, iDtoM, iRate100, iB100, var1);
	while var2 < iPrice and var1 <= 900
		begin
		var1 = var1 + 100 ;
		var2 = bsprice(iCallPutFlag, iSpotPrice, iStrikePrice, iDtoM, iRate100, iB100, var1);
		end ;
	if var2 < iPrice then
		ivolatility= 999
	else
		begin
		var3 = 1 ;
		var4 = 100 ;
		while AbsValue( var2 - iPrice ) >= .005 and var3 < 11
			                                                                     
			                             
			begin
			var4 = var4 * .5 ;
			if var2 > iPrice then
				var1 = var1 - var4
			else if var2 < iPrice then
				var1 = var1 + var4 ;
			var2 = bsprice(iCallPutFlag, iSpotPrice, iStrikePrice, iDtoM, iRate100, iB100, var1);
			var3 = var3 + 1 ;
			end ;
		ivolatility= var1 ;
		end ;
	end
else
	ivolatility= 0 ;
