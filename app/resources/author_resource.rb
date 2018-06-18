class AuthorResource < BelongsToUserResource
  attributes :first, :last, :username
  has_many :books

  filters :query

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
