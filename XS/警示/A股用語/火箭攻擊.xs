{@type:sensor|@guid:e3405170b40d4d51a4b88d48262e43b9|@path:/A股用語/火箭攻擊|@hash:7e02229208c96670a7fa5db72ae74bd6}
settotalbar(3);
IF CLOSE >=  CLOSE[1] * 1.015 and close=high and volume>volume[1]
then ret=1;