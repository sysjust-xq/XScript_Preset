{@type:indicator}
input:length(10,"si的累計長度");

variable:si(0),asi(0);

value1=high-low;
value2=low-close[1];
value3=high-low[1];
value4=close[1]-open[1];

value5=absvalue(close-close[1]);
value6=absvalue(close-open);
value7=absvalue(close[1]-open[1]);

value8=(value5+0.5*value6+value7);

switch(maxlist(value1,value2,value3)) begin
	case value1:
		value9=value1+0.5*value2+0.25*value4;
	case value2:
		value9=value2+0.5*value1+0.25*value4;
	case value3:
		value9=value3+0.25*value4;
end;

value10=maxlist(value1,value2);
if value9*value10<>0 then 
	si=50*value8/value9*value10/3
else 
	si=si[1];
asi+=si;

plot1(asi,"ASI");