class AddColumnNameToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :date_due, :datetime
  end
end
