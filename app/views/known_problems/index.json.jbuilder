json.array!(@known_problems) do |known_problem|
  json.extract! known_problem, :id
  json.url known_problem_url(known_problem, format: :json)
end
