class ChangeParentIdInUser < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :parent_id, true
  end
end
