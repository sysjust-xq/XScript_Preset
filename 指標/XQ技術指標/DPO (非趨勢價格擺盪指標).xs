{@type:indicator}
// XQ: DPO指標
//
input: Length(10);
variable: dpo(0);

SetInputName(1, "天數");

dpo = Close - Average(Close, Length)[(Length /2) + 1];

Plot1(dpo, "DPO"); 
        
		