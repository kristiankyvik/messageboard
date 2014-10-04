class CreateMessagesTable < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :ranking, default: 0, null: false
      t.integer :board_id
      t.timestamps
    end
  end
end
