object false
node :post do
  @post.as_json(only: %i(id title body))
end

node :comments do
  @post.comments.map {|comment| comment.as_json(only: %i(id text)).merge(:post => comment.post_id) }
end
