class AddBookmarkIdToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :bookmark_id, :integer
  end
end
