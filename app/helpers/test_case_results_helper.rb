module TestCaseResultsHelper
  def format_status(status)
    if status == TestCaseResultStatus::PASSED
      return "passed"
    else
      return "failed"
    end
  end
  def format_failed_reason(status)
    if status ==  TestCaseResultStatus::FAILED_UNEXPECTED_OUTPUT
      return "the output was not the expected"
    elif status == TestCaseResultStatus::FAILED_TIMEOUT
      return "the solution ran for a time longer than expected"
    elif status == TestCaseResultStatus::FAILED_BUILD
      return "the build failed"
    end
  end
end
