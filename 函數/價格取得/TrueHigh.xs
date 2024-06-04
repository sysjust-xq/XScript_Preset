{@type:function|@guid:36d1fc033c6f48f8a136f9e1fdec110f|@path:/價格取得/TrueHigh|@hash:84c30724ca54af9327149bf8e7e86c9a}
SetBarMode(1);

if Close[1] > High then TrueHigh = Close[1]
else TrueHigh = High;
        