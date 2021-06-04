require 'uri'
require 'net/http'
require 'json'

class DatamuseVocabularyProvider
    def initialize(min_score = 500)
        @min_score = min_score
    end

    def find_items_ending_with(ending)
        uri = URI('https://api.datamuse.com/words?max=1000&sp=*' + ending)
        res = Net::HTTP.get_response(uri)
        items = JSON.parse res.body
        items.select{|item| item['score'] >= @min_score}
            .select{|item| !item['word'].match(/[^a-z]/)}
            .select{|item| item['word'].length > ending.length}
            .map{|item| VocabularyItem.new item['word'], item['score']}
    end
end