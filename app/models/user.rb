class User < ApplicationRecord
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  has_many :active_user_notifications, class_name: "Notification", foreign_key: "visitor_user_id", dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  attachment :profile_image

  def self.search(search)
    if search
      User.where('area LIKE ?', "%#{search}%")
    else
      User.all
    end
  end

  enum area: {
    "---": 0,
    北海道: 1,  青森県: 2,  岩手県: 3,  宮城県: 4,  秋田県: 5,  山形県: 6,  福島県: 7,
    茨城県: 8,  栃木県: 9,  群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14,
    新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20,
    岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24,
    滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30,
    鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35,
    徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39,
    福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46,
    沖縄県: 47,
  }
  enum histories: {
    "登録なし": 0,
    １年: 1, ２年: 2, ３年: 3, ４年: 4, ５年: 5, ６年: 6, ７年: 7,
    ８年: 8, ９年: 9, １０年: 10, １１年: 11, １２年: 12, １３年: 13, １４年: 14,
    １５年: 15, １６年: 16, １７年: 17, １８年: 18, １９年: 19, ２０年: 20,
    ２１年: 21, ２２年: 22, ２３年: 23, ２４年: 24,
    ２５年: 25, ２６年: 26, ２７年: 27, ２８年: 28, ２９年: 29, ３０年: 30,
  }
end
