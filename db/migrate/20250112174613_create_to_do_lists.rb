class CreateToDoLists < ActiveRecord::Migration[7.2]
  def change
    create_table :to_do_lists do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
