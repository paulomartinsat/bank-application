class Wallet < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :wallets
end
