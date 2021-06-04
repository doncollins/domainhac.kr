require 'uri'
require 'net/http'
require 'json'

class FixedVocabularyProvider
    def initialize(items)
        @items = items
    end

    def find_items_ending_with(ending)
        @items.select do |item| item.text.ends_with? ending end
    end
end