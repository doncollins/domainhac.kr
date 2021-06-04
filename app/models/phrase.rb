class Phrase < ApplicationRecord
    has_and_belongs_to_many :domains, join_table: 'hacks'
end
