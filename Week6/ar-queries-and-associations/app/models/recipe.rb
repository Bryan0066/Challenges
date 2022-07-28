class Recipe < ActiveRecord::Base
  has_many :comments, class_name: "comment", foreign_key: "comment_id"
end