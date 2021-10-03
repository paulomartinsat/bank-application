class User < ApplicationRecord
  after_create :set_wallet
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_one :wallet
  def set_wallet
    self.wallet = Wallet.create
  end
  def user_list
    @user = User.find_by_id(params[:id])
  end
  def all_users
    @users = User.all
  end
end
