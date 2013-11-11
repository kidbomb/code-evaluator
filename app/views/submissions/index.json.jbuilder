json.array!(@problem_tries) do |submission|
  json.extract! submission, :code
  json.url submission_url(submission, format: :json)
end
