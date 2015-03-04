class AddColumnNullToCommentsPostId < ActiveRecord::Migration
  def change
    change_column_null :comments, :post_id, false
  end
end
