{@type:filter|@guid:5da5f230d0b54cbeaa49b2c19c8cef8b|@path:/06.籌碼選股/投信爭買的小型成長股}
input: miniratio(10); 	setinputname(1,"投信買進佔今日總量%");
input: lv(5000); 		setinputname(2,"投信持股張數上限");
input: holdratio(10); 	setinputname(3,"投信持股比例上限%");

SetTotalBar(3);

value1=GetField("投信買張");			//投信買張
value2=GetField("投信持股");			//投信持股
value3=GetField("投信持股比例");		//投信持股比例 

if  
   value1 > volume * miniratio*0.01 and //買進張數/成交量 >= minratio
   value2 < lv and 						//原來庫存低
   value3 < holdratio and 				//原來庫存低
   GetField("公司類別","M") = "小型股" 	//小型股
then ret=1;

SetOutputName1("投信買張");
OutputField1(value1);
