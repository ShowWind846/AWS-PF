class Message < ApplicationRecord

  belongs_to :room, optional: true
  belongs_to :user, optional: true
  belongs_to :corp, optional: true
  has_many :notifications, dependent: :destroy

  validates :message, presence: true

end
