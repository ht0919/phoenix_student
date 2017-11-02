# Elixir+PhoenixによるWebアプリの作例(4)

- 2017年10月27日の福岡Elixir会で、もくもく会の題材として作成したWebアプリです。
- 当日は時間内に完成に至らず悔しい思いをしたので、後日リベンジとして作り込んでみました。
- 主宰者の@piacere_exさん、アドバイスありがとうございました。


## 概要

- 3つのテーブルを連携させたPhoenixによるWebアプリの作例です。
- 学生マスタと成績データと、科目マスタと成績データを、1対多の関係でリレーションしています。
- 成績データの新規登録と変更時に、学生の氏名と科目名をメニュー選択できるようにしました。
- テーブル構成
  - 学生マスタ(student)：氏名(name:string)、学年(grade:integer)
  - 科目マスタ(subject)：科目名(name:string)、担当講師(teacher:string)
  - 成績データ(scores)：日付(date:date)、学生ID(student_id:integer)、科目ID(subject_id:integer)、点数(point:integer)


## 動作環境(バージョン)

- 環境構築の作業手順は[blog](https://github.com/ht0919/blog)を参照して下さい。
  - macOS: 10.13
  - PostgreSQL: 9.6.5
  - Node.js: 8.7.0
  - Elixir: 1.5.2
  - Phoenix: 1.3.0


## 起動方法

- git clone https://github.com/ht0919/phoenix_student
- cd phoenix_student
- npm install
- mix deps.get
- mix ecto.create
- mix ecto.migrate
- mix phoenix.server


## 学生マスタの登録

- ブラウザで[http://localhost:4000/student](http://localhost:4000/student)を表示
- 「新規登録」をクリックし、学生の氏名と学年を入力

![img01.png](https://raw.githubusercontent.com/ht0919/phoenix_student/master/images/img01.png)


## 科目マスタの登録

- ブラウザで[http://localhost:4000/subject](http://localhost:4000/subject)を表示
- 「新規登録」をクリックし、科目名と担当講師を入力

![img02.png](https://raw.githubusercontent.com/ht0919/phoenix_student/master/images/img02.png)


## 成績データの登録

- ブラウザで[http://localhost:4000/scores](http://localhost:4000/scores)を表示
- 「新規登録」をクリックし、試験日、学生名、科目名、点数を入力

![img03.png](https://raw.githubusercontent.com/ht0919/phoenix_student/master/images/img03.png)


## 成績データ登録後のイメージ

![img04.png](https://raw.githubusercontent.com/ht0919/phoenix_student/master/images/img04.png)
