class Article < ActiveRecord::Base

	mount_uploader :image, ImageUploader

	belongs_to :category
	has_many :comments
	belongs_to :user

	extend FriendlyId
	friendly_id :name, use: :slugged

	def previous
		Article.where('id < ?', self.id).first
	end

	def next
		Article.where('id > ?', self.id).first
	end
end
