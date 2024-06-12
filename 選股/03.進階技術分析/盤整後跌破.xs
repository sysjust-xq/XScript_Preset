{@type:filter}
input:length(20); 	setinputname(1, "計算期間");
input:percent(7); 	setinputname(2, "設定盤整區間%");

SetTotalBar(3);

value1 = highest(high[1],length);
value2 = lowest(low[1],length);

if 
	close crosses under value2 and 
	value1 < value2 *( 1 + percent * 0.01) //最近幾根bar的收盤價高點與低點差不到N%
then ret=1;
