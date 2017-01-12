class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  default_scope { order(created_at: :desc) }


  def commenter_email
    user ? user.email : ""
  end
end
