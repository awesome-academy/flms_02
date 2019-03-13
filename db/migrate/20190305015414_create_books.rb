class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :category, foreign_key: true
      t.references :publisher, foreign_key: true
      t.string :name
      t.text :content
      t.integer :num_of_pages
      t.integer :year
      t.integer :quantity
      t.integer :price
      t.string :image
      t.float :avg_rating, default: 0
      t.timestamps
    end
  end
end
