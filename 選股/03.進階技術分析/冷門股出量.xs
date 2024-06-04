{@type:filter|@guid:a9b4ad864d8840a48dd389a137f9ebae|@path:/03.進階技術分析/冷門股出量}
input:limit1(700);		setinputname(1,"均量上限");
input:limit2(1000);		setinputname(2,"突破量");

SetTotalBar(3);

value1 = average(volume,5);
 
if value1 < limit1 and volume > limit2 and High > close[1] and volume > volume[1]
then ret=1;
