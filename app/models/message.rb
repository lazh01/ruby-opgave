class Message < ApplicationRecord
  #Messages are created by a user in a room, and contains text content. Each time one is created users in the same room are notified.
  belongs_to :user
  belongs_to :room
  after_create_commit { broadcast_append_to self.room }
end
