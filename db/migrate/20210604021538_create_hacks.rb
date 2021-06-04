class CreateHacks < ActiveRecord::Migration[6.1]
  def change
    create_table :hacks do |t|
      t.references :domain, null: false, foreign_key: true
      t.references :phrase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
