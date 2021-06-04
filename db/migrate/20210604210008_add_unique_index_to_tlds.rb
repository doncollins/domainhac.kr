class AddUniqueIndexToTlds < ActiveRecord::Migration[6.1]
  def change
    add_index :tlds, [:label], unique: true
  end
end
