class Article < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	mount_uploader :image, ImageUploader

	belongs_to :category
	has_many :comments
	belongs_to :user
end
