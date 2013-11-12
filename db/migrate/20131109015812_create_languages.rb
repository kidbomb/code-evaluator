class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :build_command
      t.string :execute_command
      t.timestamps
    end
  end
end
