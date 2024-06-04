{@type:indicator|@guid:0be19fb25ccd46df831edaf221c0b019|@path:/市場動能/台灣50大戶買賣力|@hash:5f5911363b2b45b9b5622ba9bade7948}
{統計台灣50成分股, 當分鐘大戶買賣力金額。
大戶買賣力為，買進(大單+特大單)-賣出(大單+特大單)}

value1 = GetSymbolField("TSE50.SJ","TW50大戶買賣力");

plot1(value1,"台灣50大戶買賣力（元）");