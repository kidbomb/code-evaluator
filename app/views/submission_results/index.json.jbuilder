json.array!(@submission_results) do |submission_result|
  json.extract! submission_result, 
  json.url submission_result_url(submission_result, format: :json)
end
