module Api
  class StudioGhiblisController < ApplicationController
    def films
      films = StudioGhibli::Client.films

      render json: films
    end
    
    def people
      people = StudioGhibli::Client.people

      render json: people
    end
    
    def locations
      locations = StudioGhibli::Client.locations

      render json: locations
    end
  end
end
