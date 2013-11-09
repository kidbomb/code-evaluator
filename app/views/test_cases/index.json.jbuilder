json.array!(@test_cases) do |test_case|
  json.extract! test_case, :input, :expected_output, :problem_id
  json.url test_case_url(test_case, format: :json)
end
