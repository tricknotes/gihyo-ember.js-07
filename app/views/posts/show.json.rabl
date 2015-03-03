object false
node :post do
  @post.as_json(only: %i(id title body))
end

node :comments do
  @post.comments.as_json(only: %i(id text post_id))
end
