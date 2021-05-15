class Notification < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :message, optional: true
  # セールス側通知アソシエーション
  belongs_to :visited, class_name: "User", foreign_key: "visited_id", optional: true
  belongs_to :visitor, class_name: "Corp", foreign_key: "visitor_id", optional: true
  # ドクター側通知アソシエーション
  belongs_to :visitor_user, class_name: "User", foreign_key: "visitor_user_id", optional: true
  belongs_to :visited_corp, class_name: "Corp", foreign_key: "visited_corp_id", optional: true
end
