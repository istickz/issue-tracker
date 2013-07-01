class AddAssignedToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :assigned, :string
  end
end
