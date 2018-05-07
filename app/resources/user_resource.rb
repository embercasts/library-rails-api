class UserResource < JSONAPI::Resource
  attributes :email, :username, :password, :password_confirmation

  def fetchable_fields
    super - [:password, :password_confirmation]
  end
end
