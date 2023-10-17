# RouletteCreator
## 概要
何か選択するのに困ったときに使えるルーレットアプリ

## アプリ画面
<img src="https://github.com/tHirai67/RouletteCreator/assets/107760651/5f961bd5-8c7a-4b12-9e6f-d27a493d1d5d" width="33%"> <img src="https://github.com/tHirai67/RouletteCreator/assets/107760651/f642da73-cd5e-42ca-945f-e4a1d0585132" width="33%">
<img src="https://github.com/tHirai67/RouletteCreator/assets/107760651/01093b26-4c01-475a-b4cb-310dd38c153c" width="33%">

## 機能
- ルーレット名と項目を入力することで，ルーレットを作成する
- ルーレットデータのDBの保存機能
- データベースから選択したルーレットを再び使えること
- データベースのルーレットを編集できる
- データベースのルーレットを削除できる

## 言語&フレームワーク
![システム概要図](https://github.com/tHirai67/RouletteCreator/assets/107760651/561d17f5-1b7f-4172-b1e6-2f42de0794ba)
フロントエンド：HTML/CSS，JavaScript(jQuery)
バックエンド：Java(Servlet, JSP, JavaBeans, JSBC)，その他：MySQL，IDE：Eclipse

## 補足
WEB-INFにdatabase.propertiesファイルを作成する必要がある．
使用するデータベースに応じて以下を記述する．

{url=データベース情報　username=ユーザ名　password=パスワード}
