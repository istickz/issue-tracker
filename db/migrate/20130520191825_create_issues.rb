class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :user
      t.string :body
      t.boolean :solved, default: false

      t.timestamps
    end
    add_index :issues, :user_id
  end
end
