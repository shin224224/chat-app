class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user 
  varidates :content, presence: true
end
