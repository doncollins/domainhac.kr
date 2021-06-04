class CreateAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :availabilities do |t|
      t.references :domain, null: false, foreign_key: true
      t.boolean :available

      t.timestamps
    end
  end
end
