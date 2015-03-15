class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.text :url

      t.timestamps null: false
    end
  end
end
