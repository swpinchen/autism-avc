class ChangeColumnDefaultInItems < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:items, :deletable, from: nil, to: false)
    change_column_default(:items, :editable, from: nil, to: false)
    change_column_default(:items, :recurring, from: nil, to: false)
    change_column_default(:items, :completed, from: nil, to: false)
  end
end
