class TldsController < ApplicationController
    def index
        tlds = Tld.joins(domains: [:availability])
            .where(availability: { available: true })
            .distinct
            .order('label')
            .all

        render json: { tlds: tlds }
    end
end
