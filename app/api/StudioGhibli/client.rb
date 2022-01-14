module StudioGhibli
  class Client
    def self.films(id="2baf70d1-42bb-4437-b551-e5fed5a87abe")
      response = Request.call(http_method: 'get', endpoint: "/films?id=#{id}")
    end

    def self.people
      response = Request.call(http_method: 'get', endpoint: '/people')
    end

    def self.locations
      response = Request.call(http_method: 'get', endpoint: '/locations')
    end
  end
end
