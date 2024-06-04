{@type:sensor|@guid:08ae0a84339942a5b21357b33d48d407|@path:/當沖交易型/當日累計量突破|@hash:d3a955346b03401851bc3f765b274c06}
input:VolumeThre(1000); setinputname(1,"突破量門檻");
input:AmountThre(1000); setinputname(2,"突破成交值金額門檻(萬)");
settotalbar(3);
if GetField("Volume", "D") > VolumeThre or GetField("均價")*GetField("Volume", "D")/10 > AmountThre then ret=1;
