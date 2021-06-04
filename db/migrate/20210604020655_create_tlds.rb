class CreateTlds < ActiveRecord::Migration[6.1]
  def change
    create_table :tlds do |t|
      t.string :label

      t.timestamps
    end
  end
end
