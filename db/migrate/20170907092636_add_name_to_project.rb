class AddNameToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :name, :string, default: "New project..."
  end
end
