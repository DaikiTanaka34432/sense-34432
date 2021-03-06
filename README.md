# README
# アプリ名: sense
## アプリケーション概要
  芸人さん達がセルフプロデュースしているグッズ・作品等を閲覧・購入することができる。

## 本番環境(デプロイ先)
   https://sense-34432.herokuapp.com/
  
### テストアカウント
  - 芸人として利用するアカウント（出品者用）
    - mail: geinin1@geinin.jp
    - pass: geinin1
  - 一般ユーザーとして利用するアカウント（購入者用）
    - mail: testuser1@test.jp
    - pass: testuser1

## 利用方法
  - 芸人さんは新規登録時に「芸人（出品者）として利用」を選択
  - 一般ユーザーは新規登録時に「一般ユーザーとして利用」を選択
  - 芸人さんは自分が作ったオリジナル作品を出品する。
  - ユーザーはいいねを押して作品をマーキングできる。
  - また一般ユーザーは気に入った作品を購入できる。

## 制作背景(意図)
  絵を書いたりグッズやアクセサリーを作る器用な芸人さんが増えている。<br>
  しかし、それらを購入するには個々の専用HPにアクセスしなければならず、アクセス回数が増えて不便。<br>  
  多数の芸人さんの作品をひとまとめに閲覧・購入することができれば、<br>  
  ①個々のHPへアクセスという手間の削減<br>
  ②作品をきっかけにさまざまな芸人さんを知る機会増加 <br> 
  ③作品をきっかけにファンを作る機会増加<br>  
  といった不便を解消するだけでなく、芸人さんと一般ユーザー双方にとってもメリットが見込める。<br>  
  また、作った作品は「手作りの一点モノ×芸人さんのブランド」で一定の需要が見込める。

## 要件定義

| 実装機能  | ユーザー管理機能 |
| --------- | ---------------  |
| 優先順位 | 3 |
| 目的 | ユーザー情報を管理するため |
| 詳細 | 芸人として利用するか、一般ユーザーとして利用するか、新規登録時に判別できるようにする。|
| ストーリー | 新規登録ボタンを押すと新規登録ページに遷移する。<br>新規登録が完了すると、ログインした状態でトップページへ遷移する。<br> 未ログイン状態でログインボタンを押すとログインページに遷移する。<br>ログインボタンを押すとトップページへ遷移する。|
| 見積もり | 5時間 |
<br>

| 実装機能  | 商品一覧機能 |
| --------- | ------------ |
| 優先順位 | 3 |
| 目的 | 出品商品をまとめて表示するため。 |
| 詳細 | ユーザーが閲覧しやすいように、出品した商品をまとめて表示する。|
| ストーリー | トップページ＝商品一覧ページとしてあるので、当アプリケーションにアクセスしたり、トップページに戻るたびに一覧ページが表示される。|
| 見積もり | 5時間 |
<br>

| 実装機能  | 商品出品機能 |
| --------- | ------------ |
| 優先順位 | 3 |
| 目的 | 芸人さんのみ商品を出品できるようにするため。 |
| 詳細 | 芸人さんのみ商品を出品できるように、一般ユーザーとしてログインしているユーザー・未ログインユーザーの一覧ページには出品ボタンは表示されない。|
| ストーリー | 商品一覧ページに出品ボタンがあり、クリックすると出品ページへ遷移する。<br>出品完了するとトップページへ戻り、商品一覧ページに出品商品が追加される。|
| 見積もり | 5時間 |
<br>

