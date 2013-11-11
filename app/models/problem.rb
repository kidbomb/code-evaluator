class Problem < ActiveRecord::Base
  validates :name, :presence => true
  validates :short_description, :presence => true
  validates :long_description, :presence => true
  belongs_to :challenge
  has_many :test_cases
  has_many :submissions
end
