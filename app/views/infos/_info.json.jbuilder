json.extract! info, :id, :orderNo, :firmName, :billNo, :amount, :location, :created_at, :updated_at
json.url info_url(info, format: :json)
