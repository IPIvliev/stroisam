ActsAsTaggableOn::Tag.class_eval do
  extend FriendlyId
  friendly_id :name, :use => :slugged

	ActsAsTaggableOn.remove_unused_tags = true

end