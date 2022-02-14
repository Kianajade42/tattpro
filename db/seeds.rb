kiana = User.create!(username: "Kiana", password: "kiana")
zoey = User.create!(username: "Zoey", password: "zoey")
kiana.tattoos.create!(name: "flower", client: "Liz", placement: "wrist", description: "black rose outline")
zoey.tattoos.create!(name: "star", client: "Tara", placement: "foot", description: "geometric color block")
puts "success"