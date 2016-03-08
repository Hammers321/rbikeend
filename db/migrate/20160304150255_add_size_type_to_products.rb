class AddSizeTypeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :size_type, :string
  end
end
