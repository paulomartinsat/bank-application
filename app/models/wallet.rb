class Wallet < ApplicationRecord
    belongs_to :user_id
    has_many :transactions
end