| 実装機能  | 商品詳細機能 |
| --------- | ------------ |
| 優先順位 | 3 |
| 目的 | 商品説明やカテゴリー、金額等の詳細を確認できるようにするため。 |
| 詳細 | 出品者が商品出品時に登録した内容が表示され、一覧ページに表示されている内容より詳細な情報を確認することができる。<br>戻るボタンが共通で表示されるがその他のボタンとして、一般ユーザーの場合は「購入ボタン」、出品者の場合は「編集・削除ボタン」を表示し、未ログインユーザーの場合はボタンの表示はない。|
| ストーリー | 商品をクリックすると詳細ページに遷移し、商品詳細を確認することができる。<br>購入・編集・削除ボタンをクリックすると、それぞれのページへ遷移する。<br>戻るボタンをクリックすると、一つ前のページへ遷移する。|
| 見積もり | 3時間 |
<br>

| 実装機能  | 商品編集機能 |
| --------- | ------------ |
| 優先順位 | 3 |
| 目的 | 出品商品の内容を編集できるようにするため。 |
| 詳細 | 誤った情報等を修正できるように、ログインユーザーが出品者の時のみが編集ボタンを表示し、編集することができる。|
| ストーリー | ログインユーザーが出品者の時、商品詳細ページに編集ボタンが表示される。<br>編集ボタンをクリックすると、編集ページへ遷移し内容を編集することができる。<br>更新ボタンをクリックすると、商品詳細ページへ遷移し、更新内容が表示される。|
| 見積もり | 2時間 |
<br>

| 実装機能  | 商品削除機能 |
| --------- | ------------ |
| 優先順位 | 3 |
| 目的 | 誤って出品した商品や不要な商品等を削除できるようにするため |
| 詳細 | 誤って出品した商品等を削除できるように、ログインユーザーが出品者の時のみ削除ボタンを表示し、削除できる。|
| ストーリー | ログインユーザーが出品者の時、商品詳細ページに削除ボタンが表示される。<br>削除ボタンをクリックすると削除が完了してユーザー詳細ページへ遷移する。|
| 見積もり | 2時間 |
<br>

| 実装機能  | 商品購入機能 |
| --------- | ------------ |
| 優先順位 | 3 |
| 目的 | 一般ユーザーが欲しい商品を購入できるようにするため。 |
| 詳細 | ログインユーザーが一般ユーザーの時のみ、商品詳細ページに購入ボタンを表示する。<br>購入確認ページでクレジットカードや配送先の情報を入力すると購入することができる。|
| ストーリー | 商品詳細ページの購入ボタンをクリックすると、購入確認ページへ遷移する。<br>必要な情報を入力して購入ボタンをクリックすると、購入完了しトップページへ遷移する。<br>購入したユーザーのユーザー詳細ページには購入した商品が表示される。|
| 見積もり | 8時間 |
<br>

| 実装機能  | ユーザー詳細機能 |
| --------- | ---------------  |
| 優先順位 | 3 |
| 目的 | 出品者/購入者がどんなユーザーか判断するため。 |
| 詳細 | ユーザーのプロフィール情報を表示。ユーザーが出品者の場合は出品商品が一覧表示される。<br>一般ユーザーの場合はいいねした商品や購入した商品が表示される。|
| ストーリー | ログイン中のユーザー名や商品詳細のユーザー名をクリックするとユーザー詳細ページへ遷移する。<br>表示されている商品をクリックすると商品詳細ページへ遷移できる|
| 見積もり | 4時間 |
<br>

| 実装機能  | 商品検索機能 |
| --------- | ------------ |
| 優先順位 | 3 |
| 目的 | 商品を探す時間を減らすため。 |
| 詳細 | 入力した文字と一致する文字をもつ商品だけを検索結果として一覧に表示する。|
| ストーリー | 文字列を入力して検索ボタンをクリックする検索結果ページに遷移して、文字列に該当する商品が表示される。|
| 見積もり | 6時間 |
<br>

| 実装機能  | カテゴリー別機能 |
| --------- | ---------------- |
| 優先順位 | 2 |
| 目的 | カテゴリーごとに分けて商品を検索できるようにするため。 |
| 詳細 | 所属事務所・商品カテゴリ・金額の範囲をそれぞれ指定でき、よりこだわった検索をすることができる。|
| ストーリー | 商品一覧ページのヘッダーにある芸人名・所属事務所・商品カテゴリ・金額範囲の<br>どれか一つでも指定して検索ボタンをクリックすると、<br>検索結果ページに遷移して、該当する商品が表示される。|
| 見積もり | 8時間 |
<br>

