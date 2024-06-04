{@type:sensor|@guid:ac05101279694f74999c88dc0a8af766|@path:/3.出場常用警示/MTM轉負|@hash:abd077e855e47eed23961c5ad30e905c}
input: Length(10); SetInputName(1, "期數");

settotalbar(maxlist(Length,6) + 8);

if momentum(close,Length) crosses under 0 then ret=1;
