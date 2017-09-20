class AddStateAndContentToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :state, :boolean, default: :false
    add_column :tasks, :target, :text, default: "New task..."
  end
end
