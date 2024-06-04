{@type:sensor|@guid:8e772499c37041b3b262a0c7dc0fbc6c|@path:/ETF策略/三下影線反轉直上買進訊號}
input: Percent(0.5,"下影線佔股價絕對百分比");

variable:Kprice(0),OCDate(0);

condition1 = (minlist(open,close)-Low) > absvalue(open-close)*2; 
condition2 =  minlist(open, close)  > low* (100 + Percent)/100;

if trueall( condition1 and condition2, 3) then begin
	OCDate = Date;
	Kprice = average(H,3);
end;

if DateDiff(Date,OCDate) <3 and Close crosses over Kprice then ret = 1;

