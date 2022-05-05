class User < ApplicationRecord
    validates_uniqueness_of :username
    validates_uniqueness_of :email
    has_secure_password
    has_many :messages
    #currently variants cause the server to crash, so the avatars arew resized at the client.
    has_one_attached :avatar do |attachable|
        attachable.variant :thumb, resize_to_limit: [10, 10]
    end
end
