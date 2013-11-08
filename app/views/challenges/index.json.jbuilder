json.array!(@challenges) do |challenge|
  json.extract! challenge, :name
  json.url challenge_url(challenge, format: :json)
end
