class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :encrypted_password, length: { minimum: 6 }
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A([ァ-ン]|ー)+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end

    validates :birthday

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX
  end
end
