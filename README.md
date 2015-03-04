# 実践入門 Ember.js 第7回: Ember Data のサンプルサーバ

**Not yet published**
(クラスのみんなには内緒だよ！ :speak_no_evil: )

* デプロイ先: https://tricknotes-gihyo-ember-07.herokuapp.com
* 連載: http://gihyo.jp/dev/serial/01/emberjs/0007

## :memo:

### JSON出力

* [ActiveModel::Serializers][]だと、コンテキスト毎にJSONのフォーマットを切り替えるのがけっこうしんどい
* かと言って[Jbuilder][]はAPIが生理的に受け付けない…
* もしかすると[RABL][]がイケてるのでは！ということで試してみた
* RABLを使ってみた感想
  * 自由度が高い
  * APIが直感的はない部分がある(サイドロードしたいだけでけっこうハマった: [`index.json.rabl`](https://github.com/tricknotes/gihyo-ember.js-07/blob/master/app/views/v1/posts/index.json.rabl))
  * とは言っても、一度わかってしまえばあとはなんとかなる
  * 複数EmberアプリをひとつのRailsで管理したいというケースだとフィットする

### クロスドメインのAjax

* 意外とハマった :arrow_down:
  * CORS 用に HTTP ヘッダを設定しないといけない[`config/application.rb`](https://github.com/tricknotes/gihyo-ember.js-07/blob/master/config/application.rb))
  * `OPTIONS` に応答しないといけない[`config/routes.rb`](https://github.com/tricknotes/gihyo-ember.js-07/blob/master/config/routes.rb))

### その他

* ルーティングで `with_options defaults: { format: :json }` するのは意外とアリな気がしてきた
  * これがないと、`/post/1`みたいなリクエストに対して `text/html` で応答しようとして missing tempalte で 500
  * AMS だと明示的に `render json: @post` とか書くので今まで特に気にしてなかった
* [ActiveHash][]便利だった
  * モックのデータを用意したいけどまだデータベースは作りたくない、というときに使えそう
  * Ember Dataを使ったプロトタイピングとかで今後も使えるかも

[ActiveModel::Serializers]: https://github.com/rails-api/active_model_serializers
[Jbuilder]: https://github.com/rails/jbuilder
[RABL]: https://github.com/nesquena/rabl
[ActiveHash]: https://github.com/zilkey/active_hash
