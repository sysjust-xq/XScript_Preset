{@type:sensor}
input: ForceType(1); setinputname(1,"法人：0=合計 1=外資 2=投信 3=自營商");
input: Periods(20); setinputname(2,"計算期間");
input: Percent(5); setinputname(3,"持股減少幅度%");
input: Type(1); setinputname(4,"使用資料：0=今日、1=昨日");
input: TXT("僅適用日線逐筆洗價"); setinputname(5,"盤中使用限制");
input: TXT2("盤中無當日即時法人買賣資料"); setinputname(6,"建議使用單次洗價模式");
variable: ForcePush(0);

settotalbar(Periods + 3);

if BarFreq <> "D" or absvalue(Type) > 1 then return;

    Switch ( ForceType ) 
    Begin 
        Case 1: 
            ForcePush = Getfield("外資持股")[Type];
        Case 2: 
            ForcePush = Getfield("投信持股")[Type]; 
        Case 3: 
            ForcePush = Getfield("自營商持股")[Type]; 
        default: 
            ForcePush = Getfield("外資持股")[Type]+Getfield("投信持股")[Type]+Getfield("自營商持股")[Type];
    End; 

if currentbar <= Periods then return;

if Close < Close[1] and
   ForcePush[Type] < ForcePush[Periods+Type] * (1 - Percent * 0.01) 
then 
   ret = 1;

