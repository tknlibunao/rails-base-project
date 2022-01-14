module StudioGhibli
  class Client
    def self.films
      response = Request.call(http_method: 'get', endpoint: "/films")
    end

    def self.people
      response = Request.call(http_method: 'get', endpoint: '/people')
    end

    def self.locations
      response = Request.call(http_method: 'get', endpoint: '/locations')
    end
  end
end
