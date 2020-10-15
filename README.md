# README

<img src="app/assets/images/readme.jpg" alt="DIY LOG" title="サイトロゴ"><br>
## **サイト概要**
<hr>
「もっとカジュアルにDIYを」<br>
DIYをする方に向けた、DIY特化型SNSサービスです。
<br>
<br>

## **URL**
<hr>
https://diylog.work<br>
【ゲストログイン】ボタンからテストユーザーとしてログインできます。<br>
テストユーザーではユーザー編集以外の機能が使えます。
<br>
<br>

## **制作の背景**
<hr>
1. 私の趣味であるDIYの素晴らしさを多くの人に知ってもらいたい。<br>
2. DIYのレシピサイト自体は存在するが、未経験者目線で見ると少し複雑でとっつきにくい<br>
上記２つの理由からこのサイトを制作することにしました。<br>
より手軽に閲覧でき、DIYの素晴らしさが伝わるようなサイトを目指しました。
<br>
<br>

## **ターゲットユーザー**
<hr>
・レシピを参考にDIYをするユーザ<br>
・SNSとしてDIY好き同士で繋がりたいユーザー
<br>
<br>

## **主な利用シーン**
<hr>
・DIYにチャレンジしたいとき<br>
・作ったレシピを共有したいとき
<br>
<br>

## **機能一覧**
<hr>

+ guineapig
  + フォローされたとき、投稿にコメントされたとき、投稿がお気に入りされたときに通知が来る。
+ DM機能
  + ユーザー間でダイレクトメッセージを送ることができる。
+ ランキング表示機能
  + 投稿のお気に入り順に並び替えて表示できる。
+ N+1問題
+ HTTPS化
+ JSを用いてモーダル表示
+ レスポンシブ対応
<br>
<br>

詳細は下記よりご確認ください。
https://docs.google.com/spreadsheets/d/15X4uNo8008gP_WllnuBtxRkhUszWKZ5rvKUxfgOd8no/edit#gid=0
<br>
<br>

##  **開発環境**
<hr>

### **フロントエンド**
+ Bootstrap 4.5.0
+ SCSS
+ JavaScript、jQuery、Ajax
<br>
<br>

### **バックエンド**
+ Ruby 2.5.7
* Rails 5.2.4.3
<br>
<br>

### **開発環境**
+ vagrant
+ MYSQL

### **本版環境**
+ AWS (EC2、RDS、Route53、CloudWatch、S3、Lambda、ALB)
+ MySQL2
+ Nginx、 Puma
+ Capistoranoを用いた自動デプロイ
<br>
<br>

### **インフラ構成図**
<img src="app/assets/images/aws.png" alt="インフラ構成図" title="インフラ構成図"><br>
<br>
<br>

### **テスト**
+ Rspec（単体/結合） 計100以上
<br>
<br>

### **その他使用技術**
+ 非同期通信
+ HTTPS接続(certbot)
+ チーム開発を意識したGitHubの活用