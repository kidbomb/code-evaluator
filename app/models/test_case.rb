class TestCase < ActiveRecord::Base
  belongs_to :problem
  has_many :test_case_results
end
