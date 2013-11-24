module SubmissionResultsHelper
  def submission_result_status_format(status)
    if status == SubmissionResultStatus::BUILD_OK
      return "Build OK"
    elif status == SubmissionResultStatus::BUILD_FAILED
      return "Build failed"
    else
      return "Unknown status " + status.to_s
    end
  end
end
