class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.text :input
      t.text :expected_output
      t.references :problem, index: true

      t.timestamps
    end
  end
end
