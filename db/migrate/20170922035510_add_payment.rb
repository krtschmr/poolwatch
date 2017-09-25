class AddPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :payment, :integer, limit: 8
  end
end
