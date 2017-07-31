class Post < ApplicationRecord
	acts_as_votable
	mount_uploader :image, ImageUploader
	
	belongs_to :user
	has_many :comments, :dependent => :delete_all

  
end
