class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :site, index: true
      t.text :response_body

      t.timestamps null: false
    end
    add_foreign_key :results, :sites
  end
end
