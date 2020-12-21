class User < ActiveRecord::Base #ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable#,
         #:lockable

  has_many :lists, dependent: :destroy
  has_many :items
  has_many :prices
end