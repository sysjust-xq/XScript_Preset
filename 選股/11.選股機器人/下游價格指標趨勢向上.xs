{@type:filter}
input: Period(20, "天期"); 
Condition1 = rateofchange(GetField("下游股價指標"), period) >= Period; 
Condition2 = GetField("下游股價指標") > GetField("下游股價指標")[Period/2]; 
Condition3 = GetField("下游股價指標") > average(GetField("下游股價指標"), period); 
ret = condition1 and condition2 and condition3; 

outputfield(1,rateofchange(GetField("下游股價指標","D"),Period),2,"下游漲幅%", order := 1);
