{@type:filter|@guid:7d8e45f559244121b0b20aa87715496c|@path:/08.財報選股/法定盈餘公積已提足，配股能力提昇}
value1=GetField("法定盈餘公積","Q");	//百萬

value2=GetField("最新股本");			//億

value3=GetField("本期稅後淨利","Q");	//百萬

// 稅後淨利 + 法定盈餘公積 > 股本
//
if value1 + value3 > value2*100
then ret=1;

