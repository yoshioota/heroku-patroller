# Heroku Patroller

このアプリは登録したURLを定期的にアクセスするアプリです。
Herokuが30分アクセスが無いとアプリが落ちてしまうのですが、それを防ぐため定期的にアクセスすることができます。


## 使い方

### 1. Herokuへデプロイする

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

上記のボタンでデプロイすれば必要となるアドオンが追加され、rake db:migration がされるようになっています。

### 2. アプリ上で定期的にアクセスしたいURLを登録する。

http://[あなたがデプロイしたアプリ名].herokuapp.com/sites/new から登録可能です。

### 3. URL登録が終わったら、Web Dynoを0にして、heroku schedulerにセットする。

#### 3-1. Web Dynoを0にする。

heroku app のダッシュボードから変更。

スケジューラを設定する前にかならずWeb Dynoを0にしてください！
しない場合課金されることが有ります！

#### 3-1. Heroku Scheduler の設定をする。

Heroku Schedulerアドオンを開き、以下のコマンドを設定し、10分間隔で動作させるようにする。

```
rake patrol:all
```

### 4. アプリのログと対象URLが入っているログを確認して動作していれば成功！！

## その他

### BASIC認証がかけるれます。

```
heroku config:set ENABLE_BASIC_AUTH=1 BASIC_AUTH_ID=AAA BASIC_AUTH_PASS=BBB -a YOUR_APP_NAME
```

以上