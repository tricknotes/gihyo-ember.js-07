class MockComment < ActiveHash::Base
  include ActiveHash::Associations

  belongs_to :post, class_name: 'MockPost'

  delegate :as_json, to: :attributes

  fields :text, :post_id

  create id: 1,
    text: 'はじめまして',
    post_id: 1

  create id: 2,
    text: '入門しました',
    post_id: 1

  create id: 3,
    text: '詳しい説明を知りたいときはまず参考にします。',
    post_id: 2
end
