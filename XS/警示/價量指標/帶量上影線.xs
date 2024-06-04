{@type:sensor|@guid:4a82d879277645d5861778b8170b0380|@path:/價量指標/帶量上影線|@hash:ff752df6779ba00b2e9498cbf0c49210}
settotalbar(5);
if high - maxlist(open,close) > absvalue(open-close)*2 and
    Volume > maxlist(volume[1],volume[2],volume[3]) then ret=1;



