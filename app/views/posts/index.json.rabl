object false
node :posts do
  @posts.as_json(only: %i(id title body))
end

node :comments do
  @comments.as_json(only: %i(id text post_id))
end
