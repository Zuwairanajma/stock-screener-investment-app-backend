class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url
      t.integer :author_id

      t.timestamps
    end
  end
end
