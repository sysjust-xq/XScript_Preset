{@type:function|@guid:6f695b87f1f047f5b162d222df2e7edf|@path:/期權相關/BSPrice|@hash:039772dd4775c5ea4b9a422cdaa08ccf}
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
_Output,value2,value3,value4,value5,value6);

BSPrice = _Output;