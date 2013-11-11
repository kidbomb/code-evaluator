class TestCaseResultStatus < ActiveRecord::Base
  PASSED = 0
  FAILED_BUILD = 1
  FAILED_UNEXPECTED_OUTPUT = 2
  FAILED_TIMEOUT = 3
end
