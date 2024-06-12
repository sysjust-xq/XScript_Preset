{@type:filter}
variable:sn("");
sn=symbolname;
if instr(sn,"F")=0
and instr(sn,"Y")=0 then ret=1;
outputfield(1,sn,0,"symbolname");