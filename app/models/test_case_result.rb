class TestCaseResult < ActiveRecord::Base
  belongs_to :submission_result
  belongs_to :test_case
end
