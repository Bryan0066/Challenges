class User < ActiveRecord::Base
  validates_presence_of :full_name

  has_many :assignments
  has_many :projects, through: :assignments
end