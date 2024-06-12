{@type:indicator}
// XQ: MFI指標
//
Input: Length(6);
variable: tp(0), tv(0), utv(0), dtv(0), pmf(0), nmf(0), mfivalue(0);

SetInputName(1, "天數");

tp = TypicalPrice;
tv = tp * Volume;

if tp > tp[1] then
  begin
	utv = tv;
	dtv = 0;
  end
else
  begin
	utv = 0;
	dtv = tv;
  end;

pmf = Average(utv, MinList(CurrentBar, length));
nmf = Average(dtv, MinList(CurrentBar, length));


if CurrentBar < Length or (pmf + nmf) = 0 then
	mfivalue = 50
else 
	mfivalue = 100 * pmf /(pmf + nmf);

Plot1(mfivalue, "MFI");

		