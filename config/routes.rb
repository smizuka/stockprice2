Rails.application.routes.draw do

  #トップ画面
  root "users#top"
  #topページからsignin
  get "users/signup"
  #ユーザー登録画面
  post "users/create", to: "users#create"

  #変更画面に移動
  get "users/edit"

  #ユーザー情報変更
  post "users/update", to: "users#update"

  #topページからlogin
  get "users/login"
  #ログイン画面
  post "users/auth", to: "users#auth"
  # マイページへのアクセス
  get "mypages/index"
  #ログアウト
  get "users/destroy"

  # お気に入り登録
  post "favorites/create", to: "favorites#create"
  # お気に入り削除
  delete "favorites/destroy", to: "favorites#destroy"

  #部分テンプレートの設定
  get "mypages/mypages"
  get "mypages/analyses"
  get "mypages/backnumber"

  #検索したときの動作
  get "/searches/index"

  #最適化計算
  post "optimizations/calc", to: "optimizations#calc"

  # ポートフォリオに追加したときに同時に計算もする
  post "analyses/stat", to: "analyses#stat"
  #ポートフォリオを保存する
  post "portfolios/create", to: "portfolios#create"
  # ポートフォリオを削除する
  delete "portfolios/destroy", to: "portfolios#destroy"

  # シミュレートしてみる
  post "simulations/calc",to: "simulations#calc"


  # 時系列分析のトップページ
  get "analyses/index"

  # 時系列データ結果を表示する
  post "analyses/calc",to: "analyses#calc"

  #管理画面
  get "admins/admin"
  #ファイルのアップロード
  post "admins/import", to: "admins#import"

  # API用の試験パス
  # post "lists/greet", to: "lists#greet"
  # post "lists/statistic", to: "lists#statistic"

end
