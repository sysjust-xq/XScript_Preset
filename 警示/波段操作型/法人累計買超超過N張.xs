{@type:sensor}
input: ForceType(1); setinputname(1,"法人：0=合計 1=外資 2=投信 3=自營商");
input: Periods(20); setinputname(2,"計算期間");
input: Size(3000); setinputname(3,"累計買超張數");
input: Type(1); setinputname(4,"使用資料：0=今日 1=昨日");
input: TXT1("僅適用日線"); setinputname(5,"使用限制");
input: TXT2("盤中無當日法人資料"); setinputname(6,"建議使用單次洗價模式");

settotalbar(Periods + 3);

if barfreq <> "D" then return;

variable: ForcePush(0);

if Type = 0 then value1 = 0 else value1 = 1;

Switch ( ForceType ) 
Begin 
Case 1: 
ForcePush = Getfield("外資持股")[value1];
Case 2: 
ForcePush = Getfield("投信持股")[value1]; 
Case 3: 
ForcePush = Getfield("自營商持股")[value1]; 
default: 
ForcePush = Getfield("外資持股")[value1]+Getfield("投信持股")[value1]+Getfield("自營商持股")[value1];
End; 

if currentbar <= Periods then return;

if ForcePush[value1] - ForcePush[Periods+value1] >= Size then ret=1;
