class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet

  validates_presence_of :body
  validates_associated :user, :snippet
end
