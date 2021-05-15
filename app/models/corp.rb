class Corp < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  attachment :profile_image
  # association
  has_many :relationships, dependent: :destroy
  has_many :corps_users, through: :relationships, source: :user
  has_many :messages, dependent: :destroy
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy

  enum area:{
    "---":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
  }

  # フォロー解除メソッド
  def unfollow(user)
    @corp = Corp.find(current_corp.id)
    @favorite = Relationship.where(corp_id: @corp.id, user_id: user.id)
    @favorite.destroy
    redirect_back fallback_location: root_path, success: 'お気に入り登録解除しました'
  end

  # 新規フォロー通知メソッド
  def create_notification_follow!(current_corp, user)
    temp = Notification.where(["visitor_id = ? and visited_id = ?",current_corp.id, user.id])
    if temp.blank?
      notification = current_corp.active_notifications.new(visited_id: user.id)
      notification.save if notification.valid?
    end
  end

end
