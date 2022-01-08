module ExchangeRate
    class Client
      def self.latest
        response = Request.call(http_method: 'get', endpoint: '/latest')
      end
  
      def self.historical
        response = Request.call(http_method: 'get', endpoint: '/2021-02-12')
      end
    end
  end
  
# rails c
# ExchangeRate::Client.latest
# ExchangeRate::Client.historical
# Resource: https://exchangeratesapi.io/ - needs token