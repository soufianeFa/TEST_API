json.array!(@participations) do |participation|
  json.extract! participation, :id
end