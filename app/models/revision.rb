# == Schema Information
#
# Table name: revisions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  user_id     :integer
#  document_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Revision < ActiveRecord::Base
  belongs_to :document
  belongs_to :user
end
