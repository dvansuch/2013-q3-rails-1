class BlogPost < ActiveRecord::Base
  validates :written_at,  presence: true
  validates :body,        presence: true
  validates :author_id, presence: true
end
