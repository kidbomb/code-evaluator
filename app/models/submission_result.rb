class SubmissionResult < ActiveRecord::Base
  belongs_to :submission
  has_many :test_case_results
end
