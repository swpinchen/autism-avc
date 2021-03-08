class AddLastOpenedToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :last_opened, :datetime
  end
end
