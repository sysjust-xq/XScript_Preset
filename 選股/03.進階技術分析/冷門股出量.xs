{@type:filter}
input:limit1(700);		setinputname(1,"均量上限");
input:limit2(1000);		setinputname(2,"突破量");

SetTotalBar(3);

value1 = average(volume,5);
 
if value1 < limit1 and volume > limit2 and High > close[1] and volume > volume[1]
then ret=1;
