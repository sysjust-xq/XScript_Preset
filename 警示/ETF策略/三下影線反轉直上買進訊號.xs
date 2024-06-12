{@type:sensor}
input: Percent(0.5,"下影線佔股價絕對百分比");

variable:Kprice(0),OCDate(0);

condition1 = (minlist(open,close)-Low) > absvalue(open-close)*2; 
condition2 =  minlist(open, close)  > low* (100 + Percent)/100;

if trueall( condition1 and condition2, 3) then begin
	OCDate = Date;
	Kprice = average(H,3);
end;

if DateDiff(Date,OCDate) <3 and Close crosses over Kprice then ret = 1;

