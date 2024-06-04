{@type:filter|@guid:827440bb9b854988a60fd64caab9af36|@path:/01.常用過濾條件/股票名稱不含F股}
variable:sn("");
sn=symbolname;
if instr(sn,"F")=0
and instr(sn,"Y")=0 then ret=1;
outputfield(1,sn,0,"symbolname");