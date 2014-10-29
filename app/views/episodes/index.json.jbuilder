json.array!(@episodes) do |episode|
  json.extract! episode, :id, :name, :description, :notes, :published_at, :seconds
  json.url episode_url(episode, format: :json)
end
