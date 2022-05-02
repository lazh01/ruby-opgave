class Room < ApplicationRecord
    validates_uniqueness_of :title
    has_many :messages
    after_create_commit {broadcast_append_to "rooms"}
end
