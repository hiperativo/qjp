class Author < ActiveRecord::Base
  attr_accessible :bio, :birthday, :name, :twitter, :email
  has_many :artigos
end
