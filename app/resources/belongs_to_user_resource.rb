class BelongsToUserResource < JSONAPI::Resource
  abstract

  before_update :authorize_edit
  before_remove :authorize_edit

  def authorize_edit
    raise ForbiddenError if @model.user_id != context[:current_user].id
  end

  before_save do
    @model.user_id = context[:current_user].id if @model.new_record?
  end

  def username
    @model.user.username
  end

  def self.records(options = {})
    super.includes(:user)
  end
end
