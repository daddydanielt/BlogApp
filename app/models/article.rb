class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  default_scope { order(created_at: :desc) }

  belongs_to :author, class_name: "User", foreign_key: "user_id"
end
