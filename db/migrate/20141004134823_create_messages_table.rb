class CreateMessagesTable < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :ranking
      t.integer :board_id
      t.timestamps
    end
  end
end
