{@type:indicator|@guid:f304be515b06481ead0b9366a6fed276|@path:/主圖指標/EMA|@hash:5e082946a5560dc446ac7b205cd41d25}
Input: Period1(50); SetInputName(1, "EMA1");
Input: Period2(120); SetInputName(2, "EMA2");
Input: Period3(240); setinputname(3, "EMA3");

Plot1(EMA(Close, Period1), "EMA1");
Plot2(EMA(Close, Period2), "EMA2");
Plot3(EMA(Close, Period3), "EMA3");