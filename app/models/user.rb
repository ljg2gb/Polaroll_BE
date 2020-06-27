class User < ApplicationRecord
    has_many :photos
    has_secure_password
    validates :email, presence: true, uniqueness: true
end
