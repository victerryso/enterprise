# == Schema Information
#
# Table name: visuals
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Visual < ActiveRecord::Base
  belongs_to :documents
  mount_uploader :image, ImageUploader
end
