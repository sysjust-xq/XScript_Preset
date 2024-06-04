{@type:indicator|@guid:83709681df144ae4803b4fbc2bb3bf0c|@path:/大盤指標/ALF亞歷山大過濾指標|@hash:3f33b14f5f64cbc4f7724e438c488cae}
input: length(10);		setinputname(1, "天期");

Value1 = close / close[length-1];
plot1(Value1, "亞歷山大過濾指標");

