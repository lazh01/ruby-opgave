class User < ApplicationRecord
    #Users have a username, email, password, can have an avatar and can post messages. Each username or email can only be used by one user.
    validates_uniqueness_of :username
    validates_uniqueness_of :email
    has_secure_password
    has_many :messages
    #currently variants cause the server to crash, so the avatars are resized at the client.
    has_one_attached :avatar do |attachable|
        attachable.variant :thumb, resize_to_limit: [10, 10]
    end
end
