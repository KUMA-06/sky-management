# アプリ名
sky-management

# 概要
新規登録・ログインすることで「ツアー追加、削除」「班追加、削除」「進捗の登録」ができます。
ログインしない場合は、全てのページの閲覧ができます。

# 本番環境
https://sky-management.herokuapp.com/

# ログイン情報（テスト用）
Eメール：aaa@aaa1
パスワード：a55555

# 制作背景(意図)
前職で冬に行われるスキーツアーの課題を解決するものになります。
スキーツアーは参加人数１００名以上、生活班１０班以上の規模で行われます。
毎回社員は、各班の行動進捗を管理するために大きな紙とマグネットを持参して行動管理表を現地で作っていました。班長は社員にトランシーバーで現状を伝え、社員はマグネットを張り替えるという作業をしていました。しかし、班長自身はこの表を見ることができないため、社員のマグネットの張り替えミスや班長の言い間違いなどで、たびたび問題が起きていました。
このアプリは、「誰でも自分の進捗を見ることができるようになること」と「社員の荷物削減」を解決するために作成しました。

# 工夫したポイント
自分の班が何番目の待ちなのかを知れるように、必ず１から始まる連番を表示したところです。
スキーツアーでは、ホテルの浴場を一般の方と一緒に使っていました。なので子供たちが多すぎて迷惑にならないように、「お風呂に入る順番待ち」のような待機の時間が多くありました。
マグネットで管理していたため、待機の班が増えてくると誰が何番目か分からなくなってしまうことがあり、班長さんから指摘されるなど問題も発生していました。
なのでこのアプリでは、一目で何番目かわかる表示と、１番が抜けたら２番が繰り上がるようにしています。

# 機能紹介
## 班を追加するとテーブルが追加される。
[![Image from Gyazo](https://i.gyazo.com/4a75bb0762934cf57a0fb7ccdfaee4b2.png)](https://gyazo.com/4a75bb0762934cf57a0fb7ccdfaee4b2)
[![Image from Gyazo](https://i.gyazo.com/9ada3301650f474ecc34651b39762bc4.png)](https://gyazo.com/9ada3301650f474ecc34651b39762bc4)

## 追加ボタンを押すと、その班が現在何番目なのかが表示される。
[![Image from Gyazo](https://i.gyazo.com/1d3fc12c523d1fee2521b45507ec4b93.gif)](https://gyazo.com/1d3fc12c523d1fee2521b45507ec4b93)

# 使用技術(開発環境)
## バックエンド
Ruby, Ruby on rails
## フロントエンド
HTML, CSS
## データベース
MySQL
## ソース管理
GitHub, GitHubDesktop
## エディタ
VSCode

# 課題や今後実装したい機能
班の進捗を間違えて登録してしまった時の「戻るボタン」や緊急対応が必要な時のボタンの実装

# DB設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
### Association
- has_many :tours

## tours テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| place  | string | null: false |
### Association
- has_many :members
- has_many :categories
- belongs_to :user

## members テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| group    | string | null: false |
| nickname | string | null: false |
### Association
- belongs_to :tour

## categories テーブル
| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| dining             | string | unique: true |
| dinner_wait        | string | unique: true |
| dinner_preparation | string | unique: true |
| bath_time          | string | unique: true |
| bath_wait          | string | unique: true |
| escape             | string | unique: true |
### Association
- belongs_to :tour