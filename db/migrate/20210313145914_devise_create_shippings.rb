# frozen_string_literal: true

class DeviseCreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.references :order,          null: false, foreign_key: true
      t.string     :post_cord,      null: false
      t.integer    :prefecture_id,  null: false
      t.string     :city,           null: false
      t.string     :address,        null: false
      t.string     :building_name
      t.string     :tel_number,     null: false
      t.timestamps null: false
    end
  end
end