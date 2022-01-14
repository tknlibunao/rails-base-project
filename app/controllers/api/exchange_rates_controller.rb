module Api
  class ExchangeRatesController < ApplicationController
    def latest
      latest = ExchangeRate::Client.latest

      render json: latest
    end
    def historical
      historical = ExchangeRate::Client.historical

      render json: historical
    end
  end
end
