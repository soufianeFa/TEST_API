json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :subject, :user
end
