class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable

  has_many :comments
  has_many :snippets
end
