class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable
         :recoverable, :rememberable, :validatable
         # :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]
         # ↑ devise module全部

  # devise用に以下を追加
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  validates :belongs, presence: true, length: {maximum: 50}

  #登録時にメールアドレスを不要とする
  def email_required?
    false
  end

  # def email_changed?
  #   false
  # end

  has_many :owners
  has_many :lists, through: :owners

  
  # def sign_up
  #   @title = '＜新規ユーザー登録＞'
  # end

end