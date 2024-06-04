{@type:filter|@guid:910e6b610da742d0bc9d67e9acfa4b81|@path:/04.價量選股/無量變有量}
input:v1(1000,"前一期成交量");
input:v2(1000,"最新期成交量");
if trueall(volume[1]<=v1,10) and volume>v2 
then ret=1; 