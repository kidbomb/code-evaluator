class SubmissionResult < ActiveRecord::Base
  belongs_to :submission
  has_many :test_case_results
  has_one :problem, :through =>:submission
end
