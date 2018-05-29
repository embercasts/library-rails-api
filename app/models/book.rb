class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user
  has_many :reviews
end
