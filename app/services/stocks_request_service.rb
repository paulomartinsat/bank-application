class StocksRequestService
    def initialize(stocks)
        @stocks = stocks
    end
    def request 
        endpoint = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=#{@stocks}&interval=5min&apikey=PEQV59FJ89YWFKP5"
        response = HTTParty.get(
            endpoint,
            :headers => {})
        response = JSON.parse(response.body)
        p response
    end
    
    
    
        
end