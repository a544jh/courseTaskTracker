json.array!(@task_sets) do |task_set|
  json.extract! task_set, :id, :course_id, :name
  json.url task_set_url(task_set, format: :json)
end
