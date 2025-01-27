class CreateToDos < ActiveRecord::Migration[7.2]
  def change
    create_table :to_dos do |t|
      t.text :description
      t.boolean :is_done
      t.references :to_do_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
