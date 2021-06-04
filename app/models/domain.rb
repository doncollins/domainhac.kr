class Domain < ApplicationRecord
  belongs_to :tld
  has_one :availability
  has_and_belongs_to_many :phrases, join_table: 'hacks'

  def name
    label + '.' + tld.label
  end
end
