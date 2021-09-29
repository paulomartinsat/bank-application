class WalletController < ApplicationController
  def index
    @wallets = Wallet.all
    @current_wallet = Wallet.find_by(user_id: current_user.id)
    
  end



end
