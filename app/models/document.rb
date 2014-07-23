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
#  pagenumber :integer
#

#
# Table name: documents
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  pagenumber :integer
#

class Document < ActiveRecord::Base
  belongs_to :user
  has_many :revisions, :dependent => :destroy
  
  validates :title, :presence => true
  validates :pagenumber, :presence => true

  has_many :visuals
  accepts_nested_attributes_for :visuals, :reject_if => :all_blank, :allow_destroy =>true
end
