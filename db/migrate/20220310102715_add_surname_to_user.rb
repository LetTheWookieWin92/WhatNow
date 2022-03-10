class AddSurnameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Surname, :string
  end
end
