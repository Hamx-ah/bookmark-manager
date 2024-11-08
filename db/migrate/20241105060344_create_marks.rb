class CreateMarks < ActiveRecord::Migration[7.2]
  def change
    create_table :marks do |t|
      t.string :name
      t.string :url
      t.string :category
      t.text :tags
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
