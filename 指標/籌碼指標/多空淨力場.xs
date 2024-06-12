{@type:indicator}
{
指標說明
https://xstrader.net/自訂指標step-by-step/
}

input:sd(5,"短天期");
input:ld(20,"長天期");

variable:H1(0),L1(0),C1(0),NF(0),SNF(0),LNF(0),dd(0);

H1=HIGH-HIGH[1];
L1=LOW-LOW[1];
C1=CLOSE-CLOSE[1];

if truerange<>0 then begin
	NF=(H1+L1)/truerange;
	SNF=average(NF,sd);
	LNF=average(NF,ld);
	dd=SNF-LNF;
end;

plot1(dd,"多空淨力");
