class Relationship < ApplicationRecord
    belongs_to :user
    belongs_to :corp

    validates :user_id, presence: true
    validates :corp_id, presence: true
end
