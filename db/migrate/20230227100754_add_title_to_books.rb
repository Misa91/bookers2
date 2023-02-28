class AddTitleToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :Title, :string
  end
end
