{@type:sensor}
input:Length(3); setinputname(1,"拉尾盤日數");
input:Ratio(1); setinputname(2,"拉尾盤幅度%");
input:closetime(132500); setinputname(3,"尾盤前時間");
input:ratiotoLow(7); setinputname(4,"低檔起算漲幅%");//距離區間最低價多少%
input:daystoLow(5); setinputname(5,"距離最低價天數");//輸入區間最低價的區間是幾天
input:TXT1("最高算5天"); setinputname(6,"拉尾盤日數使用限制");
input:TXT2("限用5分鐘"); setinputname(7,"頻率限制");

settotalbar(3);
setbarback(300);

if barfreq <> "Min" or barinterval <> 5  or Length>5 or daystoLow >5 then return;

variable:i(0);
variable:TodayBars(270/barinterval);

if close >= lowest(close,daystoLow * TodayBars) *( 1 + ratiotoLow*0.01) then return;

if time >= closetime then 
begin
  for i = 0 to Length-1
  begin
	// 判斷是否拉尾盤
    if close[TodayBars*i] <= close[TodayBars*i+1] * (1+ Ratio/100) then return;
  end;
  ret=1;
end;