object @post => :post
attributes :id, :title, :body

child :comments, root: 'comments', object_root: false do
  attributes :id, :text
end
