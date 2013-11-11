class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.string :short_description
      t.text :long_description
      t.references :challenge, index: true

      t.timestamps
    end
  end
end
