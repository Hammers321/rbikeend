class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity
      t.date :day_rental
      t.datetime :booked_start_date_time
      t.datetime :booked_end_date_time

      t.timestamps null: false
    end
  end
end
