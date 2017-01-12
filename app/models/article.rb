class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  default_scope { order(created_at: :desc) }

  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :comments, dependent: :destroy do
    def persisted
      #--->
      #collect {|comment| comment if comment.persisted? }
      #--->
      #select(&:persisted?)
      #--->
      ids = collect {|comment| comment.id if comment.persisted? }
      Comment.where(id: ids)
      #--->
    end
  end

  def latest_comment(reload=false)
    if reload
      @latest_comment = reload.comments.persisted.last
    else
      @latest_comment ||= comments.persisted.last
    end
  end


end
