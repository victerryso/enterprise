# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  firstname       :string(255)
#  lastname        :string(255)
#  company         :string(255)
#  title           :string(255)
#  email           :string(255)
#  mobile          :string(255)
#  is_admin        :boolean          default(FALSE)
#  avatar          :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :documents
  validates :username, :presence => true, :length => { :minimum => 3 }
end
