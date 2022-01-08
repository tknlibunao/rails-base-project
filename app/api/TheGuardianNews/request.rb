require 'rest-client'

module TheGuardianNews
  class Request
    BASE_URL = 'https://content.guardianapis.com/'
    TOKEN = 'ff5e950c-920c-4112-950c-fb90a969ab45'

    def self.call(http_method:, endpoint:) 
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{endpoint}?api-key=#{TOKEN}",
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