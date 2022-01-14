# To use in rails c:
#   <Module>::<Class>.<method>
require 'rest-client'

module QuoteRandomizer
  class Request
    BASE_URL = 'https://uselessfacts.jsph.pl/'
    TOKEN = 'token'

    def self.call(http_method:, endpoint:) 
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{endpoint}",
        # url: "#{BASE_URL}#{endpoint}?apikey=#{TOKEN}",
        headers: {'Content-Type'=>'application/json'}
      )
      # return result
      JSON.parse(result)
      {code: result.code, status: 'Success', data: JSON.parse(result)}

    rescue RestClient::ExceptionWithResponse => error
      {code: error.http_code, status: error.message, data: Error.map(error.http_code)}
    end
  end
end

