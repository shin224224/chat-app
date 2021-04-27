class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image 
  varidates :content, presence: true, unless: :was_atacched?

  def was_attached?
    self.image.was_atacched?
  end

end
