class TestCaseResult < ActiveRecord::Base
  belongs_to :submission
  belongs_to :test_case
end
