class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.datetime :start_date
      t.references :user, null: false, foreign_key: true
      t.boolean :deletable
      t.boolean :editable
      t.string :category
      t.datetime :end_date
      t.boolean :recurring
      t.boolean :completed
      t.text :details

      t.timestamps
    end
  end
end
