class AddAddressToStats < ActiveRecord::Migration[5.1]
  def up
    add_column :stats, :address, :string
    Stat.update_all address: "48w5LQHbxU5aN1rS5QJ3Fne4DLUDVUY9hLSqzagys15WW8GcjMDhct84WhGeh7ePZ992RB6CVLjJShobQxFxdKt2RsQ9YjC"
  end
end
