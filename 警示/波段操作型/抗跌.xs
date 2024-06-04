{@type:sensor|@guid:16ac10d952a546709096eedbc9867bd6|@path:/波段操作型/抗跌|@hash:628cc6e6ec93af006c4470d7ad32c821}
settotalbar(3);
if open>open[1] and open < 1.005*low then ret=1;
