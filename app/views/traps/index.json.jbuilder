json.array!(@traps) do |employee|
  json.cache! employee do
    json.extract! employee, :id
  end
end