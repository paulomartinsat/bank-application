class TransactionsController < ApplicationController
    before_action :set_current_wallet, only: %i[create_request create_transfer]
    before_action :set_destination_wallet, only: %i[create_transfer]
    def new
        @transaction = Transaction.new
    end
    def create 
        @transaction = Transaction.create(transactions_params)
        @transaction.wallet_id = Wallet.find_by(user_id: current_user.id)
        if @transaction.save!
            redirect_to wallet_index_path,
            notice: 'Transaction made succesfully'
        end
    end
    def new_request
        @transaction = Transaction.new
    end
    def create_request
        @transaction = Transaction.create(transactions_params)
        if @current_wallet["balance"] > transactions_params[:value].to_f
            @transaction = Transaction.new(transactions_params)
            @transaction.mode = 1
            @transaction.wallet = @current_wallet
            @current_wallet.update(balance: @current_wallet.balance - @transaction.value)
            if @transaction.save!
                redirect_to wallet_index_path,
                notice: 'Request made, money is available!'
            else
                redirect_to new_request_path,
                notice: 'Request failed, try again!'
            end
        else
            redirect_to wallet_index_path,
            notice: 'Error mading transaction!'
        end
    end
    def new_transfer
        @transfer = Transaction.new
    end
    def create_transfer
        @transaction = Transaction.create(transactions_params)
        if @current_wallet["balance"] > transactions_params[:value].to_f
            origin_transaction
            destination_transaction
            if @transaction.save!
                redirect_to wallet_index_path,
                notice: 'Transaction made, money is available to the user!'
            else
                redirect_to new_request_path,
                notice: 'Request failed, try again!'
            end
        else
            redirect_to wallet_index_path,
            notice: 'Error making transaction!'
        end
    end

    
    private
    def transactions_params
        params.require(:transaction).permit(:value, :wallet_id) 
    end
    def set_current_wallet
        @current_wallet = Wallet.find_by(user_id: current_user.id)
    end
    def set_destination_wallet
        @destination_wallet = Wallet.find_by(user_id: transactions_params[:wallet_id])
    end
    def origin_transaction
        ActiveRecord::Base.transaction do
            transaction = Transaction.new(value: transactions_params[:value].to_f, mode: 0)
            transaction.wallet = @current_wallet
            transaction.save!
            @current_wallet.update(balance: @current_wallet.balance - transaction.value)
        end
    end
    def destination_transaction
        ActiveRecord::Base.transaction do
            transaction = Transaction.new(value: transactions_params[:value].to_f, mode: 1)
            transaction.wallet = @destination_wallet
            transaction.save!
            @destination_wallet.update(balance: @destination_wallet.balance + transaction.value)
        end
    end
    
end