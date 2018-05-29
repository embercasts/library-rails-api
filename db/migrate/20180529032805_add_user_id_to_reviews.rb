class AddUserIdToReviews < ActiveRecord::Migration[5.1]
  def up
    remove_column :reviews, :user
    add_reference :reviews, :user, foreign_key: true
  end

  def down
    add_column :reviews, :user, :string
    remove_reference :reviews, :user, foreign_key: true
  end
end
