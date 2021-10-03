class StocksController < ApplicationController
  def show 
    request_stock
    redirect_to root_path, notice: "Not possible find the Stock you've entered" if @stocks["Error Message"].present?
  end

  def research_stock
    p stock_params
    redirect_to show_path(stock_params)
  end
  private
  def request_stock
    @stocks = StocksRequestService.new(params[:symbol]).request 
  end
  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
