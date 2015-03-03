object @post
attributes :id, :title, :body

child :comments, object_root: false do
  attributes :id, :text
end
