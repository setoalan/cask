class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.datetime :request_date_time
      t.text :message
      t.integer :user_id
      t.integer :brewery_id

      t.timestamps null: false
    end
  end
end
