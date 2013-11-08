json.array!(@problems) do |problem|
  json.extract! problem, :name, :description, :challenge_id
  json.url problem_url(problem, format: :json)
end
