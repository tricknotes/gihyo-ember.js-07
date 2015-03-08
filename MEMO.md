# メモ

## JSON 生成

* [ActiveModel::Serializers][]だと、コンテキスト毎にJSONのフォーマットを切り替えるのが面倒
* かと言って[Jbuilder][]はAPIが生理的に受け付けない…
* ということで[RABL][]を使ってJSON を生成してみた
* RABLを使ってみた感想
  * 自由度が高い
  * APIが直感的はない部分がある(サイドロードでハマった: [`index.json.rabl`](https://github.com/tricknotes/gihyo-ember.js-07/blob/master/app/views/v1/posts/index.json.rabl))
  * とは言っても、一度わかってしまえばあとはなんとかなる
  * 複数EmberアプリをひとつのRailsで管理したいというケースだとフィットする

## クロスドメインのAjax

* ハマった箇所 :arrow_down:
  * CORS 用に HTTP ヘッダを設定しないといけない[`config/application.rb`](https://github.com/tricknotes/gihyo-ember.js-07/blob/master/config/application.rb))
  * `OPTIONS` に応答しないといけない[`config/routes.rb`](https://github.com/tricknotes/gihyo-ember.js-07/blob/master/config/routes.rb))

## その他

* ルーティングで API 全体に `with_options defaults: { format: :json }` するのはアリ
  * これがないと、`/post/1`みたいなリクエストに対して `text/html` で応答しようとして missing tempalte で 500 になる
  * AMS だと明示的に `render json: @post` とか書くので今まで特に気にしてなかった
* [ActiveHash][]便利だった
  * モックのデータを用意したいけどまだ DB にテーブルは作りたくない、というときに便利
  * Ember Dataを使ったプロトタイピングで今後も使えそう

[ActiveModel::Serializers]: https://github.com/rails-api/active_model_serializers
[Jbuilder]: https://github.com/rails/jbuilder
[RABL]: https://github.com/nesquena/rabl
[ActiveHash]: https://github.com/zilkey/active_hash
