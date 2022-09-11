class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, -> { order(created_at: :desc)}, dependent: :destroy

  # ここに追加
  accepts_nested_attributes_for :photos

  def liked_by(current_user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end