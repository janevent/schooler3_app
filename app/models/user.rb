class User < ApplicationRecord
    has_secure_password
    has_many :students
    has_many :meetings, through: :students
    
    validates :name, presence: true
    validates :name, uniqueness: true
    #validates :email, confirmation: true
    #validates :email_confirmation, presence: true

    
end
