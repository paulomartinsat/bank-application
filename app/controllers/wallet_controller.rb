class WalletController < ApplicationController
  before_action :set_current_wallet, only: %i[create_request create_transfer] 
  def index
    @wallets = Wallet.all
    @current_wallet = Wallet.find_by(user_id: current_user.id)
    @transactions = Transaction.where(wallet_id: @current_wallet.id)
    @stocks = Stock.new
  end

  def set_current_wallet
    @current_wallet = Wallet.find_by(user_id: current_user.id)
  end
end
