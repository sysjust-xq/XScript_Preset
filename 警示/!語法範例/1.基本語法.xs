{@type:sensor}
//基本語法共有以下幾個元素
//1.宣告參數
//2.宣告變數
//3.引用時間序列的回傳值﹙包括開高低收成交量等﹚
//4.運用函數
//5.條件判斷：例如使用cross over這樣的關係因子
//6.設定警示條件：if.. then ret=1;
//在這邊我們用一個警示來示範這幾個基本語法的使用方式。

//=================範例：平均漲跌幅變大========================================
//1.宣告參數：利用input宣告輸入的參數。
//宣告後的參數，可以直接在警示中進場數值的調整，而不需要調整腳本內容
input:shortlength(5),longlength(20);
//參數的名稱，可以用setinputname來指定中文的說明
//指定後再設定警示參數時，就可以直接看到中文，而非參數英文名稱
//我們在這邊故意只指定第一個參數的中文名，讓大家看看效果
setinputname(1,"短天期");

//2.宣告變數，利用variable
//這是宣告一個變數叫xi，其初始值為0
variable:xi(0);
variable:yi(0);

//3.引用時間序列的回傳值﹙包括開高低收成交量等﹚
//系統也提供value1~value99共99個不必宣告就可直接用的變數名稱
value1=close-close[1];//close[1]代表前一天收盤價

//4.運用函數
//透過absvalue這個函數取close-close[1]的絕對值
value2=absvalue(value1); 
//指定變數值的計算公式，計算漲跌幅
yi=value2/close; 
//透過average這個函數計算數列的平均值
value3=average(yi,longlength);//計算長期平均漲跌幅
value4=average(yi,shortlength);//計算短期平均漲跌幅

//5.條件判斷：例如使用cross over這樣的關係因子
//6.設定警示條件：if.. then ret=1;
//最後設定警示條件，當短期平均漲跌幅與長期平均漲跌幅黃金交叉時，觸發警示
if value4 crosses over value3
then ret=1;

