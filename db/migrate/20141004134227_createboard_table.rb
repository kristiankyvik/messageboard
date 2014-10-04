class CreateboardTable < ActiveRecord::Migration
  def change
    create_table(:boards) do |t|
      t.string :title
      t.string :topic
      t.integer :user_id
      t.timestamps
    end
  end
end
