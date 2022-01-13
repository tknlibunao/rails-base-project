require 'rest-client'

module ExchangeRate
  class Request
    BASE_URL = 'http://api.exchangeratesapi.io/v1/'
    TOKEN = 'da4317762daa33344ef2932d0ed16884'

    def self.call(http_method:, endpoint:) 
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{endpoint}?access_key=#{TOKEN}",
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