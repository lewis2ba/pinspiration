class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :tag
      t.references :pin
      t.timestamps null: false
    end
  end
end
