class Submission < ActiveRecord::Base
  has_one :language
  belongs_to :problem
  has_many :test_case_results
end
