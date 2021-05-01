class Corp < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  # association
  has_many :relationships, dependent: :destroy
  has_many :corps_users, through: :relationships, source: :user
  has_many :messages, dependent: :destroy
  #通知機能！
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  # お気に入り解除ボタンのインスタンスメソッド
  def unfollow(user)
    @corp = Corp.find(current_corp.id)
    @favorite = Relationship.where(corp_id: @corp.id, user_id: user.id)
    @favorite.destroy
    redirect_back fallback_location: root_path, success: 'お気に入り登録解除しました'
  end
  #通知機能！
  def create_notification_follow!(current_corp, user)
    temp = Notification.where(["visitor_id = ? and visited_id = ?",current_corp.id, user.id])
    if temp.blank?
      notification = current_corp.active_notifications.new(visited_id: user.id)
      notification.save if notification.valid?
    end
  end
end
