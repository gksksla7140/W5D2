# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title,  presence: true
  validates :subs , presence: {message: 'at least one sub'}


  has_many :post_subs, inverse_of: :post ,dependent: :destroy
  has_many :subs, through: :post_subs, source: :sub

  has_many :comments, inverse_of: :post


  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User,
  inverse_of: :posts



end
