json.array!(@messages) do |message|
  json.extract! message, :id, :user, :conversation, :content
end