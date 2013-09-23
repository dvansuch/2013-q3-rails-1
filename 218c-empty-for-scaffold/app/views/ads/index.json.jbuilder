json.array!(@ads) do |ad|
  json.extract! ad, :company_name
  json.url ad_url(ad, format: :json)
end
