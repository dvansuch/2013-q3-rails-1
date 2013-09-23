class Photo < ActiveRecord::Base
	has_and_belong_to_many :tags, join_table: "photo_tags", class_name: "Tag", foreign_key: "photo_id", assocation_foreign_key: "tag_id"
end
