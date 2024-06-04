{@type:filter|@guid:52d7fcddf6d243d69751cee15a276d54|@path:/04.價量選股/跌到52週低點之下}
setbarfreq("W");

if close<lowest(low[1],52) then ret=1;