# == Schema Information
#
# Table name: user_votes
#
#  id           :bigint(8)        not null, primary key
#  user_id      :integer          not null
#  value        :integer          not null
#  votable_id   :integer          not null
#  votable_type :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class UserVoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
