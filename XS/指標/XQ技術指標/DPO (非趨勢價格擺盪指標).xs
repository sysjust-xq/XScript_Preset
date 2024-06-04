{@type:indicator|@guid:5c61b5cf07134ff78d28e2eca413c4f8|@path:/XQ技術指標/DPO (非趨勢價格擺盪指標)|@hash:c7a8dda5c415962409bf25a6c0c2a32d}
// XQ: DPO指標
//
input: Length(10);
variable: dpo(0);

SetInputName(1, "天數");

dpo = Close - Average(Close, Length)[(Length /2) + 1];

Plot1(dpo, "DPO"); 
        
		