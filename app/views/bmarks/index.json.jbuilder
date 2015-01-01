json.array!(@bmarks) do |bmark|
  json.extract! bmark, :id, :name, :description, :track_id, :stage_id
  json.url bmark_url(bmark, format: :json)
end
