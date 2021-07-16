class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_presence_of :email, :password, on: :create
  devise :database_authenticatable, :registerable,
        :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
