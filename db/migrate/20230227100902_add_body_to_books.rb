class AddBodyToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :Body, :text
  end
end
