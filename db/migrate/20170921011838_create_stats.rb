class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
	t.integer :amtPaid, limit: 8, default: 0
	t.integer :amtDue, limit: 8, default: 0
	t.integer :total, limit: 8, default: 0
	t.timestamp :created_at
    end
  end
end
