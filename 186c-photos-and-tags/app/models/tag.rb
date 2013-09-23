class Tag < ActiveRecord::Base
	has_and_belongs_to_many :photos, join_table: "photo_tags", class_name: "Photo", foreign_key: "photo_id", association_foreign_key: "tag_id"
end
