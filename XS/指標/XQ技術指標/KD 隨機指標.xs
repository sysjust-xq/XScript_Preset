{@type:indicator|@guid:637460b1727543c784c6c07870453729|@path:/XQ技術指標/KD 隨機指標|@hash:2f5ac352204e551ce9eb45eb04972dea}
// XQ: KD指標
//
input: Length(9), RSVt(3), Kt(3);
variable: rsv(0), k(0), _d(0);

SetInputName(1, "天數");
SetInputName(2, "RSVt權數");
SetInputName(3, "Kt權數");

Stochastic(Length, RSVt, Kt, rsv, k, _d);

Plot1(k, "K(%)");
Plot2(_d, "D(%)");

	
	
		