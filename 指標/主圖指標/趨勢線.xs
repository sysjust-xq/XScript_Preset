{@type:indicator}
input: periods(30, "期間");
input: startyear(2017, "起始年份");

variable: maxh_bar(0), idx(0), line_a(0), line_b(0), x_bar(0), idx2(0), temp_y(0), base_bar(0);

// 起始年之前的資料不計算
if year(date) < startyear then return;

// 如果已經有趨勢線的話, 檢查是否突破
if base_bar > 0 then begin
	temp_y = line_a * (currentbar - base_bar) + line_b;
	if high > temp_y then 
		plot1(high) 
	else 
		noplot(1);	
end;

// 計算過去N期的趨勢線
maxh_bar = nthhighestbar(1, high, periods);

base_bar = 0;	// 用來追蹤最近一個趨勢線的x=0的位置
idx = maxh_bar-1;
while idx >= 0 begin
	// 畫一條曲線從maxh_bar to idx, 假設maxh_bar的位置x=0
	//
	// x0 = 0, y0 = high[maxh_bar] == b
	// x1 = maxh_bar - idx, y1 = high[idx]
	//
	line_b = high[maxh_bar];
	line_a = (high[idx] - line_b) / (maxh_bar - idx);
	x_bar = idx;

	// 檢查是否所有的點都落在這條切線底下
	//
	condition1 = false;
	for idx2 = maxh_bar - 1 downto 0 begin
		// x = maxh_bar - idx2
		//
		temp_y = line_a * (maxh_bar - idx2) + line_b;
		if high[idx2] > temp_y then begin
			condition1 = true;
			break;
		end;
	end;
	if not condition1 then begin
		base_bar = currentbar - maxh_bar;
		break; 
	end;
    idx = idx - 1;	
end;




