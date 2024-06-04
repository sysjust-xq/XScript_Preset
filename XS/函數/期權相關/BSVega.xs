{@type:function|@guid:fc3be5d07b1f4cb98ce8ac7e032167bc|@path:/期權相關/BSVega|@hash:5b827570a475cc309ed6a137ff9064e4}
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
	iVolity100(numericsimple);		//波動率
	
variable: _Output(0);

blackscholesmodel(iCallPutFlag,iSpotPrice,iStrikePrice,iDtoM,iRate100,iB100,iVolity100,
value1,value2,value3,_Output,value5,value6);

BSVega = _Output;