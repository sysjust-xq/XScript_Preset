{@type:sensor|@guid:dc89818b330344e98885838b12b0cd5b|@path:/盤中常用/預估量破均量}
value1=GetField("內盤量", "D");//當日內盤量
value2=GetField("外盤量", "D");//當日外盤量
if GetField("估計量") > average(volume[1],10)*1.3
and value2>value1
then ret=1;