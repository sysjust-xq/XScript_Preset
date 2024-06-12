{@type:sensor}
if countif(close<open,7)>=5
//過去七天有五天以上收黑
and lowest(close,90)*1.4<close
//過去九十天漲幅超過四成
and lowest(close,10)*1.2<close
//過去十天有急拉過
and volume*1.2<average(volume,20)
//成交量低於二十日均量的兩成
then ret=1;