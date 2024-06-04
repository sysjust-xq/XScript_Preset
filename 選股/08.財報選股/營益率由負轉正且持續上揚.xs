{@type:filter|@guid:a9e1059f47a1496e8c6f347117637ee9|@path:/08.財報選股/營益率由負轉正且持續上揚}
settotalbar(3);

if 
	GetField("營業利益率","Q")[2]<0 and 
	GetField("營業利益率","Q")[1]>0 and
	GetField("營業利益率","Q") > GetField("營業利益率","Q")[1] and
	GetField("月營收月增率","M") > 0 and 
	GetField("月營收月增率","M")[1] >0
then ret=1;

