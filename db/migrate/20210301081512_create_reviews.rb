class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.datetime :date
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
