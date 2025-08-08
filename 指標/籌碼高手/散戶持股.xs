{@type:indicator}
{由集保公司所提供的，「指定級距以下」的持股資料所計算}

input: _input1(50,"散戶標準",inputkind:= Dict(["1",1],["5",5],["10",10],["15",15],["20",20],["30",30],["40",40],["50",50],["100",100],["200",200],["400",400],["600",600],["800",800],["1000",1000]),quickedit:=true);

condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and (symboltype = 2 or symbolType = 1);//個股+興櫃+類股

if condition998 = false //個股+興櫃+類股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
switch (_input1)
begin
	case 1:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=1);
			value2 = Getfield("散戶持股張數","W",param:=1);
			value3 = Getfield("散戶持股人數","W",param:=1);
		end else begin
			value1 = Getfield("散戶持股比例",param:=1);
			value2 = Getfield("散戶持股張數",param:=1);
			value3 = Getfield("散戶持股人數",param:=1);
		end;	
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
		
	case 5:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=5);
			value2 = Getfield("散戶持股張數","W",param:=5);
			value3 = Getfield("散戶持股人數","W",param:=5);
		end else begin
			value1 = Getfield("散戶持股比例",param:=5);
			value2 = Getfield("散戶持股張數",param:=5);
			value3 = Getfield("散戶持股人數",param:=5);
		end;	
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);

	case 10:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=10);
			value2 = Getfield("散戶持股張數","W",param:=10);
			value3 = Getfield("散戶持股人數","W",param:=10);
		end else begin
			value1 = Getfield("散戶持股比例",param:=10);
			value2 = Getfield("散戶持股張數",param:=10);
			value3 = Getfield("散戶持股人數",param:=10);
		end;	
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
			
	case 15:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=15);
			value2 = Getfield("散戶持股張數","W",param:=15);
			value3 = Getfield("散戶持股人數","W",param:=15);
		end else begin
			value1 = Getfield("散戶持股比例",param:=15);
			value2 = Getfield("散戶持股張數",param:=15);
			value3 = Getfield("散戶持股人數",param:=15);
		end;	
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
		
	case 20:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=20);
			value2 = Getfield("散戶持股張數","W",param:=20);
			value3 = Getfield("散戶持股人數","W",param:=20);
		end else begin
			value1 = Getfield("散戶持股比例",param:=20);
			value2 = Getfield("散戶持股張數",param:=20);
			value3 = Getfield("散戶持股人數",param:=20);
		end;	
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
		
	case 30:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=30);
			value2 = Getfield("散戶持股張數","W",param:=30);
			value3 = Getfield("散戶持股人數","W",param:=30);
		end else begin
			value1 = Getfield("散戶持股比例",param:=30);
			value2 = Getfield("散戶持股張數",param:=30);
			value3 = Getfield("散戶持股人數",param:=30);
		end;	
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
	
	case 40:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=40);
			value2 = Getfield("散戶持股張數","W",param:=40);
			value3 = Getfield("散戶持股人數","W",param:=40);
		end else begin
			value1 = Getfield("散戶持股比例",param:=40);
			value2 = Getfield("散戶持股張數",param:=40);
			value3 = Getfield("散戶持股人數",param:=40);
		end;	
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
		
	case 50:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=50);
			value2 = Getfield("散戶持股張數","W",param:=50);
			value3 = Getfield("散戶持股人數","W",param:=50);
		end else begin
			value1 = Getfield("散戶持股比例",param:=50);
			value2 = Getfield("散戶持股張數",param:=50);
			value3 = Getfield("散戶持股人數",param:=50);
		end;
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);

	case 100:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=100);
			value2 = Getfield("散戶持股張數","W",param:=100);
			value3 = Getfield("散戶持股人數","W",param:=100);
		end else begin
			value1 = Getfield("散戶持股比例",param:=100);
			value2 = Getfield("散戶持股張數",param:=100);
			value3 = Getfield("散戶持股人數",param:=100);
		end;
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
		
	case 200:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=200);
			value2 = Getfield("散戶持股張數","W",param:=200);
			value3 = Getfield("散戶持股人數","W",param:=200);
		end else begin
			value1 = Getfield("散戶持股比例",param:=200);
			value2 = Getfield("散戶持股張數",param:=200);
			value3 = Getfield("散戶持股人數",param:=200);
		end;
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
		
	case 400:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=400);
			value2 = Getfield("散戶持股張數","W",param:=400);
			value3 = Getfield("散戶持股人數","W",param:=400);
		end else begin
			value1 = Getfield("散戶持股比例",param:=400);
			value2 = Getfield("散戶持股張數",param:=400);
			value3 = Getfield("散戶持股人數",param:=400);
		end;
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
	
	case 600:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=600);
			value2 = Getfield("散戶持股張數","W",param:=600);
			value3 = Getfield("散戶持股人數","W",param:=600);
		end else begin
			value1 = Getfield("散戶持股比例",param:=600);
			value2 = Getfield("散戶持股張數",param:=600);
			value3 = Getfield("散戶持股人數",param:=600);
		end;
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
		
	case 800:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=800);
			value2 = Getfield("散戶持股張數","W",param:=800);
			value3 = Getfield("散戶持股人數","W",param:=800);
		end else begin
			value1 = Getfield("散戶持股比例",param:=800);
			value2 = Getfield("散戶持股張數",param:=800);
			value3 = Getfield("散戶持股人數",param:=800);
		end;
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);
	
	default:
		if barFreq = "D" then begin
			value1 = Getfield("散戶持股比例","W",param:=1000);
			value2 = Getfield("散戶持股張數","W",param:=1000);
			value3 = Getfield("散戶持股人數","W",param:=1000);
		end else begin
			value1 = Getfield("散戶持股比例",param:=1000);
			value2 = Getfield("散戶持股張數",param:=1000);
			value3 = Getfield("散戶持股人數",param:=1000);
		end;
		plot1(0.01*value1,"散戶持股比例",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
		plot2(value2,"持股張數",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);
		plot3(value3,"持股人數",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);

end;