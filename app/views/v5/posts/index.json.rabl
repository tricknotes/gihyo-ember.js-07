object false
node :posts do
  @posts.as_json(only: %i(id title body))
end

node :comments do
  @comments.map {|comment| comment.as_json(only: %i(id text)).merge(:post => comment.post_id) }
end
