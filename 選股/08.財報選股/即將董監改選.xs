{@type:filter}
input: day(180);		setinputname(1, "距離董監改選日期(天)");

settotalbar(3);

// 董監每三年得改選一次
//
variable: lastdate(0), diff(0), years_3(0);

lastdate = GetField("董監事就任日期");
diff = datediff(currentdate, lastdate);
years_3 = 365*3;

OutputField(1,lastdate,"董監事就任日期");
OutputField(2,diff,"改選天數");

ret = diff < years_3 and diff > years_3 - day;
 
