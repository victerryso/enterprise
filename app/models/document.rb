# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Document < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :visuals
  has_many :revisions, :dependent => :destroy
  validates :title, :presence => true
end
