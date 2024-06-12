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
	iVolity100(numericsimple),		//波動率
	oOptPriceValue(numericref), 	//選擇權理論價
	oDelta(numericref), 			//Delta
	oGamma(numericref), 			//Gamma
	oVega(numericref), 				//Vega
	oTheta(numericref), 			//Theta
	oRho(numericref);				//Rho

variable:
	optiontype(iff(upperstr(iCallPutFlag)="P",-1,1)),
	d1(0),d2(0),nd1(0),nd2(0),nd1_prob(0),iRate(0),iB(0),iVolity(0),
	ty(0.002739726027),
	t(iDtoM*ty);

	optiontype = iff(upperstr(iCallPutFlag)="P",-1,1);
	t = iDtoM*ty;
	
	iRate = iRate100*0.01;
	iB = iB100*0.01;
	iVolity = iff(iVolity100=0,0.00000001,iVolity100*0.01);
	t = iDtoM*ty;

    If t > 0 Then
	begin
	
        d1 = (Log(iSpotPrice / iStrikePrice) + (iB + square(iVolity) * 0.5) * t) / (iVolity * SquareRoot(t));
		d2 = d1 - iVolity * SquareRoot(t);
        Nd1 = NormSDist(d1 * optiontype);
        Nd2 = NormSDist(d2 * optiontype);
        Nd1_Prob = ExpValue( -Square(d1) * 0.5 ) * 0.398942280407;

		oOptPriceValue = (iSpotPrice * ExpValue((iB - iRate) * t) * Nd1 - iStrikePrice * ExpValue(-iRate * t) * Nd2) * optiontype;
		oDelta = ExpValue((iB - iRate) * t) * Nd1 * optiontype;
		oGamma = ExpValue((iB - iRate) * t) * Nd1_Prob / (iSpotPrice * iVolity * SquareRoot(t));
		oVega = iSpotPrice * ExpValue((iB - iRate) * t) * SquareRoot(t) * Nd1_Prob * 0.01;		
		oTheta = (-iSpotPrice * ExpValue((iB - iRate) * t) * Nd1_Prob * iVolity / (2 * SquareRoot(t)) - optiontype * ((iB - iRate) * iSpotPrice * ExpValue((iB - iRate) * t) * Nd1 + iRate * iStrikePrice * ExpValue(-iRate * t) * Nd2)) * ty;
		oRho = iff(iB <> 0, (t * iStrikePrice * ExpValue(-iRate * t) * Nd2) * optiontype * 0.0001, -t * oOptPriceValue * 0.0001);
		
	end else begin
		oOptPriceValue=maxlist((iSpotPrice - iStrikePrice) * optiontype, 0);
		oDelta=iff(iSpotPrice > iStrikePrice,0.5 * (1 + optiontype),
				iff(iSpotPrice < iStrikePrice,0.5 * (1 + optiontype),
				0.5 * optiontype));
		oGamma=iff(iSpotPrice <> iStrikePrice,0,1);
		oVega=0;
		oTheta=0;
		oRho=0;
    end;


blackscholesmodel = 1;