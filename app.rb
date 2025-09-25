require "sinatra"
require "json"

# In-memory store (like a fake DB)
items = []
id_counter = 1

# Home
get "/" do
  "Welcome to Ruby CRUD API!"
end

# CREATE
post "/items" do
  data = JSON.parse(request.body.read)
  item = { id: id_counter, name: data["name"], description: data["description"] }
  items << item
  id_counter += 1
  item.to_json
end

# READ ALL
get "/items" do
  items.to_json
end

# READ ONE
get "/items/:id" do
  item = items.find { |i| i[:id] == params[:id].to_i }
  halt 404, { error: "Not Found" }.to_json unless item
  item.to_json
end

# UPDATE
put "/items/:id" do
  item = items.find { |i| i[:id] == params[:id].to_i }
  halt 404, { error: "Not Found" }.to_json unless item

  data = JSON.parse(request.body.read)
  item[:name] = data["name"] if data["name"]
  item[:description] = data["description"] if data["description"]
  item.to_json
end

# DELETE
delete "/items/:id" do
  item = items.find { |i| i[:id] == params[:id].to_i }
  halt 404, { error: "Not Found" }.to_json unless item
  items.delete(item)
  { message: "Deleted" }.to_json
end
