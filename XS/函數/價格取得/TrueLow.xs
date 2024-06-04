{@type:function|@guid:81394f9cf0c8469ea5f8832700aec8b7|@path:/價格取得/TrueLow|@hash:48cb43c625b9fd07fc83d63d39f8292e}
SetBarMode(1);

if Close[1] < Low then TrueLow = Close[1]
else TrueLow = Low;
        