class CellPhone < ActiveRecord::Base
	has_one :person, class_name: "Person"
end
