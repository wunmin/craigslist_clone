class Post < ActiveRecord::Base
  belongs_to :category
  validates :title, presence: true
  validates :email, presence: true, format: { with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :price, presence: true
  validates :description, presence: true
end