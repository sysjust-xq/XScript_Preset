{@type:autotrade}
{
    Filled是Position的另外一個朋友, 代表這個策略內/這個執行商品的成交部位
    
    假設剛開始執行時, 腳本的Position是0的話, 此時Filled也會是0

    接下來當腳本執行SetPosition(1)後, 會送出一筆買進1張的委託

    如果此時尚未成交的話, Position會等於1, 可是Filled會等於0
    如果這一筆委託單成交的話, 則Position會等於1, Filled也會等於1    
    
    如果腳本內想要判斷目前成交狀態的話, 就可以透過讀取Filled這個變數來判斷.
}

{ 以下假設策略啟動時商品的Postion = 0 }

if Position = 1 and Filled = 0 then begin
    { 已經送出一筆買進1張的委託, 可是還沒有成交}

end;

if Position = 1 and Filled = 1 then begin
    { 已經送出一筆買進1張的委託, 而且這一筆委託已經成交 }

end;

if Position = -1 and Filled = 0 then begin
    { 已經送出一筆賣出1張的委託, 可是還沒有成交 }

end;

if Position = -1 and Filled = -1 then begin
    { 已經送出一筆賣出1張的委託, 而且這一筆委託已經成交 }
    
    { Filled跟Position一樣, 可能會大於0, 也可能會小於0 }
end;




