module StudioGhibli
  class Error
    def self.map(code)
      case code
      when 401
        "Unauthorized Request"
      when 404
        "Invalid Request"
      else
        "Service Unavailable"
      end
    end
  end
end
