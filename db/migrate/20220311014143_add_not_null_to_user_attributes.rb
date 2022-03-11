class AddNotNullToUserAttributes < ActiveRecord::Migration[6.0]
  def change

    change_column_null :users, :firstName, false
    change_column_null :users, :Surname, false
    change_column_null :users, :email, false

  end
end
