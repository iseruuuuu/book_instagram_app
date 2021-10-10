

 


やること

・画像をちゃんとロードできるようにする。

-写真の選択の用  
 images = pickedFile.path;  
-リストで表示する用  
 widget._newTodo.title = savedFile as String;
 
・追加画面で、登録した画像が表示されるようにする ==> complete!!


・リスト画面で、ちゃんと表示されるようにする。
ー todo.title => String  =>画像の表示の時は、Uint8Listに変換する必要がある。

・アイコンを設定
