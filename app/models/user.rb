class User < ApplicationRecord
    validates_uniqueness_of :username
    validates_uniqueness_of :email
    has_secure_password
    has_many :messages
    has_one_attached :avatar do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end
end
