{@type:filter}
input: Length(5), VolFactor(2);

SetInputName(1, "均量區間");
SetInputName(2, "放大倍數");

settotalbar(3);

Ret = Volume > Average(Volume[1], Length) * VolFactor;
