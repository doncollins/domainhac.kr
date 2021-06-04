class DomainsController < ApplicationController
    def index
        tld = Tld.find_by(label: params[:tld])

        domains = Domain.where(tld: tld)
            .joins(:availability)
            .where(availability: { available: true })
            .includes(:tld, :availability, :phrases)
            .order('phrases.score desc')
            .limit(100)
            .all

        render json: { domains: domains }, include: ['tld', 'availability']
    end
end
