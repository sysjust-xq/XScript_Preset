{@type:function}
SetBarMode(1);

input:refPrice(numericsimple);
variable:obup1(0),obdw1(0),STOCKUP(0),STOCKDW(0);

if date < 20150601 then begin
	obup1= refPrice*1.07;
	obdw1= refPrice*0.93;
end else begin
	obup1= refPrice*1.1;
	obdw1= refPrice*0.9;
end;

if (obup1<10 and obdw1<10) then begin
	STOCKUP = ((floor((floor(obup1*100)*100)))/100)/100;
	STOCKDW = ((floor((ceiling(obdw1*100)*100)))/100)/100;
end else if (obup1>=10 and obdw1<10) then begin
	STOCKUP = ((floor(((floor(obup1/0.05)*0.05)*100)*100))/100)/100;
	STOCKDW = ((floor((ceiling(obdw1*100)*100)))/100)/100;
end else if (obup1>=10 and obdw1>=10 and obup1<50 and obdw1<50) then begin
	STOCKUP = ((floor(((floor(obup1/0.05)*0.05)*100)*100))/100)/100;
	STOCKDW = ((floor(((ceiling(obdw1/0.05)*0.05)*100)*100))/100)/100;
end else if (obup1>=50 and obdw1<50 ) then begin
	STOCKUP = ((floor(((floor(obup1/0.1)*0.1)*100)*100))/100)/100;
	STOCKDW = (ceiling(obdw1/0.05)*0.05);
end else if (obup1>=50 and obdw1>=50 and obup1<100 and obdw1<100) then begin
	STOCKUP = ((floor(((floor(obup1/0.1)*0.1)*100)*100))/100)/100;
	STOCKDW = ((floor(((ceiling(obdw1/0.1)*0.1)*100)*100))/100)/100;
end else if (obup1>=100 and obdw1<100 ) then begin
	STOCKUP = ((floor(((floor(obup1/0.5)*0.5)*100)*100))/100)/100;
	STOCKDW = ((floor(((ceiling(obdw1/0.1)*0.1)*100)*100))/100)/100;
end else if (obup1>=100 and obdw1>=100 and obup1<500 and obdw1<500) then begin
	STOCKUP = ((floor(((floor(obup1/0.5)*0.5)*100)*100))/100)/100;
	STOCKDW = ((floor(((ceiling(obdw1/0.5)*0.5)*100)*100))/100)/100;
end else if (obup1>=500 and obdw1<500) then begin
	STOCKUP = ((floor(((floor(obup1/0.5)*0.5)*100)*100))/100)/100;
	STOCKDW = ((floor(((ceiling(obdw1/0.1)*0.1)*100)*100))/100)/100;
end else if (obup1>=500 and obdw1>=500 and obup1<1000 and obdw1<1000) then begin
	STOCKUP = ((floor(((floor(obup1/ 1)* 1)*100)*100))/100)/100;
	STOCKDW = ((floor(((ceiling(obdw1/ 1)* 1)*100)*100))/100)/100;
end else if (obup1>=1000 and obdw1<1000) then begin
	STOCKUP = ((floor(((floor(obup1/5)*5)*100)*100))/100)/100;
	STOCKDW = ((floor(((ceiling(obdw1/ 1)* 1)*100)*100))/100)/100;
end else if (obup1>=1000 and obdw1>=1000) then begin
	STOCKUP = ((floor(((floor(obup1/5)*5)*100)*100))/100)/100;
	STOCKDW = ((floor(((ceiling(obdw1/5)*5)*100)*100))/100)/100;
end;

UpLimit = STOCKUP;