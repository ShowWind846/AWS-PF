class Room < ApplicationRecord

  belongs_to :relationship
  has_many :notifications, dependent: :destroy

  # 一つの関係性につき１つのルームであるから、ユニークである。
  validates :relationship_id, uniqueness: true

  # 新着メッセージ通知メソッド
  def create_notification_message!(current_corp, message_id)
    save_notification_message!(current_corp, message_id, self.relationship.user_id)
  end

  def save_notification_message!(current_corp, message_id, visited_id)
    @notification = current_corp.active_notifications.new(
      room_id: id,
      message_id: message_id,
      visited_id: visited_id,
      action: "message"
      )
    @notification.save
  end

  def user_create_notification_message!(current_user, message_id)
    user_save_notification_message!(current_user, message_id, self.relationship.corp_id)
  end

  def user_save_notification_message!(current_user, message_id, visited_corp_id)
    @notification = current_user.active_user_notifications.new(
      room_id: id,
      message_id: message_id,
      visited_corp_id: visited_corp_id,
      action: "message"
      )
    @notification.save
  end
end
