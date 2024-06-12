{@type:indicator}
{
    PlotLine(PlotIndex, x1, y1, x2, y2, add:=0);
	    PlotIndex為 1 ~ 999，作用如同 Plot 的序列編號
		x1 為起點的 Bar Number (可用 CurrentBar 確認)
		y1 為起點的 Y 軸數值 (ex. 價格)
		x2 為終點的 Bar Number
		add 為非必要參數，預設為 0，執行後會先清除之前的趨勢線，若不希望清除的話則可以設為 1。
		
	繪製zigzag指標
	
	指標參數:
	
	zz_deviation: 單位是%, 代表每一個波段的滿足幅度, 也就是當某個低點到某個高點的價差%大於這個數值時, 這個就視為一個完整的上漲/下跌波段
	zz_depth: 多少根bar. 這個數值代表指標區間的高點/低點必須比他的左邊/右邊各zz_depth根bar都來的大/小, 才可以視為一個區間高點/低點
	
	一個ZigZag指標, 就是連結區間高點/低點的波段, 且每一個波段的價差必須滿足指定的價差%
	
}
input: zz_deviation(10, "每個波段的滿足幅度(%)");
input: zz_depth(5, "判斷頂點的左右bar間隔");


// 底下pv_開頭的這幾個變數, 用來紀錄已經找到的波段
//
var: pv_count(0);         	// 目前總共找倒了幾個波段(pivot), 0表示還沒有找到
var: pv_start_index(0);   	// pivot的起點位置, 1-based的barIndex
var: pv_start_price(0);    	// pivot的起點價格
var: pv_end_index(0);     	// pivot的終點位置, 1-based的barIndex
var: pv_end_price(0);      	// pivot的終點價格  
var: pv_is_high(false);    	// pivot的方向, true=上升, false=下降

array: maxmin[2](0);		// 紀錄每根bar所找到的區間高點/低點的bar的位置, maxmin[1]是高點, maxmin[2]是低點

var: pivot_updated(false);	// 這次洗價是否異動了pivot (pv_...)

pivot_updated = false;

// 找最近一個區間高點/區間低點
//
maxmin[1] = SwingHighBar(High, zz_depth + 1, zz_depth, zz_depth, 1);
maxmin[2] = SwingLowBar(Low, zz_depth + 1, zz_depth, zz_depth, 1);

var: _i(0);

var: p_index(0);
var: p_price(0);
var: is_high(false);
var: dev(0);

// 當遇到一個新的區間高點/低點時, 判斷這個點跟目前的波段(pivot)的關係, 更新pivot, 或是產生新的pivot
//
for _i = 1 to 2 begin
	if maxmin[_i] >= 0 then begin
		if _i = 1 then is_high = true else is_high = false;
		
		if is_high then 
			p_price = High[maxmin[_i]]
		else
			p_price = Low[maxmin[_i]];
			
		p_index = CurrentBar - maxmin[_i];    // 轉換成1-based的barIndex

		// Print("(FindPoint)", NumToStr(Date[maxmin[_i]], 0), NumToStr(p_price, 2), is_high);

		if pv_count = 0 then begin
			// 目前還沒有pivot: 先產生一個只有一個點的pivot, 這是第一個pivot
			//
			pv_count = 1;
			pv_start_index = p_index;
			pv_start_price = p_price;
			pv_end_index = p_index;
			pv_end_price = p_price;
			pv_is_high = is_high;

			pivot_updated = true;
			
		end	else begin		
			if pv_is_high = is_high then begin
				// 如果同方向, 而且新的點的價格比上一個pivot的價格更高/更低, 就更新pivot(延伸pivot的長度)
				//
				if (is_high and p_price > pv_end_price) or (not is_high and p_price < pv_end_price) then begin

					if pv_count = 1 then begin
						// 如果是第一個pivot, 而且還只有一個點, 則讓start/end都挪到新的那個點
						//
						pv_start_index = p_index;
						pv_start_price = p_price;
					end;

					pv_end_index = p_index;
					pv_end_price = p_price;

					pivot_updated = true;
				end;
				
			end else begin
				// 如果反方向, 而且新的點產生了價格的轉折, 則產生一個新的pivot(波段)
				//
				dev = 100 * (p_price - pv_end_price) / pv_end_price;
				if (not pv_is_high and dev >= zz_deviation) or (pv_is_high and dev <= -1 * zz_deviation) then begin
					// 產生新的pivot
					//
					pv_count = pv_count + 1;
					pv_start_index = pv_end_index;
					pv_start_price = pv_end_price;
					pv_end_index = p_index;
					pv_end_price = p_price;
					pv_is_high = is_high;

					pivot_updated = true;
				end;
			end;       
			
			if pivot_updated then begin
				//Print(
				//	Text("PLOT(", NumToStr(pv_count, 0), ")"),
				//	"from",	NumToStr(Date[CurrentBar - pv_start_index], 0), NumToStr(pv_start_price, 2),
				//	"to", NumToStr(Date[CurrentBar - pv_end_index], 0), NumToStr(pv_end_price, 2),
				//	pv_is_high
				//);

				// 畫出最新一段pivot
				//
				if pv_start_index <> pv_end_index then
					PlotLine(1, pv_start_index, pv_start_price, pv_end_index, pv_end_price, "ZigZag", add:=1);
				
				// 只要有更新pivot, 就不再處理另一個方向的區間高點/低點
				//
				break;
			end;
		end;
	end;
end;
