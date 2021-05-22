class Relationship < ApplicationRecord
    belongs_to :user
    belongs_to :corp
    has_one :room, dependent: :destroy

    validates :user_id, presence: true
    validates :corp_id, presence: true

end
