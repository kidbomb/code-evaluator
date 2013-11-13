class CreateTestCaseResults < ActiveRecord::Migration
  def change
    create_table :test_case_results do |t|
      t.integer :status
      t.references :test_case
      t.references :submission_result, index: true

      t.timestamps
    end
  end
end
