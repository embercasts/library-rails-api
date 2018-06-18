class ReviewResource < BelongsToUserResource
  attributes :body, :created_at, :username
  has_one :book
end
