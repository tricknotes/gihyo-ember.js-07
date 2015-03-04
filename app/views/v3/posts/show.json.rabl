object @post => :post
attributes :id, :title, :body

node :comments do |post|
  post.comment_ids
end
