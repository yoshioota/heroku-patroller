# Heroku Patroller

このアプリは登録したURLを定期的にアクセスするアプリです。
Herokuが30分アクセスが無いとアプリが落ちてしまうのですが、それを防ぐため定期的にアクセスすることができます。


## 使い方

### 1. Herokuへデプロイする

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

上記のボタンでデプロイすれば必要となるアドオンが追加され、rake db:migration がされるようになっています。

### 2. アプリ上で定期的にアクセスしたいURLを登録する。

http://[あなたがデプロイしたアプリ名].herokuapp.com/sites/new から登録可能です。

### 3. Web Dynoを0にし、heroku schedulerをセットする。

#### 3-1. Web Dynoを0にする。

heroku app のダッシュボードから変更。

スケジューラを設定する前にかならずWeb Dynoを0にしてください！
しない場合課金されることが有ります！

#### 3-1. Heroku Scheduler の設定をする。

Heroku Schedulerアドオンを開き、以下のコマンドを設定し、10分間隔で動作させるようにする。

```
rake patrol:all
```

### 4. ログを確認する。

対象アプリのログと当アプリのログを確認し、正しく動作していれば成功です！！

## その他

### BASIC認証が設定できます。

```
heroku config:set ENABLE_BASIC_AUTH=1 BASIC_AUTH_ID=AAA BASIC_AUTH_PASS=BBB -a YOUR_APP_NAME
```

以上
