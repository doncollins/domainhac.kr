require 'uri'
require 'net/http'

class GandiAvailabilityProvider
    def initialize(api_key)
        @api_key = api_key
    end

    def check_availability(domain_name)
        uri = URI('https://api.gandi.net/v5/domain/check?name=' + domain_name)

        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = 'Apikey ' + @api_key

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
            http.request(req)
        end

        data = JSON.parse res.body

        data.key?('products') and data['products'].any? do |p| p['status'] == 'available' end
    end

    def interval
        2
    end
end