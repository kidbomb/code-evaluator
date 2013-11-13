class CreateSubmissionResults < ActiveRecord::Migration
  def change
    create_table :submission_results do |t|
      t.string :details
      t.references :submission
      t.timestamps
    end
  end
end
