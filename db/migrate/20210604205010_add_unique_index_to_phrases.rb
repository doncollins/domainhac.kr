class AddUniqueIndexToPhrases < ActiveRecord::Migration[6.1]
  def change
    add_index :phrases, [:text], unique: true
  end
end
