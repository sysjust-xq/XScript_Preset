{@type:filter|@guid:460545d1795d4236a33b8a3e6abe5f51|@path:/06.籌碼選股/券增價漲|@hash:edfc44daca064d382e3ea8236dec8792}
input: Length(10); setinputname(1,"近期天數");
input: UpRatio(3.5); setinputname(2, "上漲幅度(%)");

settotalbar(3);

if RateOfChange(Close, 1) >= UpRatio and
	Getfield("融券餘額張數") > 0 and
	Getfield("融券餘額張數") = highest(Getfield("融券餘額張數"), Length)  
then ret=1;

SetOutputName1("融券餘額張數");
OutputField1(Getfield("融券餘額張數"));
