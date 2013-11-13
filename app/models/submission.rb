class Submission < ActiveRecord::Base
  has_one :language
  belongs_to :problem
  has_one :submission_result
  has_many :total_passed,-> { where status:TestcaseResultStatus::PASSED }, :class_name => 'TestCaseResult'
end
