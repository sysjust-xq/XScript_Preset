{@type:function}
SetBarMode(2);

input:Length(numericsimple);
setinputname(1,"天數");
variable:UPV(0),DNV(0),NCV(0);
{
VR容量比率	
	UPV=N日內上漲天數的成交量總合
	DNV=N日內下跌天數的成交量總合
	NCV=N日內持平天數的成交量總合
}

UPV = SummationIf((C > C[1]), volume, Length);  
DNV = SummationIf((C < C[1]), volume, Length);  
NCV = SummationIf((C = C[1]), volume, Length);  

VR = iff(DNV + NCV/2=0,VR[1],100 * (UPV + NCV/2)/(DNV + NCV/2));
