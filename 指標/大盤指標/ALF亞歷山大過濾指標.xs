{@type:indicator}
input: length(10);		setinputname(1, "天期");

Value1 = close / close[length-1];
plot1(Value1, "亞歷山大過濾指標");

