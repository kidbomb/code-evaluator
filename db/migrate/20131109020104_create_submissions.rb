class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :code
      t.references :language
      t.references :problem
      t.timestamps
    end
  end
end
