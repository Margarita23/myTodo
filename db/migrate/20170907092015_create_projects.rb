class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.date :end_date

      t.timestamps
    end
  end
end
