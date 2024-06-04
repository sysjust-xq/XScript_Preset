{@type:filter|@guid:f472317cfd8d4df5a22636eb33c458e7|@path:/08.財報選股/五年內有至少三年營收成長}
value1=GetField("營業收入淨額","Y");
value2=value1-value1[1];
if countif(value2>0,5)>=3
then ret=1;
