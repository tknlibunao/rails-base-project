module Api
  class ExchangeRatesController < ApplicationController
    def latest
      latest = ExchangeRate::Client.latest

      render json: latest
    end
  end
end
