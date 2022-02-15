class AddAutherIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :auther_id, :integer
    add_index :books, :auther_id
  end
end
