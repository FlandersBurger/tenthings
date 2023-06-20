module Legacy
  class ConnectionService
    include HTTParty

    BASE_URI = 'https://belgocanadian.com/api'

    base_uri BASE_URI
    headers 'Accept' => 'application/json', 'Content-Type' => 'application/json'
    headers 'x-auth' => ENV['LEGACY_TOKEN']

    def get(path, params = {}, **kwargs)
      response = self.class.get("#{BASE_URI}#{path}", {
        query: params,
        **kwargs,
      })
      JSON.parse(response.body)
    end  
  end
end
