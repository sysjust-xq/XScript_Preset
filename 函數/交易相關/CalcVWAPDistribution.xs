{@type:function}
{
	計算過去N日的VWAP分佈
	
	請傳入
	
	- 計算天數
	- 開始時間, 例如091000
	- 結束時間, 例如095900 (請注意請以1分K的Time為基準)
	- 一個array, 用來儲存上述指定區間內每分鐘的累積成交量分佈%, 
	  - CalcVWAPDistribution會自動設定array的大小,
	  - array[1]是從開始時間後第1分鐘的累計成交量%, array[2]是從開始時間到後第2分鐘的累計成交量%, etc.
	  - 請注意這是一個累積的數值, 例如array[1] = 2.5, array[2] = 5.4, array[3] = 7.0, ... array[最後一個]=100.0,	  
}

input: totaldays(numericsimple, "計算天數");
input: start_hhmmss(numericsimple, "開始時間, 例如091000");
input: end_hhmmss(numericsimple, "結束時間, 例如095900");
input: dist_array[X](numericarrayref, "回傳成交量分佈%");

var: total_minutes(0);
array: day_dist[](0);		{ 儲存每一日的成交量分佈% }

{ 請注意: 不支援跨日的計算 }

if start_hhmmss >= end_hhmmss then raiseruntimeerror("開始時間必須小於結束時間");

total_minutes = TimeDiff(end_hhmmss, start_hhmmss, "M") + 1;	{ 頭尾都算 }

Array_SetMaxIndex(day_dist, total_minutes);
Array_SetMaxIndex(dist_array, total_minutes);

var: lastdate(0);
lastdate = GetFieldDate("Date", "1");	// 目前1分鐘K棒的TDate

var: idx(0), days(0);
var: idx_daystart(0), idx_dayend(0);

Array_SetValRange(dist_array, 0, total_minutes, 0);

{ 先找到昨日的最後一筆, 從這裡開始統計N日的資料 }
idx = 1;
while GetFieldDate("Date", "1")[idx] = lastdate begin
	idx = idx + 1;
end;

days = 0;
while days < totaldays begin
	lastdate = GetFieldDate("Date", "1")[idx];	
	idx_daystart = -1; 
	idx_dayend = -1;
	while GetFieldDate("Date", "1")[idx] = lastdate begin
		if GetField("Time", "1")[idx] = end_hhmmss then idx_dayend = idx;
		if GetField("Time", "1")[idx] = start_hhmmss then idx_daystart = idx;	
		idx = idx + 1;
	end;
	if idx_daystart = -1 or idx_dayend = -1 then raiseruntimeerror("Internal error");

	{print(
		"days=", numtostr(days, 0), 
		"date=", formatdate("yyyy/MM/dd", lastdate), 
		"idx_daystart=", numtostr(idx_daystart, 0), 
		"idx_dayend=", numtostr(idx_dayend, 0),
		""
	);}

	{ 收集從idx_start到idx_end之間的成交量分佈 }
	
	var: totalvolume(0), jdx(0);
	
	totalvolume = 0;
	day_dist[0] = 0;
	for jdx = idx_daystart downto idx_dayend begin
		{ 每一筆 = 前一筆的累積 + 這一分K的成交量 }
		day_dist[idx_daystart - jdx + 1] = GetField("Volume", "1")[jdx] + day_dist[idx_daystart - jdx];

		{print(
			"Index=", numtostr(idx_daystart - jdx + 1, 0),
			"day_dist[]=", numtostr(day_dist[idx_daystart - jdx + 1], 0),
			"Date=", FormatDate("yyyy/MM/dd", GetField("Date", "1")[jdx]),
			"Time=", FormatTime("HH:mm", GetField("Time", "1")[jdx]),
			"Vol=", numtostr(GetField("Volume", "1")[jdx], 0),
			""
		);}
		
	end;	
		
	for jdx = idx_daystart downto idx_dayend begin
		{ 換算成累積到目前為止的成交量% }
		day_dist[idx_daystart - jdx + 1] = day_dist[idx_daystart - jdx + 1] * 100 / day_dist[idx_daystart - idx_dayend + 1];
		
		{ 累積到 dist_array }
		dist_array[idx_daystart - jdx + 1] = dist_array[idx_daystart - jdx + 1] + day_dist[idx_daystart - jdx + 1];
		
		{print(
			"Index=", numtostr(idx_daystart - jdx + 1, 0),
			"day_dist[]=", numtostr(day_dist[idx_daystart - jdx + 1], 2),
			"dist_array[]=", numtostr(dist_array[idx_daystart - jdx + 1], 2),
			""
		);}
	end;
	
	days = days + 1;
end;	

{ 回傳dist_array = 近N日的平均值 }
for jdx = 1 to total_minutes begin
	dist_array[jdx] = dist_array[jdx] / totaldays;
end;
	
