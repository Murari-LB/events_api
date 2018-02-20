class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :invitations
   has_many :events, through: :invitations
   validates :username, presence: true,  uniqueness: true

   def generate_authentication_token!
    begin
      self.authentication_token = Devise.friendly_token
    end while self.class.exists?(authentication_token: authentication_token)
  end
end
