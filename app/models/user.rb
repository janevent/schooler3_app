class User < ApplicationRecord
    has_many :students
    has_many :meetings, through: :students
    has_secure_password
    #validates :name, presence: true
    #validates :email, confirmation: true
    #validates :email_confirmation, presence: true

    
end
