class Company < ActiveRecord::Base
	has_many :employees, class_name: "Employee", foreign_key: "company_id"
end
