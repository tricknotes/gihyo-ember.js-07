class MockPost < ActiveHash::Base
  include ActiveHash::Associations

  has_many :comments, foreign_key: :post_id, class_name: 'MockComment'

  delegate :as_json, to: :attributes

  fields :title, :body

  create id: 1,
    title: 'はじめての Ember.js',
    body: 'これから Ember.js を始めようという方向けの記事です。'

  create id: 2,
    title: '公式サイトの歩き方',
    body: 'http://emberjs.com/ の解説です。'

  def comment_ids
    comments.map(&:id)
  end
end
