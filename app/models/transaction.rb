class Transaction < ApplicationRecord
  belongs_to :wallet, class_name: "Wallet", foreign_key: "origin_wallet_id", dependent: :destroy
  belongs_to :wallet, class_name: "Wallet", foreign_key: "destination_wallet_id", dependent: :destroy
  enum type: { credit: 0, debit: 1}
end
