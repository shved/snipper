class Snippet < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :body
  validates_associated :user
end
