json.array!(@participants) do |participant|
  json.extract! participant, :id, :name, :phone, :email, :address, :key, :products, :extra, :cpu, :ip
  json.url participant_url(participant, format: :json)
end
