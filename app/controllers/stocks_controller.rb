class StocksController < ApplicationController
  def show 
    request_stock
    redirect_to root_path, notice: "Not possible find the Stock you've entered" if @stocks["Error Message"].present?
  end

  def research_stock
    redirect_to show_path(symbol: params[:symbol])
  end
  private
  def request_stock
    @stocks = StocksRequestService.new(params[:symbol]).request 
  end
end
