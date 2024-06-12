{@type:indicator}
{
    PlotLine(PlotIndex, x1, y1, x2, y2, add:=0);
	    PlotIndex為 1 ~ 999，作用如同 Plot 的序列編號
		x1 為起點的 Bar Number (可用 CurrentBar 確認)
		y1 為起點的 Y 軸數值 (ex. 價格)
		x2 為終點的 Bar Number
		add 為非必要參數，預設為 0，執行後會先清除之前的趨勢線，若不希望清除的話則可以設為 1。
		
    CDP指標
 
    CDP＝(H[1] + L[1] + 2C[1])/4
    AH = CDP + (H[1]-L[1])
	NH = 2*CDP - L[1]
	NL = 2*CDP - H[1]
    AL = CDP - (H[1]-L[1])
 
	只支援分鐘線
}

input: plotLen(1, "繪圖區間", inputkind:= Dict(["每日", 1], ["當日", 2]));

if BarFreq <> "Min" then RaiseRunTimeError("請跑分鐘頻率");
 
var: HH(0), LL(0), CC(0);
var: CDP(0), AH(0), NH(0), NL(0), AL(0);
 
var: bar_count(0);
var: x1_bar(0);
 
//換日時計算當日的CDP數值
if GetFieldDate("Date") <> GetFieldDate("Date")[1] then begin

    bar_count = 0;
    x1_bar = CurrentBar;
 
    HH = GetField("High", "D")[1];
    LL = GetField("Low", "D")[1];
    CC = GetField("Close", "D")[1];

    CDP = (HH + LL + 2*CC) / 4;
    AH = CDP + HH - LL;
	NH = 2*CDP - LL;
	NL = 2*CDP - HH;
    AL = CDP - (HH - LL);
end;

if plotLen = 1 then begin
	if x1_bar <> 0 then begin
		PlotLine(1, x1_bar, CDP, CurrentBar, CDP, "CDP", add:=1);
		PlotLine(2, x1_bar, NH, CurrentBar, NH, "NH", add:=1);
		PlotLine(3, x1_bar, NL, CurrentBar, NL, "NL", add:=1);
		PlotLine(4, x1_bar, AH, CurrentBar, AH, "AH", add:=1);
		PlotLine(5, x1_bar, AL, CurrentBar, AL, "AL", add:=1);
	    end;
	end
else if plotLen = 2 then begin
	if islastBar then begin
		PlotLine(1, x1_bar, CDP, CurrentBar, CDP, "CDP");
		PlotLine(2, x1_bar, NH, CurrentBar, NH, "NH");
		PlotLine(3, x1_bar, NL, CurrentBar, NL, "NL");
		PlotLine(4, x1_bar, AH, CurrentBar, AH, "AH");
		PlotLine(5, x1_bar, AL, CurrentBar, AL, "AL");
	    end;
	end;