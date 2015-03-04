collection @posts, root: 'posts', object_root: false
attributes :id, :title, :body

node :comments do |post|
  post.comment_ids
end
