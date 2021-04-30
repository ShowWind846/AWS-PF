class Room < ApplicationRecord

  belongs_to :relationship

  # 一つの関係性につき１つのルームであるから、ユニークである。
  validates :relationship_id, uniqueness: true

end
