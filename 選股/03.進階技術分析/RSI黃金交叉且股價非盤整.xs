{@type:filter}
input:n1(6); 	setinputname(1,"RSI短期天數");
input:n2(12);	setinputname(2,"RSI長期天數");
input:n3(4);	setinputname(3,"盤整期間創新高次數");


settotalbar(maxlist(n1,n2,6) * 9);

value2 = highdays(n2);

if rsi(close,n1) crosses over rsi(close,n2) and
   rsi(close,n1) < 50 and
   value2 >= n3
then ret=1;

