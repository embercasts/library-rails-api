class BookResource < BelongsToUserResource
  attributes :title, :isbn, :publish_date, :username
  has_one :author
  has_many :reviews

  filters :query

  def self.apply_filter(records, filter, value, options)
    case filter
      when :query
        records.where('title LIKE ?', "%#{value.first}%")
          .or(records.where('isbn LIKE ?', "%#{value.first}%"))
      else
        super
    end
  end
end
