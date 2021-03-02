class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_reference :users, :parent, null: false, foreign_key: { to_table: :users }
    add_column :users, :roles, :integer
    add_column :users, :theme, :string
    add_column :users, :username, :string
    add_column :users, :birthday, :date

    # validates :username, uniqueness: true
  end
end
