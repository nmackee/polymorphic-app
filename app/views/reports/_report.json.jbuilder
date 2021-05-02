json.extract! report, :id, :body, :created_at, :updated_at
json.url report_url(report, format: :json)
