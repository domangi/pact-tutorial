class Article < ApplicationRecord
  validates :title, :user_id, presence: true

  def user
    Remote::User.find(user_id)
  end
end
