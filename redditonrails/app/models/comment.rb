# == Schema Information
#
# Table name: comments
#
#  id                :bigint(8)        not null, primary key
#  body              :text             not null
#  parent_comment_id :integer
#  post_id           :integer          not null
#  user_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :post, inverse_of: :comments

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User,
  inverse_of: :comments

  has_many :child_comments,
  class_name: :Comment,
  foreign_key: :parent_comment_id

  belongs_to :parent_comment,
  class_name: :Comment,
  foreign_key: :parent_comment_id,
  optional: true


  private
  def ensure_post_id
    self.post_id ||= self.parent_comment.post_id if parent_comment

  end

  end



end
