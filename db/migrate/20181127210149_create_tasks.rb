class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :t_name
      t.string :description
      t.integer :t_priority
      t.belongs_to :list, foreign_key: true

      t.timestamps
    end
  end
end