| 実装機能  | 商品いいね機能 |
| --------- | -------------- |
| 優先順位 | 2 |
| 目的 | 気に入った商品をマーキングするため |
| 詳細 | いいねした商品はユーザー詳細ページに一覧で表示される。<br>出品者本人や未ログインユーザーはいいねできず、いいね数のみ見ることができる。|
| ストーリー | 商品一覧ページで♡をクリックするといいねしたサインとして色が変わり、横の数字が1つカウントされる。<br>いいねされた状態で再度クリックすると、いいねは外されカウントも1つ下がる。<br>一般ユーザーはユーザー詳細ページへ移動すると、自分がいいねした商品を見ることができる。|
| 見積もり | 8時間 |
<br>

| 実装機能  | レスポンシブデザイン |
| --------- | -------------------  |
| 優先順位 | 2 |
| 目的 | スマホユーザーに気軽に使用してもらうため |
| 詳細 | スマホ用のレスポンシブデザインの設定をする。|
| ストーリー | スマホでアプリケーションを使用した時、文字や画像がスマホ画面のサイズに合った大さで表示される。|
| 見積もり | 6時間 |
<br>


## DEMO
### トップページ（商品一覧ページ）
- トップページからユーザー新規登録・ログイン・ログアウト・商品出品・一覧表示・検索をすることができる。
![index](https://user-images.githubusercontent.com/77190650/111932738-6c1cff80-8b01-11eb-8c7b-fa0b0b2252dd.gif)<br>

### ユーザー登録ページ
- 一般ユーザーとして利用を選択すると、登録フォームは通常通り表示される。
![ippan-signup](https://user-images.githubusercontent.com/77190650/111933843-9c659d80-8b03-11eb-9e26-4fda43d1fdb1.gif)<br>

- 芸人として利用を選択すると、所属事務所・芸歴のセレクトフォームが表示される。
![talent-signup](https://user-images.githubusercontent.com/77190650/111933519-fe71d300-8b02-11eb-8056-fefe2c9ef960.gif)<br>

### 商品出品ページ
- 必須項目を入力し出品ボタンを押すとトップページに遷移し、商品が一覧ページに追加される。
![item-sell](https://user-images.githubusercontent.com/77190650/112076300-89170880-8bbd-11eb-9ca0-8c688942bb81.gif)<br>

### 商品詳細ページ
- 商品をクリックすると詳細ページへ遷移し、商品の詳細情報を確認できる。
![item-detail](https://user-images.githubusercontent.com/77190650/112079859-3d1b9200-8bc4-11eb-807f-2f58ba60b3f0.gif)<br>

### 商品編集ページ
- 編集ボタンをクリックすると編集ページへ遷移する。編集内容を更新すると、詳細ページへ遷移する。
![item-edit](https://user-images.githubusercontent.com/77190650/112080643-b667b480-8bc5-11eb-983d-09da05298217.gif)<br>

### 商品削除ページ
- 削除ボタンをクリックすると、削除完了しユーザー詳細ページへ遷移する。
![item-delete](https://user-images.githubusercontent.com/77190650/112080849-05154e80-8bc6-11eb-9afb-a0f4ccd45366.gif)<br>

### 商品購入ページ
- 商品詳細ページの購入ボタンをクリックすると、購入ページへ遷移する。
![item-order](https://user-images.githubusercontent.com/77190650/112081085-6fc68a00-8bc6-11eb-8474-a5ac59604143.gif)<br>

- 必須項目の入力をして購入ボタンを押すとトップページへ遷移する。購入した商品にはSold Outが表示される。
![order-ok](https://user-images.githubusercontent.com/77190650/112081304-cb911300-8bc6-11eb-84c0-873cf8b3773d.gif)<br>

### ユーザー詳細ページ
- 一般ユーザーのページにはプロフィールの他に、いいねした商品と購入済み商品が表示される。
![ippan-detail](https://user-images.githubusercontent.com/77190650/111937180-87d8d380-8b0a-11eb-8ab0-932ab205d0ab.gif)<br>

- 芸人ユーザーのページにはプロフィールの他に、過去の出品商品一覧が表示される。
![talent-detail](https://user-images.githubusercontent.com/77190650/111937633-7e03a000-8b0b-11eb-98e4-d5d0cf7df8c8.png)<br>

### カテゴリー検索
- 所属事務所・商品カテゴリ・金額範囲から好きな項目を絞って検索できる。
![category-search](https://user-images.githubusercontent.com/77190650/112081590-3b070280-8bc7-11eb-8699-53e228a25054.gif)<br>

### いいね機能（非同期通信）
- ログインユーザーは♡をクリックすると非同期でいいねの付け外しができる。
![likes-button](https://user-images.githubusercontent.com/77190650/112081862-b5378700-8bc7-11eb-861d-ec2b52dd380f.gif)<br>


## 工夫したポイント
### 利用方法別に、ユーザー新規登録時の内容を変更
  - 芸人として利用するのであれば、所属事務所・芸歴・自己紹介<br>
  - 一般ユーザーとして利用するのであれば、自己紹介のみの入力と、ユーザーによって登録内容を変更できるようにした。<br>
  

### ログインユーザーによって各ページの表示内容を変更。
1. 芸人として利用する場合<br>
  - 商品一覧ページに出品ボタンを表示した。<br>
  ![talent-cell](https://user-images.githubusercontent.com/77190650/111932958-d897fe80-8b01-11eb-8fc6-19b486c01e84.png)
  - ユーザー詳細ページには、出品した作品一覧を表示した。<br>
  - ユーザー詳細ページのサイドプロフィールには所属事務所・芸歴・自己紹介文を表示した。<br>
  - 芸人さんは作品出品のみの利用のため、他の芸人の商品は購入できないように、商品詳細ページの購入ボタンを非表示にした。<br>
  - 自分が出品した作品のみ編集・削除できるようにした。<br>
  - 自分が出品した作品にはいいねクリックできないよう表示変更した。<br>

2. 一般ユーザーとして利用する場合<br>
  - 一般ユーザーは作品購入のみの利用のため、商品一覧ページの出品ボタンを非表示にした。<br>
  ![ippan-nosell](https://user-images.githubusercontent.com/77190650/111933185-49d7b180-8b02-11eb-9ab6-e15d7d2a1f0c.png)<br>
  - ユーザー詳細ページに、いいね押した作品一覧を表示した。<br>
  - ユーザー詳細ページのサイドプロフィールには自己紹介文と過去の購入済作品名を表示した。<br>
  ![ippan-page](https://user-images.githubusercontent.com/77190650/111952396-71da0b80-8b28-11eb-89ec-4199189b8d59.png)<br>

3. 未ログインで利用する場合<br>
  - 未ログインユーザーは作品購入できないように、商品詳細ページの購入ボタンを非表示にした。<br>
  - 未ログインユーザーはいいねクリックできないように表示変更した。<br>
  ![un-login](https://user-images.githubusercontent.com/77190650/111953058-6d622280-8b29-11eb-9be4-2c789f8e9d4c.png)<br>


### 添付画像プレビュー機能
  - 商品出品時に添付する画像をプレビュー表示させて、画像確認をできるようにした。<br>
  ![preview](https://user-images.githubusercontent.com/77190650/111934333-8b695c00-8b04-11eb-9227-c74a269443ab.png)<br>


### いいね機能追加
  - 気に入った作品はいいねをすることができ、一般ユーザーであればいいねした作品をユーザー詳細ページでみることができる。<br>
  -  芸人さんは、ユーザー詳細ページで出品商品についたいいね数を確認することができる。<br>
  -  非同期通信を使い、ページ遷移せずにいいねの付け外しをできるようにした。<br>


### カテゴリー検索機能追加
  - 芸人さんの名前・所属事務所・カテゴリー・金額の範囲をそれぞれ指定して検索できるようにした。<br>


### レスポンシブデザイン
  - スマホでも手軽に利用してもらうために、スマホのサイズにレスポンシブ化した。<br>
  - また利用する時のことを考え、出品ボタンや購入ボタンを画面の右側に配置した。<br>
  ![responsive](https://user-images.githubusercontent.com/77190650/112082057-08a9d500-8bc8-11eb-8ab7-373db50bc156.gif)<br>


## 使用技術(開発環境)
### バックエンド
  Ruby/Ruby on Rails
  
### フロントエンド
  HTML/CSS/JavaScript/jQuery

### データベース
  MySQL/SequelPro

### インフラ
  AWS(S3)
  Github/Heroku/AWS/Visual Studio Code

### Webサーバ（本番環境）
  Nginx

### アプリケーションサーバ（本番環境）
  Puma

### ソース管理
  GitHub, GitHubDesktop

### テスト
  RSpec

### エディタ
  VSCode

## 課題や今後実装したい機能
  - 課題
    - フロントサイドの実装に不安があるので、JavaScriptやAjaxの学習に取り組む。
  - 今後実装したい機能
    - コメント機能を付け、作品の感想をコメントできるようにする。
    - 出品一覧が下に伸びないようにページ形式にする。
    - SNS認証を導入して新規登録・ログイン方法を多様化させる。
    - 決済をスムーズにできるようにAPI連携を実装する。

## DB設計  
- ER図 ![erd](https://user-images.githubusercontent.com/77190650/111898687-fb2b0880-8a6a-11eb-8ba3-17108f5b25b6.png)

##  テーブル設計
## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| user_check_id      | integer | null: false               |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_read     | string  | null: false               |
| first_name_read    | string  | null: false               |
| birthday           | date    | null: false               |
| telephone          | string  | null: false               |
| office_id          | integer |                           |
| career             | date    |                           |
| introduction       | text    |                           |


### Association
- has_many :items
- has_many :likes
- has_many :orders


## items テーブル
| Column              | Type       | Options                         |
| ------------------- | ---------- |-------------------------------- |
| name                | string     | null: false                     |
| profile             | text       | null: false                     |
| category_id         | integer    | null: false                     |
| delivery_fee_id     | integer    | null: false                     |
| prefecture_id       | integer    | null: false                     |
| shipment_days_id    | integer    | null: false                     |
| fee                 | integer    | null: false                     |
| user                | references | null: false, foreign_keys: true |

### Association
- belongs_to :user
- has_many :likes
- has_one :order


## likes テーブル
| Column           | Type       | Options                         |
| ---------------- | ---------  |-------------------------------- |
| item             | references | null: false, foreign_keys: true |
| user             | references | null: false, foreign_keys: true |

### Association
- belongs_to :item
- belongs_to :user



## orders テーブル
| Column           | Type       | Options                         |
| ---------------- | ---------  |-------------------------------- |
| item             | references | null: false, foreign_keys: true |
| user             | references | null: false, foreign_keys: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses
| Column            | Type       | Options                         |
| ----------------- | ---------  |-------------------------------- |
| postal_code       | string     | null: false                     |
| prefecture_id     | integer    | null: false                     |
| city              | string     | null: false                     |
| house_number      | string     | null: false                     |
| house_name        | string     |                                 |
| telephone         | string     | null: false                     |
| purchase          | references | null: false, foreign_keys: true |

### Association
- belongs_to :order