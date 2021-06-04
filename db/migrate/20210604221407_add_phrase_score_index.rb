class AddPhraseScoreIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :phrases, :score
  end
end
