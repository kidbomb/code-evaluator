json.array!(@test_case_results) do |test_case_result|
  json.extract! test_case_result, :status, :submission_id
  json.url test_case_result_url(test_case_result, format: :json)
end
