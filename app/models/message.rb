class Message < ApplicationRecord

  belongs_to :room
  belongs_to :user, optional: true
  belongs_to :corp, optional: true

  validates :message, presence: true


end
