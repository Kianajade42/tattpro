kiana = User.create!(username: "kiana", password_digest: "password")

kiana.tattoos.create!(name: "flower", client: "Zoey", placement: "wrist", description: "black rose outline")

puts "data loaded success"