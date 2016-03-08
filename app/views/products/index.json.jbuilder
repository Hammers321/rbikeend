json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :image, :description, :brand
  json.url product_url(product, format: :json)
end
