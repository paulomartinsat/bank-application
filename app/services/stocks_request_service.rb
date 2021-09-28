class StocksRequestService
    def initialize

    end
    def request 
        endpoint = 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=v&interval=5min&apikey=PEQV59FJ89YWFKP5'
        response = HTTParty.get(
            endpoint,
            :headers => {})
        response = JSON.parse(response.body)
        p response
    end
    
    
    
        
end