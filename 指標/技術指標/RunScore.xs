{@type:indicator}
{
指標說明
https://xstrader.net/Runscore指標/
}

input:QDate(20140630,"起算日");
//先設定一個季結束的日子
variable:RunScore(0),vs(0),i(0);

if date > QDate then begin
	if C>C[1] then RunScore += 1;//收漲加1分
	if H>H[1] then RunScore += 1;//漲過昨高加1分
	if C>H[1] then RunScore += 1;//收過昨高加1分
	if C<C[1] then RunScore -= 1;//收跌扣1分
	if L<L[1] then RunScore -= 1;//破昨低扣1分
	if C<L[1] then RunScore -= 1;//收破昨低扣1分
	vs += v; 
	i += 1;
end;

plot1( RunScore,"漲跌分數");