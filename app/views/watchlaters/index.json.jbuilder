json.array!(@watchlaters) do |watchlater|
  json.extract! watchlater, :id
  json.url watchlater_url(watchlater, format: :json)
end
