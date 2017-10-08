json.extract! shipment, :id, :value, :weight_kg, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)
