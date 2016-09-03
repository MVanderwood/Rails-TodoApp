class CreateTdTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :td_tasks do |t|
      t.string :description
      t.boolean :completed
      t.integer :priority

      t.timestamps
    end
  end
end
