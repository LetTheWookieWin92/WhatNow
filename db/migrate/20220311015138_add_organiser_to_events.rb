class AddOrganiserToEvents < ActiveRecord::Migration[6.0]
  def change

    add_reference :events, :organiser, null: false
    add_foreign_key :events, :users, column: :organiser_id

  end
end
