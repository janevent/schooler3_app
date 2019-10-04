class User < ApplicationRecord
    has_secure_password
    has_many :students
    has_many :meetings
    
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :email, confirmation: true
    validates :email_confirmation, presence: true

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
      end

    
end
