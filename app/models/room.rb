class Room < ApplicationRecord
    #Rooms have a title, and messages are posted to the room. When a new room is created users looking at the room list have it added to the list.
    validates_uniqueness_of :title
    has_many :messages
    after_create_commit {broadcast_append_to "rooms"}
end
