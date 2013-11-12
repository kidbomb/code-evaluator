class Submission < ActiveRecord::Base
  has_one :language
  belongs_to :problem
  has_many :test_case_results
  has_many :total_passed,-> { where status:TestcaseResultStatus::PASSED }, :class_name => 'TestCaseResult'
end
