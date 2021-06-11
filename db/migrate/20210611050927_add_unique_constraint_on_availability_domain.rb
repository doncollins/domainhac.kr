class AddUniqueConstraintOnAvailabilityDomain < ActiveRecord::Migration[6.1]
  def change
    def change
      add_index :availabilities, [:domain_id], unique: true
    end
  end
end
