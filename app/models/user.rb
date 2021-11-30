class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :bookings
         
         enum role: [:user, :admin]

         has_one_attached :avatar

  def avatar_thumbnail
    avatar.variant("150x150!").processed
  end

         
end
