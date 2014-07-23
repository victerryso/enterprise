# == Schema Information
#
# Table name: visuals
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  document_id :integer
#

class Visual < ActiveRecord::Base
  belongs_to :document
  mount_uploader :image, ImageUploader
end
