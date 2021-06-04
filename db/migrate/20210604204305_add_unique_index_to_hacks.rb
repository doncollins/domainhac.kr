class AddUniqueIndexToHacks < ActiveRecord::Migration[6.1]
  def change
    add_index :hacks, [:domain_id, :phrase_id], unique: true
  end
end
