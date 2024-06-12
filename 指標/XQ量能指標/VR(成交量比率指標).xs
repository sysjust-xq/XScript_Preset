{@type:indicator}
// XQ: VR指標
//
input: Length(26);
variable: _index(0), qu(0), qd(0), qf(0), _vr(0);

SetInputName(1, "天數");

qf = 0;
qu = 0;
qd = 0;
for _index = 1 to length
  begin
	if close[(_index - 1)] > close[_index] then
		qu = qu + Volume[(_index - 1)]
	else
	  begin
		if close[(_index - 1)] < close[_index] then
			qd = qd + Volume[(_index - 1)]
		else { close[(_index - 1)] = close[_index] }
			qf = qf + Volume[(_index - 1)];
	  end;
  end;

if (qd + qf/2) <> 0 then
  _vr = 100 * (qu + qf/2) /(qd + qf/2)
else
  _vr = 1000;

Plot1(_vr, "VR");
		