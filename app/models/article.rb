class Article < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	acts_as_taggable

	mount_uploader :image, ImageUploader

	belongs_to :category
	has_many :comments
	belongs_to :user

end
