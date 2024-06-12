{@type:indicator}
{
    PlotLine(PlotIndex, x1, y1, x2, y2, add:=0);
	    PlotIndex為 1 ~ 999，作用如同 Plot 的序列編號
		x1 為起點的 Bar Number (可用 CurrentBar 確認)
		y1 為起點的 Y 軸數值 (ex. 價格)
		x2 為終點的 Bar Number
		add 為非必要參數，預設為 0，執行後會先清除之前的趨勢線，若不希望清除的話則可以設為 1。
		
	樂活五線譜是由「股息現金流被動收入理財的心路歷程」已故的版主 Allan Lin（艾倫）醫師改良曾淵滄博士的曾氏通道，
	以原始價格取代對數值，同樣以 5 條平衡線作參考，分別為極度樂觀線（95% 樂觀線），過度樂觀線（75% 樂觀線），
	中線（長期走勢線），過度悲觀線（75% 悲觀線）和極度悲觀線（95% 悲觀線）。
	
	樂活五線譜的形成，是以統計學的方法來計算一段時間（預設為 3.5 年）的平均價格，並畫出一條股價趨勢線，
	然從趨勢線的上方和下方各加上一個標準差以及兩個標準差而形成的五條線。
	
	在這個腳本範例內，使用者可以指定統計天期（從最新一期往回統計N筆K線資料)，之後會畫出從統計起點到最新一根K線
	所算出來的5條樂活通道線，分別是：
	
	TL = 從統計起點到最新一根K線的線性回歸線(以每根K棒的Close價格統計)
    SDP1 = 往上一個標準差 
	SDP2 = 往上兩個標準差
    SDM1 = 往下一個標準差
	SDM2 = 往下兩個標準差 
}
 
input: length(100, "天期");
 
var: lr_slope(0), lr_deg(0), lr_intercept(0), lr_forecast(0);
var: idx(0), std(0), diff_avg(0), last_y(0);
array: diff_array[](0);
 
if CurrentBar = GetTotalBar() and CurrentBar >= length then begin
    LinearReg(Close, length, length, lr_slope, lr_deg, lr_intercept, lr_forecast);
 
	// 統計每個收盤價到回歸線的距離並計算平均值
	//
    Array_SetMaxIndex(diff_array, length);
	diff_avg = 0;
    for idx = 1 to length begin
        diff_array[idx] = Close[length - idx] - (lr_intercept + lr_slope * idx);
		diff_avg = diff_avg + diff_array[idx];
    end;
	diff_avg = diff_avg / length;

	// 計算回歸線與收盤價差距的標準差
	//
	Value1 = 1;
    for idx = 1 to length begin
		Value1 += power((diff_array[idx] - diff_avg), 2);	
	end;	
	std = SquareRoot(Value1 / length);
   
    // 每次價格更新時會重畫, 產生新的bar時也會重畫
    //
	last_y = Close - diff_array[length];
	
    PlotLine(1, 
       CurrentBar-length, lr_forecast, 
       CurrentBar, last_y, "TL");
    PlotLine(2,
       CurrentBar-length, lr_forecast+std, 
       CurrentBar, last_y+std, "SDP1");
    PlotLine(3,
       CurrentBar-length, lr_forecast+2*std, 
       CurrentBar, last_y+2*std, "SDP2");
    PlotLine(4,
       CurrentBar-length, lr_forecast-std, 
       CurrentBar, last_y-std, "SDM1");
    PlotLine(5,
       CurrentBar-length, lr_forecast-2*std, 
       CurrentBar, last_y-2*std, "SDM2");
 
end;
