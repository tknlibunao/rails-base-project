module Api
  class ExchangeratesController < ApplicationController
    def latest
      latest = ExchangeRates::Client.latest

      render json: latest
    end
  end
end
