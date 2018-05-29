class AuthorResource < JSONAPI::Resource
  attributes :first, :last, :username
  has_many :books

  filters :query

  before_save do
    @model.user_id = context[:current_user].id if @model.new_record?
  end

  def username
    @model.user.username
  end

  def self.records(options = {})
    super.includes(:user)
  end

  def self.apply_filter(records, filter, value, options)
    case filter
      when :query
        records.where('last LIKE ?', "%#{value.first}%")
          .or(records.where('first LIKE ?', "%#{value.first}%"))
      else
        super
    end
  end
end
