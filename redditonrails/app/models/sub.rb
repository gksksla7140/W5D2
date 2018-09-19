# == Schema Information
#
# Table name: subs
#
#  id           :bigint(8)        not null, primary key
#  moderator_id :integer          not null
#  name         :string           not null
#  description  :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, uniqueness: true

  has_many :post_subs, inverse_of: :sub , dependent: :destroy
  has_many :posts, through: :post_subs, source: :post

  belongs_to :moderator,
  foreign_key: :moderator_id,
  class_name: :User,
  inverse_of: :subs

end
