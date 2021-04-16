class Corp < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # association
  has_many :relationships, dependent: :destroy
  has_many :corps_users, through: :relationships, source: :user
  # お気に入り解除ボタンのインスタンスメソッド
  def unfollow(user)
    @corp = Corp.find(current_corp.id)
    @favorite = Relationship.where(corp_id: @corp.id, user_id: user.id)
    @favorite.destroy
    redirect_back fallback_location: root_path, success: 'お気に入り登録解除しました'
  end
end
