class RenameSurnameToSurname < ActiveRecord::Migration[6.0]
  def change

    rename_column :users, :Surname, :surname

  end
end
