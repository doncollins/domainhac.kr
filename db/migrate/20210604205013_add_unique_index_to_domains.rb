class AddUniqueIndexToDomains < ActiveRecord::Migration[6.1]
  def change
    add_index :domains, [:tld_id, :label], unique: true
  end
end
