class Wallpost < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
end