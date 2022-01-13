module TheGuardianNews
    class Client
      def self.content
        response = Request.call(http_method: 'get', endpoint: '/search')
      end
  
      def self.tags
        response = Request.call(http_method: 'get', endpoint: '/tags')
      end
      def self.sections
        response = Request.call(http_method: 'get', endpoint: '/sections')
      end
    end
  end

  # rails c
  # TheGuardianNews::Client.search
  # TheGuardianNews::Client.tags
  # TheGuardianNews::Client.news
  # Resource: https://content.guardianapis.com/search?api-key=ff5e950c-920c-4112-950c-fb90a969ab45 