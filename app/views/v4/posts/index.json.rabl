collection @posts, root: 'posts', object_root: false
attributes :id, :title, :body

node :links do |post|
  {:comments => v4_post_comments_url(post)}
end
