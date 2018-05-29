class ReviewResource < JSONAPI::Resource
  attributes :body, :created_at, :username
  has_one :book

  def username
    @model.user.username
  end

  def self.records(options = {})
    super.includes(:user)
  end

  before_save do
    @model.user_id = context[:current_user].id if @model.new_record?
  end
end
